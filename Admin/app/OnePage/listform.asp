<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
'#禁止自动更新当前文件'  #号去掉代表此文件不被程序自动更新替换掉
call openconn()  
dim msg,isTrue,addSql,id,title,bodycontent,smallimage

id=request("id")
title=request("title")
bodycontent=request("bodycontent")
smallimage=request("smallimage")


'添加修改
if request("act")="save" then
  isTrue=true
  if isTrue=true then
    addsql=" WHERE title=''"
    if id<>"" then
      addsql=addsql & " AND id<>"&id
    end if
    addsql=" WHERE id=-1"
    rs.open"select * from ["& db_PREFIX &"onepage]"&addsql,conn,1,3
    if not rs.eof then
      msg="已经存在"
    else
      if id="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"onepage] where id="&id,conn,1,3
      end if 
      rs("title")=title
      rs("bodycontent")=bodycontent
      rs("smallimage")=smallimage

      rs.update 
      call die("<script>parent.location.reload();</script>")
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"onepage] where id="&id,conn,1,1
  if not rs.eof then
    id=rs("id")
    title=rs("title")
    bodycontent=rs("bodycontent")
    smallimage=rs("smallimage")

  end if
end if
 

%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加修改</title> 
 <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
</head>
<body>  

<%if msg<>"" then  call rw("<blockquote class=""layui-elem-quote"">"& msg &" &nbsp;<a href='javascript:window.history.go(-1); '>返回</a></blockquote>")%>

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">


   
       <div class='layui-form-item'>
      <label class='layui-form-label'>标题</label>
      <div class='layui-input-inline'>
        <input type='text' name='title' placeholder='请输入标题' autocomplete='off' class='layui-input' value="<%=title%>">
      </div>
    </div>
    <div class='layui-form-item'>
      <label class='layui-form-label'>内容</label>
      <div class='layui-input-block'>
    <textarea name='bodycontent' <%=IIF(request("editor")<>"no"," id='bodycontent'style='display:none;'"," rows='10'")%> placeholder='请输入简要说明' class='layui-textarea'><%=bodycontent%></textarea><%if request("editor")<>"no" then%><a href="?editor=no&id=<%=id%>">不显示编辑器</a><%end if%>
      </div>
    </div>
    <div class='layui-form-item'>
      <label class='layui-form-label'>图片</label>
      <div class='layui-input-inline'>
        <input type='text' name='smallimage' placeholder='请输入图片' autocomplete='off' class='layui-input' value="<%=smallimage%>">
      </div>
<button style='float: left;' type='button' class='layui-btn' id='layuiadmin-upload-useradmin'>上传图片</button>     </div>
 

 

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
            $(this.item).prev("div").children("input").val(res.data[0].src)
        }
    });

    upload.render({
        elem: '#layuiadmin-upload-useradmin2',
        url: '/api/upload/',
        done: function(res) {
            $(this.item).prev("div").children("input").val(res.data[0].src)
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

})


</script>
    

</body>
</html>
