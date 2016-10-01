
<!-- <div class="pane-content bg-alt">
	<div class="bs-example"> -->
<div class="row">
	<div class="col-md-6">
		<h4 style="padding-left: 2%; padding-top: 2%">Search Filter</h4>
	</div>
	<div class="col-md-6 text-right"
		style="padding-right: 2%; padding-top: 2%">
		<a href="#"><span title="Add New PO" style="font-size: 20px;"
			data-toggle="modal" data-target="#addNewPO"
			class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a>
		&nbsp;&nbsp; <a href="#"><span title="Edit selected PO"
			style="font-size: 20px;"
			data-toggle="modal" data-target="#addNewPO"
			class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a>
		&nbsp;&nbsp; <a href="#"><span title="Export"
			style="font-size: 20px;"
			class="hidden-xs showopacity glyphicon glyphicon-export"></span></a>
		&nbsp;&nbsp; <a href="#"><span title="Delete selected PO"
			style="font-size: 20px;"
			class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
		&nbsp;&nbsp; <a href="#"><span title="Print"
			style="font-size: 20px;"
			class="hidden-xs showopacity glyphicon glyphicon-print"></span></a>
		<!-- <button type="button" id="addPO" data-toggle="tooltip" title="Add New PO" class="glyphicon glyphicon-plus"></button> -->
		<!-- <button type="button" id="deletePO" data-toggle="tooltip" title="Edit PO" class="glyphicon glyphicon-edit"></button>
		<button type="button" id="deletePO" data-toggle="tooltip" title="Delete PO" class="glyphicon glyphicon-trash"></button> -->
	</div>
</div>
<form class="form-inline" style="padding-left: 2%">
	<div class="form-group">
		<label for="poNumber">PO Number</label> <input type="text"
			class="form-control" id="poNumber">
	</div>
	<div class="form-group">
		<label for="vendor">Vendor</label> <input type="text"
			class="form-control" id="vendor">
	</div>

	<div class="form-group">
		<label for="fromDate">From</label>&nbsp;
		<div id="fromDate" class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control">
			<div class="input-group-addon">
				<span class="glyphicon glyphicon-th"></span>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="toDate">To</label>&nbsp;
		<div id="toDate" class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control">
			<div class="input-group-addon">
				<span class="glyphicon glyphicon-th"></span>
			</div>
		</div>
	</div>
	<button type="submit" class="btn btn-primary">Submit</button>
</form>
<div class="table-responsive">
	<table id="poTable" class="table table-bordered">
		<thead class="table-header" style="">
			<tr>
				<th>#</th>
				<th>PO Number</th>
				<th>Vendor</th>
				<th>Date</th>
			</tr>
		</thead>
		<tbody>
			<tr class="clickable-row active" onclick="alerttest();">
				<th scope="row">1</th>
				<td><button type="button" class="btn btn-link"
						data-toggle="modal" data-target="#poDetails">ABC123</button></td>
				<td>Samsung</td>
				<td>20-June-2016</td>
			</tr>
			<tr class="clickable-row" onclick="alerttest();">
				<th scope="row">2</th>
				<td><button type="button" class="btn btn-link"
						data-toggle="modal" data-target="#poDetails">DEF123</button></td>
				<td>HP</td>
				<td>20-June-2016</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="modal fade page-normal-font" id="poDetails" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">PO Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form">
					<div class="form-group">
						<label for="inputPONumber">PO Number: </label> <input type="text"
							class="form-control" value="ABC123" id="inputPONumber"
							disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputVendor">Vendor: </label> <input type="text"
							class="form-control" value="Laptop" id="inputVendor"
							disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputDate">Date: </label> <input type="text"
							class="form-control" value="MacBook Air" id="inputDate"
							disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputDesc">Description: </label> <input type="text"
							class="form-control" value="4" id="inputDesc" disabled="disabled" />
					</div>
				</form>
				<button type="button" class="btn btn-primary">Close</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade page-normal-font" id="addNewPO" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content ">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter PO Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form">
					<div class="form-group">
						<label for="inputPONumber">PO Number: </label> <input type="text"
							class="form-control" value="ABC123" id="inputPONumber" />
					</div>
					<div class="form-group">
						<label for="inputVendor">Vendor: </label> <input type="text"
							class="form-control" value="Laptop" id="inputVendor" />
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
							class="form-control" value="4" id="inputDesc" />
					</div>
				</form>
				<button type="submit" class="btn btn-primary">Save</button>
			</div>

		</div>
	</div>
</div>