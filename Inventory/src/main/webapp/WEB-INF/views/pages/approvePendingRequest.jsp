
<!-- <div class="pane-content bg-alt">
	<div class="bs-example"> -->
		<div style="padding-left:1%;padding-top:0.5%">
			<h3>New Requests</h3>
		</div>
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
					<td><button type="button" class="btn btn-link" data-toggle="modal" data-target="#requestDetails">ABC123</button></td>
					<td>Laptop</td>
					<td>MacBook Air</td>
					<td>Ravi</td>
					<td>Pending</td>
					<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#actionPopOver">Approve / Reject</button></td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td><button type="button" class="btn btn-link" data-toggle="modal" data-target="#requestDetails">DEF123</button></td>
					<td>Printer Toner</td>
					<td>Samsung Color</td>
					<td>R K Gupta</td>
					<td>Pending</td>
					<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#actionPopOver">Approve / Reject</button></td>
				</tr>
			</tbody>
		</table>
		
<div class="modal fade" id="actionPopOver" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
       
            <!-- Modal Body -->
            <div class="modal-body">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <form role="form">
                  <div class="form-group">
                    <label for="inputRemarks">Enter Remarks</label>
                      <input type="text" class="form-control"
                      id="inputRemarks" placeholder="Remarks"/>
                  </div>
                </form>
                <button type="button" class="btn btn-primary">Approve</button>
                 <button type="button" class="btn btn-primary">Reject</button>
                
            </div>
            
        </div>
    </div>
</div>

<div class="modal fade" id="requestDetails" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
       
            <!-- Modal Body -->
            <div class="modal-body">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <form role="form">
                  <div class="form-group">
                    <label for="inputRequestNumber">Request Number: </label>
                      <input type="text" class="form-control" value="ABC123"
                      id="inputRequestNumber" disabled="disabled"/>
                  </div>
                  <div class="form-group">
                    <label for="inputRequestNumber">Asset Type: </label>
                      <input type="text" class="form-control" value="Laptop"
                      id="inputRequestNumber" disabled="disabled"/>
                  </div>
                  <div class="form-group">
                    <label for="inputRequestNumber">Asset Sub Type: </label>
                      <input type="text" class="form-control" value="MacBook Air"
                      id="inputRequestNumber" disabled="disabled"/>
                  </div>
                  <div class="form-group">
                    <label for="inputRequestNumber">Quantity: </label>
                      <input type="text" class="form-control" value="4"
                      id="inputRequestNumber" disabled="disabled"/>
                  </div>
                  <div class="form-group">
                    <label for="inputRequestNumber">Raised By: </label>
                      <input type="text" class="form-control" value="Ravi"
                      id="inputRequestNumber" disabled="disabled"/>
                  </div>
                  <div class="form-group">
                    <label for="inputRequestNumber">Date: </label>
                      <input type="text" class="form-control" value="15-June-2016"
                      id="inputRequestNumber" disabled="disabled"/>
                  </div>
                </form>
                <button type="button" class="btn btn-primary">Close</button>
            </div>
            
        </div>
    </div>
</div>




		
<!-- 	</div>
</div> -->