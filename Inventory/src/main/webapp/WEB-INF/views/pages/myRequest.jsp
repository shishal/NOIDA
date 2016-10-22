<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 2%; padding-top: 2%">My Requests</h3>
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
			<td>${request.status}</td>
			<td>${request.assetSubType.id}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>


<script>
	//When the document is ready
$(function() {
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
			{ "targets": [ 6 ], "visible": false, "searchable": false },
		]
	});
	$('#requestTable tfoot th').each(function(index) {
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
	
});
	
</script>