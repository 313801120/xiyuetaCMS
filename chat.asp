<!--#Include virtual = "/common.Asp"-->
<!--#include file="member_safe.asp"--><%
dim content,isMobile,startId,endId,isDebug,nPageSize
isDebug=false       '调试是否开启'
endId=0  '最后ID'
startId=99999'开始位置的ID，开始历史记录用的
nPageSize=20  '页显示条数'


'用户第一次登录时，客服自动给个提示'
if session("onloadchat")<>"ok" then
    content=replace(replace("亲，您好，这里是在线客服，请问您需要咨询什么问题呢~","<","&lt;"),">","&gt;")

    '亲， 有什么可以帮助您的呢~
    
    rs.open "select * from " & db_PREFIX & "chat" ,conn,1,3
    rs.addnew
    rs("bodycontent")=content
    rs("userid")=0
    rs("touserid")=session("memberid")
    rs.update:rs.close

    session("onloadchat")="ok"
    
    userRs("chatendtime")=now()
    userRs.update
end if
' call echo("onloadchat",session("onloadchat"))
 
dim sType,touserid,nickname
sType=request("type")
webTitle="联系客服"
nickname="客服"
touserid=request("touserid")
if sType="hf" then
    webTitle="聊天"
    userRs.close
    userRs.open "select * from " & db_PREFIX & "member Where id=0" ,conn,1,3
    ' call echo("id",userrs("id"))
end if
if touserid<>"" then
    rs.open"select * from ["& db_PREFIX &"member] where id="&touserid,conn,1,1
    if not rs.eof then
        nickname=rs("nickname")'& "(id:"& rs("id") & ")"
    end if:rs.close
end if
 
'撤回20220729'
if request("act")="revoke" then
    rs.open "select * from " & db_PREFIX & "chat where userid="& userRs("id") &" and id="&id,conn,1,3
    if not rs.eof then
        rs("isdel")=1
        rs.update
        call die("撤消信息完成")
    end if:rs.close
    call die("error")


elseif request("act")="new" then
    '去除删除的'
    rss.open "select * from " & db_PREFIX & "chat where (userid="& userRs("id") &" and touserid="& touserid &") or (userid="& touserid &" and touserid="& userRs("id") &") and isdel<>1 order by id desc" ,conn,1,1
    if not rss.eof then
        if cstr(rss("id"))<>cstr(id) then 
            call rw("update&Array&" & rss("id") & "&Array&")
            if isDebug then call echo("id",rss("id"))
            call getChatList(nPageSize,touserid,rss("id"),"down")
            call die("")
        end if
        call die(rss("id"))
    end if:rss.close
    call die("ddd")

elseif request("act")="getupchat" then
        call rw("update&Array&")
        if isDebug then call echo("id",rss("id"))
        call getChatList(nPageSize,touserid,id,"up")
        call die("&Array&" & startId)
    
'发送'
elseif request("act")="send" then
    content=replace(replace(request("content"),"<","&lt;"),">","&gt;")
    rs.open "select * from " & db_PREFIX & "chat" ,conn,1,3
    rs.addnew
    rs("bodycontent")=content
    rs("userid")=userRs("id")
    rs("touserid")=touserid
    rs.update:rs.close

    userRs("chatendtime")=now()
    userRs.update


    call die("OK")
'发送图片'
elseif request("act")="send2" then
    content=request("content")
    rs.open "select * from " & db_PREFIX & "chat" ,conn,1,3
    rs.addnew
    rs("bodycontent")=content
    rs("userid")=userRs("id")
    rs("touserid")=touserid
    rs.update:rs.close
    
    userRs("chatendtime")=now()
    userRs.update
    call die("OK")
end if
isMobile=false
if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
    isMobile=true
end if
%><html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        html, body, div, span, ul, ol, li, p, label {
    margin: 0px;
    padding: 0px;
} 
html, body {
    width: 100%;
    height: 100%;
    overflow: hidden;
    font-size: 13px;
    font-family: "Helvetica Neue", Helvetica, Arial, "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
}
.hRSBCQ {
    width: 100%;
    height: 100%;
    position: relative;
}

.eapgeZ {
    width: 100%;
    height: 100%;
    display: flex;
    box-sizing: border-box;
    flex-direction: column;
    overflow: hidden;
    position: relative;
    background: rgb(252, 252, 252);
}.gFEAYH {
    width: 100%;
}.evpQpB {
    position: relative;
    background: rgb(252, 252, 252);
    flex: 1 1 auto;
    height: 100px;
    display: flex;
}.fJhyOQ {
    flex: 1 1 auto;
    width: 100px;
    height: 100%;
}.dIrprp {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    position: relative;
}.lnrcNw {
    background: rgb(252, 252, 252);
    flex: 1 1 auto;
    height: 100px;
    position: relative;
    display: flex;
    flex-direction: column;
}.gregEU {
    width: 100%;
    height: 100%;
    padding: 40px 14px 14px;
    box-sizing: border-box;
    overflow-y: auto;
    position: relative;
}.ePqcYq {
    position: absolute;
    top: 10px;
    left: 0px;
    right: 0px;
    width: 100%;
    height: 20px;
    line-height: 20px;
    text-align: center;
    font-size: 12px;
    color: rgb(119, 119, 119);
    cursor: pointer;
}.hBHzRk {
    width: 100%;
    position: relative;
}.ivRHdf {
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
}.dREyAr {
    float: left;
    text-align: left;
    max-width: calc(100% - 50px);
}.hJoKLV {
    color: rgb(178, 178, 178);
    font-size: 12px;
    margin-bottom: 2px;
}.fsOkAd {
    max-width: 100%;
    position: relative;
    background-color: rgb(255, 255, 255);
    border-radius: 3px;
    border: 1px solid rgb(240, 240, 240);
    float: left;
}.hryzJB {
    padding: 10px 15px;
    border-radius: 3px;
    font-size: 13px;
    word-break: break-word;
}.fOaeDu {
    color: rgb(29, 39, 84);
    white-space: normal;
    text-align: left;
} 
.jIxeoH .avatar {
    height: 40px;
    width: 40px;
    display: block;
    border-radius: 50%;
}.kQtTCX {
    width: 100%;
    padding: 10px 12px;
    display: flex;
    min-height: 60px;
    font-size: 14px;
    box-sizing: border-box;
    color: white;
    background: rgb(0, 122, 255);
}.ccHekx {
    font-size: 14px;
    font-style: normal;
    -webkit-font-smoothing: antialiased;
    cursor: pointer;
    color: white;
    font-family: iconfont !important;
}.bjaDuv .handle > span i {
    width: 100%;
    height: 100%;
    display: block;
}.iconicon_voice1::before {
    content: "";
}.bjaDuv .handle > span {
    display: block;
    min-width: 26px;
    height: 100%;
    text-align: center;
}.bjaDuv .handle {
    display: flex;
    cursor: pointer;
    -webkit-box-align: center;
    align-items: center;
    height: 100%;
    margin-right: -4px;
}.fsOkAd {
    max-width: 100%;
    position: relative;
    background-color: rgb(255, 255, 255);
    border-radius: 3px;
    border: 1px solid rgb(240, 240, 240);
    float: left;
}.fOaeDu {
    color: rgb(29, 39, 84);
    white-space: normal;
    text-align: left;
}.hJxiVm {
    display: block;
    width: 100%;
    resize: none;
    outline: 0px;
    background: rgb(255, 255, 255);
    border: none;
    font-size: 13px;
    padding: 0px;
    height: 60px;
    font-family: "Helvetica Neue", Helvetica, Arial, "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
}

.kPIFPx:hover {
    color: white;
    background: rgb(0, 122, 255);
    opacity: 1;
} 
.kPIFPx {
    width: 60px;
    height: 32px;
    line-height: 32px;
    display: inline-block;
    vertical-align: middle;
    font-size: 13px;
    border: 0px;
    outline: none;
    border-radius: 3px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    opacity: 1;
    color: white;
    background: rgb(0, 122, 255);
}.icmNvQ {
    flex: 0 0 60px;
    width: 60px;
}.ivRHdf {
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
}.ecpYRO {
    float: right;
    text-align: right;
    max-width: calc(100% - 50px);
}.hJoKLV {
    color: rgb(178, 178, 178);
    font-size: 12px;
    margin-bottom: 2px;
}.bPhHOP {
    max-width: 100%;
    position: relative;
    background-color: rgb(0, 122, 255);
    border-radius: 3px;
    border: 1px solid rgb(240, 240, 240);
    margin-left: 30px;
    float: right;
}.hryzJB {
    padding: 10px 15px;
    border-radius: 3px;
    font-size: 13px;
    word-break: break-word;
}.emBCwA {
    color: white;
    white-space: normal;
    text-align: left;
}.dREyAr {
    float: left;
    text-align: left;
    max-width: calc(100% - 50px);
}

@font-face {
  font-family: "iconfont ";
  src:url("images/font_1820517_sl5jy5g8e7.woff2") format("woff2")
}

.jcaPlb i {
    color: rgb(102, 102, 102);
    font-size: 24px;
}
<style>
.bfgNmj {
    font-size: 20px;
    font-style: normal;
    -webkit-font-smoothing: antialiased;
    cursor: pointer;
    font-family: iconfont !important;
}
.layui-upload-file{
    display:none;
}

#__widget_msg_container .upimg{
    max-width: 50%;
}

</style>


</head>

<body><%'解决手机上键盘上提交报错的原因%>
    <form action="?act=aabb" onsubmit="$('#fasong').click();return false;">
    <div class="sc-1y975dg-0 hRSBCQ">
        <div class="sc-hehmy0-1 eapgeZ">
            <div class="sc-hehmy0-2 gFEAYH">
                <div class="sc-17esfwn-0 kQtTCX">
                    <div class="sc-17esfwn-1 jIxeoH">
                        <div><img class="avatar" alt="#" src="kf/images/YjrSvTxbOikeXFpUwcv2.jpg"></div>
                    </div>
                    <div class="sc-17esfwn-2 ohCFd">
                        <div class="sc-17esfwn-4 bjaDuv">
                            <div class="name" title="<%=nickname%>"  style="line-height:36px;padding-left:6px;"><%=nickname%></div>
                            <!-- <div class="handle"><span><i class="sc-13t755u-0 ccHekx iconicon_voice1 close" size="14"></i></span></div> -->
                        </div>
                        <div class="sc-17esfwn-3 jNAeZG"></div>
                    </div>
                </div>
            </div>
            <div class="sc-hehmy0-0 evpQpB">
                <div class="sc-hehmy0-4 fJhyOQ" style="height: calc(550px);">
                    <div class="sc-hehmy0-3 sc-hehmy0-5 dIrprp">
                        <div class="sc-hehmy0-6 lnrcNw">
                            <div id="__widget_msg_container" class="sc-1s63a33-2 gregEU" style="height: calc(445px);">
                                <div class="sc-1s63a33-5 ePqcYq"><span>加载更多历史消息</span></div>

                                    <%call getChatList(nPageSize,touserid,"","down")%>

<!--                                 <div id="m26418369496" class="sc-1s63a33-4 hBHzRk">
                                    <div class="sc-zdv82n-0 ivRHdf">
                                        <div direction="left" class="sc-zdv82n-2 dREyAr sc-90je80-0 cCrFQF">
                                            <div class="sc-zdv82n-3 hJoKLV">王权客服 13:26</div>
                                            <div direction="left" class="sc-zdv82n-4 fsOkAd">
                                                <div class="sc-zdv82n-6 hryzJB">
                                                    <div class="sc-t9ar3v-0 fOaeDu">
                                                        <div>亲， 有什么可以帮助您的呢~</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sc-1s63a33-6 cVtboE"></div>
                                </div>
                                <div style="clear: both"></div> -->

                       

 


                            </div>
                            <div class="sc-14dqam-0 iXanps"></div>
                        </div>

                        <%if isMobile=false then%>

                        <div class="sc-hehmy0-7 cpJwaQ">
                            <div class="sc-n12jpw-0 iniXEV">
                                
                                <textarea id="_MEIQIA_INPUT" placeholder="请输入" class="sc-1j304be-0 hJxiVm"></textarea>
                                
                                <div class="sc-n12jpw-5 lksJxc" id="">

                                    <div class="sc-n12jpw-7 eHDFyP" style="float:left;">
                                       <!--  <div class="sc-kci2kp-0 lnaYRJ"><label title="表情" class="sc-kci2kp-1 jcaPlb"><i class="sc-13t755u-0 bfgNmj iconicon_widget_face " size="20"></i></label><label title="发送图片" class="sc-kci2kp-1 jcaPlb"><i class="sc-13t755u-0 bfgNmj iconicon_widget_picture " size="20"></i><span class="sc-kci2kp-2 WCATX"><input id="photoFile" type="file" accept="image/*"></span></label><label title="发送视频" class="sc-kci2kp-1 jcaPlb"><i class="sc-13t755u-0 bfgNmj iconicon_widget_video " size="20"></i><span class="sc-kci2kp-2 WCATX"><input id="photoFile" type="file" accept="video/mp4,video/quicktime" value=""></span></label><label title="评价" class="sc-kci2kp-1 jcaPlb"><i class="sc-13t755u-0 bfgNmj iconicon_widget_assess " size="20"></i></label></div> -->
                                       <!-- <img src="images/chatico.jpg" id="abc" style="cursor:pointer;"> -->


                                       <img src="images/qqface/chatico001.jpg" title="选择表情" id="clickqqface" style="cursor:pointer;">
                                       <img src="images/qqface/chatico002.jpg" title="上传图片" id="layuiadmin-upload-image" style="cursor:pointer;">
                                       <img src="images/qqface/chatico003.jpg" title="上传视频" id="layuiadmin-upload-video" style="cursor:pointer;">
                                       <img src="images/qqface/chatico004.jpg" title="点赞" onclick="clickzan();" style="cursor:pointer;">


                                    </div>

                                    <div class="sc-n12jpw-6 icmNvQ" style="float:right">

                                        <a data-cy="send-btn" class="sc-1l5n3rz-0 kPIFPx" id="fasong"><span>发送</span></a>

                                    </div>
                                </div>
                            </div>
                        </div>
<%else%>

<style>
    
.hmZYfm {
    display: block;
    width: 100%;
    padding: 4px 6px;
    outline: 0px;
    background: rgb(243, 244, 248);
    border: none;
    font-size: 13px;
    height: 32px;
    font-family: "Helvetica Neue", Helvetica, Arial, "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
}.fWcUgc a {
    display: block;
} 
.efUOka {
    width: auto;
    height: auto;
    display: inline-block;
    vertical-align: middle;
    font-size: 14px;
    border: 0px;
    outline: none;
    border-radius: 3px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    opacity: 1;
    color: white;
    background: rgb(0, 122, 255);
}
.fWcUgc {
    flex: 0 0 60px;
    width: 60px;
    margin-left: 6px;
}


</style>

<div class="sc-hehmy0-7 cpJwaQ">
    <div class="sc-1ipoqpn-0 dJhGfp">

        <div style="padding: 6px 0px;">
 <!-- <img src="images/chatico.jpg" id="layuiadmin-upload-image" style="cursor:pointer;"> -->
<img src="images/qqface/chatico001.jpg" title="选择表情" id="clickqqface" style="cursor:pointer;">
<img src="images/qqface/chatico002.jpg" title="上传图片" id="layuiadmin-upload-image" style="cursor:pointer;">
<img src="images/qqface/chatico003.jpg" title="上传视频" id="layuiadmin-upload-video" style="cursor:pointer;">
<img src="images/qqface/chatico004.jpg" title="点赞" onclick="clickzan();" style="cursor:pointer;">

           <!--  <div class="sc-kci2kp-0 lnaYRJ"><label title="表情" class="sc-kci2kp-1 jcaPlb"><i class="sc-13t755u-0 bfgNmj iconicon_widget_face " size="20"></i></label><label title="发送图片" class="sc-kci2kp-1 jcaPlb"><i class="sc-13t755u-0 bfgNmj iconicon_widget_picture " size="20"></i><span class="sc-kci2kp-2 WCATX"><input id="photoFile" type="file" accept="image/*"></span></label><label title="发送视频" class="sc-kci2kp-1 jcaPlb"><i class="sc-13t755u-0 bfgNmj iconicon_widget_video " size="20"></i><span class="sc-kci2kp-2 WCATX"><input id="photoFile" type="file" accept="video/mp4,video/quicktime" value=""></span></label><label title="评价" class="sc-kci2kp-1 jcaPlb"><i class="sc-13t755u-0 bfgNmj iconicon_widget_assess " size="20"></i></label></div> -->


    </div>

   <div class="sc-1ipoqpn-2 kghdRQ">

    <div class="sc-1ipoqpn-4 epWsqS" style="width: 78%;    float: left;"><form><input id="_MEIQIA_INPUT" placeholder="请输入" type="text" autocomplete="off" class="sc-1j304be-1 hmZYfm" value=""></form></div>


<div class="sc-1ipoqpn-3 fWcUgc" style="float: right;">


    <a font-size="14px" width="auto" id="fasong" height="auto" class="sc-1l5n3rz-0 efUOka" style="line-height: 32px;">

    <span >发送</span></a>

</div></div></div></div>

<%end if%>




                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
$(function(){
    $("#fasong").click(function(){
        // localStorage.setItem('chatContent', '');//保存到本地内容 清空
        var s=$("#_MEIQIA_INPUT").val()
        // alert("s="+s)
        if(s=="")return false;
        $("#_MEIQIA_INPUT").val('');//清空发言内容

        jQuery.ajax({
            url: '?act=send&touserid=<%=touserid%>&type=<%=sType%>',
            type: 'POST',
            data: {
                'content': s
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest)
                console.log(textStatus)
                console.log(errorThrown)
            },
            success: function(result) {                
                // alert($("#sendhtml").html())
                 // location.reload() 
                 // alert(result)
                getxx();//更新

            }
        });
    })

})
function revoke(id,domid){    
    jQuery("#"+domid).hide();

        jQuery.ajax({
            url: '?act=revoke&id='+id,
            type: 'POST',
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest)
                console.log(textStatus)
                console.log(errorThrown)
            },
            success: function(result) {
                // alert($("#sendhtml").html())
                 // location.reload() 
                 // alert(result)
                // getxx();//更新
                alert(result)

            }
        });

}
</script>



<script src="admin/layuiadmin/layui/layui.js"></script>  
<script>
layui.config({
    base: 'admin/layuiadmin/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','set','layedit'], function() {
    var $ = layui.$,
        form = layui.form,
        upload = layui.upload,
        laydate = layui.laydate;

    upload.render({
        elem: '#layuiadmin-upload-image',
        url: '/api/upload/',
        done: function(res) {
            // $("#_MEIQIA_INPUT").val("<img src='"+ res.data.src +"'>") 
            // alert(res.data.src)
            jQuery.ajax({
                url: '?act=send2&touserid=<%=touserid%>&type=<%=sType%>',//要加个type以判断是否为客服
                type: 'POST',
                data: {
                    'content': "<a href='"+res.data.src+"' target='_blank'><img src='"+ res.data.src +"' class='upimg'></a>"
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    console.log(XMLHttpRequest)
                    console.log(textStatus)
                    console.log(errorThrown)
                },
                success: function(result) {                
                    // alert($("#sendhtml").html())
                     // location.reload()
                     // alert(result)
                     getxx();//更新
                }
            });
 

        }
    });
        upload.render({
        elem: '#layuiadmin-upload-video',
        url: '/api/upload/uploadvideo.asp',
        exts: 'mp4', //只允许上传mp4文件
        done: function(res) {
            // $("#_MEIQIA_INPUT").val("<img src='"+ res.data.src +"'>") 
            // alert(res.data.src)
            jQuery.ajax({
                url: '?act=send2&touserid=<%=touserid%>&type=<%=sType%>',//要加个type以判断是否为客服
                type: 'POST',
                data: {
                    'content': "<video controls=''  name='media' class='upimg'><source src='"+res.data.src+"' type='video/mp4'></video>"
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    console.log(XMLHttpRequest)
                    console.log(textStatus)
                    console.log(errorThrown)
                },
                success: function(result) {                
                    // alert($("#sendhtml").html())
                     // location.reload()
                     // alert(result)
                     getxx();//更新
                }
            });
 

        }
    });
    

})

function clickzan(){
    jQuery.ajax({
        url: '?act=send2&touserid=<%=touserid%>&type=<%=sType%>',//要加个type以判断是否为客服
        type: 'POST',
        data: {
            'content': "<img src='/images/qqface/999.png' title='赞'>"
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest)
            console.log(textStatus)
            console.log(errorThrown)
        },
        success: function(result) {                
            // alert($("#sendhtml").html())
             // location.reload()
             // alert(result)
             getxx();//更新
        }
    });
 
}

  var endId=<%=endId%>
  var startId=<%=startId%>
  // alert(endId)
   function getxx() {
        $.get("?act=new&id="+endId+"&type=<%=sType%>&touserid=<%=touserid%>", function (data, status) {            
            if(data.substr(0,6)=="update"){
                var splxx=data.split("&Array&")
                // alert("更新"+splxx[1])
                endId=parseInt(splxx[1])
                // localStorage.setItem('chatContent', $("#_MEIQIA_INPUT").val());//保存到本地内容
                // window.location.reload();

                $("#__widget_msg_container").append(splxx[2])
                $('#__widget_msg_container').animate({ scrollTop:99999 }, 10);  //秒显示到最后20220723
            }
        });
    } 
    setInterval(getxx, 5000);

    $('#__widget_msg_container').animate({ scrollTop:99999 }, 10);  //秒显示到最后20220723

     // $('#__widget_msg_container').animate({ scrollTop: $(document).height()+99999 }, 10);  //秒显示到最后20220723

     // $("#_MEIQIA_INPUT").val(localStorage.getItem('chatContent'));//恢复聊天内容

    //  $("#xx").show();
    // $("#xx").text("33");
$("div[class='sc-1s63a33-5 ePqcYq'").click(function(){
    
        $.get("?act=getupchat&id="+startId+"&type=<%=sType%>&touserid=<%=touserid%>", function (data, status) {            
            if(data.substr(0,6)=="update"){
                var splxx=data.split("&Array&")
                // alert("更新"+splxx[1])
                var n=parseInt(splxx[2])
                if(n<startId){
                    startId =n
                    // localStorage.setItem('chatContent', $("#_MEIQIA_INPUT").val());//保存到本地内容
                    // window.location.reload();

                    $("#__widget_msg_container").prepend(splxx[1]);//加内容在内容头部
                    // $('#__widget_msg_container').animate({ scrollTop:0 }, 10);  //秒显示到最后20220723
                }else{
                    $("div[class='sc-1s63a33-5 ePqcYq'").hide();//加载历史记录在最后了，隐藏按钮功能
                }
            }
        });

    // alert("加载更多")


})
</script>
</form>


</body>

</html>



<%
'获得聊天指定页内容202207424'
function getChatList(nTop,touserid,focusid,sType)
dim sql,x,maxpage,iPageSize,iCount,id,nStartId
'为空则自己寻找'
if focusid="" then
    focusid=99999
    sql="select top "& nTop &" * from " & db_PREFIX & "chat where (userid="& userRs("id") &" and touserid="& touserid &") or (userid="& touserid &" and touserid="& userRs("id") &") and isdel<>1 order by id desc"
    rs.open sql,conn,1,1
    if not rs.eof then
        rs.movelast
        focusid=rs("id")
    end if:rs.close

    if isDebug then call echo("focusid",focusid)
end if

if sType="down" then
    sql="select * from " & db_PREFIX & "chat where ((userid="& userRs("id") &" and touserid="& touserid &") or (userid="& touserid &" and touserid="& userRs("id") &")) and id>="& focusid &"  and isdel<>1 order by id asc"
elseif sType="up" then 
    nStartId=0
    sql="select top "& nTop &" * from " & db_PREFIX & "chat where ((userid="& userRs("id") &" and touserid="& touserid &") or (userid="& touserid &" and touserid="& userRs("id") &")) and id<"& focusid &"  and isdel<>1 order by id desc"
    rs.open sql,conn,1,1
    if not rs.eof then
        rs.movelast
        nStartId=rs("id") 
    end if:rs.close  
    if isDebug then call echo("focusid",focusid)
    if isDebug then call echo("nStartId",nStartId)

    sql="select * from " & db_PREFIX & "chat where ((userid="& userRs("id") &" and touserid="& touserid &") or (userid="& touserid &" and touserid="& userRs("id") &")) and id>"& nStartId &" and id<"& focusid &"  and isdel<>1 order by id asc"
end if
' call echo("sql",sql)
rs.open sql,conn,1,1
while not rs.eof
    if rs("id")>endId then endId=rs("id")
    if rs("id")<startId then startId=rs("id")
    if isDebug then call echo("endId",endId)
    if rs("userid")=userRs("id") then'我
%> 
                                    <div id="chatid<%=rs("id")%>" class="sc-1s63a33-4 hBHzRk">
                                        <div class="sc-zdv82n-0 ivRHdf">
                                            <div direction="right" class="sc-zdv82n-2 ecpYRO sc-90je80-0 cCrFQF">
                                                <div class="sc-zdv82n-3 hJoKLV"><%

                                                call rw(format_Time(rs("createTime"),17))
                                                ' call rw(" - ID"&rs("id"))
                                                call rw(showRevokeButton(rs,"chatid"&rs("id")))
                                                %>
                                                </div>
                                                <div direction="right" class="sc-zdv82n-4 bPhHOP">
                                                    <div class="sc-zdv82n-6 hryzJB">
                                                        <div class="sc-t9ar3v-0 emBCwA">
                                                            <div><%=handleBodyQQFace(rs("bodycontent"))%></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="sc-1s63a33-6 cVtboE"></div>
                                    </div>
                                    <div style="clear: both"></div> 


<%
'他'
else
%>

                                <div id="chatid<%=rs("id")%>" class="sc-1s63a33-4 hBHzRk">
                                    <div class="sc-zdv82n-0 ivRHdf">
                                        <div direction="left" class="sc-zdv82n-2 dREyAr sc-90je80-0 cCrFQF">
                                            <div class="sc-zdv82n-3 hJoKLV"><%=nickname%><%
                                            call rw(format_Time(rs("createTime"),17))

                                            ' call rw(" - ID"&rs("id"))
                                            ' call rw(showRevokeButton(rs,"chatid"&rs("id")))


                                        %></div>
                                            <div direction="left" class="sc-zdv82n-4 fsOkAd">
                                                <div class="sc-zdv82n-6 hryzJB">
                                                    <div class="sc-t9ar3v-0 fOaeDu">
                                                        <div><%=handleBodyQQFace(rs("bodycontent"))%></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sc-1s63a33-6 cVtboE"></div>
                                </div>
                                <div style="clear: both"></div>
<%end if

rs.movenext:wend:rs.close

end function

'显示撤消按钮菜单20220729'
function showRevokeButton(rs,domid)
    if userRs("id")=rs("userid") then
        showRevokeButton="<a href=""javascript:revoke("& rs("id") &",'"& domid &"')"">撤消</a>"
    else

        showRevokeButton=" - " & userRs("id")& "," &rs("userid")
    end if

end function


%>



<style>
.comment{width:680px; margin:20px auto; position:relative; background:#fff; padding:20px 50px 50px; border:1px solid #DDD; border-radius:5px;}
.comment h3{height:28px; line-height:28px}
.com_form{width:100%; position:relative}
.input{width:99%; height:60px; border:1px solid #ccc}
.com_form p{height:28px; line-height:28px; position:relative; margin-top:10px;}
 
.qqFace{margin-top:4px;background:#fff;padding:2px;border:1px #dfe6f6 solid;}
.qqFace table td{padding:0px;}
.qqFace table td img{cursor:pointer;border:1px #fff solid;}
.qqFace table td img:hover{border:1px #0066cc solid;}
#show{width:770px; margin:20px auto; background:#fff; padding:5px; border:1px solid #DDD; vertical-align:top;}

.sub_btn {
    position:absolute; right:0px; top:0;
    display: inline-block;
    zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */
    *display: inline;
    vertical-align: baseline;
    margin: 0 2px;
    outline: none;
    cursor: pointer;
    text-align: center;
    font: 14px/100% Arial, Helvetica, sans-serif;
    padding: .5em 2em .55em;
    text-shadow: 0 1px 1px rgba(0,0,0,.6);
    -webkit-border-radius: 3px; 
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    box-shadow: 0 1px 2px rgba(0,0,0,.2);
    color: #e8f0de;
    border: solid 1px #538312;
    background: #64991e;
    background: -webkit-gradient(linear, left top, left bottom, from(#7db72f), to(#4e7d0e));
    background: -moz-linear-gradient(top,  #7db72f,  #4e7d0e);
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#7db72f', endColorstr='#4e7d0e');
}
.sub_btn:hover {
    background: #538018;
    background: -webkit-gradient(linear, left top, left bottom, from(#6b9d28), to(#436b0c));
    background: -moz-linear-gradient(top,  #6b9d28,  #436b0c);
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#6b9d28', endColorstr='#436b0c');
}
#facebox{bottom: 32px;top:0px}
</style> 
<script type="text/javascript" src="js/jquery.qqFace.js?v6"></script>
<script type="text/javascript">
$(function(){
    $('#clickqqface').qqFace({
        id : 'facebox', 
        assign:'_MEIQIA_INPUT', 
        path:'images/qqface/' //表情存放的路径
    });
    $(".sub_btn").click(function(){
        var str = $("#saytext").val(); 
        $("#show").html(replace_em(str));
    });

    $('#clickqqface').click(function(){ 
        $("#facebox").css("bottom","30px").css("top","auto").css("height","240px");
    })
});
//查看结果
function replace_em(str){
    str = str.replace(/\</g,'&lt;');
    str = str.replace(/\>/g,'&gt;');
    str = str.replace(/\n/g,'<br/>');
    str = str.replace(/\[em_([0-9]*)\]/g,'<img src="images/qqface//$1.gif" border="0" />');
    return str;
}
</script>



<script>
//获得粘贴板内容
    document.addEventListener('paste', function (event) {  
        console.log("粘贴内容")
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
    })
 
    function showCVText(text) {
        document.getElementById("previewCVText").value = text;
    }
 
 
    function showText(blob) {
        getContext(blob).then(res => {
            res = res.substring(res.indexOf('base64,') + 7);//去掉头"data:text/plain;base64,"
            res = window.atob(res);//base64解码
            document.getElementById("previewText").value = res;
        })
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
                            sendClipboardImg("/"+data.img)
                            break;
                        case "n": 
                            break;
                    }
                }
            });


        })
    }

    function sendClipboardImg(imgsrc){
            jQuery.ajax({
                url: '?act=send2&touserid=<%=touserid%>&type=<%=sType%>',//要加个type以判断是否为客服
                type: 'POST',
                data: {
                    'content': "<a href='"+imgsrc+"' target='_blank'><img src='"+ imgsrc +"' class='upimg'></a>"
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    console.log(XMLHttpRequest)
                    console.log(textStatus)
                    console.log(errorThrown)
                },
                success: function(result) {                
                    // alert($("#sendhtml").html())
                     // location.reload()
                     // alert(result)
                     getxx();//更新
                }
            });
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