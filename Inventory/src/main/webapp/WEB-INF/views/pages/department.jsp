<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="row">
		<div class="col-md-6">
		<h3 style="padding-left: 1%; padding-top: 2%"><strong>Department</strong></h3>
	</div>
		<div class="col-md-6 text-right" style="padding-right:2%;padding-top:2%">
		<a href="javascript:(0)"><span title="Add New Department" style="font-size:20px;" 
		data-toggle="modal" data-target="#addDepartment"
		class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a>
		&nbsp;&nbsp;
		<a id="editDepartment" href="javascript:(0)"><span title="Edit selected Department" style="font-size:20px;" 
		data-toggle="modal" data-target="#updateDepartment"
		class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a>
		&nbsp;&nbsp;
		<a id="deleteDepartment" href="javascript:(0)"><span title="Delete selected Department" style="font-size:20px;" 
		class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
		<!-- <button type="button" id="addPO" data-toggle="tooltip" title="Add New PO" class="glyphicon glyphicon-plus"></button> -->
		<!-- <button type="button" id="deletePO" data-toggle="tooltip" title="Edit PO" class="glyphicon glyphicon-edit"></button>
		<button type="button" id="deletePO" data-toggle="tooltip" title="Delete PO" class="glyphicon glyphicon-trash"></button> -->
		</div>
	</div>

  <div class="table-responsive">
		<table class="table table-bordered hover" id="deptTable">
			<thead class="thead-inverse table-header" style="">
				<tr>
					<th>#</th>
					<th></th>
					<th>Department</th>
					<th>Description</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>#</th>
					<th></th>
					<th>Department</th>
					<th>Description</th>
				</tr>
			</tfoot>
			<tbody>
				<c:forEach items="${deptList}" var="dept" varStatus="row">
				<tr onclick="">
					<td scope="row">${row.index +1}</td>
					<td>${dept.id}</td>
					<td>${dept.name}</td>
					<td>${dept.description}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
</div>

<div class="modal fade page-normal-font" id="addDepartment" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter Department Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form" id="deptForm">
					<div class="form-group">
						<label for="inputDeptName">Department Name: </label> <input
							type="text" name="name" class="form-control"
							id="inputDeptName" placeholder="Department Name"/>
					</div>
					<div class="form-group">
						<label for="inputDesc">Description:</label> <input type="text" name="description" 
							class="form-control" id="inputDesc" placeholder="Description" />
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

<div class="modal fade page-normal-font" id="updateDepartment" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter Department Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form" id="updateDeptForm">
					<input type="hidden" name ="id" id="inputDeptId" value=""/>
					<div class="form-group">
						<label for="inputUpdateDeptName">Department Name: </label> <input
							type="text" name="name" class="form-control"
							id="inputUpdateDeptName" />
					</div>
					<div class="form-group">
						<label for="inputUpdateDesc">Description:</label> <input type="text" name="description" 
							class="form-control" id="inputUpdateDesc" />
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div id="updateErrorMessage" class="alert alert-danger" style="display: none;"></div>
					<div id="updateSuccessMessage" class="alert alert-success" style="display: none;"></div>
				</form>
				<button type="button" class="btn btn-primary" id="updateBtn">Update</button>
				<button type="button" class="btn btn-primary" onclick=""
					id="closeBtn" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>	
	
<script>

$(function() {
	
	var selectedRow = 0;
	var export_filename = 'Department';
	var table = $('#deptTable').DataTable({
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
				"targets": [ 1 ],
				"visible": false,
				"searchable": false
		    }
		]
	});
				
	$('#deptTable tbody').on( 'click', 'tr', function () {
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
	$('#deptTable tfoot th').each(function() {
		var title = $(this).text();
	    $(this).html('<input style="width:100%" type="text" placeholder="Search '+title+'" />');
	});
	// Apply the search
	enableSearch(table)
	
	$('#addDepartment').on('shown.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
	});
	$('#addDepartment').on('hidden.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
		reloadUserPage();
	});
	$('#updateDepartment').on('shown.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
	});
	$('#updateDepartment').on('hidden.bs.modal', function(e) {
		resetModalForm();
		resetModalAlerts();
		reloadUserPage();
	});
	function resetModalForm() {
		$('#inputDeptName').val('').end();
		$('#inputDesc').val('');
	}
	function resetModalAlerts() {
		$('#createErrorMessage').hide();
		$('#createSuccessMessage').hide();
		$('#updateErrorMessage').hide();
		$('#updateSuccessMessage').hide();
	}
	
	function reloadUserPage() {
		document.getElementById('deptMenuLink').click();
	}
	
	$('#saveBtn').click(function() {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		$.ajax({
			type : "POST",
			url : "createDepartment",
			data : $("#deptForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('createSuccessMessage','<spring:message code="department.create.success" />');
					document.getElementById("deptForm").reset();
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
	
	$('#editDepartment').click(function(){
		if(selectedRow == 0){
			showAlertDialog('Please select row to edit');
			return false;
		}
		$('#inputDeptId').val(selectedRow[1]);
		$('#inputUpdateDeptName').val(selectedRow[2]);
		$('#inputUpdateDesc').val(selectedRow[3]);		
	});
	
	$('#updateBtn').click(function() {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		$.ajax({
		type : "POST",
		url : "updateDepartment",
		data : $("#updateDeptForm").serialize(),
		success : function(data) {
			if (data.status == 1) {
				showSuccessMessage('updateSuccessMessage','<spring:message code="department.update.success" />');
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
	
	$('#deleteDepartment').click(function(){
		if(selectedRow == 0){
			showAlertDialog('Please select row to delete');
			return false;
		}
		$.ajax({
			type : "POST",
			url : "deleteDepartment",
			data : {id:selectedRow[1],${_csrf.parameterName}:'${_csrf.token}'},
			success : function(data) {
				if (data.status == 1) {
					showAlertDialog('<spring:message code="department.delete.success" />');
					reloadUserPage();
				} else {
					showAlertDialog('Unknow error');
				}
			}//success end
		});//ajax end
	});
});

</script>	