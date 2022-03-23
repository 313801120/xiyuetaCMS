<%  
 

'调用function2文件函数
function callFunction2()
    dim sType 
    sType = request("stype") 
    if sType = "runScanWebUrl" then
        call runScanWebUrl()          '运行扫描网址
    elseif sType = "scanCheckDomain" then
        call scanCheckDomain()        '检测域名有效
    elseif sType = "bantchImportDomain" then
        call bantchImportDomain()     '批量导入域名
    elseif sType = "scanDomainHomePage" then
        call scanDomainHomePage()     '扫描域名首页
    elseif sType = "scanDomainHomePageSize" then
        call scanDomainHomePageSize() '扫描域名首页大小与标题
    elseif sType = "isthroughTrue" then
        call isthroughTrue()          '让审核全部为真
    elseif sType = "printOKWebSite" then
        call printOKWebSite()         '打印有效网址
    elseif sType = "printAspServerWebSite" then
        call printAspServerWebSite()  '打印asp类型网站
    elseif sType = "clearAllData" then
        call fun2_clearAllData()      '清除全部数据
    elseif sType = "function2test" then
        call function2test()          '测试
    else 
		call eerr("function2页里没有动作", request("stype"))
    end if 
end function

'测试
function function2test()
    Call openconn() 		
	'【@是jsp显示@】try{							
    rs.Open "select * from " & db_PREFIX & "webdomain where isdomain=true", conn, 1, 1
	call echo("共",rs.recordcount)
    While Not rs.EOF
		call echo(rs("isdomain"),rs("website"))
	rs.movenext:wend:rs.close
	'【@是jsp显示@】}catch(Exception e){}
end function
'清除全部数据
function fun2_clearAllData()
    Call openconn() 
    conn.Execute("delete from " & db_PREFIX & "webdomain") 
    Call echo("操作完成", "<a href='?act=dispalyManageHandle&actionType=WebDomain&addsql=order by id desc&lableTitle=网站域名'>OK</a>") 
end function
'打印有效网址
function printOKWebSite()	
    Call openconn()
	'【@是jsp显示@】try{
    rs.Open "select * from " & db_PREFIX & "webdomain where isdomain=true", conn, 1, 1 
	call echo("共",rs.recordcount)
    Call echo("操作完成", "<a href='?act=dispalyManageHandle&actionType=WebDomain&addsql=order by id desc&lableTitle=网站域名'>OK</a>") 
    While Not rs.EOF
		'call echo(rs("isdomain"),rs("website"))
		call rw(rs("website") & "<br>")
	rs.movenext:wend:rs.close
	'【@是jsp显示@】}catch(Exception e){}
end function
'打印asp类型网站
function printAspServerWebSite()	
    Call openconn()
	'【@是jsp显示@】try{
    rs.Open "select * from " & db_PREFIX & "webdomain where isasp=true and (isaspx=false and isphp=false)", conn, 1, 1 
	call echo("共",rs.recordcount)
    Call echo("操作完成", "<a href='?act=dispalyManageHandle&actionType=WebDomain&addsql=order by id desc&lableTitle=网站域名'>OK</a>") 
    While Not rs.EOF
		'call echo(rs("isdomain"),rs("website"))
		call rw(rs("website") & "<br>")
	rs.movenext:wend:rs.close
	'【@是jsp显示@】}catch(Exception e){}
end function

'让审核全部为真
function isthroughTrue()
    Call openconn() 
    conn.Execute("update " & db_PREFIX & "webdomain set isthrough=true") 
    Call echo("操作完成", "<a href='?act=dispalyManageHandle&actionType=WebDomain&addsql=order by id desc&lableTitle=网站域名'>OK</a>") 
end function

'扫描首页大小
Function scanDomainHomePageSize()
    Dim url, nSetTime, isdomain, htmlDir, txtFilePath,homePageList,nThis,nCount
	dim splstr,s,c,website,nState,longWebSize,content,startTime,webtitle,webkeywords,webdescription
	  
	if request("nThis")="" then
		nThis=0
	else
		nThis=request("nThis")
	end if
	
    nSetTime = 3 
    Call openconn() 
	'【@是jsp显示@】try{
    rs.Open "select * from " & db_PREFIX & "webdomain where website<>'' and websize=0 and isdomain=true", conn, 1, 1 
	
	if request("nCount")="" then
		nCount=rs.recordcount
	else
		nCount=request("nCount")
	end if
    While Not rs.EOF
		nThis=nThis+1 
        Call echo(nThis & "/" & nCount, rs("website")) 
        doevents 
        htmlDir = "/../网站UrlScan/域名首页大小/"
        Call createDirFolder(htmlDir) 
        txtFilePath = htmlDir & "/" & setFileName(rs("website")) & ".txt"
        If checkFile(txtFilePath) = True Then 
            Call echo("类型", "本地") 
			nSetTime=1
        Else
			website=getwebsite(rs("website"))
			if website="" then
				call eerr("域名为空",website)
			end if
		 	content=getHttpPage(website,rs("charset"))
	        '【PHP】$content=toGB2312Char($content);                                            //给PHP用，转成gb2312字符
			if content="" then
				content=" "
			end if
			
            Call createFile(txtFilePath, content)
            Call echo("类型", "网络") 
        End If 
		content=readFile(txtFilePath,"")
		webtitle=getHtmlValue(content,"webtitle")
		webkeywords=getHtmlValue(content,"webkeywords")
		webdescription=getHtmlValue(content,"webdescription")
		
		
		longWebSize=getfsize(txtFilePath)
		call echo("webtitle",webtitle)
        '这样写是给转PHP时方便
        conn.Execute("update " & db_PREFIX & "webdomain  set webtitle='"& ADSql(webtitle) &"',webkeywords='"& webkeywords &"',webdescription='"& webdescription &"',websize="& longWebSize &",isthrough=false,updatetime='" & Now() & "'  where id=" & rs("id") & "")

		
		if request("startTime")="" then
			startTime=now()
		else
			startTime=request("startTime")
		end if
		
		call rw(VBRunTimer(startTime) & "<hr>")
        url = getUrlAddToParam(getThisUrl(), "?nThis="& nThis &"&nCount="& nCount &"&startTime="& startTime &"&N=" & getRnd(11), "replace") 
 
        Call rw(jsTiming(url, nSetTime)) 
        Response.End() 
    rs.MoveNext : Wend : rs.Close 
	'【@是jsp显示@】}catch(Exception e){}
    Call echo("操作完成", "<a href='?act=dispalyManageHandle&actionType=WebDomain&addsql=order by id desc&lableTitle=网站域名'>OK，共("& nThis &")条</a>") 
End Function 

'扫描域名首页
Function scanDomainHomePage()
    Dim url, nSetTime, isdomain, htmlDir, txtFilePath,homePageList,nThis,nCount
	dim splstr,s,c,website,nState,startTime
	dim nIsAsp,nIsAspx,nIsPhp,nIsJsp,c2
	nIsAsp=0:nIsAspx=0:nIsPhp=0:nIsJsp=0
 
	if request("nThis")="" then
		nThis=0
	else
		nThis=request("nThis")
	end if
	
    nSetTime = 3 
    Call openconn() 
	'【@是jsp显示@】try{
    rs.Open "select * from " & db_PREFIX & "webdomain where website<>'' and homepagelist='' and isdomain=true", conn, 1, 1 
	
	if request("nCount")="" then
		nCount=rs.recordcount
	else
		nCount=request("nCount")
	end if
    While Not rs.EOF
		nThis=nThis+1 
        Call echo(nThis & "/" & nCount, rs("website")) 
        doevents 
        htmlDir = "/../网站UrlScan/域名首页/"
        Call createDirFolder(htmlDir) 
        txtFilePath = htmlDir & "/" & setFileName(rs("website")) & ".txt"
        If checkFile(txtFilePath) = True Then
            c = phptrim(readFile(txtFilePath,""))
			nIsAsp=cint(getstrcut(c,"isAsp=",vbcrlf,1))
			nIsAspx=cint(getstrcut(c,"isAspx=",vbcrlf,1))
			nIsPhp=cint(getstrcut(c,"isPhp=",vbcrlf,1))
			nIsJsp=cint(getstrcut(c,"isJsp=",vbcrlf,1))
            Call echo("类型", "本地") 
			nSetTime=1
        Else
			website=getwebsite(rs("website"))
			if website="" then
				call eerr("域名为空",website)
			end if
			splstr=split("index.asp|index.aspx|index.php|index.jsp|index.htm|index.html|default.asp|default.aspx|default.jsp|default.htm|default.html","|")
			c2=""
			homePageList=""
			for each s in splstr
				url=website & s
				nState=getHttpUrlState(url)
				call echo(url,nState & "   ("& getHttpUrlStateAbout(nState) &")")
				doevents
				if (s="index.asp" or s="default.asp") and (nState=200 or nState=302) then
					nIsAsp=1
				elseif (s="index.aspx" or s="default.aspx") and (nState=200 or nState=302) then
					nIsAspx=1
				elseif (s="index.php" or s="default.php") and (nState=200 or nState=302) then
					nIsPhp=1
				elseif (s="index.jsp" or s="default.jsp") and (nState=200 or nState=302) then
					nIsJsp=1
				end if
				if nState=200 or nState=302 then
					homePageList=homePageList & s & "|"
				end if
				c2=c2 & s & "=" & nState & vbcrlf
			next
			c= "isAsp=" & nIsAsp & vbcrlf
			c= c & "isAspx=" & nIsAspx & vbcrlf
			c= c & "isPhp=" & nIsPhp & vbcrlf
			c= c & "isJsp=" & nIsJsp & vbcrlf & c2
			
			if homePageList="" then
				homePageList="无"
			end if
			
            Call createFile(txtFilePath, c) 
            Call echo("类型", "网络") 
        End If 
        '这样写是给转PHP时方便
        conn.Execute("update " & db_PREFIX & "webdomain  set isasp="& nIsAsp &",isaspx="& nIsAspx &",isphp="& nIsPhp &",isjsp="& nIsJsp &",isthrough=false,homepagelist='"& homePageList &"',updatetime='" & Now() & "'  where id=" & rs("id") & "") 

		if request("startTime")="" then
			startTime=now()
		else
			startTime=request("startTime")		
		end if
		
		call rw(VBRunTimer(startTime) & "<hr>")
        url = getUrlAddToParam(getThisUrl(), "?nThis="& nThis &"&nCount="& nCount &"&startTime="& startTime &"&N=" & getRnd(11), "replace") 
 
        Call rw(jsTiming(url, nSetTime)) 
        Response.End() 
    rs.MoveNext : Wend : rs.Close 
	'【@是jsp显示@】}catch(Exception e){}
    Call echo("操作完成", "<a href='?act=dispalyManageHandle&actionType=WebDomain&addsql=order by id desc&lableTitle=网站域名'>OK，共("& nThis &")条</a>") 
End Function 

'批量导入域名
Function bantchImportDomain()
    Dim content, splStr, url, webSite, nOK 
    content = LCase(Request.Form("bodycontent")) 
    splStr = Split(content, vbCrLf) 
    nOK = 0 
    Call openconn() 
    For Each url In splStr
        webSite = getwebsite(url) 
        If webSite <> "" Then
			'【@是jsp显示@】try{
            rs.Open "select * from " & db_PREFIX & "webdomain where website='" & webSite & "'", conn, 1, 1 
            If rs.EOF Then
                conn.Execute("insert into " & db_PREFIX & "webdomain(website,isthrough,isdomain) values('" & webSite & "',true,false)") 
                Call echo("添加成功", webSite) 
                nOK = nOK + 1 
            Else
                Call echo("website", webSite) 
            End If : rs.Close 
			'【@是jsp显示@】}catch(Exception e){}
        End If 
    Next 
    Call echo("操作完成", "<a href='?act=dispalyManageHandle&actionType=WebDomain&addsql=order by id desc&lableTitle=网站域名'>OK 共(" & nOK & ")条</a>") 
End Function 

'检测域名有效
Function scanCheckDomain()
    Dim url, nSetTime, nIsDomain, htmlDir, txtFilePath, nThis,nCount,startTime
    nSetTime = 3 
	if request("nThis")="" then
		nThis=0
	else
		nThis=request("nThis")
	end if
    Call openconn()
	'【@是jsp显示@】try{
    rs.Open "select * from " & db_PREFIX & "webdomain where isthrough=true", conn, 1, 1 
	
	if request("nCount")="" then
		nCount=rs.recordcount
	else
		nCount=request("nCount")
	end if
    While Not rs.EOF
		nThis=nThis+1
        Call echo(nThis & "/" & nCount, rs("website")) 
        doevents 
        htmlDir = "/../网站UrlScan/域名/"
        Call createDirFolder(htmlDir) 
        txtFilePath = htmlDir & "/" & setFileName(rs("website")) & ".txt"
        If checkFile(txtFilePath) = True Then
            nIsDomain = cint(phptrim(readFile(txtFilePath,"")))
            Call echo("类型", "本地") 
			nSetTime=1
        Else
            nIsDomain = IIF(checkDomainName(rs("website")), 1, 0) 
            Call createFile(txtFilePath, nIsDomain & " ") 			'防止PHP版写入不进去 0 这个内容
            Call echo("类型", "网络" & txtFilePath & "("& checkFile(txtFilePath) &")=" & nIsDomain) 
        End If 
        '这样写是给转PHP时方便
        conn.Execute("update " & db_PREFIX & "webdomain  set isthrough=false,isdomain=" & nIsDomain & ",updatetime='" & Now() & "'  where id=" & rs("id") & "") 

		if request("startTime")="" then
			startTime=now()
		else
			startTime=request("startTime")
		end if
		
		call rw(VBRunTimer(startTime) & "<hr>")
        url = getUrlAddToParam(getThisUrl(), "?nThis="& nThis &"&nCount="& nCount &"&startTime="& startTime &"&N=" & getRnd(11), "replace") 
		
        Call rw(jsTiming(url, nSetTime)) 
        Response.End() 
    rs.MoveNext : Wend : rs.Close 
	'【@是jsp显示@】}catch(Exception e){}
    Call echo("操作完成", "<a href='?act=dispalyManageHandle&actionType=WebDomain&addsql=order by id desc&lableTitle=网站域名'>OK，共("& nThis &")条</a>") 
End Function 

'扫描网址
Function runScanWebUrl()
    Dim nSetTime, setCharSet, httpUrl, url, selectWeb ,nThis,nCount,startTime
    setCharSet = "gb2312"                                                           'gb2312
    'http://www.dfz9.com/
    'http://www.maiside.net/
    'http://sharembweb.com/
    'http://www.ufoer.com/
    httpUrl = "http://sharembweb.com/" 
    'selectWeb="ufoer"
    If selectWeb = "ufoer" Then
        httpUrl = "http://www.ufoer.com/" 
        setCharSet = "utf-8" 
    End If
	 
	if request("nThis")="" then
		nThis=0
	else
		nThis=request("nThis")
	end if
	
    Call openconn() 
	'【@是jsp显示@】try{
    rs.Open "select * from " & db_PREFIX & "weburlscan", conn, 1, 1 	
	if request("nCount")="" then
		nCount=rs.recordcount
	else
		nCount=request("nCount")
	end if
    If rs.EOF Then
        conn.Execute("insert into " & db_PREFIX & "weburlscan(httpurl,title,isthrough,charset) values('" & httpUrl & "','home',true,'" & setCharSet & "')") 
    End If : rs.Close 
	'【@是jsp显示@】}catch(Exception e){} 
    '循环
	'【@是jsp显示@】try{
    rsx.Open "select * from " & db_PREFIX & "weburlscan where isThrough=true", conn, 1, 1 
    If Not rsx.EOF Then
		nThis=nThis+1
        Call echo(nThis,  rsx("httpurl"))  
        doevents 
        nSetTime = scanUrl(rsx("httpurl"), rsx("title"), rsx("charset")) 
        '这样写是给转PHP时方便
        conn.Execute("update " & db_PREFIX & "weburlscan  set isthrough=false  where id=" & rsx("id") & "") 

		
		if request("startTime")="" then
			startTime=now()
		else
			startTime=request("startTime")
		end if
		
		call VBRunTimer(startTime)
        url = getUrlAddToParam(getThisUrl(), "?nThis="& nThis &"&nCount="& nCount &"&startTime="& startTime &"&N=" & getRnd(11), "replace") 

        Call rw(jsTiming(url, nSetTime)) 
        Response.End()
    End If : rsx.Close  
	'【@是jsp显示@】}catch(Exception e){}
    Call echo("操作完成", "<a href='?act=dispalyManageHandle&actionType=WebUrlScan&addsql=order by id desc&lableTitle=网址扫描'>OK，共("& nThis &")条</a>") 
    '输入报告
	'【@是jsp显示@】try{
    rs.Open "select * from " & db_PREFIX & "weburlscan where webstate=404", conn, 1, 1 
    While Not rs.EOF
        Call echo("<a href='" & rs("httpurl") & "' target='_blank'>" & rs("httpurl") & "</a>", "<a href='" & rs("tohttpurl") & "' target='_blank'>" & rs("tohttpurl") & "</a>") 
    rs.MoveNext : Wend : rs.Close 
	'【@是jsp显示@】}catch(Exception e){}
End Function 
'扫描网址
Function scanUrl(httpUrl, toTitle, codeset)
    Dim splStr, i, s, content, PubAHrefList, PubATitleList, splUrl, spltitle, title, url, htmlDir, htmlFilePath, nOK, arrayData, nWebState, u, iniDir, iniFilePath ,longWebSize
    Dim nSetTime, startTime, longOpenSpeed, isLocal, nIsThrough
    htmlDir = "/../网站UrlScan/" & setFileName(getwebsite(httpUrl)) 
    Call createDirFolder(htmlDir) 
    htmlFilePath = htmlDir & "/" & setFileName(httpUrl) & ".html" 
    iniDir = htmlDir & "/conifg" 
    Call createfolder(iniDir) 
    iniFilePath = iniDir & "/" & setFileName(httpUrl) & ".txt" 

    'httpurl="http://maiside.net/"

    nWebState = 0 
    nSetTime = 1 
    longOpenSpeed = 0 
    If checkFile(htmlFilePath) = False Then
        startTime = Now() 
        Call echo("codeset", codeset) 
        arrayData = handleXmlGet(httpUrl, codeset) 
        content = arrayData(0) 
        '【PHP】$content=toGB2312Char($content);                                            //给PHP用，转成gb2312字符

        nWebState = cint(arrayData(1)) 
        longOpenSpeed = DateDiff("s", startTime, Now()) 
        'content=gethttpurl(httpurl,codeset)
        'call createfile(htmlFilePath,content)
        Call writeToFile(htmlFilePath, content, codeset) 
        Call createFile(iniFilePath, nWebState & vbCrLf & longOpenSpeed) 
        nSetTime = 3 
        isLocal = false
    Else
        'content=readFile(htmlFilePath,"")
        content = readFile(htmlFilePath, codeset) 
		 '【PHP】$content=toGB2312Char($content);                                            //给PHP用，转成gb2312字符
        splStr = Split(readFile(iniFilePath,""), vbCrLf) 
        nWebState = CInt(splStr(0)) 
        longOpenSpeed = CInt(splStr(0)) 
        isLocal = true 
    End If 
	longWebSize=getFSize(htmlFilePath)
    Call echo("isLocal", isLocal) 
	'【@是jsp显示@】try{
    rs.Open "select * from " & db_PREFIX & "weburlscan where httpurl='" & httpUrl & "'", conn, 1, 1 
    If rs.EOF Then
        conn.Execute("insert into " & db_PREFIX & "weburlscan(httpurl,title,charset) values('" & httpUrl & "','" & toTitle & "','" & codeset & "')") 
    End If : rs.Close 
	'【@是jsp显示@】}catch(Exception e){} 
    conn.Execute("update " & db_PREFIX & "weburlscan  set webstate=" & nWebState & ",websize=" & longWebSize & ",openspeed=" & longOpenSpeed & ",charset='" & codeset & "'  where httpurl='" & httpUrl & "'") 

	'strLen(content)  不用这个，不精准

    s = getContentAHref("", content, PubAHrefList, PubATitleList) 
    s = handleScanUrlList(httpUrl, s) 

    'call echo("httpurl",httpurl)
    'call echo("s",s)
    'call echo("PubATitleList",PubATitleList)
    nOK = 0 
    splUrl = Split(PubAHrefList, vbCrLf) 
    spltitle = Split(PubATitleList, vbCrLf) 
    For i = 1 To UBound(splUrl)
        title = spltitle(i) 
        url = splUrl(i) 
        '去掉#号后台的字符20160506
        If InStr(url, "#") > 0 Then
            url = Mid(url, 1, InStr(url, "#") - 1) 
        End If 
        If url = "" Then
            If title <> "" Then
                Call echo("网址为空", title) 
            End If 
        Else
            url = handleScanUrlList(httpUrl, url) 
            url = handleWithWebSiteList(httpUrl, url) 
            If url <> "" Then
				'【@是jsp显示@】try{
                rs.Open "select * from " & db_PREFIX & "weburlscan where httpurl='" & url & "'", conn, 1, 1 
                If rs.EOF Then
                    u = LCase(url)
                    If InStr(u, "tools/downfile.asp") > 0 Or InStr(u, "/url.asp?") > 0 Or InStr(u, "/aspweb.asp?") > 0 Or InStr(u, "/phpweb.php?") > 0 Or u = "http://www.maiside.net/qq/" Or InStr(u, "mailto:") > 0 Or InStr(u, "tel:") > 0 Or InStr(u, ".html?replytocom") > 0 Then'.html?replytocom  王通网站
                        nIsThrough = 0 
                    Else
                        nIsThrough = 1 '不用true 因为写入数据会有问题
                    End If 
                    conn.Execute("insert into " & db_PREFIX & "weburlscan(tohttpurl,totitle,httpurl,title,isthrough,charset) values('" & httpUrl & "','" & toTitle & "','" & url & "','" & Left(title, 255) & "'," & nIsThrough & ",'" & codeset & "')") 
                    nOK = nOK + 1 
                    Call echo(i, url) 
                Else
                    Call echo(title, url) 
                End If : rs.Close 
				'【@是jsp显示@】}catch(Exception e){} 
            End If 
        End If 
    Next
	
    scanUrl = nSetTime 
End Function 


%>                  

