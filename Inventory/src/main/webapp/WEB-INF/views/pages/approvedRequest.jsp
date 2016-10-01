
<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 2%; padding-top: 2%">Approved Requests</h3>
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
<table class="table table-bordered">
	<thead class="thead-inverse table-header" style="">
		<tr>
			<th>#</th>
			<th>Request Number</th>
			<th>Item Type</th>
			<th>Item Sub Type</th>
			<th>Raised By</th>
			<th>Status</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">1</th>
			<td><a href="#">ABC123</a></td>
			<td>Laptop</td>
			<td>MacBook Air</td>
			<td>Ravi</td>
			<td>Pending</td>
			<td><button type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#actionIssuerPopOver">Issue</button></td>
		</tr>
		<tr>
			<th scope="row">2</th>
			<td><a href="#">DEF456</a></td>
			<td>Printer Toner</td>
			<td>Samsung Color</td>
			<td>R K Gupta</td>
			<td>Approved</td>
			<td><button type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#actionIssuerPopOver">Issue</button></td>
		</tr>
	</tbody>
</table>
</div>

<div class="modal fade" id="actionIssuerPopOver" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
						<label for="inputBarCode">Enter BarCode</label> <input type="text"
							class="form-control" id="inputBarCode" placeholder="BarCode" />
					</div>
					<div class="form-group">
						<label for="inputRemarks">Enter Remarks</label> <input type="text"
							class="form-control" id="inputRemarks" placeholder="Remarks" />
					</div>
				</form>
				<br>
				<button type="button" class="btn btn-primary">Issue</button>
				<button type="button" class="btn btn-primary">Cancel</button>

			</div>

		</div>
	</div>
</div>
