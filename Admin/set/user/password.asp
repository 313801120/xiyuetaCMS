<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#include file="../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim icon,msg,id  

if checkAdminRule(ChrW(20462)&ChrW(25913)&ChrW(23494)&ChrW(30721))=false then  
call die(ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(20462)&ChrW(25913)&ChrW(23494)&ChrW(30721)&ChrW(12305)&ChrW(26435)&ChrW(38480))    
end if
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if userrs(ChrW(112)&ChrW(119)&ChrW(100)) <>mymd5(request(ChrW(111)&ChrW(108)&ChrW(100)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100))) then
icon=0
msg=ChrW(21407)&ChrW(23494)&ChrW(30721)&ChrW(19981)&ChrW(27491)&ChrW(30830)
call addSystemLog(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110),ChrW(20462)&ChrW(25913)&ChrW(23494)&ChrW(30721)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(24403)&ChrW(21069)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&request(ChrW(111)&ChrW(108)&ChrW(100)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)))
else
userrs(ChrW(112)&ChrW(119)&ChrW(100))=mymd5(request(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)))
userrs.update
icon=1
msg=ChrW(20462)&ChrW(25913)&ChrW(23494)&ChrW(30721)&ChrW(25104)&ChrW(21151)
call addSystemLog(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110),ChrW(20462)&ChrW(25913)&ChrW(23494)&ChrW(30721)&ChrW(25104)&ChrW(21151))
end if
end if
%><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>设置我的密码</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all">
</head>
<body>
<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save">
<div class="layui-fluid">
<div class="layui-row layui-col-space15">
<div class="layui-col-md12">
<div class="layui-card">
<div class="layui-card-header">修改密码</div>
<div class="layui-card-body" pad15>
<div class="layui-form" lay-filter="">
<div class="layui-form-item">
<label class="layui-form-label">原密码 <font color="red">*</font></label>
<div class="layui-input-inline">
<input type="password" name="oldPassword" lay-verify="required" lay-verType="tips" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">新密码 <font color="red">*</font></label>
<div class="layui-input-inline">
<input type="password" name="password" lay-verify="pass" lay-verType="tips" autocomplete="off" id="LAY_password" class="layui-input">
</div>
<div class="layui-form-mid layui-word-aux">5到16个字符</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">密码确认 <font color="red">*</font></label>
<div class="layui-input-inline">
<input type="password" name="repassword" lay-verify="repass" lay-verType="tips" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<div class="layui-input-block"> 
<input type="submit" class="layui-btn" value="确认修改" lay-submit="lay-submit" />
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'set']);
<%if msg <>"" then%>
layui.use(['layer'], function() {
var layer = layui.layer;
layer.msg('<%=msg%>', {icon: <%=icon%>,time: 2000})
});    
<%end if%>
</script>
</body>
</html>