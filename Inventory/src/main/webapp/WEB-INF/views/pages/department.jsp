
<!-- <div class="pane-content bg-alt">
	<div class="bs-example"> -->
	<div class="row">
		<div class="col-md-6"><h4 style="padding-left:2%;padding-top:2%">Search Filter</h4></div>
		<div class="col-md-6 text-right" style="padding-right:2%;padding-top:2%">
		<a href="#"><span title="Add New Department" style="font-size:20px;" 
		data-toggle="modal" data-target="#addNewDepartment"
		class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a>
		&nbsp;&nbsp;
		<a href="#"><span title="Edit selected Department" style="font-size:20px;" 
		data-toggle="modal" data-target="#addNewDepartment"
		class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a>
		&nbsp;&nbsp;
		<a href="#"><span title="Export" style="font-size:20px;" class="hidden-xs showopacity glyphicon glyphicon-export"></span></a>
		&nbsp;&nbsp;
		<a href="#"><span title="Delete selected Department" style="font-size:20px;" class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
		&nbsp;&nbsp;
		<a href="#"><span title="Print" style="font-size: 20px;"
			class="hidden-xs showopacity glyphicon glyphicon-print"></span></a>
		<!-- <button type="button" id="addPO" data-toggle="tooltip" title="Add New PO" class="glyphicon glyphicon-plus"></button> -->
		<!-- <button type="button" id="deletePO" data-toggle="tooltip" title="Edit PO" class="glyphicon glyphicon-edit"></button>
		<button type="button" id="deletePO" data-toggle="tooltip" title="Delete PO" class="glyphicon glyphicon-trash"></button> -->
		</div>
	</div>
  <form class="form-inline" style="padding-left:2%">
     <div class="form-group">
  <label for="inputDepartment">Department</label>
      <input type="text" class="form-control" id="inputDepartment">
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
    <button type="submit" class="btn btn-primary">Search</button>
  </form>
  
  <div class="table-responsive">
		<table class="table table-bordered">
			<thead class="thead-inverse table-header" style="">
				<tr>
					<th>#</th>
					<th>Department</th>
					<th>Address</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Industry</td>
					<td>Sector 6</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>IT Cell</td>
					<td>Sector 39</td>
				</tr>
			</tbody>
		</table>
</div>

<div class="modal fade page-normal-font" id="addNewDepartment" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter Department Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body">

				<form role="form">
					<div class="form-group">
						<label for="inputAssetType">Department: </label> <input
							type="text" class="form-control" value="Laptop"
							id="inputAssetType" />
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
						<label for="inputDesc">Address:</label> <input type="text"
							class="form-control" value="" id="inputDesc" />
					</div>
					<div class="form-group">
						<label for="inputDesc">Description: </label> <input type="text"
							class="form-control" value="" id="inputDesc" />
					</div>
				</form>
				<button type="submit" class="btn btn-primary">Save</button>
			</div>

		</div>
	</div>
</div>	
		