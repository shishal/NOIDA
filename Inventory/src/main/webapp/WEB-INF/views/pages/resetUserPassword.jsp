<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3 style="padding:2%">Reset User Password :</h3>
<form role="form" id="resetUserPasswordForm" style="width: 60%; padding-left: 10%; padding-top: 5%;">
	<div class="form-group">
		<label for="selectItemType">Username</label> <input name="userName"
			class="form-control" id="inputUserName">
	</div>
	<div class="form-group">
		<label for="selectItemType">NewPassword</label> <input type="password" name="newPassword"
			class="form-control" id="inputNewPassword">
	</div>
	<div class="form-group">
		<label for="selectItemType">Confirm Password</label> <input type="password" name="repeatPassword"
			class="form-control" id="inputRepeatPassword">
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<button type="button" class="btn btn-primary" id="saveBtn" >Save</button>
	<button type="reset" class="btn btn-primary" id="resetBtn" >Clear</button>
</form>

<script>
	//When the document is ready
$(function() {
	
	$('#saveBtn').click(function() {
		$.ajax({
			type : "POST",
			url : "updatePasswordForUser",
			data : $("#resetUserPasswordForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessDialog('Password reset successfully.');
					$("#resetBtn").click();
				} else if (data.status == 0) {
					showAlertDialog(data.message);
				} else {
					showAlertDialog('Unknow error');
				}
			}//success end
		});//ajax end
	});//onclik end
});
</script>
