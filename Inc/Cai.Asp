<% 
'Cai采集内容(2014)
 


'截取字符串 更新20160114
'c=[A]abbccdd[/A]
'0=abbccdd
'1=[A]abbccdd[/A]
'3=[A]abbccdd
'4=abbccdd[/A]   
'截取字符串
function strCut(byVal content, byVal startStr, byVal endStr, byVal nType)
    dim nS1, s1Str, nS2, nS3, c, tempContent, tempStartStr, tempEndStr ,cutType
    tempStartStr = startStr 
    tempEndStr = endStr  
    tempContent = content 
    cutType = "|" & nType & "|" 
    '不区分大小写
    if inStr(cutType, "|lu|") > 0 then
        content = LCase(content) 
        startStr = LCase(startStr) 
        endStr = LCase(endStr) 
    end if 
    if inStr(content, startStr) = false or inStr(content, endStr) = false then
        c = "" 
        exit function 
    end if 
    if inStr(cutType, "|1|") > 0 then
        nS1 = inStr(content, startStr) 
        s1Str = mid(content, nS1 + len(startStr)) 
        nS2 = nS1 + inStr(s1Str, endStr) + len(startStr) + len(endStr) - 1                '为什么要减1
    else
        nS1 = inStr(content, startStr) + len(startStr) 
        s1Str = mid(content, nS1) 
        'nS2 = InStr(nS1, content, EndStr)
        nS2 = nS1 + inStr(s1Str, endStr) - 1 
    end if 
    nS3 = nS2 - nS1 
    if nS3 >= 0 then
        c = mid(tempContent, nS1, nS3) 
    else
        c = "" 
    end if 
    if inStr(cutType, "|3|") > 0 then
        c = tempStartStr & c 
    end if 
    if inStr(cutType, "|4|") > 0 then
        c = c & tempEndStr 
    end if 
    strCut = c 
end function 
'获得截取内容,20150305
function getStrCut(byVal content, byVal startStr, byVal endStr, byVal nType)
    getStrCut = strCut(content, startStr, endStr, nType) 
end function 
'接取字符 CutStr(Content,22,"null")
Function cutStr(ByVal content, ByVal nCutValue, ByVal MoreStr)
    Dim i, nS, n 
    n = 0                                                 '转换成数字类型    追加于20141107
    If MoreStr = "" Then MoreStr = "..." 
    If LCase(MoreStr) = "none" Or LCase(MoreStr) = "null" Then MoreStr = "" 
    cutStr = content 
    For i = 1 To Len(content)
        nS = Asc(Mid(CStr(content), i, 1)) 
        If nS < 0 Then nS = nS + 65536 
        If nS < 255 Then n = n + 1 
        If nS > 255 Then n = n + 2 
        If n >= nCutValue Then cutStr = Left(content, i) & MoreStr : Exit Function 
    Next 
End Function 
'截取内容，不区分大小写 20150327  C=cutStrNOLU(c,"<heAd",">")
function cutStrNOLU(content, startStr, endStr)
    dim s, LCaseContent, nStartLen, nEndLen, sNewStrStart 
    startStr = LCase(startStr) 
    endStr = LCase(endStr) 
    LCaseContent = LCase(content) 
	cutStrNOLU=""
    if inStr(LCaseContent, startStr) > 0 then
        nStartLen = inStr(LCaseContent, startStr) 
        s = mid(content, nStartLen) 
        LCaseContent = mid(s, len(startStr) + 1) 
        sNewStrStart = mid(s, 1, len(startStr) + 1)                                      '获得开始字符

        LCaseContent = replace(LCaseContent, "<", "&lt;") 
        'Call eerr("111",LCaseContent)

        nEndLen = inStr(LCaseContent, endStr) 
        call echo("nEndLen", nEndLen)  

        s = mid(content, nStartLen, nEndLen + len(startStr)) 
        'Call Echo(nStartLen,nEndLen)
        'Call Echo("S",S)
        cutStrNOLU = s 
    end if 
end function 

'接取TD字符
function setCutTDStr(byVal content, byVal TDWidth, byVal moreColor)
    dim i, s, c, n, nEnd, isMore 
    content = CStr(content & "") 
    if content = "" then setCutTDStr = content : exit function 
    if TDWidth = "" then setCutTDStr = content : exit function                      'TDWidth为空，则为自动
    n = 0 : isMore = false 
    nEnd = int(cint(TDWidth) / 6.3) 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if n >= nEnd then
            isMore = true 
            exit for 
        else
            c = c & s 
        end if 
        if asc(s) < 0 then
            n = n + 2 
        else
            n = n + 1 
        end if 
    next 
    if isMore = true then
        '需要处理Title标题的HTML
        c = "<span Title=""" & displayHtml(content) & """ style=""background-color:" & moreColor & ";"">" & c & "</span>" 
    end if 
    setCutTDStr = c 
end function 
'接取TD字符 (辅助)
function cutTDStr(content, TDWidth)
    cutTDStr = setCutTDStr(content, TDWidth, "#FBE3EF") 
end function 
'分割字符 
function getArrayList(byVal content, byVal startStr, byVal endStr, byVal isStart, byVal isEnd, byVal sType)
    'on error resume next
    if isNull(content) = true or isNull(startStr) = true or isNull(endStr) = true then
        getArrayList = "" 
        exit function 
    end if 
    dim c, rep, matches, theMatch 
    content = replace(replace(content, chr(10), "【换行】"), chr(13), "【换行】") '替换掉换行
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "(" & startStr & ").+?(" & endStr & ")" 
        set matches = rep.execute(content)
            for each theMatch in matches
                c = c & "$Array$" & theMatch.value 
            next 
        set matches = nothing 
        if c = "" then
            getArrayList = "" 
            exit function 
        end if 
        c = right(c, len(c) - 7) 
        if isStart = false then
            rep.pattern = startStr 
            c = rep.replace(c, "") 
        end if 
        if isEnd = false then
            rep.pattern = endStr 
            c = rep.replace(c, "") 
        end if 
    set rep = nothing 
    if sType = "1" or sType = "去掉字符" then		'or sType = true   这个不能用，因为在vb.net里会出错，晕
        c = replace(c, """", "") 
        c = replace(c, "'", "") 
        c = replace(c, " ", "") 
        c = replace(c, "(", "") 
        c = replace(c, ")", "") 
    end if 
    getArrayList = c 
end function 
 

'创建于20160801
function getArrayNew( byval content, startStr, endStr, isStart, isEnd) 
	dim i,s,listStr,nStartLen,nEndLen
    for  i = 0 to  999 				'30为截取条件
		'echo(content . "=" & instr(content, startStr))
		'call echo(instr(content, startStr) , instr(content, endStr))
        nStartLen=instr(content, startStr)
		nEndLen=instr(content, endStr)
		if nStartLen  > 0 and nEndLen > 0 then 		
			
			s=mid(content,1,nEndLen-1)
			content=mid(content,nEndLen+len(endStr))
			s=mid(s,instr(s,startStr)+len(startStr)) 
			
			if listStr<>"" then
				listStr=listStr & "$Array$"
			end if 
			if isStart=true then
				s=startStr & s
			end if
			if isEnd=true then
				s=s & endStr
			end if
			listStr=listStr & s
			
			
        else
			exit for
		end if
	next    
    getArrayNew = listStr
end function

'分割字符 不处理字符 (辅助)
function getArray(content, startStr, endStr, isStart, isEnd)
    getArray = getArrayList(content, startStr, endStr, isStart, isEnd, "") 
end function 
'分割字符 去掉字符 (辅助)
function getArray1(content, startStr, endStr, isStart, isEnd)
    getArray1 = getArrayList(content, startStr, endStr, isStart, isEnd, "去掉字符") 
end function 
'截取指定分割值
function getSplit(byVal content, byVal sSplit, byVal n)
    dim splxx 
    splxx = split(content, sSplit) 
    getSplit = splxx(n) 
end function  
'获得分数总数
function getSplitCount(byVal content, byVal sSplit)
    dim splxx 
    splxx = split(content, sSplit) 
	getSplitCount=0
    getSplitCount = uBound(splxx) 
    if getSplitCount > 0 then getSplitCount = getSplitCount + 1                     '不为空加一
	
end function 

'代理 因为它不能与VB软件共存
function agent(byVal httpurl)
    'On Error Resume Next
    server.scriptTimeout = 999 
    '----------
    '获取远程数据
    dim http 
    set http = createObject("WinHttp.WinHttpRequest.5.1")

        http.open "GET", httpurl, false 
        if request.serverVariables("HTTP_REFERER") <> "" then
            http.setRequestHeader "Referer", request.serverVariables("HTTP_REFERER") 
        end if 
        if request.cookies <> "" then
            http.setRequestHeader "Cookie", request.cookies 
        end if 
        http.setRequestHeader "User-Agent", request.serverVariables("HTTP_USER_AGENT") 
        http.setRequestHeader "X-Forwarded-For", request.serverVariables("REMOTE_ADDR") & ", " & request.serverVariables("LOCAL_ADDR") 
        http.setRequestHeader "Connection", "Close" 
        http.setRequestHeader "Nuclear-Atk", "http://" & request.serverVariables("HTTP_HOST") & request.serverVariables("SCRIPT_NAME") & "?" & request.queryString 
        http.setRequestHeader "Nuclear-Atk-Host", request.serverVariables("HTTP_HOST") 
        http.send 

        response.status = http.status & " " & http.statusText                           '照搬远程HTTP状态码与状态描述文本
        response.contentType = http.getResponseHeader("Content-Type")                   '照搬远程内容类型
        response.binaryWrite http.responseBody                                          '输出二进制内容
end function



'从XML.ASP引用

'处理注入网址，配置获得网站注意网址
function handlUrlCanShu(httpurl)
    dim url, splStr, i, s, s1, s2 
    splStr = split(httpurl, "=") 
    for i = 0 to uBound(splStr)
        s = splStr(i) 
        if url <> "" then url = url & "=" 
        if inStr(s, "&")>0 then
            s1 = mid(s, 1, inStr(s, "&") - 1) 
            s2 = mid(s, inStr(s, "&")) 
            s = escape(s1) & s2 
        elseIf i = uBound(splStr) then
            s = escape(s) 
        end if 
        url = url & s 
    next 
    handlUrlCanShu = url 
end function 


'处理字符编码 20150723
function handleStrCharSet(sSetChar)
    if sSetChar = "1" or uCase(sSetChar) = "GB2312" or sSetChar = "" then
        sSetChar = "GB2312" 
    elseIf sSetChar = "0" or uCase(sSetChar) = "UTF-8" then
        sSetChar = "UTF-8" 
    elseIf sSetChar = "2" or uCase(sSetChar) = "UNICODE" then
        sSetChar = "UNICODE" 
    end if 
    handleStrCharSet = sSetChar 
end function 


'URL加密  自己写得不再使用，UTF8_urlEncoding没有它好用
function urlEncoding(str)
    '追加可不要
    str = replace(str, "1", "%31") 
    str = replace(str, "0", "%30") 
    str = replace(str, "A", "%41") 
    str = replace(str, "我", "%CE%D2") 
    str = replace(str, "#", "%23") 
    '原始
    str = replace(str, "a", "%61") 
    str = replace(str, "n", "%6E") 
    str = replace(str, "d", "%64") 
    str = replace(str, " ", "%20") 
    str = replace(str, "=", "%3D") 
    str = replace(str, "e", "%65") 
    str = replace(str, "x", "%78") 
    str = replace(str, "i", "%69") 
    str = replace(str, "s", "%73") 
    str = replace(str, "t", "%74") 
    str = replace(str, "(", "%28") 
    str = replace(str, ")", "%29") 
    str = replace(str, "l", "%6C") 
    str = replace(str, "c", "%63") 
    str = replace(str, "*", "%2A") 
    str = replace(str, "f", "%66") 
    str = replace(str, "r", "%72") 
    str = replace(str, "o", "%6F") 
    str = replace(str, "m", "%6D") 
    str = replace(str, "w", "%77") 
    str = replace(str, "h", "%68") 
    urlEncoding = str 
end function 

%>     


