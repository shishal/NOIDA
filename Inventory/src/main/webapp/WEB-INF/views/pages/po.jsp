
<!-- <div class="pane-content bg-alt">
	<div class="bs-example"> -->
	<div class="row">
		<div class="col-md-6"><h4 style="padding-left:2%;padding-top:2%">Search Filter</h4></div>
		<div class="col-md-6 text-right" style="padding-right:2%;padding-top:2%">
		<a href="#"><span style="font-size:16px;" class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a>
		<a href="#"><span style="font-size:16px;" class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a>
		<a href="#"><span style="font-size:16px;" class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
		<!-- <button type="button" id="addPO" data-toggle="tooltip" title="Add New PO" class="glyphicon glyphicon-plus"></button> -->
		<!-- <button type="button" id="deletePO" data-toggle="tooltip" title="Edit PO" class="glyphicon glyphicon-edit"></button>
		<button type="button" id="deletePO" data-toggle="tooltip" title="Delete PO" class="glyphicon glyphicon-trash"></button> -->
		</div>
	</div>
  <form class="form-inline" style="padding-left:2%">
    <div class="form-group">
      <label for="poNumber">PO Number</label>
      <input type="text" class="form-control" id="poNumber">
    </div>
    <div class="form-group">
  <label for="vendor">Vendor</label>
      <input type="text" class="form-control" id="vendor">
 </div>
 
<div class="form-group">
<label for="fromDate">From</label>&nbsp;<div id="fromDate" class="input-group date" data-provide="datepicker">
    <input type="text" class="form-control">
    <div class="input-group-addon">
        <span class="glyphicon glyphicon-th"></span>
    </div>
</div>
</div>
<div class="form-group">
<label for="toDate">To</label>&nbsp;<div id="toDate" class="input-group date" data-provide="datepicker">
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
					<th>PO Number</th>
					<th>Vendor</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td><button type="button" class="btn btn-link" data-toggle="modal" data-target="#poDetails">ABC123</button></td>
					<td>Samsung</td>
					<td>20-June-2016</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td><button type="button" class="btn btn-link" data-toggle="modal" data-target="#poDetails">DEF123</button></td>
					<td>HP</td>
					<td>20-June-2016</td>
				</tr>
			</tbody>
		</table>