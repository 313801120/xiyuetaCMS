<!--#include file="../../../inc/Config.asp"--><!--#include file="../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim msg,id  
if request("act")="save" then 
    userrs("nickname")=request("nickname")
    userrs("sex")=request("sex")
    userrs("email")=request("email")
    userrs("tel")=request("tel")
    userrs("pic")=request("pic")
    userrs("bodycontent")=request("bodycontent")
    userrs.update        
    call addSystemLog("admin","设置我的资料",userRs("username"))  '记录操作日志'
    
end if
%><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>设置我的资料</title>
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
          <div class="layui-card-header">设置我的资料</div>
          <div class="layui-card-body" pad15>
            
            <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">我的角色</label>
                <div class="layui-input-inline">
                  <select name="role" lay-verify="">
                      <option value="1"<%=IIF(userrs("level")=1," selected"," disabled")%>>超级管理员</option>
                      <option value="2"<%=IIF(userrs("level")=2," selected"," disabled")%>>普通管理员</option>
                      <option value="3"<%=IIF(userrs("level")=3," selected"," disabled")%>>审核员</option>
                      <option value="4"<%=IIF(userrs("level")=4," selected"," disabled")%>>编辑人员</option>
                  </select> 
                </div>
                <div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                  <input type="text" name="username" value="<%=userrs("username")%>" readonly class="layui-input" style="background-color:#F2F2F2;">
                </div>
                <div class="layui-form-mid layui-word-aux">不可修改。一般用于后台登入名</div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-inline">
                  <input type="text" name="nickname" value="<%=userrs("nickname")%>" lay-verify="required" autocomplete="off" placeholder="请输入昵称" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                  <select name="sex">
                  <option value="男">男</option>
                  <option value="女"<%=IIF(userrs("sex")="女"," selected","")%>>女</option>
                  <option value="保密"<%=IIF(userrs("sex")="保密"," selected","")%>>保密</option>
                  </select>
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">头像</label>
                <div class="layui-input-inline">
                  <input name="pic" id="LAY_avatarSrc" placeholder="图片地址" value="<%=userrs("pic")%>" class="layui-input">
                </div>
                <div class="layui-input-inline layui-btn-container" style="width: auto;">
                  <button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                  </button>
                  <button type="button" class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
                </div>
             </div>
              <div class="layui-form-item">
                <label class="layui-form-label">手机</label>
                <div class="layui-input-inline">
                  <input type="text" name="tel" value="<%=userrs("tel")%>" autocomplete="off" class="layui-input"><!--lay-verify="phone"-->
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                  <input type="text" name="email" value="<%=userrs("email")%>" autocomplete="off" class="layui-input"><!-- lay-verify="email"-->
                </div>
              </div>
              <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                  <textarea name="bodycontent" placeholder="请输入内容" class="layui-textarea"><%=userrs("bodycontent")%></textarea>
                </div>
              </div>
              <div class="layui-form-item">
                <div class="layui-input-block"> 
                    <input type="submit" class="layui-btn" value="确认修改" lay-submit="lay-submit" /><%=msg%>
                  <button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
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
  }).use(['index','form','upload','croppers'], function() {
    var $ = layui.$,
        croppers = layui.croppers
        ,upload = layui.upload
        ,a = (layui.laytpl, layui.setter, layui.view, layui.admin)
    var device = layui.device();
    //手机端
    if (device.ios || device.android) { 
      //正常上传图片
      upload.render({
          elem: '#LAY_avatarUpload',
          url: '/api/upload/',
          done: function(res) {              
            $("input[name=pic]").val(res.data[0].src) 
          }
      }), a.events.avartatPreview = function(t) {
        var i = layui.$("#LAY_avatarSrc").val();
        layui.layer.photos({ photos: { title: "查看头像", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
      }
    }else{
      //上传带截图
      croppers.render({
          elem: '#LAY_avatarUpload'
          ,saveW:150     //保存宽度
          ,saveH:150
          ,mark:1/1    //选取比例
          ,area:'900px'  //弹窗宽度
          ,url: "/api/upload/"  //图片上传接口返回和（layui 的upload 模块）返回的JOSN一样
          ,done: function(res){ //上传完毕回调
            $("input[name=pic]").val(res.data[0].src) 
            layer.closeAll('page');
          }
      }), a.events.avartatPreview = function(t) {
        var i = layui.$("#LAY_avatarSrc").val();
        layui.layer.photos({ photos: { title: "查看头像", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
      }
    }
 


})
  </script>
</body>
</html>