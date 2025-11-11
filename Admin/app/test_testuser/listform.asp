<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)
winTitle = ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)
excludeAdminIDLIst=ChrW(45)&ChrW(57)&ChrW(57)&ChrW(57)
dim msg,isTrue,sql,addSql,flags,jinqian,tp,bt,id
flags=ChrW(124)
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(104))=ChrW(111)&ChrW(110),ChrW(104)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(99))=ChrW(111)&ChrW(110),ChrW(99)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(102))=ChrW(111)&ChrW(110),ChrW(102)&ChrW(124),"") 
jinqian=request(ChrW(106)&ChrW(105)&ChrW(110)&ChrW(113)&ChrW(105)&ChrW(97)&ChrW(110))
if jinqian="" then jinqian=null
tp=request(ChrW(116)&ChrW(112))
bt=request(ChrW(98)&ChrW(116))
id=getStrToNumber(request(ChrW(105)&ChrW(100)))

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=""
if id <>"" then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName) & addsql

rs.open sql,conn,1,3
if not rs.eof and 1=2 then
msg=ChrW(26631)&ChrW(39064)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
else
rs.close  
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))=flags
rs(ChrW(106)&ChrW(105)&ChrW(110)&ChrW(113)&ChrW(105)&ChrW(97)&ChrW(110))=jinqian
rs(ChrW(116)&ChrW(112))=tp
rs(ChrW(98)&ChrW(116))=bt

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
call showCheckAdminRule(ChrW(26597)&ChrW(30475) & winTitle) 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
flags=rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))
jinqian=rs(ChrW(106)&ChrW(105)&ChrW(110)&ChrW(113)&ChrW(105)&ChrW(97)&ChrW(110))
tp=rs(ChrW(116)&ChrW(112))
bt=rs(ChrW(98)&ChrW(116))
end if
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if

function thisAddPrefix(a)  
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
thisAddPrefix=ChrW(96)&db_PREFIX&a&ChrW(96)
else
thisAddPrefix=ChrW(91)&db_PREFIX&a&ChrW(93)
end if
end function
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
<%%>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>flags</label>
<div class='layui-input-block layui-input-wrap'>
<div class="layui-form">
<input type="checkbox" name="flags_h" title="头条[h]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(104)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_c" title="推荐[c]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(99)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_f" title="幻灯[f]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(102)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
</div>
</div><!--flags-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>jinqian(测试)</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="0.001" lay-affix="number" type='number' name='jinqian' placeholder='请输入jinqian(测试)' autocomplete='off' class='layui-input' value="<%=inputCL(jinqian)%>"  lay-verify='required'>
</div><!--jinqian-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>头像tp</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='tp' placeholder='请输入头像tp' autocomplete='off' class='layui-input' value="<%=inputCL(tp)%>" >
</div><!--tp-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-tp"><i class="layui-icon">&#xe67c;</i>上传图片</button>
<input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="imgPreview">查看图片</button >
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标题</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='bt' placeholder='请输入标题' autocomplete='off' class='layui-input' value="<%=inputCL(bt)%>" >
</div><!--bt-->
</div>
</div>
<!-- 提交按钮需要，外部调用 -->
<div class="layui-form-item<%=IIF(request(ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116))=ChrW(49),"",ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101))%>">
<input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
</div>
</div>
</div>
</div>
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../../js/pc.js?v20250716_1"></script>
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce','colorpicker','rate','transfer','croppers'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate,
colorpicker = layui.colorpicker; 
var a = (layui.laytpl, layui.setter, layui.view, layui.admin);
//查看图片
a.events.imgPreview = function(t) { 
var i = $(this).parent().find("input").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
} 
// 上传图片 for tp
upload.render({
elem: '#upload-tp',
url: '/api/upload/',
accept: 'file',
exts: 'bmp|gif|jpg|jpeg|png|webp',
done: function(res) {
if(res.code!=0){              
layer.msg(res.msg, {icon: 2}); 
}else{
layer.msg(res.msg, {icon: 1}); 
if(typeof(res.data[0])!="undefined"){
var imgSrc=res.data[0].src;
}else{
var imgSrc=res.data.src;
}
//$(this.item).prev("div").children("input").val(imgSrc)
$("input[name='tp']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
}
});
})
// pasteImage("pic");
pasteImage('tp');
// 配置 nprogress 的基本选项（可选）  
NProgress.configure({ showSpinner: true }); // 显示/隐藏加载时的旋转器  
// 监听页面加载事件  
document.addEventListener('DOMContentLoaded', startProgress); // DOM 结构加载完成（不含样式、图片、子框架）  
window.addEventListener('load', stopProgress); // 页面所有资源加载完成（含样式、图片、子框架）  
function startProgress() {  
NProgress.start(); // 开始显示进度条  
}  
function stopProgress() {  
NProgress.done(); // 完成进度条  
}  
</script>
<!-- 标签显示代码块 --> 
</body>
</html>
