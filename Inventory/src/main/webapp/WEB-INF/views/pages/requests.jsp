
<div class="row">
	<div class="col-md-6">
		<h4 style="padding-left: 2%; padding-top: 2%">Search Filter</h4>
	</div>
	<div class="col-md-6 text-right"
		style="padding-right: 2%; padding-top: 2%">
		<a href="#"><span title="Export" style="font-size: 20px;"
			class="hidden-xs showopacity glyphicon glyphicon-export"></span></a>
		&nbsp;&nbsp;
	</div>
</div>
<form class="form-inline" style="padding-left: 2%">
	<div class="form-group">
		<label for="requestNumber">Req No</label> <input type="text"
			class="form-control" id="requestNumber">
	</div>
	<div class="form-group">
		<label for="selectItemType">Asset Type</label> <select
			class="form-control" id="selectItemType">
			<option>Laptop</option>
			<option>Desktop</option>
			<option>Printer</option>
			<option>PenDrive</option>
		</select>
	</div>
	<div class="form-group">
		<label for="selectItemSubType">Asset Sub Type</label> <select
			class="form-control" id="selectItemSubType">
			<option>MacBook Air</option>
			<option>HP Pavilion</option>
			<option>Dell Destro</option>
			<option>MacBook Pro</option>
		</select>
	</div>
	<div class="form-group">
		<label for="selectRequestStatus">Status</label> <select
			class="form-control" id="selectRequestStatus">
			<option>All</option>
			<option>Closed</option>
			<option>Pending</option>
			<option>Approved</option>
		</select>
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
<table class="table table-bordered">
	<thead class="thead-inverse table-header" style="">
		<tr>
			<th>#</th>
			<th>Request Number</th>
			<th>Item Type</th>
			<th>Item Sub Type</th>
			<th>Raised By</th>
			<th>Status</th>
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
		</tr>
		<tr>
			<th scope="row">2</th>
			<td><button type="button" class="btn btn-link"
					data-toggle="modal" data-target="#requestDetails">DEF123</button></td>
			<td>Printer Toner</td>
			<td>Samsung Color</td>
			<td>R K Guptaa</td>
			<td>Approved</td>
		</tr>
	</tbody>
</table>