<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim sql,title,id,msg,addsql,username,isThrough,nickname,pwd,isTrue,pic,expiredatetime,sex,department,idcard,email,dateOfBirth,tel,address,bodycontent,weixin,qq,alipay,inadminid 
id=request(ChrW(105)&ChrW(100))
username=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
nickname=request(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
pwd=request(ChrW(112)&ChrW(119)&ChrW(100))
pic=request(ChrW(112)&ChrW(105)&ChrW(99))
expiredatetime=request(ChrW(101)&ChrW(120)&ChrW(112)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
sex=request(ChrW(115)&ChrW(101)&ChrW(120))
department=request(ChrW(100)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116))
idcard=request(ChrW(105)&ChrW(100)&ChrW(99)&ChrW(97)&ChrW(114)&ChrW(100))
dateOfBirth=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(79)&ChrW(102)&ChrW(66)&ChrW(105)&ChrW(114)&ChrW(116)&ChrW(104))
email=request(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
tel=request(ChrW(116)&ChrW(101)&ChrW(108))
address=request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0)
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
weixin=request(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110))
alipay=request(ChrW(97)&ChrW(108)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(121))
qq=request(ChrW(113)&ChrW(113))
inadminid=request(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
isTrue=true
if pwd <>"" then
if len(pwd) >=6 then
pwd=myMD5(pwd)
else
msg=ChrW(23494)&ChrW(30721)&ChrW(35201)&ChrW(22823)&ChrW(20110)&ChrW(54)&ChrW(20301)&ChrW(23383)&ChrW(31526)
isTrue=false
end if
end if
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& username &ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&addsql,conn,1,3
if not rs.eof then
msg=ChrW(29992)&ChrW(25143)&ChrW(21517)&ChrW(31216)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
else
rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=username 
rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=nickname 
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(112)&ChrW(105)&ChrW(99))=pic
rs(ChrW(101)&ChrW(120)&ChrW(112)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=expiredatetime
rs(ChrW(115)&ChrW(101)&ChrW(120))=sex
rs(ChrW(114)&ChrW(101)&ChrW(103)&ChrW(73)&ChrW(80))=getIP()
rs(ChrW(105)&ChrW(112))=getIP()
rs(ChrW(100)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116))=department
rs(ChrW(105)&ChrW(100)&ChrW(99)&ChrW(97)&ChrW(114)&ChrW(100))=idcard
if dateOfBirth <>"" then rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(79)&ChrW(102)&ChrW(66)&ChrW(105)&ChrW(114)&ChrW(116)&ChrW(104))=dateOfBirth
rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))=email
rs(ChrW(116)&ChrW(101)&ChrW(108))=tel
rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))=address 
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent
rs(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110))=weixin
rs(ChrW(97)&ChrW(108)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(121))=alipay
rs(ChrW(113)&ChrW(113))=qq
if inadminid <>"" then rs(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=inadminid  
if pwd <>"" then rs(ChrW(112)&ChrW(119)&ChrW(100))=pwd
rs.update 
call die(ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(59)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62))

end if:rs.close 
end if

elseif id <>"" then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
username=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
nickname=rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
id=rs(ChrW(105)&ChrW(100)) 
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))  
pic=rs(ChrW(112)&ChrW(105)&ChrW(99))  
expiredatetime=rs(ChrW(101)&ChrW(120)&ChrW(112)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))  
sex=rs(ChrW(115)&ChrW(101)&ChrW(120))   
department=rs(ChrW(100)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116))
idcard=rs(ChrW(105)&ChrW(100)&ChrW(99)&ChrW(97)&ChrW(114)&ChrW(100))
dateOfBirth=rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(79)&ChrW(102)&ChrW(66)&ChrW(105)&ChrW(114)&ChrW(116)&ChrW(104))
email=rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
tel=rs(ChrW(116)&ChrW(101)&ChrW(108))
address=rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)) 
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
weixin=rs(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110))
alipay=rs(ChrW(97)&ChrW(108)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(121))
qq=rs(ChrW(113)&ChrW(113))
inadminid=rs(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))
end if
else
if inadminid="" then inadminid=userrs(ChrW(105)&ChrW(100))
end if
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户添加修改</title> 
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
</head>
<body>  
<script src="../../js/jquery.js"></script>
<script> 
function showBigPic(filepath) {
var html = "<div id='bigPic' style='position:absolute;display:none; z-index:99999'><img style=\"max-width:300px\" src='' id='pre_view'/><br /></div>";
$("#form1").append(html);
//将文件路径传给img大图
document.getElementById('pre_view').src = filepath;
//获取大图div是否存在
var div = document.getElementById("bigPic");
if (!div) {
return;
}
//如果存在则展示
document.getElementById("bigPic").style.display="block";
//获取鼠标坐标
var intX = window.event.clientX;
var intY = window.event.clientY;
//设置大图左上角起点位置
div.style.left = intX +5+ "px";
div.style.top = intY + 5+"px";
}
//隐藏
function closeimg(){
document.getElementById("bigPic").style.display="none";
}
</script>
<%if msg <>"" then  call rw(ChrW(60)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62)& msg &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(62))%>
<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
<div class="layui-form-item">
<label class="layui-form-label">用户名</label>
<div class="layui-input-inline">
<input type="text" name="username" lay-verify="required" placeholder="请输入用户名" class="layui-input" value="<%=username%>">
</div>
</div>    
<div class="layui-form-item">
<label class="layui-form-label">登陆密码</label>
<div class="layui-input-inline">      
<input name="pwd" type="text" class="layui-input" placeholder="不修改留空 "/>
</div>
</div> 
<div class="layui-form-item">
<label class="layui-form-label">昵称</label>
<div class="layui-input-inline">
<input type="text" name="nickname" lay-verify="required" placeholder="请输入昵称" class="layui-input" value="<%=nickname%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">用户</label>
<div class="layui-input-inline">
<select name="inadminid" id="inadminid">          
<option value='-1'>选择用户</option>       
<%
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not rsx.eof
%>
<option value='<%=rsx(ChrW(105)&ChrW(100))%>'<%=IIF(cstr(inadminid)=cstr(rsx(ChrW(105)&ChrW(100))),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>><%=rsx(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(40)& rsx(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(41)%></option>  
<%rsx.movenext:wend:rsx.close%>
</select> 
</div>
</div>  
<div class="layui-form-item" lay-filter="sex">
<label class="layui-form-label">性别</label>
<div class="layui-input-inline">
<select name="sex">
<option value="男">男</option>
<option value="女"<%=IIF(sex=ChrW(22899),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>女</option>
<option value="保密"<%=IIF(sex=ChrW(20445)&ChrW(23494),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>保密</option> 
</select>
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">头像</label>
<div class="layui-input-inline">
<input type="text" name="pic" placeholder="请上传图片" class="layui-input" value="<%=pic%>" onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
</div>
<button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
</div>
<div class="layui-form-item">
<label class="layui-form-label">到期时间</label>
<div class="layui-input-inline"> 
<input name="expiredatetime"  type="text" lay-verify="required" placeholder="到期时间" class="layui-input mydate" value="<%=expiredatetime%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">审核状态</label>
<div class="layui-input-inline">
<input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
</div> 
<div class="layui-form-item">
<label class="layui-form-label">所在部门</label>
<div class="layui-input-inline">
<input type="text" name="department" placeholder="请输入所在部门" class="layui-input" value="<%=department%>">
</div>
</div>    
<div class="layui-form-item">
<label class="layui-form-label">身份证</label>
<div class="layui-input-inline">
<input type="text" name="idcard" placeholder="请输入身份证" class="layui-input" value="<%=idcard%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">出生日期</label>
<div class="layui-input-inline">
<input type="text" name="dateOfBirth" placeholder="请输入出生日期" class="layui-input date" value="<%=dateOfBirth%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">邮箱</label>
<div class="layui-input-inline">
<input type="text" name="email" placeholder="请输入邮箱" class="layui-input" value="<%=email%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">微信</label>
<div class="layui-input-inline">
<input type="text" name="weixin" placeholder="请输入微信" class="layui-input" value="<%=weixin%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">支付宝</label>
<div class="layui-input-inline">
<input type="text" name="alipay" placeholder="请输入微信" class="layui-input" value="<%=alipay%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">QQ</label>
<div class="layui-input-inline">
<input type="text" name="qq" placeholder="请输入qq" class="layui-input" value="<%=qq%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">手机</label>
<div class="layui-input-inline">
<input type="text" name="tel" placeholder="请输入手机" class="layui-input" value="<%=tel%>">
</div>
</div> 
<div class="layui-form-item">
<label class="layui-form-label">联系地址</label>
<div class="layui-input-inline">
<input type="text" name="address" placeholder="请输入联系地址" class="layui-input" value="<%=address%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">内容</label>
<div class="layui-input-block">
<textarea name="bodycontent" <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39),ChrW(32)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(49)&ChrW(48)&ChrW(39))%> placeholder="请输入文章内容" class="layui-textarea"><%=bodycontent%></textarea>
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
}).use(['index', 'form', 'upload', 'laydate'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate;
//正常上传图片
upload.render({
elem: '#layuiadmin-upload-useradmin',
url: '/api/upload/',
done: function(res) {
$(this.item).prev("div").children("input").val(res.data[0].src)
}
});
lay('.mydate').each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy/MM/dd HH:mm:ss'
});
});
lay('.date').each(function() {
laydate.render({
elem: this,
trigger: 'click',
format: 'yyyy/MM/dd'
});
});
})
</script>
</body>
</html>
