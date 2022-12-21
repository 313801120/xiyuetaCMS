<!--#include file="../../../inc/Config.asp"-->
<!--#include file="../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
 
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
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">网站设置</div>
                        <div class="layui-card-body" pad15>
                            <div class="layui-form" wid100 lay-filter="">
                                

                                <div class="layui-form-item">
                                    <label class="layui-form-label">上传视频</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="qrcode" placeholder="请上传视频" autocomplete="off" class="layui-input" value="">
                                    </div>
                                    <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-qrcode">上传图片</button>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
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
            elem: '#layuiadmin-upload-useradmin_biglogo',
            url: '/api/upload/',
            done: function(res) {
                $(this.item).prev("div").children("input").val(res.data.src)
            }
        });
        upload.render({
            elem: '#layuiadmin-upload-qrcode',
            url: '/api/upload/uploadVideo.asp',
            exts: 'xlsx|xls|mp4', //只允许上传excel文件
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
        layedit.build('webfoot'); //建立编辑器


    });
    </script>
</body>

</html>