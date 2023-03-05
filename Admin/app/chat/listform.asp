<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim msg,isTrue,addSql,id,parentid,title,isthrough,sortrank,smallimage,aboutcontent,bodycontent,author,webtitle,webkeywords,webdescription,bigimage,filename,price,originalprice,sales,delivery,userid

id=request("id") 
isthrough=request("isthrough")            '审核' 
bodycontent=request("bodycontent")                    '文章内容 
userid=request("userid")                    '文章内容 
isthrough=IIF(isthrough="on",1,0)         '处理下'
 


 


'添加修改
if request("act")="save" then
  isTrue=true
  ' if sortrank="" then    
  '   msg="排序不能为空"
  '   isTrue=false 
  ' end if
  if isTrue=true then
    addsql=" where bodycontent='sadfasd#sdfasdf'"
    
    if id<>"" then
      addsql=addsql & " and id<>"&id
    end if
    rs.open"select * from ["& db_PREFIX &"chat]"&addsql,conn,1,3
    if not rs.eof then
      msg="栏目名称已经存在"
    else
      if id="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"chat] where id="&id,conn,1,3
      end if 
      rs("adminid")=userrs("id")
      rs("bodycontent")=bodycontent  
      rs.update 
      response.Write"<script>parent.location.reload();</script>"
      response.end()
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"chat] where id="&id,conn,1,1
  if not rs.eof then   
    id=rs("id")  
    ' isthrough=rs("isthrough")  
    bodycontent=rs("bodycontent")   
    userid=rs("userid")   
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

 
    <div class="layui-form-item">
      <label class="layui-form-label">会员ID</label>
      <div class="layui-input-inline">
        <input type="text" name="userid" lay-verify="number" placeholder="请输入会员ID" autocomplete="off" class="layui-input" value="<%=userid%>">
      </div>
    </div>


    <div class="layui-form-item">
      <label class="layui-form-label">文章内容</label>
      <div class="layui-input-block">
        <textarea name="bodycontent" <%=IIF(request("editor")<>"no"," id='bodycontent'style='display:none;'"," rows='20'")%> placeholder="请输入文章内容" class="layui-textarea"><%=bodycontent%></textarea><%if request("editor")<>"no" then%><a href="?editor=no&id=<%=id%>">不显示编辑器</a><%end if%>
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
    upload.render({
        elem: '#layuiadmin-upload-useradmin2',
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

})


</script>
    

</body>
</html>
