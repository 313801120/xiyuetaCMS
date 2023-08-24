<%
dim uDomain,uTitle,dataPrefix,myDomain,splDiQu,cDiQu,nI,diqu
dim isDomainOrUrlSuffix:isDomainOrUrlSuffix="suffix"  'domain suffix'

if isDomainOrUrlSuffix="domain" then 
	'以域名来区分  如  beijin.xiyueta.com'
	   '网站域名 最好是手动设置一个名称：如 test.net 
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
else 
	diqu=request("diqu")
	if diqu<>"" then
		uTitle=getSheShiToCn(diqu)
	end if
	' call echo("diqu",diqu)
	' call echo("uTitle",uTitle)
end if


'处理URL里加上地区 20230824'
function urlAddDiQu(url)
	if diqu<>"" and url<>"" then
		if asporhtml=true then
			if left(url,2)="./" then
				url=mid(url,3)
			end if

			url=diqu & "-" & url
		else
			if instr(url,"?")>0 then
				url=url & "&diqu=" & diqu
			else
				url=url & "?diqu=" & diqu
			end if
		end if
	end if
	urlAddDiQu=url
end function

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
'获得处理后的域名 如  aaa.xiyueta.com  获得  xiyueta.com'
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