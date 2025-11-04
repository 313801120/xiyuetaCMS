<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


Function strToHex(ByVal a)
Dim b, c  
For b = 1 To Len(a)
c = c & Hex(Asc(Mid(a, b, 1))) 
Next 
strToHex = c 
End function

Function hexToStr(byval a)
Dim b, c
For b = 1 To Len(a) Step 2
c = Mid(a, b, 2) 
if c=ChrW(68)&ChrW(65) then
hexToStr=hexToStr & vbcrlf
else
If IsNumeric(Mid(a, b, 1)) Then
hexToStr=hexToStr & chr(ChrW(38)&ChrW(72) & c)
Else
hexToStr=hexToStr & chr(ChrW(38)&ChrW(72) & c & Mid(a, b + 2, 2))
b = b + 2 
End if 
end if
Next 
End function

function bd(a)
bd=hexToStr(a)
end function

Function c2to16(a)
Dim b 
b = 1 
For b = 1 To Len(a) Step 4
c2to16 = c2to16 & Hex(c2to10(Mid(a, b, 4))) 
Next 
End function

Function c2to10(a)
Dim b 
c2to10 = 0 
If a = ChrW(48) Then Exit function 
b = 0 
For b = 0 To Len(a) - 1
If Mid(a, Len(a) - b, 1) = ChrW(49) Then c2to10 = c2to10 + 2 ^(b) 
Next 
End function

Function c16to2(a)
Dim b, c 
b = 0 
For b = 1 To Len(Trim(a))
c = c10to2(CInt(Int(ChrW(38)&ChrW(104) & Mid(a, b, 1)))) 
Do while Len(c) < 4
c = ChrW(48) & c 
Loop 
c16to2 = c16to2 & c 
Next 
End function

Function c10to2(a)
Dim b, c, d, e 
b = Sgn(a) 
a = Abs(a) 
c = 1 
Do
If a < 2 ^ c Then
Exit do 
Else
c = c + 1 
End if 
Loop 
d = a 
e = 0 
For e = c To 1 Step - 1
If d >= 2 ^(e - 1) Then
d = d - 2 ^(e - 1) 
c10to2 = c10to2 & ChrW(49)
Else
c10to2 = c10to2 & ChrW(48) 
End if 
Next 
If b = -1 Then c10to2 = ChrW(45) & c10to2 
End function


Function str2bin(a)
Dim b, c, d, e, f 
str2bin = "" 
For b = 1 To Len(a)
d = Mid(a, b, 1) 
c = Asc(d) 





If c < 0 Then
c = c + 65535 
End if 

If c > 255 Then
e = Left(Hex(Asc(d)), 2) 
f = Right(Hex(Asc(d)), 2) 
str2bin = str2bin & ChrB(ChrW(38)&ChrW(72) & e) & ChrB(ChrW(38)&ChrW(72) & f) 
Else
str2bin = str2bin & ChrB(AscB(d)) 
End if 
Next 
End function

Function bytes2BSTR(a)
Dim b 
Dim c, d, e 
b = "" 
For c = 1 To ubound(a)
d = midBin(a, c, 1)
If d < &H80 Then
b = b & Chr(d) 
Else
e = midBin(a, c + 1, 1) 
b = b & Chr(CLng(d) * &H100 + CInt(e)) 
c = c + 1 
End if 
Next 
bytes2BSTR = b 
End function
%>  
