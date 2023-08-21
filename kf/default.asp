<!--#Include virtual = "/common.Asp"-->
<%
dim sType,touserid,nickname
sType=request("type")
if request("act")="out" then
    session("memberid")=""
    session("memberuser")=""
    session("memberpass")=""
    call eerr("提示","退出登录完成！<a href='?'>登录</a>")
end if

if sType="hf" then
    ' call eerr( session("memberuser"),session("memberpass"))
    if session("memberid")="" or session("memberuser")="" or session("memberpass")="" then

        rs.open"select * from ["& db_PREFIX &"member] where id=0",conn,1,1
        if not rs.eof then
            session("memberid")=rs("id")
            session("memberuser")=rs("username")
            session("memberpass")=rs("pwd")
        end if:rs.close
    end if 

end if 
%>
<!--#include file="../inc/member_safe.asp"-->
<%
webTitle="联系客服"
nickname="客服"
touserid=request("touserid")
if touserid="" then touserid=0'为客服号.
if sType="hf" then
    webTitle="聊天"
end if
if touserid<>"" then
    rs.open"select * from ["& db_PREFIX &"member] where id="&touserid,conn,1,1
    if not rs.eof then
        nickname=rs("nickname") '& "(id:"& rs("id") & ")"
    end if:rs.close
end if

%>




<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title><%=webTitle%></title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="headerbox">
        <div class="header">
            <div class="headerL">
                <a onclick="javascript:history.back(-1)" class="goback">
                    <img src="images/goback.png" /></a>
            </div>
            <div class="headerC">
                <p><%=webTitle%></p>
            </div>
            <div class="headerR"></div>
        </div>

    </div>

 
<style>
.bfEgQL {
    border: none;
    margin: 0px;
    padding: 0px;
    overflow: visible;
    overflow-wrap: normal;
    box-shadow: rgb(0 0 0 / 16%) 0px 5px 40px;
    border-radius: 8px;
    position: fixed;
    z-index: 9999999;
    top: 50%;
    left: 50%;


    transform: translateX(-50%) translateY(-50%);
    width:500px;
    height: 610px;
    display: block !important;
}

</style>

<iframe name="chat" id="chat" src="chat.asp?type=<%=sType%>&touserid=<%=touserid%>" scrolling="no" class="bfEgQL"></iframe>

<script src="../js/jquery-1.8.1.min.js"></script>
<script>
    var nWidth=$(window).width();
    if(nWidth<500){
        $("iframe").attr("style","width:"+(nWidth-20)+"px")
    }

    //手机
    var nHeight=$(window).height();
    // alert(nHeight)
    if(nHeight<=900){
        $("iframe").css("top","44%")
    }
    // if(nHeight>610){
    //     $("iframe").attr("style","height:"+(nHeight-120)+"px")
    // }


    //获得粘贴板内容
    document.addEventListener('paste', function (event) {
        var frames=document.getElementById("chat");//frameid即右栏iframe的id名
        frames.contentWindow.uploadclipboardDataImage(event);
    })
</script>

</html>
