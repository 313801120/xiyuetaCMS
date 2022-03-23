<% 
'AdodbStream Adodb.Stream组件操作大全 (20200311-v3)  

'获得二进制指定位置数值
function midBin(bin,startPostion,nLength)
	if lenB(bin)<startPostion+nLength-1 then
		midBin=&HFF									'长度不够刚退出一个转变二进制20171205
	else
		midBin=ascB(midB(bin, startPostion, nLength))
	end if
end function

'二进制处理成   给图片合并用 97|98|99|49|50|51|214|208|185|250
function bin2Int(bin,nPass)
	dim g, str, clow 
	for g = 1 to lenB(bin)
		clow = midB(bin, g, 1) 
		if ascB(clow) < 128 then
			str = str & ascB(clow)+nPass & "|"
		else
			g = g + 1 
			if g <= lenB(bin) then str = str  &  ascB(clow)+nPass & "|" & ascB(midB(bin, g, 1))+nPass & "|"
		end if 
	next 
	if len(str)>0 then
		str=mid(str,1,len(str)-1)
	end if
	bin2Int = str 
end function 
'数组转二进制  给图片合并用
function arrayToBin(buf)
	dim i,aBuf
	'不是二进制处理成二进制(20151211)
	if typeName(buf) <> "Byte()" then
		reDim aBuf(uBound(buf) \ 2) 
		for i = 0 to uBound(buf) - 1 step 2
			aBuf(i \ 2) = chrW(buf(i + 1) * 256 + buf(i)) 
		next 
		if i = uBound(buf) then aBuf(i \ 2) = chrW(buf(i)) 
		aBuf = join(aBuf, "")  
	else
		aBuf = buf 
	end if
	arrayToBin=aBuf
end function
'二进制到内容 给获得图片类型用
function bin2Str(bin)
	dim g, str, clow 
	for g = 1 to lenB(bin)
		clow = midB(bin, g, 1) 
		if ascB(clow) < 128 then
			str = str & chr(ascB(clow)) 
		else
			g = g + 1 
			if g <= lenB(bin) then str = str & chr(ascW(midB(bin, g, 1) & clow)) 
		end if 
	next 
	bin2Str = str 
end function 
'二进制到值 给获得图片类型用
function binVal(bin)
	dim ret 
	dim h 
	ret = 0 
	for h = lenB(bin) to 1 step - 1
		ret = ret * 256 + ascB(midB(bin, h, 1)) 
	next 
	binVal = ret 
end function 
'二进制转值第二种用法 给获得图片类型用
function binVal2(bin)
	dim ret, g 
	ret = 0 
	for g = 1 to lenB(bin)
		ret = ret * 256 + ascB(midB(bin, g, 1)) 
	next 
	binVal2 = ret 
end function 


'检测文件编码
function checkCode(byVal fileName)
    checkCode = getFileCharset(fileName) 
end function 
'获得文件编码   为什么内容里有  结束  两个字就不可以获得编码呢？这种方法不好用呀
function getFileCharset(byVal fileName)
  '  on error resume next 
    dim objStream, bintou 
    call handlePath(fileName)  
	getFileCharset = "gb2312"                                                      '获得完整路径
	if checkFile(fileName)=false then
		exit function
	end if
	'判断是否为空文件
	If getFSize(fileName) = 0 Then
		Exit Function
	End If
    set objStream = createObject("ADODB.Stream")
        objStream.type = 1 
        objStream.mode = 3 
        objStream.open 
        objStream.position = 0 
        call objStream.loadFromFile(fileName) 
        bintou = objStream.read                                                       '以二进制方式读出二个字符出来(不太太)
        
  
	    if typeName(bintou) = "Null" or typeName(bintou) = "DBNull" then 
			set objStream=nothing
			exit function
		elseIf midBin(bintou, 1, 1) = 239 and midBin(bintou, 2, 1) = 187 and midBin(bintou, 3, 1) = 191 then
			getFileCharset="utf-8" 
        elseIf midBin(bintou, 1, 1) = 255 and midBin(bintou, 2, 1) = 254 then
            getFileCharset = "unicode"  
        elseIf midBin(bintou, 1, 1) = 254 and midBin(bintou, 2, 1) = 255 then
            getFileCharset = "unicode big endian"
		elseif isUTF8(bintou)=true then			'最后再判断是否为没有BOM的UTF文件 
			getFileCharset="utf-8"  
        end if
		
		
		
        objStream.close 
    set objStream = nothing 
	'call echo(getFileCharset ,midBin(bintou, 1, 1) & "，" & midBin(bintou, 2, 1))
    if err then call doError(Err.description, "getFileCharset，获得文件编码 函数出错，FileName=" & fileName) 

end function 
'新版本20190624
Function is_valid_utf8(ByRef input) 'ByRef以提高效率
    Dim s, re
    set re = CreateObject("VBscript.RegExp")
    s = "[\xC0-\xDF]([^\x80-\xBF]|$)"
    s = s & "|[\xE0-\xEF].{0,1}([^\x80-\xBF]|$)"
    s = s & "|[\xF0-\xF7].{0,2}([^\x80-\xBF]|$)"
    s = s & "|[\xF8-\xFB].{0,3}([^\x80-\xBF]|$)"
    s = s & "|[\xFC-\xFD].{0,4}([^\x80-\xBF]|$)"
    s = s & "|[\xFE-\xFE].{0,5}([^\x80-\xBF]|$)"
    s = s & "|[\x00-\x7F][\x80-\xBF]"
    s = s & "|[\xC0-\xDF].[\x80-\xBF]"
    s = s & "|[\xE0-\xEF]..[\x80-\xBF]"
    s = s & "|[\xF0-\xF7]...[\x80-\xBF]"
    s = s & "|[\xF8-\xFB]....[\x80-\xBF]"
    s = s & "|[\xFC-\xFD].....[\x80-\xBF]"
    s = s & "|[\xFE-\xFE]......[\x80-\xBF]"
    s = s & "|^[\x80-\xBF]"
    re.Pattern = s
    is_valid_utf8 = (Not re.Test(input))
End Function

'检测是否为UTF-8文件  超强版 引用于20161006
Function isUTF8(Bytes)    
	Dim i,  AscN  , Length,isOK,nLen
	Length =lenB(Bytes) 

	isUTF8 = True			'默认为真
	'字符小于三为假
	If Length < 3 Then
		isUTF8 = False
		Exit Function
	ElseIf ascB(midB(Bytes,1,1)) = &HEF And ascB(midB(Bytes,2,1)) = &HBB And ascB(midB(Bytes,3,1)) = &HBF Then 
		isUTF8 = True
		Exit Function
	End If 
	nLen=lenB(Bytes)
	if nLen>18048 then nLen=18048		'只截取1024个字符也OK,待更多测试 20171205 超大超不会出错为2K   对一些文件不行，晕
	for i = 1 to nLen 
		isOK = False
		If i + 1 < Length Then
			If (ascB(midB(Bytes,i,1)) And &HE0) = &HC0 And (ascB(midB(Bytes,i+1,1)) And &HC0) = &H80 Then
				isOK = True
			End If
		End If
		If midBin(Bytes,i,1) < 128 Then 
			AscN = AscN + 1
		elseIf isOK=true Then 
				i = i + 1
		ElseIf i + 2 < Length Then 
			If (ascB(midB(Bytes, i, 1)) And &HF0) = &HE0 And (ascB(midB(Bytes, i+1, 1)) And &HC0) = &H80 And (ascB(midB(Bytes, i+2, 1)) And &HC0) = &H80 Then
				i = i + 2
			Else 
				isUTF8 = false 
			End If
		Else 
			isUTF8 = false 
		End If
	next 
	'为ascii码则为假
	If AscN = Length Then
		isUTF8 = false
	End If
	err.clear
End Function

'超级文件编码获取 待测试
function checkFileCode(filePath)
    dim splStr, c, content, toPath, yuanStr, s, nLen 
    yuanStr = readBinary(filePath,0) 

    'If Len(YuanStr) > 500 Then
    'YuanStr = Right(YuanStr, Len(YuanStr) - 30)
    'End If
    '只提取2500个字符
    if len(yuanStr) > 2500 then
        yuanStr = right(yuanStr, 2500) 
    end if 
    nLen = len(yuanStr) 
    toPath = filePath & "_Temp" 
    splStr = split("GB2312|UTF-8|UNICODE", "|") 
    for each s in splStr
        content = readFile(filePath, s) 
        call writeToFile(toPath, content, s) 
        c = readBinary(toPath,0) 
        c = right(c, nLen) 
        if yuanStr = c then
            checkFileCode = s 
            call deleteFile(toPath)                                                         '删除这个临时文件
            exit for 
        end if 
    next 
    call deleteFile(toPath)                                                         '删除这个临时文件
end function 
'自动读文件 20190421
function autoReadFile(byval fileName)
	autoReadFile=readFile(fileName,"")
end function
'数据流读出内容
function readFile(byVal fileName, byVal char_Set)
    'on error resume next
	char_Set=char_Set & ""
    if char_Set = "1" or uCase(char_Set) = "GB2312" then
        char_Set = "GB2312" 
    elseIf char_Set = "0" or uCase(char_Set) = "UTF-8" then
        char_Set = "UTF-8" 
    elseIf char_Set = "2" or uCase(char_Set) = "UNICODE" then
        char_Set = "UNICODE" 
    elseIf char_Set = "3" or uCase(char_Set) = "UNICODE BIG ENDIAN" then
        char_Set = "UNICODE" 
    else
        char_Set = checkCode(fileName) 	 
        if char_Set = "" then exit function 
    end if 
    dim str, stm, f, fso 
    call handlePath(fileName)                                                       '获得完整路径
    if checkFile(fileName) = false then
        readFile = "" 
        exit function 
    end if 
    set stm = createObject("ADODB.Stream")
        stm.type = 2                                                                    '以本模式读取
        stm.mode = 3 
        stm.charset = char_Set 
        stm.open 
        set fso = createObject("Scripting.FileSystemObject")
            set f = fso.getFile(fileName)
                if f.size > 0 then
                    call stm.loadFromFile(fileName) 
                end if 
                str = stm.readText 
                stm.close 
            set stm = nothing 
            readFile = str 
            if err then call doError(Err.description, "ReadFile，数据流读出内容 函数出错，FileName=" & fileName) 
        set fso = nothing 
    set stm = nothing 
end function 
'数据流读出内容  (辅助)
function getStext(fileName)
    getStext = readFile(fileName, "") 
end function 
'以UTF-8方法读文件内容
function getFTextUTF(fileName)
    getFTextUTF = readFile(fileName, "utf-8") 
end function 
'写入内容
function writeToFile(byVal fileName, byVal content, byVal char_Set)
    on error resume next 
    if char_Set = "1" or uCase(char_Set) = "GB2312" then
        char_Set = "GB2312" 
    elseIf char_Set = "0" or uCase(char_Set) = "UTF-8" then
        char_Set = "UTF-8" 
    elseIf char_Set = "2" or uCase(char_Set) = "UNICODE" then
        char_Set = "UNICODE" 
    else
        char_Set = checkCode(fileName) 	 
        if char_Set = "" then exit function 
    end if 
    'Call Echo("Char_Set",Char_Set)
    dim stm 
    call handlePath(fileName)                                                       '获得完整路径
    set stm = createObject("ADODB.Stream")
        stm.type = 2                                                                    '以本模式读取
        stm.mode = 3 
        stm.charset = char_Set 
        stm.open 
        call stm.writeText(content) 
        call stm.saveToFile(fileName, 2) 
        stm.flush 
        stm.close 
        writeToFile = fileName & "写入成功" 
    set stm = nothing 
    if err then call doError(Err.description, "WriteToFile，数据流写入内容 函数出错，FileName=" & fileName & "，Content字符" & len(content)) 
end function 
'创建gb2312文件
function createFileGBK(byval fileName, byval content)
    call writeToFile(fileName, content, "gb2312") 
end function 
'创建UTF-8文件（20151201）
function createFileUTF(byval fileName, byval content)
    call writeToFile(fileName, content, "utf-8") 
end function 
'创建累加文件2
function createAddFile2(filePath, addToStr)
    dim content 
    content = readFile(filePath, "gb2312") 
    content = content & addToStr 
    call writeToFile(filePath, content, "gb2312") 
end function 
'是UTF或GB2312
'自动获得编码并且判断Html内容是否与读出文件编码一致，一致则退出内容
function getUGText(byVal path)
    dim char_Set, fanCharSet, tempCharSet 
    dim isContent 
    char_Set = checkCode(path) 
    isContent = false 
    '二次处理，防读取错误
    if char_Set = "utf-8" then
        fanCharSet = "gb2312" 
    elseIf char_Set = "gb2312" then
        fanCharSet = "utf-8" 
    end if 
    tempCharSet = fanCharSet 
    if fanCharSet <> "" then
        if checkStr(LCase(getUGText), "<meta [^>]*charset *= *" & fanCharSet) = true then
            getUGText = readFile(path, tempCharSet) 
            isContent = true 
        end if 
    end if 
    '没有读出内容则用文件自身编码读出内容
    if isContent = false then
        getUGText = readFile(path, char_Set) 
    end if 
end function


'获得文件二进制内容 20150312
function getFileBinaryContent(filePath)
    dim stream 
    call handlePath(filePath)                                                       '获得完整路径
    set stream = createObject("ADODB.Stream")
        stream.mode = 3 
        stream.type = 1 
        stream.open 
        call stream.loadFromFile(filePath) 
        getFileBinaryContent = stream.read 
        stream.close 
    set stream = nothing 
'Response.BinaryWrite Stream.Read            '显示二进制文件内容
end function 
'读取二进制文件并加密
function readBinary(filePath, nPass)
    readBinary=bin2Int(getFileBinaryContent(filePath),nPass)
end function 
'解密保存二进制文件
function decSaveBinary(filePath, content, nPass)
    dim splStr, buf(), i,id 
    splStr = split(content, "|") 
    reDim buf(uBound(splStr))
	id=0 
    for i = 0 to uBound(splStr)
		if splStr(i)<>"" then
        	id=id+1
			buf(i) = CByte(CInt(splStr(i)) - nPass)
		end if 
    next 
    call WriteBinary(filePath, buf) 
end function 
'保存二进制文件   call writeBinary(filePath,Request.BinaryRead (Request.TotalBytes))
sub writeBinary(filePath, buf)
    dim i, aBuf,  bStream 
    call handlePath(filePath)                                                       '获得完整路径

	aBuf=arrayToBin(buf)

    set bStream = createObject("ADODB.Stream")
        bStream.type = 1 
        bStream.open 
        with createObject("ADODB.Stream")
            .type = 2 
            .open 
            call.writeText(aBuf) 
            .position = 2 
            call.copyTo(bStream) 
            .close 
        end with 
        call bStream.saveToFile(filePath, 2) 
        bStream.close 
    set bStream = nothing 
end sub 



'---------------------------- 待定 ----------------------------
'获得文件编码 超级快速版 (从ASPBOX引用过来)  不要用
public function getFileCharset2(byVal filePath)
    dim strFileHead 
    'On Error Resume Next
    if err then
        err.clear 
    end if 
    call handlePath(filePath)                                                       '获得完整路径
    dim objStream, loadBytes 
    set objStream = createObject("ADODB.Stream")
        with objStream
            .type = 1 
            .mode = 3 
            .open 
            .loadFromFile(filePath) 
            loadBytes =.read(3) 
            .close 
        end with 
    set objStream = nothing 
    if err.number <> 0 then
        err.clear : getFileCharset2 = "" : exit function 
    end if 

    strFileHead = binToHex(loadBytes) 
    if strFileHead = "EFBBBF" then
        getFileCharset2 = "UTF-8" 
    else
        strFileHead = left(strFileHead, 4) 
        if strFileHead = "FEFF" then
            getFileCharset2 = "UNICODE BIG" 
        elseIf strFileHead = "FFFE" then
            getFileCharset2 = "UNICODE" 
        elseIf strFileHead = "3C25" or strFileHead = "3C21" then
            getFileCharset2 = "GB2312" 
        else
            getFileCharset2 = "GB2312" 
        end if 
    end if 
    if err.number <> 0 then
        err.clear : getFileCharset2 = "" : exit function 
    end if 
end function 
public function binToHex(byVal vStream)
    dim reVal, i 
    reVal = 0 
    for i = 1 to Ubound(vStream)
        reVal = reVal * 256 + midBin(vStream, i, 1)
    next 
    binToHex = hex(reVal) 
end function 



'可以把字符或二进制内容转成字符，牛 从别人哪里复制过来20160112
function base64Encode(strData)
    dim objAds, objXd 
    set objAds = createobject("adodb.stream")
        objAds.type = 2 
        objAds.charset = "unicode" 
        objAds.mode = 3 
        call objAds.open() 
        call objAds.writeText(strData) 
        objAds.position = 0 
        objAds.type = 1 
        'objAds.Position=2
        set objXd = createobject("msxml.domdocument")
            call objXd.loadXml("<root/>") 
            objXd.documentElement.dataType = "bin.base64" 
            objXd.documentElement.nodeTypedValue = objAds.read() 
            base64Encode = objXd.documentElement.text 
end function
'转成二进制了Byte()
function base64Decode(strData)
    dim objXd 
    set objXd = createobject("msxml.domdocument")
        call objXd.loadXml("<root/>") 
        objXd.documentElement.dataType = "bin.base64" 
        objXd.documentElement.text = strData 
        base64Decode = objXd.documentElement.nodeTypedValue 
end function
 


'==================================================== 不常用 或无用函数

'读取二进制文件处理成数字方式
function binaryReadFile(filePath)
    dim i, nR, c, stm 
    call handlePath(filePath)                                                       '获得完整路径
    set stm = createObject("ADODB.Stream")
        stm.mode = 3 
        stm.type = 1 
        stm.open 
        call stm.loadFromFile(filePath) 
        c = "" : i = 0 : nR = 1 
        while i < stm.size
            c = c & ascB(stm.read(nR)) 
            i = i + nR 
            doEvents 
        wend 
    set stm = nothing 
    binaryReadFile = c 
end function
'读取二进制文件处理成数字方式
function binaryReadFile2(filePath)
    dim i, nR, c, stm 
    call handlePath(filePath)                                                       '获得完整路径
    set stm = createObject("ADODB.Stream")
        stm.mode = 3 
        stm.type = 1 
        stm.open 
        call stm.loadFromFile(filePath) 
        c = "" : i = 0 : nR = 1 
        while i < stm.size
			if c<>"" then c=c & "|"
            c = c & ascB(stm.read(nR)) 
            i = i + nR 
            doEvents 
        wend 
    set stm = nothing 
    binaryReadFile2 = c 
end function 

%>  

