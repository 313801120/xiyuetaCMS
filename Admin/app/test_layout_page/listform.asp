<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)
winTitle = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)
excludeAdminIDLIst=ChrW(45)&ChrW(57)&ChrW(57)&ChrW(57)
dim msg,isTrue,sql,addSql,id,pagename,pagetablename,tsfield_listpagelistpageform,tsfield_listpagetablebutton,tsfield_listpagerightmenu,tsfield_listpagetableitemmanage,tsfield_layouaction,pagefolder,sortrank,npagesize,aspcodezip,isdelinputpass,isshowupdownpage,isbatchdelete,isshowsearch,isshowaddbutton,isshowprint,isshowoperate,isdblclickviewpage,isthrough,addedittip,listsearch,listqueryfield,formviewmaohao,formeditmaohao,listorderby,idindexname,bodycontent,listpagereplace,editpagereplace,viewpagereplace,helpcontent,tsfield_addr,sdatabasetype,databaseippath,databasename,databaseuser,databasepass
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
pagename=request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
pagetablename=request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
pagetablename=handleAspStrSafeDirFileName(pagetablename)
pagefolder=request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))
pagefolder=handleAspStrSafeDirFileName(pagefolder)
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
npagesize=getStrToNumber(request(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)))
if npagesize="" then npagesize=null
aspcodezip=ChrW(124)
aspcodezip=aspcodezip & IIF(Request(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))=ChrW(111)&ChrW(110),ChrW(100)&ChrW(101)&ChrW(108)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(124),"") 
aspcodezip=aspcodezip & IIF(Request(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114))=ChrW(111)&ChrW(110),ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(124),"") 
aspcodezip=aspcodezip & IIF(Request(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114))=ChrW(111)&ChrW(110),ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(124),"") 
aspcodezip=aspcodezip & IIF(Request(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(98)&ChrW(97)&ChrW(108)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114))=ChrW(111)&ChrW(110),ChrW(103)&ChrW(108)&ChrW(111)&ChrW(98)&ChrW(97)&ChrW(108)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(124),"") 
aspcodezip=aspcodezip & IIF(Request(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(98)&ChrW(97)&ChrW(108)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114))=ChrW(111)&ChrW(110),ChrW(103)&ChrW(108)&ChrW(111)&ChrW(98)&ChrW(97)&ChrW(108)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(124),"") 
aspcodezip=aspcodezip & IIF(Request(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(122)&ChrW(105)&ChrW(112))=ChrW(111)&ChrW(110),ChrW(122)&ChrW(105)&ChrW(112)&ChrW(124),"") 
isdelinputpass=request(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))
isdelinputpass=IIF(isdelinputpass=ChrW(111)&ChrW(110),1,0) 
isshowupdownpage=request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
isshowupdownpage=IIF(isshowupdownpage=ChrW(111)&ChrW(110),1,0) 
isbatchdelete=request(ChrW(105)&ChrW(115)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101))
isbatchdelete=IIF(isbatchdelete=ChrW(111)&ChrW(110),1,0) 
isshowsearch=request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))
isshowsearch=IIF(isshowsearch=ChrW(111)&ChrW(110),1,0) 
isshowaddbutton=request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110))
isshowaddbutton=IIF(isshowaddbutton=ChrW(111)&ChrW(110),1,0) 
isshowprint=request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116))
isshowprint=IIF(isshowprint=ChrW(111)&ChrW(110),1,0) 
isshowoperate=request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101))
isshowoperate=IIF(isshowoperate=ChrW(111)&ChrW(110),1,0) 
isdblclickviewpage=request(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(98)&ChrW(108)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
isdblclickviewpage=IIF(isdblclickviewpage=ChrW(111)&ChrW(110),1,0) 
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 
addedittip=request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(116)&ChrW(105)&ChrW(112))
addedittip=handleAspStrSafe(addedittip)
listsearch=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))
listsearch=handleAspStrSafeDirFileName(listsearch)
listqueryfield=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))
listqueryfield=handleAspStrSafe(listqueryfield)
formviewmaohao=request(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))
formviewmaohao=handleAspStrSafe(formviewmaohao)
formeditmaohao=request(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))
formeditmaohao=handleAspStrSafe(formeditmaohao)
listorderby=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(98)&ChrW(121))
listorderby=handleAspStrSafeAZDouHao(listorderby)
idindexname=request(ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
idindexname=handleAspStrSafe(idindexname)
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=handleAspStrSafe(bodycontent)
listpagereplace=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
editpagereplace=request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
viewpagereplace=request(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
helpcontent=request(ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
helpcontent=handleAspStrSafe(helpcontent)
sdatabasetype=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
databaseippath=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104))
databaseippath=handleAspStrSafe(databaseippath)
databasename=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
databasename=handleAspStrSafe(databasename)
databaseuser=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))
databaseuser=handleAspStrSafe(databaseuser)
databasepass=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))
databasepass=handleAspStrSafe(databasepass)

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& pagename &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& pagetablename &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(39)& pagefolder &ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName) & addsql

rs.open sql,conn,1,3
if not rs.eof then
msg=ChrW(26631)&ChrW(39064)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(25442)&ChrW(19968)&ChrW(20010)
else
if id="" then
rs.addnew
rs(ChrW(105)&ChrW(112))=getIP()
rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
else
rs.close  
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=pagename
rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=pagetablename
rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))=pagefolder
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101))=npagesize
rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112))=aspcodezip
rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))=isdelinputpass
rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))=isshowupdownpage
rs(ChrW(105)&ChrW(115)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101))=isbatchdelete
rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))=isshowsearch
rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110))=isshowaddbutton
rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116))=isshowprint
rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101))=isshowoperate
rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(98)&ChrW(108)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))=isdblclickviewpage
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(116)&ChrW(105)&ChrW(112))=addedittip
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))=listsearch
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))=listqueryfield
rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))=formviewmaohao
rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))=formeditmaohao
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(98)&ChrW(121))=listorderby
rs(ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=idindexname
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent
if checkAQX(ChrW(124)&ChrW(49)&ChrW(124)) then rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))=listpagereplace
if checkAQX(ChrW(124)&ChrW(49)&ChrW(124)) then rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))=editpagereplace
if checkAQX(ChrW(124)&ChrW(49)&ChrW(124)) then rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))=viewpagereplace
rs(ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=helpcontent
rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=sdatabasetype
rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104))=databaseippath
rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=databasename
rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))=databaseuser
rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))=databasepass
rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()

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

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115) then 
if checkFile(request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)))=false then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(33719)&ChrW(24471)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(23494)&ChrW(30721)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(12290)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
elseif checkMdbPositionSafe(request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)))=false then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(33719)&ChrW(24471)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(23494)&ChrW(30721)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(20301)&ChrW(32622)&ChrW(19981)&ChrW(22312)&ChrW(47)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(109)&ChrW(100)&ChrW(98)&ChrW(47)&ChrW(37324)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
else
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(33719)&ChrW(24471)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(23494)&ChrW(30721)&ChrW(25104)&ChrW(21151)&ChrW(65281)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&getAccessPass(request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)))&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end if

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115) then  
if checkFile(request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)))=false then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(35774)&ChrW(32622)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(23494)&ChrW(30721)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(50)&ChrW(12290)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
elseif checkMdbPositionSafe(request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)))=false then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(35774)&ChrW(32622)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(23494)&ChrW(30721)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(20301)&ChrW(32622)&ChrW(19981)&ChrW(22312)&ChrW(47)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(109)&ChrW(100)&ChrW(98)&ChrW(47)&ChrW(37324)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
else
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(35774)&ChrW(32622)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(23494)&ChrW(30721)&ChrW(65292)&editAccessPassWord(request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)), getAccessPass(request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104))), request(ChrW(110)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)))&ChrW(65281)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end if

elseif id <>"" then
call showCheckAdminRule(ChrW(26597)&ChrW(30475) & winTitle) 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
id=rs(ChrW(105)&ChrW(100))
pagename=rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
pagetablename=rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
tsfield_listpagelistpageform=getFindIdToTableCount(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49))
tsfield_listpagetablebutton=getFindIdToTableCount(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49))
tsfield_listpagerightmenu=getFindIdToTableCount(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49))
tsfield_listpagetableitemmanage=getFindIdToTableCount(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49))
tsfield_layouaction=getFindIdToTableCount(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49))
pagefolder=rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
npagesize=rs(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101))
aspcodezip=rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112))
isdelinputpass=rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))
isshowupdownpage=rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
isbatchdelete=rs(ChrW(105)&ChrW(115)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101))
isshowsearch=rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))
isshowaddbutton=rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110))
isshowprint=rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116))
isshowoperate=rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101))
isdblclickviewpage=rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(98)&ChrW(108)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
addedittip=rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(116)&ChrW(105)&ChrW(112))
listsearch=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))
listqueryfield=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))
formviewmaohao=rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))
formeditmaohao=rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))
listorderby=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(98)&ChrW(121))
idindexname=rs(ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
listpagereplace=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
editpagereplace=rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
viewpagereplace=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
helpcontent=rs(ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
tsfield_addr=ipToAddr2022(rs(ChrW(105)&ChrW(112)),ChrW(97)&ChrW(108)&ChrW(108))
sdatabasetype=rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
databaseippath=rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104))
databasename=rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
databaseuser=rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))
databasepass=rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))
end if
else
sortrank=10
npagesize=20
isdblclickviewpage=1
isthrough=1
addedittip=ChrW(26631)&ChrW(39064)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)&ChrW(12290)
formviewmaohao=ChrW(65306)
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
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

function checkMdbPositionSafe(a)
dim b
checkMdbPositionSafe=true
if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=-999 then
exit function
end if    
b=phptrim(lcase(handlePath(a)))
if instr(b,ChrW(92)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(92)&ChrW(109)&ChrW(100)&ChrW(98)&ChrW(92))=false then

checkMdbPositionSafe=false
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
<label class='layui-form-label'>页名</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='pagename' placeholder='请输入页名' autocomplete='off' class='layui-input' value="<%=inputCL(pagename)%>"  lay-verify='required'>
</div><!--pagename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表名</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='pagetablename' placeholder='请输入表名' autocomplete='off' class='layui-input' value="<%=inputCL(pagetablename)%>"  lay-verify='required'>
</div><!--pagetablename-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列表页表单：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=tsfield_listpagelistpageform%>
</div><!--tsfield_listpagelistpageform-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列表左菜单：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=tsfield_listpagetablebutton%>
</div><!--tsfield_listpagetablebutton-->
</div>
</div>
</div>    
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列表右菜单：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=tsfield_listpagerightmenu%>
</div><!--tsfield_listpagerightmenu-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列表项菜单：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_listpagetableitemmanage%>
</div><!--tsfield_listpagetableitemmanage-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>布局页动作：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=tsfield_layouaction%>
</div><!--tsfield_layouaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>目录名</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='pagefolder' placeholder='请输入目录名' autocomplete='off' class='layui-input' value="<%=inputCL(pagefolder)%>"  lay-verify='required'>
</div>
<div class="layui-form-mid layui-text-em">生成管理页保存目录</div><!--pagefolder-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='sortrank' placeholder='请输入排序' autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>" >
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>页显示数</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45)&ChrW(49)&ChrW(48)&ChrW(45)&ChrW(50)&ChrW(48)&ChrW(45)&ChrW(51)&ChrW(48)&ChrW(45)&ChrW(53)&ChrW(48)&ChrW(45)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(49)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(51)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(53)&ChrW(48)&ChrW(48),npagesize)%>
</div><!--npagesize-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>ASP加密</label>
<div class='layui-input-block layui-input-wrap'>
<div class="layui-form">
<input type="checkbox" name="aspcodezip_delnote" title="删除注释"<%=IIF(instr(ChrW(124)&aspcodezip&ChrW(124),ChrW(124)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="aspcodezip_functionParamBlur" title="函数参数混淆"<%=IIF(instr(ChrW(124)&aspcodezip&ChrW(124),ChrW(124)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="aspcodezip_functionVarBlur" title="函数变量混淆"<%=IIF(instr(ChrW(124)&aspcodezip&ChrW(124),ChrW(124)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="aspcodezip_globalFunctionNameBlur" title="全局函数混淆"<%=IIF(instr(ChrW(124)&aspcodezip&ChrW(124),ChrW(124)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(98)&ChrW(97)&ChrW(108)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="aspcodezip_globalVarBlur" title="全局变量混淆"<%=IIF(instr(ChrW(124)&aspcodezip&ChrW(124),ChrW(124)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(98)&ChrW(97)&ChrW(108)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="aspcodezip_zip" title="压缩ASP"<%=IIF(instr(ChrW(124)&aspcodezip&ChrW(124),ChrW(124)&ChrW(122)&ChrW(105)&ChrW(112)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
</div>
</div><!--aspcodezip-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>删除要密码</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isdelinputpass" lay-skin="switch" lay-text="是|否" <%=IIF(isdelinputpass=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isdelinputpass-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显首尾页</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isshowupdownpage" lay-skin="switch" lay-text="是|否" <%=IIF(isshowupdownpage=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isshowupdownpage-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显批量删</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isbatchdelete" lay-skin="switch" lay-text="是|否" <%=IIF(isbatchdelete=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isbatchdelete-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显搜索框</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isshowsearch" lay-skin="switch" lay-text="是|否" <%=IIF(isshowsearch=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isshowsearch-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显添加</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isshowaddbutton" lay-skin="switch" lay-text="是|否" <%=IIF(isshowaddbutton=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isshowaddbutton-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显打印</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isshowprint" lay-skin="switch" lay-text="是|否" <%=IIF(isshowprint=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isshowprint-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显操作</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isshowoperate" lay-skin="switch" lay-text="是|否" <%=IIF(isshowoperate=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isshowoperate-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看详细</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isdblclickviewpage" lay-skin="switch" lay-text="是|否" <%=IIF(isdblclickviewpage=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">列表页里双击项进入查看页或点击右边更多按钮里的详细</div><!--isdblclickviewpage-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="是|否" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>存在提示</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='addedittip' placeholder='请输入存在提示' autocomplete='off' class='layui-input' value="<%=inputCL(addedittip)%>" >
</div>
<div class="layui-form-mid layui-text-em">编辑页保存数据存在相同时提示 如：标题已经存在</div><!--addedittip-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表搜索</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='listsearch' placeholder='请输入列表搜索' autocomplete='off' class='layui-input' value="<%=inputCL(listsearch)%>" >
</div>
<div class="layui-form-mid layui-text-em">列表请求搜索 如 ： title 会生成如 ( [title] like '%" & keyword & "%' )</div><!--listsearch-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表查询字段</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='listqueryfield' placeholder='请输入列表查询字段' autocomplete='off' class='layui-input' value="<%=inputCL(listqueryfield)%>" >
</div>
<div class="layui-form-mid layui-text-em">列表查询固定字段 如：title,userid</div><!--listqueryfield-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看页冒号</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='formviewmaohao' placeholder='请输入查看页冒号' autocomplete='off' class='layui-input' value="<%=inputCL(formviewmaohao)%>" >
</div>
<div class="layui-form-mid layui-text-em">如：中文冒号：</div><!--formviewmaohao-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页冒号</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='formeditmaohao' placeholder='请输入编辑页冒号' autocomplete='off' class='layui-input' value="<%=inputCL(formeditmaohao)%>" >
</div>
<div class="layui-form-mid layui-text-em">默认为空就可以</div><!--formeditmaohao-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='listorderby' placeholder='请输入列表排序' autocomplete='off' class='layui-input' value="<%=inputCL(listorderby)%>" >
</div>
<div class="layui-form-mid layui-text-em">如：order by sortrank</div><!--listorderby-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>ID索引名</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='idindexname' placeholder='请输入ID索引名' autocomplete='off' class='layui-input' value="<%=inputCL(idindexname)%>" >
</div>
<div class="layui-form-mid layui-text-em">默认为空则为id，也可以改成如：userid</div><!--idindexname-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>备注</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='bodycontent'  placeholder='请输入备注' class='layui-textarea'><%=inputCL(bodycontent)%></textarea>
</div><!--bodycontent-->
</div>
<%if checkAQX(ChrW(124)&ChrW(49)&ChrW(124)) then%>                <div class='layui-form-item'>
<label class='layui-form-label'>列表页替换</label>
<div class='layui-input-inline layui-input-wrap'>
<textarea name='listpagereplace'  placeholder='请输入列表页替换' class='layui-textarea'><%=inputCL(listpagereplace)%></textarea>
</div>
<div class="layui-form-mid layui-text-em">如：aa[=>]bb[---]cc[=>]dd</div><!--listpagereplace-->
</div>
<%end if%>
<%if checkAQX(ChrW(124)&ChrW(49)&ChrW(124)) then%>                <div class='layui-form-item'>
<label class='layui-form-label'>编辑页替换</label>
<div class='layui-input-inline layui-input-wrap'>
<textarea name='editpagereplace'  placeholder='请输入编辑页替换' class='layui-textarea'><%=inputCL(editpagereplace)%></textarea>
</div>
<div class="layui-form-mid layui-text-em">如：aa[=>]bb[---]cc[=>]dd</div><!--editpagereplace-->
</div>
<%end if%>
<%if checkAQX(ChrW(124)&ChrW(49)&ChrW(124)) then%>                <div class='layui-form-item'>
<label class='layui-form-label'>查看页替换</label>
<div class='layui-input-inline layui-input-wrap'>
<textarea name='viewpagereplace'  placeholder='请输入查看页替换' class='layui-textarea'><%=inputCL(viewpagereplace)%></textarea>
</div>
<div class="layui-form-mid layui-text-em">如：aa[=>]bb[---]cc[=>]dd</div><!--viewpagereplace-->
</div>
<%end if%>
<div class='layui-form-item'>
<label class='layui-form-label'>帮助内容</label>
<div class='layui-input-inline layui-input-wrap'>
<textarea name='helpcontent'  placeholder='请输入帮助内容' class='layui-textarea'><%=inputCL(helpcontent)%></textarea>
</div>
<div class="layui-form-mid layui-text-em">点击表格头部？号显示内容</div><!--helpcontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>IP地址：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_addr%>
</div><!--tsfield_addr-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>数据库类型</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(45)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(95)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(77)&ChrW(121)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(95)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108),sdatabasetype)%>
</div>
<div class="layui-form-mid layui-text-em">选择mysql数据库，需要配置dsn的</div><!--databasetype-->
</div>
<div class='layui-form-item' id="databaseippath">
<label class='layui-form-label'>数据库<i class="layui-icon icon-wenhao" data-txt="为IP地址则为sqlserver数据库，为路径则为access数据库">&#xe607;</i> </label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='databaseippath' placeholder='请输入数据库' autocomplete='off' class='layui-input' value="<%=inputCL(databaseippath)%>" >
</div><!--databaseippath-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-databaseippath"><i class="layui-icon">&#xe67c;</i>上传Access数据库</button>
<input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" id="btn-databaseippath-view-pass" class="layui-btn layui-btn-primary">查看access密码</button >
<button type="button" id="btn-databaseippath-edit-pass" class="layui-btn layui-btn-primary">修改access密码</button >
</div>
<div class='layui-form-item' id="databasename">
<label class='layui-form-label'>数据库名</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='databasename' placeholder='请输入数据库名' autocomplete='off' class='layui-input' value="<%=inputCL(databasename)%>" >
</div><!--databasename-->
</div>
<div class='layui-form-item' id="databaseuser">
<label class='layui-form-label'>数据库账号</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='databaseuser' placeholder='请输入数据库账号' autocomplete='off' class='layui-input' value="<%=inputCL(databaseuser)%>" >
</div><!--databaseuser-->
</div>
<div class='layui-form-item' id="databasepass">
<label class='layui-form-label'>数据库密码</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='password' name='databasepass' placeholder='请输入数据库密码' lay-affix="eye" autocomplete='off' class='layui-input' value="<%=inputCL(databasepass)%>" >
</div><!--databasepass-->
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
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce','colorpicker','rate','transfer','croppers'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate,
colorpicker = layui.colorpicker; 
// 上传Access数据库 for databaseippath
upload.render({
elem: '#upload-databaseippath',
url: '/api/upload/?act=mdb',
accept: 'file',
exts: 'mdb',
size: 10485760,
done: function(res) {
if(res.code!=0){              
layer.msg(res.msg, {icon: 2}); 
}else{
layer.msg(res.msg, {icon: 1}); 
if(typeof(res.data[0])!="undefined"){
var imgSrc=res.data[0].src;
$("input[name='databasepass']").val(res.data[0].pass) 
}else{
var imgSrc=res.data.src;
$("input[name='databasepass']").val(res.data.pass) 
}
//$(this.item).prev("div").children("input").val(imgSrc)
$("input[name='databaseippath']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
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
// 数据库类型选择变化时的处理函数
function toggleDatabaseFields(databaseType) {
var databaseippathDiv = $('#databaseippath');
var databasenameDiv = $('#databasename');
var databaseuserDiv = $('#databaseuser');
var databasepassDiv = $('#databasepass');
// Access相关按钮
var uploadBtn = $('#upload-databaseippath');
var viewPassBtn = $('#btn-view-pass');
var editPassBtn = $('#btn-edit-pass');
if (databaseType === 'access') {
// Access选择时：显示数据库和数据库密码，隐藏数据库名和数据库账号
databaseippathDiv.show();
databasenameDiv.hide();
databaseuserDiv.hide();
databasepassDiv.show();
// 显示Access相关按钮
uploadBtn.show();
viewPassBtn.show();
editPassBtn.show();
} else if (databaseType === 'mysql' || databaseType === 'sqlserver') {
// MySQL和SQL Server选择时：显示所有数据库相关字段，隐藏Access相关按钮
databaseippathDiv.show();
databasenameDiv.show();
databaseuserDiv.show();
databasepassDiv.show();
// 隐藏Access相关按钮
uploadBtn.hide();
viewPassBtn.hide();
editPassBtn.hide();
}
}
// 监听数据库类型选择变化
form.on('select(databasetype)', function(data){
toggleDatabaseFields(data.value);
});
// 页面加载时初始化显示状态
$(document).ready(function() {
var currentType = $('#databasetype').val();
toggleDatabaseFields(currentType);
});
// 查看密码：带上 databaseippath 请求服务器
$('#btn-databaseippath-view-pass').on('click', function(){
var dbPath = $("input[name='databaseippath']").val();
if(!dbPath){
layer.msg('请先填写或选择 Access 数据库路径', {icon: 0});
return;
}
NProgress.start();
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=getAccessPass",
data: {  
databaseippath: dbPath
},
success: function(res) {
NProgress.done();
if (res.status === "y") {        
$("input[name='databasepass']").val(res.pass);
layer.msg(res.info+' 密码为：'+res.pass,{icon: 1});
} else {        
layer.msg(res.info,{icon: 2});
}
},
error: function() {
NProgress.done();
layer.msg('请求失败，请重试');
}
});
});
// 修改密码：弹窗输入后提交到服务器
$('#btn-databaseippath-edit-pass').on('click', function(){
var dbPath = $("input[name='databaseippath']").val();
if(!dbPath){
layer.msg('请先填写或选择 Access 数据库路径', {icon: 0});
return;
}
layer.prompt({
formType: 0,
title: '请输入新的 Access 密码'
}, function(value, index){
layer.close(index);
NProgress.start();
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=setAccessPass",
data: {  
databaseippath: dbPath,
newpass: value
},
success: function(res) {
NProgress.done();
if (res.status === "y") {        
$("input[name='databasepass']").val(value);
layer.msg(res.info,{icon: 1});
} else {        
layer.msg(res.info,{icon: 2});
}
},
error: function() {
NProgress.done();
layer.msg('请求失败，请重试');
}
});
});
});
})
// pasteImage("pic");
pasteImage('databaseippath');
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
