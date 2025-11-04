<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)
winTitle = ChrW(24067)&ChrW(23616)&ChrW(39029)&ChrW(37197)&ChrW(32622)
dim msg,isTrue,sql,addSql,id,title,fieldtitle,fieldname,fieldtype,fieldconfig,divtype,inputtype,sortrank,isthrough
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
fieldtitle=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
fieldname=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
fieldtype=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
fieldconfig=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))
divtype=request(ChrW(100)&ChrW(105)&ChrW(118)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
inputtype=request(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
if isthrough="" then isthrough=null
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& title &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& title &ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&addsql

rs.open sql,conn,1,3
if not rs.eof then
msg=ChrW(26631)&ChrW(39064)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew

else
rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=title
rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=fieldtitle
rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=fieldname
rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=fieldtype
rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))=fieldconfig
rs(ChrW(100)&ChrW(105)&ChrW(118)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=divtype
rs(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=inputtype
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough

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
title=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
fieldtitle=rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
fieldname=rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
fieldtype=rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
fieldconfig=rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))
divtype=rs(ChrW(100)&ChrW(105)&ChrW(118)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
inputtype=rs(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
end if
else
isthrough=1
sortrank=1
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
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
</head>
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
<label class='layui-form-label'>标题</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='title' placeholder='请输入标题'autocomplete='off' class='layui-input' value="<%=inputCL(title)%>" >
</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段标题</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='fieldtitle' placeholder='请输入字段标题'autocomplete='off' class='layui-input' value="<%=inputCL(fieldtitle)%>" >
</div><!--fieldtitle-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段名称</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='fieldname' placeholder='请输入字段名称'autocomplete='off' class='layui-input' value="<%=inputCL(fieldname)%>" >
</div><!--fieldname-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段类型</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(25991)&ChrW(26412)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(22810)&ChrW(34892)&ChrW(25991)&ChrW(26412)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(45)&ChrW(32534)&ChrW(36753)&ChrW(22120)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(45)&ChrW(26159)&ChrW(21542)&ChrW(95)&ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111)&ChrW(45)&ChrW(22797)&ChrW(36873)&ChrW(26694)&ChrW(32)&ChrW(95)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(45)&ChrW(25968)&ChrW(23383)&ChrW(95)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(36135)&ChrW(24065)&ChrW(95)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(45)&ChrW(26085)&ChrW(26399)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(26102)&ChrW(38388)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(45)&ChrW(19978)&ChrW(20256)&ChrW(22270)&ChrW(29255)&ChrW(95)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(45)&ChrW(26631)&ChrW(31614)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(45)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(45)&ChrW(39068)&ChrW(33394)&ChrW(36873)&ChrW(25321)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(21160)&ChrW(20316)&ChrW(23383)&ChrW(27573)&ChrW(95)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),fieldtype)%>      </div><!--fieldtype-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>字段配置</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='fieldconfig' placeholder='请输入字段配置'autocomplete='off' class='layui-input' value="<%=inputCL(fieldconfig)%>" >
</div><div class="layui-form-mid layui-text-em">如：-男_1-女_2-保密_0 或-10-20-30，或inputNumberStep_0.01为编辑页可输入小数位数</div><!--fieldconfig-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表单块类型</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(100)&ChrW(105)&ChrW(118)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(20869)&ChrW(32852)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(22359)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107),divtype)%>      </div><!--divtype-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>input类型</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(40664)&ChrW(35748)&ChrW(95)&ChrW(45)&ChrW(25968)&ChrW(23383)&ChrW(95)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114),inputtype)%>      </div><!--inputtype-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='number' name='sortrank' placeholder='请输入排序'autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>" >
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isthrough-->
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
