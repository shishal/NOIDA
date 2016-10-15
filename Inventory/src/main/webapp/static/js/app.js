function htmlbodyHeightUpdate() {
	var height3 = $(window).height()
	var height1 = $('.nav').height() + 50
	height2 = $('.main').height()
	if (height2 > height3) {
		$('html').height(Math.max(height1, height3, height2) + 10);
		$('body').height(Math.max(height1, height3, height2) + 10);
	} else {
		$('html').height(Math.max(height1, height3, height2));
		$('body').height(Math.max(height1, height3, height2));
	}

}
$(document).ready(function() {
	htmlbodyHeightUpdate()
	$(window).resize(function() {
		htmlbodyHeightUpdate()
	});
	$(window).scroll(function() {
		height2 = $('.main').height()
		htmlbodyHeightUpdate()
	});
	
});

function appLogout() {
	document.getElementById("applicationlogout").click();
};

/*function tableRowSelection(id) {
	if($(id).hasClass("active"))
        $(id).removeClass('active');
    else
        $(id).addClass('active').siblings().removeClass('active');
}*/

function resetModalAlerts() {
	$('#successMessage').hide();
	$('#errorMessage').hide();
}

function showSuccessMessage(id, message) {
	$('#'+id).show();
	$('#'+id).text(message);
}

function showErrorMessage(id,message) {
	$('#'+id).show();
	$('#'+id).text(message);
}

function showAlertDialog(msg) {
	$('#appAlertDialog').find(".modal-body").text(msg);
	$('#appAlertDialog').modal('show');
}

function showSuccessDialog(msg) {
	$('#appSuccessDialog').find(".modal-body").text(msg);
	$('#appSuccessDialog').modal('show');
}

function showInfoDialog(msg) {
	$('#appInfoDialog').find(".modal-body").text(msg);
	$('#appInfoDialog').modal('show');
}

function generateBarcode() {
	resetModalAlerts();
	$("#barcodeImg").hide();
	$('#barcode').val('');
	var barCodeValue = $('#serialNumber').val();
	if(barCodeValue == "" ){
		showErrorMessage('errorMessage', "Serial Number can not be blank.")
	}
	else {
		$("#barcodeImg").show();
		$('#barcode').val(barCodeValue);
		$('#barcodeImg').JsBarcode(barCodeValue,{width:3,height:30});
		$('#printBarcodeBtn').attr("disabled", false);
	}
	
};

function printBarcodeImage(elem) {
    Popup($(elem).html());
}

function Popup(data) {
    var myWindow = window.open('', '', 'height=400,width=600');
    myWindow.document.write('<style>@page { size: auto;  margin: 0mm; }</style><html><head><title></title>');
    /*optional stylesheet*/ //myWindow.document.write('<link rel="stylesheet" href="main.css" type="text/css" />');
    myWindow.document.write('</head><body >');
    myWindow.document.write(data);
    myWindow.document.write('</body></html>');
    myWindow.document.close(); // necessary for IE >= 10

    myWindow.onload=function(){ // necessary if the div contain images

        myWindow.focus(); // necessary for IE >= 10
        myWindow.print();
        myWindow.close();
    };
}


