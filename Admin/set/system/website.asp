<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#include file="../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<%

call openconn() 
dim msg,id,logo,qrcode,asporhtml,flags
id=request(ChrW(105)&ChrW(100)) 
asporhtml=request(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
flags=ChrW(124)
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(99)&ChrW(110))=ChrW(111)&ChrW(110),ChrW(99)&ChrW(110)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(101)&ChrW(110))=ChrW(111)&ChrW(110),ChrW(101)&ChrW(110)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(102)&ChrW(116))=ChrW(111)&ChrW(110),ChrW(102)&ChrW(116)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(106)&ChrW(112))=ChrW(111)&ChrW(110),ChrW(106)&ChrW(112)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(100)&ChrW(121))=ChrW(111)&ChrW(110),ChrW(100)&ChrW(121)&ChrW(124),"") 
flags=flags & IIF(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(95)&ChrW(102)&ChrW(121))=ChrW(111)&ChrW(110),ChrW(102)&ChrW(121)&ChrW(124),"") 
call showCheckAdminRule(ChrW(32534)&ChrW(36753)&ChrW(32593)&ChrW(31449)&ChrW(35774)&ChrW(32622))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(87)&ChrW(101)&ChrW(98)&ChrW(83)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
if not rs.eof then
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
rs(ChrW(87)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108))=request(ChrW(87)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108))
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))=request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))
rs(ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))=request(ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))
rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))=request(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))
rs(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))=request(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))
rs(ChrW(113)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))=request(ChrW(113)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))
rs(ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101))=request(ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101))
rs(ChrW(116)&ChrW(101)&ChrW(108))=request(ChrW(116)&ChrW(101)&ChrW(108))
rs(ChrW(102)&ChrW(97)&ChrW(120))=request(ChrW(102)&ChrW(97)&ChrW(120))
rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))=request(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
rs(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110))=request(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110))
rs(ChrW(113)&ChrW(113))=request(ChrW(113)&ChrW(113))
rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))=request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))
rs(ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))=request(ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)) 
rs(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))=flags
rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))=IIF(asporhtml=ChrW(111)&ChrW(110),1,0)

if checkEnLanguage() then  
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))=request(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))
end if
msg=ChrW(20462)&ChrW(25913)&ChrW(31995)&ChrW(32479)&ChrW(35774)&ChrW(32622)&ChrW(25104)&ChrW(21151)&ChrW(65281)
rs.update        
call addSystemLog(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101),msg)
end if:rs.close
end if
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(87)&ChrW(101)&ChrW(98)&ChrW(83)&ChrW(105)&ChrW(116)&ChrW(101),conn,1,1
%><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>网站设置</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
<link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all"> 
<script type="text/javascript" src="../../js/jquery.js"></script>
<link href="../../css/nprogress.min.css" rel="stylesheet"/>  
<script src="../../js/nprogress.min.js"></script>
<style>
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
</head>
<body>
<form id="form1" name="form1" class="layui-form" method="post" action="?act=save&id=<%=rs(ChrW(105)&ChrW(100))%>">
<div class="layui-fluid">
<div class="layui-row layui-col-space15">
<div class="layui-col-md12">
<div class="layui-card">
<%if msg <>"" then%>
<blockquote class="layui-elem-quote"><%=msg%></blockquote>
<%end if%>
<div class="layui-tab" lay-filter="test-hash">
<ul class="layui-tab-title">
<li class="layui-this" lay-id="11">网站设置</li>
<li lay-id="22">英文网站设置</li>
<!--     <li lay-id="33">标签3</li>
<li lay-id="44">标签4</li>
<li lay-id="55">标签5</li> -->
</ul>
<div class="layui-tab-content"> 
<div class="layui-tab-item layui-show">
<div class="layui-card-body" pad15>
<div class="layui-form" wid100 lay-filter="">
<div class="layui-form-item">
<label class="layui-form-label">网站标题</label>
<div class="layui-input-block">
<input type="text" name="webtitle" value="<%=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))%>" class="layui-input">
</div>
</div> 
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">META关键词</label>
<div class="layui-input-block"> 
<input type="text" autocomplete="off" class="form-control" data-role="tagsinput" id="keyword" value="<%=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))%>" name="webkeywords"  > 
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">META描述</label>
<div class="layui-input-block">
<textarea name="webdescription" class="layui-textarea"><%=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))%></textarea>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">Logo(小)</label>
<div class="layui-input-inline">
<input type="text" name="logo" id="logo" placeholder="请上传Logo(小)" autocomplete="off" class="layui-input" value="<%=rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))%>" > 
</div> 
<button type="button" class="layui-btn layui-btn-primary" id="layuiadmin-upload-logo">
<i class="layui-icon">&#xe67c;</i>上传图片
</button><input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreviewLogo">查看图片</button >
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">网页底部</label>
<div class="layui-input-block">
<textarea name="webfoot" placeholder="请输入网页底部内容" class="layui-textarea" id="webfoot" style="border:0;padding:0"><%=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))%></textarea>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">网站域名</label>
<div class="layui-input-block">
<!-- lay-verify="url" -->
<input type="text" name="weburl" value="<%=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108))%>" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">Logo(大)</label>
<div class="layui-input-inline">
<input type="text" name="biglogo" id="biglogo" placeholder="请上传Logo(大)" autocomplete="off" class="layui-input" value="<%=rs(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))%>" > 
</div> 
<button type="button" class="layui-btn layui-btn-primary" id="layuiadmin-upload-biglogo">
<i class="layui-icon">&#xe67c;</i>上传图片
</button><input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreviewBigLogo">查看图片</button >
</div>
<div class="layui-form-item">
<label class="layui-form-label">二维码图</label>
<div class="layui-input-inline">
<input type="text" name="qrcode" id="qrcode" placeholder="请上传二维码图" autocomplete="off" class="layui-input" value="<%=rs(ChrW(113)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))%>" > 
</div> 
<button type="button" class="layui-btn layui-btn-primary" id="layuiadmin-upload-qrcode">
<i class="layui-icon">&#xe67c;</i>上传图片
</button><input class="layui-upload-file" type="file" accept="" name="file">
<button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreviewQrcode">查看图片</button >
</div>
<div class="layui-form-item">
<label class="layui-form-label">手机</label>
<div class="layui-input-inline">
<input type="text" name="phone" value="<%=rs(ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101))%>" autocomplete="off" class="layui-input"><!--lay-verify="phone"-->
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">电话</label>
<div class="layui-input-inline">
<input type="text" name="tel" value="<%=rs(ChrW(116)&ChrW(101)&ChrW(108))%>" autocomplete="off" class="layui-input"><!--lay-verify="phone"-->
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">传真</label>
<div class="layui-input-inline">
<input type="text" name="fax" value="<%=rs(ChrW(102)&ChrW(97)&ChrW(120))%>" autocomplete="off" class="layui-input"><!--lay-verify="phone"-->
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">邮箱</label>
<div class="layui-input-inline">
<input type="text" name="email" value="<%=rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))%>" autocomplete="off" class="layui-input"><!-- lay-verify="email"-->
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">微信</label>
<div class="layui-input-inline">
<input type="text" name="weixin" value="<%=rs(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110))%>" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">QQ</label>
<div class="layui-input-inline">
<input type="text" name="qq" value="<%=rs(ChrW(113)&ChrW(113))%>" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">公司地址</label>
<div class="layui-input-block">
<input type="text" name="address" value="<%=rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))%>" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">公司名称</label>
<div class="layui-input-block">
<input type="text" name="company" value="<%=rs(ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))%>" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">版权信息</label>
<div class="layui-input-block">
<input type="text" name="copyright" lay-verify="" class="layui-input" value="<%=rs(ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">网站动静转换</label>
<div class="layui-input-inline">
<input type="checkbox" lay-filter="switch" name="asporhtml" lay-skin="switch" lay-text="静态(.html)|动态(.asp)" <%=IIF(rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
</div>  
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">自定义属性</label>
<div class="layui-input-block">
<div class="layui-form">
<input type="checkbox" name="flags_cn" title="中文"<%=IIF(instr(rs(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)),ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_en" title="英语"<%=IIF(instr(rs(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)),ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="flags_ft" title="繁体"<%=IIF(instr(rs(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)),ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>> 
<input type="checkbox" name="flags_jp" title="日语"<%=IIF(instr(rs(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)),ChrW(124)&ChrW(106)&ChrW(112)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>> 
<input type="checkbox" name="flags_dy" title="德语"<%=IIF(instr(rs(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)),ChrW(124)&ChrW(100)&ChrW(121)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>> 
<input type="checkbox" name="flags_fy" title="法语"<%=IIF(instr(rs(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)),ChrW(124)&ChrW(102)&ChrW(121)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>> 
</div>
</div>
</div>   
</div>
<div class="layui-tab-item">
<div class="layui-card-body" pad15>
<div class="layui-form" wid100 lay-filter="">
<div class="layui-form-item">
<label class="layui-form-label">英文网站标题</label>
<div class="layui-input-block">
<input type="text" name="en_webtitle" value="<%=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))%>" class="layui-input">
</div>
</div> 
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">英文META关键词</label>
<div class="layui-input-block"> 
<input type="text" autocomplete="off" class="form-control" data-role="tagsinput" id="keyword" value="<%=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))%>" name="en_webkeywords"  > 
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">英文META描述</label>
<div class="layui-input-block">
<textarea name="en_webdescription" class="layui-textarea"><%=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))%></textarea>
</div>
</div>
<div class="layui-form-item layui-form-text">
<label class="layui-form-label">英文网页底部</label>
<div class="layui-input-block">
<textarea name="en_webfoot" placeholder="请输入网页底部内容" class="layui-textarea" id="en_webfoot" style="border:0;padding:0"><%=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))%></textarea>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">英文公司地址</label>
<div class="layui-input-block">
<input type="text" name="en_address" value="<%=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))%>" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">英文公司名称</label>
<div class="layui-input-block">
<input type="text" name="en_company" value="<%=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))%>" autocomplete="off" class="layui-input">
</div>
</div>
</div>
</div>
</div> 
<div class="layui-form-item">
<div class="layui-input-block">
<input type="submit" class="layui-btn" value="确认保存" lay-submit="lay-submit" />
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../../js/pc.js?v6"></script>
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','set','layedit','tinymce'], function() {
var $ = layui.$, 
form = layui.form,
upload = layui.upload,
laydate = layui.laydate;
var a= (layui.laytpl, layui.setter, layui.view, layui.admin);
var b= (layui.laytpl, layui.setter, layui.view, layui.admin);
var c= (layui.laytpl, layui.setter, layui.view, layui.admin);
//查看图片 logo(小)
a.events.avartatPreviewLogo = function(t) {
var i = $("#logo").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
}
//查看图片 logo(大)
b.events.avartatPreviewBigLogo = function(t) {
var i = $("#biglogo").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
}
//查看图片 logo(大)
c.events.avartatPreviewQrcode = function(t) {
var i = $("#qrcode").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
}
upload.render({
elem: '#layuiadmin-upload-logo',
url: '/api/upload/',
done: function(res) {
$(this.item).prev("div").children("input").val(res.data[0].src)
}
});
//logo(小) 上传
upload.render({
elem: '#layuiadmin-upload-logo',
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
//logo(小) 上传
upload.render({
elem: '#layuiadmin-upload-biglogo',
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
//二维码
upload.render({
elem: '#layuiadmin-upload-qrcode',
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
// //编码器
// var layedit = layui.layedit;
// layedit.set({
//     //暴露layupload参数设置接口 --详细查看layupload参数说明
//     uploadImage: {
//         url: '/api/upload/?act=one' //上传接口url
//             ,
//         type: 'post' //默认post 
//     }
// });
// layedit.build('webfoot'); //建立编辑器
//编辑器初始化
var editor = layui.tinymce;
var edit = editor.render({
selector: "#webfoot",
images_upload_url: '/api/upload/?act=tinymce',//图片上传接口
height: 500
});
//编辑器初始化
var en_editor = layui.tinymce;
var en_edit = en_editor.render({
selector: "#en_webfoot",
images_upload_url: '/api/upload/?act=tinymce',//图片上传接口
height: 500
});
// //编码器 复杂版
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
//                 'colorpicker', 'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'face'
//                 , '|', 'left', 'center', 'right', '|', 'link', 'unlink','images', 'image_alt', 'video', 'anchors'
//                 , '|','table', 'fullScreen'
//             ]
// });
// layedit.build('webfoot');   //建立编辑器
// //编码器 复杂版
// var en_layedit = layui.layedit;
// en_layedit.set({
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
//                 'colorpicker', 'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'face'
//                 , '|', 'left', 'center', 'right', '|', 'link', 'unlink','images', 'image_alt', 'video', 'anchors'
//                 , '|','table', 'fullScreen'
//             ]
// });
// en_layedit.build('en_webfoot');   //建立编辑器
});
pasteImage("logo");
pasteImage("biglogo");
pasteImage("qrcode");
</script>
<link rel='stylesheet' href='../../css/tagsinput.css'>
<style type="text/css">
.bootstrap-tagsinput{width:97%;}
</style>
<script type='text/javascript' src='../../js/tagsinput.min.js'></script>
</body>
</html> 