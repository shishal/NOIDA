<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 2%; padding-top: 2%">My Assets</h3>
	</div>
	<div id="valueHolderId" hidden="true">${assetList}</div>
</div>
<div class="table-responsive">
	<table class="table table-bordered" id="assetTable">
		<thead class="thead-inverse table-header" style="">
		<tr>
				<th>#</th>
				<th></th>
				<th>BarCode</th>
				<th>Serial Number</th>
				<th>AMC</th>
				<th>PO</th>
				<th>Asset Type</th>
				<th>Sub Type</th>
				<th>Status</th>
				<th>Description</th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
	</thead>
	<tfoot>
		<tr>
			<th>#</th>
				<th></th>
				<th>BarCode</th>
				<th>Serial Number</th>
				<th>AMC</th>
				<th>PO</th>
				<th>Asset Type</th>
				<th>Sub Type</th>
				<th>Status</th>
				<th>Description</th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
		</tr>
		</tfoot>
	<tbody>
			<c:forEach items="${assetList}" var="asset" varStatus="row">
				<tr onclick="">
					<td scope="row">${row.index +1}</td>
					<td>${asset.id}</td>
					<td>${asset.barcode}</td>
					<td>${asset.serialNo}</td>
					<td>${asset.amc.amcNumber}</td>
					<td>${asset.po.poNumber}</td>
					<td>${asset.assetMainType.mainType}</td>
					<td>${asset.assetSubType.subType}</td>
					<td>${asset.status}</td>
					<td>${asset.description}</td>
					<td>${asset.amc.id}</td>
					<td>${asset.po.id}</td>
					<td>${asset.assetMainType.id}</td>
					<td>${asset.assetSubType.id}</td>
				</tr>
			</c:forEach>
		</tbody>
</table>
</div>

<script>
$(function() {
	
	/* var someValue = $('#valueHolderId').html();
	console.log(someValue); */
	
	var selectedRow = 0;
	var export_filename = 'asset';
	var table = $('#assetTable').DataTable({
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
		] ,
		columnDefs: [
			{ "targets": [ 1 ], "visible": false, "searchable": false },
			{ "targets": [ 10 ], "visible": false, "searchable": false },
			{ "targets": [ 11 ], "visible": false, "searchable": false },
			{ "targets": [ 12 ], "visible": false, "searchable": false },
			{ "targets": [ 13 ], "visible": false, "searchable": false }
		] 
	});
				
	$('#assetTable tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
			selectedRow = 0;
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			selectedRow = table.row( this ).data();
			console.log(selectedRow)
		}
	});
	$('#assetTable tfoot th').each(function(index) {
		if(index==0) return;
		var title = $(this).text();
		$(this).html('<input type="text" style="width:100%" placeholder="Search '+title+'" />');
	});
	// Apply the search
	enableSearch(table)
});
</script>