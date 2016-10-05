<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <div class="pane-content bg-alt">
	<div class="bs-example"> -->
<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 2%; padding-top: 2%">Asset Type</h3>
	</div>
	<div class="col-md-6 text-right"
		style="padding-right: 2%; padding-top: 2%">
		<a href="#"><span title="Add New AssetType"
			style="font-size: 20px;" data-toggle="modal"
			data-target="#addNewAssetType"
			class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a>
		&nbsp;&nbsp; <a href="#"><span title="Edit selected AssetType"
			style="font-size: 20px;" data-toggle="modal"
			data-target="#addNewAssetType"
			class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a>
		&nbsp;&nbsp; <a href="#"><span title="Delete selected AssetType"
			style="font-size: 20px;"
			class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
		<!-- &nbsp;&nbsp; <a href="#"><span title="Export"
			style="font-size: 20px;" id="exportAssetType"
			class="hidden-xs showopacity glyphicon glyphicon-export"></span></a>
		&nbsp;&nbsp; <a href="#"><span title="Print"
			style="font-size: 20px;" id="printAssetType"
			class="hidden-xs showopacity glyphicon glyphicon-print"></span></a> -->
		<!-- <button type="button" id="addPO" data-toggle="tooltip" title="Add New PO" class="glyphicon glyphicon-plus"></button> -->
		<!-- <button type="button" id="deletePO" data-toggle="tooltip" title="Edit PO" class="glyphicon glyphicon-edit"></button>
		<button type="button" id="deletePO" data-toggle="tooltip" title="Delete PO" class="glyphicon glyphicon-trash"></button> -->
	</div>
</div>
<!-- <form class="form-inline" style="padding-left: 2%">
	<div class="form-group">
		<label for="assetType">Asset Type</label> <input type="text"
			class="form-control" id="assetType">
	</div>


	<div class="form-group">
		<label for="fromDate">From</label>&nbsp;
		<div id="fromDate" class="input-group date">
			<input type="text" class="form-control" id="fromDatePicker">
			<div class="input-group-addon">
				<span class="glyphicon glyphicon-th"></span>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="toDate">To</label>&nbsp;
		<div id="toDate" class="input-group date">
			<input type="text" class="form-control" id="toDatePicker">
			<div class="input-group-addon">
				<span class="glyphicon glyphicon-th"></span>
			</div>
		</div>
	</div>
	<button type="button" class="btn btn-primary">Search</button>
</form> -->
<br>
<div class="table-responsive">
	<table class="table table-bordered hover " id="assetTypeTable">
		<thead class="thead-inverse table-header" style="">
			<tr>
				<th>#</th>
				<th>Asset Type</th>
				<th>Date</th>
				<th>Description</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>#</th>
				<th>Asset Type</th>
				<th>Date</th>
				<th>Description</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach items="${assetTypeList}" var="assetType" varStatus="row">
				<tr onclick="tableRowSelection(this);">
					<th scope="row">${row.index +1}</th>
					<td>${assetType.mainType}</td>
					<td>20-June-2016</td>
					<td>${assetType.description}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="modal fade page-normal-font" id="addNewAssetType"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
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
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div id="errorMessage" class="alert alert-danger"
						style="display: none;"></div>
					<div id="successMessage" class="alert alert-success"
						style="display: none;"></div>
				</form>
				<button type="button" class="btn btn-primary" id="saveBtn">Save</button>
				<button type="button" class="btn btn-primary" onclick="resetForm()"
					id="closeBtn" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<script>
	//When the document is ready
	$(document)
			.ready(
					function() {
						/* $('#fromDatePicker').datepicker({
						    format: "dd/mm/yyyy",
						    autoclose: true
						});  
						$('#toDatePicker').datepicker({
						    format: "dd/mm/yyyy",
						    autoclose: true
						});   */

						var export_filename = 'AssetType';

						$('#assetTypeTable')
								.DataTable(
										{
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
													} ]
										});

						$('#assetTypeTable tfoot th')
								.each(
										function() {
											var title = $(this).text();
											$(this)
													.html(
															'<input type="text" placeholder="Search '+title+'" />');
										});

						var table = $('#assetTypeTable').DataTable();

						// Apply the search

						table
								.columns()
								.every(
										function() {
											var that = this;

											$('input', this.footer())
													.on(
															'keyup change',
															function() {
																if (that
																		.search() !== this.value) {
																	that
																			.search(
																					this.value)
																			.draw();
																}
															});
										});
					});

	$('#addNewAssetType').on('shown.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
	});

	$('#addNewAssetType').on('hidden.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
	});

	function resetModalForm() {
		$('#inputAssetType').val('').end();
		$('#inputDesc').val('');
	}

	function resetModalAlerts() {
		$('#successMessage').hide();
		$('#errorMessage').hide();
	}

	$(function() {
		$('#assetTypeTable').DataTable();
		$('#saveBtn')
				.click(
						function() {
							$
									.ajax({
										type : "POST",
										url : "createAssetType",
										data : $("#assetTypeForm").serialize(),
										success : function(data) {
											if (data.status == 1) {
												showSuccessMessage('<spring:message code="asset.type.create.success" />');
												resetModalForm();
											} else if (data.status == 0) {
												showErrorMessage(data.message);//code to show error
											} else {
												showErrorMessage('Unknow error');
											}
										}//success end
									});//ajax end
						});//onclik end
	});//onload end
</script>
