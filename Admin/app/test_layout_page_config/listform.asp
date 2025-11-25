<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)
winTitle = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)
excludeAdminIDLIst=ChrW(45)&ChrW(57)&ChrW(57)&ChrW(57)
dim msg,isTrue,sql,addSql,id,layout_page_id,layout_field_id,sortrank,viewsortrank,editsortrank,listitemwidth,edititemwidth,edititemheight,isthrough,islist,isaddedit,isview,isonlineedit,isenglish,inputonlycheck,isinputcheck,isinputtwocolumn,islistheadsort,islistpagejsondata,iseditpageitemwrapaddid,iseditpageitemaddlayfilter,isaddpageview,iseditpageinputhtml,iseditpagehide,islistpagetemplet,isshowclick,clickurl,noteleftico,noterighttext,defaultvalue,bodycontent,listpagenoteico,listpagenote,listpagefieldnoteico,listpagefieldnote,adminroleidlist,admineditroleidlist,addtoinput,iseditpageitemwraphide,iseditsafe,addnewvalue,updatevalue,editpagesaverunaction,editpagerunaction,viewpagerunaction,listpagerunaction
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
layout_page_id=getStrToNumber(request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)))
if layout_page_id="" then layout_page_id=null
layout_field_id=getStrToNumber(request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)))
if layout_field_id="" then layout_field_id=null
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
viewsortrank=getStrToNumber(request(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if viewsortrank="" then viewsortrank=null
editsortrank=getStrToNumber(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if editsortrank="" then editsortrank=null
listitemwidth=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))
listitemwidth=handleAspStrSafe(listitemwidth)
edititemwidth=request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))
edititemwidth=handleAspStrSafe(edititemwidth)
edititemheight=request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))
edititemheight=handleAspStrSafe(edititemheight)
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 
islist=request(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
islist=IIF(islist=ChrW(111)&ChrW(110),1,0) 
isaddedit=request(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))
isaddedit=IIF(isaddedit=ChrW(111)&ChrW(110),1,0) 
isview=request(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))
isview=IIF(isview=ChrW(111)&ChrW(110),1,0) 
isonlineedit=request(ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))
isonlineedit=IIF(isonlineedit=ChrW(111)&ChrW(110),1,0) 
isenglish=request(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104))
isenglish=IIF(isenglish=ChrW(111)&ChrW(110),1,0) 
inputonlycheck=request(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))
inputonlycheck=IIF(inputonlycheck=ChrW(111)&ChrW(110),1,0) 
isinputcheck=request(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))
isinputcheck=IIF(isinputcheck=ChrW(111)&ChrW(110),1,0) 
isinputtwocolumn=request(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(119)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110))
isinputtwocolumn=IIF(isinputtwocolumn=ChrW(111)&ChrW(110),1,0) 
islistheadsort=request(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116))
islistheadsort=IIF(islistheadsort=ChrW(111)&ChrW(110),1,0) 
islistpagejsondata=request(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97))
islistpagejsondata=IIF(islistpagejsondata=ChrW(111)&ChrW(110),1,0) 
iseditpageitemwrapaddid=request(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(100))
iseditpageitemwrapaddid=IIF(iseditpageitemwrapaddid=ChrW(111)&ChrW(110),1,0) 
iseditpageitemaddlayfilter=request(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114))
iseditpageitemaddlayfilter=IIF(iseditpageitemaddlayfilter=ChrW(111)&ChrW(110),1,0) 
isaddpageview=request(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))
isaddpageview=IIF(isaddpageview=ChrW(111)&ChrW(110),1,0) 
iseditpageinputhtml=request(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
iseditpageinputhtml=IIF(iseditpageinputhtml=ChrW(111)&ChrW(110),1,0) 
iseditpagehide=request(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101))
iseditpagehide=IIF(iseditpagehide=ChrW(111)&ChrW(110),1,0) 
islistpagetemplet=request(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116))
islistpagetemplet=IIF(islistpagetemplet=ChrW(111)&ChrW(110),1,0) 
isshowclick=request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107))
isshowclick=IIF(isshowclick=ChrW(111)&ChrW(110),1,0) 
clickurl=request(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108))
clickurl=handleAspStrSafe(clickurl)
noteleftico=request(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(111))
noteleftico=handleAspStrSafe(noteleftico)
noterighttext=request(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))
noterighttext=handleAspStrSafe(noterighttext)
defaultvalue=request(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
defaultvalue=handleAspStrSafe(defaultvalue)
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=handleAspStrSafe(bodycontent)
listpagenoteico=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))
listpagenoteico=handleAspStrSafe(listpagenoteico)
listpagenote=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))
listpagenote=handleAspStrSafe(listpagenote)
listpagefieldnoteico=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))
listpagefieldnoteico=handleAspStrSafe(listpagefieldnoteico)
listpagefieldnote=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))
listpagefieldnote=handleAspStrSafe(listpagefieldnote)
adminroleidlist=request(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
adminroleidlist=handleAspStrSafe(adminroleidlist)
admineditroleidlist=request(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
admineditroleidlist=handleAspStrSafe(admineditroleidlist)
addtoinput=request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116))
addtoinput=handleAspStrSafe(addtoinput)
iseditpageitemwraphide=request(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101))
iseditpageitemwraphide=IIF(iseditpageitemwraphide=ChrW(111)&ChrW(110),1,0) 
iseditsafe=getStrToNumber(request(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(102)&ChrW(101)))
if iseditsafe="" then iseditsafe=null
addnewvalue=request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
updatevalue=request(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
editpagesaverunaction=request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
editpagerunaction=request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
viewpagerunaction=request(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
listpagerunaction=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)& layout_page_id &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)& layout_field_id &""
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
rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))=layout_page_id
rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))=layout_field_id
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=viewsortrank
rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=editsortrank
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))=listitemwidth
rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))=edititemwidth
rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))=edititemheight
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=islist
rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))=isaddedit
rs(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))=isview
rs(ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))=isonlineedit
rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104))=isenglish
rs(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))=inputonlycheck
rs(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))=isinputcheck
rs(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(119)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110))=isinputtwocolumn
rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116))=islistheadsort
rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97))=islistpagejsondata
rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(100))=iseditpageitemwrapaddid
rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114))=iseditpageitemaddlayfilter
rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))=isaddpageview
rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))=iseditpageinputhtml
rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101))=iseditpagehide
rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116))=islistpagetemplet
rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107))=isshowclick
rs(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108))=clickurl
rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(111))=noteleftico
rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))=noterighttext
rs(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=defaultvalue
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))=listpagenoteico
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))=listpagenote
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))=listpagefieldnoteico
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))=listpagefieldnote
rs(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=adminroleidlist
if checkEditAQX(ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)) then rs(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=admineditroleidlist
rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116))=addtoinput
rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101))=iseditpageitemwraphide
rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(102)&ChrW(101))=iseditsafe
rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=addnewvalue
rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=updatevalue
rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=editpagesaverunaction
rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=editpagerunaction
rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=viewpagerunaction
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=listpagerunaction

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
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116) then
call loadLayoutPageFieldList()

elseif id <>"" then
call showCheckAdminRule(ChrW(26597)&ChrW(30475) & winTitle) 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
id=rs(ChrW(105)&ChrW(100))
layout_page_id=rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))
layout_field_id=rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
viewsortrank=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
editsortrank=rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
listitemwidth=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))
edititemwidth=rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))
edititemheight=rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
islist=rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
isaddedit=rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))
isview=rs(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))
isonlineedit=rs(ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))
isenglish=rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104))
inputonlycheck=rs(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))
isinputcheck=rs(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))
isinputtwocolumn=rs(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(119)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110))
islistheadsort=rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116))
islistpagejsondata=rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97))
iseditpageitemwrapaddid=rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(100))
iseditpageitemaddlayfilter=rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114))
isaddpageview=rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))
iseditpageinputhtml=rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
iseditpagehide=rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101))
islistpagetemplet=rs(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116))
isshowclick=rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107))
clickurl=rs(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108))
noteleftico=rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(111))
noterighttext=rs(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))
defaultvalue=rs(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
listpagenoteico=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))
listpagenote=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))
listpagefieldnoteico=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))
listpagefieldnote=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))
adminroleidlist=rs(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
admineditroleidlist=rs(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
addtoinput=rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116))
iseditpageitemwraphide=rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101))
iseditsafe=rs(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(102)&ChrW(101))
addnewvalue=rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
updatevalue=rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
editpagesaverunaction=rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
editpagerunaction=rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
viewpagerunaction=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
listpagerunaction=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
end if
else
sortrank=10
viewsortrank=1
editsortrank=1
isthrough=1
islist=1
isaddedit=1
isview=1
isonlineedit=1
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
if not rs.eof then
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))+sortrank
end if:rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
if not rs.eof then
viewsortrank=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))+viewsortrank
end if:rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
if not rs.eof then
editsortrank=rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))+editsortrank
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

function loadLayoutPageFieldList()  
dim a,b,c
a=getStrToNumber(request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)))
if a <>"" then
b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & a
rs.open b,conn,1,1
if not rs.eof then
c=lcase(getFieldList(db_PREFIX & rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))))

b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
dim d 
rsx.Open b, conn, 1, 1 
while not rsx.EOF 

if left(rsx(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),7)=ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) or rsx(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) or instr(ChrW(44)& c &ChrW(44), ChrW(44)&lcase(rsx(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))&ChrW(44))>0 then
if d <>"" then d=d&ChrW(44)
d = d & ChrW(123)
d = d & ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & rsx(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)
d = d & ChrW(34)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(34)&ChrW(58) & IIF(cstr(rsx(ChrW(105)&ChrW(100)))=layout_field_id,ChrW(49),ChrW(48)) & ChrW(44)
d = d & ChrW(34)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & Server.HTMLEncode(rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) & ChrW(34)&ChrW(44)
d = d & ChrW(34)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & Server.HTMLEncode(rsx(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)
d = d & ChrW(125) 
end if
rsx.MoveNext:wend:rsx.close
end if:rs.close
end if 
call die(ChrW(123)&ChrW(34)&ChrW(115)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) & d & ChrW(93)&ChrW(125))
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

function oneColumnClass_layout_field_SubInput(a)
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d,e
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))&ChrW(32)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not b.eof  
e=""
if a <>"" then
if cStr(a)=cStr(b(ChrW(105)&ChrW(100))) then e=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
c=c & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& b(ChrW(105)&ChrW(100)) &ChrW(34)& e &ChrW(62)& b(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(40)&b(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
b.movenext:wend:b.close
oneColumnClass_layout_field_SubInput=c
end function

function getRadio_admin_role_JsArray(a)
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d,e
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX &ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not b.eof  
e=""
if a <>"" then
if cstr(a)=cstr(b(ChrW(105)&ChrW(100))) then e=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
if c <>"" then c=c &ChrW(44)&vbcrlf
c=c & ChrW(123)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)& b(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) &ChrW(40)&b(ChrW(105)&ChrW(100))&ChrW(41)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)& b(ChrW(105)&ChrW(100)) &ChrW(39)&ChrW(125)    
b.movenext:wend:b.close
getRadio_admin_role_JsArray=c
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
<label class='layui-form-label'>配置字段ID</label>
<div class='layui-input-inline layui-input-wrap'>
<select name="layout_field_id" id="layout_field_id" lay-filter="layout_field_id" selected>
<%=oneColumnClass_layout_field_SubInput(layout_field_id)%>
</select>
</div><!--layout_field_id-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='sortrank' placeholder='请输入排序' autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>" >
</div>
<div class="layui-form-mid layui-text-em">列表页显示排序</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='viewsortrank' placeholder='请输入查看排序' autocomplete='off' class='layui-input' value="<%=inputCL(viewsortrank)%>" >
</div>
<div class="layui-form-mid layui-text-em">查看页显示排序</div><!--viewsortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='editsortrank' placeholder='请输入编辑排序' autocomplete='off' class='layui-input' value="<%=inputCL(editsortrank)%>" >
</div>
<div class="layui-form-mid layui-text-em">编辑页显示排序</div><!--editsortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表项宽</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='listitemwidth' placeholder='请输入列表项宽' autocomplete='off' class='layui-input' value="<%=inputCL(listitemwidth)%>" >
</div>
<div class="layui-form-mid layui-text-em">列表页里项显示宽度，如：80或min80</div><!--listitemwidth-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页宽</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='edititemwidth' placeholder='请输入编辑页宽' autocomplete='off' class='layui-input' value="<%=inputCL(edititemwidth)%>" >
</div>
<div class="layui-form-mid layui-text-em">编辑页里input显示宽度，如：80px，80%</div><!--edititemwidth-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页高</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='edititemheight' placeholder='请输入编辑页高' autocomplete='off' class='layui-input' value="<%=inputCL(edititemheight)%>" >
</div>
<div class="layui-form-mid layui-text-em">编辑页里input显示宽度，如：80px，80%</div><!--edititemheight-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="是|否" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">是否通过</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表页</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="islist" lay-skin="switch" lay-text="是|否" <%=IIF(islist=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">列表页是否显示</div><!--islist-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isaddedit" lay-skin="switch" lay-text="是|否" <%=IIF(isaddedit=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">编辑页是否显示</div><!--isaddedit-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看页</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isview" lay-skin="switch" lay-text="是|否" <%=IIF(isview=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">查看页是否显示</div><!--isview-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>在线修改</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isonlineedit" lay-skin="switch" lay-text="是|否" <%=IIF(isonlineedit=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">列表页是否可在线修改</div><!--isonlineedit-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英语版</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isenglish" lay-skin="switch" lay-text="是|否" <%=IIF(isenglish=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">编辑页和查看在英文块显示</div><!--isenglish-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>唯一检测</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="inputonlycheck" lay-skin="switch" lay-text="是|否" <%=IIF(inputonlycheck=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">字段在表里是唯一的</div><!--inputonlycheck-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表单验证</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isinputcheck" lay-skin="switch" lay-text="是|否" <%=IIF(isinputcheck=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">编辑页检查是否输入值</div><!--isinputcheck-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>一行两列</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isinputtwocolumn" lay-skin="switch" lay-text="是|否" <%=IIF(isinputtwocolumn=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">编辑页和查看页一行显示二个字段</div><!--isinputtwocolumn-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表头排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="islistheadsort" lay-skin="switch" lay-text="是|否" <%=IIF(islistheadsort=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">列表页表头可切换正排序和倒排序</div><!--islistheadsort-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>json数据</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="islistpagejsondata" lay-skin="switch" lay-text="是|否" <%=IIF(islistpagejsondata=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">列表页只在json有，但不展示</div><!--islistpagejsondata-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑项包裹</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="iseditpageitemwrapaddid" lay-skin="switch" lay-text="是|否" <%=IIF(iseditpageitemwrapaddid=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">编辑页项包裹加上ID名</div><!--iseditpageitemwrapaddid-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑项过滤器</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="iseditpageitemaddlayfilter" lay-skin="switch" lay-text="是|否" <%=IIF(iseditpageitemaddlayfilter=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">编辑页项过滤器js里调用</div><!--iseditpageitemaddlayfilter-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页显不能改</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isaddpageview" lay-skin="switch" lay-text="是|否" <%=IIF(isaddpageview=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">编辑页里表里没有这个字段，可以显示input的html块，不写入到数据库</div><!--isaddpageview-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页只显input</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="iseditpageinputhtml" lay-skin="switch" lay-text="是|否" <%=IIF(iseditpageinputhtml=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">编辑页只有input但不保存到表里</div><!--iseditpageinputhtml-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页不显input</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="iseditpagehide" lay-skin="switch" lay-text="是|否" <%=IIF(iseditpagehide=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">编辑页不显input和保存相关配置</div><!--iseditpagehide-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表项H5显示</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="islistpagetemplet" lay-skin="switch" lay-text="是|否" <%=IIF(islistpagetemplet=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">列表页js里显示template处理</div><!--islistpagetemplet-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显点击</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isshowclick" lay-skin="switch" lay-text="是|否" <%=IIF(isshowclick=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">列表页里这个字段可点击</div><!--isshowclick-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>点击网址</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='clickurl' placeholder='请输入点击网址' autocomplete='off' class='layui-input' value="<%=inputCL(clickurl)%>" >
</div>
<div class="layui-form-mid layui-text-em">点击弹窗网址，如：showwin或showwin3默认为showwin3[-]标题默认为系统给的标题[-]'/admin/app/test_layout_page_config/list.asp?layout_page_id='+data.id</div><!--clickurl-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>图标注释</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='noteleftico' placeholder='请输入图标注释' autocomplete='off' class='layui-input' value="<%=inputCL(noteleftico)%>" >
</div>
<div class="layui-form-mid layui-text-em">编辑页字段标题里？号图标</div><!--noteleftico-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>文本注释</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='noterighttext' placeholder='请输入文本注释' autocomplete='off' class='layui-input' value="<%=inputCL(noterighttext)%>" >
</div>
<div class="layui-form-mid layui-text-em">编辑页字段输入框榜文本注释</div><!--noterighttext-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>默认值</label>
<div class='layui-input-inline layui-input-wrap'>
<textarea name='defaultvalue'  placeholder='请输入默认值' class='layui-textarea'><%=inputCL(defaultvalue)%></textarea>
</div>
<div class="layui-form-mid layui-text-em">可以为数字，为auto+10递增10，或为auto递增1，为now date time则为时间</div><!--defaultvalue-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>内容</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='bodycontent' <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39),"")%> placeholder='请输入内容' class='layui-textarea'style='height:300px'><%=inputCL(bodycontent)%></textarea>
</div><!--bodycontent-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>表头项图标</label>
<div class='layui-input-inline layui-input-wrap'>
<div id="listpagenoteico"></div>                    </div><!--listpagenoteico-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列头项注释</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='listpagenote' placeholder='请输入列头项注释' autocomplete='off' class='layui-input' value="<%=inputCL(listpagenote)%>" >
</div><!--listpagenote-->
</div>
</div>
</div>    
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列项图标</label>
<div class='layui-input-inline layui-input-wrap'>
<div id="listpagefieldnoteico"></div>                    </div><!--listpagefieldnoteico-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列项注释</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='listpagefieldnote' placeholder='请输入列项注释' autocomplete='off' class='layui-input' value="<%=inputCL(listpagefieldnote)%>" >
</div><!--listpagefieldnote-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>显示权限</label>
<div class='layui-input-inline layui-input-wrap'>
<div id="adminroleidlist"></div>                    </div>
<div class="layui-form-mid layui-text-em">如果选中对应角色则只有对应角色才显示和可修改值</div><!--adminroleidlist-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>修改权限</label>
<div class='layui-input-inline layui-input-wrap'>
<div id="admineditroleidlist"></div>                    </div>
<div class="layui-form-mid layui-text-em">如果选中对应角色则只有对应角色才显示和可修改值</div><!--admineditroleidlist-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>追加字段后</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='addtoinput' placeholder='请输入追加字段后' autocomplete='off' class='layui-input' value="<%=inputCL(addtoinput)%>" >
</div><!--addtoinput-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑项包裹隐藏</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="iseditpageitemwraphide" lay-skin="switch" lay-text="是|否" <%=IIF(iseditpageitemwraphide=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--iseditpageitemwraphide-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑安全</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(45)&ChrW(26080)&ChrW(95)&ChrW(48)&ChrW(45)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(26631)&ChrW(31614)&ChrW(36716)&ChrW(20041)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(23383)&ChrW(27597)&ChrW(36887)&ChrW(21495)&ChrW(31354)&ChrW(26684)&ChrW(95)&ChrW(50)&ChrW(45)&ChrW(30446)&ChrW(24405)&ChrW(25991)&ChrW(20214)&ChrW(21517)&ChrW(95)&ChrW(51),iseditsafe)%>
</div>
<div class="layui-form-mid layui-text-em">处理asp标签到转义</div><!--iseditsafe-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>添加系统值</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(45)&ChrW(26080)&ChrW(95)&ChrW(45)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(50)&ChrW(45)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(51)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(52)&ChrW(45)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(73)&ChrW(68)&ChrW(95)&ChrW(53),addnewvalue)%>
</div><!--addnewvalue-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>更新系统值</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(45)&ChrW(26080)&ChrW(95)&ChrW(45)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(50)&ChrW(45)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(51)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(52)&ChrW(45)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(73)&ChrW(68)&ChrW(95)&ChrW(53),updatevalue)%>
</div><!--updatevalue-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页保存运行动作</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='editpagesaverunaction' placeholder='请输入编辑页保存运行动作' autocomplete='off' class='layui-input' value="<%=inputCL(editpagesaverunaction)%>" >
</div>
<div class="layui-form-mid layui-text-em">编辑页项保存时处理动作，如加函数ensurePositiveValue,suffixIsHtml</div><!--editpagesaverunaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页运行动作</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='editpagerunaction' placeholder='请输入编辑页运行动作' autocomplete='off' class='layui-input' value="<%=inputCL(editpagerunaction)%>" >
</div>
<div class="layui-form-mid layui-text-em">编辑页项显示时处理动作，如加函数</div><!--editpagerunaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看页运行动作</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='viewpagerunaction' placeholder='请输入查看页运行动作' autocomplete='off' class='layui-input' value="<%=inputCL(viewpagerunaction)%>" >
</div>
<div class="layui-form-mid layui-text-em">查看页项显示时处理动作，如加函数</div><!--viewpagerunaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表页运行动作</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='listpagerunaction' placeholder='请输入列表页运行动作' autocomplete='off' class='layui-input' value="<%=inputCL(listpagerunaction)%>" >
</div>
<div class="layui-form-mid layui-text-em">列表页项显示时处理动作，如加函数</div><!--listpagerunaction-->
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
<script src="../../layuiadmin/js/xm-select.js"></script>
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
// 监听布局页ID选择变化
form.on('select(layout_page_id)', function(data){
var layout_page_id = data.value;
var layout_field_id=$("#layout_field_id").val()
// alert(layout_page_id)
// alert(layout_field_id)
console.log('选择的布局页ID:', layout_page_id);
if(layout_page_id) {
// 显示加载状态
var loadingIndex = layer.load(1, {shade: [0.1,'#fff']});
// 发送Ajax请求获取对应的配置字段
$.ajax({
url: '?act=getLayoutFieldList',
type: 'POST',
data: {
layout_page_id: layout_page_id,
layout_field_id: layout_field_id
},
dataType: 'json',
success: function(response) {
layer.close(loadingIndex);
console.log('Ajax响应:', response);
if(response.success) {
// 清空并重新填充配置字段ID下拉框
var $layoutFieldSelect = $('#layout_field_id');
$layoutFieldSelect.empty();
$layoutFieldSelect.append('<option value="">请选择配置字段</option>');
if(response.data && response.data.length > 0) {
$.each(response.data, function(index, item) {
var selected = '';
if(item.isselect == 1 || item.isselect == "1") {
selected = ' selected';
}
$layoutFieldSelect.append('<option value="' + item.id + '"' + selected + '>' + item.title + '(' + item.fieldName + ')</option>');
});
} else {
$layoutFieldSelect.append('<option value="">暂无可用字段</option>');
}
// 重新渲染表单
form.render('select');
layer.msg('已加载配置字段', {icon: 1});
} else {
layer.msg('获取配置字段失败：' + response.message, {icon: 2});
}
},
error: function(xhr, status, error) {
layer.close(loadingIndex);
console.error('Ajax请求失败:', xhr.responseText);
layer.msg('请求失败，请检查网络连接', {icon: 2});
}
});
} else {
// 如果清空选择，则清空配置字段下拉框
var $layoutFieldSelect = $('#layout_field_id');
$layoutFieldSelect.empty();
$layoutFieldSelect.append('<option value="">请选择配置字段</option>');
form.render('select');
}
});
// 准备数据源
var listpagenoteico_optionData = [
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
for (var i = 0; i< listpagenoteico_optionData.length; i++) {
var obj=listpagenoteico_optionData[i]; 
if(obj.value=="<%=listpagenoteico%>"){
obj.selected=true; 
}
}  
xmSelect.render({
el: '#listpagenoteico',
name: 'listpagenoteico',
radio: true,  // 关键参数：开启单选模式
clickClose: true,  // 选择后自动关闭&
showClear: true,  // 显示清空按钮
filterable: true,  // 开启搜索过滤
autoRow: true,  // 自动换行
data: listpagenoteico_optionData,
on: function(data){
if(data.arr.length > 0){
console.log('当前选中:', data.arr[0].value);
}
}
});
// 准备数据源
var listpagefieldnoteico_optionData = [
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
for (var i = 0; i< listpagefieldnoteico_optionData.length; i++) {
var obj=listpagefieldnoteico_optionData[i]; 
if(obj.value=="<%=listpagefieldnoteico%>"){
obj.selected=true; 
}
}  
xmSelect.render({
el: '#listpagefieldnoteico',
name: 'listpagefieldnoteico',
radio: true,  // 关键参数：开启单选模式
clickClose: true,  // 选择后自动关闭&
showClear: true,  // 显示清空按钮
filterable: true,  // 开启搜索过滤
autoRow: true,  // 自动换行
data: listpagefieldnoteico_optionData,
on: function(data){
if(data.arr.length > 0){
console.log('当前选中:', data.arr[0].value);
}
}
});
// 准备数据源
var adminroleidlist_optionData = [
<%=getRadio_admin_role_JsArray(adminroleidlist)%>
]; 
for (var i = 0; i< adminroleidlist_optionData.length; i++) {
var obj=adminroleidlist_optionData[i]; 
if(",<%=adminroleidlist%>,".indexOf(","+obj.value+",")!=-1){
obj.selected=true; 
}
}  
xmSelect.render({
el: '#adminroleidlist',
name: 'adminroleidlist',
showClear: true,  // 显示清空按钮
filterable: true,  // 开启搜索过滤
autoRow: true,  // 自动换行
data: adminroleidlist_optionData,
on: function(data){
if(data.arr.length > 0){
console.log('当前选中:', data.arr[0].value);
}
}
});
// 准备数据源
var admineditroleidlist_optionData = [
<%=getRadio_admin_role_JsArray(admineditroleidlist)%>
]; 
for (var i = 0; i< admineditroleidlist_optionData.length; i++) {
var obj=admineditroleidlist_optionData[i]; 
if(",<%=admineditroleidlist%>,".indexOf(","+obj.value+",")!=-1){
obj.selected=true; 
}
}  
xmSelect.render({
el: '#admineditroleidlist',
name: 'admineditroleidlist',
showClear: true,  // 显示清空按钮
filterable: true,  // 开启搜索过滤
autoRow: true,  // 自动换行
data: admineditroleidlist_optionData,
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
