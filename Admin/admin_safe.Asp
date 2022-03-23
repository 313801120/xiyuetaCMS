<%
 
'全局定义 管理账号验证 
dim userRs:Set userRs = CreateObject("Adodb.RecordSet")
call openconn()  
'session判断'
if session("adminid")<>"" then 
	userRs.open "select * from " & db_PREFIX & "admin Where id=" & session("adminid") ,conn,1,3
	if userRs.eof then 
		response.Redirect("/admin/login.asp?1")
	end if

'cookies判断'
elseif getCookie("adminuser")<>"" and getCookie("adminpass")<>"" then  
	userRs.open "select * from " & db_PREFIX & "Admin Where userName='"& getCookie("adminuser") &"' and pwd='"& getCookie("adminpass") &"'" ,conn,1,3 
	if userRs.eof then 
		response.Redirect("/admin/login.asp?2")
	end if
else
	response.Redirect("/admin/login.asp?0")
end if

%>