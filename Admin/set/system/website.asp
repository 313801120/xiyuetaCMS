<!--#include file="../../../inc/Config.asp"-->
<!--#include file="../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<%
'添加图片移上预览功能，关键词按回车添加 20220807'
call openconn() 
dim msg,id,logo,qrcode,asporhtml
id=request("id") 
asporhtml=request("asporhtml")
if request("act")="save" then
    rs.open"select * from " & db_PREFIX & "WebSite where id="&id,conn,3,3
    if not rs.eof then
        rs("webtitle")=request("webtitle")
        rs("Weburl")=request("Weburl")
        rs("webkeywords")=request("webkeywords")
        rs("webdescription")=request("webdescription")
        rs("webfoot")=request("webfoot")
        rs("copyright")=request("copyright")
        rs("logo")=request("logo")
        rs("biglogo")=request("biglogo")
        rs("qrcode")=request("qrcode")
        rs("phone")=request("phone")
        rs("tel")=request("tel")
        rs("fax")=request("fax")
        rs("email")=request("email")
        rs("weixin")=request("weixin")
        rs("qq")=request("qq")
        rs("address")=request("address")
        rs("company")=request("company")
        rs("companyen")=request("companyen") 
        rs("asporhtml")=IIF(asporhtml="on",1,0)         '处理下动态静态转换'
        ' call echo("asporhtml",IIF(asporhtml="on",1,0) )
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
    <!-- <link rel="stylesheet" href="bootstrap.min.css" media="all"> -->
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all">
<script src="../../js/jquery.js"></script>
<!-- <script src="bootstrap.min.js"></script> -->
    <style>
.label {
    display: inline;
    padding: 0.2em 0.6em 0.3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: 0.25em;
}
.label-info {
    background-color: #5bc0de;
}
    </style>

<script>

function showBigPic(filepath) {
    var html = "<div id='bigPic' style='position:absolute;display:none; z-index:99999'><img style=\"max-width:300px\" src='' id='pre_view'/><br /></div>";

    $("#form1").append(html);
    //将文件路径传给img大图
    document.getElementById('pre_view').src = filepath;
    //获取大图div是否存在
    
    
    var div = document.getElementById("bigPic");
    if (!div) {
        return;
    }
    //如果存在则展示
    document.getElementById("bigPic").style.display="block";
    //获取鼠标坐标
    var intX = window.event.clientX;
    var intY = window.event.clientY;
    //设置大图左上角起点位置
    div.style.left = intX +5+ "px";
    div.style.top = intY + 5+"px";
}

//隐藏
function closeimg(){
    document.getElementById("bigPic").style.display="none";
}

</script>
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
                                        <input type="text" name="webtitle" value="<%=rs("webtitle")%>" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">网站域名</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="Weburl" lay-verify="url" value="<%=rs("Weburl")%>" class="layui-input">
                                    </div>
                                </div>


<div class="layui-row layui-col-space10 layui-form-item">
    <div class="layui-col-xs6">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">Logo(小)</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="logo" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=rs("logo")%>" onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
                                    </div>
                                    <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button>
                                </div>
    </div>
    <div class="layui-col-xs6">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">Logo(大)</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="biglogo" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=rs("biglogo")%>" onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
                                    </div>
                                    <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin_biglogo">上传图片</button>
                                </div>
    </div>
</div>






                                <div class="layui-form-item">
                                    <label class="layui-form-label">二维码图</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="qrcode" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=rs("qrcode")%>" onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
                                    </div>
                                    <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-qrcode">上传图片</button>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">META关键词</label>
                                    <div class="layui-input-block">
                                        <!-- <textarea name="webkeywords" class="layui-textarea" data-role="tagsinput" placeholder="多个关键词用英文状态 , 号分割"><%=rs("webkeywords")%></textarea> -->
                                        <input type="text" autocomplete="off" class="form-control" data-role="tagsinput" id="keyword" value="<%=rs("webkeywords")%>" name="webkeywords"  > 
                                    </div>

 

                                </div>



                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">META描述</label>
                                    <div class="layui-input-block">
                                        <textarea name="webdescription" class="layui-textarea"><%=rs("webdescription")%></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">网页底部</label>
                                    <div class="layui-input-block">
                                        <textarea <%=IIF(request("editor")<>"no"," id='webfoot' style='display:none;'"," rows='10'")%>  name="webfoot" class="layui-textarea"><%=rs("webfoot")%></textarea> 
                                        <%if request("editor")<>"no" then%><a href='?editor=no'>不显示编辑器</a><%end if%>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">手机</label>
                                    <div class="layui-input-inline">
                                      <input type="text" name="phone" value="<%=rs("phone")%>" autocomplete="off" class="layui-input"><!--lay-verify="phone"-->
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">电话</label>
                                    <div class="layui-input-inline">
                                      <input type="text" name="tel" value="<%=rs("tel")%>" autocomplete="off" class="layui-input"><!--lay-verify="phone"-->
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">传真</label>
                                    <div class="layui-input-inline">
                                      <input type="text" name="fax" value="<%=rs("fax")%>" autocomplete="off" class="layui-input"><!--lay-verify="phone"-->
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">邮箱</label>
                                    <div class="layui-input-inline">
                                      <input type="text" name="email" value="<%=rs("email")%>" autocomplete="off" class="layui-input"><!-- lay-verify="email"-->
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">微信</label>
                                    <div class="layui-input-inline">
                                      <input type="text" name="weixin" value="<%=rs("weixin")%>" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">QQ</label>
                                    <div class="layui-input-inline">
                                      <input type="text" name="qq" value="<%=rs("qq")%>" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">公司地址</label>
                                    <div class="layui-input-block">
                                      <input type="text" name="address" value="<%=rs("address")%>" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">公司名称</label>
                                    <div class="layui-input-block">
                                      <input type="text" name="company" value="<%=rs("company")%>" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">公司英文名称</label>
                                    <div class="layui-input-block">
                                      <input type="text" name="companyen" value="<%=rs("companyen")%>" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">版权信息</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="copyright" lay-verify="" class="layui-input" value="<%=rs("copyright")%>">
                                    </div>
                                </div>
    <div class="layui-form-item">
      <label class="layui-form-label">网站动静转换</label>
      <div class="layui-input-inline">
        <input type="checkbox" lay-filter="switch" name="asporhtml" lay-skin="switch" lay-text="静态(.html)|动态(.asp)" <%=IIF(rs("asporhtml")=0,""," checked")%>>
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
            elem: '#layuiadmin-upload-useradmin_biglogo',
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
<link rel='stylesheet' href='tagsinput.css'>
<style type="text/css">
  .bootstrap-tagsinput{width:97%;}
</style>
<script type='text/javascript' src='tagsinput.min.js'></script>
</body>

</html> 