<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../inc/Config.asp"--><!--#Include File = "../admin_function.asp"--><!--#Include File = "../admin_safe.Asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台日志</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../layuiadmin/layui/layui.js"></script>
</head>
<body style="padding:20px 0px 30px 0px;">  
<div class="layui-fluid">
<div class="layui-row layui-col-space15">
<div class="layui-col-md12">
<div class="layui-card">
<div class="layui-card-header">
更新日志
</div>
<div class="layui-card-body ">
<ul class="layui-timeline">
<%=getHttpUrl(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(99)&ChrW(109)&ChrW(115)&ChrW(47)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(109)&ChrW(115)&ChrW(47)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(103),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))%> 
</ul>
</div>
</div>
</div>
</div>
</div>
<script>
layui.config({
base: '../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index'], function() { 
})
</script>
</body>
</html>  