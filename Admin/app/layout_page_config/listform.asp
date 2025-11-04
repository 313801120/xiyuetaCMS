<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)
winTitle = ChrW(24067)&ChrW(23616)&ChrW(39029)&ChrW(37197)&ChrW(32622)
dim msg,isTrue,sql,addSql,id,layout_page_id,layout_field_id,sortrank,listitemwidth,islist,isaddedit,isview,isonlineedit,isenglish,inputonlycheck,isinputcheck,isinputtwocolumn,isaddpageview,islistheadsort,isthrough,isshowclick,clickurl,noteleftico,noterighttext,defaultvalue,bodycontent
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
layout_page_id=getStrToNumber(request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)))
if layout_page_id="" then layout_page_id=null
layout_field_id=getStrToNumber(request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)))
if layout_field_id="" then layout_field_id=null
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
listitemwidth=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))
islist=request(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
if islist="" then islist=null
islist=IIF(islist=ChrW(111)&ChrW(110),1,0) 
isaddedit=request(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))
if isaddedit="" then isaddedit=null
isaddedit=IIF(isaddedit=ChrW(111)&ChrW(110),1,0) 
isview=request(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))
if isview="" then isview=null
isview=IIF(isview=ChrW(111)&ChrW(110),1,0) 
isonlineedit=request(ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))
if isonlineedit="" then isonlineedit=null
isonlineedit=IIF(isonlineedit=ChrW(111)&ChrW(110),1,0) 
isenglish=request(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104))
if isenglish="" then isenglish=null
isenglish=IIF(isenglish=ChrW(111)&ChrW(110),1,0) 
inputonlycheck=request(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))
if inputonlycheck="" then inputonlycheck=null
inputonlycheck=IIF(inputonlycheck=ChrW(111)&ChrW(110),1,0) 
isinputcheck=request(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))
if isinputcheck="" then isinputcheck=null
isinputcheck=IIF(isinputcheck=ChrW(111)&ChrW(110),1,0) 
isinputtwocolumn=request(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(119)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110))
if isinputtwocolumn="" then isinputtwocolumn=null
isinputtwocolumn=IIF(isinputtwocolumn=ChrW(111)&ChrW(110),1,0) 
isaddpageview=request(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))
if isaddpageview="" then isaddpageview=null
isaddpageview=IIF(isaddpageview=ChrW(111)&ChrW(110),1,0) 
islistheadsort=request(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116))
if islistheadsort="" then islistheadsort=null
islistheadsort=IIF(islistheadsort=ChrW(111)&ChrW(110),1,0) 
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
if isthrough="" then isthrough=null
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 
isshowclick=request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107))
if isshowclick="" then isshowclick=null
isshowclick=IIF(isshowclick=ChrW(111)&ChrW(110),1,0) 
clickurl=request(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108))
noteleftico=request(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(111))
noterighttext=request(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))
defaultvalue=request(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)& layout_page_id &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)& layout_field_id &ChrW(32)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&addsql

rs.open sql,conn,1,3
if not rs.eof then
msg=ChrW(39029)&ChrW(38754)&ChrW(21517)&ChrW(24050)&ChrW(32463)&ChrW(28155)&ChrW(21152)&ChrW(36807)
else
if id="" then
rs.addnew

else
rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))=layout_page_id
rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))=layout_field_id
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))=listitemwidth
rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=islist
rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))=isaddedit
rs(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))=isview
rs(ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))=isonlineedit
rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104))=isenglish
rs(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))=inputonlycheck
rs(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))=isinputcheck
rs(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(119)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110))=isinputtwocolumn
rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))=isaddpageview
rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116))=islistheadsort
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107))=isshowclick
rs(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108))=clickurl
rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(111))=noteleftico
rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))=noterighttext
rs(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=defaultvalue
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent

if checkEnLanguage() and 1=2  then
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
layout_page_id=rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))
layout_field_id=rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
listitemwidth=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))
islist=rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
isaddedit=rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))
isview=rs(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))
isonlineedit=rs(ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))
isenglish=rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104))
inputonlycheck=rs(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))
isinputcheck=rs(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))
isinputtwocolumn=rs(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(119)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110))
isaddpageview=rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))
islistheadsort=rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isshowclick=rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107))
clickurl=rs(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108))
noteleftico=rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(111))
noterighttext=rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))
defaultvalue=rs(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
end if
else
isthrough=1
sortrank=1
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
if not rs.eof then
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))+sortrank
end if:rs.close
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
<%if checkEnLanguage() and 1=2  then%><li lay-id="22">英文设置</li> <%end if%>
</ul>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>布局页ID</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showSelectLayoutPageId(layout_page_id)%>
</div><!--layout_page_id-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>配置字段ID</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showSelectLayoutFieldId(layout_field_id)%>
</div><!--layout_field_id-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='number' name='sortrank' placeholder='请输入排序'autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>"  lay-verify='required'>
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表项宽</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='listitemwidth' placeholder='请输入列表项宽'autocomplete='off' class='layui-input' value="<%=inputCL(listitemwidth)%>" >
</div><div class="layui-form-mid layui-text-em">列表页里项显示宽度，如：80或min80</div><!--listitemwidth-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表页</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="islist" lay-skin="switch" lay-text="是|否" <%=IIF(islist=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--islist-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isaddedit" lay-skin="switch" lay-text="是|否" <%=IIF(isaddedit=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isaddedit-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看页</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isview" lay-skin="switch" lay-text="是|否" <%=IIF(isview=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isview-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>在线修改</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isonlineedit" lay-skin="switch" lay-text="是|否" <%=IIF(isonlineedit=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isonlineedit-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英语版</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isenglish" lay-skin="switch" lay-text="是|否" <%=IIF(isenglish=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isenglish-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>唯一检测</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="inputonlycheck" lay-skin="switch" lay-text="是|否" <%=IIF(inputonlycheck=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--inputonlycheck-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表单验证</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isinputcheck" lay-skin="switch" lay-text="是|否" <%=IIF(isinputcheck=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isinputcheck-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>一行两列</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isinputtwocolumn" lay-skin="switch" lay-text="是|否" <%=IIF(isinputtwocolumn=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isinputtwocolumn-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页显值</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isaddpageview" lay-skin="switch" lay-text="是|否" <%=IIF(isaddpageview=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isaddpageview-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表头排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="islistheadsort" lay-skin="switch" lay-text="是|否" <%=IIF(islistheadsort=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--islistheadsort-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显点击</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isshowclick" lay-skin="switch" lay-text="是|否" <%=IIF(isshowclick=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isshowclick-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>点击网址</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='clickurl' placeholder='请输入点击网址'autocomplete='off' class='layui-input' value="<%=inputCL(clickurl)%>" >
</div><div class="layui-form-mid layui-text-em">点击弹窗网址，如：'/admin/app/test_layout_page_config/list.asp?layout_page_id='+pid</div><!--clickurl-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>图标注释</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='noteleftico' placeholder='请输入图标注释'autocomplete='off' class='layui-input' value="<%=inputCL(noteleftico)%>" >
</div><div class="layui-form-mid layui-text-em">编辑页字段标题里？号图标</div><!--noteleftico-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>文本注释</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='noterighttext' placeholder='请输入文本注释'autocomplete='off' class='layui-input' value="<%=inputCL(noterighttext)%>" >
</div><div class="layui-form-mid layui-text-em">编辑页字段输入框榜文本注释</div><!--noterighttext-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>默认值</label>
<div class='layui-input-inline layui-input-wrap'>
<textarea name='defaultvalue'  placeholder='请输入默认值' class='layui-textarea'style='height:min100px'><%=defaultvalue%></textarea>
</div><div class="layui-form-mid layui-text-em">可以为数字，为auto+10递增10，或为auto递增1</div><!--defaultvalue-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>备注</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='bodycontent'  placeholder='请输入备注' class='layui-textarea'><%=bodycontent%></textarea>
</div><!--bodycontent-->
</div>
</div>
<%if checkEnLanguage() and 1=2  then%>
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
<script type="text/javascript" src="../../js/pc.js?v20250716_1"></script>
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce','colorpicker'], function() {
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
<!-- 标签显示代码块 --> 
</body>
</html>
