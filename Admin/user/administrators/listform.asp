<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
tableName=ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)
winTitle=ChrW(31649)&ChrW(29702)&ChrW(21592)
dim sql,title,id,msg,addsql,username,isThrough,nickname,pwd,isTrue,pic,sex,level,email,tel,bodyContent,permission,grouping,iplimitlist
dim splxx,i,s
id=request(ChrW(105)&ChrW(100))
username=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
nickname=request(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
pwd=phptrim(request(ChrW(112)&ChrW(119)&ChrW(100)))
pic=request(ChrW(112)&ChrW(105)&ChrW(99))
sex=request(ChrW(115)&ChrW(101)&ChrW(120))
level=request(ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108))
email=request(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
tel=request(ChrW(116)&ChrW(101)&ChrW(108))
bodyContent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
iplimitlist=request(ChrW(105)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
if level="" then level=2
permission=replace(request(ChrW(112)&ChrW(101)&ChrW(114)&ChrW(109)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)),ChrW(32),"")
permission=replace(permission,ChrW(44),ChrW(124))
grouping=request(ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(105)&ChrW(110)&ChrW(103))
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0)

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if pwd <>"" then
if len(pwd) >=4 then
pwd=myMD5(pwd)
else
msg=ChrW(23494)&ChrW(30721)&ChrW(35201)&ChrW(22823)&ChrW(20110)&ChrW(52)&ChrW(20301)&ChrW(23383)&ChrW(31526)
isTrue=false
end if 
end if
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& username &ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&addsql,conn,1,3
if not rs.eof then
msg=ChrW(29992)&ChrW(25143)&ChrW(21517)&ChrW(31216)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
else
rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=username 
rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=nickname 

if level <>1 then
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
end if
rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))=email
rs(ChrW(116)&ChrW(101)&ChrW(108))=tel
rs(ChrW(112)&ChrW(105)&ChrW(99))=pic
rs(ChrW(115)&ChrW(101)&ChrW(120))=sex
rs(ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108))=level 
rs(ChrW(112)&ChrW(101)&ChrW(114)&ChrW(109)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110))=permission
rs(ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(105)&ChrW(110)&ChrW(103))=grouping 
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodyContent 
rs(ChrW(105)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=iplimitlist
if pwd <>"" then rs(ChrW(112)&ChrW(119)&ChrW(100))=pwd

if checkEnLanguage() then  

end if
if pwd <>"" then rs(ChrW(112)&ChrW(119)&ChrW(100))=pwd
rs.update 
if id <>"" then
call addSystemLog(tableName,ChrW(32534)&ChrW(36753)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41))
else
call addSystemLog(tableName,ChrW(28155)&ChrW(21152)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41))
end if
call die(ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(59)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62))
end if:rs.close 
end if

elseif id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
username=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
nickname=rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
id=rs(ChrW(105)&ChrW(100)) 
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))  
pic=rs(ChrW(112)&ChrW(105)&ChrW(99))  
sex=rs(ChrW(115)&ChrW(101)&ChrW(120))  
level=rs(ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108))  
if isnul(rs(ChrW(112)&ChrW(101)&ChrW(114)&ChrW(109)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)))=false then
permission=replace(rs(ChrW(112)&ChrW(101)&ChrW(114)&ChrW(109)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)),ChrW(32),"")
end if
email=rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
tel=rs(ChrW(116)&ChrW(101)&ChrW(108))
bodyContent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
grouping=rs(ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(105)&ChrW(110)&ChrW(103))
iplimitlist=rs(ChrW(105)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
end if
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=winTitle%>添加修改</title> 
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
<script type="text/javascript" src="../../js/jquery.js"></script>
<link href="../../css/nprogress.min.css" rel="stylesheet"/>  
<script src="../../js/nprogress.min.js"></script>
</head>
<body>   
<%if msg <>"" then  call rw(ChrW(60)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62)& msg &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(62))%>
<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
<div class="layui-form-item">
<label class="layui-form-label">角色</label>
<div class="layui-input-inline">
<select name="level" lay-verify="">
<%
splxx=split(adminLevelList,ChrW(44))
for i=0 to ubound(splxx)
s=splxx(i)
if s <>"" then
call rw(ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& i &ChrW(34)&ChrW(32)& IIF(level=i,ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"") &ChrW(62)& s &ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62))
end if
next
%>  
</select> 
</div> 
</div>
<div class="layui-form-item">
<label class="layui-form-label">用户名</label>
<div class="layui-input-inline">
<input type="text" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="<%=username%>">
</div>
</div>    
<div class="layui-form-item">
<label class="layui-form-label">登陆密码</label>
<div class="layui-input-inline">      
<input name="pwd" type="text" class="layui-input" placeholder="<%=IIF(id="",ChrW(35831)&ChrW(36755)&ChrW(20837)&ChrW(23494)&ChrW(30721),ChrW(19981)&ChrW(20462)&ChrW(25913)&ChrW(30041)&ChrW(31354))%>"/>
</div>
</div> 
<div class="layui-form-item">
<label class="layui-form-label">昵称</label>
<div class="layui-input-inline">
<input type="text" name="nickname" lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input" value="<%=nickname%>">
</div>
</div>
<div class="layui-form-item" lay-filter="sex">
<label class="layui-form-label">性别</label>
<div class="layui-input-inline">
<select name="sex">
<option value="男">男</option>
<option value="女"<%=IIF(sex=ChrW(22899),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>女</option>
<option value="保密"<%=IIF(sex=ChrW(20445)&ChrW(23494),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>保密</option>
</select>
</div>
</div>
<div class="layui-form-item" lay-filter="grouping">
<label class="layui-form-label">分组</label>
<div class="layui-input-inline"> 
<%=getXiyuetaColumnSubInputList(ChrW(21518)&ChrW(21488)&ChrW(29992)&ChrW(25143)&ChrW(20998)&ChrW(32452),ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(105)&ChrW(110)&ChrW(103),1)%>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">头像</label>
<div class="layui-input-inline">
<input type="text" name="pic" id="pic" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic%>">
</div>
<button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
</div>
<div class="layui-form-item">
<label class="layui-form-label">邮箱</label>
<div class="layui-input-inline">
<input type="text" name="email" placeholder="请输入邮箱" class="layui-input" value="<%=email%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">手机</label>
<div class="layui-input-inline">
<input type="text" name="tel" placeholder="请输入手机" class="layui-input" value="<%=tel%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">备注</label>
<div class="layui-input-block">
<textarea name="bodyContent" placeholder="请输入文章内容" class="layui-textarea"><%=bodyContent%></textarea>
</div>
</div>  
<%if level <>1 then%>
<div class="layui-form-item">
<label class="layui-form-label">权限列表</label>
<div class="layui-input-block">
<%
dim splstr,sList,j,checked 
splstr=split(adminPermissionLits,ChrW(44)) 
for i=0 to ubound(splstr)
sList=splstr(i)
splxx=split(sList,ChrW(124))
for j=0 to ubound(splxx)
s=splxx(j)
checked=""
if instr(ChrW(124)&permission&ChrW(124),ChrW(124)&s&ChrW(124))>0 then checked=ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)
if j=0 then
%>
<div class="checkbox15" style="padding:10px 0;">
<input type="checkbox" lay-filter="rule" name="permission" value="<%=s%>" data_biaoji="<%=i%>" lay-skin="primary" title="<%=s%>" <%=checked%>>
</div>
<div class="layui-form-item" style="margin-bottom:3px; padding-bottom:16px;border-bottom:1px solid #ccc;">
<%else%>
<div class="layui-input-inline" style="margin-right:10px;">
<input type="checkbox" data-rule="<%=i%>" name="permission" value="<%=s%>" lay-skin="primary" title="<%=s%>"  <%=checked%>>
</div>
<% 
end if
if j=ubound(splxx) then
call rw(ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf)
end if
next
next
%>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">审核状态</label>
<div class="layui-input-inline">
<input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
</div>  
<%end if%>
<div class="layui-form-item">
<label class="layui-form-label">限制IP
<i class="layui-icon layui-icon-tips" lay-tips="限制登录IP列表，以空格或换行分割"></i>
</label>
<div class="layui-input-block">
<textarea name="iplimitlist" placeholder="请输入限制登录IP" class="layui-textarea"><%=iplimitlist%></textarea>
</div>
</div>  
<div class="layui-form-item layui-hide">
<input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
</div>
</div> 
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../../js/pc.js?v6"></script>
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate;
var a = (layui.laytpl, layui.setter, layui.view, layui.admin);
//查看图片
a.events.avartatPreview = function(t) {
var i = $("#pic").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
}
//正常上传图片
upload.render({
elem: '#layuiadmin-upload-image',
url: '/api/upload/',
done: function(res) {
if(res.code!=0){              
layer.msg(res.msg, {icon: 2}); 
}else{
if(typeof(res.data[0])!="undefined"){
var imgSrc=res.data[0].src;
}else{
var imgSrc=res.data.src;
}
$(this.item).prev("div").children("input").val(imgSrc)
}
}
});
lay('.date').each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy-MM-dd'
});
});
lay('.time').each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy-MM-dd HH:mm:ss'
});
});
//编码器 旧版
// var layedit = layui.layedit;
// layedit.set({
//     //暴露layupload参数设置接口 --详细查看layupload参数说明
//     uploadImage: { 
//         url: '/api/upload/?act=one'    //上传接口url
//         ,type: 'post' //默认post 
//     }
//     ,uploadVideo: {
//                 url: '/api/upload/uploadVideo.asp?act=one',
//                 accept: 'video',
//                 acceptMime: 'video/*',
//                 exts: 'mp4|flv|avi|rm|rmvb',
//                 size: '20480'
//             }
//     , tool: [
//                 'colorpicker', 'html',  'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'face'
//                 , '|', 'left', 'center', 'right', '|', 'link', 'unlink','images', 'image_alt', 'video', 'anchors'
//                 , '|','table', 'fullScreen', 'image'
//             ]
// });
// layedit.build('bodycontent');   //建立编辑器
//编辑器初始化
var editor = layui.tinymce;
var edit = editor.render({
selector: "#bodycontent",
images_upload_url: '/api/upload/?act=tinymce',//图片上传接口
height: 500
});
//英文编辑器初始化
var en_editor = layui.tinymce;
var en_edit = en_editor.render({
selector: "#en_bodycontent",
images_upload_url: '/api/upload/?act=tinymce',//图片上传接口
height: 500
});
//监听多选框点击事件  通过 lay-filter="rule"来监听
form.on('checkbox(rule)', function (data) {
　　let val = $(this).attr("data_biaoji");//data.value;
if(data.elem.checked){
//判断当前多选框是选中还是取消选中
$("input[data-rule='"+val+"']").prop("checked", true);//true:选中 false:不选中
}
else{
$("input[data-rule='"+val+"']").prop("checked", false);
}
form.render();//实时渲染选中和不选中的样式
});
//角色选择，为超级管理员，则隐藏权限列表
form.on('select(level)',function(obj){       
if($(this).text()=='超级管理员'){
$("#rulelayout").hide();
}else{
$("#rulelayout").show();
}
});
})
pasteImage("pic");
// 配置nprogress的一些基本选项（可选）  
NProgress.configure({ showSpinner: true }); // 隐藏加载时的旋转器  
// 监听页面加载事件  
document.addEventListener('DOMContentLoaded', startProgress); // DOM 完全加载并解析完成，不包括样式表、图片和子框架的加载  
window.addEventListener('load', stopProgress); // 页面完全加载完成，包括样式表、图片和子框架  
function startProgress() {  
NProgress.start(); // 开始显示进度条  
}  
function stopProgress() {  
NProgress.done(); // 进度条完成  
}  
</script>
</body>
</html>
