<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-6">
		<h3 style="padding-left: 1%; padding-top: 2%"><strong>Purchase Order</strong></h3>
	</div>
	<div class="col-md-6 text-right"
		style="padding-right: 2%; padding-top: 2%">
		<a href="#" id="createPO"><span title="Add New PO" style="font-size: 20px;" data-toggle="modal" data-target="#POModel" class="hidden-xs showopacity glyphicon glyphicon-plus"></span></a> &nbsp;&nbsp; 
		<a href="#" id="updatePO"><span title="Edit selected PO" style="font-size: 20px;" data-toggle="modal" data-target="#POModel" class="hidden-xs showopacity glyphicon glyphicon-edit"></span></a> &nbsp;&nbsp; 
		<a href="#" id="deletePO"><span title="Delete selected PO" style="font-size: 20px;" class="hidden-xs showopacity glyphicon glyphicon-trash"></span></a> &nbsp;&nbsp; 
	</div>
</div>
<div class="table-responsive">
	<table id="poTable" class="table table-bordered">
		<thead class="table-header" style="">
			<tr>
				<th>#</th>
				<th></th>
				<th>PO Number</th>
				<th>Vendor</th>
				<th>Date</th>
				<th>Description</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>#</th>
				<th></th>
				<th>PO Number</th>
				<th>Vendor</th>
				<th>Date</th>
				<th>Description</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach items="${poList}" var="po" varStatus="row">
				<tr onclick="">
					<th scope="row">${row.index +1}</th>
					<th>${po.id}</th>
					<td>${po.poNumber}</td>
					<td>${po.company}</td>
					<td><fmt:formatDate type="date"  value="${po.poDate}" pattern="dd-MM-yyyy" /></td>
					<td>${po.description}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="modal fade page-normal-font" id="POModel" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content ">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter PO Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body app-modal-content bg-alt">

				<form role="form" id="poForm">
					<input type="hidden" id="poId" name="id" value="" />
					<div class="form-group">
						<label for="inputPONumber">PO Number: </label> 
						<input type="text" name="poNumber" class="form-control" placeholder="PO Number" id="inputPONumber" />
					</div>
					<div class="form-group">
						<label for="inputVendor">Vendor: </label> 
						<input type="text" name="company" class="form-control" placeholder="Vendor" id="inputVendor" />
					</div>
					<div class="form-group">
						<label for="inputDate">Date</label>&nbsp;
						<div class="input-group date" data-provide="datepicker" data-date-format="dd-mm-yyyy">
							<input id="inputDate" type="text" name="poDate" class="form-control" placeholder="PO Date">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-th"></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="inputDesc">Description: </label> 
						<input type="text" name="desc" class="form-control"  placeholder="description"  id="inputDesc" />
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
	var export_filename = 'po';
	var table = $('#poTable').DataTable({
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
			{ "targets": [ 1 ], "visible": false, "searchable": false },
		]
	});
				
	$('#poTable tbody').on( 'click', 'tr', function () {
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
	$('#poTable tfoot th').each(function(index) {
		if(index==0) return;
		var title = $(this).text();
		$(this).html('<input type="text" style="width:100%" placeholder="Search '+title+'" />');
	});
	// Apply the search
	enableSearch(table)
	
	$('#createPO').click(function() {
		$('#saveBtn').show();
		$('#updateBtn').hide();
		resetModalForm();
		resetModalAlerts();
	});
	$('#POModel').on('hidden.bs.modal', function(e) {
		resetModalAlerts();
		reloadPOPage();
	});
	$('#saveBtn').click(function() {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		$.ajax({
			type : "POST",
			url : "createPO",
			data : $("#poForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('successMessage','<spring:message code="po.create.success" />');
					document.getElementById("poForm").reset();
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
	$('#updatePO').click(function(){
		$('#saveBtn').hide();
		$('#updateBtn').show();
		if(selectedRow == 0){
			showAlertDialog('Please select row to edit');
			return false;
		}
		$('#poId').val(selectedRow[1]);
		$('#inputPONumber').val(selectedRow[2]);
		$('#inputVendor').val(selectedRow[3]);
		$('#inputDate').val(selectedRow[4]);
		$('#inputDesc').val(selectedRow[5]);
	});
	$('#updateBtn').click(function() {
		$.blockUI({baseZ: 2000});
		var _this = this
		$(this).prop('disabled',true);
		$.ajax({
		type : "POST",
		url : "updatePO",
		data : $("#poForm").serialize(),
		success : function(data) {
			if (data.status == 1) {
				showSuccessMessage('successMessage','<spring:message code="po.update.success" />');
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
	$('#deletePO').click(function(){
		if(selectedRow == 0){
			showAlertDialog('Please select row to delete');
			return false;
		}
		$.ajax({
			type : "POST",
			url : "deletePO",
			data : {id:selectedRow[1],${_csrf.parameterName}:'${_csrf.token}'},
			success : function(data) {
				if (data.status == 1) {
					showAlertDialog('<spring:message code="po.delete.success" />');
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
		$('#poId').val('');
		$('#inputPONumber').val('');
		$('#inputVendor').val('');
		$('#inputDate').val('');
		$('#inputDesc').val('');
	}
	
	function reloadPOPage() {
		document.getElementById('poMenuLink').click();
	}
});//onload end
</script>
