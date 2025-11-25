<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)
winTitle = ChrW(25991)&ChrW(31456)
excludeAdminIDLIst=ChrW(45)&ChrW(57)&ChrW(57)&ChrW(57)
dim msg,isTrue,sql,addSql,id,parentid,title,titlecolor,sortrank,smallimage,bigimage,author,filename,aboutcontent,bodycontent,webtitle,webkeywords,webdescription,tags,flags,tsfield_articledetail01,tsfield_articledetail02,tsfield_articledetail03,isthrough,ishtml,en_title,en_aboutcontent,en_bodycontent,en_webtitle,en_webkeywords,en_webdescription,createtime,updatetime,ip,tsfield_addr,createhtmltime
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
parentid=getStrToNumber(request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
if parentid="" then parentid=null
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
titlecolor=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
smallimage=request(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
bigimage=request(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
author=request(ChrW(97)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(114))
filename=request(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
aboutcontent=request(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
webtitle=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
webkeywords=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
webdescription=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
tags=request(ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115))
flags=request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 
ishtml=request(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
ishtml=IIF(ishtml=ChrW(111)&ChrW(110),1,0) 
en_title=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_aboutcontent=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_bodycontent=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_webtitle=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_webkeywords=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
en_webdescription=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
createtime=request(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
if createtime="" then createtime=null
updatetime=request(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
if updatetime="" then updatetime=null
ip=request(ChrW(105)&ChrW(112))
createhtmltime=request(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
if createhtmltime="" then createhtmltime=null
if id <>"" then
call showCheckAdminRule(ChrW(26597)&ChrW(30475) & winTitle) 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
id=rs(ChrW(105)&ChrW(100))
parentid=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
title=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
titlecolor=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
smallimage=rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
bigimage=rs(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
author=rs(ChrW(97)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(114))
filename=rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
aboutcontent=rs(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
webtitle=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
webkeywords=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
webdescription=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
tags=rs(ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115))
flags=rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))
tsfield_articledetail01=getFindIdToTableCount(rs(ChrW(105)&ChrW(100)),ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(99),ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49))
tsfield_articledetail02=getFindIdToTableCount(rs(ChrW(105)&ChrW(100)),ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116),ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49))
tsfield_articledetail03=getFindIdToTableCount(rs(ChrW(105)&ChrW(100)),ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101),ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
ishtml=rs(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
en_title=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_aboutcontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_bodycontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_webtitle=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_webkeywords=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
en_webdescription=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
createtime=rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
updatetime=rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
ip=rs(ChrW(105)&ChrW(112))
tsfield_addr=ipToAddr2022(rs(ChrW(105)&ChrW(112)),ChrW(97)&ChrW(108)&ChrW(108))
createhtmltime=rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
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

function getTimeFuHao()
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) or thisDatabaseType=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then
getTimeFuHao=ChrW(39)
else
getTimeFuHao=ChrW(35)
end if
end function

function getTableFieldFuHao(a)
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
getTableFieldFuHao=ChrW(96)&a&ChrW(96)
else
getTableFieldFuHao=ChrW(91)&a&ChrW(93)
end if
end function

function get_webcolumn_allTreeName(a) 
dim b,c,d

if isnul(a) then exit function
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))  
for b=1 to 10
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not e.eof then
a=e(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
d=e(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
if c <>"" then d= d & ChrW(62)&ChrW(62)
c=d&c
if a=-1 or isNul(a) then exit for
end if:e.close 
next
get_webcolumn_allTreeName=c
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
<ul class="layui-tab-title">
<li class="layui-this" lay-id="11">中文设置</li>
<%if checkEnLanguage() then%>
<li lay-id="22">英文设置</li> 
<%end if%>
</ul>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>选择分类：</label>
<div class='layui-input-block layui-input-wrap'>
<%=get_webcolumn_allTreeName(parentid)%>
</div><!--parentid-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=title%>
</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标题颜色：</label>
<div class='layui-input-block layui-input-wrap'>
<%=titlecolor%>
</div><!--titlecolor-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序：</label>
<div class='layui-input-block layui-input-wrap'>
<%=sortrank%>
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>小图：</label>
<div class='layui-input-block layui-input-wrap'>
<a href="<%=smallimage%>" target="_blank" title="点击查看"><%=IIF(smallimage <>"",smallimage,"")%></a>
</div><!--smallimage-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>大图：</label>
<div class='layui-input-block layui-input-wrap'>
<a href="<%=bigimage%>" target="_blank" title="点击查看"><%=IIF(bigimage <>"",bigimage,"")%></a>
</div><!--bigimage-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>作者：</label>
<div class='layui-input-block layui-input-wrap'>
<%=author%>
</div><!--author-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>文件名称：</label>
<div class='layui-input-block layui-input-wrap'>
<%=filename%>
</div><!--filename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>简要说明：</label>
<div class='layui-input-block layui-input-wrap'>
<%=aboutcontent%>
</div><!--aboutcontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>内容：</label>
<div class='layui-input-block layui-input-wrap'>
<%=bodycontent%>
</div><!--bodycontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>title标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=webtitle%>
</div><!--webtitle-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>META关键词：</label>
<div class='layui-input-block layui-input-wrap'>
<%=webkeywords%>
</div><!--webkeywords-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>META描述：</label>
<div class='layui-input-block layui-input-wrap'>
<%=webdescription%>
</div><!--webdescription-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标签：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tags%>
</div><!--tags-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>flags：</label>
<div class='layui-input-block layui-input-wrap'>
<%=showCheckboxDataTitle(ChrW(22836)&ChrW(26465)&ChrW(91)&ChrW(104)&ChrW(93)&ChrW(95)&ChrW(104)&ChrW(45)&ChrW(25512)&ChrW(33616)&ChrW(91)&ChrW(99)&ChrW(93)&ChrW(95)&ChrW(99)&ChrW(45)&ChrW(24187)&ChrW(28783)&ChrW(91)&ChrW(102)&ChrW(93)&ChrW(95)&ChrW(102)&ChrW(45)&ChrW(28378)&ChrW(21160)&ChrW(91)&ChrW(115)&ChrW(93)&ChrW(95)&ChrW(115)&ChrW(45)&ChrW(21152)&ChrW(31895)&ChrW(91)&ChrW(98)&ChrW(93)&ChrW(95)&ChrW(98),flags)%>                    </div><!--flags-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>更多图片：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_articledetail01%>
</div><!--tsfield_articledetail01-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>文章统计：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_articledetail02%>
</div><!--tsfield_articledetail02-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>文章留言：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_articledetail03%>
</div><!--tsfield_articledetail03-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isthrough=0,ChrW(21542),ChrW(26159))%>
</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>生成html：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(ishtml=0,ChrW(21542),ChrW(26159))%>
</div><!--ishtml-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>发布时间：</label>
<div class='layui-input-block layui-input-wrap'>
<%=createtime%>
</div><!--createtime-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>修改时间：</label>
<div class='layui-input-block layui-input-wrap'>
<%=updatetime%>
</div><!--updatetime-->
</div>
</div>
</div>    
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>IP：</label>
<div class='layui-input-block layui-input-wrap'>
<%=ip%>
</div><!--ip-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>IP地址：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_addr%>
</div><!--tsfield_addr-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>生成html时间：</label>
<div class='layui-input-block layui-input-wrap'>
<%=createhtmltime%>
</div><!--createhtmltime-->
</div>
</div>
<%if checkEnLanguage() then%>
<div class="layui-tab-item"> 
<div class='layui-form-item'>
<label class='layui-form-label'>英文标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_title%>
</div><!--en_title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文简要说明：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_aboutcontent%>
</div><!--en_aboutcontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文内容：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_bodycontent%>
</div><!--en_bodycontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文网站标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_webtitle%>
</div><!--en_webtitle-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文META关键词：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_webkeywords%>
</div><!--en_webkeywords-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文META描述：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_webdescription%>
</div><!--en_webdescription-->
</div>
</div>
<%end if%>
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
