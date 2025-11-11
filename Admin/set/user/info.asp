<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#include file="../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim msg,id  

if checkAdminRule(ChrW(22522)&ChrW(26412)&ChrW(36164)&ChrW(26009))=false then  
call die(ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(22522)&ChrW(26412)&ChrW(36164)&ChrW(26009)&ChrW(12305)&ChrW(26435)&ChrW(38480))    
elseif session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=-999 then
call die(ChrW(31995)&ChrW(32479)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(35843)&ChrW(35797)&ChrW(20351)&ChrW(29992)&ChrW(65292)&ChrW(19981)&ChrW(21487)&ChrW(20462)&ChrW(25913)&ChrW(36164)&ChrW(26009))   
end if
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then 
userrs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=request(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
userrs(ChrW(115)&ChrW(101)&ChrW(120))=request(ChrW(115)&ChrW(101)&ChrW(120))
userrs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))=request(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
userrs(ChrW(116)&ChrW(101)&ChrW(108))=request(ChrW(116)&ChrW(101)&ChrW(108))
userrs(ChrW(112)&ChrW(105)&ChrW(99))=request(ChrW(112)&ChrW(105)&ChrW(99))
userrs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
userrs.update        
call addSystemLog(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110),ChrW(35774)&ChrW(32622)&ChrW(25105)&ChrW(30340)&ChrW(36164)&ChrW(26009))
end if

function oneColumnClass_admin_role_SubInput(a)
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d,e
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not b.eof  
e=ChrW(32)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(100)
if a <>"" then
if cStr(a)=cStr(b(ChrW(105)&ChrW(100))) then e=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
c=c & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& b(ChrW(105)&ChrW(100)) &ChrW(34)& e &ChrW(62)& b(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(40)&b(ChrW(105)&ChrW(100))&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
b.movenext:wend:b.close
oneColumnClass_admin_role_SubInput=c
end function

function thisAddPrefix(a)  
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
thisAddPrefix=ChrW(96)&db_PREFIX&a&ChrW(96)
else
thisAddPrefix=ChrW(91)&db_PREFIX&a&ChrW(93)
end if
end function
%><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>设置我的资料</title>
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
<div class="layui-card-header">设置我的资料</div>
<div class="layui-card-body" pad15>
<div class="layui-form" lay-filter="">
<div class="layui-form-item">
<label class="layui-form-label">我的角色</label> 
<div class="layui-input-inline">
<select name="adminroleid" id="adminroleid" lay-filter="adminroleid" selected>
<%=oneColumnClass_admin_role_SubInput(userrs(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)))%>
</select>
</div>
<div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">用户名</label>
<div class="layui-input-inline">
<input type="text" name="username" value="<%=userrs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))%>" readonly class="layui-input" style="background-color:#F2F2F2;">
</div>
<div class="layui-form-mid layui-word-aux">不可修改。一般用于后台登入名</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">昵称</label>
<div class="layui-input-inline">
<input type="text" name="nickname" value="<%=userrs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))%>" lay-verify="required" autocomplete="off" placeholder="请输入昵称" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">性别</label>
<div class="layui-input-inline">
<select name="sex">
<option value="男">男</option>
<option value="女"<%=IIF(userrs(ChrW(115)&ChrW(101)&ChrW(120))=ChrW(22899),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>女</option>
<option value="保密"<%=IIF(userrs(ChrW(115)&ChrW(101)&ChrW(120))=ChrW(20445)&ChrW(23494),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>保密</option>
</select>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">头像</label>
<div class="layui-input-inline">
<input name="pic" id="LAY_avatarSrc" placeholder="图片地址" value="<%=userrs(ChrW(112)&ChrW(105)&ChrW(99))%>" class="layui-input">
</div>
<div class="layui-input-inline layui-btn-container" style="width: auto;">
<button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">
<i class="layui-icon">&#xe67c;</i>上传图片
</button>
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">手机</label>
<div class="layui-input-inline">
<input type="text" name="tel" value="<%=userrs(ChrW(116)&ChrW(101)&ChrW(108))%>" autocomplete="off" class="layui-input"><!--lay-verify="phone"-->
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">邮箱</label>
<div class="layui-input-inline">
<input type="text" name="email" value="<%=userrs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))%>" autocomplete="off" class="layui-input"><!-- lay-verify="email"-->
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">备注</label>
<div class="layui-input-block">
<textarea name="bodycontent" placeholder="请输入内容" class="layui-textarea"><%=userrs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))%></textarea>
</div>
</div>
<div class="layui-form-item">
<div class="layui-input-block"> 
<!-- 改成两个字，以便在手机端显示在一行 -->
<input type="submit" class="layui-btn" value="保存" lay-submit="lay-submit" />
<!-- <input type="submit" class="layui-btn" value="确认修改" lay-submit="lay-submit" /> -->
<%=msg%>
<button type="reset" class="layui-btn layui-btn-primary">重写</button>
<!-- <button type="reset" class="layui-btn layui-btn-primary">重新填写</button> -->
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
}).use(['index','form','upload','croppers'], function() {
var $ = layui.$,
croppers = layui.croppers
,upload = layui.upload
,a = (layui.laytpl, layui.setter, layui.view, layui.admin)
var device = layui.device();
//手机端
if (device.ios || device.android) { 
//正常上传图片
upload.render({
elem: '#LAY_avatarUpload',
url: '/api/upload/',
done: function(res) {              
if(typeof(res.data[0])!="undefined"){
var imgSrc=res.data[0].src;
}else{
var imgSrc=res.data.src;
}
$("input[name=pic]").val(imgSrc) 
}
}), a.events.avartatPreview = function(t) {
var i = layui.$("#LAY_avatarSrc").val();
layui.layer.photos({ photos: { title: "查看头像", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
}
}else{
//上传带截图
croppers.render({
elem: '#LAY_avatarUpload'
,saveW:150     //保存宽度
,saveH:150
,mark:1/1    //选取比例
,area:'900px'  //弹窗宽度
,url: "/api/upload/"  //图片上传接口返回和（layui 的upload 模块）返回的JOSN一样
,done: function(res){ //上传完毕回调
if(typeof(res.data[0])!="undefined"){
var imgSrc=res.data[0].src;
}else{
var imgSrc=res.data.src;
}
$("input[name=pic]").val(imgSrc) 
layer.closeAll('page');
}
}), a.events.avartatPreview = function(t) {
var i = layui.$("#LAY_avatarSrc").val();
layui.layer.photos({ photos: { title: "查看头像", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
}
}
})
</script>
</body>
</html>