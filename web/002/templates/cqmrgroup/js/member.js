$(function(){
	$("#memberform").Validform({
		tiptype:1,
		ajaxPost:true,
		callback:function(data){
			layer.msg(data.msg,{
				time: 1000
			},function(){
				if(data.url){
					layer.closeAll();
					window.location.href = data.url;
				}
			});
		}
	});
	$("#sendemailverify").click(function(){
		index = layer.load(2);
		$.post($(this).attr('ajaxurl'),{email: $("#email").val()},function(data){
			layer.msg(data.msg,{time: 1000});
			layer.close(index);
		},"json");
	});
	$("#logout").click(function(){
		$.post($(this).attr('ajaxurl'),function(data){
			layer.msg(data.msg,{
				time: 1000
			},function(){
				window.location.href = data.url;
			});
		},"json");
	});
	$("#payform").Validform({
		tiptype:1,
		ajaxPost:true,
		callback:function(data){
			if(data.type=='confirm'){
				if(data.param=='recharge'){
					btn = ['确定','取消'];
				}else{
					btn = ['确定','取消','刷新价格'];
				}
				layer.msg(data.msg, {
					time: 0,
					shade: 0.3,
					btnAlign:"c",
					btn: btn,
					yes: function(index){
						$.post(data.url,function(data){
							if(data.type=='pay_wxpay'){
								layer.msg(data.msg, {
									time: 0,
									shade: 0.3,
									btnAlign:"c",
									area: ['220px', '290px'],
									btn: ['稍后支付'],
									yes: function(index){
										window.location.href = data.url;
									}
								});
							}else if(data.type=='pay_alipay'){
								layer.msg(data.msg,{
									time: 1000
								},function(){
									$("body").append(data.url);
								});
							}else{
								layer.msg(data.msg,{
									time: 1000
								},function(){
									if(data.url){
										layer.closeAll();
										window.location.href = data.url;
									}
								});
							}
						},"json");
					},
					btn2: function(index){
						$.ajaxSettings.async = false;
						$.post(data.url,{type:'cancel'},function(data){},"json");
						window.location.reload();
					},
					btn3: function(index){
						$.post(data.url,{type:'reloadmoney'},function(data){
							$(".layui-layer-content").text(data.msg);
							$(".layui-layer-btn2").text("已刷新");
						},"json");
						return false;
					}
				});
			}else{
				layer.msg(data.msg,{
					time: 1000
				},function(){
					if(data.url){
						layer.closeAll();
						window.location.href = data.url;
					}
				});
			}
		}
	});
	$("#buyform").Validform({
		tiptype:1,
		ajaxPost:true,
		callback:function(data){
			if(data.msg=='nowbuy'){
				window.location.href = data.url;
			}else{
				layer.msg(data.msg,{
					time: 1000
				},function(){
					if(data.url){
						layer.closeAll();
						window.location.href = data.url;
					}
				});
			}
		}
	});
	//全选反选
	$("#checkall").click(function(){
		if($(this).is(':checked')){
			$("input[type='checkbox']").attr("checked","checked");
		}else{
			$("input[type='checkbox']").removeAttr("checked");				
		}
	});
	//点击更换验证码
	$("#verifycode_img").click(function(){
		var ts = Date.parse(new Date())/1000;
		$(this).attr("src", $(this).attr('ajaxurl')+"?id="+ts);
	});
});
//微信支付倒计时
function wxpay_countDown(time,id,timeouturl,checkorderurl){
	var day_elem = $(id).find('.day');
	var hour_elem = $(id).find('.hour');
	var minute_elem = $(id).find('.minute');
	var second_elem = $(id).find('.second');
	var end_time = new Date(time).getTime(),//月份是实际月份-1
	sys_second = (end_time-new Date().getTime())/1000;
	var timer = setInterval(function(){
		if (sys_second > 1) {
			sys_second -= 1;
			var day = Math.floor((sys_second / 3600) / 24);
			var hour = Math.floor((sys_second / 3600) % 24+day*24);
			var minute = Math.floor((sys_second / 60) % 60);
			var second = Math.floor(sys_second % 60);
			day_elem && $(day_elem).text(day);//计算天
			$(hour_elem).text(hour<10?"0"+hour:hour);//计算小时
			$(minute_elem).text(minute<10?"0"+minute:minute);//计算分钟
			$(second_elem).text(second<10?"0"+second:second);//计算秒杀
			if(hour==0 && minute==0 && second==0){
				ajaxurl = timeouturl;
			}else{
				ajaxurl = checkorderurl;
			}
			$.post(ajaxurl,function(data){
				if(data.msg){
					clearInterval(timer);
					layer.msg(data.msg,{
						time: 1000
					},function(){
						window.location.href = data.url;
					});
				}
			},"json");
		} else {
			clearInterval(timer);
		}
	}, 1000);
}
//重新发起支付
function repayment(repayurl){
	$.post(repayurl,function(data){
		if(data.type=='pay_wxpay'){
			layer.msg(data.msg, {
				time: 0,
				shade: 0.3,
				btnAlign:"c",
				area: ['220px', '290px'],
				btn: ['稍后支付'],
				yes: function(index){
					window.location.href = data.url;
				}
			});
		}else if(data.type=='pay_alipay'){
			layer.msg(data.msg,{
				time: 1000
			},function(){
				$("body").append(data.url);
			});
		}else{
			layer.msg(data.msg,{
				time: 1000
			},function(){
				if(data.url){
					layer.closeAll();
					window.location.href = data.url;
				}
			});
		}
	},"json");
}
//用户发起退款
function refund(refundurl){
	content = '<textarea placeholder="请填写退款理由" class="refundyucss" id="refunduser"></textarea>';
	layer.msg(content, {
		time: 0,
		shade: 0.3,
		btnAlign:"c",
		btn: ['确定','取消'],
		yes: function(index){
			$.post(refundurl,{refunduser:$("#refunduser").val()},function(data){
				layer.msg(data.msg,{
					time: 1000
				},function(){
					if(data.url){
						window.location.href = data.url;
					}
				});
			},"json");
		}
	});	
}