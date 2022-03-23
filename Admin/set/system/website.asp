<!--#include file="../../../inc/Config.asp"-->
<!--#include file="../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<% 
call openconn() 
dim msg,id,logo,qrcode
id=request("id") 
if request("act")="save" then
    rs.open"select * from " & db_PREFIX & "WebSite where id="&id,conn,3,3
    if not rs.eof then
        rs("webTitle")=request("webTitle")
        rs("WebSiteUrl")=request("WebSiteUrl")
        rs("webKeywords")=request("webKeywords")
        rs("webDescription")=request("webDescription")
        rs("websitebottom")=request("websitebottom")
        rs("copyright")=request("copyright")
        rs("logo")=request("logo")
        rs("qrcode")=request("qrcode")
        rs.update        
        call addSystemLog("website","修改系统设置",userRs("username"))  '记录操作日志'
    end if:rs.close
end if
rs.open"select * from " & db_PREFIX & "WebSite",conn,3,1
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>网站设置</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all">
</head>

<body>
    <form id="form1" name="form1" class="layui-form" method="post" action="?act=save&id=<%=rs("id")%>">
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">网站设置</div>
                        <div class="layui-card-body" pad15>
                            <div class="layui-form" wid100 lay-filter="">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">网站名称</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="webTitle" value="<%=rs("webTitle")%>" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">网站域名</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="WebSiteUrl" lay-verify="url" value="<%=rs("WebSiteUrl")%>" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">Logo图</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="logo" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=rs("logo")%>">
                                    </div>
                                    <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">二维码图</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="qrcode" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=rs("qrcode")%>">
                                    </div>
                                    <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-qrcode">上传图片</button>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">META关键词</label>
                                    <div class="layui-input-block">
                                        <textarea name="webKeywords" class="layui-textarea" placeholder="多个关键词用英文状态 , 号分割"><%=rs("webKeywords")%></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">META描述</label>
                                    <div class="layui-input-block">
                                        <textarea name="webDescription" class="layui-textarea"><%=rs("webDescription")%></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">网页底部</label>
                                    <div class="layui-input-block">
                                        <textarea id="websitebottom" name="websitebottom" style="display: none;"><%=rs("websitebottom")%></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">版权信息</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="copyright" lay-verify="" class="layui-input" value="<%=rs("copyright")%>">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <input type="submit" class="layui-btn" value="确认保存" lay-submit="lay-submit" />
                                        <%=msg%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
            elem: '#layuiadmin-upload-qrcode',
            url: '/api/upload/',
            done: function(res) {
                $(this.item).prev("div").children("input").val(res.data.src)
            }
        });


        //编码器
        var layedit = layui.layedit;
        layedit.set({
            //暴露layupload参数设置接口 --详细查看layupload参数说明
            uploadImage: {
                url: '/api/upload/' //上传接口url
                    ,
                type: 'post' //默认post 
            }
        });
        layedit.build('websitebottom'); //建立编辑器


    });
    </script>
</body>

</html>