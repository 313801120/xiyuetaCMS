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
dim msg,isTrue,sql,addSql,id,parentid,title,titlecolor,sortrank,smallimage,bigimage,author,filename,aboutcontent,bodycontent,webtitle,webkeywords,webdescription,tags,flags,isthrough,ishtml,en_title,en_aboutcontent,en_bodycontent,en_webtitle,en_webkeywords,en_webdescription,createhtmltime
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
flags=ChrW(124)
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(104))=ChrW(111)&ChrW(110),ChrW(104)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(99))=ChrW(111)&ChrW(110),ChrW(99)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(102))=ChrW(111)&ChrW(110),ChrW(102)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(115))=ChrW(111)&ChrW(110),ChrW(115)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(98))=ChrW(111)&ChrW(110),ChrW(98)&ChrW(124),"") 
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
createhtmltime=request(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
if createhtmltime="" then createhtmltime=null

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)& parentid &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& title &ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName) & addsql

rs.open sql,conn,1,3
if not rs.eof then
msg=ChrW(26631)&ChrW(39064)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rs(ChrW(105)&ChrW(112))=getIP()
else
rs.close  
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=parentid
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=title
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))=titlecolor
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))=smallimage
rs(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))=bigimage
rs(ChrW(97)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(114))=author
rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=suffixIsHtml(rs,filename)
rs(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=aboutcontent
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=webtitle
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))=webkeywords
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=webdescription
rs(ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115))=tags
rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))=flags
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))=ishtml
rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rs(ChrW(105)&ChrW(112))=getIP()
rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=createhtmltime

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
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
ishtml=rs(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
en_title=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_aboutcontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_bodycontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_webtitle=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_webkeywords=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
en_webdescription=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
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

function suffixIsHtml(a,b)
dim c,d
d=getFileAttr(b ,ChrW(51)) 
c=split(d&ChrW(46),ChrW(46))
d=c(0) 
if d <>"" then d=d & ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
suffixIsHtml=d
end function

function columnClass_webcolumn_SubInput(a,b,c,d)
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim f,g,h
if b <>"" then d=d&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)& b
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a & d &ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not e.eof  
h=""
if c <>"" then
if cStr(c)=cStr(e(ChrW(105)&ChrW(100))) then h=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
f=f & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& e(ChrW(105)&ChrW(100)) &ChrW(34)& h &ChrW(62)& get_webcolumn_SubColumnClassSort(e(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),"")  & e(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
f=f & columnClass_webcolumn_SubInput(e(ChrW(105)&ChrW(100)),b,c,d)    
e.movenext:wend:e.close
columnClass_webcolumn_SubInput=f
end function

function get_webcolumn_SubColumnClassSort(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(160)&ChrW(160) & b
else
b=b & ChrW(160)&ChrW(160)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
call get_webcolumn_SubColumnClassSort(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),b)
end if
end if:c.close
get_webcolumn_SubColumnClassSort=b
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
<ul class="layui-tab-title">
<li class="layui-this" lay-id="11">中文设置</li>
<%if checkEnLanguage() then%>
<li lay-id="22">英文设置</li> 
<%end if%>
</ul>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>选择分类</label>
<div class='layui-input-inline layui-input-wrap'>
<select name="parentid" id="parentid" lay-filter="parentid" selected>
<option value="-1">≡ 作为一级栏目 ≡</option>
<%=columnClass_webcolumn_SubInput(-1,"",parentid,"")%>
</select>
</div><!--parentid-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标题</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='title' placeholder='请输入标题' autocomplete='off' class='layui-input' value="<%=inputCL(title)%>"  lay-verify='required'>
</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标题颜色</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' style="width:120px;display:inline-block;"name='titlecolor' placeholder='请输入标题颜色' autocomplete='off' class='layui-input' value="<%=inputCL(titlecolor)%>" >
<div id="colorpicker-titlecolor" style="display:inline-block;vertical-align:middle;"></div>
</div><!--titlecolor-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='sortrank' placeholder='请输入排序' autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>" >
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>小图</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='smallimage' placeholder='请输入小图' autocomplete='off' class='layui-input' value="<%=inputCL(smallimage)%>" >
</div><!--smallimage-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-smallimage"><i class="layui-icon">&#xe67c;</i>上传图片</button>
<input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>大图</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='bigimage' placeholder='请输入大图' autocomplete='off' class='layui-input' value="<%=inputCL(bigimage)%>" >
</div><!--bigimage-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-bigimage"><i class="layui-icon">&#xe67c;</i>上传图片</button>
<input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>作者</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='author' placeholder='请输入作者' autocomplete='off' class='layui-input' value="<%=inputCL(author)%>" >
</div><!--author-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>文件名称</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='filename' placeholder='请输入文件名称' autocomplete='off' class='layui-input' value="<%=inputCL(filename)%>" >
</div>
<div class="layui-form-mid layui-text-em">自定义生成html文件名</div><!--filename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>简要说明</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='aboutcontent'  placeholder='请输入简要说明' class='layui-textarea'><%=inputCL(aboutcontent)%></textarea>
</div><!--aboutcontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>内容</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='bodycontent' <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39),"")%> placeholder='请输入内容' class='layui-textarea'style='height:300px'><%=inputCL(bodycontent)%></textarea>
</div><!--bodycontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>title标题</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='webtitle' placeholder='请输入title标题' autocomplete='off' class='layui-input' value="<%=inputCL(webtitle)%>" >
</div><!--webtitle-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>META关键词</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='webkeywords'  autocomplete='off' data-role='tagsinput' class='layui-input' value="<%=webkeywords%>" >
</div><!--webkeywords-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>META描述</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='webdescription' placeholder='请输入META描述' autocomplete='off' class='layui-input' value="<%=inputCL(webdescription)%>" >
</div><!--webdescription-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标签</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='tags'  autocomplete='off' data-role='tagsinput' class='layui-input' value="<%=tags%>" >
</div><!--tags-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>flags</label>
<div class='layui-input-block layui-input-wrap'>
<div class="layui-form">
<input type="checkbox" name="flags_h" title="头条[h]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(104)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_c" title="推荐[c]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(99)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_f" title="幻灯[f]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(102)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_s" title="滚动[s]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(115)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_b" title="加粗[b]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(98)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
</div>
</div><!--flags-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="是|否" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>生成html</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="ishtml" lay-skin="switch" lay-text="是|否" <%=IIF(ishtml=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--ishtml-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>生成html时间</label>
<div class='layui-input-inline layui-input-wrap'>
<div class='layui-input-prefix'><i class='layui-icon layui-icon-date'></i></div>
<input type='text' name='createhtmltime' placeholder='请输入生成html时间' autocomplete='off' class='layui-input time' value="<%=createhtmltime%>" >
</div><!--createhtmltime-->
</div>
</div>
<%if checkEnLanguage() then%>
<div class="layui-tab-item"> 
<div class='layui-form-item'>
<label class='layui-form-label'>英文标题</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='en_title' placeholder='请输入英文标题' autocomplete='off' class='layui-input' value="<%=inputCL(en_title)%>" >
</div><!--en_title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文简要说明</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='en_aboutcontent'  placeholder='请输入英文简要说明' class='layui-textarea'><%=inputCL(en_aboutcontent)%></textarea>
</div><!--en_aboutcontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文内容</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='en_bodycontent' <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39),"")%> placeholder='请输入英文内容' class='layui-textarea'style='height:300px'><%=inputCL(en_bodycontent)%></textarea>
</div><!--en_bodycontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文网站标题</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='en_webtitle' placeholder='请输入英文网站标题' autocomplete='off' class='layui-input' value="<%=inputCL(en_webtitle)%>" >
</div><!--en_webtitle-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文META关键词</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='en_webkeywords'  autocomplete='off' data-role='tagsinput' class='layui-input' value="<%=en_webkeywords%>" >
</div><!--en_webkeywords-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文META描述</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='en_webdescription' placeholder='请输入英文META描述' autocomplete='off' class='layui-input' value="<%=inputCL(en_webdescription)%>" >
</div><!--en_webdescription-->
</div>
</div>
<%end if%>
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
// 上传图片 for smallimage
upload.render({
elem: '#upload-smallimage',
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
//$(this.item).prev("div").children("input").val(imgSrc)
$("input[name='smallimage']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
}
});
// 上传图片 for bigimage
upload.render({
elem: '#upload-bigimage',
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
//$(this.item).prev("div").children("input").val(imgSrc)
$("input[name='bigimage']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
}
});
//编辑器初始化
var editor_bodycontent = layui.tinymce;
var edit = editor_bodycontent.render({
selector: "#bodycontent",
height: 500,
images_upload_handler: function (blobInfo, success, failure) {
var formData = new FormData();
formData.append('file', blobInfo.blob(), blobInfo.filename());        
$.ajax({
url: '/api/upload/?act=tinymce',
type: 'POST',
data: formData,
processData: false,
contentType: false,
success: function(json) { 
// var json = $.parseJSON(jsonStr);
// console.log('json类型',typeof(json))
if (!json || json.status != 0) {
failure(json.msg || '上传失败');
return;
}
success(json.data[0].src);
},
error: function(xhr) {
failure('上传错误: ' + xhr.statusText);
}
});
}
});
//编辑器初始化
var editor_en_bodycontent = layui.tinymce;
var edit = editor_en_bodycontent.render({
selector: "#en_bodycontent",
height: 500,
images_upload_handler: function (blobInfo, success, failure) {
var formData = new FormData();
formData.append('file', blobInfo.blob(), blobInfo.filename());        
$.ajax({
url: '/api/upload/?act=tinymce',
type: 'POST',
data: formData,
processData: false,
contentType: false,
success: function(json) { 
// var json = $.parseJSON(jsonStr);
// console.log('json类型',typeof(json))
if (!json || json.status != 0) {
failure(json.msg || '上传失败');
return;
}
success(json.data[0].src);
},
error: function(xhr) {
failure('上传错误: ' + xhr.statusText);
}
});
}
});
// 颜色选择器 for titlecolor
colorpicker.render({
elem: '#colorpicker-titlecolor',
color: $("input[name='titlecolor']").val(),//不要默认颜色 || '#FF0000',
done: function(color){
$("input[name='titlecolor']").val(color);
}
});
// 时间选择器 for createtime
lay("input[name='createtime']").each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy/MM/dd HH:mm:ss'
});
});
// 时间选择器 for updatetime
lay("input[name='updatetime']").each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy-MM-dd HH:mm:ss'
});
});
// 时间选择器 for createhtmltime
lay("input[name='createhtmltime']").each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy/MM/dd HH:mm:ss'
});
});
})
// pasteImage("pic");
pasteImage('smallimage');
pasteImage('bigimage');
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
<link rel='stylesheet' href='../../css/tagsinput.css?v4'>
<script type='text/javascript' src='../../js/tagsinput.min.js'></script>
</body>
</html>
