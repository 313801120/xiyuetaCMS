<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
tableName=ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)
winTitle=ChrW(25991)&ChrW(31456)
dim msg,isTrue,addSql,id,parentid,title,isthrough,sortrank,smallimage,aboutcontent,bodycontent,author,webtitle,webkeywords,webdescription,bigimage,filename,tags,flags,titlecolor,price,inventory
id=request(ChrW(105)&ChrW(100))
parentid=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
sortrank=request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
if sortrank="" then sortrank=0
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
smallimage=request(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
bigimage=request(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
aboutcontent=request(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
author=request(ChrW(97)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(114))
webtitle=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
webkeywords=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
webdescription=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
filename=request(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
price=request(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))
inventory=request(ChrW(105)&ChrW(110)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121))
tags=request(ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115))
tags=replace(replace(replace(phptrim(tags),chr(10),ChrW(44)),chr(13),ChrW(44)),vbtab,ChrW(44))
if tags <>"" then tags=ChrW(44)& tags &ChrW(44)
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0)
if parentid="" then 
parentid=-1
else
parentid=int(parentid)
end if
flags=ChrW(124)
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(104))=ChrW(111)&ChrW(110),ChrW(104)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(99))=ChrW(111)&ChrW(110),ChrW(99)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(102))=ChrW(111)&ChrW(110),ChrW(102)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(97))=ChrW(111)&ChrW(110),ChrW(97)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(115))=ChrW(111)&ChrW(110),ChrW(115)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(98))=ChrW(111)&ChrW(110),ChrW(98)&ChrW(124),"") 
titlecolor=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))

dim en_title,en_aboutcontent,en_bodycontent,en_webtitle,en_webkeywords,en_webdescription
en_title=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_aboutcontent=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_bodycontent=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_webtitle=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_webkeywords=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
en_webdescription=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(40)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& title &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61) & parentid & ChrW(41)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&addsql,conn,1,3
if not rs.eof then
msg=ChrW(26631)&ChrW(39064)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
else
rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=parentid 
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=title 
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank 
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough 
rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))=smallimage 
rs(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))=bigimage 
rs(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=aboutcontent 
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent 
rs(ChrW(97)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(114))=author 
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=webtitle 
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))=webkeywords 
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=webdescription 
rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=filename 
rs(ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115))=tags
rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))=flags
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))=titlecolor
if price <>"" then rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))=price
if inventory <>"" then rs(ChrW(105)&ChrW(110)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121))=inventory

if checkEnLanguage() then  
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=en_title
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=en_aboutcontent
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=en_bodycontent
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=en_webtitle
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))=en_webkeywords
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=en_webdescription 
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
parentid=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) 
id=rs(ChrW(105)&ChrW(100)) 
title=inputCL(rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) )  
sortrank=inputCL(rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)) )  
isthrough=inputCL(rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)))  
smallimage=inputCL(rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)))   
bigimage=inputCL(rs(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)))  
aboutcontent=inputCL(rs(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)))  
bodycontent=inputCL(rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)))  
author=inputCL(rs(ChrW(97)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(114)))  
webtitle=inputCL(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))  
webkeywords=inputCL(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)))  
webdescription=inputCL(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)))  
filename=inputCL(rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))  
tags=inputCL(rs(ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115)))  
flags=inputCL(rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)))  
titlecolor=inputCL(rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)))  
price=inputCL(rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)))  
inventory=inputCL(rs(ChrW(105)&ChrW(110)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)))  

en_title=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_aboutcontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_bodycontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_webtitle=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_webkeywords=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
en_webdescription =rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
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
<style>
/*关键词*/
.label {
display: inline;
padding: 0.2em 0.6em 0.3em;
font-size: 75%;
font-weight: 700;
line-height: 1; 
color: #fff;
text-align: center;
white-space: nowrap;
vertical-align: baseline;
border-radius: 0.25em;
}
.label-info {
background-color: #5bc0de;
}
</style>
<body>   
<script src="../../js/jquery.js"></script>
<%if msg <>"" then  call rw(ChrW(60)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62)& msg &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(62))%>
<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 0px 0 0 0;">
<div class="layui-tab" lay-filter="test-hash">
<ul class="layui-tab-title">
<li class="layui-this" lay-id="11">中文设置</li>
<li lay-id="22">英文设置</li> 
</ul>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class="layui-form-item">
<label class="layui-form-label">选择分类</label>
<div class="layui-input-inline">
<select name="parentid" id="parentid" selected><option value="-1">≡ 作为一级栏目 ≡</option>
<%

call rw( columnSubInput(-1,"",parentid) )
%>
</select>
</div> 
</div>
<div class="layui-form-item">
<label class="layui-form-label">标题</label>
<div class="layui-input-block">
<input type="text" name="title" id="title" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="<%=title%>" style='<%=IIF(titlecolor <>"",ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58) & titlecolor & ChrW(59),"")%><%=IIF(instr(flags,ChrW(124)&ChrW(98)&ChrW(124))>0,ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(98)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(59),"")%>' >
<input name="titlecolor" type="hidden" id="titlecolor" value="<%=titlecolor%>" />
<script language="javascript" type="text/javascript" src="../../js/colorpicker.js?v1"></script>
<img src="../../Images/colour.png" width="15" height="16" onClick="colorpicker('title_colorpanel','set_title_color');" style="cursor:hand">
<span id="title_colorpanel" style="position:absolute; z-index:200" class="colorpanel"></span>
<img src="../../Images/bold.png" width="10" height="10" onClick="input_font_bold()" id="titleb" style="cursor:hand">  
</div>
</div>    
<div class="layui-form-item">
<label class="layui-form-label">缩略图</label>
<div class="layui-input-inline">
<input type="text" name="smallimage" id="smallimage" placeholder="请上传缩略图" autocomplete="off" class="layui-input" value="<%=smallimage%>" >
<!-- onmousemove="showBigPic(this.value)" onmouseout="closeimg()"> -->
</div> 
<button type="button" class="layui-btn layui-btn-primary" id="layuiadmin-upload-smallimage">
<i class="layui-icon">&#xe67c;</i>上传图片
</button><input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreviewsmallimage">查看图片</button >
</div>
<div class="layui-form-item">
<label class="layui-form-label">大图</label>
<div class="layui-input-inline">
<input type="text" name="bigimage" id="bigimage" placeholder="请上传大图" autocomplete="off" class="layui-input" value="<%=bigimage%>" >
<!-- onmousemove="showBigPic(this.value)" onmouseout="closeimg()"> -->
</div> 
<button type="button" class="layui-btn layui-btn-primary" id="layuiadmin-upload-bigimage">
<i class="layui-icon">&#xe67c;</i>上传图片
</button><input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreviewbigimage">查看图片</button >
</div>
<div class="layui-form-item">
<label class="layui-form-label">排序</label> 
<div class="layui-input-inline">
<input type="text" name="sortrank" lay-verify="number" placeholder="请输入排序" autocomplete="off" class="layui-input" value="<%=sortrank%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">价格</label> 
<div class="layui-input-inline">
<input type="text" name="price" lay-verify="number" placeholder="请输入价格" autocomplete="off" class="layui-input" value="<%=price%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">库存</label> 
<div class="layui-input-inline">
<input type="text" name="inventory" lay-verify="number" placeholder="请输入库存" autocomplete="off" class="layui-input" value="<%=inventory%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">作者</label>
<div class="layui-input-inline">
<input type="text" name="author"   placeholder="请输入作者" autocomplete="off" class="layui-input" value="<%=author%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">简要说明</label>
<div class="layui-input-block">
<textarea name="aboutcontent" placeholder="请输入简要说明" class="layui-textarea"><%=aboutcontent%></textarea>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">文章内容</label>
<div class="layui-input-block">
<textarea name="bodycontent" <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39)&ChrW(32)&ChrW(32),ChrW(32)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(50)&ChrW(48)&ChrW(39))%> placeholder="请输入文章内容" class="layui-textarea"><%=bodycontent%></textarea> 
</div>
</div>  
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">title标题</label>
<div class="layui-input-block">
<textarea name="webtitle" class="layui-textarea" placeholder="title标题"><%=webtitle%></textarea>
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">META关键词</label>
<div class="layui-input-block">
<textarea name="webkeywords" class="layui-textarea" placeholder="多个关键词用英文状态 , 号分割"><%=webkeywords%></textarea>
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">META描述</label>
<div class="layui-input-block">
<textarea name="webdescription" class="layui-textarea"><%=webdescription%></textarea>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">自定义文件</label>
<div class="layui-input-inline">
<input type="text" name="filename"   placeholder="请输入自定义文件" autocomplete="off" class="layui-input" value="<%=filename%>">
</div>
</div>    
<!--     <div class="layui-form-item">
<label class="layui-form-label">标签</label>
<div class="layui-input-block">
<input type="text" autocomplete="off" class="form-control" data-role="tagsinput" id="tags" value="<%=tags%>" name="tags"  > 
</div>
</div>  -->
<div class="layui-form-item">
<label class="layui-form-label">标签</label>
<div class="layui-input-block">
<input type="text" name="tags" data-role="tagsinput"  autocomplete="off" class="layui-input" id="tags" value="<%=tags%>">
</div>
</div>  
<div class="layui-form-item">
<label class="layui-form-label">审核状态</label>
<div class="layui-input-inline">
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
</div>   
<div class="layui-form-item">
<label class="layui-form-label">自定义属性</label>
<div class="layui-input-block">
<div class="layui-form">
<input type="checkbox" name="flags_h" title="头条[h]"<%=IIF(instr(flags,ChrW(124)&ChrW(104)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_c" title="推荐[c]"<%=IIF(instr(flags,ChrW(124)&ChrW(99)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_f" title="幻灯[f]"<%=IIF(instr(flags,ChrW(124)&ChrW(102)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>> 
<input type="checkbox" name="flags_a" title="特荐[a]"<%=IIF(instr(flags,ChrW(124)&ChrW(97)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>> 
<input type="checkbox" name="flags_s" title="滚动[s]"<%=IIF(instr(flags,ChrW(124)&ChrW(115)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>> 
<input type="checkbox" name="flags_b" title="加粗[b]"<%=IIF(instr(flags,ChrW(124)&ChrW(98)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%> lay-filter="checkboxTest"> 
</div>
</div>
</div>   
</div>
<div class="layui-tab-item">
<div class="layui-form-item">
<label class="layui-form-label">英文标题</label>
<div class="layui-input-block">
<input type="text" name="en_title" id="en_title" lay-verify="required" placeholder="请输入英文标题" autocomplete="off" class="layui-input" value="<%=en_title%>" > 
</div>
</div>   
<div class="layui-form-item">
<label class="layui-form-label">英文简要说明</label>
<div class="layui-input-block">
<textarea name="en_aboutcontent" placeholder="请输入英文简要说明" class="layui-textarea"><%=en_aboutcontent%></textarea>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">英文文章内容</label>
<div class="layui-input-block">
<textarea name="en_bodycontent" <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39)&ChrW(32)&ChrW(32),ChrW(32)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(50)&ChrW(48)&ChrW(39))%> placeholder="请输入英文文章内容" class="layui-textarea" id="en_bodycontent" style="border:0;padding:0"><%=en_bodycontent%></textarea>
</div>
</div>  
<div class="layui-form-item">
<label class="layui-form-label">英文网站标题</label>
<div class="layui-input-block">
<input type="text" name="en_webtitle" value="<%=en_webtitle%>" class="layui-input">
</div>
</div> 
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">英文META关键词</label>
<div class="layui-input-block"> 
<input type="text" autocomplete="off" class="form-control" data-role="tagsinput" id="keyword" value="<%=en_webkeywords%>" name="en_webkeywords"  > 
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">英文META描述</label>
<div class="layui-input-block">
<textarea name="en_webdescription" class="layui-textarea"><%=en_webdescription%></textarea>
</div>
</div>
</div>
<div class="layui-form-item layui-hide">
<input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
</div>
</div> 
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../..//js/pc.js?v6"></script>
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
a.events.avartatPreviewsmallimage = function(t) {
var i = $("#smallimage").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
}
var b = (layui.laytpl, layui.setter, layui.view, layui.admin);
//查看图片
b.events.avartatPreviewbigimage = function(t) {
var i = $("#bigimage").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
}
//正常上传图片
upload.render({
elem: '#layuiadmin-upload-smallimage',
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
//正常上传图片
upload.render({
elem: '#layuiadmin-upload-bigimage',
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
//加粗    
form.on('checkbox(checkboxTest)', function(data){
input_font_bold();
// $("span:contains('特荐[a]')").parent().addClass('layui-form-checked');//选中
}); 
$("#titleb").click(function(){
var s=$("input[name='title']").css("font-weight")+"";
if(s=="700"){//700为加粗
$("input[name='flags_b']").prop("checked",false);
}else{
$("input[name='flags_b']").prop("checked",true);
}
form.render('checkbox');
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
<link rel='stylesheet' href='../../css/tagsinput.css'>
<style type="text/css">
.bootstrap-tagsinput{width:97%;}
</style>
<script type='text/javascript' src='../../js/tagsinput.min.js'></script>
</body>
</html>
