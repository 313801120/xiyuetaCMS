<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../inc/Config.asp"-->
<!--#Include File = "../admin_function.asp"-->
<!--#Include File = "../admin_safe.Asp"--><% 
call showCheckAdminRule(ChrW(22791)&ChrW(20221)&ChrW(24674)&ChrW(22797)&ChrW(25968)&ChrW(25454))
call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,c,s,splstr,cList,filePath,nFileSize,nSize,isHandle,mdbFilePath,accessPath,content,configFilePath,startStr,endStr,findStr,replaceStr
mdbFilePath=handlePath(MDBPath)

If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then  
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) 
c=getDirFileNameList(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97), ChrW(109)&ChrW(100)&ChrW(98))
splstr=split(c,vbcrlf)
for i=0 to ubound(splstr)
s=replace(splstr(i),ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98),"")
if cList <>"" then cList=cList & ChrW(44)   
filePath=handlePath(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&splstr(i))
isHandle=true
if lcase(filePath)=lcase(mdbFilePath) then isHandle=false
cList = cList & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & (i+1) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & s & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & printFileSize(getfSize(filePath)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & getFileEditDate(filePath) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & isHandle & ChrW(34)&ChrW(125)
next
stemp = stemp & cList & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & ubound(splstr) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(125) 
call die(stemp)

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(114)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(114) then
if userrs(ChrW(112)&ChrW(119)&ChrW(100)) <>mymd5(request(ChrW(112)&ChrW(119)&ChrW(100))) then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
elseif userrs(ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108)) <>1 then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21482)&ChrW(26377)&ChrW(36229)&ChrW(32423)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(25165)&ChrW(21487)&ChrW(25805)&ChrW(20316)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
accessPath=ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47) & request(ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98)
configFilePath=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(47)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(65)&ChrW(115)&ChrW(112)
content=readfile(configFilePath,"")

startStr = ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) : endStr = ChrW(34) 
if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
findStr = getStrCut(content, startStr, endStr, 1) 
replaceStr = startStr & accessPath & endStr 
content = replace(content, findStr, replaceStr) 
call writeToFile(configFilePath, content, "") 
end if 
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22791)&ChrW(20221)&ChrW(25968)&ChrW(25454)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)) 

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(112) then
call copyfile(mdbFilePath,ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(112)&ChrW(95) & format_Time(now(),6) & ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22791)&ChrW(20221)&ChrW(25968)&ChrW(25454)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(101)&ChrW(108) then
if userrs(ChrW(112)&ChrW(119)&ChrW(100)) <>mymd5(request(ChrW(112)&ChrW(119)&ChrW(100))) then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
elseif userrs(ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108)) <>1 then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21482)&ChrW(26377)&ChrW(36229)&ChrW(32423)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(25165)&ChrW(21487)&ChrW(25805)&ChrW(20316)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))    
end if
filePath=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)& request(ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98)

call moveFile(filePath,filePath & ChrW(46)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(25968)&ChrW(25454)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(122)&ChrW(105)&ChrW(112) then     
nFileSize=getfSize(mdbFilePath)
call compactDB(mdbFilePath, False) 
nSize=nFileSize-getfSize(mdbFilePath)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21387)&ChrW(32553)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(21387)&ChrW(32553)&ChrW(22823)&ChrW(23567)&ChrW(20026)&ChrW(40)& printFileSize(nSize) &ChrW(41)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
End if 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台日志</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../layuiadmin/layui/layui.js"></script>
</head>
<body style="padding:10px 6px 30px 6px;background: #FFF">  
<div class="layui-form "> 
<div class="layui-inline">
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_min" placeholder="开始日期" autocomplete="off" class="layui-input date">
</div>
<div class="layui-input-inline">-</div>
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_max" placeholder="结束日期" autocomplete="off" class="layui-input date">
</div>
</div>
<button class="layui-btn" data-type="reload">搜索</button> 
<button class="layui-btn" onclick="submitBackupData()">备份数据</button>
<button class="layui-btn" onclick="submitZipData()">压缩数据库</button>
</div>
<script type="text/html" id="barDemo">
{{#  if(d.isHandle == 'False'){ }} 
当前使用数据库
{{#  } else { }}
<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="recover"><i class="layui-icon layui-icon-edit"></i>恢复</a>
<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
{{#  } }}
</script>
<table class="layui-hide" id="table" lay-filter="demo"></table>
<script>
layui.use('table', function() {
var table = layui.table;
//方法级渲染
table.render({
elem: '#table',
url: '?act=list',
cols: [
[
{ field: 'i', title: '序号', width: 70, sort: true }
, { field: 'name', title: '名称', minWidth: 120, sort: false } 
, { field: 'size', title: '文件大小', width: 120, sort: false } 
, { field: 'time', title: '最后修改时间', width: 160, sort: false } 
, { fixed: 'right', title: '操作', width: 150, toolbar: '#barDemo' }
]
],
id: 'testReload',
page: true,
limit: 20
});
var $ = layui.$,
active = {
reload: function() {
//执行重载
table.reload('testReload', {
page: {
curr: 1 //重新从第 1 页开始
},
where: {
date_min: $('input[name=date_min]').val(),
date_max: $('input[name=date_max]').val(),
key: $('input[name=key]').val()
}
});
}
};
$('.layui-form .layui-btn').on('click', function() {
var type = $(this).data('type');
active[type] ? active[type].call(this) : '';
}); 
//监听行工具事件
table.on('tool(demo)', function(obj) {
var data = obj.data;
var name = obj.data["name"]
if (obj.event === 'del') {
layer.prompt({
formType: 1,
title: '敏感操作，请验证密码'
}, function(value, index) {
layer.close(index);
layer.confirm('确定删除此数据库？',{icon:3, title:'提示信息'}, function(index) {
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=del",
data: { "name": name,"pwd":value }, 
success: function(data) {                  
layer.msg(data.info);
switch (data.status) {
case "y":
obj.del();
break;
case "n":                   
break;
}
}
});
layer.close(index);
});
});
} else if (obj.event === 'recover') {
layer.prompt({
formType: 1,
title: '敏感操作，请验证密码'
}, function(value, index) {
layer.close(index);
layer.confirm('确定恢复些数据库',{icon:3, title:'提示信息'}, function(index) {
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=recover",
data: { "name": name,"pwd":value }, 
success: function(data) {  
layer.msg(data.info);
switch (data.status) {
case "y":
location.reload(true);
break;
case "n":                   
break;
}  
}
});
layer.close(index);
});
});
}
});
});
function submitBackupData(){
layer.confirm('确定要备份数据',{icon:3, title:'提示信息'}, function(index) {
$.ajax({
type: "POST",
cache: false,
dataType: "json",
url: "?act=backup",  
success: function() {
location.reload(true);
}
});
layer.close(index);
});
}
function submitZipData(){
layer.confirm('确定要压缩数据库',{icon:3, title:'提示信息'}, function(index) {
$.ajax({
type: "POST",
cache: false,
dataType: "json",
url: "?act=zip",  
success: function(data) {
layer.msg(data.info, {icon: 1});
}
});
layer.close(index);
});
}
</script>
<script type="text/javascript" src="../js/pc.js"></script>
</body>
</html>