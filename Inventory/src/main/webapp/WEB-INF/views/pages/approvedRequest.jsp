<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 2%; padding-top: 2%">Approved Requests</h3>
	</div>
</div>
<div class="table-responsive">
<table class="table table-bordered" id="requestTable">
	<thead class="thead-inverse table-header" style="">
		<tr>
			<th>Request Number</th>
			<th>Asset Type</th>
			<th>Asset Sub Type</th>
			<th>Quantity</th>
			<th>Raised By</th>
			<th>Status</th>
			<th>Action</th>
			<th></th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th>Request Number</th>
			<th>Asset Type</th>
			<th>Asset Sub Type</th>
			<th>Quantity</th>
			<th>Raised By</th>
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
			<td>${request.status}</td>
			<td><button type="button" class="btn btn-primary issueBtn" data-toggle="modal" data-target="#actionIssuerPopOver">Issue</button></td>
			<td>${request.assetSubType.id}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<div class="modal fade" id="actionIssuerPopOver" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Action</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">
				<form role="form" id="issueForm" data-toggle="validator">
					<div class="form-group">
						<label for="inputBarCode">Enter BarCode</label> 
						<input type="text" id="barcode" name="barcodes" class="form-control" placeholder="BarCode"/>
					</div>
					<div class="form-group">
						<label for="inputRemarks">Enter Remarks</label> <input type="text"
							class="form-control" name="remark" id="inputRemarks" placeholder="Remarks" />
					</div>
					<input type="hidden" name="requestedQty" id="requestedQty"/>
					<input type="hidden" name="requestNumber" id="requestNumber"/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				<br>
				<button id="issueConfirmBtn" type="button" class="btn btn-primary">Issue</button>
				<button id="cancelBtn" type="button" data-dismiss="modal" class="btn btn-primary">Cancel</button>
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
	var export_filename = 'Approved Request';
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
			{ "targets": [ 7 ], "visible": false, "searchable": false },
		]
	});
	$('#requestTable tfoot th').each(function(index) {
		var title = $(this).text();
		$(this).html('<input type="text" style="width:100%" placeholder="Search '+title+'" />');
	});
	// Apply the search
	enableSearch(table)
	
	$('#actionIssuerPopOver').on('hidden.bs.modal', function(e) {
		resetModalAlerts();
		reloadPendingRequestPage();
		$(_this).prop('disabled',false);
	});
	$(document).on('click', '.issueBtn', function() {
		$('.dynaBarcode').remove();
		var selectedRow = table.row( $(this).parent().parent() ).data();
		console.log(selectedRow)
		var requestedNumber = selectedRow[0]
		var requestedQty = selectedRow[3]
		$('#requestNumber').val(requestedNumber);
		$('#requestedQty').val(requestedQty);
		console.log(requestedQty)
		if(requestedQty > 1){
			for(i=1;i<requestedQty;i++){
				$('#barcode').after('<input type="text" name="barcodes" class="form-control dynaBarcode" placeholder="BarCode"/>')
			}
		}
	});
	$('#issueConfirmBtn').click(function(e) {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		resetModalAlerts();
		 $.ajax({
			type : "POST",
			url : "issueAsset",
			data : $("#issueForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('successMessage','<spring:message code="request.issue.success" />');
					
				}else if(data.status == 0){
					showErrorMessage('errorMessage',data.msg);
					$(_this).prop('disabled',false);
				}
				else {
					showErrorMessage('errorMessage','Unknow error');
					$(_this).prop('disabled',false);
				}
				$.unblockUI();
			}//success end
		});//ajax end 
	});
	/* $('#rejectBtn').click(function(e) {
		resetModalAlerts();
		 $.ajax({
			type : "POST",
			url : "rejectRequest",
			data : $("#approvalForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('successMessage','<spring:message code="request.reject.success" />');
				}else {
					showErrorMessage('errorMessage','Unknow error');
				}
			}//success end
		});//ajax end 
	}); */
});
function resetModalAlerts() {
	$('#successMessage').hide();
	$('#errorMessage').hide();
}
function reloadPendingRequestPage() {
	document.getElementById('approvedRequestMenuLink').click();
}
</script>
