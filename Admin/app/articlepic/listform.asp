<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
'#禁止自动更新当前文件'  #号去掉代表此文件不被程序自动更新替换掉
call openconn()  
dim msg,isTrue,addSql,id,articleid,title,pic,sortrank,isthrough

id=getStrToNumber(request("id"))
articleid=getStrToNumber(request("articleid"))
if articleid="" then articleid=null
title=request("title")
pic=request("pic")
sortrank=getStrToNumber(request("sortrank"))
if sortrank="" then sortrank=null
isthrough=request("isthrough")
if isthrough="" then isthrough=null
isthrough=IIF(isthrough="on",1,0) 


'添加修改
if request("act")="save" then
  isTrue=true
  if isTrue=true then
    addsql=" WHERE title=''"
    if id<>"" then
      addsql=addsql & " AND id<>"&id
    end if
    addsql=" WHERE id=-1"
    rs.open"select * from ["& db_PREFIX &"articlepic]"&addsql,conn,1,3
    if not rs.eof then
      msg="已经存在"
    else
      if id="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"articlepic] where id="&id,conn,1,3
      end if 
      rs("articleid")=articleid
      rs("title")=title
      rs("pic")=pic
      rs("sortrank")=sortrank
      rs("isthrough")=isthrough
      rs("ip")=getIP()

      rs.update 
      call die("<script>parent.location.reload();</script>")
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"articlepic] where id="&id,conn,1,1
  if not rs.eof then
    id=rs("id")
    articleid=rs("articleid")
    title=rs("title")
    pic=rs("pic")
    sortrank=rs("sortrank")
    isthrough=rs("isthrough")

  end if

'默认'
else
    isthrough=1

end if
 

%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加修改</title> 
 <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
 <style>
i.icon-wenhao {border: 1px #ff5722 solid; color: #ff5722; font-size: 10px; margin-left: 3px; border-radius: 10px;}
/*右边离一点距离20230425*/
.layui-input-block {
    margin-right: 4px;
}
</style>
      
</head>
<body style="overflow-x: hidden;"> 

<%if msg<>"" then  call rw("<blockquote class=""layui-elem-quote"">"& msg &" &nbsp;<a href='javascript:window.history.go(-1); '>返回</a></blockquote>")%>

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">


   
       <div class='layui-form-item'>
      <label class='layui-form-label'>文章ID</label>
      <div class='layui-input-inline'>
        <input type='number' name='articleid' placeholder='请输入文章ID' autocomplete='off' class='layui-input' value="<%=articleid%>"  lay-verify='required'>
      </div><!--articleid-->
    </div>
    <div class='layui-form-item'>
      <label class='layui-form-label'>标题</label>
      <div class='layui-input-block'>
        <input type='text' name='title' placeholder='请输入标题' autocomplete='off' class='layui-input' value="<%=title%>"  lay-verify='required'>
      </div><!--title-->
    </div>
    <div class='layui-form-item'>
      <label class='layui-form-label'>图片</label>
      <div class='layui-input-inline'>
        <input type='text' name='pic' placeholder='请输入图片' autocomplete='off' class='layui-input' value="<%=pic%>"  lay-verify='required' onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
      </div><!--pic-->
<button style='float: left;' type='button' class='layui-btn' id='layuiadmin-upload-useradmin'>上传图片</button>     </div>

             <div class="layui-row layui-col-space10 layui-form-item">
                <div class="layui-col-xs6">
                      <div class='layui-form-item'>
      <label class='layui-form-label'>排序</label>
      <div class='layui-input-inline'>
        <input type='number' name='sortrank' placeholder='请输入排序' autocomplete='off' class='layui-input' value="<%=sortrank%>"  lay-verify='required'>
      </div><!--sortrank-->
    </div>

                </div>
                <div class="layui-col-xs6">
                      <div class='layui-form-item'>
      <label class='layui-form-label'>审核</label>
      <div class='layui-input-inline'>
    <input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isthrough=0,""," checked")%>>
      </div><!--isthrough-->
    </div>

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

    //？提醒   借鉴于别人20230309
    $(".icon-wenhao").hover(function(){
      var thetxt = $(this).attr("data-txt");
      var tips = layer.tips(thetxt, this , {
        tips: [1, '#000'] //还可配置颜色
        ,time: 50000
      });
    },function(){
      layer.closeAll('tips');
    })

    upload.render({
        elem: '#layuiadmin-upload-useradmin',
        url: '/api/upload/',
        exts: 'jpg|jpeg|png|bmp|gif', //只允许上传jpg文件 1
        done: function(res) {
            $(this.item).prev("div").children("input").val(res.data[0].src)
        }
    });

    upload.render({
        elem: '#layuiadmin-upload-useradmin2',
        url: '/api/upload/',
        exts: 'jpg|jpeg|png|bmp|gif', //只允许上传jpg文件 2
        done: function(res) { 
            $(this.item).prev("div").children("input").val(res.data[0].src)
        }
    });

    upload.render({
        elem: '#layuiadmin-upload-useradmin3',
        url: '/api/upload/',
        exts: 'jpg|jpeg|png|bmp|gif', //只允许上传jpg文件 2
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
    //编码器 简单版
    // var layedit = layui.layedit;
    // layedit.set({
    //     //暴露layupload参数设置接口 --详细查看layupload参数说明
    //     uploadImage: { 
    //         url: '/api/upload/'    //上传接口url
    //         ,type: 'post' //默认post 
    //     }
    // });
    // layedit.build('bodycontent');   //建立编辑器


    //编码器 复杂版
    var layedit = layui.layedit;
    layedit.set({
        //暴露layupload参数设置接口 --详细查看layupload参数说明
        uploadImage: { 
            url: '/api/upload/?act=one'    //上传接口url
            ,type: 'post' //默认post 
        }
        ,uploadVideo: {
                    url: '/api/upload/uploadVideo.asp?act=one',
                    accept: 'video',
                    acceptMime: 'video/*',
                    exts: 'mp4|flv|avi|rm|rmvb',
                    size: '20480'
                }

        , tool: [
                    'colorpicker', 'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'face'
                    , '|', 'left', 'center', 'right', '|', 'link', 'unlink','images', 'image_alt', 'video', 'anchors'
                    , '|','table', 'fullScreen'
                ]
    });
    layedit.build('bodycontent');   //建立编辑器





//script底部js块


})




</script>

<script src="../../js/jquery.js"></script>
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
<script type="text/javascript" src="../../js/form.js?va"></script>    

</body>
</html>
