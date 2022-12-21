<!--#Include file = "../common.Asp"--><%
if request("act")="submit" then   
    call sumbitliuya()    '留言'
end if

function sumbitliuya()    '留言'
    dim name,mobile,email,content,yzm
	name=requestHtmlHandle(request("name"))
	mobile=requestHtmlHandle(request("mobile"))
	email=requestHtmlHandle(request("email"))
	content=requestHtmlHandle(request("content"))
    yzm=request("yzm")
    if yzm="" then
        call eerr("留言失败","请输入验证码！<a href='javascript:history.back();'>返回上一页</a>" & jsTiming("back",6))
    elseif yzm<>session("yzm") then
        call eerr("留言失败","验证码不正确！<a href='javascript:history.back();'>返回上一页</a>" & jsTiming("back",6))
    end if

    rs.open "select * from " & db_PREFIX & "guestbook" ,conn,1,3    
        rs.addnew
        rs("ip")=getip()
        rs("tel")=mobile
        rs("guestname")=name
        rs("email")=email
        rs("bodycontent")=content
    rs.update:rs.close
    call die("留言成功！<a href=''>返回首页</a> &nbsp;" & jsTiming("/",6))
end function

'获得获得的请求内容值'
function requestHtmlHandle(s)
    s=replace(s,"<","&lt;")
    s=replace(s,">","&gt;")
    requestHtmlHandle=s
end function
%>