<!--#include file="../../../inc/Config.asp"-->
<!--#include file="../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<%  
call checkAdminPermission("设置IP限制")

dim content,msg,filePath
filePath="../../Admin_Login_Allow_IP.dat"
content=request("content")
if request("act")="save" then
    call writeToFile(filePath,content,"")
    msg="保存 允许登录IP 成功"

else
    content=readfile(filePath,"")
end if
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>允许登录IP</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all">
</head>

<body>
    <form id="form1" name="form1" class="layui-form" method="post" action="?act=save">
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">允许登录IP</div>
                        <div class="layui-card-body" pad15>
                            <div class="layui-form" wid100 lay-filter=""> 

                                <div class="layui-form-item">
                                    <label class="layui-form-label">当前IP</label>
                                    <div class="layui-input-block" style="line-height:38px;">  
                                        <%=getIP()%>
                                    </div>
                                </div>

                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">IP列表</label>
                                    <div class="layui-input-block">
                                        <textarea name="content" class="layui-textarea" rows="12"><%=content%></textarea> 
                                        
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
                $(this.item).prev("div").children("input").val(res.data[0].src)
            }
        });
        upload.render({
            elem: '#layuiadmin-upload-qrcode',
            url: '/api/upload/',
            done: function(res) {
                $(this.item).prev("div").children("input").val(res.data[0].src)
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
        layedit.build('webfoot'); //建立编辑器


    });
    </script>
</body>

</html>