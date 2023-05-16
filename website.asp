<%
dim uDomain,uTitle,dataPrefix,myDomain,splDiQu,cDiQu,nI,diqu
'以域名来区分  如  beijin.xiyueta.com'
myDomain="xiyuetatest.top"
uDomain=request.serverVariables("SERVER_NAME")
if instr(uDomain,"myxyt.com")>0 then uDomain="myxyt.com"	'这是本地'
dataPrefix=replace(uDomain,myDomain,"")
'call echo("dataPrefix",dataPrefix):doevents
if dataPrefix<>"" then uTitle=getSheShiToCn(mid(dataPrefix,1,len(dataPrefix)-1))
	
'call echo("uTitle",uTitle):doevents
if uTitle="" then
	if dataPrefix="xiyueta.com" or dataPrefix="myxyt.com" or dataPrefix="" or dataPrefix="web0427." or dataPrefix="localhost" or dataPrefix="a5" then
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

%>