<!--#Include file = "../common.Asp"--><%
dim msg,jshref,autoToUrl
jshref="javascript:history.go(-1)"
autoToUrl="history.go(-1);"
if request("act")="replycomment" then    '回复评论'
    call replycomment()    '提交'
elseif request("act")="tagerr" then    '标签不存在错误提示'
    msg="此TAG不存在" 
elseif request("act")="searcherr" then    '搜索错误提示'
    msg="系统限制的搜索关键字只能在 2~20 个字符之间" 
end if

function replycomment()    '提交'
    dim articleid,name,mobile,email,content,yzm,nomember,parentid
    articleid=requestHtmlHandle(request("articleid"))
    name=requestHtmlHandle(request("username"))
    content=requestHtmlHandle(request("saytext"))
    nomember=requestHtmlHandle(request("nomember"))   '是否匿名'
    parentid=requestHtmlHandle(request("repid"))   '回复某个人'
    yzm=request("key")
    if yzm="" then
        msg="请输入验证码！"
        exit function
    elseif yzm<>session("yzm") or session("yzm")="" then 
        msg="验证码不正确！"
        exit function
    end if
    session("yzm")="" '清空验证码的session'
    rs.open "select * from " & db_PREFIX & "articlemessage" ,conn,1,3    
        rs.addnew
        rs("ip")=getip() 
        if nomember<>"1" then
            if session("memberid")<>"" then
                rs("memberid")=session("memberid")
            end if
        else
            rs("memberpic")="/images/userpic/" & phpRnd(1,68) & ".gif"
        end if

        if articleid<>"" then 
            rs("articleid")=articleid
        end if
        if parentid<>"" then rs("parentid")=parentid
        rs("guestname")=name 
        rs("bodycontent")=content
    rs.update:rs.close 
    msg="留言成功！"
    jshref=getGoToUrl()
    autoToUrl="window.location.href='"& jshref &"'"
    'msg="系统限制的发表评论间隔是 20 秒,请稍后再发"
    exit function
end function

'获得获得的请求内容值'
function requestHtmlHandle(s)
    s=replace(s,"<","&lt;")
    s=replace(s,">","&gt;")
    requestHtmlHandle=s
end function
%><!DOCTYPE html>
<html>
<script language=javascript>
var secs = 4; //4秒
for (i = 1; i <= secs; i++) { window.setTimeout("update(" + i + ")", i * 1000); }

function update(num) {
    if (num == secs) { <%=autoToUrl%> } else {}
}
</script>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信息提示</title> 
</head>

<body class="gray-bg">
    <div class="middle-box text-center">
        <h2><i class="fa fa-spinner fa-spin fa-3x"></i></h2>
    </div>
    <div class="middle-box text-center animated ">
        <h3 class="font-bold"><%=msg%></h3>
    </div>
    <div class="middle-box text-center">
        <div class="error-desc">
            <a href="<%=jshref%>" class="btn btn-primary m-t">如果您的浏览器没有自动跳转，请点击这里</a>
        </div>
    </div> 
</body>

</html>