<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include virtual = "/common.Asp"-->
<%
dim sType,touserid,nickname
sType=request(ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(111)&ChrW(117)&ChrW(116) then
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=""
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))=""
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))=""
call eerr(ChrW(25552)&ChrW(31034),ChrW(36864)&ChrW(20986)&ChrW(30331)&ChrW(24405)&ChrW(23436)&ChrW(25104)&ChrW(65281)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(39)&ChrW(62)&ChrW(30331)&ChrW(24405)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62))
end if
function kf_language(a)
if language=ChrW(102)&ChrW(116) then
a=jtToft(a)
elseif language=ChrW(101)&ChrW(110) then
if a=ChrW(32852)&ChrW(31995)&ChrW(23458)&ChrW(26381) then
a=ChrW(67)&ChrW(85)&ChrW(83)&ChrW(84)&ChrW(79)&ChrW(77)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(73)&ChrW(67)&ChrW(69)
elseif a=ChrW(23458)&ChrW(26381) then
a=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(105)&ChrW(99)&ChrW(101)
elseif a=ChrW(32842)&ChrW(22825) then
a=ChrW(99)&ChrW(104)&ChrW(97)&ChrW(116)
end if        
end if 
kf_language=a
end function
if sType=ChrW(104)&ChrW(102) then

if session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))="" or session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))="" or session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))="" then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(48),conn,1,1
if not rs.eof then
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=rs(ChrW(105)&ChrW(100))
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))=rs(ChrW(112)&ChrW(119)&ChrW(100))
end if:rs.close
end if 
end if 
%>
<!--#include file="../inc/member_safe.asp"-->
<%
webTitle=kf_language(ChrW(32852)&ChrW(31995)&ChrW(23458)&ChrW(26381))
nickname=kf_language(ChrW(23458)&ChrW(26381))
touserid=request(ChrW(116)&ChrW(111)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))
if touserid="" then touserid=0
if sType=ChrW(104)&ChrW(102) then
webTitle=kf_language(ChrW(32842)&ChrW(22825))
end if
if touserid <>"" then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&touserid,conn,1,1
if not rs.eof then
nickname=rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
end if:rs.close
end if
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title><%=webTitle%></title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="headerbox">
<div class="header">
<div class="headerL">
<a onclick="javascript:history.back(-1)" class="goback">
<img src="images/goback.png" /></a>
</div>
<div class="headerC">
<p><%=webTitle%></p>
</div>
<div class="headerR"></div>
</div>
</div>
<style>
.bfEgQL {
border: none;
margin: 0px;
padding: 0px;
overflow: visible;
overflow-wrap: normal;
box-shadow: rgb(0 0 0 / 16%) 0px 5px 40px;
border-radius: 8px;
position: fixed;
z-index: 9999999;
top: 50%;
left: 50%;
transform: translateX(-50%) translateY(-50%);
width:500px;
height: 610px;
display: block !important;
}
</style>
<iframe name="chat" id="chat" src="chat.asp?type=<%=sType%>&touserid=<%=touserid%>&language=<%=language%>" scrolling="no" class="bfEgQL"></iframe>
<script src="../js/jquery-1.8.1.min.js"></script>
<script>
var nWidth=$(window).width();
if(nWidth<500){
$("iframe").attr("style","width:"+(nWidth-20)+"px")
}
//手机
var nHeight=$(window).height();
// alert(nHeight)
if(nHeight<=900){
$("iframe").css("top","44%")
}
// if(nHeight>610){
//     $("iframe").attr("style","height:"+(nHeight-120)+"px")
// }
//获得粘贴板内容
document.addEventListener('paste', function (event) {
var frames=document.getElementById("chat");//frameid即右栏iframe的id名
frames.contentWindow.uploadclipboardDataImage(event);
})
</script>
</html>
