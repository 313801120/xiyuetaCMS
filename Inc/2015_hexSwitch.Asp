<% 
'进制转换   

'字符转十六进制  (10to16)   response.Write(strToHex("中国人123abc"))
Function strToHex(ByVal content)
    Dim i, c  
    For i = 1 To Len(content)
        c = c & Hex(Asc(Mid(content, i, 1))) 
    Next 
    strToHex = c 
End Function
'十六进制转字符  (16to10)        response.Write("<hr>" & hexToStr("D6D0B9FAC8CB313233616263"))
Function hexToStr(byval content)
    Dim i, c
    For i = 1 To Len(content) Step 2
        c = Mid(content, i, 2) 
        if c="DA" then
			hexToStr=hexToStr & vbcrlf
		else
			If IsNumeric(Mid(content, i, 1)) Then
				hexToStr=hexToStr & chr("&H" & c)
			Else
				hexToStr=hexToStr & chr("&H" & c & Mid(content, i + 2, 2))
				i = i + 2 
			End If 
		end if
    Next 
End Function
'中国菜刀软件用就这么用的，保留（20151105）
function bd(content)
	bd=hexToStr(content)
end function






'二进制代码转换为十六进制代码
Function c2to16(X)
    Dim I 
    I = 1 
    For I = 1 To Len(X) Step 4
        c2to16 = c2to16 & Hex(c2to10(Mid(X, I, 4))) 
    Next 
End Function
 
'二进制代码转换为十进制代码
Function c2to10(X)
    Dim I 
    c2to10 = 0 
    If X = "0" Then Exit Function 
    I = 0 
    For I = 0 To Len(X) - 1
        If Mid(X, Len(X) - I, 1) = "1" Then c2to10 = c2to10 + 2 ^(I) 
    Next 
End Function
 
'十六进制代码转换为二进制代码
Function c16to2(X)
    Dim I, TempStr 
    I = 0 
    For I = 1 To Len(Trim(X))
        TempStr = c10to2(CInt(Int("&h" & Mid(X, I, 1)))) 
        Do While Len(TempStr) < 4
            TempStr = "0" & TempStr 
        Loop 
        c16to2 = c16to2 & TempStr 
    Next 
End Function
 
'十进制代码转换为二进制代码
Function c10to2(X)
    Dim mysign, DigS, tempnum, I 
    mysign = Sgn(X) 
    X = Abs(X) 
    DigS = 1 
    Do
        If X < 2 ^ DigS Then
            Exit Do 
        Else
            DigS = DigS + 1 
        End If 
    Loop 
    tempnum = X 
    I = 0 
    For I = DigS To 1 Step - 1
        If tempnum >= 2 ^(I - 1) Then
            tempnum = tempnum - 2 ^(I - 1) 
            c10to2 = c10to2 & "1"
        Else
            c10to2 = c10to2 & "0" 
        End If 
    Next 
    If mysign = -1 Then c10to2 = "-" & c10to2 
End Function


'EncDec 加密解密 (2013,9,27
'字符串到二进制
Function str2bin(varstr)
    Dim I, varasc, varchar, varlow, varhigh 
    str2bin = "" 
    For I = 1 To Len(varstr)
        varchar = Mid(varstr, I, 1) 
        varasc = Asc(varchar) 
        'asc对中文字符求出来的值可能为负数，
        '加上65536就可求出它的无符号数值
        '-1在机器内是用补码表示的0xffff,
        '其无符号值为65535,65535=-1+65536
        '其他负数依次类推。
        If varasc < 0 Then
            varasc = varasc + 65535 
        End If 
        '对中文的处理：把双字节低位和高位分开
        If varasc > 255 Then
            varlow = Left(Hex(Asc(varchar)), 2) 
            varhigh = Right(Hex(Asc(varchar)), 2) 
            str2bin = str2bin & ChrB("&H" & varlow) & ChrB("&H" & varhigh) 
        Else
            str2bin = str2bin & ChrB(AscB(varchar)) 
        End If 
    Next 
End Function
 
'二进制到字符串
Function bytes2BSTR(splstr)
    Dim Strreturn 
    Dim I, ThisCharCode, NextCharCode 
    Strreturn = "" 
    For I = 1 To ubound(splstr)
        ThisCharCode = midBin(splstr, I, 1)
        If ThisCharCode < &H80 Then
            Strreturn = Strreturn & Chr(ThisCharCode) 
        Else
            NextCharCode = midBin(splstr, I + 1, 1) 
            Strreturn = Strreturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode)) 
            I = I + 1 
        End If 
    Next 
    bytes2BSTR = Strreturn 
End Function
%>  
