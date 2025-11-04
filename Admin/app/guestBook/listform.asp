<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
tableName = ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(66)&ChrW(111)&ChrW(111)&ChrW(107)
winTitle = ChrW(21451)&ChrW(24773)&ChrW(38142)&ChrW(25509)
dim msg,isTrue,sql,addSql,id,title,guestname,tel,email,address,bodycontent,reply,isthrough
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
guestname=request(ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
tel=request(ChrW(116)&ChrW(101)&ChrW(108))
email=request(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
address=request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
reply=request(ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121))
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
if isthrough="" then isthrough=null
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& title &ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&addsql

rs.open sql,conn,1,3
if not rs.eof then
msg=ChrW(26631)&ChrW(39064)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
else
rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=title
rs(ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=guestname
rs(ChrW(116)&ChrW(101)&ChrW(108))=tel
rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))=email
rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))=address
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent
rs(ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121))=reply
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(105)&ChrW(112))=getIP()
if checkEnLanguage() then
end if
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
id=rs(ChrW(105)&ChrW(100))
title=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
guestname=rs(ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
tel=rs(ChrW(116)&ChrW(101)&ChrW(108))
email=rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
address=rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
reply=rs(ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
end if
else
isthrough=1
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
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 0px 0 0 0;">
<div class="layui-tab" lay-filter="test-hash">
<ul class="layui-tab-title">
<li class="layui-this" lay-id="11">中文设置</li>
<%if checkEnLanguage() then%><li lay-id="22">英文设置</li> <%end if%>
</ul>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>标题</label>
<div class='layui-input-inline'>
<input type='text' name='title' placeholder='请输入标题'autocomplete='off' class='layui-input' value="<%=title%>" >
</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>姓名</label>
<div class='layui-input-inline'>
<input type='text' name='guestname' placeholder='请输入姓名'autocomplete='off' class='layui-input' value="<%=guestname%>" >
</div><!--guestname-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>电话</label>
<div class='layui-input-inline'>
<input type='text' name='tel' placeholder='请输入电话'autocomplete='off' class='layui-input' value="<%=tel%>" >
</div><!--tel-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>邮箱</label>
<div class='layui-input-inline'>
<input type='text' name='email' placeholder='请输入邮箱'autocomplete='off' class='layui-input' value="<%=email%>" >
</div><!--email-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>地址</label>
<div class='layui-input-inline'>
<input type='text' name='address' placeholder='请输入地址'autocomplete='off' class='layui-input' value="<%=address%>" >
</div><!--address-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>留言内容</label>
<div class='layui-input-block'>
<textarea name='bodycontent' <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39),"")%> placeholder='请输入留言内容' class='layui-textarea'style='height:300px'><%=bodycontent%></textarea>
</div><!--bodycontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>回复内容</label>
<div class='layui-input-block'>
<textarea name='reply' <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121)&ChrW(39),"")%> placeholder='请输入回复内容' class='layui-textarea'style='height:300px'><%=reply%></textarea>
</div><!--reply-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核</label>
<div class='layui-input-inline'>
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isthrough-->
</div>
</div>
<%if checkEnLanguage() then%>
<div class="layui-tab-item"> 
</div>
<%end if%>
<div class="layui-form-item layui-hide">
<input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
</div>
</div>
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
var i = $(this).parent().find("input").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
} 
//正常上传图片
upload.render({
elem: '#layuiadmin-upload-001,#layuiadmin-upload-002,#layuiadmin-upload-003',
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
//回复
var en_editor = layui.tinymce;
var en_edit = en_editor.render({
selector: "#reply",
images_upload_url: '/api/upload/?act=tinymce',//图片上传接口
height: 500
});
//？提醒   借鉴于别人20230309
$(".icon-wenhao").hover(function(){
var thetxt = $(this).attr("data-txt");
var tips = layer.tips(thetxt, this , {
tips: [1, '#000'] //还可配置颜色
,time: 50000
});
},function(){
layer.closeAll('tips');
})
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
