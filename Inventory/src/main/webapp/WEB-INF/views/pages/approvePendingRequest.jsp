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
<table class="table table-bordered">
	<thead class="thead-inverse table-header" style="">
		<tr>
			<th>#</th>
			<th>Request Number</th>
			<th>Asset Type</th>
			<th>Asset Sub Type</th>
			<th>Raised By</th>
			<th>Status</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">1</th>
			<td><button type="button" class="btn btn-link"
					data-toggle="modal" data-target="#requestDetails">ABC123</button></td>
			<td>Laptop</td>
			<td>MacBook Air</td>
			<td>Ravi</td>
			<td>Pending</td>
			<td><button type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#actionPopOver">Approve /
					Reject</button></td>
		</tr>
		<tr>
			<th scope="row">2</th>
			<td><button type="button" class="btn btn-link"
					data-toggle="modal" data-target="#requestDetails">DEF123</button></td>
			<td>Printer Toner</td>
			<td>Samsung Color</td>
			<td>R K Gupta</td>
			<td>Pending</td>
			<td><button type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#actionPopOver">Approve /
					Reject</button></td>
		</tr>
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
			<div class="modal-body">
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

