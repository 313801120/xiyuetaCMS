<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><%
if request("act")="send" then
	call handleIISLog(request("logPath"))

end if

sub handleIISLog(logPath)
	dim filepath,content,splstr,splxx,s,i,nOK,nLen,url,filename,filetype
	content=readfile(logPath,"utf-8")
	splstr=split(content,vbcrlf)
	i=0
	nOK=0
	for each s in splstr
		if instr(s," ") and left(s,1)<>"#" then
			i=i+1
			splxx=split(s," ")
			rs.open"select * from ["& db_PREFIX &"iislog]",conn,1,3
			rs.addnew
			' call echo("i",i)
			' call echo("splxx长度",ubound(splxx))
			' call echo("浏览时间",format_Time(splxx(0) & " "& splxx(1),1) )
			' call echo("serverip",splxx(2))
			' call echo("方法",splxx(3))
			' call echo("URL",splxx(4))
			' call echo("URL参数",splxx(5))
			' call echo("端口",splxx(6))
			' call echo("用户名",splxx(7))
			' call echo("用户IP",splxx(8))
			' call echo("来路",splxx(9))
			' call echo("状态码",splxx(11))
			' call echo("用户代理",splxx(10))
			' call echo("底层状态码",splxx(12))
			' call echo("Win32状态",splxx(13))
			' call echo("处理时间",splxx(14)) 
			' call hr():doevents
			' call die("")
	        rs("browsetime")=format_Time(splxx(0) & " "& splxx(1),1) 
	        rs("serverip")=splxx(2)
	        rs("method")=splxx(3)
	        rs("url")=left(splxx(4),255)   '只提取255个字符'
	        rs("urlparameter")=splxx(5)
	        rs("port")=splxx(6)
	        rs("username")=splxx(7)
	        rs("userip")=splxx(8)
	        rs("incomingroad")=splxx(9)
	        rs("useragent")=left(splxx(10),255)
	        rs("statuscode")=splxx(11)
	        rs("bottomstatuscode")=splxx(12)
	        rs("win32statuscode")=splxx(13)
	        rs("handletime")=splxx(14)

	        url=splxx(4)
	        nLen=instrrev(url,"/")
	        if nLen>0 then
	        	filename=mid(url,nLen+1)
	        	rs("filename")=filename  '文件名'

	        	nLen=instrrev(filename,".")
                if nLen>0  then
                    filetype=mid(filename,nLen+1)
	        		rs("filetype")=lcase(filetype)  '文件后缀'转小写
	    		end if
	    	end if
	        rs.update:rs.close


	        nOK=nOK+1
		end if
	next
	call die("共添加"& nOK &"条，" & vbEchoTimer())
end sub
%>
     