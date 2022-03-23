<% 
'FSO  VBscript.RegExp组件操作大全 (2013,9,29)

'检查字符是否存在,大小写不分
function checkStr(byVal content, byVal serchValue)
    on error resume next 
    dim rep, search 
    checkStr = true 
    set rep = createObject("VBscript.RegExp")
        rep.global = true                                                               '设置全程性质。
        rep.ignoreCase = true                                                           '设置是否区分字母的大小写。True不区别，Falsh区分
        rep.pattern = serchValue 
        set search = rep.execute(content)
            if search.count = 0 then checkStr = false 
        set search = nothing 
    set rep = nothing 
    if err then call doError(err.description, "CheckStr 检查字符是否存在 函数出错，SerchValue=" & serchValue) 
end function 
'检查字符是否存在 (辅助)
function regExp_CheckStr(content, serchValue)
    regExp_CheckStr = checkStr(content, serchValue) 
end function 
'检查字符是否存在 (辅助)
function existsStr(content, serchValue)
    existsStr = checkStr(content, serchValue) 
end function 
'检查字符是否存在 (辅助)
function regExp_Instr(content, serchValue)
    regExp_Instr = checkStr(content, serchValue) 
end function 


'替换不区分大小写20171109   call rwend(replaceNoULCase("aa1b2b我的名字叫1B2B。" ,"1b2B","中国") )
function replaceNoULCase(content,byval findStr,byval replaceStr)
	dim contentLCase,i,s,nLen,sLeft,sRight
	contentLCase=lcase(content)
	findStr=lcase(findStr)
	if findStr=replaceStr then
		replaceNoULCase=content
		exit function
	end if
	for i=1 to 399 
		nLen=instr(contentLCase,findStr) 
		if nLen>0 then
			sLeft=mid(content,1,nLen-1)
			sRight=mid(content,nLen+len(findStr))
			content=sLeft & replaceStr & sRight
			contentLCase=lcase(content) 
			'call echo("content",content)
		else
			'call echo(nLen & "退出" & findStr ,contentLCase)
			exit for
		end if
	next
	replaceNoULCase=content
end function
 

'替换内容,不区分大小写
function regExp_Replace(byVal content, byVal setPattern, byVal tStr)
    on error resume next 
    dim rep 
    set rep = createObject("VBscript.RegExp")
        rep.pattern = setPattern                                                        '设置模式。
        rep.ignoreCase = true                                                           '设置是否区分字母的大小写。
        rep.global = true                                                               '设置全程性质。
        regExp_Replace = rep.replace(content, tStr) 
    set rep = nothing 
    if err then call doError(err.description, "RegExp_Replace 替换内容 函数出错，SetPattern=" & setPattern & " |Str=" & tStr) 
end function 
'替换内容自动加颜色,不区分大小写
function replaceColor(content, setPattern, tStr, color)
    if color <> "" then tStr = "<font color=" & color & ">" & tStr & "</font>" 
    replaceColor = regExp_Replace(content, setPattern, tStr) 
end function 
'删除HTML标签
function delHtml(byVal strHtml)
    on error resume next 
    dim rep, strOutput 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "(<[a-zA-Z].*?>)|(<[\/][a-zA-Z].*?>)" 
        strOutput = rep.replace(strHtml, "") 
        delHtml = strOutput 
    set rep = nothing 
    if err then call doError(err.description, "DelHtml 删除HTML标签 函数出错，") 
end function 

'删除HTML标签 (辅助)
function regExp_DelHtml(strHtml)
    regExp_DelHtml = delHtml(strHtml) 
end function 
'获得内容中链接与标题列表  getAUrlTitleList(Content,"网址")
function getAUrlTitleList(byVal content, byVal sType)
    on error resume next 
    dim s, c, setExecute, setValue, rep 
    c = "" 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "<a [^>]*href *= *[""']([^""'> ]+)[^>]*>([^<]+)" 
        set setExecute = rep.execute(content)
            for each setValue in setExecute
                if sType = "链接" or sType = "网址" or sType = "0" then
                    s = setValue.subMatches(0) 
                elseIf sType = "标题" or sType = "1" then
                    s = setValue.subMatches(1) 
                else
                    s = setValue.subMatches(0) & "$Array$" & setValue.subMatches(1) 
                end if 
                if inStr(vbCrLf & c & vbCrLf, vbCrLf & s & vbCrLf) = false then
                    c = c & s & vbCrLf 
                end if 
            next 
        set setExecute = nothing 
    set rep = nothing 
    if c <> "" then c = left(c, len(c) - 2) 
    getAUrlTitleList = c 
    if err then call doError(err.description, "GetHrefUrlTitleList 获得内容中链接与标题列表 函数出错，C=" & c) 
end function 
'获得链接中网址 (辅助)
function getAURL(content)
    getAURL = getAUrlTitleList(content, 0) 
end function 
'获得链接中标题 (辅助)
function getATitle(content)
    getATitle = getAUrlTitleList(content, 1) 
end function 
'获得链接中网址和标题 (辅助)
function getAURLTitle(content)
    getAURLTitle = getAUrlTitleList(content, "链接和标题") 
end function 


'获得内容中链接与标题列表  GetAUrlTitleList(Content,"网址")
function getContentAUrlList(byVal content)
    on error resume next 
    dim s, c, setExecute, setValue, rep 
    c = "" 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "<a [^>]*href *= *[""']([^""'> ]+)[^>]*>" 
        set setExecute = rep.execute(content)
            for each setValue in setExecute
                s = setValue.subMatches(0) 
                if inStr(vbCrLf & c & vbCrLf, vbCrLf & s & vbCrLf) = false then
                    c = c & s & vbCrLf 
                end if 
            next 
        set setExecute = nothing 
    set rep = nothing 
    if c <> "" then c = left(c, len(c) - 2) 
    getContentAUrlList = c 
    if err then call doError(err.description, "GetHrefUrlTitleList 获得内容中链接与标题列表 函数出错，C=" & c) 
end function 


'获得图片中网址
function regExp_GetImgUrlList(byVal content, byVal sType)
    on error resume next 
    dim setExecute, setValue, rep, imgType, s, c 
    c = "" 
    sType = LCase(sType) 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "<img *src *= *[""|'| ]*([^""'> ]+)" 
        set setExecute = rep.execute(content)
            for each setValue in setExecute
                s = setValue.subMatches(0) 
                imgType = right(s, len(s) - inStrRev(s, ".")) 
                if sType = imgType or sType = "全部" or sType = "" then
                    if inStr(vbCrLf & c & vbCrLf, vbCrLf & s & vbCrLf) = false then
                        c = c & s & vbCrLf 
                    end if 
                end if 
            next 
        set setExecute = nothing 
    set rep = nothing 
    if c <> "" then c = left(c, len(c) - 2) 
    regExp_GetImgUrlList = c 
    if err then call doError(err.description, "GetIMGUrlList 获得图片中网址 函数出错，c=" & c) 
end function 
'获得图片中网址 (辅助)
function getIMG(content)
    getIMG = regExp_GetImgUrlList(content, "全部") 
end function 
'获得图片中JPG网址 (辅助)
function getIMGJpg(content)
    getIMGJpg = regExp_GetImgUrlList(content, "JPG") 
end function 
'获得图片中Gif网址 (辅助)
function getIMGGif(content)
    getIMGGif = regExp_GetImgUrlList(content, "GIF") 
end function 
'获得图片中Bmp网址 (辅助)
function getIMGBmp(content)
    getIMGBmp = regExp_GetImgUrlList(content, "Bmp") 
end function 
'获得ASP自定函数列表，配合获得ASP中自定函数(2013,9,30
function getASPFunctionList(byVal content)
    on error resume next 
    dim setExecute, setValue, rep, imgType, s, c 
    c = "" 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "(sub|function) .*?\)" 
        'Rep.Pattern = "\s(sub|function)( .*?)(\(.*)|\s(sub|function)( .*?[ |    ])"            '更精准20150722
        set setExecute = rep.execute(content)
            for each setValue in setExecute
                c = c & setValue & vbCrLf 
            next 
        set setExecute = nothing 
    set rep = nothing 
    if c <> "" then c = left(c, len(c) - 2) 
    getASPFunctionList = c 
    if err then call doError(err.description, "GetASPFunctionList 获得ASP函数列表 函数出错，c=" & c) 
end function 
'获得ASP自定函数列表，配合获得ASP中自定函数(2013,9,30
function getASPDimFunction(byVal content, funValue, funName, funDim)
    'On Error Resume Next
    content = replace(content, "()", "( )")                                         '为防止截取不到函数
    dim setExecute, setValue, rep 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        'Rep.Pattern = "(sub|function) .*?\)"
        content = regExp_Replace(content, "ByVal ", "") 
        rep.pattern = "(sub|function) *([^\(]+) *\(([^\)]+)\)" 
        set setExecute = rep.execute(content)
            for each setValue in setExecute
                '{字符可以判断是JS函数
                if inStr(funValue, "{") = false then
                    funValue = funValue & trim(setValue) & vbCrLf 
                    funName = funName & trim(setValue.subMatches(1)) & vbCrLf 
                    funDim = funDim & replace(setValue.subMatches(2), " ", "") & vbCrLf 
                end if 
            next 
        set setExecute = nothing 
    set rep = nothing 
    'If FunDim <> "" Then FunDim = Left(FunDim, Len(FunDim)-2)                '不让用太怪了
    getASPDimFunction = funValue 
    if err then call doError(err.description, "GetASPFunctionList 获得ASP函数列表 函数出错，") 
end function 
'Response.Write(StrLength("中国121aa"))
'正则表达式获得字符长度 中文二个字符
function strLength(str)
    dim rep, lens, i 
    lens = 0 
    set rep = createObject("VBscript.RegExp")
        rep.global = true 
        rep.ignoreCase = true 
        rep.pattern = "[\u4E00-\u9FA5\uF900-\uFA2D]" 
        for each i in rep.execute(str)
            lens = lens + 1 
        next 
    set rep = nothing 
    lens = lens + len(str) 
    strLength = lens 
end function 
'正则表达式获得字符长度 中文二个字符
function regExpGetLenght(str)
    regExpGetLenght = strLength(str) 
end function 
'正则表达式获得字符长度 中文二个字符
function stringLength(str)
    stringLength = strLength(str) 
end function 
'获得HTML中Css
function getCssHref(byVal content)
    on error resume next 
    dim setExecute, setValue, rep, imgType, s, c 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "<link .*?href *= *[""|'| ]*([^""'>]+)" 
        set setExecute = rep.execute(content)
            for each setValue in setExecute
                if inStr(LCase(setValue), "stylesheet") > 0 then
                    s = setValue.subMatches(0) 
                    c = c & s & vbCrLf 
                end if 
            next 
        set setExecute = nothing 
    set rep = nothing 
    if c <> "" then c = left(c, len(c) - 2) 
    getCssHref = c 
    if err then call doError(err.description, "GetCssHref 获得HTML中Css 函数出错，C =" & c) 
end function 
'获得HTML中Js
function getJsSrc(byVal content)
    on error resume next 
    dim setExecute, setValue, rep, imgType, s, c 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "<script .*?src *= *[""|'| ]*([^""'>]+)" 
        set setExecute = rep.execute(content)
            for each setValue in setExecute
                s = setValue.subMatches(0) 
                c = c & s & vbCrLf 
            next 
        set setExecute = nothing 
    set rep = nothing 
    if c <> "" then c = left(c, len(c) - 2) 
    getJsSrc = c 
    if err then call doError(err.description, "GetJsSrc 获得HTML中Js 函数出错，C =" & c) 
end function 
'删除HTML中<scirpt
function delHTMLScript(byVal strHtml)
    on error resume next 
    dim rep, strOutput 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "<script.*</"&"script>" 
        strOutput = rep.replace(strHtml, "") 
        delHTMLScript = strOutput 
    set rep = nothing 
    if err then call doError(err.description, "删除HTML中<scirpt 函数出错，") 
end function 
'获得HTML中keywords
function getMeta(byVal content, sType, nOK)
    on error resume next 
    dim setExecute, setValue, rep, imgType, s, c 
    c = "" 
    sType = LCase(sType) 
    nOK = 0 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "<meta .*?content *= *[""|'| ]*([^""'>]+)" 
        set setExecute = rep.execute(content)
            for each setValue in setExecute
                if inStr(LCase(setValue), sType) > 0 then
                    s = setValue.subMatches(0) 
                    c = c & s & vbCrLf 
                    nOK = nOK + 1 
                end if 
            next 
        set setExecute = nothing 
    set rep = nothing 
    if c <> "" then c = left(c, len(c) - 2) 
    getMeta = c 
    if err then call doError(err.description, "GetKeyWords 获得HTML中keywords 函数出错，C =" & c) 
end function 
'去除HTML注释
function delHtmlNote(contentStr)
    dim clsTempLoseStr, regex 
    clsTempLoseStr = CStr(contentStr) 
    set regex = createObject("VBscript.RegExp")
        regex.pattern = "<!--\/*[^<>]*-->" 
        regex.ignoreCase = true 
        regex.global = true 
        clsTempLoseStr = regex.replace(clsTempLoseStr, "") 
        delHtmlNote = clsTempLoseStr 
    set regex = nothing 
end function 
'删除自己定义的HTML注释
function delHtmlMyNote(contentStr)
    dim clsTempLoseStr, regex 
    clsTempLoseStr = CStr(contentStr) 
    set regex = createObject("VBscript.RegExp")
        regex.pattern = "<!--#\/*[^<>]*#-->" 
        regex.ignoreCase = true 
        regex.global = true 
        clsTempLoseStr = regex.replace(clsTempLoseStr, "") 
        delHtmlMyNote = clsTempLoseStr 
    set regex = nothing 
end function 
'获得内容中图片列表
function getStrImgList(byVal content)
    content = replace(content, "'", """") 
    dim result, result1, m, n, regex 
    result = "" : result1 = "" 
    set regex = createObject("VBscript.RegExp")
        'Set regEx = CreateObject("VBscript.RegExp")
        regex.ignoreCase = true 
        regex.global = true 
        regex.pattern = "<img [^>]*src=""([^"">]+)[^>]+>" 
        set m = regex.execute(content)
            for each n in m
                result = result & n & "|" 
                result1 = result1 & n.subMatches(0) & "|" 
            next 
        set m = nothing 
    set regex = nothing 
    if result <> "" then
        result = left(result, len(result) - 1) 
        result1 = left(result1, len(result1) - 1) 
    end if 
    'result=split(result,"|") '存储<img>
    'result1=split(result1,"|") '存储图像地址
    getStrImgList = result1 
end function 
'获得邮箱列表
function getEMailList(content)                                          'patrn:需要查找的字符 strng:被查找的字符串
    dim regex, match, matches, retStr                                               '创建变量。
    set regex = createObject("VBscript.RegExp")                                     '创建正则表达式。
        regex.pattern = "\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"    '设置模式。"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        regex.ignoreCase = true                                                         '设置是否区分大小写。
        regex.global = true                                                             '设置全程匹配。
        retStr = "" 
        set matches = regex.execute(content)                                            '执行搜索。
            for each match in matches                                      '循环遍历Matches集合。
                if inStr("," & retStr & ",", "," & match.value & ",") = 0 then
                    retStr = retStr & match.value & "," 
                end if 
            next 
        set matches = nothing 
    set regex = nothing 
    if retStr <> "" then retStr = left(retStr, len(retStr) - 1) 
    getEMailList = retStr 
end function 
'将html内容代码里的标签大写转换成小写
function oflink_lcasetag(content)
    dim regex, match, matches                                                       '建立变量。
    set regex = createObject("VBscript.RegExp")                                     '建立正则表达式。
        regex.pattern = "<.+?\>"                                                     '设置模式。
        regex.ignoreCase = true                                                         '设置是否区分字符大小写。
        regex.global = true                                                             '设置全局可用性。
        set matches = regex.execute(content)                                            '执行搜索。
            content = content 
            for each match in matches                                      '遍历匹配集合。
                content = replace(content, match.value, LCase(match.value)) 
            next 
            oflink_lcasetag = content 
        set matches = nothing 
    set regex = nothing 
end function 
'==================================================
'函数名：ScriptHtml
'作  用：过滤html标记
'参  数：ConStr ------ 要过滤的字符串   1为删除开始标记  3为删除前后两标记 2为测试无效果
'==================================================
function scriptHtml(byVal conStr, tagName, FType)
    dim re 
    set re = createObject("VBscript.RegExp")
        re.ignoreCase = true 
        re.global = true 
        select case FType
            case 1
                re.pattern = "<" & tagName & "([^>])*>" 
                conStr = re.replace(conStr, "") 
            case 2
                re.pattern = "<" & tagName & "([^>])*>.*?</" & tagName & "([^>])*>" 
                conStr = re.replace(conStr, "") 
            case 3
                re.pattern = "<" & tagName & "([^>])*>" 
                conStr = re.replace(conStr, "") 
                re.pattern = "</" & tagName & "([^>])*>" 
                conStr = re.replace(conStr, "") 
        end select
        scriptHtml = conStr 
    set re = nothing 
end function 


'截取内容，可指定3个匹配参数 [$Array$]为行 [$Split$]为列    2014 12 10
'例子一
'Content = " tablename='ListMenu' bigclassname='系统管理' smallclassname='Robots在线修改' sort='3' url='Robots.Asp' display='1' "
'Call Rw(GetRegExp(" (.*?)\=.*?'(.*?)'", Content, 0,1,""))'
function getRegExp(patrn, strng, nSplit1, nSplit2, nSplit3)
    dim regex, match, matches, c, splitYes, s 
    c = "" 
    if nSplit1 <> "" then nSplit1 = CInt(nSplit1)                                   '当前分割数
    if nSplit2 <> "" then nSplit2 = CInt(nSplit2)                                   '当前分割数
    if nSplit3 <> "" then nSplit3 = CInt(nSplit3)                                   '当前分割数
    splitYes = false                                                                '分割是否为
    if nSplit1 <> "" or nSplit2 <> "" or nSplit3 <> "" then splitYes = true 
    set regex = createObject("VBscript.RegExp")                                     '建立正则表达式。
        regex.pattern = patrn                                                           '设置模式。
        regex.ignoreCase = true                                                         '设置是否区分字符大小写。
        regex.global = true                                                             '设置全局可用性。
        set matches = regex.execute(strng)                                              '执行搜索。
            for each match in matches                                      '遍历匹配集合。
                if splitYes = true then
                    s = "" 
                    if nSplit1 <> "" then
                        s = s & match.subMatches(nSplit1) 
                    end if 
                    if nSplit2 <> "" then
                        if s <> "" then s = s & "[$Split$]" 
                        s = s & match.subMatches(nSplit2) 
                    end if 
                    if nSplit3 <> "" then
                        if s <> "" then s = s & "[$Split$]" 
                        s = s & match.subMatches(nSplit3) 
                    end if 
                    if s <> "" then c = c & s & "[$Array$]" 
                else
                    c = c & match & "[$Array$]" 
                end if 
            next 
            if c <> "" then c = left(c, len(c) - 9) 
            getRegExp = c 
end function



'获得内容里Img与Js中链接  SType=1为不重复   20150126
function getImgJsUrl(content, sType)
    dim s, c, splStr, url, urlList 
    sType = LCase(sType)                                                            '类型转字小写并且是字符类型
    c = regExpGetStr("<[img|script][^<>]*src[^<>]*[\/]?>", content, 2) 
    splStr = split(c, "[$Array$]") 
    urlList = "" 
    for each s in splStr
        url = regExpGetStr("src=[""|']?([^""' ]*)([""|']?).*[\/]?>", s, 1) 
        if sType = "1" or sType = "不重复" then
            if inStr(vbCrLf & urlList & vbCrLf, vbCrLf & url & vbCrLf) then
                url = "" 
            end if 
        end if 
        if url <> "" then
            urlList = urlList & url & vbCrLf 
        end if 
    next 
    if urlList <> "" then urlList = left(urlList, len(urlList) - 2) 
    getImgJsUrl = urlList 
end function 
'正则表达式处理20150126
'提取网站中标题、关键词、描述
'WebTitle = RegExpGetStr("<TITLE>(.*)</TITLE>", Content, 1)                    '第一种
'WebTitle = RegExpGetStr("<TITLE>([^<>]*)</TITLE>", Content, 1)                    '第二种 完整
'WebDes = RegExpGetStr("<meta[^<>]*description[^<>]*[\/]?>", Content, 0)
'WebDes = RegExpGetStr("content=[""|']?([^""' ]*)([""|']?).*[\/]?>", WebDes, 1)
'WebKey = RegExpGetStr("<meta[^<>]*keywords[^<>]*[\/]?>", Content, 0)
'WebKey = RegExpGetStr("content=[""|']?([^""' ]*)([""|']?).*[\/]?>", WebKey, 1)
function regExpGetStr(patternStr, content, sType)
    dim re, remoteFileurl, remoteFile, c 
    sType = cstr(sType) 
    set re = createObject("VBscript.RegExp")
        re.ignoreCase = true 
        re.global = true 
        re.pattern = patternStr 
        set remoteFile = re.execute(content)
            for each remoteFileurl in remoteFile
                if sType = "1" then
                    remoteFileurl = re.replace(remoteFileurl, "$1") 
                elseIf sType = "2" then
                    c = c & remoteFileurl & "[$Array$]" 
                end if 
                regExpGetStr = remoteFileurl 
            next 
        set remoteFile = nothing 
    set re = nothing 
    if sType = "2" then
        if c <> "" then c = left(c, len(c) - 9) 
        regExpGetStr = c 
    end if 
end function 

'获得IP地址
function newGetPingIP(httpurl)
    dim cmdPath, content, splStr 
    dim remoteUrl, url, startStr, endStr 
    newGetPingIP = "" 
    cmdPath = "/备份/cmd.exe" 
    'HttpUrl="www.intcochina.com.cn"
    content = getPingInfo(cmdPath, httpurl) 
    splStr = split(content, "Request timed out.") 
    'Call Rw(Content & "," & Ubound(SplStr))
    if uBound(splStr) >= 4 then
        url = trim(replace(replace(replace(httpurl, "http://", ""), "www.", ""), "/", "")) 
        remoteUrl = "http://whois.www.net.cn/whois/api_webinfo?host=" & url & "&_=" & getRnd(9) 
        content = getHttpPage(remoteUrl, "utf-8") 
        startStr = """ip"":""" : endStr = """" 
        if inStr(content, startStr) > 0 and inStr(content, endStr) > 0 then
            newGetPingIP = strCut(content, startStr, endStr, 2) 
        end if 
    else
        startStr = " [" : endStr = "]" 
        if inStr(content, startStr) > 0 and inStr(content, endStr) > 0 then
            newGetPingIP = strCut(content, startStr, endStr, 2) 
        else
            newGetPingIP = "NO" 
        'Call Eerr("S",S)
        end if 
    end if 
end function 
'用Cmd的Ping获得网址IP 用法：Response.Write(GetPingIP("/cmd.exe", "www.shuyate.cn"))
function getPingIP(cmdPath, httpurl)
    dim s, startStr, endStr 
    'StartStr = HttpUrl & " [" : EndStr="]"
    startStr = " [" : endStr = "]" 
    s = getPingInfo(cmdPath, httpurl) 
    if inStr(s, startStr) > 0 and inStr(s, endStr) > 0 then
        getPingIP = strCut(s, startStr, endStr, 2) 
    else
        getPingIP = "NO" 
    'Call Eerr("S",S)
    end if 
end function 
'获得ping信息  getPingInfo("C:\Windows\winsxs\wow64_microsoft-windows-commandprompt_31bf3856ad364e35_6.1.7601.17514_none_f387767e655cd5ab\cmd.exe", " 10.10.10.2")
function getPingInfo(cmdPath, httpurl)
    dim wS, dD 
    set wS = createObject("WScript.Shell")
        call handlePath(cmdPath)                                                        '获得完整路径
        set dD = wS.exec(cmdPath & " /c ping " & httpurl)
            getPingInfo = dD.stdout.readall 
end function
'显示真与假 待用
function regExpTest(str, s_Pattern)
    dim re 
    set re = createObject("VBscript.RegExp")
        re.ignoreCase = true 
        re.global = true 
        re.pattern = s_Pattern 
        regExpTest = re.test(str) 
    set re = nothing 
end function 

'正则表达式获得内容 给asp转php里用
function getRegExpStr(byVal content, byVal patternStr, byVal replaceStr)
    on error resume next 
    dim s, c, setExecute, setValue, rep, sNew 
    c = "" 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = patternStr 
        set setExecute = rep.execute(content)
            for each setValue in setExecute
                sNew = replace(replaceStr, "\S1\", setValue.subMatches(0)) 
                sNew = replace(sNew, "\S2\", setValue.subMatches(1)) 
                sNew = replace(sNew, "\S3\", setValue.subMatches(2)) 
                sNew = replace(sNew, "\S4\", setValue.subMatches(3)) 
                sNew = replace(sNew, "\S5\", setValue.subMatches(4)) 
                content = replace(content, setValue, sNew) 
            next 
        set setExecute = nothing 
    set rep = nothing 
    getRegExpStr = content 
end function 



'替换CSS目录 （20150814）  call rwend(regExpReplaceCssDir("<link rel=""stylesheet"" href=""Images/jquery.mobile-1.4.5.min.css"">", "css/"))
function regExpReplaceCssDir(byVal content, addToDir)
    dim setExecute, setValue, rep, replaceStr 
    dim filePath, fileName 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "<link .*?href *= *[""|'| ]*([^""'>]+)" 
        set setExecute = rep.execute(content)
            for each setValue in setExecute
                if inStr(LCase(setValue), "stylesheet") > 0 then
                    filePath = setValue.subMatches(0) 
                    fileName = getStrFileName(filePath) 
                    replaceStr = replace(setValue, filePath, addToDir & fileName) 
                    content = replace(content, setValue, replaceStr) 
                end if 
            next 
        set setExecute = nothing 
    set rep = nothing 
    regExpReplaceCssDir = content 
end function 


'删除空行
function deleteNullRow(byVal content)
    deleteNullRow = regExp_Replace(content, "\r\n\s*\r\n", "")                      '删除空行
end function 

'空链接加默认名称 20160405  待测试
function nullLinkAddDefaultName(content)
    dim rep 
    set rep = createObject("VBscript.RegExp")
        rep.ignoreCase = true 
        rep.global = true 
        rep.pattern = "<a [^>]*href *= *[""'][""'][^>]*>" 
        content = rep.replace(content, "<a href='index.html'>") 
    set rep = nothing 
    nullLinkAddDefaultName = content 
end function 
%>   
