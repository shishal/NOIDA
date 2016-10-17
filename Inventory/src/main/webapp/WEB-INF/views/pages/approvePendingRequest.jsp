<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 2%; padding-top: 2%">Pending Requests</h3>
	</div>
	<div class="col-md-6 text-right"
		style="padding-right: 2%; padding-top: 2%">
		<a href="#"><span title="Export" style="font-size: 20px;"
			class="hidden-xs showopacity glyphicon glyphicon-export"></span></a>
		&nbsp;&nbsp;
		<a href="#"><span title="Print" style="font-size: 20px;"
			class="hidden-xs showopacity glyphicon glyphicon-print"></span></a>
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
			<td>${request.requester.username}</td>
			<td><fmt:formatDate type="date"  value="${request.createdTime}" pattern="dd-MM-yyyy" /></td>
			<td>${request.status}</td>
			<td><button type="button" class="btn btn-primary approveBtn" data-toggle="modal" data-target="#actionPopOver">Approve /Reject</button></td>
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
				<form role="form">
					<div class="form-group">
						<label for="inputRemarks">Enter Remarks</label> <input type="text"
							class="form-control" id="inputRemarks" placeholder="Remarks" />
					</div>
				</form>

				<button type="button" class="btn btn-primary">Approve</button>
				<button type="button" class="btn btn-primary">Reject</button>

			</div>

		</div>
	</div>
</div>
<script>
	//When the document is ready
$(function() {
	var selectedRow = 0;
	var export_filename = 'po';
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
	table.columns().every(function() {
		var that = this;
		$('input', this.footer()).on('keyup change',function() {
			if (that.search() !== this.value) {
				that.search(this.value).draw();
			}
		});
	});
	$('.approveBtn').click(function(e) {
		var selectedRow = table.row( $(this).parent().parent() ).data();
		var requestedQty = selectedRow[3]
		var assetSubTypeId = selectedRow[8]
		console.log(requestedQty + ' '+assetSubTypeId)
		 $.ajax({
			type : "POST",
			url : "getAssetAvailability",
			data : {assetSubTypeId:assetSubTypeId,${_csrf.parameterName}:'${_csrf.token}'},
			success : function(data) {
				if (data.status == 1) {
					alert(data.availableQty)
				} else if (data.status == 0) {
					showErrorMessage('errorMessage',data.message);//code to show error
				} else {
					showErrorMessage('errorMessage','Unknow error');
				}
			}//success end
		});//ajax end 
	});
});
</script>
