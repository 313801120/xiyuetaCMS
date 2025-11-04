<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call showCheckAdminRule(ChrW(30465)&ChrW(24066)&ChrW(21439))

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,idList,name,splxx,isthrough,sData

function getSheShiIdList(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim d,e
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)&ChrW(61)&a & b &  ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not c.eof 
if d <>"" then d=d & ChrW(44)
d=d & c(ChrW(105)&ChrW(100))
e=getSheShiIdList(c(ChrW(105)&ChrW(100)),b)
if e <>"" then
d=d & ChrW(44) & e
end if
c.movenext:wend:c.close
getSheShiIdList=d
end function

function getSubSheShiSort(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59) & b
else
b=b & ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)) <>-1 then
call getSubSheShiSort(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)),b)
end if
end if:c.close
getSubSheShiSort=b
end function

If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then 
idList=getSheShiIdList(ChrW(45)&ChrW(49),"")
splxx=split(idList,ChrW(44))
dim nStart,nEnd
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) 
sData=""
nStart=num*(page-1) 
nEnd=num*page
if nEnd>ubound(splxx) then nEnd=ubound(splxx)
for i=nStart to nEnd
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&splxx(i),conn,1,1
if not rs.eof then
if sData <>"" then sData=sData & ChrW(44)
isthrough=""
if rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) <>0 then
isthrough=ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)
end if
name=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
if rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)) <>-1 then
name=getSubSheShiSort(rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),"") &name
end if
sData=sData &ChrW(123)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & name & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) & isthrough & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)) & ChrW(34)&ChrW(125) &sHr & ""  
end if:rs.close
next
stemp = stemp & sData & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & ubound(splxx) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(125) 
Response.Write stemp 
Response.end()
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(101)&ChrW(108) then
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(105)&ChrW(100))
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
Response.end()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104) then
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&IIF(request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101),1,0) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(105)&ChrW(100))
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(35774)&ChrW(32622)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
Response.end()
End if 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站栏目</title>
<script type="text/javascript" src="../../js/jquery.js"></script><link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
<style>
.layui-table-cell .layui-form-checkbox[lay-skin="primary"] {/*让列表选项位置上下居中 20230331*/
top: 4px;
}
</style>
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
<button class="layui-btn" onclick="showwin('添加栏目','listform2.asp?')">添加</button>
</div>
<script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
</script>
<table class="layui-hide" id="table" lay-filter="demo"></table>
<script>
layui.use(['form','table'],function(){
var form = layui.form
table = layui.table; 
//方法级渲染
table.render({
elem: '#table',
url: '?act=list',
cols: [
[
{ field: 'id', title: 'ID', width: 70, minWidth: 70, sort: false }
, { field: 'name', title: '分类名', sort: false }
, { field: 'sortrank', title: '排序', width: 70, minWidth: 70, sort: false }
,{field: 'isthrough', title: '是否显示',width:100, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
, { fixed: 'right', title: '操作', width: 150, toolbar: '#barDemo' }
]
],
id: 'testReload',
page: true,
limit: 120
});
//是否置顶
form.on('switch', function(data){
var index = layer.msg('修改中，请稍候',{icon: 16,time:false,shade:0.8});
setTimeout(function(){
var pid=data.elem.value
layer.close(index);
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=isthrough",
data: { "id": pid,"isthrough":data.elem.checked }, 
success: function(data) { 
switch (data.status) {
case "y": 
break;
case "n":                       
break;
}
}
});
if(data.elem.checked){
layer.msg("置顶成功！");
}else{
layer.msg("取消置顶成功！");
}
},500);
})
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
var pid = obj.data["id"]
if (obj.event === 'del') {
layer.confirm('确定删除此分类？',{icon:3, title:'提示信息'}, function(index) {
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=del",
data: { "id": pid },
success: function(data) {
switch (data.status) {
case "y":
obj.del();
break;
}
}
});
layer.close(index);
});
} else if (obj.event === 'edit') {
showwin('修改栏目', 'listform2.asp?id=' + pid)        
}
});
});
</script>
<script type="text/javascript" src="../../js/pc.js"></script>  
</body>
</html>
