<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../inc/Config.asp"-->
<!--#Include File = "../admin_function.asp"-->
<!--#Include File = "../admin_safe.Asp"--><%
call showCheckAdminRule(ChrW(19978)&ChrW(20256)&ChrW(22270)&ChrW(29255)&ChrW(31649)&ChrW(29702))
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本地上传文件</title>
<script type="text/javascript" src="<%=adminDir%>js/jquery.js"></script>
<link rel="stylesheet" href="<%=adminDir%>layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="<%=adminDir%>layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=adminDir%>js/pc.js?v7"></script>
<link href="<%=adminDir%>css/nprogress.min.css" rel="stylesheet"/>  
<script src="<%=adminDir%>js/nprogress.min.js"></script>
<style>
.pic_list{padding: 10px;}
/*瀑布流层*/
.waterfall{
-moz-column-count:4; /* Firefox */
-webkit-column-count:4; /* Safari 和 Chrome */
column-count:4;
-moz-column-gap: 10px;
-webkit-column-gap:10px;
column-gap: 10px;
}
/*一个内容层*/
.item{
padding: 15px;
-moz-page-break-inside: avoid;
-webkit-column-break-inside: avoid;
break-inside: avoid;
border: 1px solid #eee;
margin-top: 0;
margin-right: 0;
margin-bottom: 10px;
margin-left: 0;
background-color: #FFF;
}
.item img{
width: 100%;
margin-bottom:10px;
}
.pic_list {
max-width: 900px;
margin-right: auto;
margin-bottom: 20px;
margin-left: auto;
}
.pic_page {
padding: 30px;
text-align: center;
}
.pic_page span {
line-height: 40px;
display: inline-block;
border: 1px solid #eee;
padding-right: 13px;
padding-left: 13px;
color: #666;
background-color: #FFF;
height: 40px;
}
.pic_page a {
color: #666;
display: inline-block;
padding-right: 13px;
padding-left: 13px;
background-color: #FFF;
border: 1px solid #eee;
line-height: 40px;
}
.pic_page .pagecur {
background-color: #FFC824;
border: 1px solid #FFC824;
color: #FFF;  
}
.pic_list li p {
line-height: 25px;
color: #666;
}
.layui-icon-delete{
font-size: 20px;
float: right;
cursor: pointer;
}
</style>
</head>
<body style="background-color:#f5f5f5">
<%
dim filePath,fhuizhui,sImg
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(101)&ChrW(108) then
filePath=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(85)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(47) & getFileAttr(request(ChrW(112)&ChrW(105)&ChrW(99)),ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
if checkFile(filePath) then
call echo(ChrW(21024)&ChrW(38500)&ChrW(25991)&ChrW(20214)&ChrW(25104)&ChrW(21151),filePath)
call deleteFile(filePath)
end if
end if 
%>
<% 
dim fpath,objFSO,objfolder,picArr,picbegin,pageSize,page,objfile,picnum,i,m,thispageend,img_html,pageCount,usezt,isuse,page_html
fpath=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(85)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(47)
Set objFSO = Server.CreateObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
set objfolder=objFSO.getfolder(server.mappath(fpath))
picArr=""
picbegin=""
pageSize=20
page=request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
If page="" Then page=1
picbegin=(page-1)*pageSize
for each objfile in objfolder.files 
If picArr="" then
picArr=objfile.name&ChrW(36)&objfile.DateLastModified&ChrW(36)&objfile.size
Else
picArr=picArr&ChrW(124)&objfile.name&ChrW(36)&objfile.DateLastModified&ChrW(36)&objfile.size
End if
next 
set objfolder=nothing 
picArr=Split(picArr,ChrW(124))
picnum=UBound(picArr)+1
Dim short
for i=0 To UBound(picArr)
For m=i To UBound(picArr)
If CDate(Split(picArr(i),ChrW(36))(1))<CDate(Split(picArr(m),ChrW(36))(1)) Then
short=picArr(i)
picArr(i)=picArr(m)
picArr(m)=short
End if
next
next
If picnum<pageSize Then
pageCount=1
Else
pageCount=Int(picnum/pageSize)
If picnum Mod pageSize >0 Then pageCount=pageCount+1
End if
thispageend=picbegin+pageSize -1
If thispageend >=picnum Then thispageend=picnum-1
img_html = ""
For i=picbegin To thispageend











if request(ChrW(97)&ChrW(99)&ChrW(116)) <>ChrW(117)&ChrW(115)&ChrW(101)&ChrW(100) or usezt=0 then
fhuizhui=lcase(getFileAttr(Split(picArr(i),ChrW(36))(0),4))
if instr(ChrW(124)&ChrW(106)&ChrW(112)&ChrW(103)&ChrW(124)&ChrW(106)&ChrW(112)&ChrW(101)&ChrW(103)&ChrW(124)&ChrW(103)&ChrW(105)&ChrW(102)&ChrW(124)&ChrW(98)&ChrW(109)&ChrW(112)&ChrW(124)&ChrW(112)&ChrW(110)&ChrW(103)&ChrW(124),ChrW(124)& fhuizhui &ChrW(124))>0 then
fhuizhui=ChrW(106)&ChrW(112)&ChrW(103)&ChrW(46)&ChrW(115)&ChrW(118)&ChrW(103)
elseif instr(ChrW(124)&ChrW(114)&ChrW(97)&ChrW(114)&ChrW(124)&ChrW(122)&ChrW(105)&ChrW(112)&ChrW(124),ChrW(124)& fhuizhui &ChrW(124))>0 then
fhuizhui=ChrW(122)&ChrW(105)&ChrW(112)&ChrW(46)&ChrW(115)&ChrW(118)&ChrW(103)
elseif instr(ChrW(124)&ChrW(120)&ChrW(108)&ChrW(115)&ChrW(124)&ChrW(120)&ChrW(108)&ChrW(115)&ChrW(120)&ChrW(124),ChrW(124)& fhuizhui &ChrW(124))>0 then
fhuizhui=ChrW(120)&ChrW(108)&ChrW(115)&ChrW(46)&ChrW(115)&ChrW(118)&ChrW(103)
else
fhuizhui=ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(115)&ChrW(118)&ChrW(103)
end if
sImg=ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(39)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(47)& fhuizhui &ChrW(39)&ChrW(32)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(61)&ChrW(39)&ChrW(53)&ChrW(48)&ChrW(39)&ChrW(32)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(53)&ChrW(48)&ChrW(39)&ChrW(62)
img_html = img_html + ChrW(60)&ChrW(108)&ChrW(105)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&fpath&Split(picArr(i),ChrW(36))(0)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(62)& sImg &ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(32)&ChrW(111)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(61)&ChrW(34)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(40)&ChrW(39)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(85)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(47)&Split(picArr(i),ChrW(36))(0)&ChrW(39)&ChrW(41)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)
img_html = img_html +ChrW(60)&ChrW(112)&ChrW(62)&Split(picArr(i),ChrW(36))(0)&ChrW(60)&ChrW(47)&ChrW(112)&ChrW(62)
img_html = img_html +ChrW(60)&ChrW(112)&ChrW(32)&ChrW(62)&Split(picArr(i),ChrW(36))(1)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(58)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(59)&ChrW(62)&cint(Split(picArr(i),ChrW(36))(2)/1024)&ChrW(107)&ChrW(98)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(112)&ChrW(62)
img_html = img_html +ChrW(60)&ChrW(112)&ChrW(32)&ChrW(62)&isuse&ChrW(60)&ChrW(47)&ChrW(112)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62)
end if
Next 
page_html = ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(24403)&ChrW(21069)&ChrW(65306)&ChrW(31532)&page&ChrW(39029)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(32)&ChrW(32)
For i=1 To pageCount
if cstr(i)=request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)) or (request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))="" and i=1)  then
page_html = page_html + ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61)&i&ChrW(39)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(114)&ChrW(62)&i&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)
else
page_html = page_html + ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61)&i&ChrW(39)&ChrW(62)&i&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)
end if
Next
page_html = page_html + ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(20849)&ChrW(35745)&pageCount&ChrW(39029)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)
%>
<div class="pic_list">
<ul class="waterfall">
<%=img_html%>
</ul>
</div>
<div class="pic_page">
<%=page_html%>
</div>
<script> 
//重新加载表格20240524
function reloadTable(){
// $('button[data-type=reload]').click();
$('button[lay-event=refreshtable]').click();
layer.closeAll(); // 关闭所有弹窗，无论类型
}
layui.use(['form','table','dropdown','laydate','colorpicker'],function(){
var form = layui.form
var table = layui.table
var laydate = layui.laydate;
var dropdown = layui.dropdown;
var colorpicker = layui.colorpicker; 
})
function del(pic) {
layer.confirm('确定删除？', function(index){ 
window.location.href='?act=del&pic='+pic
layer.close(index);
});
return false;
}
</script>
</body>
</html>
