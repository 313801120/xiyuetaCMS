<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.Asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<% 
call openconn()  
dim msg,isTrue,addSql,id,parentid,columnName,columnEnName,isthrough,sortrank,columnType,bodyContent,splstr,splxx,s,sel,flags,httpUrl,bannerImage,c,province,city,areas
id=request(ChrW(105)&ChrW(100))
parentid=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
columnName=trim(request(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))
columnEnName=trim(request(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))
if columnEnName="" then columnEnName=lcase(pinYin2(columnName))
sortrank=request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
if sortrank="" then sortrank=0 
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0)
if parentid="" then 
parentid=-1
else
parentid=int(parentid)
end if 
province=request(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(101))
city=request(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121))
areas=request(ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(115))

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
isTrue=true
if sortrank="" then    
msg=ChrW(25490)&ChrW(24207)&ChrW(19981)&ChrW(33021)&ChrW(20026)&ChrW(31354)
isTrue=false
end if
if isTrue=true then

addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&addsql,conn,1,3
if not rs.eof then
msg=ChrW(26639)&ChrW(30446)&ChrW(21517)&ChrW(31216)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
else
rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=parentid 
rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=columnName  
rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=columnEnName  
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank  
rs.update 
response.Write ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(40)&ChrW(41)&ChrW(59)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)
response.end()
end if:rs.close 
end if
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(67)&ChrW(105)&ChrW(116)&ChrW(121) then
if request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>"" then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&parentid,conn,1,1
while not rs.eof
if c <>"" then c=c & ChrW(44)
c=c & ChrW(123)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&rs(ChrW(105)&ChrW(100))&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)& rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(34)&ChrW(125)
rs.movenext:wend:rs.close
end if
call die(ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91)& c &ChrW(93)&ChrW(125))

elseif id <>"" then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
parentid=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) 
id=rs(ChrW(105)&ChrW(100)) 
columnName=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))    
columnEnName=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))    
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))    
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))   
province=rs(ChrW(105)&ChrW(100))
if rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then

rss.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),conn,1,1
if not rss.eof then

province=rss(ChrW(105)&ChrW(100))
city=rs(ChrW(105)&ChrW(100))
if rss(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rss(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),conn,1,1
if not rsx.eof then
province=rsx(ChrW(105)&ChrW(100))
city=rss(ChrW(105)&ChrW(100))
areas=rs(ChrW(105)&ChrW(100))
end if:rsx.close
end if
end if:rss.close
end if
end if
if province <>"" then parentid=province
if city <>"" then parentid=city
if areas <>"" then parentid=areas




end if

function sheshiSubInput(a,b,c)
dim d:Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim e,f,g,h
if b <>"" then h=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)& b
d.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)&ChrW(61)&a & h &ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not d.eof  
g=""
if c <>"" then
if c=d(ChrW(105)&ChrW(100)) then g=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
e=e & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& d(ChrW(105)&ChrW(100)) &ChrW(34)& g &ChrW(62)& getSubSheShiSort(d(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),"")  & d(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
e=e & sheshiSubInput(d(ChrW(105)&ChrW(100)),b,c)    
d.movenext:wend:d.close
sheshiSubInput=e
end function

function getSubSheShiSort(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59) & b
else
b=b & ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)) <>-1 then
call getSubSheShiSort(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)),b)
end if
end if:c.close
getSubSheShiSort=b
end function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加</title>
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css" />
</head>
<body>
<%if msg <>"" then  call rw(ChrW(60)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62)& msg &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(62))%>
<form id="form1" name="form1" class="layui-form" method="post" action="?act=save&id=<%=id%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
<div class="layui-form-item">
<label class="layui-form-label">选择分类</label> 
<div class="layui-input-inline">
<select name="province" lay-filter="province" id="prov_id">
<option value="-1">≡ 作为一级栏目 ≡</option>
<%
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)& parentid &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49),conn,1,1
while not rsx.eof
sel=""
if rsx(ChrW(105)&ChrW(100))=province then sel=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
%>
<option value="<%=rsx(ChrW(105)&ChrW(100))%>" <%=sel%>><%=rsx(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))%></option>
<%rsx.movenext:wend:rsx.close%>
</select>
</div>
<div class="layui-input-inline">
<select name="city_id" id='city_id' lay-filter="city">
<option value="">≡ 请选择 ≡</option>
<%
if province <>"" and city <>"" then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)& parentid &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&province,conn,1,1
while not rsx.eof
sel=""
if rsx(ChrW(105)&ChrW(100))=city then sel=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
%>
<option value="<%=rsx(ChrW(105)&ChrW(100))%>" <%=sel%>><%=rsx(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))%></option>
<%rsx.movenext:wend:rsx.close
end if%>
</select>
</div>
<div class="layui-input-inline">
<select name='area_id' id='area_id' lay-filter="areas">
<option value="">≡ 请选择 ≡</option>
<%
if city <>"" and areas <>"" then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)& parentid &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&city,conn,1,1
while not rsx.eof
sel=""
if rsx(ChrW(105)&ChrW(100))=areas then sel=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
%>
<option value="<%=rsx(ChrW(105)&ChrW(100))%>" <%=sel%>><%=rsx(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))%></option>
<%rsx.movenext:wend:rsx.close
end if%>
</select>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">名称</label>
<div class="layui-input-inline">
<input type="text" name="columnName" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input" value="<%=columnName%>">
</div>
</div>                
<div class="layui-form-item">
<label class="layui-form-label">拼音名</label>
<div class="layui-input-inline">
<input type="text" name="columnEnName" placeholder="请输入拼音名称" autocomplete="off" class="layui-input" value="<%=columnEnName%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">排序</label>
<div class="layui-input-inline">
<input type="text" name="sortrank" lay-verify="number" placeholder="请输入排序" autocomplete="off" class="layui-input" value="<%=sortrank%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">审核状态</label>
<div class="layui-input-inline">
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
</div>
<div class="layui-form-item layui-hide">
<input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
</div>
</div>
</form>
<script src="../../layuiadmin/layui/layui.js"></script>
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate', 'set', 'layedit'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate;
upload.render({
elem: '#layuiadmin-upload-useradmin',
url: '/api/upload/',
done: function(res) {
$(this.item).prev("div").children("input").val(res.data[0].src)
}
});
lay('.date').each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy/MM/dd'
});
});
//编码器
var layedit = layui.layedit;
layedit.set({
//暴露layupload参数设置接口 --详细查看layupload参数说明
uploadImage: {
url: '/api/upload/' //上传接口url
,
type: 'post' //默认post 
}
});
layedit.build('bodyContent'); //建立编辑器
form.on('select(province)',function(data){  //获取省id，取出对应的市信息
var html="<option value=''>请选择城市</option>";
var parentid = data.value;
$("#city_id").parent().show();
$.post("?act=getCity&x=1",{parentid:parentid},function(txt){
var jsonData=$.parseJSON( txt ); 
var data=jsonData.data;              
$(data).each(function(k,v){
$(v).each(function(kk,vv){
html +="<option value='"+ vv.code +"'> "+vv.name +" </option>";
});
});
$('#city_id').html(html);
form.render('select');
},"text");
$('#area_id').html("<option value=''>请选择地区</option>");     
});
form.on('select(city)',function(data){  //获取市id，取出对应的县信息
var html="<option value=''>请选择</option>";
var parentid = data.value;
$("#city_id").parent().show();
$.post("?act=getCity&x=2",{parentid:parentid},function(txt){
var jsonData=$.parseJSON( txt ); 
var data=jsonData.data;              
$(data).each(function(k,v){
$(v).each(function(kk,vv){
html +="<option value='"+ vv.code +"'> "+vv.name +" </option>";
});
});
$('#area_id').html(html);
form.render('select');
},"text"); 
});
})
</script>
</body>
</html>