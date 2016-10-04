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

function tableRowSelection(id) {
	if($(id).hasClass("active"))
        $(id).removeClass('active');
    else
        $(id).addClass('active').siblings().removeClass('active');
}

function showSuccessMessage(message) {
	$('#successMessage').show();
	$('#successMessage').text(message);
}

function showErrorMessage(message) {
	$('#errorMessage').show();
	$('#errorMessage').text(message);
}


function printData()
{
var divToPrint=document.getElementById("printTable");
newWin= window.open("");
newWin.document.write(divToPrint.outerHTML);
newWin.print();
newWin.close();
}

