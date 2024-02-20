<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.Asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim msg,isTrue,addSql,id,userid,isthrough,bodycontent,price,daytime,localdir,smallimage,pic2,pic3,inadminid

id=request("id")
userid=request("userid")                    'userid' 
inadminid=request("inadminid")                    '添加到那个管理员账号' 
price=request("price")                    'price' 
bodycontent=request("bodycontent")                    '内容' 
isthrough=request("isthrough")            '审核'  
isthrough=IIF(isthrough="on",1,0)         '处理下'
if price="" then price=0
daytime=request("daytime")                    'daytime' 
localdir=request("localdir")                    '本地目录'  
smallimage=request("smallimage")                    '图片' 
pic2=request("pic2")                    '图片2' 
pic3=request("pic3")                    '图片3' 


'添加修改
if request("act")="save" then
  isTrue=true 
  if isTrue=true then
    if id<>"" then
      addsql=" where id="&id
    end if
    rs.open"select * from ["& db_PREFIX &"money] " & addsql,conn,1,3
    if id="" then rs.addnew    
    if userid<>"" then rs("userid")=userid   
    if inadminid<>"" then rs("inadminid")=inadminid   
    rs("price")=price  
    rs("bodycontent")=bodycontent  
    rs("localdir")=localdir  
    rs("isthrough")=isthrough   
    rs("smallimage")=smallimage  
    rs("pic2")=pic2  
    rs("pic3")=pic3  
    if daytime<>"" then rs("daytime")=daytime
    rs.update:rs.close
    response.Write"<script>parent.location.reload();</script>"
    response.end()
    
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"money] where id="&id,conn,1,1
  if not rs.eof then
    id=rs("id") 
    userid=rs("userid")    
    inadminid=rs("inadminid")    
    price=rs("price")    
    bodycontent=rs("bodycontent")    
    isthrough=rs("isthrough")  
    daytime=format_Time(rs("daytime"),20)
    localdir=rs("localdir")   
    smallimage=rs("smallimage")  
    pic2=rs("pic2")  
    pic3=rs("pic3")  
  end if:rs.close
else
  if inadminid="" then  inadminid=userrs("id")  '为空则为自己'
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

<%if msg<>"" then  call rw("<blockquote class=""layui-elem-quote"">"& msg &" &nbsp;<a href='javascript:window.history.go(-1); '>返回</a></blockquote>")%>




 

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">


<%if 1=2 then%>
    <div class="layui-form-item">
      <label class="layui-form-label">会员ID</label>
      <div class="layui-input-inline">
        <input type="text" name="userid" lay-verify="required" placeholder="请输入会员ID" autocomplete="off" class="layui-input" value="<%=userid%>">
      </div>
    </div>
<%else%>
    <div class="layui-form-item">
      <label class="layui-form-label">会员ID</label>
      <div class="layui-input-inline">
        <select name="userid" id="userid">
          <%rs.open"select * from ["& db_PREFIX &"member] order by id asc ",conn,1,1
          while not rs.eof
          %>
            <option value='<%=rs("id")%>'<%=IIF(cstr(userid)=cstr(rs("id"))," selected","")%>><%=rs("username") & "("& rs("nickname") &")"%></option>
          <%rs.movenext:wend:rs.close%>
        </select> 
      </div>
    </div>  
<%end if%>

    <div class="layui-form-item">
      <label class="layui-form-label">用户</label>
      <div class="layui-input-inline">
        <select name="inadminid" id="inadminid">          
            <option value='-1'>选择用户</option>       
            <%
            rs.open"select * from ["& db_PREFIX &"admin] order by id asc",conn,1,1
            while not rs.eof
            %>
            <option value='<%=rs("id")%>'<%=IIF(cstr(inadminid)=cstr(rs("id"))," selected","")%>><%=rs("username") & "("& rs("nickname") &")"%></option>  
          <%rs.movenext:wend:rs.close%>
        </select> 
      </div>
    </div>  



    <div class="layui-form-item">
      <label class="layui-form-label">金钱</label>
      <div class="layui-input-inline">
        <input type="text" name="price" lay-verify="required" placeholder="请输入金钱" autocomplete="off" class="layui-input" value="<%=price%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">付款时间</label>
      <div class="layui-input-inline">
         <input type='text' name='daytime' placeholder='请输入付款时间' autocomplete='off' class='layui-input mydate' value="<%=daytime%>">
      </div>
    </div>
      
    <div class="layui-form-item">
      <label class="layui-form-label">本地目录</label>
      <div class="layui-input-inline">
        <input type="text" name="localdir" placeholder="请输入本地目录" autocomplete="off" class="layui-input" value="<%=localdir%>">
      </div>
    </div>


    <!-- 上传图片必需要在编辑器的前面，要不然放上去图片显示的位置不对 20230827 -->
    <div class="layui-form-item">
      <label class="layui-form-label">图片1</label>
      <div class="layui-input-inline">
        <input type="text" name="smallimage" id="smallimage" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=smallimage%>"  onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
  <button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
  onclick="layuiOpenIndex=showwin('拍照', 'photograph/');">拍照</button>

  <button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
  onclick="layuiOpenIndex=showwin('签名', 'tuya/');">签名</button>
    </div>


    <div class="layui-form-item">
      <label class="layui-form-label">图片2</label>
      <div class="layui-input-inline">
        <input type="text" name="pic2" id="pic2" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic2%>"  onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-pic2">上传图片</button> 
  <button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
  onclick="picDomId='pic2';layuiOpenIndex=showwin('拍照', 'photograph/');">拍照</button>

  <button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
  onclick="picDomId='pic2';layuiOpenIndex=showwin('签名', 'tuya/');">签名</button>
    </div>



    <div class="layui-form-item">
      <label class="layui-form-label">图片3</label>
      <div class="layui-input-inline">
        <input type="text" name="pic3" id="pic3" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic3%>"  onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-pic3">上传图片</button> 
  <button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
  onclick="picDomId='pic3';layuiOpenIndex=showwin('拍照', 'photograph/');">拍照</button>

  <button  style="float: left;margin-left:10px" type="button" class="layui-btn" 
  onclick="picDomId='pic3';layuiOpenIndex=showwin('签名', 'tuya/');">签名</button>
    </div>




    <div class="layui-form-item">
      <label class="layui-form-label">内容</label>
      <div class="layui-input-block">
        <textarea name="bodycontent" <%=IIF(request("editor")<>"no"," id='bodycontent'"," rows='10'")%>  placeholder="请输入简要说明" class="layui-textarea"><%=bodycontent%></textarea>
      </div>
    </div>



    <div class="layui-form-item">
      <label class="layui-form-label">审核状态</label>
      <div class="layui-input-inline">
        <input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,""," checked")%>>
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
        elem: '#layuiadmin-upload-useradmin,#layuiadmin-upload-pic2,#layuiadmin-upload-pic3',
        url: '/api/upload/',
        done: function(res) {
            $(this.item).prev("div").children("input").val(res.data[0].src)
        }
    });

    lay('.mydate').each(function() {
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
    layedit.build('bodycontent');   //建立编辑器

})

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
    document.getElementById("pic2").addEventListener('paste', function (event) {  
      imgInputObj=$(this);
      uploadclipboardDataImage(event);
    })
    document.getElementById("pic3").addEventListener('paste', function (event) {  
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
