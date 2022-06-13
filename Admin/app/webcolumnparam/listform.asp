<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim msg,isTrue,addSql,id,parentid,title,isthrough,sortrank,pic1,pic2,pic3,aboutcontent,bodycontent,author
dim param1,param2,param3,param4,param5,param6,param7,param8,param9,param10
id=request("id")
parentid=request("parentid")              '大类'
title=request("title")                    '标题'
isthrough=request("isthrough")            '审核'
pic1=request("pic1")          '缩略图' 
pic2=request("pic2")          '缩略图' 
pic3=request("pic3")          '缩略图' 
param1=request("param1")          '参数1
param2=request("param2")          '参数2
param3=request("param3")          '参数3
param4=request("param4")          '参数4
param5=request("param5")          '参数5
param6=request("param6")          '参数6
param7=request("param7")          '参数7
param8=request("param8")          '参数8
param9=request("param9")          '参数9
param10=request("param10")          '参数10
bodycontent=request("bodycontent")                    '文章内容
isthrough=IIF(isthrough="on",1,0)         '处理下'
if parentid="" then 
  parentid=-1
else
  parentid=int(parentid)
end if 

'添加修改
if request("act")="save" then
  isTrue=true
   
  if isTrue=true then
    addsql=" where parentid="& parentid &" AND title='"& title &"'"
    if id<>"" then
      addsql=addsql & " and id<>"&id
    end if
    rs.open"select * from ["& db_PREFIX &"webcolumnparam]"&addsql,conn,1,3
    if not rs.eof then
      msg="栏目名称已经存在"
    else
      if id="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"webcolumnparam] where id="&id,conn,1,3
      end if 
      rs("parentid")=parentid 
      rs("title")=title 
      rs("isthrough")=isthrough 
      rs("pic1")=pic1 
      rs("pic2")=pic2 
      rs("pic3")=pic3 
      rs("param1")=param1 
      rs("param2")=param2 
      rs("param3")=param3 
      rs("param4")=param4 
      rs("param5")=param5 
      rs("param6")=param6 
      rs("param7")=param7 
      rs("param8")=param8 
      rs("param9")=param9 
      rs("param10")=param10 
      rs("bodycontent")=bodycontent 
      rs.update 
      response.Write"<script>parent.location.reload();</script>"
      response.end()
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"webcolumnparam] where id="&id,conn,1,1
  if not rs.eof then
    parentid=rs("parentid") 
    id=rs("id") 
    title=rs("title")     
    pic1=rs("pic1")       
    pic2=rs("pic2")       
    pic3=rs("pic3")       
    param1=rs("param1")          '参数1
    param2=rs("param2")          '参数2
    param3=rs("param3")          '参数3
    param4=rs("param4")          '参数4
    param5=rs("param5")          '参数5
    param6=rs("param6")          '参数6
    param7=rs("param7")          '参数7
    param8=rs("param8")          '参数8
    param9=rs("param9")          '参数9
    param10=rs("param10")          '参数10   
    isthrough=rs("isthrough")     
    bodycontent=rs("bodycontent")  
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
      <div class="layui-input-block">
        <input type="text" name="title" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="<%=title%>">
      </div>
    </div>       
    <div class="layui-form-item">
      <label class="layui-form-label">建站定位</label>
      <div class="layui-input-block">
        <input type="text" name="param1" lay-verify="required" placeholder="请输入建站定位" autocomplete="off" class="layui-input" value="<%=param1%>">
      </div>
    </div>      
    <div class="layui-form-item">
      <label class="layui-form-label">价格区间</label>
      <div class="layui-input-block">
        <input type="text" name="param2" lay-verify="required" placeholder="请输入价格区间" autocomplete="off" class="layui-input" value="<%=param2%>">
      </div>
    </div>     
    <div class="layui-form-item">
      <label class="layui-form-label">优惠信息</label>
      <div class="layui-input-block">
        <input type="text" name="param3" lay-verify="required" placeholder="请输入优惠信息" autocomplete="off" class="layui-input" value="<%=param3%>">
      </div>
    </div>   
    <div class="layui-form-item">
      <label class="layui-form-label">定制网站</label>
      <div class="layui-input-block">
        <input type="text" name="param4" lay-verify="required" placeholder="请输入定制网站" autocomplete="off" class="layui-input" value="<%=param4%>">
      </div>
    </div>  
    <div class="layui-form-item">
      <label class="layui-form-label">域名注册</label>
      <div class="layui-input-block">
        <input type="text" name="param5" lay-verify="required" placeholder="请输入域名注册" autocomplete="off" class="layui-input" value="<%=param5%>">
      </div>
    </div> 
    <div class="layui-form-item">
      <label class="layui-form-label">网站服务器</label>
      <div class="layui-input-block">
        <input type="text" name="param6" lay-verify="required" placeholder="请输入网站服务器" autocomplete="off" class="layui-input" value="<%=param6%>">
      </div>
    </div> 
    <div class="layui-form-item">
      <label class="layui-form-label">续费价格</label>
      <div class="layui-input-block">
        <input type="text" name="param7" lay-verify="required" placeholder="请输入续费价格" autocomplete="off" class="layui-input" value="<%=param7%>">
      </div>
    </div>  
    <div class="layui-form-item">
      <label class="layui-form-label">导航栏目</label>
      <div class="layui-input-block">
        <input type="text" name="param8" lay-verify="required" placeholder="请输入导航栏目" autocomplete="off" class="layui-input" value="<%=param8%>">
      </div>
    </div> 
    <div class="layui-form-item">
      <label class="layui-form-label">设计标准</label>
      <div class="layui-input-block">
        <input type="text" name="param9" lay-verify="required" placeholder="请输入设计标准" autocomplete="off" class="layui-input" value="<%=param9%>">
      </div>
    </div>  
    <div class="layui-form-item">
      <label class="layui-form-label">资料录入</label>
      <div class="layui-input-block">
        <input type="text" name="param10" lay-verify="required" placeholder="请输入资料录入" autocomplete="off" class="layui-input" value="<%=param10%>">
      </div>
    </div>   

    <div class="layui-form-item">
      <label class="layui-form-label">缩略图1</label>
      <div class="layui-input-inline">
        <input type="text" name="pic1" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic1%>">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
    </div>
 
     <div class="layui-form-item">
      <label class="layui-form-label">缩略图2</label>
      <div class="layui-input-inline">
        <input type="text" name="pic2" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic2%>">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin2">上传图片</button> 
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">缩略图3</label>
      <div class="layui-input-inline">
        <input type="text" name="pic3" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic3%>">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin3">上传图片</button> 
    </div>
  <%if 1=2 then%>
    <div class="layui-form-item">
      <label class="layui-form-label">文章内容</label>
      <div class="layui-input-block">
        <textarea name="bodycontent" <%=IIF(request("editor")<>"no"," id='bodycontent'"," rows='10'")%> placeholder="请输入文章内容" class="layui-textarea"><%=bodycontent%></textarea>
      </div>
    </div>  
<%end if%>


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
    upload.render({
        elem: '#layuiadmin-upload-useradmin2',
        url: '/api/upload/',
        done: function(res) {
            $(this.item).prev("div").children("input").val(res.data.src)
        }
    });
    upload.render({
        elem: '#layuiadmin-upload-useradmin3',
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
