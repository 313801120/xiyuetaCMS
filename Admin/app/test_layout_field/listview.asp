<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)
winTitle = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)
excludeAdminIDLIst=ChrW(45)&ChrW(57)&ChrW(57)&ChrW(57)
dim msg,isTrue,sql,addSql,id,title,fieldtitle,fieldname,fieldtype,textareaheight,fieldconfig,zhujiafieldconfig,labelparamedit,divtype,inputtype,sortrank,isthrough,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,updateconfigbtn
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
title=handleAspStrSafe(title)
fieldtitle=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
fieldtitle=handleAspStrSafe(fieldtitle)
fieldname=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
fieldname=handleAspStrSafe(fieldname)
fieldtype=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
fieldtype=handleAspStrSafe(fieldtype)
textareaheight=request(ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))
textareaheight=handleAspStrSafe(textareaheight)
fieldconfig=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))
fieldconfig=handleAspStrSafe(fieldconfig)
zhujiafieldconfig=request(ChrW(122)&ChrW(104)&ChrW(117)&ChrW(106)&ChrW(105)&ChrW(97)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))
labelparamedit=request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))
labelparamedit=handleAspStrSafe(labelparamedit)
divtype=request(ChrW(100)&ChrW(105)&ChrW(118)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
divtype=handleAspStrSafe(divtype)
inputtype=request(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
inputtype=handleAspStrSafe(inputtype)
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 
param1=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49))
param2=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(50))
param3=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(51))
param4=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(52))
param5=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(53))
param6=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(54))
param7=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(55))
param8=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(56))
param9=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(57))
param10=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49)&ChrW(48))
updateconfigbtn=request(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(98)&ChrW(116)&ChrW(110))
if id <>"" then
call showCheckAdminRule(ChrW(26597)&ChrW(30475) & winTitle) 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
id=rs(ChrW(105)&ChrW(100))
title=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
fieldtitle=rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
fieldname=rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
fieldtype=rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
textareaheight=rs(ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))
fieldconfig=rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))
divtype=rs(ChrW(100)&ChrW(105)&ChrW(118)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
inputtype=rs(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
end if
else
sortrank=20
isthrough=1
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
if not rs.eof then
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))+sortrank
end if:rs.close
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
<label class='layui-form-label'>标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=title%>
</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=fieldtitle%>
</div><!--fieldtitle-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段名称：</label>
<div class='layui-input-block layui-input-wrap'>
<%=fieldname%>
</div><!--fieldname-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段类型：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(25991)&ChrW(26412)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(22810)&ChrW(34892)&ChrW(25991)&ChrW(26412)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(45)&ChrW(32534)&ChrW(36753)&ChrW(22120)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(45)&ChrW(26159)&ChrW(21542)&ChrW(95)&ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111)&ChrW(45)&ChrW(21333)&ChrW(36873)&ChrW(26694)&ChrW(95)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(45)&ChrW(22797)&ChrW(36873)&ChrW(26694)&ChrW(95)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(45)&ChrW(25968)&ChrW(23383)&ChrW(95)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(36135)&ChrW(24065)&ChrW(95)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(45)&ChrW(26085)&ChrW(26399)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(26102)&ChrW(38388)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(45)&ChrW(19978)&ChrW(20256)&ChrW(95)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(45)&ChrW(26631)&ChrW(31614)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(45)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(45)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(45)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(45)&ChrW(39068)&ChrW(33394)&ChrW(36873)&ChrW(25321)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(25353)&ChrW(38062)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(35780)&ChrW(20998)&ChrW(95)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(45)&ChrW(31359)&ChrW(26797)&ChrW(26694)&ChrW(95)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(115)&ChrW(102)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(29366)&ChrW(24577)&ChrW(25552)&ChrW(31034)&ChrW(95)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(45)&ChrW(21160)&ChrW(20316)&ChrW(23383)&ChrW(27573)&ChrW(95)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),fieldtype)%>
</div><!--fieldtype-->
</div>
<div class='layui-form-item' id="textareaheight">
<label class='layui-form-label'>文本域高：</label>
<div class='layui-input-block layui-input-wrap'>
<%=textareaheight%>
</div><!--textareaheight-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段配置：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=fieldconfig%>
</div><!--fieldconfig-->
<div class='layui-input-inline layui-input-wrap'><%=getOnLineSelectValue(ChrW(122)&ChrW(104)&ChrW(117)&ChrW(106)&ChrW(105)&ChrW(97)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(45)&ChrW(40664)&ChrW(35748)&ChrW(95)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(45)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(45)&ChrW(34920)&ChrW(35760)&ChrW(24405)&ChrW(24635)&ChrW(25968)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(33719)&ChrW(24471)&ChrW(73)&ChrW(80)&ChrW(22320)&ChrW(22336)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(45)&ChrW(26174)&ChrW(31034)&ChrW(22270)&ChrW(29255)&ChrW(95)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(45)&ChrW(19978)&ChrW(20256)&ChrW(95)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(45)&ChrW(33719)&ChrW(24471)&ChrW(34920)&ChrW(20449)&ChrW(24687)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(45)&ChrW(21015)&ChrW(34920)&ChrW(21152)&ChrW(36733)&ChrW(35843)&ChrW(29992)&ChrW(20989)&ChrW(25968)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(67)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),zhujiafieldconfig)%>
</div><!--zhujiafieldconfig-->
</div>
<div class='layui-form-item' id="labelparamedit" style="display:none;">
<label class='layui-form-label'>参数设置：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=labelparamedit%>
</div><!--labelparamedit-->
<div class='layui-input-inline layui-input-wrap'><%=param1%>
</div><!--param1-->
<div class='layui-input-inline layui-input-wrap'><%=param2%>
</div><!--param2-->
<div class='layui-input-inline layui-input-wrap'><%=param3%>
</div><!--param3-->
<div class='layui-input-inline layui-input-wrap'><%=param4%>
</div><!--param4-->
<div class='layui-input-inline layui-input-wrap'><%=param5%>
</div><!--param5-->
<div class='layui-input-inline layui-input-wrap'><%=param6%>
</div><!--param6-->
<div class='layui-input-inline layui-input-wrap'><%=param7%>
</div><!--param7-->
<div class='layui-input-inline layui-input-wrap'><%=param8%>
</div><!--param8-->
<div class='layui-input-inline layui-input-wrap'><%=param9%>
</div><!--param9-->
<div class='layui-input-inline layui-input-wrap'><%=param10%>
</div><!--param10-->
<div class='layui-input-inline layui-input-wrap'><button type="button" class="layui-btn layui-btn-sm layui-bg-normal" id="updateconfigbtn" lay-event="updateconfigbtn">更新配置</button>
</div><!--updateconfigbtn-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表单块类型：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(100)&ChrW(105)&ChrW(118)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(20869)&ChrW(32852)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(22359)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107),divtype)%>
</div><!--divtype-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>input类型：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(40664)&ChrW(35748)&ChrW(95)&ChrW(45)&ChrW(25968)&ChrW(23383)&ChrW(95)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(23494)&ChrW(30721)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(45)&ChrW(38544)&ChrW(34255)&ChrW(22495)&ChrW(95)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(110),inputtype)%>
</div><!--inputtype-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序：</label>
<div class='layui-input-block layui-input-wrap'>
<%=sortrank%>
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isthrough=0,ChrW(21542),ChrW(26159))%>
</div><!--isthrough-->
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
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce','colorpicker','rate','transfer'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate,
colorpicker = layui.colorpicker;
var a = (layui.laytpl, layui.setter, layui.view, layui.admin);
//查看图片
a.events.avartatPreview = function(t) { 
var i = $(this).parent().find("input").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
} 
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
