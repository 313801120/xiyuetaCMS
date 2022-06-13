<!--#include file="../../../inc/Config.asp"--><!--#include file="../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim icon,msg,id  
if request("act")="save" then
    if userrs("pwd")<>mymd5(request("oldPassword")) then
        icon=0
        msg="原密码不正确"
        call addSystemLog("admin","修改密码失败，当前密码错误"&request("oldPassword"),userRs("username"))  '记录操作日志'         
    else
      userrs("pwd")=mymd5(request("password"))
      userrs.update
      icon=1
      msg="修改密码成功"
      call addSystemLog("admin","修改密码成功",userRs("username"))  '记录操作日志'
    end if
    
end if
%><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>设置我的密码</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all">
</head>
<body>

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save">
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">修改密码</div>
          <div class="layui-card-body" pad15>
            
            <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">原密码 <font color="red">*</font></label>
                <div class="layui-input-inline">
                  <input type="password" name="oldPassword" lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">新密码 <font color="red">*</font></label>
                <div class="layui-input-inline">
                  <input type="password" name="password" lay-verify="pass" lay-verType="tips" autocomplete="off" id="LAY_password" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">5到16个字符</div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">密码确认 <font color="red">*</font></label>
                <div class="layui-input-inline">
                  <input type="password" name="repassword" lay-verify="repass" lay-verType="tips" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <div class="layui-input-block"> 
                    <input type="submit" class="layui-btn" value="确认修改" lay-submit="lay-submit" />
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
  <script>
  layui.config({
    base: '../../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'set']);

<%if msg<>"" then%>
  layui.use(['layer'], function() {
      var layer = layui.layer;
      layer.msg('<%=msg%>', {icon: <%=icon%>,time: 2000})

  });    
<%end if%>



  </script>
</body>
</html>