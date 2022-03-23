<% 
'URL 网址处理 (2013,9,27)   111

'byref PubAHrefList, byref PubATitleList   为为什么要加上byref  是因为在转PHP时需要这个判断，请明它是地址传递 是关联变量

'NOVBNet start
'使用手册 
'call echo("'获得当前网址第一种（getUrl）",getUrl())
'call echo("'获得当前网址第二种（getThisUrl）",getThisUrl())
'call echo("'获得当前网址无参数（getThisUrlNoParam）",getThisUrlNoParam())
'call echo("'获得来访网址（getGoToUrl）",getGoToUrl())
'call echo("'获得来访网址无参数（getGoToUrlNoParam）",getGoToUrlNoParam()) 
'call echo("'获得来访网址无文件名称（getGoToUrlNoFileName）",getGoToUrlNoFileName())
'call echo("'域名（webDoMain）",webDoMain())
'call echo("'主机（host）",host())
'call echo("'获得当前网址加参数（getUrlAddToParam）",getUrlAddToParam(getUrl(), "PageSize=20", "replace"))

  
'获得当前网址第一种（getUrl）：http://127.0.0.1/atemp.asp?act=1
'获得当前网址第二种（getThisUrl）：http://127.0.0.1/atemp.asp?act=1
'获得当前网址无参数（getThisUrlNoParam）：http://127.0.0.1/atemp.asp
'获得来访网址（getGoToUrl）：http://127.0.0.1/5.asp?act=5&aa=aa&bb=bb
'获得来访网址无参数（getGoToUrlNoParam）：http://127.0.0.1/5.asp
'获得来访网址无文件名称（getGoToUrlNoFileName）：http://127.0.0.1/
'域名（webDoMain）：http://127.0.0.1
'主机（host）：http://127.0.0.1/
'获得当前网址加参数（GetUrlAddToParam）：http://127.0.0.1/atemp.asp?PageSize=20&act=1
'getThisUrlFileName()    : 4.asp
'getThisUrlFileParam()    : 4.asp?act=11
'getUrlDirName()			/app/1.asp		返回	app

'Url = getUrlAddToParam("http://www.baidu.com/?a=1&b=2&c=3","?a=11&b=22&c=333","")        'http://www.baidu.com/?a=1&b=2&c=3
'Url = getUrlAddToParam("http://www.baidu.com/?a=1&b=2&c=3","?a=11&b=22&c=333","replace")        'http://www.baidu.com/?a=11&b=22&c=333

'获得URL中目录名称 20171104
function getUrlDirName()
	dim url,splxx,s,sDirName
	url=request.serverVariables("script_name")
	splxx=split(url,"/")
	for each s in splxx
		if s <>"" and instr(s,".")=false then
			sDirName=s
		end if
	next
	getUrlDirName=sDirName
end function

'获得当前网后的文件名与参数
function getThisUrlFileParam()
    dim url 
    url = getUrl() 
    url = mid(url, inStrRev(url, "/") + 1) 
    getThisUrlFileParam = url 
end function 

'获得当前网址无参数
function getThisUrlNoParam()
    dim httpType 
    if LCase(request.serverVariables("HTTPS")) = "off" then
        httpType = "http://" 
    else
        httpType = "https://" 
    end if 
    getThisUrlNoParam = httpType & request.serverVariables("HTTP_HOST") & request.serverVariables("SCRIPT_NAME") 
end function 

'获得传过来网址
function getGoToUrl()
    getGoToUrl = request.serverVariables("HTTP_REFERER") 
end function 

'获得传过来网址 无参数
function getGoToUrlNoParam()
    dim url 
    url = getGoToUrl() 
    if inStr(url, "?") > 0 then
        url = mid(url, 1, inStr(url, "?") - 1) 
    end if 
    getGoToUrlNoParam = url 
end function 

'获得传过来网址 无文件名称
function getGoToUrlNoFileName()
    dim url 
    url = getGoToUrl() 
    if right(url, 1) <> "/" then
        if inStrRev(url, "/") > 0 then
            url = mid(getGoToUrlNoParam(), 1, inStrRev(getGoToUrlNoParam(), "/")) 
        end if 
    end if 
    if right(url, 1) <> "/" then url = url & "/" 
    getGoToUrlNoFileName = url 
end function 
'移除网址文件名部分
function remoteUrlFileName(byval url)
    if right(url, 1) <> "/" then
        if inStrRev(url, "/") > 0 then
            url = mid(url, 1, inStrRev(url, "/")) 
        end if 
    end if 
    remoteUrlFileName = url 
end function 
'移除网址参数部分
function remoteUrlParam(byval url)
    if right(url, 1) <> "?" then
        if inStrRev(url, "?") > 0 then
            url = mid(url, 1, inStrRev(url, "?") - 1) 
        end if 
    end if 
    remoteUrlParam = url 
end function 
'获得网址目录部分
function getUrlDir(byval url)
    getUrlDir = getHandleUrlValue(url, "网址目录") 
end function 
 
'获取客户端IP地址第二种 
function getIP2()
    on error resume next 
    dim x, y, addr 
    x = request.serverVariables("HTTP_X_FORWARDED_FOR") 
    y = request.serverVariables("REMOTE_ADDR") 
    addr = IIF(isNul(x) or LCase(x) = "unknown", y, x) 
    if inStr(addr, ".") = 0 then addr = "0.0.0.0" 
    getIP2 = addr 
end function 

'获取IP地址 别人写得好像很专业一样 很全
function getIP()
    on error resume next 
    dim strIPAddr 
    if request.serverVariables("HTTP_X_FORWARDED_FOR") = "" or inStr(request.serverVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 then
        strIPAddr = request.serverVariables("REMOTE_ADDR") 
    elseIf inStr(request.serverVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 then
        strIPAddr = mid(request.serverVariables("HTTP_X_FORWARDED_FOR"), 1, inStr(request.serverVariables("HTTP_X_FORWARDED_FOR"), ",") - 1) 
    elseIf inStr(request.serverVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 then
        strIPAddr = mid(request.serverVariables("HTTP_X_FORWARDED_FOR"), 1, inStr(request.serverVariables("HTTP_X_FORWARDED_FOR"), ";") - 1) 
    else
        strIPAddr = request.serverVariables("HTTP_X_FORWARDED_FOR") 
    end if 
    getIP = trim(mid(strIPAddr, 1, 30)) 
end function 

'获得服务器IP
function getServicerIP()
    getServicerIP = request.serverVariables("LOCAL_ADDR") 
end function 
 

'获得服务器IP   辅助
function getRemoteIP()
    getRemoteIP = getServicerIP() 
end function 


'NOVBNet end


'获得处理后url值 20160701
function getHandleUrlValue(byval url, byval sType)
    sType = "|" & sType & "|" 
    if instr(url, "://") > 0 then
        url = mid(url, instr(url, "://") + 3) 
    end if 
    '去掉域名
    if instr(url, "/") > 0 then
        url = mid(url, instr(url, "/") + 1) 
    end if 

    if instr(sType, "|网址目录|") > 0 then
        if instr(url, "/") > 0 then
            url = mid(url, 1, instrrev(url, "/") - 1) 
        end if 
    else
        if instr(url, "/") > 0 then
            url = mid(url, instrrev(url, "/") + 1) 
        end if 
        if instr(url, "?") > 0 then
            url = mid(url, 1, instr(url, "?") - 1) 
        end if 
    end if 
    if instr(sType, "|名称|") > 0 or instr(sType, "|name|") > 0 then
        if instr(url, ".") > 0 then
            url = mid(url, 1, instrrev(url, ".") - 1) 
        end if 
    end if 
    getHandleUrlValue = url 
end function 

'处理网址\转/  '待完善
function handleHttpUrl(httpurl)
    dim headStr, url 
	handleHttpUrl=""
    if isNul(httpurl) then exit function                                            '为空则退出
    httpurl = replace(trim(httpurl), "\", "/") 
    headStr = mid(httpurl, 1, inStr(httpurl, ":") + 2) 
    httpurl = mid(httpurl, inStr(httpurl, ":") + 3) 
    httpurl = replace(httpurl, "http://", "【|http|】") 
    httpurl = replace(httpurl, "https://", "【|https|】") 
    httpurl = replace(httpurl, "ftp://", "【|ftp|】") 

    while inStr(httpurl, "//") > 0
        httpurl = replace(httpurl, "//", "/") 
    wend 
    httpurl = replace(httpurl, "【|http|】", "http://") 
    httpurl = replace(httpurl, "【|https|】", "https://") 
    httpurl = replace(httpurl, "【|ftp|】", "ftp://") 

    url = headStr & httpurl 
    '/"http://www.qibosoft.com/images/qibosoft/loading.gif/"
    if left(url, 2) = "/""" then
        url = mid(url, 3) 
    end if 
    if right(url, 2) = "/""" then
        url = mid(url, 1, len(url) - 2) 
    end if 
    handleHttpUrl = url 
end function 

'处理文件/转\   使用了While判断，再完善
function handleFileUrl(fileUrl)
	if isNull(fileUrl) then
		handleFileUrl=""
		exit function
	end if
    fileUrl = replace(fileUrl, "/", "\") 
    dim i 
    for i = 1 to 99
        fileUrl = replace(fileUrl, "\\", "\") 

        if inStr(fileUrl, "\\") = 0 then
            exit for 
        end if 
    next 
    handleFileUrl = fileUrl  
end function 

'处理网址完善性
function handleUrlComplete(httpurl)
    dim lastStr 
    handleUrlComplete = httpurl 
    if inStr(httpurl, "?") > 0 then exit function                                   '有?符号则退出
    '网址最后没有/  判断如果为域名 则在最后加上/退出
    if right(httpurl, 1) <> "/" then
        if getWebSite(httpurl)=httpurl & "/" then
            handleUrlComplete = httpurl & "/" 
            exit function 
        end if 
    end if 
    lastStr = mid(httpurl, inStrRev(httpurl, "/") + 1) 
    if lastStr <> "" and inStr(lastStr, ".") = 0 then
        handleUrlComplete = httpurl & "/" 
    end if 
end function 

'给网址添加域名
function urlAddHttpUrl(httpurl, url)
    httpurl = replace(httpurl, "\", "/") 
    url = handleHttpUrl(url) 
    if inStr(LCase(url), "http://") = 0 and inStr(LCase(url), "www.") = 0 then
        if right(httpurl, 1) = "/" and left(url, 1) = "/" then
            url = httpurl & mid(url, 2) 
        elseIf right(httpurl, 1) <> "/" and left(url, 1) <> "/" then
            url = httpurl & "/" & url 
        else
            url = httpurl & url 
        end if 
    end if 
    urlAddHttpUrl = url  
end function 
'获得主机端口号
function getPort()
    dim port 
    port = CStr(request.serverVariables("SERVER_PORT")) 
    if port <> "80" and port <> "8080" and port<>"" then
        port = ":" & port 
    else
        port = "" 
    end if 
    getPort = port 
end function 

'获得域名
function webDoMain()
    webDoMain = "http://" & request.serverVariables("SERVER_NAME") & getPort() 
end function 

'获得当前域名
function host()
    host = "http://" & request.serverVariables("HTTP_HOST") & "/" 
end function 

'获得当前域名 (辅助)
function httpHost()
    httpHost = host() 
end function 

'获得当前域名 (辅助)
function getHost()
    getHost = host() 
end function 

'网得当前网址
function getUrl()
    getUrl = getThisUrl() 
'GetUrl = WebDoMain() & Request.ServerVariables("SCRIPT_NAME") & Request.ServerVariables("QUERY_STRING")
end function 

'获得当前带参数网址
function getThisUrl()
    dim url 
    'vbdel start
    url = request.serverVariables("server_name") 
    'PHP版上面直接获得端口
    if inStr(url, ":") = 0 then
        url = url & getPort() 
    end if 
    url = url & request.serverVariables("script_name") 
    if request.serverVariables("QUERY_STRING") <> "" then url = url & "?" & request.serverVariables("QUERY_STRING") 
    'vbdel end
    getThisUrl = "http://" & url 
end function 
'获得当前无文件名称网址
function getThisUrlNoFileName()
    dim url 
    url = getThisUrl() 
    if right(url, 1) <> "/" then
        if inStrRev(url, "/") > 0 then
            url = mid(url, 1, inStrRev(url, "/")) 
        end if 
    end if 
    getThisUrlNoFileName = url 
end function 

'获得网址域名名称 http://www.aaa.bb.mywebname.com/   mywebname
function getWebSiteName(byval url) 
	dim splstr,s,c,nLen
	c = ".com.hk|.sh.cn|.com.cn|.net.cn|.org.cn" 
    c = c & "|.com|.net|.org|.tv|.cc|.info|.cn|.tw|:81|:99|.biz|.mobi|.hk|.us|.la|.gl|.in|.top|.win|.vip|.pw|.me|.wiki|.co|.io|.lu|.im|.love|.xyz|.wang" 
    splStr = split(c, "|") 
	url=url & "/"
    for each s in splStr
        if s <> "" then
			s=s & "/"
			nLen=inStr(url, s)
            if  nLen> 0 then
                url = mid(url,1,nLen-1)
				exit for
            end if 
        end if 
    next
	nLen=instr(url,"www.")
	if nLen>0 then
		url=mid(url,nLen+4)
	end if
	nLen=instr(url,"://")
	if nLen>0 then
		url=mid(url,nLen+3)
	end if
	getWebSiteName=url
end function
'获得域名完整域名如  www.sharembweb.com 
function getWebSiteCleanName(byVal httpurl)
	dim url,nLen
	url=getWebSite(httpurl)
	nLen=instr(url,"://")
	if nLen>0 then
		url=mid(url,nLen+3)
	end if
	url=replace(url,"/","")
	url=replace(url,":","-")	'20190415对以Ip为地址的网址处理
	getWebSiteCleanName=url
end function

'分析网址 获得域名
function getWebSite(byVal httpurl)
    'On Error Resume Next
    '新版获得域名方法
    dim url, tempHttpUrl, is_WebSite, httpHead 
	getWebSite=""
	httpurl=replace(replace(replace(httpurl," ",""),vbtab,""),"&#x2f;","/")
    tempHttpUrl = httpurl 
    url = trim(LCase(replace(httpurl, "?", "/"))) 
    url = replace(replace(url, "\", "/"), "http://", "") 
    if inStr(url, "/") > 0 then url = mid(url, 1, inStr(url, "/") - 1) 
    url = "http://" & url & "/" 
    dim splStr, s, c 
    httpurl = replace(LCase(httpurl), "http://", "") 
    httpHead = "http://" 
    '增加了https://这种安全请求方式  20160526
    if instr(LCase(httpurl), "https://") > 0 then
        httpurl = replace(LCase(httpurl), "https://", "") 
        httpHead = "https://" 
    end if 
    '删除/后台的值20160526
    if instr(httpurl, "/") > 0 then
        httpurl = mid(httpurl, 1, instr(httpurl, "/") - 1) 
    end if 
    if inStr(httpurl, "?") > 0 then httpurl = mid(httpurl, 1, inStr(httpurl, "?") - 1) 
    if left(httpurl, 9) = "localhost" then
        if inStr(httpurl, "/") > 0 then
            httpurl = mid(httpurl, 1, inStr(httpurl, "/") - 1) 
        else
            httpurl = "localhost" 
        end if 
    elseIf left(httpurl, 8) = "192.168." or left(httpurl, 9) = "127.0.0.1" or ubound(split(httpurl,"."))=3 then		'对以IP为地址的也处理20190415
        httpurl = httpurl & "/" 
        httpurl =httpHead & mid(httpurl, 1, inStr(httpurl, "/") - 1) & "/" 
        getWebSite = httpurl : exit function 
    else
        splStr = split(httpurl, ".") 
        if(inStr(httpurl, "www.") > 0 and uBound(splStr) >= 2) or uBound(splStr) >= 1 then
            if inStr(httpurl, "/") > 0 then
                s = mid(httpurl, 1, inStr(httpurl, "/") - 1) 
                if s = getDianNumb(s) then
                    httpurl = s 
                end if 
            end if 
        else
            httpurl = ""                                                                    '没有则为空
        end if 
    end if 
    is_WebSite = false                                                              '是域名为假
    c = ".com.hk|.sh.cn|.com.cn|.net.cn|.org.cn" 
    c = c & "|.com|.net|.org|.tv|.cc|.info|.cn|.tw|:81|:99|.biz|.mobi|.hk|.us|.la|.gl|.in|.top|.win|.vip|.pw|.me|.wiki|.co|.io|.lu|.im|.love|.xyz|.wang" 
    splStr = split(c, "|") 
	httpurl=httpurl & "/"
    for each s in splStr
        if s <> "" then
			s=s & "/"
            if inStr(httpurl, s) > 0 then
                httpurl = httpHead & left(httpurl, inStr(httpurl, s) + len(s) - 1) : is_WebSite = true : exit for 
            end if 
        end if 
    next 
    getWebSite = left(httpurl, 255)                                                 '域名不存在，则只截取255个字符
    'GetWebSite = ""                        '域名不存在则为空 20150104
    if getWebSite = "http:///" then getWebSite = ""                                 '没有找到域名
 

    if is_WebSite = false then
        getWebSite = "" 
	elseif instr(getWebSite,",") or instr(getWebSite,"。")>0 then
        getWebSite = "" 
    end if 


end function 
'检测是否为网址
function checkUrl(url)
    checkUrl = IIF(getWebSite(url) = "", false, true) 
end function 
'检测是否为网址
function checkHttpUrl(url)
    checkHttpUrl = checkUrl(url) 
end function 
'检测是否为网址
function isUrl(url)
    isUrl = checkUrl(url) 
end function 
'检测是否为网址
function isHttpUrl(url)
    isHttpUrl = checkUrl(url)  
end function 




'批量处理 完整网址 20160929
function batchFullHttpUrl(httpurl,content)
	dim splstr,s,c
	splstr=split(content,vbcrlf) 
	for each s in splstr 
		s=fullHttpUrl(httpurl, s) 
		if c<>"" then
			c=c & vbcrlf
		end if
		c=c & s
	next
	batchFullHttpUrl=c
end function
'完整网址
'对这个处理 style="background: url(20130510162636_96168.jpg) no-repeat scroll center top; height: 426px;cursor:pointer; width: 100%; margin:0 auto;" 20160701  更新于20161112
function fullHttpUrl(byVal httpurl, byVal url)
    'On Error Resume Next:    err.clear                                                                       '清除错误 要不然会报错
	fullHttpUrl=""
    dim rootUrl, thisUrl, splStr, i, s, c, parentUrl, parentParentUrl, parentParentParentUrl, rootWebSite, thisWebSite, isHandle, lCaseUrl 
    dim styleStart, styleEnd 
    httpurl = phpTrim(httpurl)                                                      '清除两边空格
    url = phpTrim(url)                                                              '清除两边空格
    lCaseUrl = lcase(url) 															'小写追加URL
    if url = "" then fullHttpUrl = "" : exit function                               '网址为空退出(20150805)
    if trim(httpurl) = "" then fullHttpUrl = url : exit function                    '主网址为空退出 返回网址
    httpurl = replace(httpurl, "\", "/")                                            '把网址\转/符号
    url = replace(url, "\", "/")                                                    '把网址\转/符号
	 
    '网址前两个字符为//则退出
    if left(url, 2) = "//" then
        fullHttpUrl = "http:" & url 					'加http: 让网址完成
        exit function 	
    end if 
    '处理style样式里背景图片
    url = hanldeStyleBackgroundUrl(url, styleStart, styleEnd) 
    rootUrl = getWebSite(httpurl)                                                   '主域名，也就是主网址
    rootWebSite = rootUrl 														   '主网址
    thisWebSite = getWebSite(url) 													'追加网址域名
    if right(rootUrl, 1) = "/" then rootUrl = left(rootUrl, len(rootUrl) - 1) 
    thisUrl = left(httpurl, inStrRev(httpurl, "/"))                                 '当前网址
    splStr = split(httpurl, "/") 
    for i = 0 to uBound(splStr)
        if i + 1 = uBound(splStr) then parentUrl = c 								'一级
        if i + 2 = uBound(splStr) then parentParentUrl = c 							'二有
        if i + 3 = uBound(splStr) then parentParentParentUrl = c 					'三级
        s = splStr(i) 
        c = c & s & "/"
    next  
    url = trim(url)                                                                 '去除网址左右空格
	
	dim fileName
	fileName=splstr(ubound(splStr))
	if instr("/" & url,"/?")>0 then
		if instr(fileName,"?")>0 then
			fileName=mid(fileName,1,instr(fileName,"?")-1)
			thisUrl=thisUrl & fileName
		elseif instr(fileName,".")>0 then
			thisUrl=thisUrl & fileName
		end if
	end if
	
    isHandle = false                                                               '操作为假
    if url <> "" and inStr(left(url, 10), "www.") = 0 and inStr(left(url, 10), "http://") = 0 and inStr(left(url, 10), "https://") = 0 then
        isHandle = true 
        if rootWebSite <> thisWebSite then
            if rootWebSite = replace(thisWebSite, "http://", "http://www.") then
                isHandle = false 
                if inStr(LCase(url), "http://") > 0 then
                    url = "http://www." & right(url, len(url) - 7) 
                else
                    url = "http://www." & url 
                end if 
            end if 
        end if 
    end if 
    '操作是否为真
    if isHandle = true then
        if left(url, 1) = "/" then
			url=mid(url,2)
			for i=1 to 9
				if left(url,3)<>"../" then
					url="/" & url
					exit for
				end if
				url=mid(url,4)
			next
            url = rootUrl & url
        elseIf left(url, 3) = "../" or left(url, 2) = "./" then
			if left(url, 2) = "./" then
				url=mid(url, 3) 
			end if
			for i=1 to 9
				if left(url,3)<>"../" then 
					exit for
				end if
				if len(thisUrl)<>len(getWebSite(httpurl)) then 
					 thisUrl=mid(thisUrl,1,len(thisUrl)-1)
					 thisUrl=mid(thisUrl,1,instrrev(thisUrl,"/")) 
				end if
				url=mid(url,4)
			next
            url = thisUrl & url 
		else
            url = thisUrl & url 
        end if 
    end if 
    if inStr(LCase(url), "http://") = 0 and inStr(LCase(url), "https://") = 0 then
        if inStr(LCase(httpurl), "http://") > 0 and inStr(LCase(url), "http://") = 0 then
            url = "http://" & url 
        elseIf inStr(LCase(httpurl), "https://") > 0 and inStr(LCase(url), "https://") = 0 then
            url = "https://" & url 
        end if 
    end if
    fullHttpUrl = styleStart & url & styleEnd 
    'if err then call doError(Err.description, "FullHttpUrl 获得域名 完整网址，HttpUrl=" & httpurl & "<hr>Url=" & url )
end function 
'处理样式里背景图片20160701
function hanldeStyleBackgroundUrl(byval url, styleStart, styleEnd)
    dim lCaseUrl 
    url = phpTrim(url)                                                              '清除两边空格
    lCaseUrl = lcase(url) 
    url = replace(url, "\", "/")                                                    '把网址\转/符号
    if(instr(url, "background") > 0 or instr(url, "background-image") > 0) and instr(url, "(") > 0 and instr(url, ")") > 0 then
        styleStart = mid(url, 1, instr(url, "(")) 
        styleEnd = mid(url, instr(url, ")")) 
        url = mid(url, len(styleStart) + 1) 
        url = phptrim(mid(url, 1, instr(url, ")") - 1)) 
        url = replace(replace(url, "'", ""), """", "") 
    end if 
    hanldeStyleBackgroundUrl = url 
end function 
 


'网址特殊字符 简洁处理
function uRLJianJieHandle(byVal url)
    url = replace(url, "&amp;", "&") 
    uRLJianJieHandle = url 
end function 

'URL加密 待完善中。。。。
function urlToAsc(url)
    dim i
	urlToAsc=""
    for i = 1 to len(url)
        urlToAsc = urlToAsc & "%" & hex(ascW(mid(url, i, 1))) 
    next 
end function 


'获得网站标题
function getWebTitle(content)
    getWebTitle = getStrCut(content, "<title>", "</title>", 0) 
end function 

'获得容中网址列表 (缺陷是网址全部小写了20150728)
function getContentAHref(httpurl, content, byref pubAHrefList, byref pubATitleList)
    dim i, s, tempS, lalType, nLen, lalStr, c 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if s = "<" then
            tempS = LCase(mid(content, i)) 
            lalType = LCase(mid(tempS, 1, inStr(tempS, " "))) 
            if lalType = "<a " then
                lalStr = mid(tempS, 1, inStr(tempS, "</") + 2) 
                nLen = len(lalStr) - 1 
                c = c & handleLink(httpurl, lalStr, "href", "", "url", pubAHrefList, pubATitleList) & vbCrLf 
                i = i + nLen 
            end if 
        end if 
        doEvents 
    next 
    if c <> "" then c = left(c, len(c) - 2) 
    getContentAHref = c 
end function 

'获得内容中图片列表
function getContentImgSrc(httpurl, content, byref pubAHrefList, byref pubATitleList)
    dim i, s, tempS, lalType, nLen, lalStr, c 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if s = "<" then
            tempS = LCase(mid(content, i)) 
            lalType = LCase(mid(tempS, 1, inStr(tempS, " "))) 
            if lalType = "<img " then
                lalStr = mid(tempS, 1, inStr(tempS, ">")) 
                nLen = len(lalStr) - 1 
                'Call Echo(I,LalStr)
                c = c & handleLink(httpurl, lalStr, "src", "", "url", pubAHrefList, pubATitleList) & vbCrLf 
                i = i + nLen 
            end if 
        end if 
        doEvents 
    next 
    if c <> "" then c = left(c, len(c) - 2) 
    getContentImgSrc = c 
end function 


'替换内容里全部Js目录 20150722  call rwend(handleConentUrl("/admin/js/", "<script src='aa/js.js' ><script src=""bb/js.js"" >","",""))
function replaceContentJsDir(content, dirPath, byref pubAHrefList, byref pubATitleList)
    dim splStr, s, c 
    splStr = split(content, vbCrLf) 
    for each s in splStr
        if c <> "" then c = c & vbCrLf 
        if inStr(s, "<script ") > 0 and inStr(s, "</"&"script>") > 0 then
            s = handleLink(dirPath, s, "src", "", "replaceDir", pubAHrefList, pubATitleList) 
        end if 
        c = c & s 
    next 
    replaceContentJsDir = c 
end function 



'获得网站目录文件夹名称 \Templates\WeiZhanLue\  得到WeiZhanLue
function getEndUrlHandleName(fileUrl)
    dim url 
    url = replace(trim(fileUrl), "\", "/") 
    if right(url, 1) = "/" then url = mid(url, 1, len(url) - 1) 
    url = mid(url, inStrRev(url, "/") + 1) 
    getEndUrlHandleName = url 
end function 


'获得列表中不同域名列表
function getUrlListInWebSiteList(content)
    dim url, urlList, splStr 
    splStr = split(content, vbCrLf) 
    for each url in splStr
        url = getWebSite(url) 
        if url <> "" and inStr(vbCrLf & urlList & vbCrLf, vbCrLf & url & vbCrLf) = 0 then
            urlList = urlList & url & vbCrLf 
        end if 
        doevents 
    next 
    getUrlListInWebSiteList = urlList 
end function 

'获得当前网址的文件名称
function getThisUrlFileName()
    dim url 
    url = request.serverVariables("SCRIPT_NAME") 
    if left(url, 1) = "/" then url = right(url, len(url) - 1) 
    getThisUrlFileName = url 
end function 

'处理网站HTML中Img    写得不是特别的完善好  Content = HandleWebHtmlImg("/aa/bb/",Content)
function handleWebHtmlImg(rootPath, content, byref pubAHrefList, byref pubATitleList)
    dim imgList, splStr, imgUrl, sNewImgUrl 
    dim startStr, endStr 
    imgList = getContentImgSrc("", content, pubAHrefList, pubATitleList) 
    splStr = split(imgList, vbCrLf) 
    for each imgUrl in splStr
        if imgUrl <> "" then
            sNewImgUrl = handleHttpUrl(imgUrl) 
            if inStr(sNewImgUrl, "/") > 0 then
                sNewImgUrl = mid(sNewImgUrl, inStrRev(sNewImgUrl, "/") + 1) 
            end if 
            sNewImgUrl = rootPath & sNewImgUrl 
            'Call Echo(NewImgUrl,ImgUrl)
            startStr = "src=""" : endStr = """" 
            if inStr(content, startStr) > 0 and inStr(content, endStr) > 0 then
                content = regExp_Replace(content, startStr & imgUrl & endStr, startStr & sNewImgUrl & endStr) 
            end if 
            startStr = "src='" : endStr = "'" 
            if inStr(content, startStr) > 0 and inStr(content, endStr) > 0 then
                content = regExp_Replace(content, startStr & imgUrl & endStr, startStr & sNewImgUrl & endStr) 
            end if 
        end if 
    next 
    handleWebHtmlImg = content 
end function  

'处理网站Css中Img    写得不是特别的完善好  Content = HandleWebHtmlImg("/aa/bb/",Content)
function handleWebCssImg(rootPath, content)
    dim startStr, endStr, imgList, splStr, c, imgUrl, sNewImgUrl 
    startStr = "url\(" 
    endStr = "\)" 
    imgList = getArray(content, startStr, endStr, false, false) 
    'Call RwEnd(ImgList)
    splStr = split(imgList, "$Array$") 
    for each imgUrl in splStr
        if imgUrl <> "" then
            sNewImgUrl = handleHttpUrl(imgUrl) 
            if inStr(sNewImgUrl, "/") > 0 then
                sNewImgUrl = mid(sNewImgUrl, inStrRev(sNewImgUrl, "/") + 1) 
            end if 
            sNewImgUrl = rootPath & sNewImgUrl 
            startStr = "url(" 
            endStr = ")" 
            if inStr(content, startStr) > 0 and inStr(content, endStr) > 0 then
                'call echo(StartStr,"StartStr")
                content = regExp_Replace(content, startStr & imgUrl & endStr, startStr & sNewImgUrl & endStr) 
            end if 
        end if 
    next 
    handleWebCssImg = content 
end function 

'批量处理网址完整性
function batchHandleUrlIntegrity(httpurl, urlList)
    dim splUrl, url, c 
    splUrl = split(urlList, vbCrLf) 
    for each url in splUrl
        if url <> "" then
            url = fullHttpUrl(httpurl, url) 
            if inStr(vbCrLf & c & vbCrLf, vbCrLf & url & vbCrLf) = 0 then
                c = c & url & vbCrLf 
            end if 
        end if 
    next 
    batchHandleUrlIntegrity = c 
end function 

'处理内容中链接图片路径 目录是显示图片
function replaceContentImagePath(rootFolder, content)
    dim imageFile, toImageFile, imageList, splxx 
    rootFolder = handleHttpUrl(rootFolder) 
    if right(rootFolder, 1) <> "/" then rootFolder = rootFolder & "/" 
    imageList = getDirFileNameList(rootFolder, "") 
    splxx = split(imageList, vbCrLf) 
    for each imageFile in splxx
        if imageFile <> "" then
            toImageFile = "file:///" & rootFolder & imageFile 
            'html中图片路径替换
            content = replace(content, """" & imageFile & """", """" & toImageFile & """") 
            content = replace(content, "'" & imageFile & "'", """" & toImageFile & """") 
            content = replace(content, "=" & imageFile & " ", """" & toImageFile & """") 
            content = replace(content, "=" & imageFile & ">", """" & toImageFile & """") 
            'Css中图片路径替换
            content = replace(content, "(" & imageFile & ")", "(" & toImageFile & ")") 
            content = replace(content, "(" & imageFile & ";", "(" & toImageFile & ";") 
        end if 
    next 
    replaceContentImagePath = content 
end function 

'获得Css链接列表 是名称
function getCssLinkList(byVal content)
    dim startStr, endStr, splStr, s, c, fileName 
    startStr = "<link" : endStr = "/>" 
    content = getArray(content, startStr, endStr, false, false) 
    splStr = split(content, "$Array$") 
    for each s in splStr
        if inStr(LCase(s), "stylesheet") > 0 then
            fileName = strCut(s, "href=""", """", 2) 
            call echo(fileName, s) 
            c = c & fileName & vbCrLf 
        end if 
    next 
    getCssLinkList = c 
end function 

'获得Html中图片地址列表
function getHtmlBackGroundUrlList(content)
    dim i, s, yuanStr, tempS, lalType, nLen, lalStr, c, startStr, endStr 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if s = "<" then
            yuanStr = mid(content, i) 
            tempS = LCase(yuanStr) 
            lalStr = mid(yuanStr, 1, inStr(yuanStr, ">")) 
            lalType = LCase(mid(tempS, 1, inStr(tempS, " "))) 
            if inStr(lalStr, "url(") > 0 then
                startStr = "url(" : endStr = ")" 
                c = c & strCut(lalStr, startStr, endStr, 2) & vbCrLf 
                i = i + nLen 
            end if 
        end if 
        doEvents 
    next 
    getHtmlBackGroundUrlList = c 
end function 

'获得图片地址列表
function getImgUrlList(content)
    dim i, s, yuanStr, tempS, lalType, nLen, lalStr, c 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if s = "<" then
            yuanStr = mid(content, i) 
            tempS = LCase(yuanStr) 
            lalStr = mid(yuanStr, 1, inStr(yuanStr, ">")) 
            lalType = LCase(mid(tempS, 1, inStr(tempS, " "))) 
            if lalType = "<img " then
                c = c & getLinkUrl(lalStr, "src") & vbCrLf 
                i = i + nLen 

            end if 
        end if 
        doEvents 
    next 
    getImgUrlList = c 
end function 

'获得img或a地址 如GetLinkUrl(LalStr, "src")
function getLinkUrl(byVal linkStr, linkType)
    dim tempLinkStr, startStr, endStr, linkUrl 
    linkStr = replace(replace(linkStr, "= ", "="), "= ", "=") 
    linkStr = replace(replace(linkStr, " =", "="), " =", "=") 
    tempLinkStr = LCase(linkStr) 
	getLinkUrl=""
    startStr = linkType & "=""" 
    endStr = """" 
    if inStr(tempLinkStr, startStr) > 0 and inStr(tempLinkStr, endStr) > 0 then
        linkUrl = strCut(tempLinkStr, startStr, endStr, 2) 
        getLinkUrl = linkUrl 
    end if 
end function 

'是本地网址或远程网址        20141120
function localUrlOrRemoteUrl(filePath, isUrlOK)
    dim httpurl 
    isUrlOK = false 
    filePath = trim(filePath) 
    httpurl = replace(filePath, "\", "/") 
    if left(LCase(httpurl), 7) = "http://" or left(LCase(httpurl), 4) = "www." or left(LCase(httpurl), 4) = "[网址]" then
        isUrlOK = true 
    end if 
    if isUrlOK = false then
        filePath = setFileName(filePath) 
    end if 
    localUrlOrRemoteUrl = filePath 
end function 

'检测是否为远程网址
function checkRemoteUrl(url)
    dim httpurl 
    url = trim(url) 
    httpurl = replace(unSetFileName(url), "\", "/") 
    checkRemoteUrl = false 
    if left(LCase(httpurl), 7) = "http://" or left(LCase(httpurl), 4) = "www." or left(LCase(httpurl), 4) = "[网址]" then
        if left(LCase(httpurl), 4) = "[网址]" then
            url = mid(url, inStr(url, "[网址]") + 1) 
        end if 
        checkRemoteUrl = true 
    end if 
end function 



'函数名称：AsaiLinkAdd   20141217引用别人
'函数作用：正则自动添加链接
'例：Response.Write AsaiLinkAdd("http://www.wzl99.com/小孙、小孙http://www.wzl99.com/小孙、小孙http://www.wzl99.com//小孙、小孙http://www.wzl99.com/小孙、小孙http://www.wzl99.com/小孙、小孙www.wzl99.com/小孙、小孙fengying789@126.com小孙、小孙")
function asaiLinkAdd(str)
    dim re 
    str = " " & str 
    set re = createObject("VBscript.RegExp")                                        '建立正则表达式对象regular expression
        re.ignoreCase = true                                                            '忽略大小写
        re.global = true                                                                '搜索匹配字串针对全部文本
        '查找带协议前缀的链接
        re.pattern = "(http://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?)" 
        str = re.replace(str, "<a href='$1' target='_blank'>$1</a>") 
        '查找不带协议前缀的链接
        re.pattern = "([^(http:\/\/)])(www\.([\w-]+\.)+[\w]+(\/[\w-]+)*[\/]?([\w-]+\.[\w]+)?(\?[\w]+=[\w]+(&[\w]+=[\w]+)*)?)" 
        str = re.replace(str, "$1<a href='http://$2' target='_blank'>$2</a>") 
        '查找邮件链接
        re.pattern = "(mailto:)?([\w]+@([\w-]+\.)+[\w]+)" 
        str = re.replace(str, "<a href='mailto:$2'>$1$2</a>") 
    set re = nothing 
    asaiLinkAdd = replace(trim(str), " </a>", "") 
    asaiLinkAdd = replace(trim(str), " ;</a>", "") 
    asaiLinkAdd = replace(trim(str), " ；</a>", "") 
end function 

'函数名称：AsaiLinkDel Asai(浅井)   20141217引用别人
'函数作用：正则自动去除链接
'例：Response.Write AsaiLinkDel("<a href='http://www.wzl99.com/' target='_blank'>http://www.wzl99.com/</a>小孙、小孙<a href='http://www.wzl99.com/' target='_blank'>http://www.wzl99.com/</a>小孙、")
function asaiLinkDel(htmlStr)
    dim ra 
    set ra = createObject("VBscript.RegExp")
        ra.ignoreCase = true 
        ra.global = true 
        ra.pattern = "<a[^>]+>(.+?)<\/a>" 
        asaiLinkDel = ra.replace(htmlStr, "$1") 
end function

'判断域名是否合法  暂存
function iswww(strng)
    iswww = false 
    dim regex, match 
    set regex = createObject("VBscript.RegExp")
        regex.pattern = "^\w+((-\w+)|(\.\w+))*[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$" 
        regex.ignoreCase = true 
        set match = regex.execute(strng)
            if match.count then iswww = true 
end function


'加强于20150220
'追加网址参数20150121  getUrlAddToParam("aa","&a=b","replace")   addto replace    SType为追加还是替换
'Url = getUrlAddToParam("http://www.baidu.com/?a=1&b=2&c=3","?a=11&b=22&c=333","")        'http://www.baidu.com/?a=1&b=2&c=3
'Url = getUrlAddToParam("http://www.baidu.com/?a=1&b=2&c=3","?a=11&b=22&c=333","replace")        'http://www.baidu.com/?a=11&b=22&c=333
'Url = getUrlAddToParam(GetUrl(),"id=" & Rs("Id"),"replace")
'Call Echo(Url,getUrlAddToParam(Url,"id=1&aa=1&bb=2","delete"))          批量删除参数
function getUrlAddToParam(byVal url, byVal addToUrl, sType)
    dim content, splStr, splxx, s, c, httpurl, urlFileName, webSite 
    dim urlParam                                                                    '网址参数 是获得网址后台参数值
    dim paramName                                                                   '参数名称
    dim paramValue                                                                  '参数值
    dim paramNameList                                                               '参数名称列表，防止重复
    dim isHandle                                                                   '处理为真

    addToUrl = handleHttpUrl(addToUrl) 

    '处理网址
    url = trim(url) 
    '当前网址最后一个字符为?或&给删除掉 无用
    if right(url, 1) = "?" or right(url, 1) = "&" then
        url = trim(mid(url, 1, len(url) - 1)) 
    end if 
    '处理追加网址
    addToUrl = trim(addToUrl) 
    '追加网址最后一个字符为?或&给删除掉 无用
    if left(addToUrl, 1) = "?" or left(addToUrl, 1) = "&" then
        addToUrl = trim(mid(addToUrl, 2)) 
    end if 
    '网址为空则返回追加网址 并退出
    if url = "" then getUrlAddToParam = "?" & addToUrl : exit function 

    httpurl = url 
    if inStr(url, "?") > 0 then
        httpurl = mid(url, 1, inStr(url, "?") - 1)                                      '获得当前路径网址
        webSite = getWebSite(url)                                                       '处理域名
        urlParam = mid(url, inStr(url, "?") + 1) 

        httpurl = handleHttpUrl(httpurl) 
        if right(httpurl, 1) <> "/" then
            urlFileName = mid(httpurl, inStrRev(httpurl, "/") + 1) 
            httpurl = left(httpurl, len(httpurl) - len(urlFileName)) 
        'Call Echo(HttpUrl,UrlFileName)
        end if 
    end if 

    '类型选择  追加 不是替换
    if LCase(sType) = "replace" or sType = "替换" then
        content = addToUrl & "&" & urlParam 
        'Call echo("Content",Content)
        if inStr(addToUrl, "?") > 0 then
            urlFileName = mid(addToUrl, 1, inStr(addToUrl, "?") - 1) 
        'Call Echo(AddToUrl,UrlFileName)
        end if 
    elseIf(LCase(sType) <> "delete" or LCase(sType) <> "del") then
        content = urlParam & "&" & addToUrl 
    end if 

    content = replace(content, "?", "&") 

    '处理删除参数 20150210
    if LCase(sType) = "delete" or LCase(sType) = "del" then
        splStr = split(LCase(addToUrl), "&") : addToUrl = "&" 
        for each s in splStr
            if inStr(s, "=")>0 then
                s = mid(s, 1, inStr(s, "=") - 1) 
            end if 
            if s <> "" then
                addToUrl = addToUrl & s & "&" 
            end if 
        next 
    'Call Eerr("AddToUrl",AddToUrl)
    end if 

    'Call Echo("Content",Content)
    splStr = split(content, "&") 
    for each s in splStr
        if inStr(s, "=") > 0 then
            splxx = split(s, "=") 
            paramName = splxx(0) 
			paramValue=""
			'【@是jsp显示@】try{
				paramValue = splxx(1) 
			'【@是jsp显示@】}catch(Exception e){}
            isHandle = true 

            if LCase(sType) = "delete" or LCase(sType) = "del" then
                if inStr("&" & addToUrl & "&", "&" & LCase(paramName) & "&") > 0 then
                    isHandle = false 
                end if 
            end if 

            if inStr("|" & paramNameList & "|", "|" & LCase(paramName) & "|") = 0 and isHandle = true then
                paramNameList = paramNameList & LCase(paramName) & "|" 
                c = c & IIF(c = "", "?", "&") 
                c = c & paramName & "=" & paramValue 
            end if 
        end if 
    next 



    c = urlFileName & c 
    if getWebSite(c) = "" then
        if left(addToUrl, 1) = "/" then
            c = webSite & c 
        else
            c = httpurl & c 
        end if 

    end if 

    c = replace(c, "\", "/")                                                        '20160313
    getUrlAddToParam = c 
end function 




'组合网址 20150706 call echo("",groupUrl("www.baidu.com//","/1.asp"))
function groupUrl(url1, url2)
    dim urlType, i 
    urlType = "/" 
    url1 = replace(url1, IIF(urlType = "/", "\", "/"), urlType) 
    url2 = replace(url2, IIF(urlType = "/", "\", "/"), urlType) 
    url1 = phptrim(url1) 
    url2 = phptrim(url2) 
    for i = 0 to 99
        if right(url1, 1) = urlType then
            url1 = mid(url1, 1, len(url1) - 1) 
        else
            exit for 
        end if 
    next 
    for i = 0 to 99
        if left(url2, 1) = urlType then
            url2 = mid(url2, 2) 
        else
            exit for 
        end if 
    next 
    groupUrl = url1 & urlType & url2 
end function 



'处理POST或Cookes发送方式的参数处理
function handlePostCookiesParame(parame, sType)
    dim splStr, s, c, leftC, rightC 
    splStr = split(parame, "&") 
    for each s in splStr
        if inStr(s, "=") > 0 then
            leftC = mid(s, 1, inStr(s, "=")) 
            rightC = mid(s, inStr(s, "=") + 1) 
            if LCase(sType) = "post" or sType = "" then
    
	            if c <> "" then 
					c = c & "&" 		'这里在转.net时会多个=号 ? 20160727  不能用一行
				end if
                rightC = escape(rightC) 
            elseIf LCase(sType) = "cookies" or LCase(sType) = "cookie" then
                if c <> "" then c = c & ";" 
                rightC = URLEncoding(rightC) 
            end if 
            c = c & leftC & rightC 
        'call echo(leftC,RightC)
        end if 
    next 
    handlePostCookiesParame = c 
end function 


'移除网址中参数20150724
function remoteHttpUrlParameter(httpurl)
    dim splStr, s, c, leftC, rightC 
    '没有?号退出
    if inStr(httpurl, "?") = 0 then
        remoteHttpUrlParameter = httpurl 
        exit function 
    end if 
    splStr = split(httpurl, "&") 
    for each s in splStr
        if inStr(s, "=") > 0 then
            leftC = mid(s, 1, inStr(s, "=")) 
            rightC = mid(s, inStr(s, "=") + 1) 
            if c <> "" then c = c & "&" 
            c = c & leftC 
        end if 
    next 
    remoteHttpUrlParameter = c 
end function 


'检测当前网址里文件名称是否存在(20150909)
'用法 call echo("checkUrlName",checkUrlName("1|2|3|"))      <%=IIF(checkUrlName("1|2|3|"),"111","222")% >
function checkUrlName(searchUrlName)
    dim splStr, urlName, url 
    searchUrlName = LCase(searchUrlName)                                            '搜索网址名称转小写
    url = LCase(request.serverVariables("script_name")) 
    splStr = split(searchUrlName, "|") 
    for each urlName in splStr
        if urlName <> "" then
            if inStr(url, urlName) > 0 then
                checkUrlName = true 
                exit function 
            end if 
        end if 
    next 
    checkUrlName = false 
end function 



'注意   这里面有问题的

'0 url：http://127.0.0.1/aa/4.asp?act=sdf&v=sdf
'1 urlDir：http://127.0.0.1/
'2 fileName：4.asp
'3 FileType：asp
'4 fileStr：4.asp?act=sdf&v=sdf
'5 HttpAgreement：http
'6 webSite：http://127.0.0.1/
'7 folderDir：aa/

'网址处理成数组20150124  数组  0原文件路径 1为文件路径   2为文件名称  3为去除文件类型文件名称   4为文件类型后缀名
function handleHttpUrlArray(byVal url)
    'on error resume next
    dim urlDir, fileName, fileType, fileStr, httpAgreement, webSite, folderDir 
    url = handleHttpUrl(url) 

    urlDir = mid(url, 1, inStrRev(url, "/")) 
    fileStr = mid(url, inStrRev(url, "/") + 1) : fileName = fileStr 
    if inStr(fileStr, "?") > 0 then
        fileName = mid(fileStr, 1, inStr(fileStr, "?") - 1) 
    end if 
    fileType = mid(fileName, inStrRev(fileName, ".") + 1) 
    httpAgreement = mid(url, 1, inStr(url, ":") - 1) 
    webSite = getWebSite(url) 
    'Call echo("url", url)
    '域名为空则发粗获得文件夹目录20160613
    if webSite <> "" then
        folderDir = mid(urlDir, len(webSite)) 
    else
        call echoYellowB("注意：不是有效网址", url) 
    end if 
    'HandleHttpUrlArray = Array(url, urlDir, fileName, fileType, fileStr, HttpAgreement, webSite, folderDir)
    dim arrayData 
    arrayData = split(url & vbCrLf & urlDir & vbCrLf & fileName & vbCrLf & fileType & vbCrLf & fileStr & vbCrLf & httpAgreement & vbCrLf & webSite & vbCrLf & folderDir, vbCrLf) 
    handleHttpUrlArray = arrayData 
end function 


'移除jsCss后的参数Param (20151019)
function remoteJsCssParam(content, pubAHrefList)
    remoteJsCssParam = handleRemoteJsCssParam(content, pubAHrefList, "|替换内容|替换网址") 
end function 

'处理移除jsCss后的参数Param (20151019)
function handleRemoteJsCssParam(content, urlList, sType)
    dim splStr, c, url, arrData, fileName, fileType, fileStr, replaceStr 
    sType = "|" & sType & "|" 
    splStr = split(urlList, vbCrLf) 
    for each url in splStr
        if url <> "" then
            if c <> "" then c = c & vbCrLf 
            arrData = handleHttpUrlArray(url) 
            fileName = arrData(2) 
            fileType = LCase(arrData(3)) 
            fileStr = LCase(arrData(4)) 
            if(fileType = "js" or fileType = "css") and inStr(fileStr, "?") > 0 and instr(fileName, ".") > 0 then
                replaceStr = mid(url, 1, inStr(url, "?") - 1) 
                'call echo(replaceStr,fileStr)
                '这种替换方法还是不精准，待改进
                if inStr(sType, "|替换内容|") > 0 then
                    content = replace(content, url, replaceStr) 
                end if 
                if inStr(sType, "|替换网址|") > 0 then
                    urlList = replace(urlList, url, replaceStr) 
                end if 
            end if 
        end if 
    next 
end function 


'批量处理网址完整(20151022)
function batchHandleHttpUrlComplete(httpurl, content)
    dim webSite, splStr, url, lCaseUrl, c 
    webSite = getwebsite(httpurl) 
    splStr = split(content, vbCrLf) 
    for each url in splStr
        url = phptrim(url) 
        lCaseUrl = LCase(url) 
        if lCaseUrl <> "#" and left(lCaseUrl, 11) <> "javascript:" then
            if inStr(vbCrLf & LCase(c) & vbCrLf, vbCrLf & lCaseUrl & vbCrLf) = 0 then
                if c <> "" then c = c & vbCrLf 
                c = c & urlAddHttpUrl(webSite, url) 
            end if 
        end if 
    next 
    batchHandleHttpUrlComplete = c 
end function 


'检测同域名(20151023)
function isWebSite(byVal url1, byVal url2)
    isWebSite = handleIsWebSite(url1, url2, "") 
end function 
'检测同子域名(20151023)
function isSonWebSite(byVal url1, byVal url2)
    isSonWebSite = handleIsWebSite(url1, url2, "子域名") 
end function 

'处理两网址是否域名同等(20151023)
function handleIsWebSite(byVal url1, byVal url2, sType)
    url1 = getwebsite(url1) 
    url2 = getwebsite(url2) 
    if inStr(url1, "://") > 0 then
        url1 = mid(url1, inStr(url1, "://") + 3) 
    end if 
    if left(url1, 4) = "www." then
        url1 = mid(url1, 5) 
    end if 
    if inStr(url2, "://") > 0 then
        url2 = mid(url2, inStr(url2, "://") + 3) 
    end if 
    if left(url2, 4) = "www." then
        url2 = mid(url2, 5) 
    end if 

    if sType = "子域名" then
        dim splStr, s, c 
        c = ".com.hk|.sh.cn|.com.cn|.net.cn|.org.cn" 
        c = c & "|.com|.net|.org|.tv|.cc|.info|.cn|.tw|:81|:99|.biz|.mobi|.hk|.us|.la|.gl|.in|.so|.im|.love|.xyz|.wang|" 
        splStr = split(c, "|") 
        for each s in splStr
            if s <> "" then
                url1 = replace(url1, s, "") 
                url2 = replace(url2, s, "") 
            end if 
        next 

        if inStr(url1, ".")>0 then
            url1 = mid(url1, inStr(url1, ".") + 1) 
        end if 
        if inStr(url2, ".")>0 then
            url2 = mid(url2, inStr(url2, ".") + 1) 
        end if 


    end if 
    handleIsWebSite = false 
    if url1 = url2 then
        handleIsWebSite = true 
    end if 
end function 


'获得内容里网址列表(20161025)
function getContentUrlList(httpurl, byVal content)
    getContentUrlList = handleGetContentUrlList(httpurl, content, "|*|内链|") 
end function 
'处理获得内容里网址列表(20161025)
function handleGetContentUrlList(httpurl, byVal content, sType)
    dim i, s, sNext, sEndLCase, sEnd, urlStr, nLen, urlList, url, urlLCase, webSite, labelType, isHandle, valueLabel 
    sType = "|" & LCase(trim(sType)) & "|" 
    webSite = getwebsite(httpurl) 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        sNext = mid(content & " ", i + 1, 1) 
        sEnd = mid(content, i + 1) : sEndLCase = LCase(sEnd) 
        if s = "<" then
            url = "" 
            labelType = "" 
            isHandle = false 
            if left(sEndLCase, 2) = "a " then
                labelType = "a" 
                valueLabel = "href" 
                isHandle = true 
            elseIf left(sEndLCase, 5) = "link " then
                labelType = "link" 
                valueLabel = "href" 
                isHandle = true 
            elseIf left(sEndLCase, 4) = "img " then
                labelType = "img" 
                valueLabel = "src" 
                isHandle = true 
            elseIf left(sEndLCase, 7) = "script " then
                labelType = "script" 
                valueLabel = "src" 
                isHandle = true 
            end if 
            if isHandle = true then
                if inStr(sType, "|" & labelType & "|") > 0 or inStr(sType, "|*|") > 0 then
                    nLen = inStr(sEnd, ">") 
                    urlStr = mid(sEnd, 1, nLen) 
                    url = RParam(urlStr, valueLabel) 
                    i = i + nLen 
                end if 
            end if 
            if url <> "" then
                urlLCase = LCase(url) 
                if urlLCase <> "#" and left(urlLCase, 11) <> "javascript:" then
                    if inStr(vbCrLf & urlList & vbCrLf, vbCrLf & url & vbCrLf) = 0 then
                        url = fullHttpUrl(httpurl, url) 
                        isHandle = isSonWebSite(url, httpurl) 
                        if inStr(sType, "|内链|") > 0 then
                            if isHandle = true then
                                urlList = urlList & url & vbCrLf 
                            end if 
                        elseIf inStr(sType, "|外链|") > 0 then
                            if isHandle = false then
                                urlList = urlList & url & vbCrLf 
                            end if 
                        else
                            urlList = urlList & url & vbCrLf 
                        end if 
                    end if 
                end if 
            end if 
        end if 
    next 
    if urlList <> "" then urlList = left(urlList, len(urlList) - 2) 
    handleGetContentUrlList = urlList 
end function 
'获得网址中内链与外链列表
function getInChain(httpurl, urlList)
    dim splStr, url, c, urlLCase, isHandle 
    splStr = split(urlList, vbCrLf) 
    urlList = "" 
    for each url in splStr
        if url <> "" then
            urlLCase = LCase(url) 
            if left(urlLCase, 1) <> "#" and left(urlLCase, 11) <> "javascript:" then
                if inStr(vbCrLf & urlList & vbCrLf, vbCrLf & url & vbCrLf) = 0 then
                    url = fullHttpUrl(httpurl, url) 
                    isHandle = isSonWebSite(url, httpurl) 
                    if isHandle = true then
                        urlList = urlList & url & vbCrLf 
                    end if 
                end if 
            end if 
        end if 
    next 
    if urlList <> "" then urlList = left(urlList, len(urlList) - 2) 
    getInChain = urlList 
end function 


'处理扫描后网址列表 20160428
function handleScanUrlList(httpurl, urlList)
    dim splStr, url, c, lCaseUrl 
    splStr = split(urlList, vbCrLf) 
    for each url in splStr
        url = phptrim(url) 
        lCaseUrl = lcase(url) 
        if url <> "" and left(url, 10) <> "tencent://" and left(url, 11) <> "javascript:" and left(url, 1) <> "#" then
            url = fullHttpUrl(httpurl, url) 
            if instr(vbCrLf & c & vbCrLf, vbCrLf & url & vbCrLf) = 0 then
                c = c & url & vbCrLf 
            end if 
        end if 
    next 
    handleScanUrlList = c 
end function 

'处理相同域名列表 20160501
function handleWithWebSiteList(httpurl, urllist)
    dim webSite, splStr, url, c, urlWebsite, s 
    webSite = lcase(getwebsite(httpurl)) 
    splStr = split(urllist, vbCrLf) 
    for each url in splStr
        if url <> "" then
            if right(url, 1) <> "/" and instr(url, "?") = 0 then
                s = mid(url, instrrev(url, "/")) 
                'call echo("s",s)
                if(instr(s, ".") = 0 or instr(s, ".com") > 0 or instr(s, ".cn") > 0 or instr(s, ".net") > 0) and instr(s, "@") = 0 then
                    url = url & "/" 
                end if 
            'call echo("url",url)
            end if 
            urlWebsite = lcase(getwebsite(url)) 
            if webSite = urlWebsite and instr(vbCrLf & c & vbCrLf, vbCrLf & url & vbCrLf) = 0 then
                if c <> "" then
                    c = c & vbCrLf 
                end if 
                c = c & url 
            end if 
        end if 
    next 
    handleWithWebSiteList = c 
end function 
'处理不同域名列表 20160501
function handleDifferenceWebSiteList(httpurl, urllist)
    dim webSite, splStr, url, c, urlWebsite, websiteList 
    webSite = lcase(getwebsite(httpurl)) 
    splStr = split(urllist, vbCrLf) 
    for each url in splStr
        urlWebsite = lcase(getwebsite(url)) 
        if urlWebsite <> "" and webSite <> urlWebsite and instr(vbCrLf & websiteList & vbCrLf, vbCrLf & urlWebsite & vbCrLf) = 0 then
            websiteList = websiteList & urlWebsite & vbCrLf 
        end if 
    next 
    handleDifferenceWebSiteList = websiteList 
end function 

'检测域名存在 20160511   例：checkDomainName('http://www.baidu.com/a/b/sdf')
function checkDomainName(httpurl)
    dim url, url2, s, s2 
    url = getwebsite(httpurl) 
    url2 = url & "/a/1/b/2/cdefg/"  
    'call echo(url, url2) 
    checkDomainName = true 
    s = getHttpUrl(url, "") 
    s2 = getHttpUrl(url2, "") 
    if s = s2 then
        checkDomainName = false  
    end if 
end function 

'获得url状态说明
function getHttpUrlStateAbout(nState)
    dim n, c 
    n = cint(trim(nState)) 
    select case n
        case 100 : c = "继续"
        case 101 : c = "开关协议"
        case 200 : c = "成功"
        case 201 : c = "创建"
        case 202 : c = "接受"
        case 203 : c = "非权威信息"
        case 204 : c = "不含内容"
        case 205 : c = "重置内容"
        case 206 : c = "部分内容"
        case 300 : c = "多项选择"
        case 301 : c = "移动永久"
        case 302 : c = "暂时移动"
        case 303 : c = "看其他的"
        case 304 : c = "未修改"
        case 305 : c = "使用代理"
        case 307 : c = "临时重定向"
        case 400 : c = "坏的要求"
        case 401 : c = "未经授权"
        case 402 : c = "付款要求"
        case 403 : c = "禁止"
        case 404 : c = "未找到"
        case 405 : c = "不允许的方法"
        case 406 : c = "不可接受"
        case 407 : c = "代理验证所需"
        case 408 : c = "请求超时"
        case 409 : c = "冲突"
        case 410 : c = "消失"
        case 411 : c = "所需长度"
        case 412 : c = "先决条件"
        case 413 : c = "请求实体过大"
        case 414 : c = "的请求URI太长"
        case 415 : c = "不支持的媒体类型"
        case 416 : c = "的请求范围不满足"
        case 417 : c = "期望失败"
        case 500 : c = "内部服务器错误"
        case 501 : c = "未实施"
        case 502 : c = "坏网关"
        case 503 : c = "服务不可用"
        case 504 : c = "网关超时"
        case 505 : c = "的HTTP版本不支持"
        case 509 : c = "带宽限制超过"
    end select
    getHttpUrlStateAbout = c 
end function 

%> 
