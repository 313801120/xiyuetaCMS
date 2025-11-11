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
dim msg,isTrue,sql,addSql,id,pagename,pagetablename,tsfield_listpagelistpageform,tsfield_listpagetablebutton,tsfield_listpagerightmenu,tsfield_listpagetableitemmanage,tsfield_layouaction,pagefolder,sortrank,npagesize,aspcodezip,isdelinputpass,isshowupdownpage,isbatchdelete,isshowsearch,isshowaddbutton,isshowprint,isshowoperate,isdblclickviewpage,isthrough,addedittip,listsearch,listqueryfield,formviewmaohao,formeditmaohao,listorderby,idindexname,bodycontent,listpagereplace,editpagereplace,viewpagereplace,helpcontent,ip,tsfield_addr,sdatabasetype,databaseippath,databasename,databaseuser,databasepass
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
aspcodezip=request(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112))
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
ip=request(ChrW(105)&ChrW(112))
sdatabasetype=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
databaseippath=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104))
databaseippath=handleAspStrSafe(databaseippath)
databasename=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
databasename=handleAspStrSafe(databasename)
databaseuser=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))
databaseuser=handleAspStrSafe(databaseuser)
databasepass=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))
databasepass=handleAspStrSafe(databasepass)
if id <>"" then
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
ip=rs(ChrW(105)&ChrW(112))
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
<%%>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>页名：</label>
<div class='layui-input-block layui-input-wrap'>
<%=pagename%>
</div><!--pagename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表名：</label>
<div class='layui-input-block layui-input-wrap'>
<%=pagetablename%>
</div><!--pagetablename-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列表页表单：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_listpagelistpageform%>
</div><!--tsfield_listpagelistpageform-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列表左菜单：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_listpagetablebutton%>
</div><!--tsfield_listpagetablebutton-->
</div>
</div>
</div>    
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>列表右菜单：</label>
<div class='layui-input-block layui-input-wrap'>
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
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_layouaction%>
</div><!--tsfield_layouaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>目录名：</label>
<div class='layui-input-block layui-input-wrap'>
<%=pagefolder%>
</div><!--pagefolder-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序：</label>
<div class='layui-input-block layui-input-wrap'>
<%=sortrank%>
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>页显示数：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45)&ChrW(49)&ChrW(48)&ChrW(45)&ChrW(50)&ChrW(48)&ChrW(45)&ChrW(51)&ChrW(48)&ChrW(45)&ChrW(53)&ChrW(48)&ChrW(45)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(49)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(51)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(53)&ChrW(48)&ChrW(48),npagesize)%>
</div><!--npagesize-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>ASP加密：</label>
<div class='layui-input-block layui-input-wrap'>
<%=showCheckboxDataTitle(ChrW(21024)&ChrW(38500)&ChrW(27880)&ChrW(37322)&ChrW(95)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(20989)&ChrW(25968)&ChrW(21442)&ChrW(25968)&ChrW(28151)&ChrW(28102)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(45)&ChrW(20989)&ChrW(25968)&ChrW(21464)&ChrW(37327)&ChrW(28151)&ChrW(28102)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(45)&ChrW(20840)&ChrW(23616)&ChrW(20989)&ChrW(25968)&ChrW(28151)&ChrW(28102)&ChrW(95)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(98)&ChrW(97)&ChrW(108)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(45)&ChrW(20840)&ChrW(23616)&ChrW(21464)&ChrW(37327)&ChrW(28151)&ChrW(28102)&ChrW(95)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(98)&ChrW(97)&ChrW(108)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(66)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(45)&ChrW(21387)&ChrW(32553)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(122)&ChrW(105)&ChrW(112),aspcodezip)%>                    </div><!--aspcodezip-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>删除要密码：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isdelinputpass=0,ChrW(21542),ChrW(26159))%>
</div><!--isdelinputpass-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显首尾页：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isshowupdownpage=0,ChrW(21542),ChrW(26159))%>
</div><!--isshowupdownpage-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显批量删：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isbatchdelete=0,ChrW(21542),ChrW(26159))%>
</div><!--isbatchdelete-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显搜索框：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isshowsearch=0,ChrW(21542),ChrW(26159))%>
</div><!--isshowsearch-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显添加：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isshowaddbutton=0,ChrW(21542),ChrW(26159))%>
</div><!--isshowaddbutton-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显打印：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isshowprint=0,ChrW(21542),ChrW(26159))%>
</div><!--isshowprint-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显操作：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isshowoperate=0,ChrW(21542),ChrW(26159))%>
</div><!--isshowoperate-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看详细：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isdblclickviewpage=0,ChrW(21542),ChrW(26159))%>
</div><!--isdblclickviewpage-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isthrough=0,ChrW(21542),ChrW(26159))%>
</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>存在提示：</label>
<div class='layui-input-block layui-input-wrap'>
<%=addedittip%>
</div><!--addedittip-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表搜索：</label>
<div class='layui-input-block layui-input-wrap'>
<%=listsearch%>
</div><!--listsearch-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表查询字段：</label>
<div class='layui-input-block layui-input-wrap'>
<%=listqueryfield%>
</div><!--listqueryfield-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看页冒号：</label>
<div class='layui-input-block layui-input-wrap'>
<%=formviewmaohao%>
</div><!--formviewmaohao-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页冒号：</label>
<div class='layui-input-block layui-input-wrap'>
<%=formeditmaohao%>
</div><!--formeditmaohao-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表排序：</label>
<div class='layui-input-block layui-input-wrap'>
<%=listorderby%>
</div><!--listorderby-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>ID索引名：</label>
<div class='layui-input-block layui-input-wrap'>
<%=idindexname%>
</div><!--idindexname-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>备注：</label>
<div class='layui-input-block layui-input-wrap'>
<%=bodycontent%>
</div><!--bodycontent-->
</div>
<%if checkAQX(ChrW(124)&ChrW(49)&ChrW(124)) then%>                <div class='layui-form-item'>
<label class='layui-form-label'>列表页替换：</label>
<div class='layui-input-block layui-input-wrap'>
<%=listpagereplace%>
</div><!--listpagereplace-->
</div>
<%end if%>
<%if checkAQX(ChrW(124)&ChrW(49)&ChrW(124)) then%>                <div class='layui-form-item'>
<label class='layui-form-label'>编辑页替换：</label>
<div class='layui-input-block layui-input-wrap'>
<%=editpagereplace%>
</div><!--editpagereplace-->
</div>
<%end if%>
<%if checkAQX(ChrW(124)&ChrW(49)&ChrW(124)) then%>                <div class='layui-form-item'>
<label class='layui-form-label'>查看页替换：</label>
<div class='layui-input-block layui-input-wrap'>
<%=viewpagereplace%>
</div><!--viewpagereplace-->
</div>
<%end if%>
<div class='layui-form-item'>
<label class='layui-form-label'>帮助内容：</label>
<div class='layui-input-block layui-input-wrap'>
<%=helpcontent%>
</div><!--helpcontent-->
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
<label class='layui-form-label'>数据库类型：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(45)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(95)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(77)&ChrW(121)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(95)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108),databasetype)%>
</div><!--databasetype-->
</div>
<div class='layui-form-item' id="databaseippath">
<label class='layui-form-label'>数据库：</label>
<div class='layui-input-block layui-input-wrap'>
<a href="<%=databaseippath%>" target="_blank" title="点击查看"><%=IIF(databaseippath <>"",databaseippath,"")%></a>
</div><!--databaseippath-->
</div>
<div class='layui-form-item' id="databasename">
<label class='layui-form-label'>数据库名：</label>
<div class='layui-input-block layui-input-wrap'>
<%=databasename%>
</div><!--databasename-->
</div>
<div class='layui-form-item' id="databaseuser">
<label class='layui-form-label'>数据库账号：</label>
<div class='layui-input-block layui-input-wrap'>
<%=databaseuser%>
</div><!--databaseuser-->
</div>
<div class='layui-form-item' id="databasepass">
<label class='layui-form-label'>数据库密码：</label>
<div class='layui-input-block layui-input-wrap'>
<%=databasepass%>
</div><!--databasepass-->
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
