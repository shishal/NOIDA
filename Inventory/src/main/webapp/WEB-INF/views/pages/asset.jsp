<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-6">
		<h4 style="padding-left: 2%; padding-top: 2%">Asset</h4>
	</div>
	<div class="col-md-6 text-right"
		style="padding-right: 2%; padding-top: 2%">
		<a id="createAsset" href="#"><span title="Add New Asset" style="font-size: 20px;" data-toggle="modal" data-target="#assetModel" class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a> &nbsp;&nbsp; 
		<a id="updateAsset" href="#"><span title="Edit selected Asset" style="font-size: 20px;" data-toggle="modal" data-target="#assetModel" class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a> &nbsp;&nbsp; 
		<a id="deleteAsset" href="#"><span title="Delete selected Asset" style="font-size: 20px;" class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a> &nbsp;&nbsp; 
	</div>
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
				<th>Assigned User</th>
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
				<th>Assigned User</th>
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
					<td>-</td>
					<td>${asset.amc.id}</td>
					<td>${asset.po.id}</td>
					<td>${asset.assetMainType.id}</td>
					<td>${asset.assetSubType.id}</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="modal fade page-normal-font" id="assetModel" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter Asset Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form" id="assetForm">
					<div class="form-group">
						<label for="inputAssetBarCode">Asset BarCode: </label> 
						<input type="text" class="form-control" placeholder="Bar Code" name="barcode" id="barcode" />
					</div>
					<div class="form-group">
						<label for="inputAssetType">Serial Number: </label> 
						<input type="text" class="form-control" placeholder="Serial Number" id="serialNumber" name="serialNumber"/>
					</div>
					<div class="form-group">
						<label for="inputAssetSubType">AMC: </label>
						<select class="form-control" id="amcId" name="amcId">
							<c:forEach  items="${amcList}" var="amc" varStatus="row">
								<option value="${amc.id}">${amc.amcNumber}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="poId">PO Number: </label>
						<select class="form-control" id="poId" name="poId">
							<c:forEach  items="${poList}" var="po" varStatus="row">
								<option value="${po.id}">${po.poNumber}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="selectItemType">Asset Type: </label> 
						<select class="form-control" name="assetTypeId" id="assetTypeId">
							<c:forEach  items="${assetTypeList}" var="assetType" varStatus="row">
								<option value="${assetType.id}">${assetType.mainType}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="selectItemType">Asset Sub Type: </label> 
						<select class="form-control" name="assetSubTypeId" id="assetSubTypeId">
							<%-- <c:forEach  items="${assetSubTypeList}" var="assetSubType" varStatus="row">
								<option value="${assetSubType.id}">${assetSubType.subType}</option>
							</c:forEach> --%>
						</select>
					</div>
					<div class="form-group">
						<label for="selectItemType">Status: </label> 
						<select class="form-control" name="status" id="status">
								<option value="NEW">New</option>
								<option value="OLD">Old</option>
								<option value="DAMAGED">Damaged</option>
						</select>
					</div>
					
					<div class="form-group">
						<label for="desc">Description: </label> 
						<input type="text" class="form-control" placeholder="Description" id="desc" name="desc"/>
					</div>
					<input type="hidden" id="id" name="id" value="" />
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div id="errorMessage" class="alert alert-danger" style="display: none;"></div>
					<div id="successMessage" class="alert alert-success" style="display: none;"></div>
				</form>
				<button type="button" id="saveBtn" class="btn btn-primary">Save</button>
				<button type="button" id="updateBtn" class="btn btn-primary">Update</button>
				<button type="button" class="btn btn-primary" onclick="" id="closeBtn" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
	//When the document is ready
$(function() {
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
		],
		columnDefs: [
			{ "targets": [ 1 ], "visible": false, "searchable": false },
			{ "targets": [ 11 ], "visible": false, "searchable": false },
			{ "targets": [ 12 ], "visible": false, "searchable": false },
			{ "targets": [ 13 ], "visible": false, "searchable": false },
			{ "targets": [ 14 ], "visible": false, "searchable": false }
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
	table.columns().every(function() {
		var that = this;
		$('input', this.footer()).on('keyup change',function() {
			if (that.search() !== this.value) {
				that.search(this.value).draw();
			}
		});
	});
	$('#createAsset').click(function() {
		$('#saveBtn').show();
		$('#updateBtn').hide();
		resetModalForm();
		resetModalAlerts();
	});
	$('#assetModel').on('hidden.bs.modal', function(e) {
		resetModalAlerts();
		reloadAssetPage();
	});
	$('#saveBtn').click(function() {
		$.ajax({
			type : "POST",
			url : "createAsset",
			data : $("#assetForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('successMessage','<spring:message code="asset.create.success" />');
				} else if (data.status == 0) {
					showErrorMessage('errorMessage',data.message);//code to show error
				} else {
					showErrorMessage('errorMessage','Unknow error');
				}
			}//success end
		});//ajax end
	});//onclik end
	$('#updateAsset').click(function(){
		$('#saveBtn').hide();
		$('#updateBtn').show();
		if(selectedRow == 0){
			showAlertDialog('Please select row to edit');
			return false;
		}
		$('#id').val(selectedRow[1]);
		$('#barcode').val(selectedRow[2]);
		$('#serialNumber').val(selectedRow[3]);
		$('#status').val(selectedRow[8]);
		$('#desc').val(selectedRow[9]);
		$('#amcId').val(selectedRow[11]);
		$('#poId').val(selectedRow[12]);
		$('#assetTypeId').val(selectedRow[13]);
		$('#assetTypeId').change();
	});
	$('#updateBtn').click(function() {
		$.ajax({
		type : "POST",
		url : "updateAsset",
		data : $("#assetForm").serialize(),
		success : function(data) {
			if (data.status == 1) {
				showSuccessMessage('successMessage','<spring:message code="asset.update.success" />');
			} else if (data.status == 0) {
				showErrorMessage('errorMessage',data.message);//code to show error
			} else {
				showErrorMessage('errorMessage','Unknow error');
			}
		}//success end
	});//ajax end
	});
	$('#deleteAsset').click(function(){
		if(selectedRow == 0){
			showAlertDialog('Please select row to delete');
			return false;
		}
		$.ajax({
			type : "POST",
			url : "deleteAsset",
			data : {id:selectedRow[1],${_csrf.parameterName}:'${_csrf.token}'},
			success : function(data) {
				if (data.status == 1) {
					showAlertDialog('<spring:message code="asset.delete.success" />');
					reloadAssetPage();
				} else {
					showAlertDialog('Unknow error');
				}
			}//success end
		});//ajax end
	});
	$('#assetTypeId').change(function(){
		assetTypeId=this.value;
		$.ajax({
			type : "POST",
			url : "assetSubTypeByAssetType",
			data : {assetTypeId:assetTypeId,${_csrf.parameterName}:'${_csrf.token}'},
			success : function(result) {
				$('#assetSubTypeId').empty();
				$.each(result.assetSubTypeMap,function(key,value){
					$('#assetSubTypeId').append('<option value="'+key+'">'+value+'</option>')
				});
				$('#assetSubTypeId').val(selectedRow[14]);
			}//success end
		});//ajax end
	});
	function resetModalAlerts() {
		$('#successMessage').hide();
		$('#errorMessage').hide();
	}
	function resetModalForm() {
		$('#id').val('');
		$('#barcode').val('');
		$('#serialNumber').val('');
		$('#amc').val('');
		$('#status').val('');
		$('#po').val('');
		$('#assetTypeId').val('');
		$('#assetSubTypeId').val('');
		$('#desc').val('');
	}
	
	function reloadAssetPage() {
		document.getElementById('assetMenuLink').click();
	}
});//onload end
</script>
