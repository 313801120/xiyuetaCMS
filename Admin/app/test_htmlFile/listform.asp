<!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType  '当前数据库类型'
tableName = "htmlfile" '表名称'
winTitle = "生成html管理"
excludeAdminIDLIst="3"   '排除权限限制的管理id列表，如 1,2,3'

dim msg,isTrue,sql,addSql,id,stype,htmlfilepath,npage,createtime,updatetime,status

id=getStrToNumber(request("id"))
stype=request("stype")
htmlfilepath=request("htmlfilepath")
npage=getStrToNumber(request("npage"))
if npage="" then npage=null
createtime=request("createtime")
if createtime="" then createtime=null
updatetime=request("updatetime")
if updatetime="" then updatetime=null
status=getStrToNumber(request("status"))
if status="" then status=null


   
'添加修改
if request("act")="save" then
    if id<>"" then
        call showCheckAdminRule("编辑" & winTitle)
    else
        call showCheckAdminRule("添加" & winTitle)
    end if
    isTrue=true
   
    if isTrue=true then
        addsql=""
        if id<>"" then
            addsql=" where id<>"&id
        end if
        sql="select * from "&thisAddPrefix(tableName) & addsql
        ' call echo("sql",sql):doevents
        rs.open sql,conn,1,3
        if not rs.eof and 1=2 then  '添加判断'
            msg="标题已经存在。"
        else
            if id="" then
                rs.addnew
               

            else
                rs.close  
                rs.open"select * from "&thisAddPrefix(tableName)&" where id="&id,conn,1,3
            end if 

            rs("stype")=stype
            rs("htmlfilepath")=htmlfilepath
            rs("npage")=npage
            rs("createtime")=createtime
            rs("updatetime")=updatetime
            rs("status")=status

'{rs写入追加块}

            if checkEnLanguage() then

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


'显示
elseif id<>"" then
    call showCheckAdminRule("编辑" & winTitle)
    rs.open"select * from "&thisAddPrefix(tableName)&" where id="&id,conn,1,1
    if not rs.eof then

        id=rs("id")
        stype=rs("stype")
        htmlfilepath=rs("htmlfilepath")
        npage=rs("npage")
        createtime=rs("createtime")
        updatetime=rs("updatetime")
        status=rs("status")

    end if
else

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
        <%'英文版没有内容，则把英文版标题删除掉%>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">

                <div class='layui-form-item'>
                    <label class='layui-form-label'>类型</label>
                    <div class='layui-input-inline layui-input-wrap'>
                        <input type='text' name='stype' placeholder='请输入类型' autocomplete='off' class='layui-input' value="<%=inputCL(stype)%>" >
                    </div><!--stype-->
                </div>
                <div class='layui-form-item'>
                    <label class='layui-form-label'>html文件路径</label>
                    <div class='layui-input-inline layui-input-wrap'>
                        <input type='text' name='htmlfilepath' placeholder='请输入html文件路径' autocomplete='off' class='layui-input' value="<%=inputCL(htmlfilepath)%>" >
                    </div><!--htmlfilepath-->
                </div>
                <div class='layui-form-item'>
                    <label class='layui-form-label'>页码</label>
                    <div class='layui-input-inline layui-input-wrap'>
                        <input step="1" lay-affix="number" type='text' name='npage' placeholder='请输入页码' autocomplete='off' class='layui-input' value="<%=inputCL(npage)%>" >
                    </div><!--npage-->
                </div>
                <div class='layui-form-item'>
                    <label class='layui-form-label'>添加时间</label>
                    <div class='layui-input-inline layui-input-wrap'>
                        <div class='layui-input-prefix'><i class='layui-icon layui-icon-date'></i></div>
                        <input type='text' name='createtime' placeholder='请输入添加时间' autocomplete='off' class='layui-input date' value="<%=createtime%>" >
                    </div><!--createtime-->
                </div>
                <div class='layui-form-item'>
                    <label class='layui-form-label'>修改时间</label>
                    <div class='layui-input-inline layui-input-wrap'>
                        <div class='layui-input-prefix'><i class='layui-icon layui-icon-date'></i></div>
                        <input type='text' name='updatetime' placeholder='请输入修改时间' autocomplete='off' class='layui-input date' value="<%=updatetime%>" >
                    </div><!--updatetime-->
                </div>
                <div class='layui-form-item'>
                    <label class='layui-form-label'>状态</label>
                    <div class='layui-input-inline layui-input-wrap'>
                        <input type='text' name='status' placeholder='请输入状态' autocomplete='off' class='layui-input' value="<%=inputCL(status)%>" >
                    </div><!--status-->
                </div>


            </div>
            

            <!-- 提交按钮需要，外部调用 -->
            <div class="layui-form-item layui-hide">
              <input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
            </div>
 
        </div>
    </div>
  </div>
</form>
 
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../../js/pc.js?v20250716_1"></script>

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
    




    // 时间选择器 for createtime
    lay("input[name='createtime']").each(function() {
        laydate.render({
            elem: this,
            trigger: 'click',
            format: 'yyyy/MM/dd HH:mm:ss'

        });
    });
    // 时间选择器 for updatetime
    lay("input[name='updatetime']").each(function() {
        laydate.render({
            elem: this,
            trigger: 'click',
            format: 'yyyy-MM-dd HH:mm:ss'

        });
    });
 



    


})
// pasteImage("pic");



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
