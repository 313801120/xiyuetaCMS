<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)
winTitle = ChrW(32593)&ChrW(31449)&ChrW(37197)&ChrW(32622)
excludeAdminIDLIst=ChrW(48)
dim msg,isTrue,sql,addSql,id,webtitle,webkeywords,webdescription,company,logo,biglogo,qrcode,weburl,copyright,phone,tel,fax,email,weixin,qq,webfoot,asporhtml,slanguagelist,en_webtitle,en_webkeywords,en_webdescription,en_company,en_address,en_webfoot,sortrank,isthrough
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
webtitle=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
webkeywords=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
webdescription=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
company=request(ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))
logo=request(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))
biglogo=request(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))
qrcode=request(ChrW(113)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))
weburl=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108))
copyright=request(ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))
phone=request(ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101))
tel=request(ChrW(116)&ChrW(101)&ChrW(108))
fax=request(ChrW(102)&ChrW(97)&ChrW(120))
email=request(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
weixin=request(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110))
qq=request(ChrW(113)&ChrW(113))
webfoot=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))
asporhtml=getStrToNumber(request(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)))
asporhtml=IIF(asporhtml=ChrW(111)&ChrW(110),1,0) 
slanguagelist=request(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
en_webtitle=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_webkeywords=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
en_webdescription=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
en_company=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))
en_address=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))
en_webfoot=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 

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
msg=ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)&ChrW(12290)
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
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=webtitle
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))=webkeywords
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=webdescription
rs(ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))=company
rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))=logo
rs(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))=biglogo
rs(ChrW(113)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))=qrcode
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108))=weburl
rs(ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))=copyright
rs(ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101))=phone
rs(ChrW(116)&ChrW(101)&ChrW(108))=tel
rs(ChrW(102)&ChrW(97)&ChrW(120))=fax
rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))=email
rs(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110))=weixin
rs(ChrW(113)&ChrW(113))=qq
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))=webfoot
rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))=asporhtml
rs(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=slanguagelist
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rs(ChrW(105)&ChrW(112))=getIP()

if checkEnLanguage() then
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=en_webtitle
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))=en_webkeywords
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=en_webdescription
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))=en_company
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))=en_address
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))=en_webfoot
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
webtitle=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
webkeywords=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
webdescription=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
company=rs(ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))
logo=rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))
biglogo=rs(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))
qrcode=rs(ChrW(113)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))
weburl=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108))
copyright=rs(ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))
phone=rs(ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101))
tel=rs(ChrW(116)&ChrW(101)&ChrW(108))
fax=rs(ChrW(102)&ChrW(97)&ChrW(120))
email=rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
weixin=rs(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110))
qq=rs(ChrW(113)&ChrW(113))
webfoot=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))
asporhtml=rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
slanguagelist=rs(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
en_webtitle=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_webkeywords=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
en_webdescription=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
en_company=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))
en_address=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))
en_webfoot=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
end if
else
sortrank=10
isthrough=1
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
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

function handleStrToJsArrayFGX(a)
dim b,c,d
if isNul(a) then exit function
b=split(a,ChrW(124))
for each c in b
if c <>"" then
if d <>"" then d=d &ChrW(44)
d=d & ChrW(34) & c &ChrW(34)
end if
next
handleStrToJsArrayFGX=d
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
<label class='layui-form-label'>公司名称</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='company' placeholder='请输入公司名称' autocomplete='off' class='layui-input' value="<%=inputCL(company)%>" >
</div><!--company-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>Logo(小)</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='logo' placeholder='请输入Logo(小)' autocomplete='off' class='layui-input' value="<%=inputCL(logo)%>" >
</div><!--logo-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-logo"><i class="layui-icon">&#xe67c;</i>上传图片</button>
<input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>Logo(大)</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='biglogo' placeholder='请输入Logo(大)' autocomplete='off' class='layui-input' value="<%=inputCL(biglogo)%>" >
</div><!--biglogo-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-biglogo"><i class="layui-icon">&#xe67c;</i>上传图片</button>
<input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>二维码</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='qrcode' placeholder='请输入二维码' autocomplete='off' class='layui-input' value="<%=inputCL(qrcode)%>" >
</div><!--qrcode-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-qrcode"><i class="layui-icon">&#xe67c;</i>上传图片</button>
<input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>网站域名</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='weburl' placeholder='请输入网站域名' autocomplete='off' class='layui-input' value="<%=inputCL(weburl)%>" >
</div><!--weburl-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>版权</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='copyright' placeholder='请输入版权' autocomplete='off' class='layui-input' value="<%=inputCL(copyright)%>" >
</div><!--copyright-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>手机</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='phone' placeholder='请输入手机' autocomplete='off' class='layui-input' value="<%=inputCL(phone)%>" >
</div><!--phone-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>电话</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='tel' placeholder='请输入电话' autocomplete='off' class='layui-input' value="<%=inputCL(tel)%>" >
</div><!--tel-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>传真</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='fax' placeholder='请输入传真' autocomplete='off' class='layui-input' value="<%=inputCL(fax)%>" >
</div><!--fax-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>邮箱</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='email' placeholder='请输入邮箱' autocomplete='off' class='layui-input' value="<%=inputCL(email)%>" >
</div><!--email-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>微信</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='weixin' placeholder='请输入微信' autocomplete='off' class='layui-input' value="<%=inputCL(weixin)%>" >
</div><!--weixin-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>QQ号</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='qq' placeholder='请输入QQ号' autocomplete='off' class='layui-input' value="<%=inputCL(qq)%>" >
</div><!--qq-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>网页底部</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='webfoot' <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(39),"")%> placeholder='请输入网页底部' class='layui-textarea'style='height:300px'><%=inputCL(webfoot)%></textarea>
</div><!--webfoot-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>仿静态</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="asporhtml" lay-skin="switch" lay-text="静态(.html)|动态(.asp)" <%=IIF(asporhtml=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--asporhtml-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>选择语言</label>
<div class='layui-input-block layui-input-wrap'>
<style>.layui-transfer-header{margin-top: 20px;}</style><div id="languagelist"></div><input type="hidden" name="languagelist" id="languagelist" value="<%=slanguagelist%>" />
</div><!--languagelist-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='sortrank' placeholder='请输入排序' autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>" >
</div><!--sortrank-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>审核</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="是|否" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isthrough-->
</div>
</div>
</div>    
</div>
<%if checkEnLanguage() then%>
<div class="layui-tab-item"> 
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
<div class='layui-form-item'>
<label class='layui-form-label'>英文公司名称</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='en_company' placeholder='请输入英文公司名称' autocomplete='off' class='layui-input' value="<%=inputCL(en_company)%>" >
</div><!--en_company-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文公司地址</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='en_address' placeholder='请输入英文公司地址' autocomplete='off' class='layui-input' value="<%=inputCL(en_address)%>" >
</div><!--en_address-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文网页底部</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='en_webfoot' <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(39),"")%> placeholder='请输入英文网页底部' class='layui-textarea'style='height:300px'><%=inputCL(en_webfoot)%></textarea>
</div><!--en_webfoot-->
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
// 上传图片 for logo
upload.render({
elem: '#upload-logo',
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
$("input[name='logo']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
}
});
// 上传图片 for biglogo
upload.render({
elem: '#upload-biglogo',
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
$("input[name='biglogo']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
}
});
// 上传图片 for qrcode
upload.render({
elem: '#upload-qrcode',
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
$("input[name='qrcode']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
}
});
//编辑器初始化
var editor_webfoot = layui.tinymce;
var edit = editor_webfoot.render({
selector: "#webfoot",
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
var editor_en_webfoot = layui.tinymce;
var edit = editor_en_webfoot.render({
selector: "#en_webfoot",
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
// languagelist穿梭框渲染 20251016
layui.transfer.render({
elem: '#languagelist'
,title: ['未选择', '已选中']  //自定义标题
,data: [{title: '中文', value: 'cn'},{title: '英语', value: 'en'},{title: '繁体', value: 'ft'},{title: '日语', value: 'jp'},{title: '德语', value: 'dy'},{title: '法语', value: 'fy'}]
,id: 'languagelist'
,value: [<%=handleStrToJsArrayFGX(slanguagelist)%>]
,height: 300  // 设置穿梭框高度为300px
,onchange: function(data, index, type){
var getData = layui.transfer.getData('languagelist'); // 获取右侧数据  
// 处理获取到的数据，格式化为|cn|fy|格式
var selectedValues = [];
for (var i = 0; i < getData.length; i++) {
selectedValues.push(getData[i].value);
}
// 将选中的值用|连接，格式如：|cn|fy|
var languageValue = '|' + selectedValues.join('|') + '|';
$("input[name='languagelist']").val(languageValue);
console.log('语言列表值已更新:', languageValue);
}
});
})
// pasteImage("pic");
pasteImage('logo');
pasteImage('biglogo');
pasteImage('qrcode');
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
