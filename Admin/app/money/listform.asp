<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim msg,isTrue,addSql,id,userid,isthrough,bodycontent,price,daytime,localdir,smallimage,pic2,pic3,inadminid
id=request(ChrW(105)&ChrW(100))
userid=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))
inadminid=request(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))
price=request(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0)
if price="" then price=0
daytime=request(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
localdir=request(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(100)&ChrW(105)&ChrW(114))
smallimage=request(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
pic2=request(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50))
pic3=request(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51))

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
isTrue=true 
if isTrue=true then
if id <>"" then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id
end if
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32) & addsql,conn,1,3
if id="" then rs.addnew    
if userid <>"" then rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=userid   
if inadminid <>"" then rs(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=inadminid   
rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))=price  
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent  
rs(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(100)&ChrW(105)&ChrW(114))=localdir  
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough   
rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))=smallimage  
rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50))=pic2  
rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51))=pic3  
if daytime <>"" then rs(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=daytime
rs.update:rs.close
call die(ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(59)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62))

end if

elseif id <>"" then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
id=rs(ChrW(105)&ChrW(100)) 
userid=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))    
inadminid=rs(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))    
price=rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))    
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))    
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))  
daytime=format_Time(rs(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),20)
localdir=rs(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(100)&ChrW(105)&ChrW(114))   
smallimage=rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))  
pic2=rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50))  
pic3=rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51))  
end if:rs.close
else
if inadminid="" then  inadminid=userrs(ChrW(105)&ChrW(100))
isthrough=1
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
<%if 1=2 then%>
<div class="layui-form-item">
<label class="layui-form-label">会员ID</label>
<div class="layui-input-inline">
<input type="text" name="userid" lay-verify="required" placeholder="请输入会员ID" autocomplete="off" class="layui-input" value="<%=userid%>">
</div>
</div>
<%else%>
<div class="layui-form-item">
<label class="layui-form-label">会员ID</label>
<div class="layui-input-inline">
<select name="userid" id="userid">
<%rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(32),conn,1,1
while not rs.eof
%>
<option value='<%=rs(ChrW(105)&ChrW(100))%>'<%=IIF(cstr(userid)=cstr(rs(ChrW(105)&ChrW(100))),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>><%=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(40)& rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(41)%></option>
<%rs.movenext:wend:rs.close%>
</select> 
</div>
</div>  
<%end if%>
<div class="layui-form-item">
<label class="layui-form-label">用户</label>
<div class="layui-input-inline">
<select name="inadminid" id="inadminid">          
<option value='-1'>选择用户</option>       
<%
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not rs.eof
%>
<option value='<%=rs(ChrW(105)&ChrW(100))%>'<%=IIF(cstr(inadminid)=cstr(rs(ChrW(105)&ChrW(100))),ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>><%=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(40)& rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(41)%></option>  
<%rs.movenext:wend:rs.close%>
</select> 
</div>
</div>  
<div class="layui-form-item">
<label class="layui-form-label">金钱</label>
<div class="layui-input-inline">
<input type="text" name="price" lay-verify="required" placeholder="请输入金钱" autocomplete="off" class="layui-input" value="<%=price%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">付款时间</label>
<div class="layui-input-inline">
<input type='text' name='daytime' placeholder='请输入付款时间' autocomplete='off' class='layui-input mydate' value="<%=daytime%>">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">本地目录</label>
<div class="layui-input-inline">
<input type="text" name="localdir" placeholder="请输入本地目录" autocomplete="off" class="layui-input" value="<%=localdir%>">
</div>
</div>
<!-- 上传图片必需要在编辑器的前面，要不然放上去图片显示的位置不对 20230827 -->
<div class="layui-form-item">
<label class="layui-form-label">图片1</label>
<div class="layui-input-inline">
<input type="text" name="smallimage" id="smallimage" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=smallimage%>"  onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
</div>
<button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
<button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
onclick="layuiOpenIndex=showwin('拍照', '../../system/uploadphoto/photograph/');">拍照</button>
<button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
onclick="layuiOpenIndex=showwin3('签名', '../../system/uploadphoto/tuya/');">签名</button>
</div>
<div class="layui-form-item">
<label class="layui-form-label">图片2</label>
<div class="layui-input-inline">
<input type="text" name="pic2" id="pic2" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic2%>"  onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
</div>
<button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-pic2">上传图片</button> 
<button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
onclick="picDomId='pic2';layuiOpenIndex=showwin('拍照', '../../system/uploadphoto/photograph/');">拍照</button>
<button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
onclick="picDomId='pic2';layuiOpenIndex=showwin3('签名', '../../system/uploadphoto/tuya/');">签名</button>
</div>
<div class="layui-form-item">
<label class="layui-form-label">图片3</label>
<div class="layui-input-inline">
<input type="text" name="pic3" id="pic3" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic3%>"  onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
</div>
<button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-pic3">上传图片</button> 
<button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
onclick="picDomId='pic3';layuiOpenIndex=showwin('拍照', '../../system/uploadphoto/photograph/');">拍照</button>
<button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
onclick="picDomId='pic3';layuiOpenIndex=showwin3('签名', '../../system/uploadphoto/tuya/');">签名</button>
</div>
<div class="layui-form-item">
<label class="layui-form-label">内容</label>
<div class="layui-input-block">
<textarea name="bodycontent" <%=IIF(request(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)) <>ChrW(110)&ChrW(111),ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39),ChrW(32)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(49)&ChrW(48)&ChrW(39))%>  placeholder="请输入简要说明" class="layui-textarea"><%=bodycontent%></textarea>
</div>
</div>
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
elem: '#layuiadmin-upload-useradmin,#layuiadmin-upload-pic2,#layuiadmin-upload-pic3',
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
var layuiOpenIndex;
var picDomId='smallimage';//默认为小图
function getPaiZhaoImg(src,msg){ 
$("input[name='"+picDomId+"']").val(src)
layer.close(layuiOpenIndex);
layer.msg(msg, {icon: 1});
}
var imgInputObj;//图片的input对象
//获得粘贴板内容
document.getElementById("smallimage").addEventListener('paste', function (event) {  
imgInputObj=$(this);
uploadclipboardDataImage(event);
})
document.getElementById("pic2").addEventListener('paste', function (event) {  
imgInputObj=$(this);
uploadclipboardDataImage(event);
})
document.getElementById("pic3").addEventListener('paste', function (event) {  
imgInputObj=$(this);
uploadclipboardDataImage(event);
})
// let pHtml = event.clipboardData.getData('text/html');  为获取网页内容部分20230306
//上传粘贴板里的图片
function uploadclipboardDataImage(event){
console.log("粘贴内容22") 
if (!event || !event.clipboardData) return;
let pText = event.clipboardData.getData('text/plain');
if (pText) {//有文本内容的时候才是true   注意：空字符串''是false
// showCVText(pText);
} else if (event.clipboardData.items) {//没有文本内容，判断这个数组，文件可能在这个数组里
let blob = null, items = event.clipboardData.items;
for (let i = 0; i < items.length; i++) {
if (items[i].kind === 'file') {//类型 是 文件
blob = items[i].getAsFile();
if (items[i].type.indexOf("image") !== -1) {//文件类型是图像
showImage(blob);
} else if (items[i].type.indexOf("text") !== -1) {//文件类型是文本
// showText(blob);
}
} 
}
} else {
alert("粘了个寂寞");
}
}
function showImage(blob) {
getContext(blob).then(res => { //图片数据能直接被img识别
// document.getElementById("previewImage").src = res; 
jQuery.ajax({
url: '/api/upfileClipboardImg.asp?act=submit',//要加个type以判断是否为客服
type: 'POST',
dataType: "json",
data: {
'content': res
},
error: function(XMLHttpRequest, textStatus, errorThrown) {
console.log(XMLHttpRequest)
console.log(textStatus)
console.log(errorThrown)
},
success: function(data) { 
// var data=jQuery.parseJSON(result); 
// alert("aa")
switch (data.status) {
case "y": 
// alert(data.info)
imgInputObj.val("/"+data.img)
break;
case "n": 
break;
}
}
});
})
}
/**
* 把字节转为web识别的base64格式数据
* @param blob
* @returns {Promise<unknown>}
*/
function getContext(blob) {
return new Promise((resolve) => {
if (blob == null) resolve();
let reader = new FileReader();
reader.onload = function (event) {
console.log(event)
resolve(event.target.result);
}
reader.readAsDataURL(blob);
});
}
</script>
<script type="text/javascript" src="../../js/pc.js"></script> 
</body>
</html>
