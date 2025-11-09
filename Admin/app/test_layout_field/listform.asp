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
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName) & addsql

rs.open sql,conn,1,3
if not rs.eof then
msg=ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
else
rs.close  
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=title
rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=fieldtitle
rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=fieldname
rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=fieldtype
rs(ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))=textareaheight
rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))=fieldconfig
rs(ChrW(100)&ChrW(105)&ChrW(118)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=divtype
rs(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=inputtype
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough

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
<label class='layui-form-label'>标题</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='title' placeholder='请输入标题' autocomplete='off' class='layui-input' value="<%=inputCL(title)%>"  lay-verify='required'>
</div>
<div class="layui-form-mid layui-text-em">唯一标题，查看用</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段标题</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='fieldtitle' placeholder='请输入字段标题' autocomplete='off' class='layui-input' value="<%=inputCL(fieldtitle)%>"  lay-verify='required'>
</div>
<div class="layui-form-mid layui-text-em">字段在界面里显示标题</div><!--fieldtitle-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段名称</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='fieldname' placeholder='请输入字段名称' autocomplete='off' class='layui-input' value="<%=inputCL(fieldname)%>"  lay-verify='required'>
</div>
<div class="layui-form-mid layui-text-em">字段显示名称</div><!--fieldname-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段类型</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(25991)&ChrW(26412)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(22810)&ChrW(34892)&ChrW(25991)&ChrW(26412)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(45)&ChrW(32534)&ChrW(36753)&ChrW(22120)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(45)&ChrW(26159)&ChrW(21542)&ChrW(95)&ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111)&ChrW(45)&ChrW(21333)&ChrW(36873)&ChrW(26694)&ChrW(95)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(45)&ChrW(22797)&ChrW(36873)&ChrW(26694)&ChrW(95)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(45)&ChrW(25968)&ChrW(23383)&ChrW(95)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(36135)&ChrW(24065)&ChrW(95)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(45)&ChrW(26085)&ChrW(26399)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(26102)&ChrW(38388)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(45)&ChrW(19978)&ChrW(20256)&ChrW(95)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(45)&ChrW(26631)&ChrW(31614)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(45)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(45)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(45)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(45)&ChrW(39068)&ChrW(33394)&ChrW(36873)&ChrW(25321)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(25353)&ChrW(38062)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(35780)&ChrW(20998)&ChrW(95)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(45)&ChrW(31359)&ChrW(26797)&ChrW(26694)&ChrW(95)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(115)&ChrW(102)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(29366)&ChrW(24577)&ChrW(25552)&ChrW(31034)&ChrW(95)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(45)&ChrW(21160)&ChrW(20316)&ChrW(23383)&ChrW(27573)&ChrW(95)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),fieldtype)%>
</div>
<div class="layui-form-mid layui-text-em">根据选择不同类型来操作</div><!--fieldtype-->
</div>
<div class='layui-form-item' id="textareaheight">
<label class='layui-form-label'>文本域高</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='textareaheight' placeholder='请输入文本域高' autocomplete='off' class='layui-input' value="<%=inputCL(textareaheight)%>" >
</div><!--textareaheight-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段配置<i class="layui-icon icon-wenhao" data-txt="如：-男_1-女_2-保密_0 或-10-20-30，或inputNumberStep_0.01为编辑页可输入小数位数，或showimg_80_40为列表页显示图片宽高，或columnclass_newclass为循环另一个表项目，或columnoneclass_layout\_field_id_title_where isthrough=1_fieldName为一级列表">&#xe607;</i> </label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='fieldconfig' placeholder='请输入字段配置' autocomplete='off' class='layui-input' value="<%=inputCL(fieldconfig)%>" >
</div><!--fieldconfig-->
<div style="width:100px" class='layui-input-inline layui-input-wrap'>                        <%=showOnLineSelectHtml(ChrW(122)&ChrW(104)&ChrW(117)&ChrW(106)&ChrW(105)&ChrW(97)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(45)&ChrW(40664)&ChrW(35748)&ChrW(95)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(45)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(45)&ChrW(34920)&ChrW(35760)&ChrW(24405)&ChrW(24635)&ChrW(25968)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(33719)&ChrW(24471)&ChrW(73)&ChrW(80)&ChrW(22320)&ChrW(22336)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(45)&ChrW(26174)&ChrW(31034)&ChrW(22270)&ChrW(29255)&ChrW(95)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(45)&ChrW(19978)&ChrW(20256)&ChrW(95)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(45)&ChrW(33719)&ChrW(24471)&ChrW(34920)&ChrW(20449)&ChrW(24687)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(45)&ChrW(21015)&ChrW(34920)&ChrW(21152)&ChrW(36733)&ChrW(35843)&ChrW(29992)&ChrW(20989)&ChrW(25968)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(67)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),zhujiafieldconfig)%>
</div><!--zhujiafieldconfig-->
</div>
<div class='layui-form-item' id="labelparamedit" style="display:none;">
<label class='layui-form-label'>参数设置：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=labelparamedit%>
</div><!--labelparamedit-->
<div style="width:130px" class='layui-input-inline layui-input-wrap'><input type='text' name='param1' placeholder='请输入参数1' autocomplete='off' class='layui-input' value="<%=inputCL(param1)%>" >
</div><!--param1-->
<div style="width:140px" class='layui-input-inline layui-input-wrap'><input type='text' name='param2' placeholder='请输入参数2' autocomplete='off' class='layui-input' value="<%=inputCL(param2)%>" >
</div><!--param2-->
<div style="width:140px" class='layui-input-inline layui-input-wrap'><input type='text' name='param3' placeholder='请输入参数3' autocomplete='off' class='layui-input' value="<%=inputCL(param3)%>" >
</div><!--param3-->
<div style="width:140px" class='layui-input-inline layui-input-wrap'><input type='text' name='param4' placeholder='请输入参数4' autocomplete='off' class='layui-input' value="<%=inputCL(param4)%>" >
</div><!--param4-->
<div style="width:140px" class='layui-input-inline layui-input-wrap'><input type='text' name='param5' placeholder='请输入参数5' autocomplete='off' class='layui-input' value="<%=inputCL(param5)%>" >
</div><!--param5-->
<div style="width:140px" class='layui-input-inline layui-input-wrap'><input type='text' name='param6' placeholder='请输入参数6' autocomplete='off' class='layui-input' value="<%=inputCL(param6)%>" >
</div><!--param6-->
<div style="width:140px" class='layui-input-inline layui-input-wrap'><input type='text' name='param7' placeholder='请输入参数7' autocomplete='off' class='layui-input' value="<%=inputCL(param7)%>" >
</div><!--param7-->
<div style="width:140px" class='layui-input-inline layui-input-wrap'><input type='text' name='param8' placeholder='请输入参数8' autocomplete='off' class='layui-input' value="<%=inputCL(param8)%>" >
</div><!--param8-->
<div style="width:140px" class='layui-input-inline layui-input-wrap'><input type='text' name='param9' placeholder='请输入参数9' autocomplete='off' class='layui-input' value="<%=inputCL(param9)%>" >
</div><!--param9-->
<div style="width:140px" class='layui-input-inline layui-input-wrap'><input type='text' name='param10' placeholder='请输入参数10' autocomplete='off' class='layui-input' value="<%=inputCL(param10)%>" >
</div><!--param10-->
<div style="width:120px" class='layui-input-inline layui-input-wrap'><button type="button" class="layui-btn layui-btn-sm layui-bg-normal" id="updateconfigbtn" lay-event="updateconfigbtn">更新配置</button>
</div><!--updateconfigbtn-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表单块类型</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(100)&ChrW(105)&ChrW(118)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(20869)&ChrW(32852)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(22359)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107),divtype)%>
</div>
<div class="layui-form-mid layui-text-em">input宽固定大小和宽全屏</div><!--divtype-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>input类型</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(40664)&ChrW(35748)&ChrW(95)&ChrW(45)&ChrW(25968)&ChrW(23383)&ChrW(95)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(23494)&ChrW(30721)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(45)&ChrW(38544)&ChrW(34255)&ChrW(22495)&ChrW(95)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(110),inputtype)%>
</div>
<div class="layui-form-mid layui-text-em">文本和数字</div><!--inputtype-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='sortrank' placeholder='请输入排序' autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>" >
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="是|否" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isthrough-->
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
// 查找select元素 -20250925
var selectElement = $('select[name="zhujiafieldconfig"]');
console.log('找到select元素:', selectElement.length);
if (selectElement.length > 0) {
// 定义参数显示配置函数
function setParamDisplay(selectedValue, isInitial) {
var labelparameditDiv = $('#labelparamedit');
var prefix = isInitial ? '初始状态：' : '';
// 工具函数：显示前 N 个参数，隐藏其余
function showFirstNParams(n) {
labelparameditDiv.show();
labelparameditDiv.find('input[name^="param"]').each(function(index){
var isVisible = index < n; // index 从 0 开始
var parent = $(this).parent();
if (isVisible) { parent.show(); } else { parent.hide(); }
});
}
// 工具函数：显示所有 10 个参数
function showAllParams() {
labelparameditDiv.show();
labelparameditDiv.find('input[name^="param"]').parent().show();
}
// 工具函数：隐藏整个参数区域
function hideAllParams() {
labelparameditDiv.hide();
}
// 根据选择的值显示不同数量的参数输入框
switch(selectedValue) {
case 'columnclass':
// 下拉菜单：显示前10个（全部显示）
showAllParams();
console.log(prefix + '下拉菜单：显示全部10个参数');
// 如果是下拉菜单，自动解析字段配置并填充参数
if (!isInitial) {
parseFieldConfigToParams();
}
break;
case 'gettablecount':
// 表记录总数：显示前6个
showFirstNParams(6);
console.log(prefix + '表记录总数：显示前6个参数');
break;
case 'getipaddr':
// 获得IP地址：显示前2个
showFirstNParams(2);
console.log(prefix + '获得IP地址：显示前2个参数');
break;
case 'listCallFunction':
// 列表加载调用函数：显示前2个
showFirstNParams(2);
console.log(prefix + '列表加载调用函数：显示前2个参数');
break;
case 'showimg':
// 显示图片：显示前3个
showFirstNParams(3);
console.log(prefix + '显示图片：显示前3个参数');
break;
case 'uploadfile':
// 上传：显示前2个
showFirstNParams(2);
console.log(prefix + '上传：显示前2个参数');
break;
case 'getTableInfo':
// 获得表信息：显示前7个
showFirstNParams(7);
console.log(prefix + '获得表信息：显示前7个参数');
break;
case 'null':
// 默认：隐藏整个参数设置区域
hideAllParams();
console.log(prefix + '隐藏参数设置区域');
break;
default:
// 其他选项：隐藏整个参数设置区域
hideAllParams();
console.log(prefix + '隐藏参数设置区域');
break;
}
}
// 解析字段配置并填充到参数输入框的函数
function parseFieldConfigToParams() {
// 清空所有参数输入框
$('input[name^="param"]').val('');
// 获取当前选择的字段配置类型
var currentType = $('select[name="zhujiafieldconfig"]').val();
// 第一个参数总是显示当前选择的动作类型
var param1Input = $('input[name="param1"]');
if (param1Input.length > 0) {
var actionName = getActionDisplayName(currentType);
param1Input.val(actionName);
// console.log('填充 param1 (动作类型):', actionName);
}
// 如果字段配置有内容，则解析并填充后续参数
var fieldConfigValue = $('input[name="fieldconfig"]').val();
if (fieldConfigValue) {
// console.log('开始解析字段配置:', fieldConfigValue);
// 先处理转义的下划线，将其替换为特殊标记
var tempValue = fieldConfigValue.replace(/\\_/g, 'XiYueTaCom');
console.log("tempValue",tempValue)
// 按_分割，但忽略转义的下划线
var parts = tempValue.split('_');
// 恢复转义的下划线
for (var i = 0; i < parts.length; i++) {
parts[i] = parts[i].replace(/XiYueTaCom/g, '_');
}
// console.log('分割后的部分:', parts);
// 从第一个参数开始，使用字段配置中的值
for (var i = 0; i < parts.length && i < 10; i++) {
var paramInput = $('input[name="param' + (i + 1) + '"]');
if (paramInput.length > 0) { 
paramInput.val(parts[i]);
// console.log('填充 param' + (i + 1) + ':', parts[i]);
}
}
// console.log('字段配置解析完成');
} else {
// console.log('字段配置为空，只设置动作类型');
}
}
// 获取动作类型的显示名称
function getActionDisplayName(actionType) {
// 直接返回动作类型的实际值，而不是中文名称
return actionType;
}
// 将参数重新连接并更新到字段配置的函数
function updateFieldConfigFromParams() {
var currentType = $('select[name="zhujiafieldconfig"]').val();
if (!currentType || currentType === 'null') {
console.log('请先选择字段配置类型');
return;
}
console.log('开始更新字段配置，当前类型:', currentType);
// 收集当前显示的参数值
var paramValues = [];
var visibleParams = $('#labelparamedit').find('input[name^="param"]:visible').parent().find('input[name^="param"]');
visibleParams.each(function() {
var value = $(this).val().trim();
if (value) {
value=value.replace(/_/g, '\\_');
paramValues.push(value);
}
});
if (paramValues.length === 0) {
console.log('没有找到有效的参数值');
return;
}
// 构建字段配置字符串：包含第一个参数（动作类型）和后续参数
var newFieldConfig = '';
if (paramValues.length > 0) {
// 包含所有参数，包括第一个参数（动作类型）
newFieldConfig = paramValues.join('_');
}
// 更新字段配置输入框
$('input[name="fieldconfig"]').val(newFieldConfig);
console.log('字段配置已更新为:', newFieldConfig);
// 显示成功提示
layer.msg('字段配置已更新', {icon: 1, time: 2000});
}
// 使用layui的form.on方法监听select变化
form.on('select(zhujiafieldconfig)', function(data) {
console.log('选择改变事件触发');
var selectedValue = data.value;
console.log('选择的值:', selectedValue);
// 调用参数显示配置函数
setParamDisplay(selectedValue, false); 
$('input[name="param1"]').val(selectedValue);
});
// 页面加载时执行一次，根据当前选择的值设置初始状态
var selectedValue = selectElement.val();
console.log('初始选择的值:', selectedValue);
// 调用参数显示配置函数设置初始状态
setParamDisplay(selectedValue, true);
// 绑定更新配置按钮事件
$('#updateconfigbtn').on('click', function() {
updateFieldConfigFromParams();
});
} else {
console.log('未找到select[name="zhujiafieldconfig"]元素');
} 
// 按字段类型显示/隐藏“文本域高” 20250905
var fieldtypeSelect = $('select[name="fieldtype"]');
function toggleTextareaHeightByFieldtype(value){
var show = (value === 'textarea' ||　value === 'editor' ||　value === 'transfer');
$('#textareaheight').toggle(show);
}
if(fieldtypeSelect.length > 0){
// 初始化
toggleTextareaHeightByFieldtype(fieldtypeSelect.val());
// 监听 layui 下拉
form.on('select(fieldtype)', function(data){
toggleTextareaHeightByFieldtype(data.value);
});
// 兜底：原生 change
fieldtypeSelect.on('change', function(){
toggleTextareaHeightByFieldtype($(this).val());
});
}
})
// pasteImage("pic");
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
