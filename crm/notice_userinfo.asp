<!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit"/>
<meta name="force-rendering" content="webkit"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="shortcut icon" href="./theme/favicon.ico" />
<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<title></title>

<link rel="stylesheet" type="text/css" href="./theme/jinkecrm/css/jinkecrm.css?v=17.0-231011">
<link rel="stylesheet" type="text/css" href="./theme/windows/css/desktop.css?v=17.0-231011">
<link rel='stylesheet' type="text/css" href="./theme/jinkecrm/css/font-awesome.min.css?v=17.0-231011">
<script type="text/javascript" src="./theme/jinkecrm/js/jinkecrm.js?v=17.0-231011"></script>
<script type="text/javascript" src="./theme/jinkecrm/js/jquery-1.11.2.min.js?v=17.0-231011"></script>
<script type="text/javascript" src="./theme/jinkecrm/js/jquery.artDialog.js?skin=chrome"></script> 
<script type="text/javascript" src="./theme/layui/layer/layer.js?v=17.0-231011"></script> 

<style>
body { overflow:hidden; }
.td_l_c { height:28px; }
</style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
  <colgroup>
  <col width="35%">
  <col width="30%">
  <col width="35%">
  </colgroup>
  <tbody>
    <tr>
      <td class="td_l_c" rowspan="4"><img src="./theme/jinkecrm/images/avatar.jpg" width="70" height="70" class="utouxiang" id="logoimg" /> <a class="btn1 uinfo page-app" data-width="1020" data-height="560" title="修改资料" href="/admin/set/user/info.asp"><i class="fa fa-edit"></i> 修改资料</a></td>
      <td class="td_l_c">姓名</td>
      <td class="td_l_c">超级管理员</td>
    </tr>
    <tr>
      <td class="td_l_c">部门</td>
      <td class="td_l_c">总经办</td>
    </tr>
    <tr>
      <td class="td_l_c">职务</td>
      <td class="td_l_c">超级管理员</td>
    </tr>
    <tr>
      <td class="td_l_c">电话</td>
      <td class="td_l_c"></td>
    </tr>
  </tbody>
</table>

<script>
/*弹出窗口封装代码*/
$(".page-app").on("click",function(){
var width = $(this).data("width")?$(this).data("width"):900,//获得宽度
height = $(this).data("height")?$(this).data("height"):400//获得高度
url = $(this).attr("href")//获得打开URL
title = $(this).attr("title");//获得标题	
$.dialog.open(url, {title: title, width:width,height:height,fixed:true,lock:false,id:window.name});
return false;	
})
</script>
</body>
</html>
