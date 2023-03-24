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
	userRs.open "select * from " & db_PREFIX & "Admin Where userName='"& getCookie("adminuser") &"'" ,conn,1,3 
	if userRs.eof then 
		response.Redirect("/admin/login.asp?2")
	else 
        '密码不正确'
        if getCookie("adminpass")<>mymd5(userrs("pwd")&userrs("updatetime")) then
            ' call echo("cookie adminpass",getCookie("adminpass"))
            ' call echo("cookie updatetime",getCookie("updatetime"))
            ' call echo(" userrs updatetime",userrs("updatetime"))
            ' call echo(" pwd",userrs("pwd"))
            ' call eerr(getCookie("adminpass"),mymd5(userrs("pwd") & cstr(userrs("updatetime"))))

            response.Redirect("/admin/login.asp?2-2")
            response.end()
        end if

		session("adminid")=userRs("id")'追加，好判断'
	end if
else
	response.Redirect("/admin/login.asp?0")
end if

'开启后台唯一登录20230316'
if isUniquelogin then
    if userrs("upip")<>getip() and userrs("upip")<>"*" then
        session("adminid")=""
        call removeCookie("adminuser")
        call removeCookie("adminpass")
        call eerr("提示","账号被IP("& userrs("upip") &")登录，你已退出。<a href='login.asp'>点击重新登录</a>")
    end if
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