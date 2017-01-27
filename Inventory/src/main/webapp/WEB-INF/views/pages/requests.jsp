<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 2%; padding-top: 2%">All Requests</h3>
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
			<th>Department</th>
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
			<th>Department</th>
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
			<td>${request.requester.dept.name}</td>
			<%-- <td>${request.requester.username}</td> --%>
			<td>${request.status}</td>
			<td>
				<c:if test="${request.status eq 'APPROVED'}">
 					<button type="button" class="btn btn-primary revertReqBtn" onClick=setRequestId('${request.id}') data-toggle="modal" data-target="#reverActionPopOver">Revert to Pending</button>
				</c:if>
			</td>
			<td>${request.assetSubType.id}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<div class="modal fade" id="reverActionPopOver" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Action</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">
				<form role="form" id="revertForm">
					<div class="form-group">
						<label for="remark">Enter Remarks</label> 
						<input type="text" class="form-control" name="remark" id="remark" placeholder="Remarks" />
					</div>
					<input type="hidden" name="requestNumber" id="requestNumber"/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>

				<button id="revertBtn" type="button" class="btn btn-primary">Revert</button>
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
	var export_filename = 'All Request';
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
		var title = $(this).text();
		$(this).html('<input type="text" style="width:100%" placeholder="Search '+title+'" />');
	});
	// Apply the search
	enableSearch(table)
	
	$('#reverActionPopOver').on('hidden.bs.modal', function(e) {
		resetModalAlerts();
		reloadRequestPage();
	});
	
	$('#revertBtn').click(function(e) {
		resetModalAlerts();
		 $.ajax({
			type : "POST",
			url : "revertRequest",
			data : $("#revertForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('successMessage','<spring:message code="request.revert.success" />');
				}else {
					showErrorMessage('errorMessage','Unknown error');
				}
			}//success end
		});//ajax end 
	});
	
});

function setRequestId (requestId){
	$('#requestNumber').val(requestId);
}
	
function resetModalAlerts() {
	$('#successMessage').hide();
	$('#errorMessage').hide();
}

function reloadRequestPage() {
	document.getElementById('requestMenuLink').click();
}
</script>