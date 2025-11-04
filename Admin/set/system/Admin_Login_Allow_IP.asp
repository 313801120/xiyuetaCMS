<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#include file="../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<%  
call checkAdminPermission(ChrW(35774)&ChrW(32622)&ChrW(73)&ChrW(80)&ChrW(38480)&ChrW(21046))
dim content,msg,filePath
filePath=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(95)&ChrW(73)&ChrW(80)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116)
content=request(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
call writeToFile(filePath,content,"")
msg=ChrW(20445)&ChrW(23384)&ChrW(32)&ChrW(20801)&ChrW(35768)&ChrW(30331)&ChrW(24405)&ChrW(73)&ChrW(80)&ChrW(32)&ChrW(25104)&ChrW(21151)
else
content=readfile(filePath,"")
end if
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>允许登录IP</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all">
</head>
<body>
<form id="form1" name="form1" class="layui-form" method="post" action="?act=save">
<div class="layui-fluid">
<div class="layui-row layui-col-space15">
<div class="layui-col-md12">
<div class="layui-card">
<div class="layui-card-header">允许登录IP</div>
<div class="layui-card-body" pad15>
<div class="layui-form" wid100 lay-filter=""> 
<div class="layui-form-item">
<label class="layui-form-label">当前IP</label>
<div class="layui-input-block" style="line-height:38px;">  
<%=getIP()%>
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">IP列表</label>
<div class="layui-input-block">
<textarea name="content" class="layui-textarea" rows="12"><%=content%></textarea> 
</div>
</div>
<div class="layui-form-item">
<div class="layui-input-block">
<input type="submit" class="layui-btn" value="确认保存" lay-submit="lay-submit" />
<%=msg%>
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
elem: '#layuiadmin-upload-qrcode',
url: '/api/upload/',
done: function(res) {
$(this.item).prev("div").children("input").val(res.data[0].src)
}
});
//编码器
var layedit = layui.layedit;
layedit.set({
//暴露layupload参数设置接口 --详细查看layupload参数说明
uploadImage: {
url: '/api/upload/' //上传接口url
,
type: 'post' //默认post 
}
});
layedit.build('webfoot'); //建立编辑器
});
</script>
</body>
</html>