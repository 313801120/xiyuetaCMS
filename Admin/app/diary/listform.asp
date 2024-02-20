<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim msg,isTrue,addSql,id,parentid,isthrough,bodyContent,clsssname,title,writedatetime,weather

id=request("id")
title=request("title")              '大类' 
bodycontent=request("bodycontent")                    '钱 
writedatetime=request("writedatetime")
weather=request("weather")        '天气'
isthrough=IIF(isthrough="on",1,0)         '处理下'
if parentid="" then 
  parentid=-1
else
  parentid=int(parentid)
end if 

'添加修改
if request("act")="save" then
  isTrue=true
  if title="" then    
    msg="标题不能为空"
    isTrue=false
  end if
 
  if isTrue=true then 
    if id<>"" then
      addsql=" where id="&id
    end if
    rs.open"select * from ["& db_PREFIX &"diary]"&addsql,conn,1,3    
      if id="" then
        rs.addnew    
      end if 
      rs("title")=title 
      rs("bodycontent")=bodycontent     
      rs("writedatetime")=writedatetime     
      rs("weather")=weather     
      rs("ip")=getIP()
      rs.update 
      response.Write"<script>parent.location.reload();</script>"
      response.end()
    rs.close 
  end if


 
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"diary] where id="&id,conn,1,1
  if not rs.eof then
    id=rs("id") 
    title=rs("title")   
    writedatetime=format_Time(rs("writedatetime"),20)
    weather=rs("weather")
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
      <label class="layui-form-label">日记标题</label>
      <div class="layui-input-block">
        <input type="text" name="title" lay-verify="required" placeholder="请输入日记标题" autocomplete="off" class="layui-input" value="<%=title%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">天气</label>
      <div class="layui-input-inline">
        <input type="text" name="weather" lay-verify="required" placeholder="请输入天气" autocomplete="off" class="layui-input" value="<%=weather%>">
      </div>
    </div>

 

    <div class="layui-form-item">
      <label class="layui-form-label">日记内容</label>
      <div class="layui-input-block">
        <textarea name="bodyContent" lay-verify="required" placeholder="请输入简要说明" class="layui-textarea"><%=bodyContent%></textarea>
      </div>
    </div>
 

     <div class="layui-form-item">
      <label class="layui-form-label">日记时间</label>
      <div class="layui-input-inline"> 
        <input name="writedatetime"  type="text" lay-verify="required" placeholder="日记写入时间" autocomplete="off" class="layui-input date" value="<%=writedatetime%>">
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
            format: 'yyyy/MM/dd HH:mm:ss'

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
