<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim msg,isTrue,addSql,id,parentid,title,isthrough,sortrank,smallimage,aboutContent,bodyContent,author

id=request("id")
parentid=request("parentid")              '大类'
title=request("title")                    '标题'
sortrank=request("sortrank")              '排序' 
if sortrank="" then sortrank=0
isthrough=request("isthrough")            '审核'
smallimage=request("smallimage")          '缩略图' 
aboutContent=request("aboutContent")                    '简要说明'
bodyContent=request("bodyContent")                    '文章内容
author=request("author")                    '作者
isthrough=IIF(isthrough="on",1,0)         '处理下'
if parentid="" then 
  parentid=-1
else
  parentid=int(parentid)
end if 

'添加修改
if request("act")="save" then
  isTrue=true
  if sortrank="" then    
    msg="排序不能为空"
    isTrue=false 
  end if
  if isTrue=true then
    addsql=" where title='"& title &"'"
    if id<>"" then
      addsql=addsql & " and id<>"&id
    end if
    rs.open"select * from ["& db_PREFIX &"articleDetail]"&addsql,conn,1,3
    if not rs.eof then
      msg="栏目名称已经存在"
    else
      if id="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"articleDetail] where id="&id,conn,1,3
      end if 
      rs("parentid")=parentid 
      rs("title")=title 
      rs("sortrank")=sortrank 
      rs("isthrough")=isthrough 
      rs("smallimage")=smallimage 
      rs("aboutContent")=aboutContent 
      rs("bodyContent")=bodyContent 
      rs("author")=author 
      rs.update 
      response.Write"<script>parent.location.reload();</script>"
      response.end()
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"articleDetail] where id="&id,conn,1,1
  if not rs.eof then
    parentid=rs("parentid") 
    id=rs("id") 
    title=rs("title")   
    sortrank=rs("sortrank")   
    isthrough=rs("isthrough")  
    smallimage=rs("smallimage")  
    aboutContent=rs("aboutContent")  
    bodyContent=rs("bodyContent")  
  end if
end if
 

%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加修改文章</title> 
 <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
</head>
<body>  

<%if msg<>"" then  call rw("<blockquote class=""layui-elem-quote"">"& msg &" &nbsp;<a href='javascript:window.history.go(-1); '>返回</a></blockquote>")%>

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">


   <div class="layui-form-item">
      <label class="layui-form-label">选择分类</label>
      <div class="layui-input-inline">
        

<select name="parentid" id="parentid" selected><option value="-1">≡ 作为一级栏目 ≡</option>
      <%=columnSubInput(-1,id,parentid)%>
    </select>

      </div> 
    </div>
        
    <div class="layui-form-item">
      <label class="layui-form-label">标题</label>
      <div class="layui-input-inline">
        <input type="text" name="title" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="<%=title%>">
      </div>
    </div>   

    <div class="layui-form-item">
      <label class="layui-form-label">缩略图</label>
      <div class="layui-input-inline">
        <input type="text" name="smallimage" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=smallimage%>">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">排序</label>
      <div class="layui-input-inline">
        <input type="text" name="sortrank" lay-verify="number" placeholder="请输入排序" autocomplete="off" class="layui-input" value="<%=sortrank%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">作者</label>
      <div class="layui-input-inline">
        <input type="text" name="author"   placeholder="请输入作者" autocomplete="off" class="layui-input" value="<%=author%>">
      </div>
    </div>
    

    <div class="layui-form-item">
      <label class="layui-form-label">简要说明</label>
      <div class="layui-input-block">
        <textarea name="aboutContent" placeholder="请输入简要说明" class="layui-textarea"><%=aboutContent%></textarea>
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">文章内容</label>
      <div class="layui-input-block">
        <textarea name="bodyContent" id="bodyContent"  placeholder="请输入文章内容" class="layui-textarea"><%=bodyContent%></textarea>
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
    layedit.build('bodyContent');   //建立编辑器

})


</script>
    

</body>
</html>
