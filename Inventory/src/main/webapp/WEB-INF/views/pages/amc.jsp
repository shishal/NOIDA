<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-6">
		<h4 style="padding-left: 2%; padding-top: 2%">AMC</h4>
	</div>
	<div class="col-md-6 text-right" style="padding-right: 2%; padding-top: 2%">
		<a  id="createAMC" href="#"><span title="Add New AMC" style="font-size: 20px;" data-toggle="modal" data-target="#AMCModel" class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a>&nbsp;&nbsp;
		<a  id="updateAMC" href="#"><span title="Edit selected AMC" style="font-size: 20px;" data-toggle="modal" data-target="#AMCModel" class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a> &nbsp;&nbsp;
		<a  id="deleteAMC" href="#"><span title="Delete selected AMC" style="font-size: 20px;" class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
	</div>
</div>

<div class="table-responsive">
<table class="table table-bordered" id="amcTable">
	<thead class="thead-inverse table-header" style="">
		<tr>
			<th>#</th>
			<th></th>
			<th>AMC Number</th>
			<th>Vendor</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Description</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th>#</th>
			<th></th>
			<th>AMC Number</th>
			<th>Vendor</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Description</th>
		</tr>
		</tfoot>
	<tbody>
		<c:forEach items="${amcList}" var="amc" varStatus="row">
				<tr onclick="">
					<th scope="row">${row.index +1}</th>
					<th>${amc.id}</th>
					<td>${amc.amcNumber}</td>
					<td>${amc.vendor}</td>
					<td><fmt:formatDate type="date"  value="${amc.startDate}" pattern="dd-MM-yyyy" /></td>
					<td><fmt:formatDate type="date"  value="${amc.endDate}" pattern="dd-MM-yyyy" /></td>
					<td>${amc.description}</td>
				</tr>
			</c:forEach>
	</tbody>
</table>
</div>

<div class="modal fade page-normal-font" id="AMCModel" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter AMC Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form" id="amcForm">
					<input type="hidden" id="amcId" name="id" value="" />
					<div class="form-group">
						<label for="inputAMCNumber">AMC Number: </label> 
						<input type="text" name="amcNumber" class="form-control" placeholder="AMC Number" id="amcNumber" />
					</div>
					<div class="form-group">
						<label for="inputVendor">Vendor: </label> 
						<input type="text" name="vendor" class="form-control" placeholder="Vendor" id="vendor" />
					</div>
					<div class="form-group">
						<label for="inputStartDate">Start Date</label>&nbsp;
						<div id="inputDate" class="input-group date" data-provide="datepicker" data-date-format="dd-mm-yyyy">
							<input type="text" name="startDate" class="form-control" id="startDate" placeholder="Start Date">
							<div class="input-group-addon"> <span class="glyphicon glyphicon-th"></span> </div>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEndDate">End Date</label>&nbsp;
						<div id="inputDate" class="input-group date" data-provide="datepicker" data-date-format="dd-mm-yyyy">
							<input type="text" class="form-control" name="endDate" id="endDate" placeholder="End Date">
							<div class="input-group-addon"> <span class="glyphicon glyphicon-th"></span></div>
						</div>
					</div>
					<div class="form-group">
						<label for="inputDesc">Description: </label> 
						<input type="text" name="desc" class="form-control" id="desc" placeholder="Description"/>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div id="errorMessage" class="alert alert-danger" style="display: none;"></div>
					<div id="successMessage" class="alert alert-success" style="display: none;"></div>
				</form>
				<button type="button" id="saveBtn" class="btn btn-primary">Save</button>
				<button type="button" id="updateBtn" class="btn btn-primary">Update</button>
				<button type="button" class="btn btn-primary" onclick="" id="closeBtn" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
	//When the document is ready
$(function() {
	var selectedRow = 0;
	var export_filename = 'amc';
	var table = $('#amcTable').DataTable({
		dom : '<"top"B>rft<"bottom"lp><"clear">',
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
		],
		columnDefs: [
			{ "targets": [ 1 ], "visible": false, "searchable": false }
		]
	});
				
	$('#amcTable tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
			selectedRow = 0;
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			selectedRow = table.row( this ).data();
			console.log(selectedRow)
		}
	});
	$('#amcTable tfoot th').each(function(index) {
		if(index==0) return;
		var title = $(this).text();
		$(this).html('<input type="text" style="width:100%" placeholder="Search '+title+'" />');
	});
	// Apply the search
	table.columns().every(function() {
		var that = this;
		$('input', this.footer()).on('keyup change',function() {
			if (that.search() !== this.value) {
				that.search(this.value).draw();
			}
		});
	});
	$('#createAMC').click(function() {
		$('#saveBtn').show();
		$('#updateBtn').hide();
		resetModalForm();
		resetModalAlerts();
	});
	$('#AMCModel').on('hidden.bs.modal', function(e) {
		resetModalAlerts();
		reloadPOPage();
	});
	$('#saveBtn').click(function() {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		$.ajax({
			type : "POST",
			url : "createAMC",
			data : $("#amcForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('successMessage','<spring:message code="amc.create.success" />');
					document.getElementById("amcForm").reset();
				} else if (data.status == 0) {
					showErrorMessage('errorMessage',data.message);//code to show error
				} else {
					showErrorMessage('errorMessage','Unknow error');
				}
				$.unblockUI();
				$(_this).prop('disabled',false);
			}//success end
		});//ajax end
	});//onclik end
	$('#updateAMC').click(function(){
		$('#saveBtn').hide();
		$('#updateBtn').show();
		if(selectedRow == 0){
			showAlertDialog('Please select row to edit');
			return false;
		}
		$('#amcId').val(selectedRow[1]);
		$('#amcNumber').val(selectedRow[2]);
		$('#vendor').val(selectedRow[3]);
		$('#startDate').val(selectedRow[4]);
		$('#endDate').val(selectedRow[5]);
		$('#desc').val(selectedRow[6]);
	});
	$('#updateBtn').click(function() {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		$.ajax({
		type : "POST",
		url : "updateAMC",
		data : $("#amcForm").serialize(),
		success : function(data) {
			if (data.status == 1) {
				showSuccessMessage('successMessage','<spring:message code="amc.update.success" />');
			} else if (data.status == 0) {
				showErrorMessage('errorMessage',data.message);//code to show error
			} else {
				showErrorMessage('errorMessage','Unknow error');
			}
			$.unblockUI();
			$(_this).prop('disabled',false);
		}//success end
	});//ajax end
	});
	$('#deleteAMC').click(function(){
		if(selectedRow == 0){
			showAlertDialog('Please select row to delete');
			return false;
		}
		$.ajax({
			type : "POST",
			url : "deleteAMC",
			data : {id:selectedRow[1],${_csrf.parameterName}:'${_csrf.token}'},
			success : function(data) {
				if (data.status == 1) {
					showAlertDialog('<spring:message code="amc.delete.success" />');
					reloadPOPage();
				} else {
					showAlertDialog('Unknow error');
				}
			}//success end
		});//ajax end
	});
	function resetModalAlerts() {
		$('#successMessage').hide();
		$('#errorMessage').hide();
	}
	function resetModalForm() {
		$('#amcId').val('');
		$('#amcNumber').val('');
		$('#vendor').val('');
		$('#startDate').val('');
		$('#endDate').val('');
		$('#desc').val('');
	}
	
	function reloadPOPage() {
		document.getElementById('amcMenuLink').click();
	}
});//onload end
</script>
