<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
'禁止自动更新当前文件'  #号去掉代表此文件不被程序自动更新替换掉


'获得当前版本号与账号，与服务器端匹配'
dim serverUrl,webinfo
webinfo=request.serverVariables("SERVER_NAME")
rs.open "select username,version,resurl from " & db_PREFIX & "website" ,conn,1,1
if not rs.eof then 
    webinfo=webinfo&"@"&rs("username")&"@"&rs("version")
    '服务器地址'
    serverUrl=rs("resurl")      '资源服务器地址'
end if:rs.close
if serverUrl="" then serverUrl=getServerUrl()

' call echo("webinfo",webinfo)
' call echo("serverUrl",serverUrl)
' call die("end")

webinfo=escape(webinfo)'转码'


dim msg,addSql,tplid,saction,idlist,id,splstr

   
tplid=request("tplid")
idlist=request("idlist") 


'添加修改
if request("act")="save" then
  ' call echo("idlist",idlist)
  splstr=split(idlist,", ")
  for each id in splstr
    ' call echo("id",id)
    rs.open"select * from ["& db_PREFIX &"tplpage] where id="&id,conn,1,1
    if not rs.eof then
      if rs("saction")<>request("saction"&id) then
        rsx.open"select * from ["& db_PREFIX &"tplpage] where tplid='"& webinfo & tplid &"' and ntype="&rs("ntype"),conn,1,3
        if rsx.eof then rsx.addnew
        rsx("tplid")=webinfo & tplid
        rsx("ntype")=rs("ntype")
        rsx("title")=rs("title")
        rsx("isthrough")=rs("isthrough")
        rsx("saction")=request("saction"&id)
        rsx.update:rsx.close
      end if


    end if:rs.close

  next
  call die("<script>parent.location.reload();</script>")
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

<form id="form1" name="form1" class="layui-form"  method="post" action="<%=serverUrl%>/api/tpl/list/userfrom.asp?act=save&tplid=<%=tplid%>&info=<%=webinfo%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">


   
    <div class='layui-form-item'>
      <label class='layui-form-label'>模板ID</label>
      <div class='layui-input-inline'>
        <input type='text' name='tplid' placeholder='请输入模板ID' autocomplete='off' disabled class='layui-input' value="<%=tplid%>">
      </div>
    </div>



    <%=gethttpurl( serverUrl & "/api/tpl/list/userfrom.asp?tplid="&tplid&"&info="&webinfo,"utf-8")%>




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
