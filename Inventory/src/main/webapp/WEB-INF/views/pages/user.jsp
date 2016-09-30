
<!-- <div class="pane-content bg-alt">
	<div class="bs-example"> -->
	<div class="row">
		<div class="col-md-6"><h4 style="padding-left:2%;padding-top:2%">Search Filter</h4></div>
		<div class="col-md-6 text-right" style="padding-right:2%;padding-top:2%">
		<a href="#"><span title="Add New User" style="font-size:20px;" class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a>
		&nbsp;&nbsp;
		<a href="#"><span title="Edit selected User" style="font-size:20px;" class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a>
		&nbsp;&nbsp;
		<a href="#"><span title="Export" style="font-size:20px;" class="hidden-xs showopacity glyphicon glyphicon-export"></span></a>
		&nbsp;&nbsp;
		<a href="#"><span title="Delete selected User" style="font-size:20px;" class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
		<!-- <button type="button" id="addPO" data-toggle="tooltip" title="Add New PO" class="glyphicon glyphicon-plus"></button> -->
		<!-- <button type="button" id="deletePO" data-toggle="tooltip" title="Edit PO" class="glyphicon glyphicon-edit"></button>
		<button type="button" id="deletePO" data-toggle="tooltip" title="Delete PO" class="glyphicon glyphicon-trash"></button> -->
		</div>
	</div>
  <form class="form-inline" style="padding-left:2%">
    <div class="form-group">
      <label for="inputUserName">UserName</label>
      <input type="text" class="form-control" id="inputUserName">
    </div>
    <div class="form-group">
  <label for="inputFirstName">First Name</label>
      <input type="text" class="form-control" id="inputFirstName">
 </div>
 <div class="form-group">
  <label for="inputLastName">Last Name</label>
      <input type="text" class="form-control" id="inputLastName">
 </div>
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
		<table class="table table-bordered">
			<thead class="thead-inverse table-header" style="">
				<tr>
					<th>#</th>
					<th>Username</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Department</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td><button type="button" class="btn btn-link" data-toggle="modal" data-target="#userDetails">admin</button></td>
					<td>R K</td>
					<td>Gupta</td>
					<td>Industry</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td><button type="button" class="btn btn-link" data-toggle="modal" data-target="#userDetails">user</button></td>
					<td>Amit</td>
					<td>Gupta</td>
					<td>Industry</td>
				</tr>
			</tbody>
		</table>
		
		<div class="modal fade page-normal-font" id="poDetails" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        
        	<div class="modal-header app-modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">User Details</h4>
      </div>
       
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form role="form">
                  <div class="form-group">
                    <label for="inputModalUsername">UserName: </label>
                      <input type="text" class="form-control" value="ABC123"
                      id="inputModalUsername" disabled="disabled"/>
                  </div>
                  <div class="form-group">
                    <label for="inputModalFirstName">First Name: </label>
                      <input type="text" class="form-control" value="R K"
                      id="inputModalFirstName" disabled="disabled"/>
                  </div>
                  <div class="form-group">
                    <label for="inputModalLastName">LastName: </label>
                      <input type="text" class="form-control" value="Gupta"
                      id="inputModalLastName" disabled="disabled"/>
                  </div>
                  <div class="form-group">
                    <label for="inputModalDepartment">Department: </label>
                      <input type="text" class="form-control" value="4"
                      id="inputModalDepartment" disabled="disabled"/>
                  </div>
                </form>
                <button type="button" class="btn btn-primary">Close</button>
            </div>
            
        </div>
    </div>
</div>