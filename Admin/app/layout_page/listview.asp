<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)
winTitle = ChrW(24067)&ChrW(23616)&ChrW(39029)
dim msg,isTrue,sql,addSql,id,pagename,pagetablename,pagefolder,sortrank,npagesize,isdelinputpass,isshowupdownpage,isbatchdelete,isshowsearch,isshowaddbutton,isshowprint,isshowoperate,isdblclickviewpage,isthrough,addedittip,listqueryfield,listsearch,formviewmaohao,formeditmaohao,listorderby,idindexname,bodycontent,listpagereplace,editpagereplace,viewpagereplace
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
pagename=request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
pagetablename=request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
pagefolder=request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
npagesize=getStrToNumber(request(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)))
if npagesize="" then npagesize=null
isdelinputpass=getStrToNumber(request(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)))
if isdelinputpass="" then isdelinputpass=null
isshowupdownpage=getStrToNumber(request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)))
if isshowupdownpage="" then isshowupdownpage=null
isbatchdelete=getStrToNumber(request(ChrW(105)&ChrW(115)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)))
if isbatchdelete="" then isbatchdelete=null
isshowsearch=getStrToNumber(request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)))
if isshowsearch="" then isshowsearch=null
isshowaddbutton=getStrToNumber(request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)))
if isshowaddbutton="" then isshowaddbutton=null
isshowprint=getStrToNumber(request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116)))
if isshowprint="" then isshowprint=null
isshowoperate=getStrToNumber(request(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)))
if isshowoperate="" then isshowoperate=null
isdblclickviewpage=getStrToNumber(request(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(98)&ChrW(108)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)))
if isdblclickviewpage="" then isdblclickviewpage=null
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
if isthrough="" then isthrough=null
addedittip=request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(116)&ChrW(105)&ChrW(112))
listqueryfield=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))
listsearch=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))
formviewmaohao=request(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))
formeditmaohao=request(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))
listorderby=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(98)&ChrW(121))
idindexname=request(ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
listpagereplace=request(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
editpagereplace=request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
viewpagereplace=request(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& username &ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&addsql

rs.open sql,conn,1,3
if not rs.eof then
msg=ChrW(29992)&ChrW(25143)&ChrW(21517)&ChrW(31216)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew

else
rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=pagename
rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=pagetablename
rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))=pagefolder
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101))=npagesize
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
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))=listqueryfield
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))=listsearch
rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))=formviewmaohao
rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))=formeditmaohao
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(98)&ChrW(121))=listorderby
rs(ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=idindexname
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent
rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))=listpagereplace
rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))=editpagereplace
rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))=viewpagereplace

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
pagename=rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
pagetablename=rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
pagefolder=rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
npagesize=rs(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101))
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
listqueryfield=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))
listsearch=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))
formviewmaohao=rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))
formeditmaohao=rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(111))
listorderby=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(98)&ChrW(121))
idindexname=rs(ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
listpagereplace=rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
editpagereplace=rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
viewpagereplace=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))
end if
else
sortrank=1
npagesize=20
isthrough=1
addedittip=ChrW(26631)&ChrW(39064)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(35831)&ChrW(25442)&ChrW(19968)&ChrW(20010)
formviewmaohao=ChrW(65306)
editpagereplace=ChrW(39)&ChrW(123)&ChrW(28155)&ChrW(21152)&ChrW(26032)&ChrW(30340)&ChrW(36861)&ChrW(21152)&ChrW(22359)&ChrW(125)&ChrW(91)&ChrW(61)&ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59)&ChrW(93)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(41)&ChrW(61)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(91)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(93)&ChrW(39)&ChrW(123)&ChrW(114)&ChrW(115)&ChrW(20889)&ChrW(20837)&ChrW(36861)&ChrW(21152)&ChrW(22359)&ChrW(125)&ChrW(91)&ChrW(61)&ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59)&ChrW(93)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&ChrW(105)&ChrW(112)&ChrW(34)&ChrW(41)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(73)&ChrW(80)&ChrW(40)&ChrW(41)
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
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
<style>.layui-input-inline,.layui-input-block{line-height:40px;color:#999;}</style></head>
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
<label class='layui-form-label'>页名：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=pagename%>      </div><!--pagename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表名：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=pagetablename%>      </div><!--pagetablename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>目录名：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=pagefolder%>      </div><!--pagefolder-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=sortrank%>      </div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>页显示数：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=npagesize%>      </div><!--npagesize-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>删除要密码：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=isdelinputpass%>      </div><!--isdelinputpass-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显首尾页：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=isshowupdownpage%>      </div><!--isshowupdownpage-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显批量删：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=isbatchdelete%>      </div><!--isbatchdelete-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显搜索框：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=isshowsearch%>      </div><!--isshowsearch-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显添加：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=isshowaddbutton%>      </div><!--isshowaddbutton-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显打印：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=isshowprint%>      </div><!--isshowprint-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>显操作：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=isshowoperate%>      </div><!--isshowoperate-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>双击查看：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=isdblclickviewpage%>      </div><!--isdblclickviewpage-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=isthrough%>      </div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>存在提示：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=addedittip%>      </div><!--addedittip-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表查询字段：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=listqueryfield%>      </div><!--listqueryfield-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表搜索：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=listsearch%>      </div><!--listsearch-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看页冒号：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=formviewmaohao%>      </div><!--formviewmaohao-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页冒号：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=formeditmaohao%>      </div><!--formeditmaohao-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表排序：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=listorderby%>      </div><!--listorderby-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>ID索引名：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=idindexname%>      </div><!--idindexname-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>备注：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=bodycontent%>      </div><!--bodycontent-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>列表页替换：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=listpagereplace%>      </div><!--listpagereplace-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编辑页替换：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=editpagereplace%>      </div><!--editpagereplace-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>查看页替换：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=viewpagereplace%>      </div><!--viewpagereplace-->
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
