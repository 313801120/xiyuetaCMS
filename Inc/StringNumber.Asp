<%
'通过ChatGPT写的代码 20231011'
Function getCharacterLength(str)
  Dim i, count

  count = 0
  For i = 1 To Len(str)
    If AscW(Mid(str, i, 1)) < 256 Then
      count = count + 1
    Else
      count = count + 2
    End If
  Next

  getCharacterLength = count
End Function

'处理数字后两位 20231012'
function handleFormatNumber(n,n2)
    dim c,splxx,s,s1,s2,i
    if isNul(n) then handleFormatNumber=0:exit function
    ' call echo(typename(n),typename(n2))
    ' call echo(n & "",n2 & ""):doevents
    c=cstr(numberBeforeAddZero(formatNumber(n,n2)))
    splxx=split(c,".")
    s1=splxx(0)    
    for i=1 to len(splxx(1))
        s=mid(splxx(1),i,1)
        if s="" or s="0" then exit for
        s2=s2 & s
    next
    if s2<>"" then
        s1=s1 & "." & s2
    end if
    handleFormatNumber=replace(s1,",","")  '把这个,号去掉'
end function

function myFormatNumber(n,n2)
    dim n3,s
    s=n & ""
    if s="" then n=0
    n3=formatNumber(n,n2)
    if n3<1 then n3="0" & n3
    myFormatNumber=n3
end function


 
'数字前面加零 20230427'
function numberBeforeAddZero(n) 
    if left(cstr(n),1)="." then
        n=0 & n
    end if  
    numberBeforeAddZero=n
end function
'求两数比分比方法
'dim a,b,c
'a=1002
'b=6003
'c=(a+b)/100
'response.Write(a/c)

'身份证年月时隐藏为*代替 20220605' 
function idcardYMDHide(s)
  idcardYMDHide=mid(s,1,10) & "****" & mid(s,15)
end function

'判断是否为字符转义 
function isStrTransferred(content)
    dim splStr, i, s, nCount 
    nCount = 0 
    isStrTransferred = false  
    for i = 0 to len(content) - 1   
        s = mid(content, len(content) - i, 1) 
        if s = "\" then
            nCount = nCount + 1 
        else
            isStrTransferred = IIF(nCount mod 2 = 1, true, false) 
            exit function 
        end if 
    next  
end function  
'获得比率新宽 20180720 arr=getRatioNewWidth(720,404,1300)   833：467
function getRatioNewWidth(x,y,width)
	dim n2,n3,n4,nB1,nB2,nA,nB
	n3=x+y
	n4=100/n3	 
	nB1=n4*x
	nB2=n4*y
	nA=cint(width/100*nB1)
	nB=cint(width/100*nB2)
	getRatioNewWidth=array(nA,nB)
end function
'计算比率，游戏开发中用到 20150601
function getBL(nSetWidth, nSetHeight, nDanFuXianZhi)
    dim arrNSplStr(3) 
    dim nWidthZheFu : nWidthZheFu = 1                                               '宽正负 
    dim nHeightZheFu : nHeightZheFu = 1                                             '高正负
    dim nBFB                                                                        '百分比
    dim nXXFBX                                                                      '每个百分比，因为要判断他不能超过10
    if nSetWidth < 0 then
        nSetWidth = nSetWidth * - 1 
        nWidthZheFu = -1 
    end if 
    if nSetHeight < 0 then
        nSetHeight = nSetHeight * - 1 
        nHeightZheFu = -1 
    end if 
    if nSetWidth > nSetHeight then
        nBFB = cint(formatNumber(nSetWidth / nSetHeight, 2))                                  '//长宽 百分比
        arrNSplStr(0) = nBFB 
        arrNSplStr(1) = 1 
    else
        nBFB = cint(formatNumber(nSetHeight / nSetWidth, 2))                                  '//高宽 百分比
        arrNSplStr(0) = 1 
        arrNSplStr(1) = nBFB 
    end if 
    '每步超出指定值，处理
    'if nBFB>=nDanFuXianZhi then
    nXXFBX = cint(formatNumber(nDanFuXianZhi / nBFB, 2)) 
    arrNSplStr(0) = arrNSplStr(0) * nXXFBX 
    arrNSplStr(1) = arrNSplStr(1) * nXXFBX 
    'end if

    arrNSplStr(0) = arrNSplStr(0) * nWidthZheFu 
    arrNSplStr(1) = arrNSplStr(1) * nHeightZheFu 
    arrNSplStr(2) = nBFB 
    arrNSplStr(3) = getCountPage(nSetWidth, arrNSplStr(0)) 
    'Call echo("page count 页数", arrNSplStr(3))
    arrNSplStr(3) = getCountStep(nSetWidth, nSetHeight, arrNSplStr(0), arrNSplStr(1), arrNSplStr(3)) 

    getBL = arrNSplStr 
end function 

'获得总步数
function getCountStep(nWidthStep, nHeightStep, nWidthBL, nHeightBL, nCountPage)
    dim i 
    getCountStep = 0
    if nWidthStep < 0 then
        nWidthStep = nWidthStep * - 1  
    end if 
    if nHeightStep < 0 then
        nHeightStep = nHeightStep * - 1 
    end if 
    if nWidthBL < 0 then
        nWidthBL = nWidthBL * - 1 
    end if 
    if nHeightBL < 0 then
        nHeightBL = nHeightBL * - 1 
    end if 
    for i = nCountPage - 10 to nCountPage
        'call echo(i & "、nWidthBL*i>=nWidthStep",nWidthBL*i &">="&nWidthStep    & "   |  " & nHeightBL*i &">="& nHeightStep)
        if nWidthBL * i >= nWidthStep or nHeightBL * i >= nHeightStep then
            getCountStep = i 
        'call echo("getCountStep",getCountStep)
        end if 
    next 
end function 


'获得中文汉字内容
function getChina(content)
    dim i, c, j, s 
    for i = 1 to len(content)
        j = asc(mid(content, i, 1)) 
        s = mid(content, i, 1) 
        '是汉字累加
        if j < 0 then
            if (j <= -22033 and j >= -24158) = false then
                c = c & s 
            end if 
        end if 
    next 
    getChina = c 
end function 
'判断是否有中文
function isChina(content)
    dim i, j, s 
    isChina = false 
    for i = 1 to len(content)
        j = asc(mid(content, i, 1)) 
        s = mid(content, i, 1) 
        '是汉字累加
        if j < 0 then
            if (j <= -22033 and j >= -24158) = false then
                isChina = true 
                exit function 
            end if 
        end if 
    next 
end function  
'判断是否有中文 (辅助) 
function checkChina(content)
    checkChina = isChina(content) 
end function 

'PHP里Rand使用20150212
function phpRand(nMinimum, nMaximum)
    randomize 
    phpRand = 0
    dim i 
    for i = 1 to 9
        phpRand = CInt((nMinimum + nMaximum) * rnd) 
        if phpRand >= nMinimum and phpRand <= nMaximum then 
            exit for 
        end if 
    next 
    if phpRand < nMinimum then
        phpRand = nMinimum 
    elseIf phpRand > nMaximum then
        phpRand = nMaximum 
    end if 
end function 

'引用上面，为什么？因为我老写错这个单词 
function phpRnd(nMinimum, nMaximum)
    phpRnd = phpRand(nMinimum, nMaximum) 
end function 

 
'删除重复内容  20141220
function deleteRepeatStr(content, sSplType)
    dim splStr, s, c 
    c = "" 
    splStr = split(content, sSplType) 
    for each s in splStr
        if s <> "" then
            if inStr(sSplType & c & sSplType, sSplType & s & sSplType) = 0 then
                c = c & s & sSplType 
            end if 
        end if 
    next 
    if c <> "" then c = left(c, len(c) - len(sSplType)) 
    deleteRepeatStr = c 
end function 

'替换内容N次 20141220
function replaceN(content, yunStr, replaceStr, nNumb)
    dim i,sNumb
    sNumb = handleNumber(cStr(nNumb))			'为了给.netc用 
    if sNumb = "" then
        nNumb = 1 
    else
        nNumb = CInt(sNumb) 
    end if 
    for i = 1 to nNumb
        content = replace(content, yunStr, replaceStr) 
    next 

    replaceN = content 
end function 

'asp日期补0函数   引用别人20141216
function fillZero(content)
	fillZero=""
    if len(content) = 1 then
        fillZero = "0" & content 
    else
        fillZero = content 
    end if 
end function 

'不分大小写替换，作者：小云，写于20140925 用法Response.Write(CaseInsensitiveReplace("112233aabbbccddee","b","小云你牛"))
function caseInsensitiveReplace(content, sCheck, sReplace)
    dim nStartLen, nEndLen, lowerCase, startStr, endStr, c, i 
    c = "" 
    if LCase(sCheck) = LCase(sReplace) then
        caseInsensitiveReplace = content 
    end if 
    lowerCase = LCase(content) 
    for i = 1 to 99
        if inStr(lowerCase, sCheck) > 0 then
            nStartLen = inStr(lowerCase, sCheck) - 1 
            startStr = left(content, nStartLen) 
            nEndLen = nStartLen + len(sCheck) + 1 
            endStr = mid(content, nEndLen)   
            content = startStr & sReplace & endStr 
            'Call Echo(StartLen,EndLen)
            'Call Echo(StartStr,EndStr)
            'Call Echo("Content",Content)
            lowerCase = LCase(content) 
        else
            exit for 
        end if 
    next 
    caseInsensitiveReplace = content 
end function  
 
'数组数字排序 (2013,10,1)
function array_Sort(arrnArray)
    dim i, j, nMinmaxSlot, nMinmax, nTemp 
    for i = uBound(arrnArray) to 0 step - 1
        nMinmax = arrnArray(i)  
        nMinmaxSlot = 0 
        for j = 1 to i
            if arrnArray(j) > nMinmax then
                nMinmax = arrnArray(j) 
                nMinmaxSlot = j 
            end if 
        next 
        if nMinmaxSlot <> i then
            nTemp = arrnArray(nMinmaxSlot) 
            arrnArray(nMinmaxSlot) = arrnArray(i) 
            arrnArray(i) = nTemp 
        end if 
    next 
    array_Sort = arrnArray 
end function 

'处理Zip大小
function handleZipSize(byVal zipSize)
    on error resume next 
    dim nSize 
    zipSize = LCase(zipSize) 
    nSize = getDianNumb(zipSize) 
    if inStr(zipSize, "g")>0 then
        nSize = nSize * 1073741824 
    elseIf inStr(zipSize, "m")>0 then
        nSize = nSize * 1048576 
    elseIf inStr(zipSize, "k")>0 then
        nSize = nSize * 1024 
    end if 
    handleZipSize = nSize 
    if err then call doError(Err.description, "HandleZipSize 处理Zip大小 函数出错，ZipSize=" & zipSize) 
end function 

'//生成随机数
function getRnd(byVal nCount)
    randomize 
    dim charS, i, c 
    for i = 1 to nCount
        if i mod 2 = 0 then
            charS = chrW((57 - 48) * rnd + 48)                                                  '0~9
        elseIf i mod 3 = 0 then
            charS = chrW((90 - 65) * rnd + 65)                                                  'A~Z
        else
            charS = chrW((122 - 97) * rnd + 97)                                                 'a~z
        end if 
        c = c & charS 
    next 
    getRnd = c 
end function 
'call echo("getRndTel",getRndTel(11))
'//生成随机手机号20230421,如 138 & getRndTel(8)
function getRndTel(byVal nCount)
    randomize 
    dim charS, i, c 
    for i = 1 to nCount
        charS = chrW((57 - 48) * rnd + 48)                                                  '0~9
        c = c & charS 
    next 
    getRndTel = c 
end function 

'获得随机数，仿js(20150826)
function mathRandom()
    dim i, c 
    c = "" 
    randomize 
    for i = 1 to 16
        c = c & cint(int(rnd() * 9)) 
    next 
    mathRandom = "0." & c 
end function 



'获得指定位数随机A到Z字符
function getRndAZ(nCount)
    dim zd, i, s, c 
    c = "" : zd = "" 
    randomize 
    zd = "abcdefghijklmnopqrstuvwxyz" & uCase(zd) 
    for i = 1 to nCount
        s = mid(zd, phpRnd(1, len(zd)), 1) 
        c = c & s 
    next 
    getRndAZ = c 
end function 

'获得随机数 （辅助上面） 
function getRand(byVal nCount)
    getRand = getRnd(nCount) 
end function 

'拷贝内容N次 InputStr输入值  nMultiplier乘数和php里面一样2014 12 02
'如果 nMultiplier 被设置为小于等于0，函数返回空字符串。
function copyStrNumb(byVal inputStr, nMultiplier)
    dim i, s 
    if nMultiplier > 0 then
        s = inputStr 
        for i = 1 to nMultiplier - 1
            inputStr = inputStr & s 
        next 
    else
        inputStr = "" 
    end if 
    copyStrNumb = inputStr 
end function 

'拷贝内容N次  PHP里函数
function str_Repeat(byVal inputStr, nMultiplier)
    str_Repeat = copyStrNumb(inputStr, nMultiplier) 
end function 

'引用上面的
function copyStr(inputStr, nMultiplier)
    copyStr = copyStrNumb(inputStr, nMultiplier) 
end function 

'内容加Tab
function contentAddTab(byVal content, nNumb)
    contentAddTab = copyStr("    ", nNumb) & join(split(content, vbCrLf), vbCrLf & copyStr("    ", nNumb)) 
end function  

'删除最后指定字符20150228 Content=DeleteEndStr(Content,2) 
function deleteEndStr(content, nLen)
    if content <> "" then content = left(content, len(content) - nLen) 
    deleteEndStr = content 
end function 
    

'StringNumber (2013,9,27)
function toNumber(byVal n, byVal nD)
    toNumber = cint(formatNumber(n, nD, - 1))   
end function  

'处理成数字
function handleNumber(byVal content)
    dim i, s, c 
    c = ""   
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr("0123456789", s) > 0 then
            c = c & s 
        end if 
    next 
    handleNumber = c
end function 

'字符串中提取数字 20150507
function strDrawInt(byVal content)
    strDrawInt = handleNumber(content) 
end function 

'处理成数字 首字符可以是-符号
function getFirstNegativeNumber(byVal content)
    dim i, s, c 
    c = "" 
    content = trim(content) 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if s = "-" and c = "" then
            c = c & s 
        elseIf inStr("0123456789", s) > 0 then
            c = c & s 
        end if 
    next 
    if c = "" then c = "0"
    getFirstNegativeNumber = c 
end function 

'检测是否为数字类型
function checkNumberType(byVal content)
    checkNumberType = handleNumber(content) 
end function 

'检测字符内容为数字类型
function checkStrIsNumberType(byVal content)
    dim i, s 
    checkStrIsNumberType = true 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr("0123456789", s) = 0 then
            checkStrIsNumberType = false 
            exit function 
        end if 
    next 
end function 

'处理成数字类型
function handleNumberType(byVal content)
    dim i, s, c 
    c = "" 
    content = trim(content) 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if i = 1 and inStr("+-*/", left(content, 1)) > 0 then
            c = c & s 
        elseIf i > 1 and s = "." then
            c = c & s 
        elseIf inStr("0123456789", s) > 0 then
            c = c & s 
        end if 
    next 
    handleNumberType = c 
end function 

'获得数字  -12.11
function getStrToNumber(byVal content)
    dim i, s, c 
    c = "" 
    content = trim(content) 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if i = 1 and inStr("-", left(content, 1)) > 0 then
            c = c & s 
        elseIf i > 1 and s = "." then
            c = c & s 
        elseIf inStr("0123456789", s) > 0 then
            c = c & s 
        end if 
    next 
    getStrToNumber = c 
end function 

'获得数字 只单独获得数字 并且第一个字数不能为零0     20150322
function getNumber(byVal content)
    dim i, s, c 
    c = "" 
    content = trim(content) 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr("0123456789", s) > 0 then
            if c = "" and s = "0" then                                                      '待改进，因为现在脑子不够用了，就这么定敢20150322
            else
                c = c & s 
            end if 
        end if 
    next 
    getNumber = c
end function 

'检测是否为数字
function checkNumb(c)
	dim s,i
	checkNumb = true
	for i = 1 to len(c)
		s=mid(c,i,1)
		if inStr("0123456789.", s) =0 then
			checkNumb = false
			exit function
		end if 
	next
end function 

'获得有小数点数字
function getDianNumb(byVal content)
    dim i, s, c,isDian
    c = "" 
	isDian=false
    for i = 1 to len(content)
        s = mid(content, i, 1)
		if s="." and isDian=true then
			exit for
		elseif s="." and c<>"" and isDian=false then
			c=c & s
			isDian=true 
        elseif inStr("0123456789.", s) > 0 then
            c = c & s 
        end if 
    next 
    getDianNumb = c 
end function 

'获得总页数
function getCountPage(nCount, nPageSize)
    '把负数转成正确进行计算20150502
    dim nCountPage 
    if nCount < 0 then
        nCount = nCount * - 1 
    end if 
    if nPageSize < 0 then
        nPageSize = nPageSize * - 1 
    end if 
    nCountPage = fix(nCount / nPageSize) 
    if  nCount Mod nPageSize  > 0 then nCountPage = nCountPage + 1 
    getCountPage = nCountPage 
end function 

'获得处理后页数
function getPageNumb(nRecordCount, nPageSize)
    dim n 
    n = int(nRecordCount / nPageSize) 
    if nRecordCount mod nPageSize > 0 then
        n = n + 1 
    end if 
    getPageNumb = n 
end function 

'处理获得采集总页数
function getCaiHandleCountPage(content)
    content = delHtml(content) 
    content = handleNumber(content) 
    getCaiHandleCountPage = "" 
    if len(content) < 10 then
        getCaiHandleCountPage = right(content, 1) 
    elseIf len(content) < 200 then
        getCaiHandleCountPage = right(content, 2) 
    end if 
end function 

'获得采集排序总页数 20150312
function getCaiSortCountPage(byVal content)
    dim i, s 
    getCaiSortCountPage = "" 
    content = delHtml(content) 
    content = handleNumber(content) 
    for i = 1 to 30
        s = mid(content, 1, len(i)) 
        if s = CStr(i) then
            getCaiSortCountPage = cstr(i) 
            'Call Echo(i,s)
            content = right(content, len(content) - len(i)) 
        end if 
    next 
end function 

'最大与最小之间 Between the minimum and maximum
function minMaxBetween(nMin, nMax, nValue)
    'nMin = CInt(nMin)                                                         '最小数
    'nMax = CInt(nMax)                                                         '最大数
    'nValue = CInt(nValue)                                                     '当前数
	minMaxBetween = nMin
    if nMin > nMax then
        minMaxBetween = nMax 
    elseIf nValue > nMin then
        minMaxBetween = nValue 
        if nValue > nMax then
            minMaxBetween = nMax 
        end if 
    end if 
end function 

'获得内容文件名称中类型  (在FSO文件里已经有这个功能了20141220)
function getStrFileType(fileName)
    dim c 
    c = "" 
    if inStr(fileName, ".") > 0 then
        c = LCase(mid(fileName, inStrRev(fileName, ".") + 1)) 
        if inStr(c, "?") > 0 then
            c = mid(c, 1, inStr(c, "?") - 1) 
        end if 
    end if 
    getStrFileType = c 
end function 
 
'将字符类型转成数字类型
function val(byVal s)
	val = cint(s) 
    if s = "" or not isNumeric(s) then
        val = 0  
    end if 
end function 

'返回字符串左边N个byte
function strLen(str)
    on error resume next 
	strLen = 0 
    if isNull(str)<>false and str <> "" then
        dim i, n, nK, chrA  
        nK = 0 
        n = len(str) 
        for i = 1 to n


            chrA = mid(str, i, 1) 

            'If Asc(chrA) >= 0 And Asc(chrA) <= 255 Then
            'nK = nK + 1
            'Else
            'nK = nK + 2
            'End If

            if chrA < 0 then chrA = chrA + 65536 
            if chrA < 255 then nK = nK + 1 
            if chrA > 255 then nK = nK + 2 

        next 
        strLen = nK 
    end if 
end function 

'循环加缩进 AddIndent(Content,"    ")
function addIndent(content, indentStr)
    dim splStr, s, c 
    c = "" 
    splStr = split(content, vbCrLf) 
    for each s in splStr
        c = c & indentStr & s & vbCrLf 
    next 
    addIndent = trimVbCrlf(c) 
end function 

'获得数字前字符 2014 12 12(作用是为夏文强切换分块服务的)
function getNumberBeforeStr(content)
    dim i, s, c 
    c = "" 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr("0123456789", s) > 0 then exit for 
        c = c & s 
    next 
    getNumberBeforeStr = c 
end function

'获得数字包换负数 20171017
function getNumberGroup(content)
    dim i, s, c 
    c = "" 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if s="-" and c="" then
			c=s
		elseif inStr("0123456789", s) > 0 then
        	c = c & s 
		end if
    next 
    getNumberGroup = c 
end function 


'获得参数里的数字 20231001
function getParamNumb(content)
    dim i, s, c 
    c = "" 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr("0123456789", s) > 0 then
            c = c & s 
        end if
    next 
    getParamNumb = c 
end function 

'获得随机数 20141212
'用法response.write makePassword(6)
function makePassword(byVal nMaxLen)
    dim strNewPass ,n
    dim nWhatsNext, nUpper, nLower, nCounter 
    randomize 
    strNewPass = "" 
    for nCounter = 1 to nMaxLen
        nWhatsNext = int((1 - 0 + 1) * rnd + 0) 
        if nWhatsNext = 0 then 
            nUpper = 90 
            nLower = 65 
        else
            nUpper = 57 
            nLower = 48 
        end if 
		n=cint( (nUpper - nLower + 1) * rnd + nLower)
        strNewPass = strNewPass & chr(n)
    next 
    makePassword = strNewPass 
end function 

'功能说明：生成随机字符串，包括大小写字母，数字，和其它符合，常用于干扰码。 20141212
'参数说明：nMin--干扰码最小长度，ends--干扰码最大长度
'用法'Response.Write rndCode(20, 330)
function rndCode(byVal nMin, byVal nMax)
    dim nRndLen, i 
    randomize 
    rndCode = "" 
    nRndLen = int(nMin * rnd + nMax - nMin) 
    for i = 1 to nRndLen
        randomize 
        rndCode = rndCode & chr(cint(127 * rnd + 1)) 
    next 
end function 

'获得随机手机号码 没什么意义，引用别人的  20141217
'例:CAll Rw(GetRandomPhoneNumber(41))
function getRandomPhoneNumber(nCount)
    dim s, rndnum, j, c ,n
    c = "" : rndnum = "" 
    j = 1 
    do while j < nCount
        randomize 
        do while len(rndnum) < 9                                                        '产生随机数的个数 
            n = cint((57 - 48) * rnd + 48)
            rndnum = rndnum & chr(n)
        loop 
        c = c & 13 & rndnum & vbCrLf 
        rndnum = "" 
        j = j + 1 
    loop 
    if c <> "" then c = left(c, len(c) - 2) 
    getRandomPhoneNumber = c 
end function 
 
'获得字符长度
function lenStr(content)
    dim l, t, c 
    c = "" 
    dim i 
    l = len(content)  
    t = 0 
    for i = 1 to l
        c = asc(mid(content, i, 1))  
        if c < 0 then c = c + 65536 
        if c < 255 then t = t + 1 
        if c > 255 then t = t + 2  
    next 
    lenStr = t 
end function 

'数组转字符串
function toString(byVal arr)
    dim tmp 
    if isArray(arr) then
        tmp = join(arr, ",")   
    end if 
	toString = tmp 
end function 
'移除数字(20151022)
function remoteNumber(content)
    dim i, s, c 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr("0123456789.", s) = 0 then
            c = c & s 
        end if 
    next 
    remoteNumber = c 
end function 


'================================================= 判断有特殊字符 start
'处理有无指定字符
function handleHaveStr(content, zd)
    dim s, i 
    handleHaveStr = false 
    for i = 1 to len(zd)
        s = mid(zd, i, 1) 
        if inStr(content, s) > 0 then
            handleHaveStr = true 
            exit function 
        end if 
    next 
end function 
'有小写(20151224)
function haveLowerCase(content)
    haveLowerCase = handleHaveStr(content, "abcdefghijklmnopqrstuvwxyz") 
end function 
'有大写(20151224)
function haveUpperCase(content)
    haveUpperCase = handleHaveStr(content, "ABCDEFGHIJKLMNOPQRSTUVWXYZ") 
end function 
'有数字(20151224)
function haveNumber(content)
    haveNumber = handleHaveStr(content, "0123456789") 
end function 
'有汉字(20151224)
function haveChina(content)
    dim i, j 
    haveChina = false 
    for i = 1 to len(content)
        j = asc(mid(content, i, 1)) 
        '是汉字累加
        if j < 0 then
            if (j <= -22033 and j >= -24158) = false then
                haveChina = true 
                exit function 
            end if 
        end if 
    next 
end function 
'================================================= 判断有特殊字符 end




'*************************************************
'函数名：EncodeJP
'作  用：过滤日本片假名导致Access搜索失效的bug
'*************************************************
function encodeJP(str)
    if not str = "" then
        str = replace(str, "ガ", "&#12460;") 
        str = replace(str, "ギ", "&#12462;") 
        str = replace(str, "グ", "&#12464;") 
        str = replace(str, "ア", "&#12450;") 
        str = replace(str, "ゲ", "&#12466;") 
        str = replace(str, "ゴ", "&#12468;") 
        str = replace(str, "ザ", "&#12470;") 
        str = replace(str, "ジ", "&#12472;") 
        str = replace(str, "ズ", "&#12474;") 
        str = replace(str, "ゼ", "&#12476;") 
        str = replace(str, "ゾ", "&#12478;") 
        str = replace(str, "ダ", "&#12480;") 
        str = replace(str, "ヂ", "&#12482;") 
        str = replace(str, "ヅ", "&#12485;") 
        str = replace(str, "デ", "&#12487;") 
        str = replace(str, "ド", "&#12489;") 
        str = replace(str, "バ", "&#12496;") 
        str = replace(str, "パ", "&#12497;") 
        str = replace(str, "ビ", "&#12499;") 
        str = replace(str, "ピ", "&#12500;") 
        str = replace(str, "ブ", "&#12502;") 
        str = replace(str, "ブ", "&#12502;") 
        str = replace(str, "プ", "&#12503;") 
        str = replace(str, "ベ", "&#12505;") 
        str = replace(str, "ペ", "&#12506;") 
        str = replace(str, "ボ", "&#12508;") 
        str = replace(str, "ポ", "&#12509;") 
        str = replace(str, "ヴ", "&#12532;") 
    end if 
    encodeJP = str 
end function 
'中文转unicode
function cnTounicode(str)
    cnTounicode=""
    dim i
    for i=1 to len(str)
    'asc函数：返回字符串的第一个字母对应的ANSI字符代码
        'AscW函数：返回每一个GB编码文字的Unicode字符代码
        'hex函数：返回表示十六进制数字值的字符串
        cnTounicode=cnTounicode & "\u" & LCase(Right("0000" & Cstr(hex(AscW(mid(str,i,1)))),4))
    next
end function
'\u51cc\u9648\u4eae\u535a\u5ba2
function unicodeto(str) 'unicode转中文
	dim i,s,c
	for i=1 to len(str)
		s=mid(str & "  ",i,2)
		if s="\u" then
			c=c & ChrW(cint("&H" & mid(str,i+2,4)))
			i=i+5
		else
			c=c & mid(str,i,1)
		end if
		
	next
	unicodeto=c
end function
 


'获得汉字文本部分20230509'
function getHanZiTxt(txt)
    dim s,i,c
    for i=1 to len(txt)
        s=mid(txt,i,1)
        ' call echo(i, s)
        if isChinese(s) then
            c=c & s
        end if
    next
    getHanZiTxt=c
end function
'判断是否为汉字20230509'
Function isChinese(str)
  Dim regEx, result
  Set regEx = New RegExp
  regEx.Pattern = "^[\u4e00-\u9fa5]+$"
  regEx.IgnoreCase = True
  result = regEx.Test(str)
  Set regEx = Nothing
  isChinese = result
End Function
 
'获得字符长度 汉字为两个字符 20230709
function myLeft(content,nEnd)
    dim i, t, n,s,c
    c = "" 
    t=0
    ' call echo("len", len(content))
    for i = 1 to len(content)
        s=mid(content, i, 1)
        if isChinese(s)=true then
            t=t+2
        else
            t=t+1
        end if
        ' call echo(t,nEnd)
        ' call echo("i",s)
        if t>nEnd then
            exit for
        end if
        c=c & s 
    next 
    myLeft = c
end function 
%>   

