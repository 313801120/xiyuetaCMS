<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../../inc/Config.asp"--><!--#Include File = "../../../admin_function.Asp"--><!--#Include File = "../../../admin_safe.Asp"--><% 
dim stemp,id,bodycontent,tuyaContent,pic
id=request(ChrW(105)&ChrW(100))
bodycontent=request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97))
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then     
pic=uploadbase64Images(request(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)))       
stemp = ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(50)&ChrW(32)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(49)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(34)&ChrW(58)&ChrW(34)& pic &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(20445)&ChrW(23384)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(125) 
call die(stemp)
end if

function uploadbase64Images(a) 
dim b ,c,d
b=ChrW(47)&ChrW(85)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(116)&ChrW(117)&ChrW(121)&ChrW(97)&ChrW(47) & format_Time(now(),5) & ChrW(47)
call createDirFolder(b)
c=b & format_Time(now(),6) & ChrW(46)&ChrW(106)&ChrW(112)&ChrW(103)   
d=c
call base64ToImages(c,a)
uploadbase64Images=d
end function
%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>涂鸦</title>
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" href="css/sketchpad.css">
<style>
#head {
background-color: #FF9FBA;
height: 40px;
color: white;
text-align: center;
line-height: 40px;
font-family: "微软雅黑";
font-size: 1em;
}
#head a {
color: white;
position: absolute;
text-decoration: none;
font-size: 12px; 
}
.sketchpad {
background: #FFF;
width: 400px;
height: 400px;
border-radius: 2px;
}
#hb {
position: absolute;
top: 40px;
text-align: center;
width: 100%;
height: 50px;
}
#b1 {
width: 45px;
height: 28px;
font-size: 14px;
background-color: pink;
border: 0;
position: absolute;
left: 10px;
top: 10px;
}
#b2 {
width: 45px;
height: 28px;
font-size: 14px;
background-color: pink;
border: 0;
position: absolute;
left: 68px;
top: 10px;
}
#bb {
position: absolute;
left: 123px;
top: 13px;
}
#recover-button {
width: 65px;
height: 28px;
font-size: 14px;
background-color: pink;
border: 0;
}
#b3 {
width: 75px;
height: 28px;
font-size: 14px;
background-color: pink;
border: 0;
}
</style>
<!--[if IE]>
<script src="js/html5shiv.min.js"></script>
<![endif]-->
</head>
<body>
<!-- <div id="head"> -->
<!-- <a href="home.html" data-ajax="false" style="left: 12px;">主页</a> -->
<!-- <span style="font-weight: bolder;">涂鸦</span> -->
<!-- </div> -->
<div class="htmleaf-container">
<div id="main_content_wrap" class="outer">
<section id="main_content" class="inner">
<div style="text-align: center">
<canvas class="sketchpad" id="sketchpad" style="margin-top: 48px;"></canvas>
</div>
<div id="hb">
<button id="b1" onclick="undo()">撤销</button>
<button id="b2" onclick="redo()">恢复</button>
<div id="bb">
<input id="color-picker" type="color" style="top: 0;position: absolute;">
<input id="size-picker" type="range" min="1" max="50" style="left: 51px;position: absolute;"></div>
</div>
<!-- <button id="recover-button" onclick="recover()">预览</button> -->
<button id="b3" onclick="animateSketchpad()">欣赏</button>
<button id="recover-button" onclick="restore()">上传</button>
<!-- <button id="recover-button" onclick="loadTuYa()">加载</button> -->
</div>
</section>
</div>
</div>
<script>
window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')
</script>
<script src="js/sketchpad.js?v12"></script> 
<script type="text/javascript">
var sketchpad;
$(document).ready(function() {
var nW=$("body").width()-20;
var nH=$("body").height()-150;
$("#sketchpad").css("width",nW+"px")
$("#sketchpad").css("height",nH+"px")
sketchpad = new Sketchpad({
element: '#sketchpad',
width: nW,
height: nH,
penSize:5,
color:"#000000"//pink
}); 
$('#color-picker').change(color);
$('#color-picker').val(sketchpad.color);
$('#size-picker').change(size);
$('#size-picker').val(sketchpad.penSize);
<%=IIF(tuyaContent <>"",ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(84)&ChrW(117)&ChrW(89)&ChrW(97)&ChrW(40)&ChrW(41)&ChrW(59),ChrW(51)&ChrW(51))%>
});
function undo() {
sketchpad.undo();
}
function redo() {
sketchpad.redo();
}
function color(event) {
sketchpad.color = $(event.target).val();
}
function size(event) {
sketchpad.penSize = $(event.target).val();
}
//绘制路线
function animateSketchpad() {
sketchpad.animate(10);
}
//预览
function recover(event) {
var settings = sketchpad.toObject();
settings.element = '#other-sketchpad';
var otherSketchpad = new Sketchpad(settings);
$('#recover-button').hide();
}
function restore() { 
var id="";
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=save",
data: { "id": id, 
"data":sketchpad.toJSON(), 
"picdata":convertCanvasToImage(document.getElementById("sketchpad"))
},
success: function(data) {
window.parent.getPaiZhaoImg(data.pic,"保存签名成功!");//执行父窗体动作
}
});
}
//加载 
function loadTuYa() { 
var str = '<%=tuyaContent%>'
console.log("str",str)
sketchpad.strokesBC(str)
animateSketchpad()
}
// function convertCanvasToImage(canvas) {
//     var image = new Image();
//     image.src = canvas.toDataURL("image/png");
//     return image;
// }
</script>
</body>
<script> 
// Converts canvas to an image
function convertCanvasToImage(canvas) {
var image = new Image(); 
return canvas.toDataURL("image/png");
}
function aa(){
var canvas=document.getElementById('sketchpad');
console.log(convertCanvasToImage(canvas))
}
</script>
</html>