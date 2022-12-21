<% 
'编码互换 GB2312与UTF-8转换

'UTF转GB23
function UTF2GB(byVal UTFStr)
    dim nDig, GBStr 
    for nDig = 1 to len(UTFStr)
        '如果UTF8编码文字以%开头则进行转换
        if mid(UTFStr, nDig, 1) = "%" then
            'UTF8编码文字大于8则转换为汉字
            if len(UTFStr) >= nDig + 8 then
                GBStr = GBStr & convChinese(mid(UTFStr, nDig, 9)) 
                nDig = nDig + 8 
            else
                GBStr = GBStr & mid(UTFStr, nDig, 1) 
            end if 
        else
            GBStr = GBStr & mid(UTFStr, nDig, 1) 
        end if 
    next 
    UTF2GB = GBStr 
end function 

'检测是否可以把UTF转GB2312
function checkUTFToGB2312(byVal UTFStr)
    dim nDig, GBStr 
    checkUTFToGB2312 = true 
    for nDig = 1 to len(UTFStr)
        '如果UTF8编码文字以%开头则进行转换
        if mid(UTFStr, nDig, 1) = "%" then
            'UTF8编码文字大于8则转换为汉字
            if len(UTFStr) >= nDig + 8 then
                if convChinese(mid(UTFStr, nDig, 9)) = "[出错Error]" then
                    checkUTFToGB2312 = false : exit function 
                end if 
                nDig = nDig + 8 
            else
                GBStr = GBStr & mid(UTFStr, nDig, 1) 
            end if 
        else
            GBStr = GBStr & mid(UTFStr, nDig, 1) 
        end if 
    next  
end function 

'UTF8编码文字将转换为汉字 配合上面
function convChinese(x)
    on error resume next 
    err.clear 
    dim arrStr, i, j, nDig, unicode 
    arrStr = split(mid(x, 2), "%") 
    i = 0 
    j = 0 
    for i = 0 to uBound(arrStr)
        arrStr(i) = c16to2(arrStr(i)) 
    next 
    for i = 0 to uBound(arrStr) - 1
        nDig = inStr(arrStr(i), "0") 
        unicode = "" 
        for j = 1 to nDig - 1
            if j = 1 then
                arrStr(i) = right(arrStr(i), len(arrStr(i)) - nDig) 
                unicode = unicode & arrStr(i) 
            else
                i = i + 1 
                arrStr(i) = right(arrStr(i), len(arrStr(i)) - 2) 
                unicode = unicode & arrStr(i) 
            end if 
        next 

        if len(c2to16(unicode)) = 4 then
            convChinese = convChinese & chrW(int("&H" & c2to16(unicode))) 
        else
            convChinese = convChinese & chr(int("&H" & c2to16(unicode))) 
        end if 
        if err <> 0 then convChinese = "[出错Error]" : exit function      '【@不是asp屏蔽@】     出错就退出
    next 
end function 



'转UTF8编码，非常精准，好用，(2014 12 11) 
function UTF8_URLEncoding(szInput)
    dim wch, uch, szRet 
    dim x 
    dim nAsc 
    if szInput = "" then
        UTF8_URLEncoding = szInput 
        exit function 
    end if   
    for x = 1 to len(szInput)
        wch = mid(szInput, x, 1) 
        nAsc = ascW(wch) 

        if nAsc < 0 then nAsc = nAsc + 65536 

        if(nAsc and &HFF80) = 0 then
            szRet = szRet & wch 
        else
            if(nAsc and &HF000) = 0 then
                uch = "%" & hex(((nAsc \ 2 ^ 6)) or &HC0) & hex(nAsc and &H3F or &H80) 
                szRet = szRet & uch 
            else
                uch = "%" & hex((nAsc \ 2 ^ 12) or &HE0) & "%" & _ 
                hex((nAsc \ 2 ^ 6) and &H3F or &H80) & "%" & _ 
                hex(nAsc and &H3F or &H80) 
                szRet = szRet & uch 
            end if 
        end if 
    next 
    UTF8_URLEncoding = szRet 
end function 

'GB转UTF8--将GB编码文字转换为UTF8编码文字  这个不精准，等以后给废除掉
function toUTF8(szInput)
    dim wch, uch, szRet 
    dim x 
    dim nAsc 
    '如果输入参数为空，则退出函数
    if szInput = "" then
        toUTF8 = szInput 
        exit function 
    end if 
    '开始转换
    for x = 1 to len(szInput)
        '利用mid函数分拆GB编码文字
        wch = mid(szInput, x, 1) 
        '利用ascW函数返回每一个GB编码文字的Unicode字符代码
        '注：asc函数返回的是ANSI 字符代码，注意区别
        nAsc = ascW(wch) 
        if nAsc < 0 then nAsc = nAsc + 65536 

        if(nAsc and &HFF80) = 0 then
            szRet = szRet & wch 
        else
            if(nAsc and &HF000) = 0 then
                uch = "%" & hex(((nAsc / 2 ^ 6)) or &HC0) & hex(nAsc and &H3F or &H80) 
                szRet = szRet & uch 
            else
                'GB编码文字的Unicode字符代码在0800 - FFFF之间采用三字节模版
                uch = "%" & hex((nAsc / 2 ^ 12) or &HE0) & "%" & _ 
                hex((nAsc / 2 ^ 6) and &H3F or &H80) & "%" & _ 
                hex(nAsc and &H3F or &H80) 
                szRet = szRet & uch 
            end if 
        end if 
    next 

    toUTF8 = szRet 
end function 

'GB转unicode---将GB编码文字转换为unicode编码文字
function chinese2unicode(str)
    dim i 
    dim str_one 
    dim str_unicode 
    if(isNull(str)) then
        exit function 
    end if 
    for i = 1 to len(str)
        str_one = mid(str, i, 1) 
        str_unicode = str_unicode & chr(38) 
        str_unicode = str_unicode & chr(35) 
        str_unicode = str_unicode & chr(120) 
        str_unicode = str_unicode & hex(ascW(str_one)) 
        str_unicode = str_unicode & chr(59) 
    next 
    chinese2unicode = str_unicode 
end function 


'判断是否为有效的十六进制代码
function isvalidhex(str)
    dim c 
    isvalidhex = true 
    str = uCase(str) 
    if len(str) <> 3 then isvalidhex = false : exit function 
    if left(str, 1) <> "%" then isvalidhex = false : exit function 
    c = mid(str, 2, 1) 
    if not(((c >= "0") and(c <= "9")) or((c >= "A") and(c <= "Z"))) then isvalidhex = false : exit function 
    c = mid(str, 3, 1) 
    if not(((c >= "0") and(c <= "9")) or((c >= "A") and(c <= "Z"))) then isvalidhex = false : exit function 
end function 

'---------------------- 自己文件引用 ----------------------------
'作用同JS的escape一样
function escape(str)
    dim i, s, c, n 
    s = ""
	str=str & ""
    for i = 1 to len(str)
        c = mid(str, i, 1) 
        n = ascW(c) 
        if(n >= 48 and n <= 57) or(n >= 65 and n <= 90) or(n >= 97 and n <= 122) then
            s = s & c 
        elseIf inStr("@*_-./", c) > 0 then
            s = s & c 
        elseIf n > 0 and n < 16 then
            s = s & "%0" & hex(n) 
        elseIf n >= 16 and n < 256 then
            s = s & "%" & hex(n) 
        else
            s = s & "%u" & hex(n) 
        end if 
    next 
    escape = s 
end function 


'作用同JS的unescape一样
function unescape(str)
    dim i, sNew, c, isChar, lastChar, sNext_1_c, next_1_num 
    isChar = false 
    lastChar = "" 
    sNew = "" 
    for i = 1 to len(str)
        c = mid(str, i, 1) 
        if c = "+" then
            sNew = sNew & " " 
        elseIf mid(str, i, 2) = "%u" and i <= len(str) - 5 then
            if isNumeric("&H" & mid(str, i + 2, 4)) then
                sNew = sNew & chrW(CInt("&H" & mid(str, i + 2, 4))) 
                i = i + 5 
            else
                sNew = sNew & c 
            end if 
            'ElseIf c="%" and i<=Len(str)-2 Then
            'If IsNumeric("&H" & Mid(str,i+1,2)) Then
            'newstr = newstr & ChrW(CInt("&H" & Mid(str,i+1,2)))
            'i = i+2
            'Else
            'newstr = newstr & c
        'End If
        elseIf c = "%" and i <= len(str) - 2 then
            sNext_1_c = mid(str, i + 1, 2) 
            if isNumeric("&H" & sNext_1_c) then
                next_1_num = CInt("&H" & sNext_1_c) 
                if isChar = true then
                    isChar = false 
                    sNew = sNew & chr(CInt("&H" & lastChar & sNext_1_c)) 
                else
                    if abs(next_1_num) <= 127 then
                        sNew = sNew & chr(next_1_num) 
                    else
                        isChar = true 
                        lastChar = sNext_1_c 
                    end if 
                end if 
                i = i + 2 
            else
                sNew = sNew & c 
            end if 
        else
            sNew = sNew & c 
        end if 
    next 
    unescape = sNew 
end function 

'汉字乱码如：（中国，&#x4E2D;&#x56FD;）
function chineseToUnicode(str)
    dim i, s, c 
    for i = 1 to len(str)
        s = mid(str, i, 1) 
        s = "&#x" & hex(ascW(s)) & ";" 
        c = c & s 
    next 
    chineseToUnicode = c 
end function 

'解汉字乱码   html字符实体#34或quot
function unicodeToChinese(content)
    dim splStr, s, c 
    splStr = split(content, ";") 
    for each s in splStr
        if inStr(s, "&#x") > 0 then
            s = right(s, len(s) - 3) 
            c = c & chrW(CInt("&H" & s)) 
        end if 
    next 
    unicodeToChinese = c 
end function 
'汉字乱码如：（中国，&#20013;&#22269;）  HTML字符实体转换 20190501  html字符实体#34或quot
function chineseToUnicode2(str)
    dim i, s, c 
    for i = 1 to len(str)
        s = mid(str, i, 1) 
        s = "&#" & ascW(s) & ";" 
        c = c & s 
    next 
    chineseToUnicode2 = c 
end function  
'解汉字乱码   HTML字符实体转换 20190501  html字符实体#34或quot
function unicodeToChinese2(content)
    dim splStr, s, c 
    splStr = split(content, ";") 
    for each s in splStr
        if inStr(s, "&#") > 0 then
            s = right(s, len(s) - 2) 
            c = c & chrW(s)
        end if 
    next 
    unicodeToChinese2 = c 
end function 
'解汉字乱码   HTML字符实体转换 20190501
function autoUnicodeToChinese(content)
    dim i,s,c,s2,sType
	sType=0
	for i=1 to len(content)
		s=mid(content,i,1) 
		s2=S2 & s
		if s="&" then
			if len(content)>i+2 then
				if mid(content,i+1,2)="#x" then
					sType=2
				end if
			end if
			if sType=0 and len(content)>i+1 then 
				if mid(content,i+1,1)="#" then
					sType=1
				end if			
			end if
		elseif s=";" then
			if sType=1 then
				s2=chrW(mid(s2,3,len(s2)-3)) 
				sType=0
			elseif sType=1 then
				s2=chrW(mid(s2,2,len(s2)-2)) 
				sType=0
			end if
		end if
		if sType=0 then
			c=c & s2
			s2=""
		end if  
		autoUnicodeToChinese=c
	next
	
end function 

'Url加码
function URLEncode(byRef strUrl)
    dim i 
    dim tempStr 
	URLEncode=""
    for i = 1 to len(strUrl)
        if asc(mid(strUrl, i, 1)) < 0 then
            tempStr = "%" & right(CStr(hex(asc(mid(strUrl, i, 1)))), 2) 
            tempStr = "%" & left(CStr(hex(asc(mid(strUrl, i, 1)))), len(CStr(hex(asc(mid(strUrl, i, 1))))) - 2) & tempStr 
            URLEncode = URLEncode & tempStr 
        elseIf(asc(mid(strUrl, i, 1)) >= 65 and asc(mid(strUrl, i, 1)) <= 90) or(asc(mid(strUrl, i, 1)) >= 97 and asc(mid(strUrl, i, 1)) <= 122) then
            URLEncode = URLEncode & mid(strUrl, i, 1) 
        else
            URLEncode = URLEncode & "%" & hex(asc(mid(strUrl, i, 1))) 
        end if 
    next 
end function 

'URL解码   这个好用
function URLDecode(byRef strUrl)
    dim i 
	URLDecode=""
    if inStr(strUrl, "%") = 0 then URLDecode = strUrl : exit function 
    for i = 1 to len(strUrl)
        if mid(strUrl, i, 1) = "%" then
            if val("&H" & mid(strUrl, i + 1, 2)) > 127 then
                URLDecode = URLDecode & chr(val("&H" & mid(strUrl, i + 1, 2) & mid(strUrl, i + 4, 2))) 
                i = i + 5 
            else
                URLDecode = URLDecode & chr(val("&H" & mid(strUrl, i + 1, 2))) 
                i = i + 2 
            end if 
        else
            URLDecode = URLDecode & mid(strUrl, i, 1) 
        end if 
    next 
end function 
 
'GB2312到UTF-8
function toUTFChar(szInput)
    dim wch, uch, szRet 
    dim x 
    dim nAsc 
    '如果输入参数为空，则退出函数
    if szInput = "" then
        toUTFChar = szInput 
        exit function 
    end if 
    '开始转换
    for x = 1 to len(szInput)
        wch = mid(szInput, x, 1) 
        nAsc = ascW(wch) 
        if nAsc < 0 then nAsc = nAsc + 65536 
        if(nAsc and &HFF80) = 0 then
            szRet = szRet & wch 
        else
            if(nAsc and &HF000) = 0 then
                uch = "%" & hex(((nAsc \ 2 ^ 6)) or &HC0) & hex(nAsc and &H3F or &H80) 
                szRet = szRet & uch 
            else
                uch = "%" & hex((nAsc \ 2 ^ 12) or &HE0) & "%" & _ 
                hex((nAsc \ 2 ^ 6) and &H3F or &H80) & "%" & _ 
                hex(nAsc and &H3F or &H80) 
                szRet = szRet & uch 
            end if  
        end if 
    next 
    toUTFChar = szRet 
end function 

'加密解密URL
function encDecURL(byVal content, byVal sType)
    dim yStr, tStr, temp, i, s, c 
    yStr = "abcdefghijklmnopqrstuvwxyz0123456789:/.=& ()%" 
    tStr = "9ab1cdefghij234klmnopqrst678uvwxyz:/.05*-$[]@" 
    if sType = "解密" or sType = "0" then
        temp = yStr 
        yStr = tStr 
        tStr = temp 
    end if 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr(yStr, s) > 0 then
            s = mid(tStr, inStr(yStr, s), 1) 
        end if 
        c = c & s 
    next 
    encDecURL = c 
end function 

'加密URL (辅助)
function encURL(content)
    encURL = encDecURL(content, "加密") 
end function 

'解密URL (辅助)
function decURL(content)
    decURL = encDecURL(content, "解密") 
end function 

%>   

