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
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
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

function get_layout_page_oneClassColumnName(a) 
if isnul(a) then exit function
dim b
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))  
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
b=c(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))& ChrW(40)&c(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(41)
end if:c.close 
get_layout_page_oneClassColumnName=b
end function

function get_layout_field_oneClassColumnName(a) 
if isnul(a) then exit function
dim b
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))  
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
b=c(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))& ChrW(40)&c(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(41)
end if:c.close 
get_layout_field_oneClassColumnName=b
end function

function get_admin_role_oneClassColumnName(a) 
if isnul(a) then exit function
dim b,c
dim d:Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))  
d.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&a&ChrW(41),conn,1,1
while not d.eof
b=d(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))& ChrW(40)&d(ChrW(105)&ChrW(100))&ChrW(41)
if c <>"" then c=c&ChrW(32)&ChrW(44)&ChrW(32)
c=c&b
d.movenext:wend:d.close
get_admin_role_oneClassColumnName=c
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
<label class='layui-form-label'>布局页ID：</label>
<div class='layui-input-block layui-input-wrap'>
<%=get_layout_page_oneClassColumnName(layout_page_id)%>
</div><!--layout_page_id-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>配置字段ID：</label>
<div class='layui-input-block layui-input-wrap'>
<%=get_layout_field_oneClassColumnName(layout_field_id)%>
</div><!--layout_field_id-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序：</label>
<div class='layui-input-block layui-input-wrap'>
<%=sortrank%>
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看排序：</label>
<div class='layui-input-block layui-input-wrap'>
<%=viewsortrank%>
</div><!--viewsortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑排序：</label>
<div class='layui-input-block layui-input-wrap'>
<%=editsortrank%>
</div><!--editsortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表项宽：</label>
<div class='layui-input-block layui-input-wrap'>
<%=listitemwidth%>
</div><!--listitemwidth-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页宽：</label>
<div class='layui-input-block layui-input-wrap'>
<%=edititemwidth%>
</div><!--edititemwidth-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页高：</label>
<div class='layui-input-block layui-input-wrap'>
<%=edititemheight%>
</div><!--edititemheight-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isthrough=0,ChrW(21542),ChrW(26159))%>
</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表页：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(islist=0,ChrW(21542),ChrW(26159))%>
</div><!--islist-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isaddedit=0,ChrW(21542),ChrW(26159))%>
</div><!--isaddedit-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看页：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isview=0,ChrW(21542),ChrW(26159))%>
</div><!--isview-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>在线修改：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isonlineedit=0,ChrW(21542),ChrW(26159))%>
</div><!--isonlineedit-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英语版：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isenglish=0,ChrW(21542),ChrW(26159))%>
</div><!--isenglish-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>唯一检测：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(inputonlycheck=0,ChrW(21542),ChrW(26159))%>
</div><!--inputonlycheck-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表单验证：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isinputcheck=0,ChrW(21542),ChrW(26159))%>
</div><!--isinputcheck-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>一行两列：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isinputtwocolumn=0,ChrW(21542),ChrW(26159))%>
</div><!--isinputtwocolumn-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表头排序：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(islistheadsort=0,ChrW(21542),ChrW(26159))%>
</div><!--islistheadsort-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>json数据：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(islistpagejsondata=0,ChrW(21542),ChrW(26159))%>
</div><!--islistpagejsondata-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑项包裹：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(iseditpageitemwrapaddid=0,ChrW(21542),ChrW(26159))%>
</div><!--iseditpageitemwrapaddid-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑项过滤器：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(iseditpageitemaddlayfilter=0,ChrW(21542),ChrW(26159))%>
</div><!--iseditpageitemaddlayfilter-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页显不能改：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isaddpageview=0,ChrW(21542),ChrW(26159))%>
</div><!--isaddpageview-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页只显input：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(iseditpageinputhtml=0,ChrW(21542),ChrW(26159))%>
</div><!--iseditpageinputhtml-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页不显input：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(iseditpagehide=0,ChrW(21542),ChrW(26159))%>
</div><!--iseditpagehide-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表项H5显示：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(islistpagetemplet=0,ChrW(21542),ChrW(26159))%>
</div><!--islistpagetemplet-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显点击：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isshowclick=0,ChrW(21542),ChrW(26159))%>
</div><!--isshowclick-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>点击网址：</label>
<div class='layui-input-block layui-input-wrap'>
<%=clickurl%>
</div><!--clickurl-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>图标注释：</label>
<div class='layui-input-block layui-input-wrap'>
<%=noteleftico%>
</div><!--noteleftico-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>文本注释：</label>
<div class='layui-input-block layui-input-wrap'>
<%=noterighttext%>
</div><!--noterighttext-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>默认值：</label>
<div class='layui-input-block layui-input-wrap'>
<%=defaultvalue%>
</div><!--defaultvalue-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>内容：</label>
<div class='layui-input-block layui-input-wrap'>
<%=bodycontent%>
</div><!--bodycontent-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>表头项图标：</label>
<div class='layui-input-block layui-input-wrap'>
<%=listpagenoteico%>
</div><!--listpagenoteico-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列头项注释：</label>
<div class='layui-input-block layui-input-wrap'>
<%=listpagenote%>
</div><!--listpagenote-->
</div>
</div>
</div>    
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列项图标：</label>
<div class='layui-input-block layui-input-wrap'>
<%=listpagefieldnoteico%>
</div><!--listpagefieldnoteico-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列项注释：</label>
<div class='layui-input-block layui-input-wrap'>
<%=listpagefieldnote%>
</div><!--listpagefieldnote-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>显示权限：</label>
<div class='layui-input-block layui-input-wrap'>
<%=get_admin_role_oneClassColumnName(adminroleidlist)%>
</div><!--adminroleidlist-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>修改权限：</label>
<div class='layui-input-block layui-input-wrap'>
<%=get_admin_role_oneClassColumnName(admineditroleidlist)%>
</div><!--admineditroleidlist-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>追加字段后：</label>
<div class='layui-input-block layui-input-wrap'>
<%=addtoinput%>
</div><!--addtoinput-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑项包裹隐藏：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(iseditpageitemwraphide=0,ChrW(21542),ChrW(26159))%>
</div><!--iseditpageitemwraphide-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑安全：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(45)&ChrW(26080)&ChrW(95)&ChrW(48)&ChrW(45)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(26631)&ChrW(31614)&ChrW(36716)&ChrW(20041)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(23383)&ChrW(27597)&ChrW(36887)&ChrW(21495)&ChrW(31354)&ChrW(26684)&ChrW(95)&ChrW(50)&ChrW(45)&ChrW(30446)&ChrW(24405)&ChrW(25991)&ChrW(20214)&ChrW(21517)&ChrW(95)&ChrW(51),iseditsafe)%>
</div><!--iseditsafe-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>添加系统值：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(45)&ChrW(26080)&ChrW(95)&ChrW(45)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(50)&ChrW(45)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(51)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(52),addnewvalue)%>
</div><!--addnewvalue-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>更新系统值：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(45)&ChrW(26080)&ChrW(95)&ChrW(45)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(50)&ChrW(45)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(51)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(95)&ChrW(52),updatevalue)%>
</div><!--updatevalue-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页保存运行动作：</label>
<div class='layui-input-block layui-input-wrap'>
<%=editpagesaverunaction%>
</div><!--editpagesaverunaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页运行动作：</label>
<div class='layui-input-block layui-input-wrap'>
<%=editpagerunaction%>
</div><!--editpagerunaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看页运行动作：</label>
<div class='layui-input-block layui-input-wrap'>
<%=viewpagerunaction%>
</div><!--viewpagerunaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表页运行动作：</label>
<div class='layui-input-block layui-input-wrap'>
<%=listpagerunaction%>
</div><!--listpagerunaction-->
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
