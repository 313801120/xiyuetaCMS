<!--#Include file = "../common.Asp"--><%
if request("act")="submit" then   
    call sumbitliuya()    '留言'
end if

function sumbitliuya()    '留言'
    dim name,mobile,email,content
	name=request("name")
	mobile=request("mobile")
	email=request("email")
	content=request("content")

    rs.open "select * from " & db_PREFIX & "guestbook" ,conn,1,3    
        rs.addnew
        rs("ip")=getip()
        rs("tel")=mobile
        rs("guestname")=name
        rs("email")=email
        rs("bodycontent")=content
    rs.update:rs.close
    call die("留言成功！<a href='/'>返回首页</a> &nbsp;" & jsTiming("/",6))


end function
%>