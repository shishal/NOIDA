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

function displayAlreadyGeneratedBarcode(barCode) {
	var initStr = "NDA";
	var idToBePrinted = barCode;
	
	resetModalAlerts();
	$("#barcodeImg").hide();
	$('#barcode').val('');
	var barCodeValue = idToBePrinted;
	if(barCodeValue == "" ){
		showErrorMessage('errorMessage', "Serial Number can not be blank.")
	}
	else {
		$("#barcodeImg").show();
		$('#barcode').val(barCodeValue);
		$('#barcodeImg').JsBarcode(barCodeValue,{width:3,height:30});
		$('#printBarcodeBtn').attr("disabled", false);
	}
}

function generateBarcode() {
	var initStr = "NDA";
	var idToBePrinted = $('#id').val();
	
	if($('#id').val() == "")
		idToBePrinted = Number(maxAssetId) + Number(1);
	
	if(idToBePrinted < 10){
		idToBePrinted = "00000" + idToBePrinted;
	}
	else if(idToBePrinted < 100){
		idToBePrinted = "0000" + idToBePrinted;
	}
	else if(idToBePrinted < 1000){
		idToBePrinted = "000" + idToBePrinted;
	}
	else if(idToBePrinted < 10000){
		idToBePrinted = "00" + idToBePrinted;
	}
	else if(idToBePrinted < 100000){
		idToBePrinted = "0" + idToBePrinted;
	}
	resetModalAlerts();
	$("#barcodeImg").hide();
	$('#barcode').val('');
	var barCodeValue = idToBePrinted;
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
	var assetTypeToBePrinted = $('#assetTypeId').find(":selected").text();
    var myWindow = window.open('', '', 'height=400,width=600');
    myWindow.document.write('<style>@page { size: auto;  margin: 0mm; }</style><html><head><title></title>');
    /*optional stylesheet*/ //myWindow.document.write('<link rel="stylesheet" href="main.css" type="text/css" />');
    myWindow.document.write('</head><body ><div>NOIDA-');
    myWindow.document.write(assetTypeToBePrinted);
    myWindow.document.write('</div>');
    myWindow.document.write(data);
    myWindow.document.write('</body></html>');
    myWindow.document.close(); // necessary for IE >= 10

    myWindow.onload=function(){ // necessary if the div contain images

        myWindow.focus(); // necessary for IE >= 10
        myWindow.print();
        myWindow.close();
    };
}

function showPoDetails(element,poNum, vendor, poDate, description) {
	
	element.title = " PO Details: \n------------------------\n PO Number: " 
		+ poNum + "  \n Vendor: " 
		+ vendor + "  \n PO Date: "
		+ poDate + "  \n Description: "
		+ description + "  \n   ";
    
};

function showAmcDetails(element, amcNumber, vendor, startDate, endDate, description) {
	element.title = " AMC Details: \n------------------------\n AMC Number: " 
		+ amcNumber + "  \n Vendor: " 
		+ vendor + "  \n Start Date: "
		+ startDate + "  \n End Date: "
		+ endDate + "  \n Description: "
		+ description + "  \n   ";
};

function showUserDetails(element, username) {
	var userDetail = userDetailList[username];
	
	element.title = " User Details: \n------------------------\n First Name: " 
		+ userDetail[1] + "  \n Last Name: " 
		+ userDetail[2] + "  \n Emp Code: " 
		+ userDetail[3] + "  \n Department: " 
		+ userDetail[4] + "  \n Contact No: " 
		+ userDetail[5] + "  \n " ;
};

function enableSearch(datatable){
	datatable.columns().every(function() {
		var that = this;
		$('input', this.footer()).on('keyup change',function() {
			if (that.search() !== this.value) {
				that.search(this.value).draw();
			}
		});
	});
}


