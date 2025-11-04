<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
tableName=ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)
winTitle=ChrW(26639)&ChrW(30446)
dim msg,isTrue,addSql,id,parentid,columnName,columnEnName,isthrough,sortrank,columnType,bodycontent,splstr,splxx,s,sel,flags,httpUrl,bannerImage,filename,webtitle,webkeywords,webdescription,smallimage,aboutcontent
id=request(ChrW(105)&ChrW(100))
parentid=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
columnName=request(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
columnEnName=request(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
columnType=request(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))
filename=request(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
sortrank=request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
if sortrank="" then sortrank=0
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
aboutcontent=request(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
flags=request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))
httpUrl=request(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(85)&ChrW(114)&ChrW(108))
smallimage=request(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
bannerImage=request(ChrW(98)&ChrW(97)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(73)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
webtitle=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
webkeywords=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
webdescription=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0)
if parentid="" then 
parentid=-1
else
parentid=int(parentid)
end if 

dim en_aboutcontent,en_bodycontent,en_webtitle,en_webkeywords,en_webdescription
en_aboutcontent=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_bodycontent=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_webtitle=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_webkeywords=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
en_webdescription=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& columnName &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61) & parentid
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&addsql,conn,1,3
if not rs.eof then
msg=ChrW(26639)&ChrW(30446)&ChrW(21517)&ChrW(31216)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
else
rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=parentid 
rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=columnName 
rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=columnEnName 
rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))=columnType 
rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=filename 
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank 
rs(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=aboutcontent 
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent 
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough 
rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))=flags 
rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(85)&ChrW(114)&ChrW(108))=httpUrl 
rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))=smallimage 
rs(ChrW(98)&ChrW(97)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(73)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))=bannerImage 
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=webtitle 
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))=webkeywords 
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=webdescription 

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
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
parentid=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) 
id=rs(ChrW(105)&ChrW(100)) 
columnName=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))   
columnEnName=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))   
columnType=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))   
filename=rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))   
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))   
aboutcontent=rs(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))   
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))   
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))  
flags=rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))  
httpUrl=rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(85)&ChrW(114)&ChrW(108))  
smallimage=rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))  
bannerImage=rs(ChrW(98)&ChrW(97)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(73)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))  
webtitle=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))  
webkeywords=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))  
webdescription=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))  

en_aboutcontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_bodycontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
en_webtitle=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
en_webkeywords=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
en_webdescription =rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
end if
else
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
<style>
/*关键词*/
.label {
display: inline;
padding: 0.2em 0.6em 0.3em;
font-size: 75%;
font-weight: 700;
line-height: 1; 
color: #fff;
text-align: center;
white-space: nowrap;
vertical-align: baseline;
border-radius: 0.25em;
}
.label-info {
background-color: #5bc0de;
}
</style>
<body>   
<script src="../../js/jquery.js"></script>
<%if msg <>"" then  call rw(ChrW(60)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62)& msg &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(62))%>
<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 0px 0 0 0;">
<div class="layui-tab" lay-filter="test-hash">
<ul class="layui-tab-title">
<li class="layui-this" lay-id="11">中文设置</li>
<li lay-id="22">英文设置</li> 
</ul>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class="layui-form-item">
<label class="layui-form-label">选择分类</label>
<div class="layui-input-inline">
<select name="parentid" id="parentid" selected>
<option value="-1">≡ 作为一级栏目 ≡</option>
<%=columnSubInput(-1,id,parentid)%>
</select>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">栏目类型</label>
<div class="layui-input-inline">
<select name="columnType" id="columnType" selected="">
<%
splstr=split(WEBCOLUMNTYPE,ChrW(44))
for each s in splstr
if instr(s,ChrW(124))>0 then
splxx=split(s,ChrW(124))
sel=""
if splxx(1)=columnType then sel=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
call rw(ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(39)& splxx(1) & ChrW(39) & sel &ChrW(62)& splxx(0) &ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62))      
end if
next
%>
</select>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">栏目名称</label>
<div class="layui-input-inline">
<input type="text" name="columnName" lay-verify="required" placeholder="请输入栏目名称" autocomplete="off" class="layui-input" value="<%=columnName%>">
</div>
</div>                
<div class="layui-form-item">
<label class="layui-form-label">栏目英文名</label>
<div class="layui-input-inline">
<input type="text" name="columnEnName" placeholder="请输入栏目英文名称" autocomplete="off" class="layui-input" value="<%=columnEnName%>">
</div>
</div> 
<div class="layui-form-item">
<label class="layui-form-label">排序</label>
<div class="layui-input-inline">
<input type="text" name="sortrank" lay-verify="number" placeholder="请输入排序" autocomplete="off" class="layui-input" value="<%=sortrank%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">简要说明</label>
<div class="layui-input-block">
<textarea name="aboutcontent" placeholder="请输入简要说明" class="layui-textarea"><%=aboutcontent%></textarea>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">内容</label>
<div class="layui-input-block">
<textarea name='bodycontent' <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39),"")%> placeholder='请输入留言内容' class='layui-textarea'style='height:300px'><%=bodycontent%></textarea>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">位置</label>
<div class="layui-input-inline">
<select name="flags" id="flags">
<option value=''>请输入栏目显示位置</option>
<option value='top'<%=IIF(flags=ChrW(116)&ChrW(111)&ChrW(112),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>顶部</option>
<option value='foot'<%=IIF(flags=ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>底部</option>
<option value='left'<%=IIF(flags=ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>左边</option>
<option value='right'<%=IIF(flags=ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>右边</option>
<option value='top|foot'<%=IIF(flags=ChrW(116)&ChrW(111)&ChrW(112)&ChrW(124)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>顶部和底部</option>
</select>
</div>
</div> 
<div class="layui-form-item">
<label class="layui-form-label">跳转网址</label>
<div class="layui-input-inline">
<input type="text" name="httpUrl" placeholder="请输入跳转网址" autocomplete="off" class="layui-input" value="<%=httpUrl%>">
</div>
</div> 
<div class="layui-form-item">
<label class="layui-form-label">文件名称</label>
<div class="layui-input-inline">
<input type="text" name="filename" placeholder="请输入文件名称" autocomplete="off" class="layui-input" value="<%=filename%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">banner图</label>
<div class="layui-input-inline">
<input type="text" name="bannerimage" id="bannerimage" placeholder="请上传banner图" autocomplete="off" class="layui-input" value="<%=bannerimage%>" >
<!-- onmousemove="showBigPic(this.value)" onmouseout="closeimg()"> -->
</div> 
<button type="button" class="layui-btn layui-btn-primary" id="layuiadmin-upload-bannerimage">
<i class="layui-icon">&#xe67c;</i>上传图片
</button><input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreviewbannerimage">查看图片</button >
</div>
<div class="layui-form-item">
<label class="layui-form-label">小图</label>
<div class="layui-input-inline">
<input type="text" name="smallimage" id="smallimage" placeholder="请上传小图" autocomplete="off" class="layui-input" value="<%=smallimage%>" >
<!-- onmousemove="showBigPic(this.value)" onmouseout="closeimg()"> -->
</div> 
<button type="button" class="layui-btn layui-btn-primary" id="layuiadmin-upload-smallimage">
<i class="layui-icon">&#xe67c;</i>上传图片
</button><input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreviewsmallimage">查看图片</button >
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">title标题</label>
<div class="layui-input-block">
<textarea name="webtitle" class="layui-textarea" placeholder="title标题"><%=webtitle%></textarea>
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">META关键词</label>
<div class="layui-input-block">
<textarea name="webkeywords" class="layui-textarea" placeholder="多个关键词用英文状态 , 号分割"><%=webkeywords%></textarea>
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">META描述</label>
<div class="layui-input-block">
<textarea name="webdescription" class="layui-textarea"><%=webdescription%></textarea>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">审核状态</label>
<div class="layui-input-inline">
<input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
</div>
</div>
<div class="layui-tab-item">
<div class="layui-form-item">
<label class="layui-form-label">英文简要说明</label>
<div class="layui-input-block">
<textarea name="en_aboutcontent" placeholder="请输入英文简要说明" class="layui-textarea"><%=en_aboutcontent%></textarea>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">英文内容</label>
<div class="layui-input-block">
<textarea name="en_bodycontent" placeholder="请输入英文内容" class="layui-textarea" id="en_bodycontent" style="border:0;padding:0"><%=en_bodycontent%></textarea>
</div>
</div>  
<div class="layui-form-item">
<label class="layui-form-label">英文网站标题</label>
<div class="layui-input-block">
<input type="text" name="en_webtitle" value="<%=en_webtitle%>" class="layui-input">
</div>
</div> 
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">英文META关键词</label>
<div class="layui-input-block"> 
<input type="text" autocomplete="off" class="form-control" data-role="tagsinput" id="keyword" value="<%=en_webkeywords%>" name="en_webkeywords"  > 
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">英文META描述</label>
<div class="layui-input-block">
<textarea name="en_webdescription" class="layui-textarea"><%=en_webdescription%></textarea>
</div>
</div>
</div>
<div class="layui-form-item layui-hide">
<input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
</div>
</div> 
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../..//js/pc.js?v6"></script>
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate;
var a = (layui.laytpl, layui.setter, layui.view, layui.admin);
//查看图片
a.events.avartatPreviewbannerimage = function(t) {
var i = $("#bannerimage").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
}
var b = (layui.laytpl, layui.setter, layui.view, layui.admin);
//查看图片
b.events.avartatPreviewsmallimage = function(t) {
var i = $("#smallimage").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
}
//正常上传图片
upload.render({
elem: '#layuiadmin-upload-bannerimage',   
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
$(this.item).prev("div").children("input").val(imgSrc)
}
}
});
//正常上传图片
upload.render({
elem: '#layuiadmin-upload-smallimage',
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
$(this.item).prev("div").children("input").val(imgSrc)
}
}
});
lay('.date').each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy-MM-dd'
});
});
lay('.time').each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy-MM-dd HH:mm:ss'
});
});
//编码器 旧版
// var layedit = layui.layedit;
// layedit.set({
//     //暴露layupload参数设置接口 --详细查看layupload参数说明
//     uploadImage: { 
//         url: '/api/upload/?act=one'    //上传接口url
//         ,type: 'post' //默认post 
//     }
//     ,uploadVideo: {
//                 url: '/api/upload/uploadVideo.asp?act=one',
//                 accept: 'video',
//                 acceptMime: 'video/*',
//                 exts: 'mp4|flv|avi|rm|rmvb',
//                 size: '20480'
//             }
//     , tool: [
//                 'colorpicker', 'html',  'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'face'
//                 , '|', 'left', 'center', 'right', '|', 'link', 'unlink','images', 'image_alt', 'video', 'anchors'
//                 , '|','table', 'fullScreen', 'image'
//             ]
// });
// layedit.build('bodycontent');   //建立编辑器
//编辑器初始化
var editor = layui.tinymce;
var edit = editor.render({
selector: "#bodycontent",
images_upload_url: '/api/upload/?act=tinymce',//图片上传接口
height: 500
});
//英文编辑器初始化
var en_editor = layui.tinymce;
var en_edit = en_editor.render({
selector: "#en_bodycontent",
images_upload_url: '/api/upload/?act=tinymce',//图片上传接口
height: 500
});
})
pasteImage("pic");
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
<link rel='stylesheet' href='../../css/tagsinput.css'>
<style type="text/css">
.bootstrap-tagsinput{width:97%;}
</style>
<script type='text/javascript' src='../../js/tagsinput.min.js'></script>
</body>
</html>
