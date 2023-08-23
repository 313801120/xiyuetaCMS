<%
dim uDomain,uTitle,dataPrefix,myDomain,splDiQu,cDiQu,nI,diqu
'以域名来区分  如  beijin.xiyueta.com'
myDomain=""   '网站域名 最好是手动设置一个名称：如 test.net 
if myDomain="" then myDomain=getHnaldeMyDomain() '获得处理后的当前域名' 如果没有设置一个域名，则提取当前域名

uDomain=request.serverVariables("SERVER_NAME")
dataPrefix=replace(uDomain,myDomain,"")

if dataPrefix<>"" then 
	uTitle=getSheShiToCn(mid(dataPrefix,1,len(dataPrefix)-1)) '获得省市拼音对应的中文
end if
	 
if uTitle="" then
	if dataPrefix="test.com.cn.net" or 1=1 then
		dataPrefix=""
	else
		call die(uDomain & "网站正在制作中。。。" & dataPrefix)
	end if
end if

diqu=request("diqu")
if diqu<>"" then
	uTitle=getSheShiToCn(diqu)
end if

'获得省市链接的网址'
function SheShiUrl(s)
	SheShiUrl="http://"& trim(lcase(pinYin2(s))) &"."& myDomain
end function

'获得省市拼音对应的中文 如 '
function getSheShiToCn(s)
	call openconn()
    dim rs:Set rs = CreateObject("Adodb.RecordSet") 
	rs.open "select * from " & db_PREFIX & "sheshi where columnEnName=''" ,conn,1,3
	while not rs.eof
		rs("columnEnName")=trim(pinYin2(rs("columnName")))
		rs.update
	rs.movenext:wend:rs.close
	rs.open "select * from " & db_PREFIX & "sheshi where  columnEnName='"& s &"'" ,conn,1,1
	if not rs.eof then
		getSheShiToCn=rs("columnName")
	end if:rs.close
end function
'获得处理后的域名'
function getHnaldeMyDomain()
	dim url,splxx
	url=getUrl()
	' call echo("url",url)
	url=getWebSiteCleanName(url)
	' call echo("url",url)
	splxx=split(url,".")
	' call echo("count",ubound(splxx))
	if ubound(splxx)>=1 then
		url=splxx(ubound(splxx)-1) & "." & splxx(ubound(splxx))
		' call echo("url",url)
		getHnaldeMyDomain=url
	end if
end function

%>