$(function() {
	obj.init();
});
var obj = {
	init: function() {
		this.Ban();
		this.sImg();
		this.Bind();
	},
	Ban: function() {
		$("#banner").owlCarousel({
			items: 1,
			loop: true,
			nav: true,
			navText: ['', ''],
			dots: true,
			autoplay: true,
			autoplayTimeout: 4000,
			autoplayHoverPause: true
		});
		$("#case").owlCarousel({
			items: 4,
			loop: true,
			nav: true,
			navText: ['', ''],
			dots: false,
			autoplay: true,
			autoplayTimeout: 4000,
			autoplayHoverPause: true,
			responsive : {
				// breakpoint from 0 up
				0 : {
					items:2,
						nav:true
				},
				// breakpoint from 480 up
				480 : {
				   items:2,
					nav:true
				},
				// breakpoint from 768 up
				768 : {
				   items:3,
					nav:true
				},
			   998 : {
				   items:4,
					nav:true
				}
			}
		});
		

	},

	sImg: function() {
		function img(m, t) {
			m.height((m.width() * t).toFixed(2));
		}
		img($(".case-item .case-img img"), 0.7);
		img($(".product-item a .product-img img"),0.7);

	},
	Bind:function(){
		$(".product-sidebar .list .tit i.iconfont").on("click",function(){
			var PtitleSiblings =  $(this).parent().parent().find("ul");
			if( PtitleSiblings.css("display") == "none"){
				 PtitleSiblings.css("display","block");
			}else{
				PtitleSiblings.css("display","none");
			}
		   
		});
		$(".header-daohang").on("click",function(){
			if($(".nav-fluid").css("display")=="none"){
				$(".nav-fluid").css("display","block");
			}else{
				$(".nav-fluid").css("display","none");
			}
		});
		
		$("#gotop").click(function(){
			$('html,body').animate({
				scrollTop:0
			},300)
		});
		$(".sub-sidebar-btn").on("click",function(){
			if($(".sub-sidebar-list").css("display")=="none"){
				$(".sub-sidebar-list").css("display","block");
				$(this).find("span").text("收起栏目");
				$(this).find("i.iconfont").addClass("icon-up_arrow").removeClass("icon-arrow2-bottom");
			}else{
				$(".sub-sidebar-list").css("display","none");
				$(this).find("span").text("展开栏目");
				$(this).find("i.iconfont").addClass("icon-arrow2-bottom").removeClass("icon-up_arrow");
			}
		})
	}

}