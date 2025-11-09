<!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType  '当前数据库类型'
tableName = "member" '表名称'
winTitle = "会员"
excludeAdminIDLIst=""   '排除权限限制的管理id列表，如 1,2,3'

dim msg,isTrue,sql,addSql'{dim定义块}

'{requesst接收块}

   
'添加修改
if request("act")="save" then
    if id<>"" then
        call showCheckAdminRule("编辑" & winTitle)
    else
        call showCheckAdminRule("添加" & winTitle)
    end if
    isTrue=true
   
    if isTrue=true then
        addsql=" where username='"& username &"'"
        if id<>"" then
            addsql=addsql & " and id<>"&id
        end if
        sql="select * from "&thisAddPrefix(tableName) & addsql
        ' call echo("sql",sql):doevents
        rs.open sql,conn,1,3
        if not rs.eof then  '添加判断'
            msg="用户名称已经存在"
        else
            if id="" then
                rs.addnew
'{添加新的追加块}               

            else
                rs.close  
                rs.open"select * from "&thisAddPrefix(tableName)&" where id="&id,conn,1,3
            end if 

'{rs写入块}
'{rs写入追加块}

            if checkEnLanguage() then
'{rs写入en块}
            end if

            rs.update 


            if id<>"" then
                call addSystemLog(tableName,"编辑成功，ID("&id&")")
            else
                call addSystemLog(tableName,"添加成功，ID("&id&")")
            end if

            call die("<script>parent.reloadTable();</script>")
        end if:rs.close 

    end if
'{编辑页追加动作判断}

'显示
elseif id<>"" then
    call showCheckAdminRule("查看" & winTitle) 
    rs.open"select * from "&thisAddPrefix(tableName)&" where id="&id,conn,1,1
    if not rs.eof then

'{rs显示块}
    end if
else
'{rs默认块}
    call showCheckAdminRule("添加" & winTitle)
end if

'当前表前缀和安全符号的20250923
function thisAddPrefix(tableName)  
    if thisDatabaseType="mysql" then
        thisAddPrefix="`"&db_PREFIX&tableName&"`"
    else
        thisAddPrefix="["&db_PREFIX&tableName&"]"
    end if
end function

'{编辑页ASP函数块}
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=winTitle%>添加修改</title> 
 <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
<script type="text/javascript" src="../../js/jquery.js"></script>
<link href="../../css/nprogress.min.css" rel="stylesheet"/>  
<script src="../../js/nprogress.min.js"></script>
</head>
<body>   
 
<%if msg<>"" then  call rw("<blockquote class=""layui-elem-quote"">"& msg &" &nbsp;<a href='javascript:window.history.go(-1); '>返回</a></blockquote>")%>

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 0px 0 0 0;">
  

    <div class="layui-tab" lay-filter="test-hash">
        <ul class="layui-tab-title">
            <li class="layui-this" lay-id="11">中文设置</li>
            <%if checkEnLanguage() then%>
            <li lay-id="22">英文设置</li> 
            <%end if%>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">

'{html块}

            </div>
            <%if checkEnLanguage() then%>
            <div class="layui-tab-item"> 
'{html_en块}
            </div>
            <%end if%>

            <!-- 提交按钮需要，外部调用 -->
            <div class="layui-form-item<%=IIF(request("showsubmit")="1",""," layui-hide")%>">
              <input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
            </div>
 
        </div>
    </div>
  </div>
</form>
 
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../../js/pc.js?v20250716_1"></script>
<!-- 编辑页加载更多js文件 -->
<script>
layui.config({
    base: '../../layuiadmin/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce','colorpicker','rate','transfer'], function() {
    var $ = layui.$,
        form = layui.form,
        upload = layui.upload,
        laydate = layui.laydate,
        colorpicker = layui.colorpicker;

    var a = (layui.laytpl, layui.setter, layui.view, layui.admin);
    //查看图片
    a.events.avartatPreview = function(t) { 
      var i = $(this).parent().find("input").val();
      layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
    } 
    

//{编辑页上传图片JS块}
//{编辑器JS代码}
//{编辑页颜色选择器JS块}
//{编辑页时间选择器JS块} 
//{编辑页字段左边图标注释JS块}
//{编辑页JS追加代码块}

    


})
// pasteImage("pic");
// 粘贴上传图片


// 配置 nprogress 的基本选项（可选）  
NProgress.configure({ showSpinner: true }); // 显示/隐藏加载时的旋转器  
  
// 监听页面加载事件  
document.addEventListener('DOMContentLoaded', startProgress); // DOM 结构加载完成（不含样式、图片、子框架）  
window.addEventListener('load', stopProgress); // 页面所有资源加载完成（含样式、图片、子框架）  
  
function startProgress() {  
    NProgress.start(); // 开始显示进度条  
}  
  
function stopProgress() {  
    NProgress.done(); // 完成进度条  
}  

 
</script>
<!-- 标签显示代码块 --> 

</body>
</html>
