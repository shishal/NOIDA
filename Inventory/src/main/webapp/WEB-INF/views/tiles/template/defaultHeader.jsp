<div class="row" style="background-color: #343434; color: white;">
	<div class="col-md-6">
		<img
			src="${pageContext.request.contextPath}/static/img/noida-logo.gif"
			class="img-rounded img-responsive" alt="Cinque Terre" width="70%" height="10%">
	</div>
	<div class="col-md-6 text-right">
		<h2>IT Inventory Management System</h2>
	</div>

</div>

<div class="modal fade page-normal-font" id="requestDetails"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Request Details</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body">

				<form role="form">
					<div class="form-group">
						<label for="inputRequestNumber">Request Number: </label> <input
							type="text" class="form-control" value="ABC123"
							id="inputRequestNumber" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputRequestNumber">Asset Type: </label> <input
							type="text" class="form-control" value="Laptop"
							id="inputRequestNumber" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputRequestNumber">Asset Sub Type: </label> <input
							type="text" class="form-control" value="MacBook Air"
							id="inputRequestNumber" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputRequestNumber">Quantity: </label> <input
							type="text" class="form-control" value="4"
							id="inputRequestNumber" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputRequestNumber">Raised By: </label> <input
							type="text" class="form-control" value="Ravi"
							id="inputRequestNumber" disabled="disabled" />
					</div>
					<div class="form-group">
						<label for="inputRequestNumber">Date: </label> <input type="text"
							class="form-control" value="15-June-2016" id="inputRequestNumber"
							disabled="disabled" />
					</div>
				</form>
				<button type="button" class="btn btn-primary">Close</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade page-normal-font" id="appAlertDialog"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-alert-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">!! Alert !!</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade page-normal-font" id="appSuccessDialog"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-success-modal-header ">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">!! Success !!</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade page-normal-font" id="appInfoDialog"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header app-info-modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">!! Info !!</h4>
			</div>

			<!-- Modal Body -->
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
			</div>

		</div>
	</div>
</div>