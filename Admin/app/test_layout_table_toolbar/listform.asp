<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)
winTitle = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)
excludeAdminIDLIst=ChrW(48)
dim msg,isTrue,sql,addSql,id,layout_page_id,parentid,title,buttontitle,saction,customizeaction,sortrank,isthrough,bgcolor,noteico,notetext
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
layout_page_id=getStrToNumber(request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)))
if layout_page_id="" then layout_page_id=null
parentid=getStrToNumber(request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
if parentid="" then parentid=null
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
title=handleAspStrSafe(title)
buttontitle=request(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
buttontitle=handleAspStrSafe(buttontitle)
saction=request(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
saction=handleAspStrSafe(saction)
customizeaction=request(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
customizeaction=handleAspStrSafe(customizeaction)
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 
bgcolor=request(ChrW(98)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))
bgcolor=handleAspStrSafe(bgcolor)
noteico=request(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))
noteico=handleAspStrSafe(noteico)
notetext=request(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))
notetext=handleAspStrSafe(notetext)

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)& layout_page_id &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)& parentid &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& title &ChrW(39)
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
else
rs.close  
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))=layout_page_id
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=parentid
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=title
rs(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=buttontitle
rs(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=saction
rs(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=customizeaction
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(98)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))=bgcolor
rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))=noteico
rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))=notetext

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
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
id=rs(ChrW(105)&ChrW(100))
layout_page_id=rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))
parentid=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
title=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
buttontitle=rs(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
saction=rs(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
customizeaction=rs(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
bgcolor=rs(ChrW(98)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))
noteico=rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))
notetext=rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))
end if
else
sortrank=10
isthrough=1
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
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

function oneColumnClass_layout_page_SubInput(a)
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d,e
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))&ChrW(32)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not b.eof  
e=""
if a <>"" then
if cStr(a)=cStr(b(ChrW(105)&ChrW(100))) then e=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
c=c & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& b(ChrW(105)&ChrW(100)) &ChrW(34)& e &ChrW(62)& b(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(40)&b(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
b.movenext:wend:b.close
oneColumnClass_layout_page_SubInput=c
end function

function columnClass_layout_table_toolbar_SubInput(a,b,c,d)
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim f,g,h
if b <>"" then d=d&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)& b
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a & d &ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not e.eof  
h=""
if c <>"" then
if cStr(c)=cStr(e(ChrW(105)&ChrW(100))) then h=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
f=f & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& e(ChrW(105)&ChrW(100)) &ChrW(34)& h &ChrW(62)& get_layout_table_toolbar_SubColumnClassSort(e(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),"")  & e(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(40)&e(ChrW(105)&ChrW(100))&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
f=f & columnClass_layout_table_toolbar_SubInput(e(ChrW(105)&ChrW(100)),b,c,d)    
e.movenext:wend:e.close
columnClass_layout_table_toolbar_SubInput=f
end function

function get_layout_table_toolbar_SubColumnClassSort(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(160)&ChrW(160) & b
else
b=b & ChrW(160)&ChrW(160)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
call get_layout_table_toolbar_SubColumnClassSort(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),b)
end if
end if:c.close
get_layout_table_toolbar_SubColumnClassSort=b
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
<label class='layui-form-label'>布局页ID</label>
<div class='layui-input-inline layui-input-wrap'>
<select name="layout_page_id" id="layout_page_id" lay-filter="layout_page_id" selected>
<%=oneColumnClass_layout_page_SubInput(layout_page_id)%>
</select>
</div><!--layout_page_id-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>选择分类</label>
<div class='layui-input-inline layui-input-wrap'>
<select name="parentid" id="parentid" lay-filter="parentid" selected>
<option value="-1">≡ 作为一级栏目 ≡</option>
<%=columnClass_layout_table_toolbar_SubInput(-1,id,parentid,IIF(layout_page_id <>"",ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&layout_page_id,""))%>
</select>
</div><!--parentid-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标题</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='title' placeholder='请输入标题' autocomplete='off' class='layui-input' value="<%=inputCL(title)%>"  lay-verify='required'>
</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>按钮标题</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='buttontitle' placeholder='请输入按钮标题' autocomplete='off' class='layui-input' value="<%=inputCL(buttontitle)%>" >
</div><!--buttontitle-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表右边按钮</label>
<div class='layui-input-block layui-input-wrap'>
<input type="radio" name="saction" value="filter" title="过滤器" lay-filter="saction" <%=IIF(saction+""=ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="saction" value="LAYTABLE_DRDC" title="导入导出" lay-filter="saction" <%=IIF(saction+""=ChrW(76)&ChrW(65)&ChrW(89)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(95)&ChrW(68)&ChrW(82)&ChrW(68)&ChrW(67),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="saction" value="LAYTABLE_TIPS" title="提示" lay-filter="saction" <%=IIF(saction+""=ChrW(76)&ChrW(65)&ChrW(89)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(95)&ChrW(84)&ChrW(73)&ChrW(80)&ChrW(83),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="saction" value="exports" title="系统导出CSV" lay-filter="saction" <%=IIF(saction+""=ChrW(101)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(115),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="saction" value="print" title="打印" lay-filter="saction" <%=IIF(saction+""=ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="saction" value="daochu" title="导出" lay-filter="saction" <%=IIF(saction+""=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="saction" value="daochu_excel" title="导出excel" lay-filter="saction" <%=IIF(saction+""=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117)&ChrW(95)&ChrW(101)&ChrW(120)&ChrW(99)&ChrW(101)&ChrW(108),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="saction" value="daochu_csv" title="导出csv" lay-filter="saction" <%=IIF(saction+""=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117)&ChrW(95)&ChrW(99)&ChrW(115)&ChrW(118),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="saction" value="daoru" title="导入" lay-filter="saction" <%=IIF(saction+""=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(114)&ChrW(117),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="saction" value="line" title="分割线" lay-filter="saction" <%=IIF(saction+""=ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="saction" value="customize" title="自定义" lay-filter="saction" <%=IIF(saction+""=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
</div><!--saction-->
</div>
<div class='layui-form-item' id="customizeaction">
<label class='layui-form-label'>自定义动作</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='customizeaction' placeholder='请输入自定义动作' autocomplete='off' class='layui-input' value="<%=inputCL(customizeaction)%>" >
</div>
<div class="layui-form-mid layui-text-em">如：databaseToInstall，databaseToAccess，databaseToSqlServer</div><!--customizeaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='sortrank' placeholder='请输入排序' autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>"  lay-verify='required'>
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="是|否" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>背景颜色</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(98)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(45)&ChrW(110)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(45)&ChrW(98)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(45)&ChrW(111)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(101)&ChrW(45)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(45)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(112)&ChrW(108)&ChrW(101),bgcolor)%>
</div><!--bgcolor-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>注释图标</label>
<div class='layui-input-inline layui-input-wrap'>
<div id="noteico"></div>                    </div><!--noteico-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>注释文本</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='notetext' placeholder='请输入注释文本' autocomplete='off' class='layui-input' value="<%=inputCL(notetext)%>" >
</div><!--notetext-->
</div>
</div>
</div>    
</div>
<!-- 提交按钮需要，外部调用 -->
<div class="layui-form-item layui-hide">
<input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
</div>
</div>
</div>
</div>
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../../js/pc.js?v20250716_1"></script>
<script src="../../layuiadmin/js/xm-select.js"></script>
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
//根据“动作类型”显示隐藏相关字段（使用 HTML 上的 id）
function toggleActionSections(value){ 
var $customizeaction = $('#customizeaction'); 
if(value === 'customize'){   
$customizeaction.show();  
}else{
//未选择任何动作类型时，全部隐藏 
$customizeaction.hide();  
}
}
// 渲染单选框（确保 Layui 已处理为自定义样式）
form.render('radio');
// 初始化：根据当前已选的动作类型决定显示/隐藏
// 如果没有选中任何动作类型，则不默认选择，保持全部隐藏
var current = $('input[name="saction"]:checked').val() || '';
toggleActionSections(current);
// 仅使用 Layui 的监听方式
form.on('radio(saction)', function(data){
toggleActionSections(data.value || '');
});
// 准备数据源
var noteico_optionData = [
{name: '<i class="layui-icon layui-icon-bot"></i>机器人(bot)', value: 'bot'},
{name: '<i class="layui-icon layui-icon-leaf"></i>叶子节点(leaf)', value: 'leaf'},
{name: '<i class="layui-icon layui-icon-folder"></i>文件夹(folder)', value: 'folder'},
{name: '<i class="layui-icon layui-icon-folder-open"></i>文件夹打开(folder-open)', value: 'folder-open'},
{name: '<i class="layui-icon layui-icon-gitee"></i>Gitee(gitee)', value: 'gitee'},
{name: '<i class="layui-icon layui-icon-github"></i>Github(github)', value: 'github'},
{name: '<i class="layui-icon layui-icon-light"></i>太阳/明亮(light)', value: 'light'},
{name: '<i class="layui-icon layui-icon-moon"></i>月亮(moon)', value: 'moon'},
{name: '<i class="layui-icon layui-icon-error"></i>错误(error)', value: 'error'},
{name: '<i class="layui-icon layui-icon-success"></i>成功(success)', value: 'success'},
{name: '<i class="layui-icon layui-icon-question"></i>问号(question)', value: 'question'},
{name: '<i class="layui-icon layui-icon-lock"></i>锁定(lock)', value: 'lock'},
{name: '<i class="layui-icon layui-icon-eye"></i>显示(eye)', value: 'eye'},
{name: '<i class="layui-icon layui-icon-eye-invisible"></i>隐藏(eye-invisible)', value: 'eye-invisible'},
{name: '<i class="layui-icon layui-icon-clear"></i>清空/删除(clear)', value: 'clear'},
{name: '<i class="layui-icon layui-icon-backspace"></i>退格(backspace)', value: 'backspace'},
{name: '<i class="layui-icon layui-icon-disabled"></i>禁用(disabled)', value: 'disabled'},
{name: '<i class="layui-icon layui-icon-tips-fill"></i>感叹号/提示(tips-fill)', value: 'tips-fill'},
{name: '<i class="layui-icon layui-icon-test"></i>测试/K线图(test)', value: 'test'},
{name: '<i class="layui-icon layui-icon-music"></i>音乐/音符(music)', value: 'music'},
{name: '<i class="layui-icon layui-icon-chrome"></i>Chrome(chrome)', value: 'chrome'},
{name: '<i class="layui-icon layui-icon-firefox"></i>Firefox(firefox)', value: 'firefox'},
{name: '<i class="layui-icon layui-icon-edge"></i>Edge(edge)', value: 'edge'},
{name: '<i class="layui-icon layui-icon-ie"></i>IE(ie)', value: 'ie'},
{name: '<i class="layui-icon layui-icon-heart-fill"></i>实心(heart-fill)', value: 'heart-fill'},
{name: '<i class="layui-icon layui-icon-heart"></i>空心(heart)', value: 'heart'},
{name: '<i class="layui-icon layui-icon-time"></i>时间/历史(time)', value: 'time'},
{name: '<i class="layui-icon layui-icon-at"></i>@艾特(at)', value: 'at'},
{name: '<i class="layui-icon layui-icon-email"></i>邮箱(email)', value: 'email'},
{name: '<i class="layui-icon layui-icon-rss"></i>RSS(rss)', value: 'rss'},
{name: '<i class="layui-icon layui-icon-sound"></i>声音(sound)', value: 'sound'},
{name: '<i class="layui-icon layui-icon-mute"></i>静音(mute)', value: 'mute'},
{name: '<i class="layui-icon layui-icon-mike"></i>录音/麦克风(mike)', value: 'mike'},
{name: '<i class="layui-icon layui-icon-key"></i>密钥/钥匙(key)', value: 'key'},
{name: '<i class="layui-icon layui-icon-gift"></i>礼物/活动(gift)', value: 'gift'},
{name: '<i class="layui-icon layui-icon-bluetooth"></i>蓝牙(bluetooth)', value: 'bluetooth'},
{name: '<i class="layui-icon layui-icon-wifi"></i>WiFi(wifi)', value: 'wifi'},
{name: '<i class="layui-icon layui-icon-logout"></i>退出/注销(logout)', value: 'logout'},
{name: '<i class="layui-icon layui-icon-android"></i>Android 安卓(android)', value: 'android'},
{name: '<i class="layui-icon layui-icon-ios"></i>Apple IOS 苹果(ios)', value: 'ios'},
{name: '<i class="layui-icon layui-icon-windows"></i>Windows(windows)', value: 'windows'},
{name: '<i class="layui-icon layui-icon-transfer"></i>穿梭框(transfer)', value: 'transfer'},
{name: '<i class="layui-icon layui-icon-service"></i>客服(service)', value: 'service'},
{name: '<i class="layui-icon layui-icon-subtraction"></i>减(subtraction)', value: 'subtraction'},
{name: '<i class="layui-icon layui-icon-addition"></i>加(addition)', value: 'addition'},
{name: '<i class="layui-icon layui-icon-slider"></i>滑块(slider)', value: 'slider'},
{name: '<i class="layui-icon layui-icon-print"></i>打印(print)', value: 'print'},
{name: '<i class="layui-icon layui-icon-export"></i>导出(export)', value: 'export'},
{name: '<i class="layui-icon layui-icon-cols"></i>列(cols)', value: 'cols'},
{name: '<i class="layui-icon layui-icon-screen-restore"></i>退出全屏(screen-restore)', value: 'screen-restore'},
{name: '<i class="layui-icon layui-icon-screen-full"></i>全屏(screen-full)', value: 'screen-full'},
{name: '<i class="layui-icon layui-icon-rate-half"></i>半星(rate-half)', value: 'rate-half'},
{name: '<i class="layui-icon layui-icon-rate"></i>星星-空心(rate)', value: 'rate'},
{name: '<i class="layui-icon layui-icon-rate-solid"></i>星星-实心(rate-solid)', value: 'rate-solid'},
{name: '<i class="layui-icon layui-icon-cellphone"></i>手机(cellphone)', value: 'cellphone'},
{name: '<i class="layui-icon layui-icon-vercode"></i>验证码(vercode)', value: 'vercode'},
{name: '<i class="layui-icon layui-icon-login-wechat"></i>微信(login-wechat)', value: 'login-wechat'},
{name: '<i class="layui-icon layui-icon-login-qq"></i>QQ(login-qq)', value: 'login-qq'},
{name: '<i class="layui-icon layui-icon-login-weibo"></i>微博(login-weibo)', value: 'login-weibo'},
{name: '<i class="layui-icon layui-icon-password"></i>密码(password)', value: 'password'},
{name: '<i class="layui-icon layui-icon-username"></i>用户名(username)', value: 'username'},
{name: '<i class="layui-icon layui-icon-refresh-3"></i>刷新-粗(refresh-3)', value: 'refresh-3'},
{name: '<i class="layui-icon layui-icon-auz"></i>授权(auz)', value: 'auz'},
{name: '<i class="layui-icon layui-icon-spread-left"></i>左向右伸缩菜单(spread-left)', value: 'spread-left'},
{name: '<i class="layui-icon layui-icon-shrink-right"></i>右向左伸缩菜单(shrink-right)', value: 'shrink-right'},
{name: '<i class="layui-icon layui-icon-snowflake"></i>雪花(snowflake)', value: 'snowflake'},
{name: '<i class="layui-icon layui-icon-tips"></i>提示说明(tips)', value: 'tips'},
{name: '<i class="layui-icon layui-icon-note"></i>便签(note)', value: 'note'},
{name: '<i class="layui-icon layui-icon-home"></i>主页(home)', value: 'home'},
{name: '<i class="layui-icon layui-icon-senior"></i>高级(senior)', value: 'senior'},
{name: '<i class="layui-icon layui-icon-refresh"></i>刷新(refresh)', value: 'refresh'},
{name: '<i class="layui-icon layui-icon-refresh-1"></i>刷新(refresh-1)', value: 'refresh-1'},
{name: '<i class="layui-icon layui-icon-flag"></i>旗帜(flag)', value: 'flag'},
{name: '<i class="layui-icon layui-icon-theme"></i>主题(theme)', value: 'theme'},
{name: '<i class="layui-icon layui-icon-notice"></i>消息-通知(notice)', value: 'notice'},
{name: '<i class="layui-icon layui-icon-website"></i>网站(website)', value: 'website'},
{name: '<i class="layui-icon layui-icon-console"></i>控制台(console)', value: 'console'},
{name: '<i class="layui-icon layui-icon-face-surprised"></i>表情-惊讶(face-surprised)', value: 'face-surprised'},
{name: '<i class="layui-icon layui-icon-set"></i>设置-空心(set)', value: 'set'},
{name: '<i class="layui-icon layui-icon-template-1"></i>模板(template-1)', value: 'template-1'},
{name: '<i class="layui-icon layui-icon-app"></i>应用(app)', value: 'app'},
{name: '<i class="layui-icon layui-icon-template"></i>模板(template)', value: 'template'},
{name: '<i class="layui-icon layui-icon-praise"></i>赞(praise)', value: 'praise'},
{name: '<i class="layui-icon layui-icon-tread"></i>踩(tread)', value: 'tread'},
{name: '<i class="layui-icon layui-icon-male"></i>男(male)', value: 'male'},
{name: '<i class="layui-icon layui-icon-female"></i>女(female)', value: 'female'},
{name: '<i class="layui-icon layui-icon-camera"></i>相机-空心(camera)', value: 'camera'},
{name: '<i class="layui-icon layui-icon-camera-fill"></i>相机-实心(camera-fill)', value: 'camera-fill'},
{name: '<i class="layui-icon layui-icon-more"></i>菜单-水平(more)', value: 'more'},
{name: '<i class="layui-icon layui-icon-more-vertical"></i>菜单-垂直(more-vertical)', value: 'more-vertical'},
{name: '<i class="layui-icon layui-icon-rmb"></i>金额-人民币(rmb)', value: 'rmb'},
{name: '<i class="layui-icon layui-icon-dollar"></i>金额-美元(dollar)', value: 'dollar'},
{name: '<i class="layui-icon layui-icon-diamond"></i>钻石-等级(diamond)', value: 'diamond'},
{name: '<i class="layui-icon layui-icon-fire"></i>火(fire)', value: 'fire'},
{name: '<i class="layui-icon layui-icon-return"></i>返回(return)', value: 'return'},
{name: '<i class="layui-icon layui-icon-location"></i>位置-地图(location)', value: 'location'},
{name: '<i class="layui-icon layui-icon-read"></i>办公-阅读(read)', value: 'read'},
{name: '<i class="layui-icon layui-icon-survey"></i>调查(survey)', value: 'survey'},
{name: '<i class="layui-icon layui-icon-face-smile"></i>表情-微笑(face-smile)', value: 'face-smile'},
{name: '<i class="layui-icon layui-icon-face-cry"></i>表情-哭泣(face-cry)', value: 'face-cry'},
{name: '<i class="layui-icon layui-icon-cart-simple"></i>购物车(cart-simple)', value: 'cart-simple'},
{name: '<i class="layui-icon layui-icon-cart"></i>购物车(cart)', value: 'cart'},
{name: '<i class="layui-icon layui-icon-next"></i>下一页(next)', value: 'next'},
{name: '<i class="layui-icon layui-icon-prev"></i>上一页(prev)', value: 'prev'},
{name: '<i class="layui-icon layui-icon-upload-drag"></i>上传-空心-拖拽(upload-drag)', value: 'upload-drag'},
{name: '<i class="layui-icon layui-icon-upload"></i>上传-实心(upload)', value: 'upload'},
{name: '<i class="layui-icon layui-icon-download-circle"></i>下载-圆圈(download-circle)', value: 'download-circle'},
{name: '<i class="layui-icon layui-icon-component"></i>组件(component)', value: 'component'},
{name: '<i class="layui-icon layui-icon-file-b"></i>文件-粗(file-b)', value: 'file-b'},
{name: '<i class="layui-icon layui-icon-user"></i>用户(user)', value: 'user'},
{name: '<i class="layui-icon layui-icon-find-fill"></i>发现-实心(find-fill)', value: 'find-fill'},
{name: '<i class="layui-icon layui-icon-loading"></i>loading(loading)', value: 'loading'},
{name: '<i class="layui-icon layui-icon-loading-1"></i>loading(loading-1)', value: 'loading-1'},
{name: '<i class="layui-icon layui-icon-add-1"></i>添加(add-1)', value: 'add-1'},
{name: '<i class="layui-icon layui-icon-play"></i>播放(play)', value: 'play'},
{name: '<i class="layui-icon layui-icon-pause"></i>暂停(pause)', value: 'pause'},
{name: '<i class="layui-icon layui-icon-headset"></i>音频-耳机(headset)', value: 'headset'},
{name: '<i class="layui-icon layui-icon-video"></i>视频(video)', value: 'video'},
{name: '<i class="layui-icon layui-icon-voice"></i>语音-声音(voice)', value: 'voice'},
{name: '<i class="layui-icon layui-icon-speaker"></i>消息-通知-喇叭(speaker)', value: 'speaker'},
{name: '<i class="layui-icon layui-icon-fonts-del"></i>删除线(fonts-del)', value: 'fonts-del'},
{name: '<i class="layui-icon layui-icon-fonts-code"></i>代码(fonts-code)', value: 'fonts-code'},
{name: '<i class="layui-icon layui-icon-fonts-html"></i>HTML(fonts-html)', value: 'fonts-html'},
{name: '<i class="layui-icon layui-icon-fonts-strong"></i>字体加粗(fonts-strong)', value: 'fonts-strong'},
{name: '<i class="layui-icon layui-icon-unlink"></i>删除链接(unlink)', value: 'unlink'},
{name: '<i class="layui-icon layui-icon-picture"></i>图片(picture)', value: 'picture'},
{name: '<i class="layui-icon layui-icon-link"></i>链接(link)', value: 'link'},
{name: '<i class="layui-icon layui-icon-face-smile-b"></i>表情-笑-粗(face-smile-b)', value: 'face-smile-b'},
{name: '<i class="layui-icon layui-icon-align-left"></i>左对齐(align-left)', value: 'align-left'},
{name: '<i class="layui-icon layui-icon-align-right"></i>右对齐(align-right)', value: 'align-right'},
{name: '<i class="layui-icon layui-icon-align-center"></i>居中对齐(align-center)', value: 'align-center'},
{name: '<i class="layui-icon layui-icon-fonts-u"></i>字体-下划线(fonts-u)', value: 'fonts-u'},
{name: '<i class="layui-icon layui-icon-fonts-i"></i>字体-斜体(fonts-i)', value: 'fonts-i'},
{name: '<i class="layui-icon layui-icon-tabs"></i>Tabs 选项卡(tabs)', value: 'tabs'},
{name: '<i class="layui-icon layui-icon-radio"></i>单选框-选中(radio)', value: 'radio'},
{name: '<i class="layui-icon layui-icon-circle"></i>单选框-候选(circle)', value: 'circle'},
{name: '<i class="layui-icon layui-icon-edit"></i>编辑(edit)', value: 'edit'},
{name: '<i class="layui-icon layui-icon-share"></i>分享(share)', value: 'share'},
{name: '<i class="layui-icon layui-icon-delete"></i>删除(delete)', value: 'delete'},
{name: '<i class="layui-icon layui-icon-form"></i>表单(form)', value: 'form'},
{name: '<i class="layui-icon layui-icon-cellphone-fine"></i>手机-细体(cellphone-fine)', value: 'cellphone-fine'},
{name: '<i class="layui-icon layui-icon-dialogue"></i>聊天 对话 沟通(dialogue)', value: 'dialogue'},
{name: '<i class="layui-icon layui-icon-fonts-clear"></i>文字格式化(fonts-clear)', value: 'fonts-clear'},
{name: '<i class="layui-icon layui-icon-layer"></i>窗口(layer)', value: 'layer'},
{name: '<i class="layui-icon layui-icon-date"></i>日期(date)', value: 'date'},
{name: '<i class="layui-icon layui-icon-water"></i>水 下雨(water)', value: 'water'},
{name: '<i class="layui-icon layui-icon-code-circle"></i>代码-圆圈(code-circle)', value: 'code-circle'},
{name: '<i class="layui-icon layui-icon-carousel"></i>轮播组图(carousel)', value: 'carousel'},
{name: '<i class="layui-icon layui-icon-prev-circle"></i>翻页(prev-circle)', value: 'prev-circle'},
{name: '<i class="layui-icon layui-icon-layouts"></i>布局(layouts)', value: 'layouts'},
{name: '<i class="layui-icon layui-icon-util"></i>工具(util)', value: 'util'},
{name: '<i class="layui-icon layui-icon-templeate-1"></i>选择模板(templeate-1)', value: 'templeate-1'},
{name: '<i class="layui-icon layui-icon-upload-circle"></i>上传-圆圈(upload-circle)', value: 'upload-circle'},
{name: '<i class="layui-icon layui-icon-tree"></i>树(tree)', value: 'tree'},
{name: '<i class="layui-icon layui-icon-table"></i>表格(table)', value: 'table'},
{name: '<i class="layui-icon layui-icon-chart"></i>图表(chart)', value: 'chart'},
{name: '<i class="layui-icon layui-icon-chart-screen"></i>图标 报表 屏幕(chart-screen)', value: 'chart-screen'},
{name: '<i class="layui-icon layui-icon-engine"></i>引擎(engine)', value: 'engine'},
{name: '<i class="layui-icon layui-icon-triangle-d"></i>下三角(triangle-d)', value: 'triangle-d'},
{name: '<i class="layui-icon layui-icon-triangle-r"></i>右三角(triangle-r)', value: 'triangle-r'},
{name: '<i class="layui-icon layui-icon-file"></i>文件(file)', value: 'file'},
{name: '<i class="layui-icon layui-icon-set-sm"></i>设置-小型(set-sm)', value: 'set-sm'},
{name: '<i class="layui-icon layui-icon-reduce-circle"></i>减少-圆圈(reduce-circle)', value: 'reduce-circle'},
{name: '<i class="layui-icon layui-icon-add-circle"></i>添加-圆圈(add-circle)', value: 'add-circle'},
{name: '<i class="layui-icon layui-icon-404"></i>404(404)', value: '404'},
{name: '<i class="layui-icon layui-icon-about"></i>关于(about)', value: 'about'},
{name: '<i class="layui-icon layui-icon-up"></i>箭头 向上(up)', value: 'up'},
{name: '<i class="layui-icon layui-icon-down"></i>箭头 向下(down)', value: 'down'},
{name: '<i class="layui-icon layui-icon-left"></i>箭头 向左(left)', value: 'left'},
{name: '<i class="layui-icon layui-icon-right"></i>箭头 向右(right)', value: 'right'},
{name: '<i class="layui-icon layui-icon-circle-dot"></i>圆点(circle-dot)', value: 'circle-dot'},
{name: '<i class="layui-icon layui-icon-search"></i>搜索(search)', value: 'search'},
{name: '<i class="layui-icon layui-icon-set-fill"></i>设置-实心(set-fill)', value: 'set-fill'},
{name: '<i class="layui-icon layui-icon-group"></i>群组(group)', value: 'group'},
{name: '<i class="layui-icon layui-icon-friends"></i>好友(friends)', value: 'friends'},
{name: '<i class="layui-icon layui-icon-reply-fill"></i>回复 评论 实心(reply-fill)', value: 'reply-fill'},
{name: '<i class="layui-icon layui-icon-menu-fill"></i>菜单 隐身 实心(menu-fill)', value: 'menu-fill'},
{name: '<i class="layui-icon layui-icon-log"></i>记录(log)', value: 'log'},
{name: '<i class="layui-icon layui-icon-picture-fine"></i>图片-细体(picture-fine)', value: 'picture-fine'},
{name: '<i class="layui-icon layui-icon-face-smile-fine"></i>表情-笑-细体(face-smile-fine)', value: 'face-smile-fine'},
{name: '<i class="layui-icon layui-icon-list"></i>列表(list)', value: 'list'},
{name: '<i class="layui-icon layui-icon-release"></i>发布 纸飞机(release)', value: 'release'},
{name: '<i class="layui-icon layui-icon-ok"></i>对 OK(ok)', value: 'ok'},
{name: '<i class="layui-icon layui-icon-help"></i>帮助(help)', value: 'help'},
{name: '<i class="layui-icon layui-icon-chat"></i>客服(chat)', value: 'chat'},
{name: '<i class="layui-icon layui-icon-top"></i>top 置顶(top)', value: 'top'},
{name: '<i class="layui-icon layui-icon-star"></i>收藏-空心(star)', value: 'star'},
{name: '<i class="layui-icon layui-icon-star-fill"></i>收藏-实心(star-fill)', value: 'star-fill'},
{name: '<i class="layui-icon layui-icon-close-fill"></i>关闭-实心(close-fill)', value: 'close-fill'},
{name: '<i class="layui-icon layui-icon-close"></i>关闭-空心(close)', value: 'close'},
{name: '<i class="layui-icon layui-icon-ok-circle"></i>正确(ok-circle)', value: 'ok-circle'},
{name: '<i class="layui-icon layui-icon-add-circle-fine"></i>添加-圆圈-细体(add-circle-fine)', value: 'add-circle-fine'}
]; 
for (var i = 0; i< noteico_optionData.length; i++) {
var obj=noteico_optionData[i]; 
if(obj.value=="<%=noteico%>"){
obj.selected=true; 
}
}  
xmSelect.render({
el: '#noteico',
name: 'noteico',
radio: true,  // 关键参数：开启单选模式
clickClose: true,  // 选择后自动关闭&
showClear: true,  // 显示清空按钮
filterable: true,  // 开启搜索过滤
autoRow: true,  // 自动换行
data: noteico_optionData,
on: function(data){
if(data.arr.length > 0){
console.log('当前选中:', data.arr[0].value);
}
}
});
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
