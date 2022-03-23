
//手机导航
// JavaScript Document
 	$( document ).ready(function() {
	$( '.sidebar' ).simpleSidebar({
		settings: {
			opener: '#open-sb',
			wrapper: '.wrapper',
			animation: {
				duration: 500,
				easing: 'easeOutQuint'
			}
		},
		sidebar: {
			align: 'right',
			width: 200,
			closingLinks: 'a',
		}
	});
});



$(function(){
$(".subNav").click(function(){
			// 修改数字控制速度， slideUp(500)控制卷起速度
			$(this).next(".navContent").slideToggle(500);
	})	
})





$(function(){
	$(".small_nav").hide();
	$(".nav li").hover(function(){
	$(this).find(".small_nav").show();
		}).mouseleave(function(){
			$(this).find(".small_nav").hide();
		});
})/**/

$(function(){
	$(".small_nav5_show").show();
	$(".nav5_list li a").click(function(){
		var a=$(this).siblings();
		if(a.is(":visible"))
		{
			a.slideUp(); 
		}
		else
		{
			a.slideDown();
		}
	});	
})



$(function(){
	$(".small_nav").hide();
	$(".nav li").mouseover(function(){
	$(this).find(".small_nav").show();
		}).mouseleave(function(){
			$(this).find(".small_nav").hide();
		});
})