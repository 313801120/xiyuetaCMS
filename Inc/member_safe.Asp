<%
 
'全局定义 管理账号验证 
dim userRs:Set userRs = CreateObject("Adodb.RecordSet")
call openconn()

'以游客身份登录'
if request("act")="loginTourist" then 
  '已经登录过，则不登录了'
  if session("memberid")="" then
    rs.open"select * from ["& db_PREFIX &"member] where ip='"& getIP() &"' and nickname='游客' and pwd='"& mymd5("youke") &"'",conn,1,3
    if rs.eof then
        rs.addnew
        rs("username")="youke" & mymd5(getip() & now())
        rs("nickname")="游客"
        rs("pic")="images/userpic/" & phpRnd(1,68) & ".gif"
        rs("ip")=getIP()
        rs("pwd")=mymd5("youke")
        rs.update
    end if
    session("memberid")=rs("id")
    session("memberuser")=rs("username")
    session("memberpass")=rs("pwd")
    rs.close 
    if session("memberid")="" or session("memberuser")="" then '为游客'
        call echo(session("memberuser"),session("memberpass"))
        call eerr("测试",session("memberid"))
    end if 
  end if
end if

'session判断'
if session("memberid")<>"" then 
	' userRs.open "select * from " & db_PREFIX & "member Where id=" & session("memberid") ,conn,1,3 

    userRs.open "select * from " & db_PREFIX & "member where username='"& session("memberuser") &"' and pwd='"& session("memberpass") &"'" ,conn,1,3 
	if userRs.eof then 
        session("memberid")=""
        session("memberuser")=""
        session("memberpass")=""
        session("onloadchat")="" '清空在线聊天的第一次登录'
		' response.Redirect("/login.asp?1="&session("memberuser") & "&pass="&session("memberpass") )
    call eerr("没有登录","<a href='?act=loginTourist&1'>登录失效，点击以游客身份登录</a>")
    call eerr("会员账号密码登录，再先登录","<a href='"& "/login.asp?1="&session("memberuser") & "&pass="&session("memberpass") &"'>"& "/login.asp?"& session("memberid") &"="&session("memberuser") & "&pass="&session("memberpass") &"</a>")
	end if

'cookies判断'
elseif getCookie("memberuser")<>"" and getCookie("memberpass")<>"" then  
	userRs.open "select * from " & db_PREFIX & "member Where userName='"& getCookie("memberuser") &"' and pwd='"& getCookie("memberpass") &"'" ,conn,1,3 
	if userRs.eof then 
		' response.Redirect("/login.asp?2")
    call eerr("提示","cookie账号密码错误")
	else
		session("memberid")=userRs("id")'追加，好判断'
	end if
else
	' response.Redirect("/login.asp?0")
  call eerr("没有登录","<a href='?act=loginTourist&0'>点击以游客身份登录</a>")
  call eerr("提示","session全部为空 /login.asp?0")
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

'获得单页里图片20220521
function addInformation(msg)  
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c 
  rs.open"select * from ["& db_PREFIX &"information]",conn,1,3
  rs.addnew
  rs("userid")=userRs("id")
  rs("bodycontent")=msg
  rs("isthrough")=1
  rs.update:rs.close
  addInformation=true
end function
%>