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
flags=request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))
jinqian=request(ChrW(106)&ChrW(105)&ChrW(110)&ChrW(113)&ChrW(105)&ChrW(97)&ChrW(110))
if jinqian="" then jinqian=null
tp=request(ChrW(116)&ChrW(112))
bt=request(ChrW(98)&ChrW(116))
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
if id <>"" then
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

function showCheckboxDataTitle(a,b)
dim c,d,e,f
c=split(a,ChrW(45))
for each e in c
if instr(e,ChrW(95))>0 then
d=split(e,ChrW(95))
if instr(ChrW(124)&b&ChrW(124),ChrW(124)&d(1)&ChrW(124))>0 then
if f <>"" then f=f&ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(32)
f=f & d(0)
end if
end if
next
showCheckboxDataTitle=f
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
<style>.layui-input-inline,.layui-input-block{line-height:40px;color:#999;}</style></head>
<body>   
<%if msg <>"" then  call rw(ChrW(60)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62)& msg &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(62))%>
<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 0px 0 0 0;">
<div class="layui-tab" lay-filter="test-hash">
<%%>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>flags：</label>
<div class='layui-input-block layui-input-wrap'>
<%=showCheckboxDataTitle(ChrW(22836)&ChrW(26465)&ChrW(91)&ChrW(104)&ChrW(93)&ChrW(95)&ChrW(104)&ChrW(45)&ChrW(25512)&ChrW(33616)&ChrW(91)&ChrW(99)&ChrW(93)&ChrW(95)&ChrW(99)&ChrW(45)&ChrW(24187)&ChrW(28783)&ChrW(91)&ChrW(102)&ChrW(93)&ChrW(95)&ChrW(102),flags)%>                    </div><!--flags-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>jinqian(测试)：</label>
<div class='layui-input-block layui-input-wrap'>
<%=jinqian%>
</div><!--jinqian-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>头像tp：</label>
<div class='layui-input-block layui-input-wrap'>
<a href="<%=tp%>" target="_blank" title="点击查看"><%=IIF(tp <>"",tp,"")%></a>
</div><!--tp-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=bt%>
</div><!--bt-->
</div>
</div>
</div>
</div>
</div>
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../../js/pc.js?v20250716_1"></script>
<!-- 编辑页加载更多js文件 -->
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
//{编辑页上传图片JS块}
//{编辑器JS代码}
//{编辑页颜色选择器JS块}
//{编辑页时间选择器JS块} 
//{编辑页字段左边图标注释JS块}
})
// pasteImage("pic");
// 粘贴上传图片
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
