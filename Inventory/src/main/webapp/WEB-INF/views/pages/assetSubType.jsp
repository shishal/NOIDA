<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 1%; padding-top: 2%"><strong>Asset SubType</strong></h3>
	</div>
	<div class="col-md-6 text-right"
		style="padding-right: 2%; padding-top: 2%">
		<a href="#"><span title="Add New AssetSubType" style="font-size: 20px;" data-toggle="modal" data-target="#addNewAssetSubType" class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a>&nbsp;&nbsp; 
		<a href="#" id="editAssetSubType"><span title="Edit selected AssetSubType" style="font-size: 20px;" data-toggle="modal" data-target="#updateAssetSubType" class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp; 
		<a href="#" id="deleteAssetSubType"><span title="Delete selected AssetSubType" style="font-size: 20px;" class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
	</div>
</div>
<div class="table-responsive">
<table class="table table-bordered" id="assetSubTypeTable">
	<thead class="thead-inverse table-header" style="">
		<tr>
			<th>#</th>
			<th></th>
			<th></th>
			<th>Asset SubType</th>
			<th>Asset Type</th>
			<th>Make</th>
			<th>Description</th>
			<th>Date</th>
		</tr>
	</thead>
	<tfoot>
			<tr>
				<th>#</th>
				<th></th>
				<th></th>
				<th>Asset Sub Type</th>
				<th>Asset Type</th>
				<th>Make</th>
				<th>Description</th>
				<th>Date</th>
			</tr>
		</tfoot>
	<tbody>
		<c:forEach items="${assetSubTypeList}" var="assetSubType" varStatus="row">
				<tr onclick="">
					<th scope="row">${row.index +1}</th>
					<th>${assetSubType.id}</th>
					<th>${assetSubType.mainType.id}</th>
					<td>${assetSubType.subType}</td>
					<td>${assetSubType.mainType.mainType}</td>
					<td>${assetSubType.make}</td>
					<td>${assetSubType.description}</td>
					<td>${assetSubType.createdTime}</td>
				</tr>
			</c:forEach>
	</tbody>
</table>
</div>
<div class="modal fade page-normal-font" id="addNewAssetSubType"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter Asset SubType Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form" id="assetSubTypeForm">
					<div class="form-group">
						<label for="inputAssetSubType">Asset SubType: </label> 
						<input type="text" name="name" class="form-control" placeholder="Asset Sub Type" id="inputAssetSubType" />
					</div>
					<div class="form-group">
						<label for="inputMake">Make: </label> 
						<input type="text" name="make" class="form-control" placeholder="Asset Sub Type" id="inputMake" />
					</div>
					<div class="form-group">
						<label for="selectItemType">Asset Type: </label> 
						<select class="form-control" name="assetTypeId" id="inputAssetType">
							<c:forEach  items="${assetTypeList}" var="assetType" varStatus="row">
								<option value="${assetType.id}">${assetType.mainType}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="inputDesc">Description: </label> 
						<input type="text" name="desc" class="form-control" placeholder="Description" id="inputDesc" />
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div id="createErrorMessage" class="alert alert-danger" style="display: none;"></div>
						<div id="createSuccessMessage" class="alert alert-success" style="display: none;"></div>
					</div>
				</form>
				<button type="button" class="btn btn-primary" id="saveBtn">Save</button>
				<button type="button" class="btn btn-primary" onclick="" id="closeBtn" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>
<div class="modal fade page-normal-font" id="updateAssetSubType"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Edit Asset SubType Details</h4>
			</div>
			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form" id="updateAssetSubTypeForm">
					<input type="hidden" name ="id" id="inputUpdateAssetSubTypeId" value=""/>
					<div class="form-group">
						<label for="inputUpdateAssetSubType">Asset Sub Type: </label> 
						<input type="text" name="name" class="form-control" placeholder="Asset Sub Type" id="inputUpdateAssetSubType" />
					</div>
					<div class="form-group">
						<label for="inputMake">Make: </label> 
						<input type="text" name="make" class="form-control" placeholder="Asset Sub Type" id="inputUpdateMake" />
					</div>
					<div class="form-group">
						<label for="selectItemType">Asset Type: </label> 
						<select class="form-control" name="assetTypeId" id="inputUpdateAssetType">
							<c:forEach items="${assetTypeList}" var="assetType" varStatus="row">
								<option value="${assetType.id}">${assetType.mainType}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="inputDesc">Description: </label> 
						<input type="text" name="desc" class="form-control" placeholder="Description" id="inputUpdateDesc" />
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div id="updateErrorMessage" class="alert alert-danger" style="display: none;"></div>
						<div id="updateSuccessMessage" class="alert alert-success" style="display: none;"></div>
					</div>
				</form>
				<button type="button" class="btn btn-primary" id="updateBtn">Save</button>
				<button type="button" class="btn btn-primary" onclick="" id="closeBtn" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>
<script>
	$(function() {
		var selectedRow = 0;
		var export_filename = 'AssetSubType';
		var table = $('#assetSubTypeTable').DataTable({
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
				{ "targets": [ 2 ], "visible": false, "searchable": false }
			]
		});
		 $('#assetSubTypeTable tbody').on( 'click', 'tr', function () {
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
		$('#assetSubTypeTable tfoot th').each(function(index) {
			if(index==0) return;
			var title = $(this).text();
			$(this).html('<input style="width:100%" type="text" placeholder="Search '+title+'" />');
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
		$('#addNewAssetSubType').on('shown.bs.modal', function(e) {
			resetModalForm();
			resetModalAlerts();
		});
		$('#addNewAssetSubType').on('hidden.bs.modal', function(e) {
			resetModalForm();
			resetModalAlerts();
			reloadAssetSubTypePage();
		});
		$('#updateAssetSubType').on('shown.bs.modal', function(e) {
			resetModalForm();
			resetModalAlerts();
		});
		$('#updateAssetSubType').on('hidden.bs.modal', function(e) {
			resetModalForm();
			resetModalAlerts();
			reloadAssetSubTypePage();
		});
		function resetModalForm() {
			$('#inputAssetSubType').val('').end();
			$('#inputDesc').val('');
		}
		function resetModalAlerts() {
			$('#successMessage').hide();
			$('#errorMessage').hide();
		}
		
		function reloadAssetSubTypePage() {
			document.getElementById('assetSubTypeMenuLink').click();
		}
		$('#saveBtn').click(function() {
			$.ajax({
				type : "POST",
				url : "createAssetSubType",
				data : $("#assetSubTypeForm").serialize(),
				success : function(data) {
					if (data.status == 1) {
						showSuccessMessage('createSuccessMessage','<spring:message code="asset.sub.type.create.success" />');
						resetModalForm();
					} else if (data.status == 0) {
						showErrorMessage('createErrorMessage',data.message);//code to show error
					} else {
						showErrorMessage('createErrorMessage','Unknow error');
					}
				}//success end
			});//ajax end
		});//onclik end
		$('#editAssetSubType').click(function(){
			if(selectedRow == 0){
				showAlertDialog('Please select row to edit');
				return false;
			}
			$('#inputUpdateAssetSubTypeId').val(selectedRow[1]);
			$('#inputUpdateAssetType').val(selectedRow[2]);
			$('#inputUpdateAssetSubType').val(selectedRow[3]);
			$('#inputUpdateMake').val(selectedRow[5]);
			$('#inputUpdateDesc').val(selectedRow[6]);
		});
		$('#updateBtn').click(function() {
			$.ajax({
			type : "POST",
			url : "updateAssetSubType",
			data : $("#updateAssetSubTypeForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('updateSuccessMessage','<spring:message code="asset.sub.type.update.success" />');
					resetModalForm();
				} else if (data.status == 0) {
					showErrorMessage('updateErrorMessage',data.message);//code to show error
				} else {
					showErrorMessage('updateErrorMessage','Unknow error');
				}
			}//success end
		});//ajax end
		});
		$('#deleteAssetSubType').click(function(){
			if(selectedRow == 0){
				showAlertDialog('Please select row to delete');
				return false;
			}
			$.ajax({
				type : "POST",
				url : "deleteAssetSubType",
				data : {id:selectedRow[1],${_csrf.parameterName}:'${_csrf.token}'},
				success : function(data) {
					if (data.status == 1) {
						showAlertDialog('<spring:message code="asset.sub.type.delete.success" />');
						reloadAssetSubTypePage();
					} else {
						showAlertDialog('Unknow error');
					}
				}//success end
			});//ajax end
		});
});
</script>