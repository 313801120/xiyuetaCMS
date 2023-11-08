<%
'游客自动登录 20230310' money为金币
function visitorLogin(money) 
	dim sql,defaultPass
	defaultPass=mymd5("123456")
	'已经登录过，则不登录了  否则以有课身份登录'
	if session("memberid")="" then
		sql="select * from ["& db_PREFIX &"member] where ip='"& getIP() &"' and nickname='游客' and pwd='"& defaultPass &"'"
	    rs.open sql,conn,1,3
	    '不存在则追加'
	    if rs.eof then
	        rs.addnew
	        ' rs("username")="youke" & handleMD5(getip() & getrnd(11) & now(),16) 
	        rs("username")="A" & getrnd(4)
	        rs("nickname")="游客"
	        rs("pic")="/images/userpic/" & phpRnd(1,68) & ".gif"
	        rs("tel")="138" & getRndTel(8) '追加于20230421'
	        rs("ip")=getIP()
	        rs("pwd")=defaultPass
	        rs("money")=money
	        if session("promotionUserId")<>"" then   '添加推广者id 20230421'
	        	rs("userid")=session("promotionUserId")
	        end if
	        rs.update
	    end if:rs.close

	    rs.open sql,conn,1,1
	    if not rs.eof then
		    session("memberid")=rs("id")
		    session("memberuser")=rs("username")
		    session("memberpass")=rs("pwd") 
		    visitorLogin=true	    
		else	    
	    	call echo("id",rs("id"))
	    	call echo("memberid",session("memberid"))
	    	call echo("memberuser",session("memberuser"))
	    	call echo("memberpass",session("memberpass"))
	        call eerr("测试",session("memberid"))
	        visitorLogin=false	    
	    end if:rs.close
	    
	end if
end function
%>