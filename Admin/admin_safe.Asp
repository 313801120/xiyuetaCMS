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
	else
		session("adminid")=userRs("id")'追加，好判断'
	end if
else
	response.Redirect("/admin/login.asp?0")
end if

'检测权限 返回true或false   20220604'
function checkPermission(did)
    if userrs("level")=1 then checkPermission=true:exit function'超级总管理管理员，返回真
    dim permission
    permission=replace(userrs("permission") & ""," ",",") 
    if instr(","& permission &",",","& did &",")>0 then
        checkPermission=true
        exit function
    end if
    checkPermission=false
end function
'检测权限 为false则输出信息并停止'
function checkPermissionRw(did) 
    if checkPermission(did)=false then
        call die("<div style='text-align:center;line-height:50px;font-size:16px;'>没有"& did &"权限</div>")
    end if
end function
'检测权限 为false则输出Json信息并停止'
function checkPermissionJson(did) 
    if checkPermission(did)=false then
        call die("{""info"": ""没有"& did &"权限"",""msg"": ""没有"& did &"权限"",""status"": ""n""}")
    end if
end function
%>