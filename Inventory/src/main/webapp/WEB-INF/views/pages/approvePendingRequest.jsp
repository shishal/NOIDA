<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 2%; padding-top: 2%">Pending Requests</h3>
	</div>
</div>
<div class="table-responsive">
<table class="table table-bordered" id="requestTable">
	<thead class="thead-inverse table-header" style="">
		<tr>
			<th>Request Id</th>
			<th>Asset Type</th>
			<th>Asset Sub Type</th>
			<th>Quantity</th>
			<th>Raised By</th>
			<th>Request Date</th>
			<th>Status</th>
			<th>Action</th>
			<th></th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th>Request Id</th>
			<th>Asset Type</th>
			<th>Asset Sub Type</th>
			<th>Quantity</th>
			<th>Raised By</th>
			<th>Request Date</th>
			<th>Status</th>
			<th>Action</th>
			<th></th>
		</tr>
	</tfoot>
	<tbody>
	<c:forEach items="${requestList}" var="request" varStatus="row">
		<tr>
			<td>${request.id}</td>
			<td>${request.assetMainType.mainType}</td>
			<td>${request.assetSubType.subType}</td>
			<td>${request.assetQuantity}</td>
			<td>
				<a onmouseover="showUserDetails(this, '${request.requester.username}');">
						<span id="requester_${request.id}">${request.requester.username}</span>
				</a>
			</td>
			<%-- <td>${request.requester.username}</td> --%>
			<td><fmt:formatDate type="date"  value="${request.createdTime}" pattern="dd-MM-yyyy" /></td>
			<td>${request.status}</td>
			<td><button type="button" class="btn btn-primary approveRejectBtn" data-toggle="modal" data-target="#actionPopOver">Approve /Reject</button></td>
			<td>${request.assetSubType.id}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<div class="modal fade" id="actionPopOver" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Action</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">
				<form role="form" id="approvalForm">
					<div class="form-group">
						<label for="assetTypeToBeApproved">Asset Type:</label>
						<span id="assetTypeToBeApproved"></span>
					</div>
					<div class="form-group">
						<label for="assetSubTypeToBeApproved">Asset SubType:</label>
						<span id="assetSubTypeToBeApproved"></span>
					</div>
					<div class="form-group">
						<label for="requestedQty">Requested Quantity:</label>
						<span id="requestedQty"></span>
					</div>
					<div class="form-group">
						<label for="availableQty">Available Quantity:</label> 
						<span id="availableQty"></span>
					</div>
					<div class="form-group">
						<label for="approvedQty">Approved Quantity</label> 
						<input type="number" id="approvedQty" name="approvedQty" class="form-control" placeholder="Approved Quantity"/>
					</div>
					<div class="form-group">
						<label for="remark">Enter Remarks</label> 
						<input type="text" class="form-control" name="remark" id="remark" placeholder="Remarks" />
					</div>
					<input type="hidden" name="requestNumber" id="requestNumber"/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>

				<button id="approveBtn" type="button" class="btn btn-primary">Approve</button>
				<button id="rejectBtn" type="button" class="btn btn-primary">Reject</button>
				<button id="closeBtn" type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				<div id="errorMessage" class="alert alert-danger" style="display: none;"></div>
				<div id="successMessage" class="alert alert-success" style="display: none;"></div>
			</div>

		</div>
	</div>
</div>
<script>
	//When the document is ready
var userDetailList;
$(function() {
	userDetailList = new Object();
	<c:forEach items="${userList}" var="user">
	var userDetail =[];
	userDetail.push("${user.username}");
	userDetail.push("${user.firstName}");
	userDetail.push("${user.lastName}");
	userDetail.push("${user.empCode}");
	userDetail.push("${user.department.name}");
	userDetail.push("${user.contactNo}");
	userDetailList["${user.username}"] = userDetail; 
	</c:forEach>
	
	var selectedRow = 0;
	var export_filename = 'PendingRequest';
	var table = $('#requestTable').DataTable({
		dom : '<"top"B>rft<"bottom"lp><"clear">',
		buttons : [
			{
				text : '',
				extend : 'excel',
				className : 'hidden-xs showopacity glyphicon glyphicon-export',
				title : export_filename,
				extension : '.xls'
			},
			{
				text : '',
				extend : 'print',
				className : 'hidden-xs showopacity glyphicon glyphicon-print'
			} 
		],
		columnDefs: [
			{ "targets": [ 8 ], "visible": false, "searchable": false },
		]
	});
	$('#requestTable tfoot th').each(function(index) {
		if(index==0) return;
		var title = $(this).text();
		$(this).html('<input type="text" style="width:100%" placeholder="Search '+title+'" />');
	});
	// Apply the search
	enableSearch(table)
	
	$('#actionPopOver').on('hidden.bs.modal', function(e) {
		resetModalAlerts();
		reloadPendingRequestPage();
	});
	$(document).on('click', '.approveRejectBtn', function() {
		var selectedRow = table.row( $(this).parent().parent() ).data();
		var requestedNumber = selectedRow[0]
		var requestedQty = selectedRow[3]
		var assetSubTypeId = selectedRow[8]
		$('#assetTypeToBeApproved').text(selectedRow[1]);
		$('#assetSubTypeToBeApproved').text(selectedRow[2]);
		$('#requestedQty').text(requestedQty);
		$('#requestNumber').val(requestedNumber)
		$('#assetSubTypeId').val(assetSubTypeId)
		 $.ajax({
			type : "POST",
			url : "getAssetAvailability",
			data : {assetSubTypeId:assetSubTypeId,${_csrf.parameterName}:'${_csrf.token}'},
			success : function(data) {
				if (data.status == 1) {
					$('#availableQty').text(data.availableQty);
				} else if (data.status == 0) {
					showErrorMessage('errorMessage',data.message);//code to show error
				} else {
					showErrorMessage('errorMessage','Unknow error');
				}
			}//success end
		});//ajax end 
	});
	$('#approveBtn').click(function(e) {
		var _this = this
		$('#rejectBtn').prop('disabled',true);
		$('#approveBtn').prop('disabled',true);
		$.blockUI({baseZ: 2000});
		resetModalAlerts();
		var approvedQty = $('#approvedQty').val();
		var availableQty = $('#availableQty').text();
		console.log(availableQty+' '+approvedQty)
		if(parseInt(availableQty) < parseInt(approvedQty)){
			showErrorMessage('errorMessage','<spring:message code="request.approve.alert" />');
			$('#rejectBtn').prop('disabled',false);
			$('#approveBtn').prop('disabled',false);
			$.unblockUI();
			return false;
		}
		if(parseInt(availableQty) <= 0){
			showErrorMessage('errorMessage','<spring:message code="request.approve.alert.inventory.out" />');
			$('#rejectBtn').prop('disabled',false);
			$('#approveBtn').prop('disabled',false);
			$.unblockUI();
			return false;
		}
		 $.ajax({
			type : "POST",
			url : "approveRequest",
			data : $("#approvalForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('successMessage','<spring:message code="request.approve.success" />');
				}else {
					showErrorMessage('errorMessage','Unknow error');
					$('#rejectBtn').prop('disabled',false);
					$('#approveBtn').prop('disabled',false);
				}
				$.unblockUI();
			}//success end
		});//ajax end 
	});
	$('#rejectBtn').click(function(e) {
		$.blockUI({baseZ: 2000});
		resetModalAlerts();
		var _this = this
		$('#rejectBtn').prop('disabled',true);
		$('#approveBtn').prop('disabled',true);
		 $.ajax({
			type : "POST",
			url : "rejectRequest",
			data : $("#approvalForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('successMessage','<spring:message code="request.reject.success" />');
				}else {
					showErrorMessage('errorMessage','Unknow error');
					$('#rejectBtn').prop('disabled',false);
					$('#approveBtn').prop('disabled',false);
				}
				$.unblockUI();
			}//success end
		});//ajax end 
	});
});
function resetModalAlerts() {
	$('#successMessage').hide();
	$('#errorMessage').hide();
}
function reloadPendingRequestPage() {
	document.getElementById('pendingRequestMenuLink').click();
}
</script>
