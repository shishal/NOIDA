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

$('#poTable tbody tr').on('click', function(event) {
	alert();
	  $(this).addClass('active').siblings().removeClass('active');
	});

$(".clickable-row").click(function(){
	alert();
    if($(this).hasClass("highlight"))
        $(this).removeClass('highlight');
    else
        $(this).addClass('highlight').siblings().removeClass('highlight');
});


function alerttest() {
	alert("hi");
	if($(this).hasClass("highlight"))
        $(this).removeClass('highlight');
    else
        $(this).addClass('highlight').siblings().removeClass('highlight');
}