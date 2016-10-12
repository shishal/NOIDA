
<div class="row">
	<div class="col-md-6">
		<h4 style="padding-left: 2%; padding-top: 2%">Asset</h4>
	</div>
	<div class="col-md-6 text-right"
		style="padding-right: 2%; padding-top: 2%">
		<a id="createAsset" href="#"><span title="Add New Asset" style="font-size: 20px;" data-toggle="modal" data-target="#addNewAsset" class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a> &nbsp;&nbsp; 
		<a id="updateAsset" href="#"><span title="Edit selected Asset" style="font-size: 20px;" data-toggle="modal" data-target="#addNewAsset" class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a> &nbsp;&nbsp; 
		<a id="deleteAsset" href="#"><span title="Delete selected Asset" style="font-size: 20px;" class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a> &nbsp;&nbsp; 
	</div>
</div>
<div class="table-responsive">
	<table class="table table-bordered">
		<thead class="thead-inverse table-header" style="">
			<tr>
				<th>#</th>
				<th>Asset BarCode</th>
				<th>Type</th>
				<th>SubType</th>
				<th>PO Number</th>
				<th>AMC Number</th>
				<th>Assigned User</th>
			</tr>
		</thead>
		<tbody>
			<tr onclick="tableRowSelection(this);">
				<th scope="row">1</th>
				<td><button type="button" class="btn btn-link"
						data-toggle="modal" data-target="#assetDetails">ABC123</button></td>
				<td>Laptop</td>
				<td>MacBook Air</td>
				<td>ABC123</td>
				<td>def123</td>
				<td>R K Gupta</td>
			</tr>
			<tr onclick="tableRowSelection(this);">
				<th scope="row">2</th>
				<td><button type="button" class="btn btn-link"
						data-toggle="modal" data-target="#assetDetails">ABC123</button></td>
				<td>Laptop</td>
				<td>MacBook Air</td>
				<td>ABC123</td>
				<td>def123</td>
				<td>R K Gupta</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="modal fade page-normal-font" id="assetDetails" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Asset Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form">
					<div class="form-group">
						<label for="inputAssetBarCode">Asset BarCode: </label> <input
							type="text" class="form-control" value="ABC123"
							id="inputAssetBarCode" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputAssetType">Asset Type: </label> <input
							type="text" class="form-control" value="Laptop"
							id="inputAssetType" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputAssetSubType">Asset SubType: </label> <input
							type="text" class="form-control" value="MacBook Air"
							id="inputAssetSubType" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputPONumber">PO Number: </label> <input type="text"
							class="form-control" value="ABC123" id="inputPONumber"
							disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputAMCNumber">AMC Number: </label> <input
							type="text" class="form-control" value="ABC123"
							id="inputAMCNumber" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputDate">Date: </label> <input type="text"
							class="form-control" value="20-June-2016" id="inputDate"
							disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputDesc">Description: </label> <input type="text"
							class="form-control" value="i7 core 2 duo" id="inputDesc"
							disabled="disabled" />
					</div>
				</form>
				<button type="button" class="btn btn-primary">Close</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade page-normal-font" id="addNewAsset" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter Asset Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form">
					<div class="form-group">
						<label for="inputAssetBarCode">Asset BarCode: </label> <input
							type="text" class="form-control" value="ABC123"
							id="inputAssetBarCode" />
					</div>
					<div class="form-group">
						<label for="inputAssetType">Asset Type: </label> <input
							type="text" class="form-control" value="Laptop"
							id="inputAssetType" />
					</div>
					<div class="form-group">
						<label for="inputAssetSubType">Asset SubType: </label> <input
							type="text" class="form-control" value="MacBook Air"
							id="inputAssetSubType" />
					</div>
					<div class="form-group">
						<label for="inputPONumber">PO Number: </label> <input type="text"
							class="form-control" value="ABC123" id="inputPONumber" />
					</div>
					<div class="form-group">
						<label for="inputAMCNumber">AMC Number: </label> <input
							type="text" class="form-control" value="ABC123"
							id="inputAMCNumber" />
					</div>
					<div class="form-group">
						<label for="inputDate">Date</label>&nbsp;
						<div id="inputDate" class="input-group date"
							data-provide="datepicker">
							<input type="text" class="form-control">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-th"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="inputDesc">Description: </label> <input type="text"
							class="form-control" value="i7 core 2 duo" id="inputDesc" />
					</div>
				</form>
				<button type="submit" class="btn btn-primary">Save</button>
			</div>

		</div>
	</div>
</div>