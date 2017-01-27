<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 1%; padding-top: 2%"><strong>User</strong></h3>
	</div>
	<div class="col-md-6 text-right"
		style="padding-right: 2%; padding-top: 2%">
		<a href="javascript:(0)"><span title="Add New User" style="font-size: 20px;" data-toggle="modal" data-target="#addUser" class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a>
		&nbsp;&nbsp; 
		<a id="editUser" href="javascript:(0)"><span title="Edit selected User" style="font-size: 20px;" data-toggle="modal" data-target="#updateUser" class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a>
		&nbsp;&nbsp; 
		<a id="deleteUser" href="javascript:(0)"><span title="Delete selected User" style="font-size: 20px;" class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
	</div>
</div>

  <!-- <form class="form-inline" style="padding-left:2%">
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
  </form> -->
  
  <div class="table-responsive">
  		<table class="table table-bordered hover" id="userTable">
		<thead class="thead-inverse table-header" style="">
				<tr>
					<th>#</th>
					<th>Username</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Emp Code</th>
					<th>Contact No</th>
					<th></th>
					<th>Department</th>
					<th>Status</th>
					<th></th>
					<th>Role</th>
				</tr>
		</thead>
		<tfoot>
			<tr>
				<th>#</th>
					<th>Username</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Emp Code</th>
					<th>Contact No</th>
					<th></th>
					<th>Department</th>
					<th>Status</th>
					<th></th>
					<th>Role</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach items="${userList}" var="user" varStatus="row">
				<tr onclick="">
					<td scope="row">${row.index +1}</td>
					<td>${user.username}</td>
					<td>${user.firstName}</td>
					<td>${user.lastName}</td>
					<td>${user.empCode}</td>
					<td>${user.contactNo}</td>
					<td>${user.department.id}</td>
					<td>${user.department.name}</td>
					<td>
						<c:if test="${user.enabled == true}">Enabled</c:if>
						<c:if test="${user.enabled == false}">Disabled</c:if>
					</td>
					<td>
						<c:choose>
						    <c:when test="${user.userRoles.size() == 1}">
						        ${user.userRoles.iterator().next().userRoleId}<br/>
						    </c:when>
						    <%-- <c:when test="${user.userRoles.size() > 1}">
						        
						    </c:when> --%>
						    <c:otherwise>
						    </c:otherwise>
						</c:choose>
					
					</td>
					<td>
						<c:choose>
						    <c:when test="${user.userRoles.size() == 1}">
						        ${user.userRoles.iterator().next().role}<br/>
						    </c:when>
						   <%--  <c:when test="${user.userRoles.size() > 1}">
						        
						    </c:when> --%>
						    <c:otherwise>
						    </c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		</div>
		
		<!-- <div class="modal fade page-normal-font" id="userDetails" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        	<div class="modal-header app-modal-header">
        <h4 class="modal-title">User Details</h4>
      </div>
       
            Modal Body
            <div class="modal-body app-modal-content bg-alt">
                
                <form role="form">
                  <div class="form-group">
                    <label for="inputModalUsername">Username: </label>
                      <input type="text" class="form-control" value=""
                      id="inputModalUsername" disabled="disabled"/>
                  </div>
                  <div class="form-group">
                    <label for="inputModalFirstName">First Name: </label>
                      <input type="text" class="form-control" value=""
                      id="inputModalFirstName" disabled="disabled"/>
                  </div>
                  <div class="form-group">
                    <label for="inputModalLastName">LastName: </label>
                      <input type="text" class="form-control" value=""
                      id="inputModalLastName" disabled="disabled"/>
                  </div>
                  
                </form>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
            
        </div>
    </div>
</div> -->

<div class="modal fade page-normal-font" id="addUser" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content app-modal-content bg-alt">
        
        	<div class="modal-header app-modal-header">
        <h4 class="modal-title">Enter User Details</h4>
      </div>
       
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form role="form" id="userForm">					
                  <div class="form-group">
                    <label for="inputModalEmpCode">Emp Code: </label>
                      <input name="empCode" type="number" class="form-control"
                      placeholder="Employee Code" id="inputModalEmpCode"/>
                  </div>
                  <div class="form-group">
                    <label for="inputModalUsername">Username: </label>
                      <input name="username" type="text" class="form-control" 
                      placeholder="Username" id="inputModalUsername"/>
                  </div>
                  <div class="form-group">
                    <label for="inputModalFirstName">First Name: </label>
                      <input name="firstName" type="text" class="form-control" 
                      placeholder="First Name" id="inputModalFirstName"/>
                  </div>
                  <div class="form-group">
                    <label for="inputModalLastName">Last Name: </label>
                      <input name="lastName" type="text" class="form-control" 
                      placeholder="Last Name" id="inputModalLastName"/>
                  </div>
                  <div class="form-group">
                    <label for="inputContactNo">Contact No: </label>
                      <input name="contactNo" type="number" class="form-control" 
                      placeholder="Contact No" id="inputContactNo"/>
                  </div>
                  <div class="form-group">
                    <label for="inputModalDepartment">Department: </label>
                    <select class="form-control" name="deptId" id="inputModalDepartment">
							<c:forEach  items="${deptList}" var="dept" varStatus="row">
								<option value="${dept.id}">${dept.name}</option>
							</c:forEach>
						</select>
                  </div>
                  <div class="form-group">
                    <label for="inputModalUserRole">Role: </label>
                    	<select class="form-control" name="userRole" id="inputModalUserRole">
							<option value="ROLE_USER" selected>ROLE_USER</option>
  							<option value="ROLE_ISSUER">ROLE_ISSUER</option>
  							<option value="ROLE_APPROVER">ROLE_APPROVER</option>
  							<option value="ROLE_ADMIN" >ROLE_ADMIN</option>
						</select>
                  </div>
                  <div class="form-group">
                    <label for="inputEnabled">Enable: </label>
                      <input name="enabled" type="checkbox" checked="checked" value="true"
                      id="inputEnabled"/>
                      <input name="enabled" type="hidden" value="false">
                  </div>
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div id="createErrorMessage" class="alert alert-danger" style="display: none;"></div>
					<div id="createSuccessMessage" class="alert alert-success" style="display: none;"></div>
                </form>
                <button type="button" class="btn btn-primary" id="saveBtn">Save</button>
				<button type="button" class="btn btn-primary" onclick=""
					id="closeBtn" data-dismiss="modal">Close</button>
            </div>
            
        </div>
    </div>
</div>

<div class="modal fade page-normal-font" id="updateUser" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content app-modal-content bg-alt">
        
        	<div class="modal-header app-modal-header">
        <h4 class="modal-title">Enter User Details</h4>
      </div>
       
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form role="form" id="updateUserForm" >
                  <div class="form-group">
                    <label for="inputUpdateUsername">Username: </label>
                      <input type="text" name="username" class="form-control" readonly
                      id="inputUpdateUsername"/>
                  </div>
                  <div class="form-group">
                    <label for="inputUpdateEmpCode">Emp Code: </label>
                      <input type="number" name="empCode" class="form-control" 
                      id="inputUpdateEmpCode"/>
                  </div>
                  <div class="form-group">
                    <label for="inputUpdateFirstName">First Name: </label>
                      <input type="text" name="firstName" class="form-control" 
                      id="inputUpdateFirstName"/>
                  </div>
                  <div class="form-group">
                    <label for="inputUpdateLastName">Last Name: </label>
                      <input type="text" name="lastName" class="form-control" 
                      id="inputUpdateLastName"/>
                  </div>
                  <div class="form-group">
                    <label for="inputUpdateContactNo">Contact No: </label>
                      <input type="number" name="contactNo" class="form-control" 
                      id="inputUpdateContactNo"/>
                  </div>
                  <div class="form-group">
                    <label for="inputUpdateDepartment">Department: </label>
                    <select class="form-control" name="deptId" id="inputUpdateDepartment">
							<c:forEach  items="${deptList}" var="dept" varStatus="row">
								<option value="${dept.id}">${dept.name}</option>
							</c:forEach>
						</select>
                  </div>
                  <div class="form-group">
                    <label for="inputUpdateUserRole">Role: </label>
                    	<select class="form-control" name="userRole" id="inputUpdateUserRole">
							<option value="ROLE_USER" selected>ROLE_USER</option>
  							<option value="ROLE_ISSUER">ROLE_ISSUER</option>
  							<option value="ROLE_APPROVER">ROLE_APPROVER</option>
  							<option value="ROLE_ADMIN" >ROLE_ADMIN</option>
						</select>
                  </div>
                  <div class="form-group">
                    <label for="inputUpdateEnabled">Enable: </label>
                      <input name="enabled" type="checkbox" checked="checked" value="true"
                      id="inputUpdateEnabled"/>
                      <input name="enabled" type="hidden" value="false">
                  </div>
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div id="updateErrorMessage" class="alert alert-danger" style="display: none;"></div>
					<div id="updateSuccessMessage" class="alert alert-success" style="display: none;"></div>
                </form>
                <button type="button" class="btn btn-primary" id="updateBtn">Update</button>
				<button type="button" class="btn btn-primary" onclick=""
					id="closeUpdateBtn" data-dismiss="modal">Close</button>
            </div>
            
        </div>
    </div>
</div>

<script>

$(function() {
	var selectedRow = 0;
	var export_filename = 'User';
	var table = $('#userTable').DataTable({
		dom : '<"top"B>rft<"bottom"lip><"clear">',
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
			} 
		] ,
		columnDefs: [
			{
				"targets": [ 6 ],
				"visible": false,
				"searchable": false
			},
			{
				"targets": [ 9 ],
				"visible": false,
				"searchable": false
			}
		]
	});
				
	$('#userTable tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
			selectedRow = 0;
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			selectedRow = table.row( this ).data();
		}
	});
	$('#userTable tfoot th').each(function() {
		var title = $(this).text();
	    $(this).html('<input style="width:100%" type="text" placeholder="Search '+title+'" />');
	});
	// Apply the search
	enableSearch(table)
	
	$('#addUser').on('shown.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
	});
	$('#addUser').on('hidden.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
		reloadUserPage();
	});
	$('#updateUser').on('shown.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
	});
	$('#updateUser').on('hidden.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
		reloadUserPage();
	});
	function resetModalForm() {
		$('#inputModalEmpCode').val('').end();
		$('#inputModalUsername').val('');
		$('#inputModalFirstName').val('').end();
		$('#inputModalLastName').val('');
		$('#inputContactNo').val('').end();
		$('#inputModalDepartment').val('');
	}
	function resetModalAlerts() {
		$('#createErrorMessage').hide();
		$('#createSuccessMessage').hide();
		$('#updateErrorMessage').hide();
		$('#updateSuccessMessage').hide();
	}
	
	function reloadUserPage() {
		document.getElementById('userMenuLink').click();
	}
	
	$('#saveBtn').click(function() {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		$.ajax({
			type : "POST",
			url : "createUser",
			data : $("#userForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('createSuccessMessage','<spring:message code="user.create.success" />');
					document.getElementById("userForm").reset();
				} else if (data.status == 0) {
					showErrorMessage('createErrorMessage',data.message);//code to show error
				} else {
					showErrorMessage('createErrorMessage','Unknow error');
				}
				$.unblockUI();
				$(_this).prop('disabled',false);
			}//success end
		});//ajax end
	});//onclik end
	
	$('#editUser').click(function(){
		if(selectedRow == 0){
			showAlertDialog('Please select row to edit');
			return false;
		}
		$('#inputUpdateUsername').val(selectedRow[1]);
		$('#inputUpdateFirstName').val(selectedRow[2]);
		$('#inputUpdateLastName').val(selectedRow[3]);
		$('#inputUpdateEmpCode').val(selectedRow[4]);
		$('#inputUpdateContactNo').val(selectedRow[5]);
		$('#inputUpdateDepartment').val(selectedRow[6]);
		if(selectedRow[8] == "Enabled") {
			$('#inputUpdateEnabled').prop('checked', true);
		}
		else {
			$('#inputUpdateEnabled').prop('checked', false);
		}
		
	});
	
	$('#updateBtn').click(function() {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		$.ajax({
		type : "POST",
		url : "updateUser",
		data : $("#updateUserForm").serialize(),
		success : function(data) {
			if (data.status == 1) {
				showSuccessMessage('updateSuccessMessage','<spring:message code="user.update.success" />');
				resetModalForm();
			} else if (data.status == 0) {
				showErrorMessage('updateErrorMessage',data.message);//code to show error
			} else {
				showErrorMessage('updateErrorMessage','Unknow error');
			}
			$.unblockUI();
			$(_this).prop('disabled',false);
		}//success end
	});//ajax end
	});
	
	$('#deleteUser').click(function(){
		if(selectedRow == 0){
			showAlertDialog('Please select row to delete');
			return false;
		}
		$.ajax({
			type : "POST",
			url : "deleteUser",
			data : {username:selectedRow[1],${_csrf.parameterName}:'${_csrf.token}'},
			success : function(data) {
				if (data.status == 1) {
					showAlertDialog('<spring:message code="user.delete.success" />');
					reloadUserPage();
				} else {
					showAlertDialog('Unknow error');
				}
			}//success end
		});//ajax end
	});
});

</script>