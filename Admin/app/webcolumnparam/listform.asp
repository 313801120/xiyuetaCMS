<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim msg,isTrue,addSql,id,parentid,title,isthrough,sortrank,pic1,pic2,pic3,aboutcontent,bodycontent,author
dim param1,param2,param3,param4,param5,param6,param7,param8,param9,param10
id=request(ChrW(105)&ChrW(100))
parentid=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
pic1=request(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(49))
pic2=request(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50))
pic3=request(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51))
param1=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49))
param2=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(50))
param3=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(51))
param4=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(52))
param5=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(53))
param6=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(54))
param7=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(55))
param8=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(56))
param9=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(57))
param10=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49)&ChrW(48))
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0)
if parentid="" then 
parentid=-1
else
parentid=int(parentid)
end if 

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)& parentid &ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& title &ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(93)&addsql,conn,1,3
if not rs.eof then
msg=ChrW(26639)&ChrW(30446)&ChrW(21517)&ChrW(31216)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
else
rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=parentid 
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=title 
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough 
rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(49))=pic1 
rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50))=pic2 
rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51))=pic3 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49))=param1 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(50))=param2 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(51))=param3 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(52))=param4 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(53))=param5 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(54))=param6 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(55))=param7 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(56))=param8 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(57))=param9 
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49)&ChrW(48))=param10 
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent 
rs.update 
response.Write ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(40)&ChrW(41)&ChrW(59)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)
response.end()
end if:rs.close 
end if

elseif id <>"" then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
parentid=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) 
id=rs(ChrW(105)&ChrW(100)) 
title=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))     
pic1=rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(49))       
pic2=rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50))       
pic3=rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51))       
param1=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49))
param2=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(50))
param3=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(51))
param4=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(52))
param5=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(53))
param6=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(54))
param7=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(55))
param8=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(56))
param9=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(57))
param10=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49)&ChrW(48))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))     
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))  
end if
end if
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加修改文章</title> 
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
</head>
<body>  
<%if msg <>"" then  call rw(ChrW(60)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62)& msg &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(62))%>
<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
<div class="layui-form-item">
<label class="layui-form-label">选择分类</label>
<div class="layui-input-inline">
<select name="parentid" id="parentid" selected><option value="-1">≡ 作为一级栏目 ≡</option>
<%=columnSubInput(-1,id,parentid)%>
</select>
</div> 
</div>
<div class="layui-form-item">
<label class="layui-form-label">标题</label>
<div class="layui-input-block">
<input type="text" name="title" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="<%=title%>">
</div>
</div>       
<div class="layui-form-item">
<label class="layui-form-label">建站定位</label>
<div class="layui-input-block">
<input type="text" name="param1" lay-verify="required" placeholder="请输入建站定位" autocomplete="off" class="layui-input" value="<%=param1%>">
</div>
</div>      
<div class="layui-form-item">
<label class="layui-form-label">价格区间</label>
<div class="layui-input-block">
<input type="text" name="param2" lay-verify="required" placeholder="请输入价格区间" autocomplete="off" class="layui-input" value="<%=param2%>">
</div>
</div>     
<div class="layui-form-item">
<label class="layui-form-label">优惠信息</label>
<div class="layui-input-block">
<input type="text" name="param3" lay-verify="required" placeholder="请输入优惠信息" autocomplete="off" class="layui-input" value="<%=param3%>">
</div>
</div>   
<div class="layui-form-item">
<label class="layui-form-label">定制网站</label>
<div class="layui-input-block">
<input type="text" name="param4" lay-verify="required" placeholder="请输入定制网站" autocomplete="off" class="layui-input" value="<%=param4%>">
</div>
</div>  
<div class="layui-form-item">
<label class="layui-form-label">域名注册</label>
<div class="layui-input-block">
<input type="text" name="param5" lay-verify="required" placeholder="请输入域名注册" autocomplete="off" class="layui-input" value="<%=param5%>">
</div>
</div> 
<div class="layui-form-item">
<label class="layui-form-label">网站服务器</label>
<div class="layui-input-block">
<input type="text" name="param6" lay-verify="required" placeholder="请输入网站服务器" autocomplete="off" class="layui-input" value="<%=param6%>">
</div>
</div> 
<div class="layui-form-item">
<label class="layui-form-label">续费价格</label>
<div class="layui-input-block">
<input type="text" name="param7" lay-verify="required" placeholder="请输入续费价格" autocomplete="off" class="layui-input" value="<%=param7%>">
</div>
</div>  
<div class="layui-form-item">
<label class="layui-form-label">导航栏目</label>
<div class="layui-input-block">
<input type="text" name="param8" lay-verify="required" placeholder="请输入导航栏目" autocomplete="off" class="layui-input" value="<%=param8%>">
</div>
</div> 
<div class="layui-form-item">
<label class="layui-form-label">设计标准</label>
<div class="layui-input-block">
<input type="text" name="param9" lay-verify="required" placeholder="请输入设计标准" autocomplete="off" class="layui-input" value="<%=param9%>">
</div>
</div>  
<div class="layui-form-item">
<label class="layui-form-label">资料录入</label>
<div class="layui-input-block">
<input type="text" name="param10" lay-verify="required" placeholder="请输入资料录入" autocomplete="off" class="layui-input" value="<%=param10%>">
</div>
</div>   
<div class="layui-form-item">
<label class="layui-form-label">缩略图1</label>
<div class="layui-input-inline">
<input type="text" name="pic1" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic1%>">
</div>
<button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
</div>
<div class="layui-form-item">
<label class="layui-form-label">缩略图2</label>
<div class="layui-input-inline">
<input type="text" name="pic2" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic2%>">
</div>
<button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin2">上传图片</button> 
</div>
<div class="layui-form-item">
<label class="layui-form-label">缩略图3</label>
<div class="layui-input-inline">
<input type="text" name="pic3" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic3%>">
</div>
<button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin3">上传图片</button> 
</div>
<%if 1=2 then%>
<div class="layui-form-item">
<label class="layui-form-label">文章内容</label>
<div class="layui-input-block">
<textarea name="bodycontent" <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39),ChrW(32)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(49)&ChrW(48)&ChrW(39))%> placeholder="请输入文章内容" class="layui-textarea"><%=bodycontent%></textarea>
</div>
</div>  
<%end if%>
<div class="layui-form-item">
<label class="layui-form-label">审核状态</label>
<div class="layui-input-inline">
<input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
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
}).use(['index', 'form', 'upload', 'laydate','set','layedit'], function() {
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
upload.render({
elem: '#layuiadmin-upload-useradmin2',
url: '/api/upload/',
done: function(res) {
$(this.item).prev("div").children("input").val(res.data[0].src)
}
});
upload.render({
elem: '#layuiadmin-upload-useradmin3',
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
url: '/api/upload/'    //上传接口url
,type: 'post' //默认post 
}
});
layedit.build('bodycontent');   //建立编辑器
})
</script>
</body>
</html>
