<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim msg,isTrue,addSql,mydd,title,ip,createtime,bodycontent,isthrough

mydd=request("mydd")
title=request("title")
ip=request("ip")
createtime=request("createtime")
bodycontent=request("bodycontent")
isthrough=request("isthrough")
isthrough=IIF(isthrough="on",1,0) 


'添加修改
if request("act")="save" then
  isTrue=true
  if isTrue=true then
    addsql=" WHERE title=''"
    if mydd<>"" then
      addsql=addsql & " AND mydd<>"&mydd
    end if
    addsql=" WHERE mydd=-1"
    rs.open"select * from ["& db_PREFIX &"xiyueta]"&addsql,conn,1,3
    if not rs.eof then
      msg="已经存在"
    else
      if mydd="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"xiyueta] where mydd="&mydd,conn,1,3
      end if 
      rs("title")=title
      rs("ip")=ip
      rs("createtime")=createtime
      rs("bodycontent")=bodycontent
      if isthrough<>"" then rs("isthrough")=isthrough

      rs.update 
      call die("<script>parent.location.reload();</script>")
    end if:rs.close 
  end if
'显示
elseif mydd<>"" then
  rs.open"select * from ["& db_PREFIX &"xiyueta] where mydd="&mydd,conn,1,1
  if not rs.eof then
    mydd=rs("mydd")
    title=rs("title")
    ip=rs("ip")
    createtime=rs("createtime")
    bodycontent=rs("bodycontent")
    isthrough=rs("isthrough")

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

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&mydd=<%=mydd%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">


   
       <div class='layui-form-item'>
      <label class='layui-form-label'>标题</label>
      <div class='layui-input-inline'>
        <input type='text' name='title' placeholder='请输入标题' autocomplete='off' class='layui-input' value='<%=title%>'>
      </div>
    </div>
    <div class='layui-form-item'>
      <label class='layui-form-label'>IP地址</label>
      <div class='layui-input-inline'>
        <input type='text' name='ip' placeholder='请输入IP地址' autocomplete='off' class='layui-input' value='<%=ip%>'>
      </div>
    </div>
    <div class='layui-form-item'>
      <label class='layui-form-label'>创建时间</label>
      <div class='layui-input-inline'>
        <input type='text' name='createtime' placeholder='请输入创建时间' autocomplete='off' class='layui-input date' value='<%=createtime%>'>
      </div>
    </div>
    <div class='layui-form-item'>
      <label class='layui-form-label'>内容</label>
      <div class='layui-input-block'>
    <textarea name='bodycontent' <%=IIF(request("editor")<>"no"," id='bodycontent'style='display:none;'"," rows='10'")%> placeholder='请输入简要说明' class='layui-textarea'><%=bodycontent%></textarea>
      </div>
    </div>
    <div class='layui-form-item'>
      <label class='layui-form-label'>审核</label>
      <div class='layui-input-inline'>
    <input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isthrough=0,""," checked")%>>
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
