<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <div class="pane-content bg-alt">
	<div class="bs-example"> -->
<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 1%; padding-top: 2%"><strong>Asset Type</strong></h3>
	</div>
	<div class="col-md-6 text-right"
		style="padding-right: 2%; padding-top: 2%">
		<a href="javascript:(0)"><span title="Add New AssetType" style="font-size: 20px;" data-toggle="modal" data-target="#addNewAssetType" class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a>&nbsp;&nbsp; 
		<a id="editAssetType" href="javascript:(0)"><span title="Edit selected AssetType" style="font-size: 20px;" data-toggle="modal" data-target="#updateAssetType" class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp; 
		<a id="deleteAssetType" href="javascript:(0)"><span title="Delete selected AssetType" style="font-size: 20px;" class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
	</div>
</div>
<div class="table-responsive">
	<table class="table table-bordered hover " id="assetTypeTable">
		<thead class="thead-inverse table-header" style="">
			<tr>
				<th>#</th>
				<th></th>
				<th>Asset Type</th>
				<th>Description</th>
				<th>Date</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>#</th>
				<th></th>
				<th>Asset Type</th>
				<th>Description</th>
				<th>Date</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach items="${assetTypeList}" var="assetType" varStatus="row">
				<tr onclick="">
					<th scope="row">${row.index +1}</th>
					<th>${assetType.id}</th>
					<td>${assetType.mainType}</td>
					<td>${assetType.description}</td>
					<td>${assetType.createdTime}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="modal fade page-normal-font" id="addNewAssetType" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<h4 class="modal-title">Enter Asset Type Details</h4>
			</div>
			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form" id="assetTypeForm">
					<div class="form-group">
						<label for="inputAssetType">Asset Type: </label> <input
							name="name" type="text" class="form-control"
							placeholder="Asset Type" id="inputAssetType" />
					</div>
					<div class="form-group">
						<label for="inputDesc">Description: </label> <input type="text"
							name="desc" class="form-control" placeholder="Description"
							id="inputDesc" />
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div id="createErrorMessage" class="alert alert-danger" style="display: none;"></div>
					<div id="createSuccessMessage" class="alert alert-success" style="display: none;"></div>
				</form>
				<button type="button" class="btn btn-primary" id="saveBtn">Save</button>
				<button type="button" class="btn btn-primary" onclick="" id="closeBtn" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>
<div class="modal fade page-normal-font" id="updateAssetType" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<h4 class="modal-title">Update Asset Type Details</h4>
			</div>
			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form" id="updateAssetTypeForm">
					<input type="hidden" name ="id" id="assetTypeId" value=""/>
					<div class="form-group">
						<label for="inputAssetType">Asset Type: </label> <input
							name="name" type="text" class="form-control"
							placeholder="Asset Type" id="inputUpdateAsset" />
					</div>
					<div class="form-group">
						<label for="inputDesc">Description: </label> <input type="text"
							name="desc" class="form-control" placeholder="Description"
							id="inputUpdateDesc" />
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div id="updateErrorMessage" class="alert alert-danger" style="display: none;"></div>
					<div id="updateSuccessMessage" class="alert alert-success" style="display: none;"></div>
				</form>
				<button type="button" class="btn btn-primary" id="updateBtn">Update</button>
				<button type="button" class="btn btn-primary" onclick="reloadAssetTypePage();"
					id="closeBtn" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<script>
	//When the document is ready
$(function() {
	var selectedRow = 0;
	var export_filename = 'AssetType';
	var table = $('#assetTypeTable').DataTable({
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
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": false
		    }
		]
	});
				
	$('#assetTypeTable tbody').on( 'click', 'tr', function () {
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
	$('#assetTypeTable tfoot th').each(function(index) {
		if(index==0) return;
		var title = $(this).text();
		$(this).html('<input type="text" placeholder="Search '+title+'" />');
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
	$('#addNewAssetType').on('shown.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
	});
	$('#addNewAssetType').on('hidden.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
		reloadAssetTypePage();
	});
	$('#updateAssetType').on('shown.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
	});
	$('#updateAssetType').on('hidden.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
		reloadAssetTypePage();
	});
	function resetModalForm() {
		$('#inputAssetType').val('').end();
		$('#inputDesc').val('');
	}
	function resetModalAlerts() {
		$('#successMessage').hide();
		$('#errorMessage').hide();
	}
	
	function reloadAssetTypePage() {
		document.getElementById('assetTypeMenuLink').click();
	}
	$('#saveBtn').click(function() {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		$.ajax({
			type : "POST",
			url : "createAssetType",
			data : $("#assetTypeForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('createSuccessMessage','<spring:message code="asset.type.create.success" />');
					document.getElementById("assetTypeForm").reset();
				} else if (data.status == 0) {
					showErrorMessage('createErrorMessage',data.message);//code to show error
				} else {
					showErrorMessage('createErrorMessage','Unknow error');
				}
				$.unblockUI();
				$(_this).prop('disabled',false);
			}//success end
		});//ajax end
	});//onclik end
	$('#editAssetType').click(function(){
		if(selectedRow == 0){
			showAlertDialog('Please select row to edit');
			return false;
		}
		$('#assetTypeId').val(selectedRow[1]);
		$('#inputUpdateAsset').val(selectedRow[2]);
		$('#inputUpdateDesc').val(selectedRow[3])
	});
	$('#updateBtn').click(function() {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		$.ajax({
		type : "POST",
		url : "updateAssetType",
		data : $("#updateAssetTypeForm").serialize(),
		success : function(data) {
			if (data.status == 1) {
				showSuccessMessage('updateSuccessMessage','<spring:message code="asset.type.update.success" />');
				$.unblockUI();
				$(_this).prop('disabled',false);
			} else if (data.status == 0) {
				showErrorMessage('updateErrorMessage',data.message);//code to show error
				$.unblockUI();
				$(_this).prop('disabled',false);
			} else {
				showErrorMessage('updateErrorMessage','Unknow error');
				$.unblockUI();
				$(_this).prop('disabled',false);
			}
		}//success end
	});//ajax end
	});
	$('#deleteAssetType').click(function(){
		if(selectedRow == 0){
			showAlertDialog('Please select row to delete');
			return false;
		}
		$.ajax({
			type : "POST",
			url : "deleteAssetType",
			data : {id:selectedRow[1],${_csrf.parameterName}:'${_csrf.token}'},
			success : function(data) {
				if (data.status == 1) {
					showAlertDialog('<spring:message code="asset.type.delete.success" />');
					reloadAssetTypePage();
				} else {
					showAlertDialog('Unknow error');
				}
			}//success end
		});//ajax end
	});
});//onload end
</script>
