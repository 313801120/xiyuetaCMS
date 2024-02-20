<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim msg,isTrue,addSql,id,parentid,title,isthrough,sortrank,smallimage,aboutcontent,bodycontent,author,webtitle,webkeywords,webdescription,bigimage,filename,tags,flags,titlecolor

id=request("id")
parentid=request("parentid")              '大类'
title=request("title")                    '标题'
sortrank=request("sortrank")              '排序' 
if sortrank="" then sortrank=0
isthrough=request("isthrough")            '审核'
smallimage=request("smallimage")          '缩略图' 
bigimage=request("bigimage")          '大图' 
aboutcontent=request("aboutcontent")                    '简要说明'
bodycontent=request("bodycontent")                    '文章内容
author=request("author")                    '作者
webtitle=request("webtitle")            'webtitle'
webkeywords=request("webkeywords")            'webkeywords'
webdescription=request("webdescription")            'webdescription'
filename=request("filename")            'filename'
tags=request("tags")            '标签'
tags=replace(replace(replace(phptrim(tags),chr(10),","),chr(13),","),vbtab,",")
if tags<>"" then tags=","& tags &","  '为搜索做准备'  调用了一个js标签框架
isthrough=IIF(isthrough="on",1,0)         '处理下'
if parentid="" then 
  parentid=-1
else
  parentid=int(parentid)
end if
flags="|"
flags=flags & IIF(Request("flags_h")="on","h|","") 
flags=flags & IIF(Request("flags_c")="on","c|","") 
flags=flags & IIF(Request("flags_f")="on","f|","") 
flags=flags & IIF(Request("flags_a")="on","a|","") 
flags=flags & IIF(Request("flags_s")="on","s|","") 
flags=flags & IIF(Request("flags_b")="on","b|","") 
titlecolor=request("titlecolor")            '标题颜色'

 

'添加修改
if request("act")="save" then
  isTrue=true
  if sortrank="" then    
    msg="排序不能为空"
    isTrue=false 
  end if
  if isTrue=true then
    addsql=" where (title='"& title &"' and parentid=" & parentid & ")"  '判断时加上栏目20231012'
    if id<>"" then
      addsql=addsql & " and id<>"&id
    end if
    rs.open"select * from ["& db_PREFIX &"articleDetail]"&addsql,conn,1,3
    if not rs.eof then
      msg="栏目名称已经存在"
    else
      if id="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"articleDetail] where id="&id,conn,1,3
      end if 
      rs("parentid")=parentid 
      rs("title")=title 
      rs("sortrank")=sortrank 
      rs("isthrough")=isthrough 
      rs("smallimage")=smallimage 
      rs("bigimage")=bigimage 
      rs("aboutcontent")=aboutcontent 
      rs("bodycontent")=bodycontent 
      rs("author")=author 
      rs("webtitle")=webtitle 
      rs("webkeywords")=webkeywords 
      rs("webdescription")=webdescription 
      rs("filename")=filename 
      rs("tags")=tags
      rs("flags")=flags
      rs("titlecolor")=titlecolor
      rs.update 
      response.Write"<script>parent.location.reload();</script>"
      response.end()
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"articleDetail] where id="&id,conn,1,1
  if not rs.eof then
    parentid=rs("parentid") 
    id=rs("id") 
    title=inputCL(rs("title") )  
    sortrank=inputCL(rs("sortrank") )  
    isthrough=inputCL(rs("isthrough"))  
    smallimage=inputCL(rs("smallimage"))   
    bigimage=inputCL(rs("bigimage"))  
    aboutcontent=inputCL(rs("aboutcontent"))  
    bodycontent=inputCL(rs("bodycontent"))  
    author=inputCL(rs("author"))  
    webtitle=inputCL(rs("webtitle"))  
    webkeywords=inputCL(rs("webkeywords"))  
    webdescription=inputCL(rs("webdescription"))  
    filename=inputCL(rs("filename"))  
    tags=inputCL(rs("tags"))  
    flags=inputCL(rs("flags"))  
    titlecolor=inputCL(rs("titlecolor"))  


    '因为isThrough 为 YesNo 对错类型的
    if isthrough="True" then 
      isthrough=1
    else
      isthrough=0
    end if

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
<%if msg<>"" then  call rw("<blockquote class=""layui-elem-quote"">"& msg &" &nbsp;<a href='javascript:window.history.go(-1); '>返回</a></blockquote>")%>

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
 

   <div class="layui-form-item">
      <label class="layui-form-label">选择分类</label>
      <div class="layui-input-inline">
        

<select name="parentid" id="parentid" selected><option value="-1">≡ 作为一级栏目 ≡</option>

      <%
      '第二个参数为空，因为在栏目分类里需要用到排除当前自身的选择
      call rw( columnSubInput(-1,"",parentid) )
      %>
    </select>

      </div> 
    </div>
        
    <div class="layui-form-item">
      <label class="layui-form-label">标题</label>
      <div class="layui-input-block">
        <input type="text" name="title" id="title" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="<%=title%>" style='<%=IIF(titlecolor<>"","color:" & titlecolor & ";","")%><%=IIF(instr(flags,"|b|")>0,"font-weight:bold;","")%>' >

<input name="titlecolor" type="hidden" id="titlecolor" value="<%=titlecolor%>" />
<script language="javascript" type="text/javascript" src="../../js/colorpicker.js?v1"></script>
<img src="../../Images/colour.png" width="15" height="16" onClick="colorpicker('title_colorpanel','set_title_color');" style="cursor:hand">
<span id="title_colorpanel" style="position:absolute; z-index:200" class="colorpanel"></span>
<img src="../../Images/bold.png" width="10" height="10" onClick="input_font_bold()" id="titleb" style="cursor:hand">  


      </div>
    </div>    

    <div class="layui-form-item">
      <label class="layui-form-label">缩略图</label>
      <div class="layui-input-inline">
        <input type="text" name="smallimage" id="smallimage" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=smallimage%>" onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button>  

<%if isAdminArticleOnPaiZhan then%>
  <button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
  onclick="picDomId='smallimage';layuiOpenIndex=showwin('拍照', 'photograph/');">拍照</button>

  <button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
  onclick="picDomId='smallimage';layuiOpenIndex=showwin('签名', 'tuya/');">签名</button>
<%end if%>


    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">大图</label>
      <div class="layui-input-inline">
        <input type="text" name="bigimage" id="bigimage" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=bigimage%>" onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin2">上传图片</button> 


<%if isAdminArticleOnPaiZhan then%>
  <button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
  onclick="picDomId='bigimage';layuiOpenIndex=showwin('拍照', 'photograph/');">拍照</button>

  <button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
  onclick="picDomId='bigimage';layuiOpenIndex=showwin('签名', 'tuya/');">签名</button>
  <%end if%>

    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">排序</label> 
      <div class="layui-input-inline">
        <input type="text" name="sortrank" lay-verify="number" placeholder="请输入排序" autocomplete="off" class="layui-input" value="<%=sortrank%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">作者</label>
      <div class="layui-input-inline">
        <input type="text" name="author"   placeholder="请输入作者" autocomplete="off" class="layui-input" value="<%=author%>">
      </div>
    </div>
    

    <div class="layui-form-item">
      <label class="layui-form-label">简要说明</label>
      <div class="layui-input-block">
        <textarea name="aboutcontent" placeholder="请输入简要说明" class="layui-textarea"><%=aboutcontent%></textarea>
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">文章内容</label>
      <div class="layui-input-block">
        <textarea name="bodycontent" <%=IIF(request("editor")<>"no"," id='bodycontent'style='display:none;'"," rows='20'")%> placeholder="请输入文章内容" class="layui-textarea"><%=bodycontent%></textarea><%if request("editor")<>"no" then%><a href="?editor=no&id=<%=id%>">不显示编辑器</a><%end if%>
      </div>
    </div>  

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">title标题</label>
                <div class="layui-input-block">
                    <textarea name="webtitle" class="layui-textarea" placeholder="title标题"><%=webtitle%></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">META关键词</label>
                <div class="layui-input-block">
                    <textarea name="webkeywords" class="layui-textarea" placeholder="多个关键词用英文状态 , 号分割"><%=webkeywords%></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">META描述</label>
                <div class="layui-input-block">
                    <textarea name="webdescription" class="layui-textarea"><%=webdescription%></textarea>
                </div>
            </div>



    <div class="layui-form-item">
      <label class="layui-form-label">自定义文件</label>
      <div class="layui-input-inline">
        <input type="text" name="filename"   placeholder="请输入自定义文件" autocomplete="off" class="layui-input" value="<%=filename%>">
      </div>
    </div>    

<!--     <div class="layui-form-item">
      <label class="layui-form-label">标签</label>
      <div class="layui-input-block">
        <input type="text" autocomplete="off" class="form-control" data-role="tagsinput" id="tags" value="<%=tags%>" name="tags"  > 
      </div>
    </div>  -->


    <div class="layui-form-item">
      <label class="layui-form-label">标签</label>
      <div class="layui-input-block">
        <input type="text" name="tags" data-role="tagsinput"  autocomplete="off" class="layui-input" id="tags" value="<%=tags%>">
      </div>
    </div>  

    <div class="layui-form-item">
      <label class="layui-form-label">审核状态</label>
      <div class="layui-input-inline">
        <input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,""," checked")%>>
      </div>
    </div>   

    <div class="layui-form-item">
      <label class="layui-form-label">自定义属性</label>
      <div class="layui-input-block">

       

<div class="layui-form">
  <input type="checkbox" name="flags_h" title="头条[h]"<%=IIF(instr(flags,"|h|")>0," checked","")%>>
  <input type="checkbox" name="flags_c" title="推荐[c]"<%=IIF(instr(flags,"|c|")>0," checked","")%>>
  <input type="checkbox" name="flags_f" title="幻灯[f]"<%=IIF(instr(flags,"|f|")>0," checked","")%>> 
  <input type="checkbox" name="flags_a" title="特荐[a]"<%=IIF(instr(flags,"|a|")>0," checked","")%>> 
  <input type="checkbox" name="flags_s" title="滚动[s]"<%=IIF(instr(flags,"|s|")>0," checked","")%>> 
  <input type="checkbox" name="flags_b" title="加粗[b]"<%=IIF(instr(flags,"|b|")>0," checked","")%> lay-filter="checkboxTest"> 
</div>

      </div>
    </div>   
 
 

    <div class="layui-form-item layui-hide">
      <input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
    </div>
  </div> 
</form>
 
<script src="../../layuiadmin/layui/layui.js"></script>  
<script src="../../js/jquery.js"></script>  
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
    // //编码器
    // var layedit = layui.layedit;
    // layedit.set({
    //     //暴露layupload参数设置接口 --详细查看layupload参数说明
    //     uploadImage: {
    //         url: '/api/upload/'    //上传接口url
    //         ,type: 'post' //默认post 
    //     }
    // });
    // layedit.build('bodycontent');   //建立编辑器





        upload.render({
            elem: '#layuiadmin-upload-shareico',
            url: '/api/upload/',
            done: function(res) {
                $(this.item).prev("div").children("input").val(res.data[0].src)
            }
        }); 
        

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


    //加粗    
    form.on('checkbox(checkboxTest)', function(data){
      input_font_bold();
      // $("span:contains('特荐[a]')").parent().addClass('layui-form-checked');//选中




    }); 

    $("#titleb").click(function(){
      
      var s=$("input[name='title']").css("font-weight")+"";
      if(s=="700"){//700为加粗
        $("input[name='flags_b']").prop("checked",false);
      }else{

        $("input[name='flags_b']").prop("checked",true);
      }
      form.render('checkbox');


    })




})


</script>
    
<!-- <link rel="stylesheet" href="../../set/system/bootstrap.min.css" media="all">  -->
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
<script src="../../js/jquery.js"></script>
<link rel='stylesheet' href='../../set/system/tagsinput.css'>
<style type="text/css">
  .bootstrap-tagsinput{width:97%;}
</style>
<script type='text/javascript' src='../../set/system/tagsinput.min.js'></script>

<script>
var layuiOpenIndex;
var picDomId='smallimage';//默认为小图
function getPaiZhaoImg(src){ 
  $("input[name='"+picDomId+"']").val(src)
  layer.close(layuiOpenIndex);
}











 var imgInputObj;//图片的input对象
    //获得粘贴板内容
    document.getElementById("smallimage").addEventListener('paste', function (event) {  
      imgInputObj=$(this);
      uploadclipboardDataImage(event);
    })
    document.getElementById("bigimage").addEventListener('paste', function (event) {  
      imgInputObj=$(this);
      uploadclipboardDataImage(event);
    })

    // let pHtml = event.clipboardData.getData('text/html');  为获取网页内容部分20230306

    //上传粘贴板里的图片
    function uploadclipboardDataImage(event){
        console.log("粘贴内容22") 
        if (!event || !event.clipboardData) return;
        let pText = event.clipboardData.getData('text/plain');
        if (pText) {//有文本内容的时候才是true   注意：空字符串''是false
            // showCVText(pText);
        } else if (event.clipboardData.items) {//没有文本内容，判断这个数组，文件可能在这个数组里
            let blob = null, items = event.clipboardData.items;
            for (let i = 0; i < items.length; i++) {
                if (items[i].kind === 'file') {//类型 是 文件
                    blob = items[i].getAsFile();
                    if (items[i].type.indexOf("image") !== -1) {//文件类型是图像
                        showImage(blob);
                    } else if (items[i].type.indexOf("text") !== -1) {//文件类型是文本
                        // showText(blob);
                    }
                } 
            }
        } else {
            alert("粘了个寂寞");
        }
    }

    function showImage(blob) {
        getContext(blob).then(res => { //图片数据能直接被img识别
            // document.getElementById("previewImage").src = res; 
            jQuery.ajax({
                url: '/api/upfileClipboardImg.asp?act=submit',//要加个type以判断是否为客服
                type: 'POST',
                dataType: "json",
                data: {
                    'content': res
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    console.log(XMLHttpRequest)
                    console.log(textStatus)
                    console.log(errorThrown)
                },
                success: function(data) { 
                    // var data=jQuery.parseJSON(result); 
                    // alert("aa")
                    switch (data.status) {
                        case "y": 
                            // alert(data.info)
                            imgInputObj.val("/"+data.img)
                            break;
                        case "n": 
                            break;
                    }
                }
            });


        })
    }

 
    /**
     * 把字节转为web识别的base64格式数据
     * @param blob
     * @returns {Promise<unknown>}
     */
    function getContext(blob) {
        return new Promise((resolve) => {
            if (blob == null) resolve();
            let reader = new FileReader();
            reader.onload = function (event) {
                console.log(event)
                resolve(event.target.result);
            }
            reader.readAsDataURL(blob);
        });
    }

</script>
<script type="text/javascript" src="../../js/pc.js"></script> 
</body>
</html>
