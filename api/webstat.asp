<!--#Include file = "../common.Asp"--><%
if request("act")="webstat" then
	call saveWebStat()	'保存网站统计'
end if

function saveWebStat()	'保存网站统计'
	dim tourl,url,w,h,useragent
	tourl=request("tourl")
	url=request("url")
	w=request("w")
	h=request("h")
	useragent=unescape(request("useragent"))  'getBrType()' 

    rs.open "select * from " & db_PREFIX & "count where ip='"& getIP() &"' and url='"& url&"' and "& getAccessDatediff("intime") &"=0" ,conn,1,3
    if rs.eof then 
        rs.addnew
        rs("ip")=getip()
        rs("url")=url
        rs("addr")=look_ip(getip())
        rs("useragent")=useragent
        rs("tourl")=tourl
        rs("pv")=1
        rs("w")=w
        rs("h")=h
    else
        rs("pv")=rs("pv")+1'pv累加
    end if
    rs.update:rs.close 

end function
%>