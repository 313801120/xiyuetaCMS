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
dim msg,isTrue,sql,addSql,id,webtitle,webkeywords,webdescription,company,logo,biglogo,qrcode,weburl,copyright,phone,tel,fax,email,weixin,qq,webfoot,asporhtml,slanguagelist,en_webtitle,en_webkeywords,en_webdescription,en_company,en_address,en_webfoot,sortrank,isthrough,createtime,updatetime,ip,tsfield_addr
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
createtime=request(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
if createtime="" then createtime=null
updatetime=request(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
if updatetime="" then updatetime=null
ip=request(ChrW(105)&ChrW(112))
if id <>"" then
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
createtime=rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
updatetime=rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
ip=rs(ChrW(105)&ChrW(112))
tsfield_addr=ipToAddr2022(rs(ChrW(105)&ChrW(112)),ChrW(97)&ChrW(108)&ChrW(108))
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
<ul class="layui-tab-title">
<li class="layui-this" lay-id="11">中文设置</li>
<%if checkEnLanguage() then%>
<li lay-id="22">英文设置</li> 
<%end if%>
</ul>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>title标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=webtitle%>
</div><!--webtitle-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>META关键词：</label>
<div class='layui-input-block layui-input-wrap'>
<%=webkeywords%>
</div><!--webkeywords-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>META描述：</label>
<div class='layui-input-block layui-input-wrap'>
<%=webdescription%>
</div><!--webdescription-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>公司名称：</label>
<div class='layui-input-block layui-input-wrap'>
<%=company%>
</div><!--company-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>Logo(小)：</label>
<div class='layui-input-block layui-input-wrap'>
<a href="<%=logo%>" target="_blank" title="点击查看"><%=IIF(logo <>"",logo,"")%></a>
</div><!--logo-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>Logo(大)：</label>
<div class='layui-input-block layui-input-wrap'>
<a href="<%=biglogo%>" target="_blank" title="点击查看"><%=IIF(biglogo <>"",biglogo,"")%></a>
</div><!--biglogo-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>二维码：</label>
<div class='layui-input-block layui-input-wrap'>
<a href="<%=qrcode%>" target="_blank" title="点击查看"><%=IIF(qrcode <>"",qrcode,"")%></a>
</div><!--qrcode-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>网站域名：</label>
<div class='layui-input-block layui-input-wrap'>
<%=weburl%>
</div><!--weburl-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>版权：</label>
<div class='layui-input-block layui-input-wrap'>
<%=copyright%>
</div><!--copyright-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>手机：</label>
<div class='layui-input-block layui-input-wrap'>
<%=phone%>
</div><!--phone-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>电话：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tel%>
</div><!--tel-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>传真：</label>
<div class='layui-input-block layui-input-wrap'>
<%=fax%>
</div><!--fax-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>邮箱：</label>
<div class='layui-input-block layui-input-wrap'>
<%=email%>
</div><!--email-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>微信：</label>
<div class='layui-input-block layui-input-wrap'>
<%=weixin%>
</div><!--weixin-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>QQ号：</label>
<div class='layui-input-block layui-input-wrap'>
<%=qq%>
</div><!--qq-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>网页底部：</label>
<div class='layui-input-block layui-input-wrap'>
<%=webfoot%>
</div><!--webfoot-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>仿静态：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(asporhtml=0,ChrW(21160)&ChrW(24577)&ChrW(40)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(41),ChrW(38745)&ChrW(24577)&ChrW(40)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(41))%>
</div><!--asporhtml-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>选择语言：</label>
<div class='layui-input-block layui-input-wrap'>
<%=showCheckboxDataTitle(ChrW(20013)&ChrW(25991)&ChrW(95)&ChrW(99)&ChrW(110)&ChrW(45)&ChrW(33521)&ChrW(35821)&ChrW(95)&ChrW(101)&ChrW(110)&ChrW(45)&ChrW(32321)&ChrW(20307)&ChrW(95)&ChrW(102)&ChrW(116)&ChrW(45)&ChrW(26085)&ChrW(35821)&ChrW(95)&ChrW(106)&ChrW(112)&ChrW(45)&ChrW(24503)&ChrW(35821)&ChrW(95)&ChrW(100)&ChrW(121)&ChrW(45)&ChrW(27861)&ChrW(35821)&ChrW(95)&ChrW(102)&ChrW(121),slanguagelist)%>                    </div><!--languagelist-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>排序：</label>
<div class='layui-input-block layui-input-wrap'>
<%=sortrank%>
</div><!--sortrank-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>审核：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isthrough=0,ChrW(21542),ChrW(26159))%>
</div><!--isthrough-->
</div>
</div>
</div>    
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>发布时间：</label>
<div class='layui-input-block layui-input-wrap'>
<%=createtime%>
</div><!--createtime-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>修改时间：</label>
<div class='layui-input-block layui-input-wrap'>
<%=updatetime%>
</div><!--updatetime-->
</div>
</div>
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
</div>
<%if checkEnLanguage() then%>
<div class="layui-tab-item"> 
<div class='layui-form-item'>
<label class='layui-form-label'>英文网站标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_webtitle%>
</div><!--en_webtitle-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文META关键词：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_webkeywords%>
</div><!--en_webkeywords-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文META描述：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_webdescription%>
</div><!--en_webdescription-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文公司名称：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_company%>
</div><!--en_company-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文公司地址：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_address%>
</div><!--en_address-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>英文网页底部：</label>
<div class='layui-input-block layui-input-wrap'>
<%=en_webfoot%>
</div><!--en_webfoot-->
</div>
</div>
<%end if%>
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
