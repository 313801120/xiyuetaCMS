<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)
winTitle = ChrW(32593)&ChrW(31449)&ChrW(26639)&ChrW(30446)
excludeAdminIDLIst=ChrW(48)
dim msg,isTrue,sql,addSql,id,parentid,columntype,npagesize,columnname,columnenname,sortrank,aboutcontent,bodycontent,flags,httpurl,filename,bannerimage,smallimage,webtitle,webkeywords,webdescription,isthrough,ishtml,en_aboutcontent,en_bodycontent,en_webtitle,en_webkeywords,en_webdescription,createhtmltime
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
parentid=getStrToNumber(request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
if parentid="" then parentid=null
columntype=request(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
npagesize=getStrToNumber(request(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)))
if npagesize="" then npagesize=null
columnname=request(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
columnenname=request(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
aboutcontent=request(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
flags=ChrW(124)
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(112))=ChrW(111)&ChrW(110),ChrW(116)&ChrW(111)&ChrW(112)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))=ChrW(111)&ChrW(110),ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116))=ChrW(111)&ChrW(110),ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))=ChrW(111)&ChrW(110),ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(124),"") 
httpurl=request(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))
filename=request(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
bannerimage=request(ChrW(98)&ChrW(97)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
smallimage=request(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
webtitle=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
webkeywords=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
webdescription=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 
ishtml=request(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
ishtml=IIF(ishtml=ChrW(111)&ChrW(110),1,0) 
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
addsql=""
if id <>"" then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName) & addsql

rs.open sql,conn,1,3
if not rs.eof and 1=2 then
msg=ChrW(26639)&ChrW(30446)&ChrW(21517)&ChrW(31216)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
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
rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=columntype
rs(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101))=ensurePositiveValue(rs,npagesize)
rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=columnname
rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=columnenname
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=aboutcontent
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent
rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))=flags
rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))=httpurl
rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=suffixIsHtml(rs,filename)
rs(ChrW(98)&ChrW(97)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))=bannerimage
rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))=smallimage
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=webtitle
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))=webkeywords
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=webdescription
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))=ishtml
rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rs(ChrW(105)&ChrW(112))=getIP()
rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=createhtmltime

if checkEnLanguage() then
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
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
id=rs(ChrW(105)&ChrW(100))
parentid=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
columntype=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
npagesize=rs(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101))
columnname=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
columnenname=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
aboutcontent=rs(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
flags=rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))
httpurl=rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))
filename=rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
bannerimage=rs(ChrW(98)&ChrW(97)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
smallimage=rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
webtitle=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
webkeywords=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
webdescription=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
ishtml=rs(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
en_aboutcontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_bodycontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_webtitle=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_webkeywords=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
en_webdescription=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
createhtmltime=rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
end if
else
npagesize=10
sortrank=10
isthrough=1
ishtml=1
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
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



Function ensurePositiveValue(a,b)
Dim c

If IsEmpty(b) Or IsNull(b) Or Trim(b) = "" Then
c = 10
Else

If IsNumeric(Trim(b)) Then
c = CDbl(Trim(b))

If c < 1 Then
c = 1
End if
Else

c = 1
End if
End if
ensurePositiveValue = c
End function

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
<%=columnClass_webcolumn_SubInput(-1,id,parentid,"")%>
</select>
</div><!--parentid-->
</div>
<div class="layui-row layui-form-item" id="sub_columntype_npagesize">
<div class="layui-col-xs6">
<div class='layui-form-item' id="columntype">
<label class='layui-form-label'>栏目类型</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(39318)&ChrW(39029)&ChrW(95)&ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(45)&ChrW(25991)&ChrW(26412)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(45)&ChrW(20135)&ChrW(21697)&ChrW(95)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(116)&ChrW(45)&ChrW(26032)&ChrW(38395)&ChrW(95)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(45)&ChrW(35270)&ChrW(39057)&ChrW(95)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(111)&ChrW(45)&ChrW(19979)&ChrW(36733)&ChrW(95)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(45)&ChrW(26696)&ChrW(20363)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(45)&ChrW(30041)&ChrW(35328)&ChrW(95)&ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(98)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(45)&ChrW(21453)&ChrW(39304)&ChrW(95)&ChrW(102)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(45)&ChrW(25307)&ChrW(32856)&ChrW(95)&ChrW(106)&ChrW(111)&ChrW(98)&ChrW(45)&ChrW(25628)&ChrW(32034)&ChrW(95)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104),columntype)%>
</div><!--columntype-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item' id="npagesize">
<label class='layui-form-label'>每页显示</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='npagesize' placeholder='请输入每页显示' autocomplete='off' class='layui-input' value="<%=inputCL(npagesize)%>" >
</div>
<div class="layui-form-mid layui-text-em">小于等于0则为模板里自定义默认数</div><!--npagesize-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>栏目名称</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='columnname' placeholder='请输入栏目名称' autocomplete='off' class='layui-input' value="<%=inputCL(columnname)%>" >
</div><!--columnname-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>栏目英文</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='columnenname' placeholder='请输入栏目英文' autocomplete='off' class='layui-input' value="<%=inputCL(columnenname)%>" >
</div><!--columnenname-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='sortrank' placeholder='请输入排序' autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>" >
</div><!--sortrank-->
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
<label class='layui-form-label'>位置</label>
<div class='layui-input-block layui-input-wrap'>
<div class="layui-form">
<input type="checkbox" name="flags_top" title="顶部[top]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_foot" title="底部[foot]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_left" title="左边[left]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_right" title="右边[right]"<%=IIF(instr(ChrW(124)&flags&ChrW(124),ChrW(124)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
</div>
</div><!--flags-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>跳转网址</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='httpurl' placeholder='请输入跳转网址' autocomplete='off' class='layui-input' value="<%=inputCL(httpurl)%>" >
</div><!--httpurl-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>文件名称</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='filename' placeholder='请输入文件名称' autocomplete='off' class='layui-input' value="<%=inputCL(filename)%>" >
</div><!--filename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>banner图</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='bannerimage' placeholder='请输入banner图' autocomplete='off' class='layui-input' value="<%=inputCL(bannerimage)%>" >
</div><!--bannerimage-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-bannerimage"><i class="layui-icon">&#xe67c;</i>上传图片</button>
<input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
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
// 上传图片 for bannerimage
upload.render({
elem: '#upload-bannerimage',
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
$("input[name='bannerimage']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
}
});
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
// 监听栏目类型变化，控制每页显示字段的显示/隐藏
form.on('select(columntype)', function(data){
var columntype = data.value;
var npagesizeDiv = $('#npagesize');
// 当选择产品(product)或新闻(news)时显示每页显示字段
if(columntype === 'product' || columntype === 'news') {
npagesizeDiv.show();
} else {
// 选择其他类型时隐藏每页显示字段
npagesizeDiv.hide();
}
});
// 页面加载时根据当前栏目类型设置每页显示字段的显示状态
$(document).ready(function(){
var currentColumntype = $('select[name="columntype"]').val();
var npagesizeDiv = $('#npagesize'); 
if(currentColumntype === 'product' || currentColumntype === 'news' || currentColumntype === 'video' || currentColumntype === 'down' || currentColumntype === 'case') {
npagesizeDiv.show();
} else {
npagesizeDiv.hide();
}
});
})
// pasteImage("pic");
pasteImage('bannerimage');
pasteImage('smallimage');
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
