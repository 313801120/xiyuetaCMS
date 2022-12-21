<% 
'XML Microsoft.XMLHTTP组件操作大全 (2013,9,27)
'下载远程文件  [出错时 待完善] Call SaveRemoteFile(RemoteFileUrl, LocalFileName)
function saveRemoteFile(byVal remoteFileurl, byVal localFileName)
    on error resume next 
    saveRemoteFile = 0 
    dim ads, xmlHttp, getRemoteData 
    call handlePath(localFileName)                                                  '获得完整路径
    set xmlHttp = createObject("Microsoft.XMLHTTP") 
        with xmlHttp 
            call .open("Get", remoteFileurl, false, "", "")                                       'Flase同步,True异步
            .send
            if err then
                saveRemoteFile = 9999 : exit function                         '[网址错误] 
            end if
            getRemoteData =.responseBody
            saveRemoteFile =.status
        end with
    set xmlHttp = nothing
    set ads = createObject("ADODB.Stream")
        with ads
            .type = 1
            .open
            call .write(getRemoteData)
            'Response.Write("<br><b>["&LocalFileName&"]</b><br>")
			'call rwend("|"& localFileName &"|")
            call .saveToFile(localFileName, 2)
            .cancel 
            .close 
        end with 
    set ads = nothing 
	if err then
		saveRemoteFile=9999
	end if
	if err then
		'call eerr(remoteFileurl,  localFileName)
		call echoRed("下载出错",remoteFileurl & "==>>" & localFileName)
	end if
	'If Err Then call doError(Err.Description, "SaveRemoteFile 下载远程文件 函数出错，RemoteFileUrl=" & remoteFileurl & "<hr>LocalFileName=" & localFileName)
end function 
'保存第二种 可设置来访网址
function saveRemoteFile_WinHttp(httpurl,localFileName, refererUrl)
    on error resume next 
	dim cookiesStr, postStr, sSetChar,newUrl
    dim winHttp,ads,getRemoteData
    call handlePath(localFileName) 
    set winHttp = createObject("WinHttp.WinHttpRequest.5.1")
        with winHttp
            '来路网址为空 则为当前网址域名
            if refererUrl = "" then
                refererUrl = getwebsite(httpurl)  
            end if 
            '设置cookies字符串不能为空
            if cookiesStr = "" then
                cookiesStr = "ASPSESSIONIDAQACTAQB=HKFHJOPDOMAIKGMPGBJJDKLJ;" 
            end if 
            '字符编号
            sSetChar = trim(sSetChar) 
            if sSetChar = "" or sSetChar = "1" or sSetChar = "gb2312" then
                sSetChar = "gb2312" 
            else
                sSetChar = "utf-8" 
            end if 

            '设置参数
            .setTimeOuts 60000, 60000, 60000, 3000                                          '设置操作超时时间
            '.SetTimeouts resolveTimeout, connectTimeout, sendTimeout, receiveTimeout
            'resolveTimeout = 10000 '解析 DNS 名字的超时时间，10000 毫秒。
            'connectTimeout = 10000 '建立 Winsock 连接的超时时间，10000 毫秒。
            'sendTimeout = 120000 '发送数据的超时时间，120000 毫秒。
            'receiveTimeout = 60000 '接收 response 的超时时间，60000 毫秒。
            .option(4) = 13056                                                              '忽略错误标志
            .option(6) = false                                                              '为 True 时，当请求页面重定向跳转时自动跳转，False 不自动跳转，截取服务端返回的302状态。
            '.Open "GET", "http://www.baidu.com/", False 'GET 或 POST, Url, False 同步方式；True 异步方式
            .open "GET", httpurl, false 
            '组成 HTTP 头信息
            .setRequestHeader "Accept", "*/*"                                               '接受数据类型
            .setRequestHeader "Accept-Language", "zh-cn,zh"                                 '用户系统语言
            .setRequestHeader "User-Agent", "Mozilla/6.0"                                   '用户浏览器信息
            .setRequestHeader "Content-Type", "application/x-www-form-urlencoded"           '编码方式
            .setRequestHeader "Referer", refererUrl                                         '来路
            .setRequestHeader "Connection", "Close"                                         'Close  不保持连接，Keep-Alive  保持连接（持久连接）
            '.SetRequestHeader "Accept-Encoding", "gzip, deflate" '如果发送，会返回 gzip, deflate 压缩过的编码
            '.SetRequestHeader "Content-Length", Len(Str) '内容长度，Post 方式用的。
            .setRequestHeader "Cookie", cookiesStr                                          '设置 Cookie   直接把cookies字符串放进去就可以了，  获得方法:IE》F12》网络

            postStr = handlePostCookiesParame(postStr, "post")

            '发送数据
            .send(postStr)                                                                  'Post 方式：.Send (参数)
            .waitForResponse                                                                '等待返回请求，XMLHTTP中也可以使用
			
		 
            getRemoteData =.responseBody 
			saveRemoteFile_WinHttp =.Status   
			
			'追加于20200313
			'暂时性转移
			if .Status=302 then
				newUrl=winHttp.GetResponseHeader("Location")
				if getWebSite(newUrl)<>"" and newUrl<>httpurl then
					'call echo("newUrl",newUrl):doevents
					saveRemoteFile_WinHttp=saveRemoteFile_WinHttp(newUrl,localFileName, refererUrl)		'重复提取
					exit function
				else
					saveRemoteFile_WinHttp=9999
					exit function
				end if
			'永久性转移
			elseif .Status=301 then
				saveRemoteFile_WinHttp=9999
				exit function
			end if
			
			
			set ads = createObject("ADODB.Stream")
				with ads
					.type = 1 
					.open 
					call .write(getRemoteData ) 
					'Response.Write("<br><b>["&LocalFileName&"]</b><br>")
					'call rwend("|"& localFileName &"|")
					call .saveToFile(localFileName, 2) 
					.cancel 
					.close 
				end with 
			set ads = nothing 
			if err then
				saveRemoteFile_WinHttp=9999
			end if

			if err then
				' call eerr(err.description,  httpurl & "==>>" & localFileName)  '不停止20221202'
			end if 
        end with  
	if err then
		saveRemoteFile_WinHttp=9999
	end if
end function




'下载远程文件 (辅助)
function downFile(remoteFileurl, localFileName)
    downFile = saveRemoteFile(remoteFileurl, localFileName) 
end function 


'用xml获得网页状态
function xmlGetStatus(byVal url)
    on error resume next 
    dim http 
    set http = createObject("Microsoft.XMLHTTP")
        with http
            call .open("Get", url, false) 
            call .setRequestHeader("cache-control", "no-cache") 
            call .setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
            call .send 
            xmlGetStatus =.status 
        end with 
    set http = nothing 
    'responseBody： 结果返回为无符号整数数组。
    'responseStream： 结果返回为IStream流。
    'responseText ： 结果返回为字符串。
'responseXML： 结果返回为XML格式数据。
end function 



'Post发送以Gb2312方式
'例20150105 Call Echo(Url,xmlPost("http://127.0.0.1/5.asp", "title='"& escape("标题"& vbCrlf &"1") & "'&content='内容'&UpDateTime='时间'"))
function xmlPost(url, postStr)
	dim dataArray
    dataArray = handleXMLPost(url, postStr, "gb2312")
	xmlPost=dataArray(0) 
end function 


'Post发送以Utf-8方式
function utfXMLPost(url, postStr)
    utfXMLPost = handleXMLPost(url, postStr, "utf-8")(0) 
end function 


'用xml传网页表单数据, 发送中文耍处理(如 桌=%D7%C0) (已完善)
function handleXMLPost(byVal url, byVal postStr, sSetChar)
    dim http, dataArray(6), content 
    sSetChar = handleStrCharSet(sSetChar) 
    set http = createObject("Microsoft.XMLHTTP")
        call http.open("POST", url, false) 
        call http.setRequestHeader("cache-control", "no-cache") 
        call http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
        call http.setRequestHeader("Connection", "close") 
        call http.setRequestHeader("Content-Length", len(postStr))                      '可以不需要

        call http.send(cStr(postStr))			'转成字符，为了在vb.net里可以用，晕，不知道为什么20161025 
        if http.readyState <> 4 then
            content = "error" 
        else
            content = bytesToBstr(http.responseBody, sSetChar) 
        'content = bytes2BSTR(Http.responseBody)    '这个要比上面那个好用   有时也不好用
        end if 
        dataArray(0) = content 
        dataArray(1) = http.status 
        dataArray(2) = http.responseBody                                                '字节
        handleXMLPost = dataArray 
    set http = nothing 
end function 


'用xml传网页表单数据, 发送中文耍处理(如 桌=%D7%C0) (已完善)
function xmlGet(byVal url)
    xmlGet = handleXmlGet(url, "gb2312")(0) 
end function 


'处理get方法获得内容
function handleXmlGet(byVal url, sSetChar)
    'on error resume next
    dim http, dataArray(1), content 
    'call echo("sSetChar",sSetChar)
    sSetChar = handleStrCharSet(sSetChar) 
    set http = createObject("Microsoft.XMLHTTP")
        call http.open("Get", url, false) 
        call http.setRequestHeader("cache-control", "no-cache") 
        call http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
        'Call http.SetRequestHeader("Cookie", "Admin%5FPassWord=admin; Admin%5FUserName=admin; CNZZDATA5865366=cnzz_eid%3D1338721452-1438760869-%26ntime%3D1438760869; style=default; sswbr=1; Hm_lvt_c39492dd0d3beab26d196a53cbd72d54=1440725802,1442725700; BD_UPN=112451; ASPSESSIONIDSCDQDRAC=CNOHMAHANIPHOFLHKCIKFIGH")
        call http.send 
        if http.readyState <> 4 then
            content = "error" 
        else
            'call eerr("sSetChar",sSetChar)
            content = bytesToBstr(http.responseBody, sSetChar) 
        'content = bytes2BSTR(Http.responseBody)        '这个要比上面那个好用我了   有时也不好用
        end if 
        dataArray(0) = content 
        dataArray(1) = http.status 
    set http = nothing 
    if err then
        dataArray(0) = "" 
        dataArray(1) = -1 
    end if 
    handleXmlGet = dataArray 
end function 


'Cookies提交 (已完善)
function cookiesPost(postUrl, postCok)
    cookiesPost = handleCookiesPost(postUrl, postCok, "gb2312") 
end function 


'处理Cookies提交
function handleCookiesPost(postUrl, postCok, sSetChar)
    dim http, dataArray(1), content 
    sSetChar = handleStrCharSet(sSetChar) 
    postCok = "ASPSESSIONIDAQACTAQB=HKFHJOPDOMAIKGMPGBJJDKLJ;" & postCok 
    set http = createObject("msxml2.serverXMLHTTP")
        call http.open("POST", postUrl, false) 
        '.SetRequestHeader "Content-Length", Len(PostStr)        '可以不需要
        call http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
        '.SetRequestHeader "Referer", PostRef
        call http.setRequestHeader("Cookie", postCok) 
        call http.send 
        if http.readyState <> 4 then
            content = "error" 
        else
            content = bytesToBstr(http.responseBody, sSetChar) 
        'content = bytes2BSTR(Http.responseBody)    '这个要比上面那个好用我了   有时也不好用
        end if 
        dataArray(0) = content 
        dataArray(1) = http.status 
    set http = nothing 
    handleCookiesPost = dataArray 
end function 


'功能：ASP获取远程文件大小   待测试
'参数：url 远程文件地址
'返回：远程文件大小(单位：字节)
function getRemoteFileSize(url)
    dim xmlHttp 
    set xmlHttp = createObject("MSXML2.XMLHTTP")
        with xmlHttp
            .open "get", url, false
            call.setRequestHeader("range", "bytes=-1") 
            .send 
            getRemoteFileSize = split(.getResponseHeader("Content-Range"), "/")(1) 
        end with 
    set xmlHttp = nothing 
end function 



'下载文件程序
sub popupDownFile(path)
    dim OSM, SZ 
    call handlePath(path)                                                           '获得完整路径
    response.clear 
    set OSM = createObject("ADODB.Stream")
        OSM.open 
        OSM.type = 1 
        call OSM.loadFromFile(path) 
        SZ = inStrRev(path, "\") + 1 
        call response.addHeader( "Content-Disposition", "attachment; filename=" & mid(path, SZ) )
        call response.addHeader ( "Content-Length", OSM.size )
        response.charset = "UTF-8" 
        response.contentType = "application/octet-stream" 
        call response.binaryWrite( OSM.read )
        response.flush 
        response.write("") 
        OSM.close 
    set OSM = nothing 
end sub 
'下载远程文件
sub downRemoteFile(path)
    call popupDownFile(path)
end sub 

'读文件转Base64
function readFileTBase64(fileName) 
	readFileTBase64 = imagesToBase64(fileName) 
end function

'图片转Base64 20150722引用网上 call echo("images/error.gif",ImagesToBase64("images/error.gif"))
function imagesToBase64(fileName)
    dim xml 
    dim root 
    dim fs 
    dim filePath 
    dim objStream 
    dim objXMLDoc 
    dim base64 
    dim getFileExt 
    '定义变量完结
    '创建对像
    filePath = handlePath(fileName) 
    getFileExt = mid(filePath, inStrRev(filePath, ".") + 1) 
    set objXMLDoc = createObject("msxml2.FreeThreadedDOMDocument")
        '设定生成XML文档的根为 Base64Data
        call objXMLDoc.loadxml("<?xml version='1.0'?><Base64Data />") 
        set fs = createObject("Scripting.FileSystemObject")                             ''服务器需要FSO组件
            if fs.fileExists(filePath) then                                                 '判断File文件是否存在
                '用 stream 来读取数据
                set objStream = createObject("ADODB.Stream")
                    objStream.type = 1 
                    objStream.open 
                    call objStream.loadFromFile(filePath) 


                    objXMLDoc.documentElement.dataType = "bin.base64" 
                    objXMLDoc.documentElement.nodeTypedValue = objStream.read 
                    '数据流读取结束.得到了值 objXMLDoc
                    '创建XML文件
                    set xml = createObject("msxml2.FreeThreadedDOMDocument")
                        call xml.load(objXMLDoc) 
                        if xml.readyState > 2 then
                            set root = xml.getElementsByTagName("Base64Data")
                                base64="<img src=""data:image/" & getFileExt & ";base64,"& replace(root.Item(0).Text,chr(10),"")&""">"
                                base64 = "data:image/" & getFileExt & ";base64," & vbCrLf & root.item(0).text
                                base64 = root.item(0).text 
                        else
                            base64 = "" 
                        end if 
                            set xml = nothing
                    set objStream = nothing
            else
                base64 = "" 
            end if 

                set fs = nothing
        set objXMLDoc = nothing


        imagesToBase64 = base64 
end function

function handleSaveBase64(base64Data)
    dim nLen,sCheck 
	sCheck=";base64,"
	nLen=instr(base64Data,sCheck)
	'截取字符串
	if nLen>0 then
		base64Data=mid(base64Data,nLen+len(sCheck)) 
	end if
	handleSaveBase64=base64Data
end function

'Base64转图片 可以使用20170326   call base64ToImages("1a1.jpg",imagesToBase64("1.jpg"))
function base64ToImages(saveImagePath,byval base64Data)
    dim xmlStr 
    saveImagePath = handlePath(saveImagePath) 
	base64Data=handleSaveBase64(base64Data)
	
    xmlStr = "<data>" & base64Data & "</data>" 
    dim xml : set xml = createObject("MSXML2.DOMDocument")
        dim stm : set stm = createObject("ADODB.Stream")
            xml.resolveExternals = false 
            call xml.loadxml(xmlStr) 
            call xml.documentElement.setAttribute("xmlns:dt", "urn:schemas-microsoft-com:datatypes") 
            xml.documentElement.dataType = "bin.base64" 
            stm.type = 1                                                                    'adTypeBinary
            stm.open 
            call stm.write(xml.documentElement.nodeTypedValue) 
			'call echo("saveImagePath",saveImagePath)
            call stm.saveToFile(saveImagePath) 
            stm.close 
        set xml = nothing 
    set stm = nothing 
end function 

'SQL注入部分

'获得SQL注入内容
function getSqlInContent(httpurl, canShu, methodType, selectWebShowType)
    getSqlInContent = handleSqlIn(httpurl, canShu, methodType, selectWebShowType, "gb2312")(0) 
end function 


'处理获得SQL注入信息 如 call rwend( handleSqlIn("http://127.0.0.1/4.asp?", "&url=aaa3222333&url2=sss333333", "cookies", 1, "utf-8")(0) )
function handleSqlIn(httpurl, canShu, methodType, selectWebShowType, txtCharSet)
    dim content, dataArray                                                          '这个(9)不能要，要不然就会报错，不能给数组赋值
    methodType = LCase(methodType) 
    'Post不行  待从家里弄
    if methodType = "post" then
        dataArray = handleXMLPost(httpurl, handlePostCookiesParame(canShu, "post"), txtCharSet) 
    'Get这样可以
    elseIf methodType = "get" then
        canShu = handlUrlCanShu(canShu)                                                 '参数处理
        dataArray = handleXmlGet(httpurl & canShu, txtCharSet) 

    'Cookies可以用
    elseIf methodType = "cookies" then
        dataArray = handleCookiesPost(httpurl, handlePostCookiesParame(canShu, "cookies"), txtCharSet) 

    end if 
    if CStr(selectWebShowType) = "0" then
        dataArray(0) = replace(dataArray(0), "<", "&lt;") 
    elseIf CStr(selectWebShowType) = "1" then
        dataArray(0) = replace(dataArray(0), "<br>", vbCrLf) 
        dataArray(0) = delHtml(dataArray(0)) 

    end if 
    handleSqlIn = dataArray 
end function 



'判断是否可以注入
function sqlInUrl(byVal httpurl)
    dim xmlOject, isTrue1, isTrue2 
    sqlInUrl = false 
    isTrue1 = false : isTrue2 = false 
    set xmlOject = createObject("Microsoft.XMLHTTP")
        with xmlOject
            .open "GET", httpurl, false                                                      '测试页面是否存在
            .send 
            if xmlOject.status <> 200 then
                exit function 
            end if 
            call.open("GET", httpurl & " And 1=1", false)                                   '测试页面是否存在
            .send 
            isTrue1 =.status 

            call.open("GET", httpurl & " And 1=2", false)                                   '测试页面是否存在
            .send("") 
            isTrue2 =.status 
        end with 
    set xmlOject = nothing 
    if isTrue1 = 200 and isTrue2 = 500 then sqlInUrl = true 
end function 
 

'伪造来访网址20150922  call rw(getWinHttp("http://127.0.0.1/4.asp","","Admin%5FPassWord=admin; Admin%5FUserName=admin; CNZZDATA5865366=cnzz_eid%3D1338721452-1438760869-%26ntime%3D1438760869; style=default; sswbr=1; Hm_lvt_c39492dd0d3beab26d196a53cbd72d54=1440725802,1442725700; BD_UPN=112451; ASPSESSIONIDSCDQDRAC=CNOHMAHANIPHOFLHKCIKFIGH",""))
function getWinHttp(httpurl, refererUrl, cookiesStr, postStr, sSetChar)
	getWinHttp=handleGetWinHttp(httpurl, refererUrl, cookiesStr, postStr, sSetChar,"text")
end function
function handleGetWinHttp(byval httpurl, byval refererUrl, byval cookiesStr, byval postStr, byval sSetChar, byval sType)
    dim winHttp, content 
    set winHttp = createObject("WinHttp.WinHttpRequest.5.1")
        with winHttp
            '来路网址为空 则为当前网址域名
            if refererUrl = "" then
                refererUrl = getwebsite(httpurl) 
            end if 
            '设置cookies字符串不能为空
            if cookiesStr = "" then
                cookiesStr = "ASPSESSIONIDAQACTAQB=HKFHJOPDOMAIKGMPGBJJDKLJ;" 
            end if 
            '字符编号
            sSetChar = trim(sSetChar) 
            if sSetChar = "" or sSetChar = "1" or sSetChar = "gb2312" then
                sSetChar = "gb2312" 
            else
                sSetChar = "utf-8" 
            end if 

            '设置参数
            .setTimeOuts 160000, 160000, 160000, 13000                                          '设置操作超时时间
            '.SetTimeouts resolveTimeout, connectTimeout, sendTimeout, receiveTimeout
            'resolveTimeout = 10000 '解析 DNS 名字的超时时间，10000 毫秒。
            'connectTimeout = 10000 '建立 Winsock 连接的超时时间，10000 毫秒。
            'sendTimeout = 120000 '发送数据的超时时间，120000 毫秒。
            'receiveTimeout = 60000 '接收 response 的超时时间，60000 毫秒。
            .option(4) = 13056                                                              '忽略错误标志
            .option(6) = false                                                              '为 True 时，当请求页面重定向跳转时自动跳转，False 不自动跳转，截取服务端返回的302状态。
            '.Open "GET", "http://www.baidu.com/", False 'GET 或 POST, Url, False 同步方式；True 异步方式
            .open "GET", httpurl, false 
            '组成 HTTP 头信息
            .setRequestHeader "Accept", "*/*"                                               '接受数据类型
            .setRequestHeader "Accept-Language", "zh-cn,zh"                                 '用户系统语言
            .setRequestHeader "User-Agent", "Mozilla/6.0"                                   '用户浏览器信息
            .setRequestHeader "Content-Type", "application/x-www-form-urlencoded"           '编码方式
            .setRequestHeader "Referer", refererUrl                                         '来路
            .setRequestHeader "Connection", "Close"                                         'Close  不保持连接，Keep-Alive  保持连接（持久连接）
            '.SetRequestHeader "Accept-Encoding", "gzip, deflate" '如果发送，会返回 gzip, deflate 压缩过的编码
            '.SetRequestHeader "Content-Length", Len(Str) '内容长度，Post 方式用的。
            .setRequestHeader "Cookie", cookiesStr                                          '设置 Cookie   直接把cookies字符串放进去就可以了，  获得方法:IE》F12》网络

            postStr = handlePostCookiesParame(postStr, "post") 

            '发送数据
            .send(postStr)                                                                  'Post 方式：.Send (参数)
            .waitForResponse                                                                '等待返回请求，XMLHTTP中也可以使用
            '输出结果
            'Response.Write .Status '当前 HTTP 状态
            'Response.Write .ResponseText '文本数据
			if sType="cookies" then
				content=getStrCut(.GetAllResponseHeaders & ";", "Set-Cookie: ",";",0)
			else
            	content = bytesToBstr(.responseBody, sSetChar)   
			end if
			'call echo("responseCookie",.GetAllResponseHeaders  ) 
			's=getStrCut(.GetAllResponseHeaders&";", "Set-Cookie: ",";",0)
			'call echo("s",s)

        'Response.BinaryWrite .ResponseBody '二进制数据流数据   好方法
        end with 
        handleGetWinHttp = content 
end function
'获得提交后的Cookies 为模似登录用20171204
function getWinHttpCookies(httpurl, refererUrl, cookiesStr, postStr, sSetChar)
	getWinHttpCookies=handleGetWinHttp(httpurl, refererUrl, cookiesStr, postStr, sSetChar,"cookies")
end function

%>      
