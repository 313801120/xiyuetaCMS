//表单提交
$(function(){
	$("#formform").Validform({
		tiptype:1,
		ajaxPost:true,
		callback:function(data){
			layer.msg(data.msg,{
				time: 1000
			},function(){
				if(data.url){
					layer.closeAll();
					$("#formform input,#formform textarea").val("");
					window.location.reload();
				}
			});
		}
	});
});