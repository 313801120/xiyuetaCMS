$(function() {
	//2.返回顶部

	$('.gotop').click(function() {

		$('body,html').animate({
			scrollTop: 0
		}, 300);
		return false;

	});
	$('#gotop').click(function() {

		$('body,html').animate({
			scrollTop: 0
		}, 300);
		return false;

	});
	//导航
	$(".daohang").click(function() {
		if($(".nav").css("display") == "none") {
			$(".nav").css("display", "block");
		} else if($(".nav").css("display") == "block") {
			$(".nav").css("display", "none");
		}
	})
})