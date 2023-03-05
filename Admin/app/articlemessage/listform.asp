<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim msg,isTrue,addSql,id,title,guestname,tel,email,address,isthrough,bodycontent,reply

id=request("id")
title=request("title")                    '标题' 
guestname=request("guestname")                    '姓名' 
tel=request("tel")                    '电话' 
email=request("email")                    '电话' 
address=request("address")                    '地址' 
bodycontent=request("bodycontent")        '留言内容' 
reply=request("reply")                    '回复内容' 
isthrough=request("isthrough")            '审核'  
isthrough=IIF(isthrough="on",1,0)         '处理下'

'添加修改
if request("act")="save" then
  isTrue=true 
  if isTrue=true then
    addsql=" where title='"& title &"'"
    if id<>"" then
      addsql=addsql & " and id<>"&id
    end if
    rs.open"select * from ["& db_PREFIX &"guestBook]"&addsql,conn,1,3
    if not rs.eof then
      msg="栏目名称已经存在"
    else
      if id="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"guestBook] where id="&id,conn,1,3
      end if 
      rs("title")=title  
      rs("guestname")=guestname  
      rs("tel")=tel  
      rs("email")=email  
      rs("address")=address  
      rs("bodycontent")=bodycontent  
      rs("reply")=reply  
      rs("isthrough")=isthrough  
      rs.update 
      response.Write"<script>parent.location.reload();</script>"
      response.end()
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"guestBook] where id="&id,conn,1,1
  if not rs.eof then
    id=rs("id") 
    title=rs("title")    
    guestname=rs("guestname")    
    tel=rs("tel")    
    email=rs("email")    
    address=rs("address")    
    bodycontent=rs("bodycontent")    
    reply=rs("reply")    
    isthrough=rs("isthrough")  
  end if
end if
 

%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加修改留言</title> 
 <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
</head>
<body>  

<%if msg<>"" then  call rw("<blockquote class=""layui-elem-quote"">"& msg &" &nbsp;<a href='javascript:window.history.go(-1); '>返回</a></blockquote>")%>

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
        
    <div class="layui-form-item">
      <label class="layui-form-label">标题</label>
      <div class="layui-input-inline">
        <input type="text" name="title" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="<%=title%>">
      </div>
    </div> 
    <div class="layui-form-item">
      <label class="layui-form-label">姓名</label>
      <div class="layui-input-inline">
        <input type="text" name="guestname" placeholder="请输入姓名" autocomplete="off" class="layui-input" value="<%=guestname%>">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">电话</label>
      <div class="layui-input-inline">
        <input type="text" name="tel" placeholder="请输入电话" autocomplete="off" class="layui-input" value="<%=tel%>">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">邮箱</label>
      <div class="layui-input-inline">
        <input type="text" name="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input" value="<%=email%>">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">地址</label>
      <div class="layui-input-inline">
        <input type="text" name="address" placeholder="请输入地址" autocomplete="off" class="layui-input" value="<%=address%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">留言内容</label>
      <div class="layui-input-block">
        <textarea name="bodycontent" id="bodycontent" placeholder="请输入留言内容" class="layui-textarea"><%=bodycontent%></textarea>
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">回复内容</label>
      <div class="layui-input-block">
        <textarea name="reply" id="reply" placeholder="请输入回复内容" class="layui-textarea"><%=reply%></textarea>
      </div>
    </div>  


  
    <div class="layui-form-item">
      <label class="layui-form-label">审核状态</label>
      <div class="layui-input-inline">
        <input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,""," checked")%>>
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
        elem: '#layuiadmin-upload-useradmin',
        url: '/api/upload/',
        done: function(res) {
            $(this.item).prev("div").children("input").val(res.data.src)
        }
    });

    lay('.date').each(function() {
        laydate.render({
            elem: this,
            trigger: 'click',
            format: 'yyyy/MM/dd'

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
    layedit.build('reply');   //建立编辑器

})


</script>
    

</body>
</html>
