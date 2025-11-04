<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"-->
<!--#Include File = "function.asp"--><% 


dim serverUrl,webinfo

call readWebsiteServerUrl(serverUrl,"",webinfo)
dim msg,addSql,tplid,saction,idlist,id,splstr,url,editHtmlContent
tplid=request(ChrW(116)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(100))
idlist=request(ChrW(105)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))  
url=serverUrl & ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(47)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(61)&tplid&ChrW(38)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(61)&webinfo
call echoB(ChrW(26381)&ChrW(21153)&ChrW(22120)&ChrW(22320)&ChrW(22336)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(85)&ChrW(114)&ChrW(108),serverUrl) 
editHtmlContent=gethttpurl( url,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改自定义模板</title> 
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
</head>
<body>  
<form id="form1" name="form1" class="layui-form"  method="post" action="<%=serverUrl%>/api/tpl/list/userfrom.asp?act=save&tplid=<%=tplid%>&info=<%=webinfo%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
<div class='layui-form-item'>
<label class='layui-form-label'>模板ID</label>
<div class='layui-input-inline'>
<input type='text' name='tplid' placeholder='请输入模板ID' autocomplete='off' disabled class='layui-input' value="<%=tplid%>">
</div>
</div>
<%=editHtmlContent%>
<div class="layui-form-item layui-hide">
<input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
</div>
</div> 
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','set','layedit'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate;
upload.render({
elem: '#layuiadmin-upload-useradmin',
url: '/api/upload/',
done: function(res) {
$(this.item).prev("div").children("input").val(res.data[0].src)
}
});
upload.render({
elem: '#layuiadmin-upload-useradmin2',
url: '/api/upload/',
done: function(res) {
$(this.item).prev("div").children("input").val(res.data[0].src)
}
});
lay('.date').each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy/MM/dd'
});
});
//编码器
var layedit = layui.layedit;
layedit.set({
//暴露layupload参数设置接口 --详细查看layupload参数说明
uploadImage: {
url: '/api/upload/'    //上传接口url
,type: 'post' //默认post 
}
});
layedit.build('bodycontent');   //建立编辑器
})
</script>
</body>
</html>
