<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h3 style="padding:2%">Raise New Request :</h3>
<form style="width: 60%; padding-left: 10%; padding-top: 5%;" id="requestForm">
	<div class="form-group">
		<label for="selectItemType">Asset Type</label> 
		<select class="form-control" name="assetTypeId" id="assetTypeId">
		<option value="">Please Select</option>
			<c:forEach  items="${assetTypeList}" var="assetType" varStatus="row">
				<option value="${assetType.id}">${assetType.mainType}</option>
			</c:forEach>
		</select>
	</div>
	<div class="form-group">
		<label for="selectItemSubType">Asset Sub Type</label>
		<select class="form-control" name="assetSubTypeId" id="assetSubTypeId">
		</select>
	</div>
	<div class="form-group">
		<label for="inputItemQuantity">Quantity</label> 
		<input type="text" class="form-control" name="qty" id="qty">
	</div>
	<div class="form-group">
		<label for="desc">Description: </label> 
		<input type="text" class="form-control" placeholder="Description" id="desc" name="desc"/>
	</div>
	<button type="button" id="saveBtn"class="btn btn-primary" onclick="">Submit Request</button>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div id="errorMessage" class="alert alert-danger" style="display: none;"></div>
	<div id="successMessage" class="alert alert-success" style="display: none;"></div>
</form>
<script>
$(function(){
	resetMessage();
	$('#assetTypeId').change(function(){
		assetTypeId=this.value;
		$.ajax({
			type : "POST",
			url : "/assetSubTypeByAssetType",
			data : {assetTypeId:assetTypeId,${_csrf.parameterName}:'${_csrf.token}'},
			success : function(result) {
				$('#assetSubTypeId').empty();
				$.each(result.assetSubTypeMap,function(key,value){
					$('#assetSubTypeId').append('<option value="'+key+'">'+value+'</option>')
				});
			}//success end
		});//ajax end
	});
	$('#saveBtn').click(function() {
		resetMessage();
		$.ajax({
			type : "POST",
			url : "raiseRequest",
			data : $("#requestForm").serialize(),
			success : function(data) {
				if (data.status == 1) {
					showSuccessMessage('successMessage',data.msg);
					resetModalForm();
				} else {
					showErrorMessage('errorMessage','Unknow error');
				}
			}//success end
		});//ajax end
	});//onclik end
	function resetMessage(){
		$('#errorMessage, #successMessage').html('');
	}
	function resetModalForm() {
		$('#assetSubTypeId').val('');
		$('#assetTypeId').val('');
		$('#qty').val('');
		$('#desc').val('');
	}
});//onload end

</script>