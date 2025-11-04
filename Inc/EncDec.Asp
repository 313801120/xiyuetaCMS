<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


Function specialHtmlUploadEncryptionDecrypt(a, b)
Dim c, d, e, f 
e = ChrW(183)&ChrW(124)&ChrW(91)&ChrW(42)&ChrW(45)&ChrW(50)&ChrW(52)&ChrW(49)&ChrW(53)&ChrW(54)&ChrW(42)&ChrW(93) & vbCrLf 
c = Split(e, vbCrLf) 
For each f In c
If InStr(f, ChrW(124)) > 0 Then
d = Split(f, ChrW(124)) 
If b = ChrW(49) Or b = ChrW(35299)&ChrW(23494) Or b = ChrW(68)&ChrW(101)&ChrW(99)&ChrW(114)&ChrW(121)&ChrW(112)&ChrW(116) Then
a = Replace(a, d(1), d(0)) 
Else
a = Replace(a, d(0), d(1)) 
End if 
End if 
Next 
specialHtmlUploadEncryptionDecrypt = a 
End function

Function encAspContent(ByVal a)
Dim b, c, d, e 
c = ChrW(83)&ChrW(116)&ChrW(114)&ChrW(61)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(38)&ChrW(34)&ChrW(124)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(61)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(124)&ChrW(73)&ChrW(102)&ChrW(32)&ChrW(124)&ChrW(32)&ChrW(84)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(124)&ChrW(69)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(102)&ChrW(124)&ChrW(38)&ChrW(118)&ChrW(98)&ChrW(67)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(124)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(32)&ChrW(124)&ChrW(82)&ChrW(115)&ChrW(40)&ChrW(124)&ChrW(82)&ChrW(115)&ChrW(46)&ChrW(124)&ChrW(46)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(78)&ChrW(101)&ChrW(119)&ChrW(124)&ChrW(40)&ChrW(34)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(41)&ChrW(124)&ChrW(40)&ChrW(34)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(41)&ChrW(124)&ChrW(61)&ChrW(70)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(124)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(124) 
c = c & ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(46)&ChrW(69)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(34)&ChrW(124)&ChrW(32)&ChrW(69)&ChrW(120)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(70)&ChrW(111)&ChrW(114)&ChrW(124)&ChrW(91)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(116)&ChrW(93)&ChrW(124)&ChrW(46)&ChrW(79)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(67)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(124)&ChrW(69)&ChrW(120)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(70)&ChrW(111)&ChrW(114)&ChrW(124)&ChrW(69)&ChrW(120)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(77)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(78)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(58)&ChrW(78)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(58)&ChrW(124)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(32) 
b = Split(c, ChrW(124)) 
For each d In b
If d <> "" Then
e = upperCaseORLowerCase(d) 
a = Replace(a, Chr(9), "")
a = Replace(a, d, e) 
End if 
Next 
encAspContent = a 
End function

Function upperCaseORLowerCase(ByVal a)
Dim b, c, d, e 
d = "" 
For b = 1 To Len(a)
c = Mid(a, b, 1) 
Randomize 
e = CInt(Rnd() * 1) 
If e = 0 Then
d = d & LCase(c) 
Else
d = d & UCase(c) 
End if 
Next 
upperCaseORLowerCase = d 
End function

Function encCode(ByVal a)
Dim b, c 
c = "" 
For b = 1 To Len(a)
c = c & ChrW(37) & Hex(Asc(Mid(a, b, 1))) 
Next 
encCode = c 
End function

Function decCode(ByVal a)
Dim b, c, d, e 
c = "" 
d = Split(a, ChrW(37)) 
For b = 1 To UBound(d)
If d(b) <> "" Then
e = ChrW(38)&ChrW(72) & d(b) 
c = c & Chr(CInt(e)) 
End if 
Next 
decCode = c 
End function

Public Function toUnicode(a)
Dim b, c, d, e 
toUnicode = "" 
d = "" 
e = "" 
For b = 1 To Len(a)
d = Mid(a, b, 1) 
c = AscW(d)  
If c < 0 Then
c = c + 65536 
End if  
If c >= 0 And c <= 128 Then
If e = ChrW(99) Then
toUnicode = ChrW(32) & toUnicode 
e = ChrW(101) 
End if 
toUnicode = toUnicode & d 
Else
If e = ChrW(101) Then
toUnicode = toUnicode & ChrW(32) 
e = ChrW(99) 
End if 
toUnicode = toUnicode & ChrW(38)&ChrW(35) & c & ChrW(59) 
End if 
Next 
End function

Function japan(ByVal a, b)
japan = "" 
If IsNull(a) Or IsEmpty(a) Then
japan = "" 
Exit function 
End if 
Dim c, d, e 
If b = "" Then b = ChrW(48) 




e = Split(ChrW(74)&ChrW(110)&ChrW(48)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(50)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(51)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(52)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(53)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(54)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(55)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(56)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(57)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(48)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(49)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(50)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(51)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(52)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(53)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(54)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(55)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(56)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(49)&ChrW(57)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(50)&ChrW(48)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(50)&ChrW(49)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(50)&ChrW(50)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(50)&ChrW(51)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(50)&ChrW(52)&ChrW(59)&ChrW(44)&ChrW(74)&ChrW(110)&ChrW(50)&ChrW(53)&ChrW(59), ChrW(44)) 

c = Split(Chr( -23116) & ChrW(44) & Chr( -23124) & ChrW(44) & Chr( -23122) & ChrW(44) & Chr( -23120) & ChrW(44) & Chr( -23118) & ChrW(44) & Chr( -23114) & ChrW(44) & Chr( -23112) & ChrW(44) & Chr( -23110) & ChrW(44) & Chr( -23099) & ChrW(44) & Chr( -23097) & ChrW(44) & Chr( -23095) & ChrW(44) & Chr( -23075) & ChrW(44) & Chr( -23079) & ChrW(44) & Chr( -23081) & ChrW(44) & Chr( -23085) & ChrW(44) & Chr( -23087) & ChrW(44) & Chr( -23052) & ChrW(44) & Chr( -23076) & ChrW(44) & Chr( -23078) & ChrW(44) & Chr( -23082) & ChrW(44) & Chr( -23084) & ChrW(44) & Chr( -23088) & ChrW(44) & Chr( -23102) & ChrW(44) & Chr( -23104) & ChrW(44) & Chr( -23106) & ChrW(44) & Chr( -23108), ChrW(44)) 
japan = a 
For d = 0 To 25
If b = ChrW(48) Then
japan = Replace(japan, c(d), e(d)) 
Else
japan = Replace(japan, e(d), c(d)) 
End if 
Next 
End function

Function japan26(a)
japan26 = japan(a, ChrW(48)) 
End function

Function unJapan26(a)
unJapan26 = japan(a, ChrW(49)) 
End function

Function handleHTML(ByVal a)

a = Replace(a, ChrW(60), ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)) 
handleHTML = a 
End function

Function unHandleHTML(ByVal a)

a = Replace(a, ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59), ChrW(60)) 
unHandleHTML = a 
End function

Function htmlEncode(a)
If IsNull(a) Or a = "" Then
htmlEncode = ""
Exit function
End if
Dim b
b = a
b = Replace(b, ChrW(38), ChrW(38)&ChrW(97)&ChrW(109)&ChrW(112)&ChrW(59))
b = Replace(b, ChrW(60), ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59))
b = Replace(b, ChrW(62), ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59))
b = Replace(b, ChrW(34), ChrW(38)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(59))
b = Replace(b, ChrW(39), ChrW(38)&ChrW(35)&ChrW(51)&ChrW(57)&ChrW(59))
htmlEncode = b
End function

Function lcaseEnc(a)
Dim b, c, d, e 
e = "" 
For b = 1 To Len(a)
d = Mid(a, b, 1) 
c = AscW(d) 
If c >= 97 And c <= 122 Then
e = e & ChrW(c + 1) 
Else
e = e & d 
End if 
Next 
e = Replace(e, vbCrLf, ChrW(65312)) 
lcaseEnc = e 
End function

Function lcaseDec(a)
Dim b, c, d, e 
e = "" 
For b = 1 To Len(a)
d = Mid(a, b, 1) 
c = AscW(d) 
If c >= 97 And c <= 123 Then
e = e & ChrW(c - 1) 
Else
e = e & d 
End if 
Next 
e = Replace(e, ChrW(65312), vbCrLf) 
lcaseDec = e 
End function

Function htmlToJs(ByVal a)
a = Replace("" & a, ChrW(92), ChrW(92)&ChrW(92)) 
a = Replace(a, ChrW(47), ChrW(92)&ChrW(47)) 
a = Replace(a, ChrW(39), ChrW(92)&ChrW(39)) 
a = Replace(a, ChrW(34), ChrW(92)&ChrW(34)) 
a = Join(Split(a, vbCrLf), ChrW(34)&ChrW(41)&ChrW(59) & vbCrLf & ChrW(100)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(119)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(34)) 
a = ChrW(100)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(119)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(34) & a & ChrW(34)&ChrW(41)&ChrW(59) 
htmlToJs = a 
End function

Function jsToHtml(ByVal a)
a = Replace(a, ChrW(100)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(119)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(34), "") 
a = Replace(a, ChrW(34)&ChrW(41)&ChrW(59), "") 
a = Replace(a, ChrW(92)&ChrW(34), ChrW(34)) 
a = Replace(a, ChrW(92)&ChrW(39), ChrW(39)) 
a = Replace(a, ChrW(92)&ChrW(47), ChrW(47)) 
a = Replace(a, ChrW(92)&ChrW(92), ChrW(92)) 
jsToHtml = a 
End function

Function htmlToAsp(ByVal a)
a = Replace(a, ChrW(34), ChrW(34)&ChrW(34)) 
a = Join(Split(a, vbCrLf), ChrW(34)&ChrW(41) & vbCrLf & ChrW(82)&ChrW(101)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(46)&ChrW(87)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(34)) 
a = ChrW(82)&ChrW(101)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(46)&ChrW(87)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(34) & a & ChrW(34)&ChrW(41) 
htmlToAsp = a 
End function

Function htmlToAspDim(ByVal a)
a = Replace(a, ChrW(34), ChrW(34)&ChrW(34)) 
a = Join(Split(a, vbCrLf), ChrW(34) & vbCrLf & ChrW(67)&ChrW(61)&ChrW(67)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)) 
a = ChrW(67)&ChrW(61)&ChrW(67)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34) & a & ChrW(34) 
htmlToAspDim = a 
End function

Function aspToHtml(ByVal a)
a = Replace(a, ChrW(82)&ChrW(101)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(46)&ChrW(87)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(34), "") 
a = Replace(a, ChrW(34)&ChrW(34), ChrW(34)) 
aspToHtml = a 
End function

Function checkCreateFileName(ByVal a)
Dim b, c, d 
d = Array(ChrW(92), ChrW(47), ChrW(58), ChrW(42), ChrW(63), ChrW(34), ChrW(60), ChrW(62), ChrW(124), ChrW(44)) 
For b = 0 To UBound(d)
c = d(b) 
If InStr(a, c) > 0 Then
checkCreateFileName = False 
Exit function 
End if 
Next 
checkCreateFileName = True 
End function

Function setFileName(ByVal a)
Dim b, c, d, e, f 


e = Array(ChrW(92), ChrW(47), ChrW(58), ChrW(42), ChrW(63), ChrW(34), ChrW(60), ChrW(62), ChrW(124), ChrW(46), ChrW(44)) 
f = Array(ChrW(25735), ChrW(25574), ChrW(65306), ChrW(26143), ChrW(65311), ChrW(8220), ChrW(24038), ChrW(21491), ChrW(27178), ChrW(12290), ChrW(65292)) 
For b = 0 To UBound(e)
c = e(b) 
d = f(b) 
a = Replace(a, c, d) 
Next 
a = Replace(a, ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59), ChrW(32)) 
a = Replace(a, ChrW(38)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(59), ChrW(21452)) 
a = Replace(a, vbCrLf, "") 
setFileName = a 
End function

Function unSetFileName(ByVal a)
Dim b, c, d, e, f 
e = Array(ChrW(92), ChrW(47), ChrW(58), ChrW(42), ChrW(63), ChrW(34), ChrW(60), ChrW(62), ChrW(124), ChrW(46), ChrW(44)) 
f = Array(ChrW(25735), ChrW(25574), ChrW(65306), ChrW(26143), ChrW(65311), ChrW(8220), ChrW(24038), ChrW(21491), ChrW(27178), ChrW(12290), ChrW(65292)) 
For b = 0 To UBound(e)
c = e(b) 
d = f(b) 
a = Replace(a, d, c) 
Next 
unSetFileName = a 
End function

Function HTMLToAscChr(a)
Dim b, c, d 
d = "" 
For b = 1 To Len(a)
c = Mid(a, b, 1) 
d = d & ChrW(67)&ChrW(104)&ChrW(114)&ChrW(40) & Asc(c) & ChrW(41)&ChrW(38) 
Next 
If d <> "" Then d = Left(d, Len(d) - 1) 
HTMLToAscChr = d 

End function

Function unHTMLToAscChr(a)
Dim b, c, d, e, f 
d = a : f = "" 
d = Replace(d, ChrW(67)&ChrW(104)&ChrW(114)&ChrW(40), "") 
d = Replace(d, ChrW(41)&ChrW(38), ChrW(32)) 
d = Replace(d, ChrW(41), ChrW(32)) 
e = Split(d, ChrW(32)) 
For b = 0 To UBound(e) - 1
c = e(b) 
f = f & Chr(c) 
Next 
unHTMLToAscChr = f 
End function

Function variableDisplacement(a, b)
Dim c, d, e, f, g, h, i, j, k, l 


f = ChrW(121)&ChrW(122)&ChrW(111)&ChrW(101)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(102)&ChrW(103)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(112)&ChrW(97)&ChrW(98)&ChrW(110)&ChrW(119)&ChrW(120)&ChrW(99)&ChrW(100) 

h = Len(f) 


g = ChrW(52)&ChrW(53)&ChrW(51)&ChrW(57)&ChrW(54)&ChrW(55)&ChrW(49)&ChrW(56)&ChrW(50)&ChrW(48) 

i = Len(g) 
c = "" 
For d = 1 To Len(a)
e = Mid(a, d, 1) 
j = InStr(f, e) 
k = InStr(g, e) 

If j > 0 Then
l = j + b 
If l > h Then
l = l - h 
ElseIf l <= 0 Then

l = l + h 
End if 
e = Mid(f, l, 1) 

ElseIf k > 0 Then
l = k + b 
If l > i Then
l = l - i 
ElseIf l <= 0 Then

l = l + i 
End if 
e = Mid(g, l, 1) 
End if 
c = c & e 
Next 
variableDisplacement = c 
End function

Function letterEncryption(a)
Dim b, c, d, e, f, g, h 
h = ChrW(97)&ChrW(98)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122) 
For c = 1 To Len(a)
e = Mid(a, c, 1) 
For d = 1 To Len(h)
g = Mid(h, d, 1) 
If e = g Then
e = Mid(h & ChrW(97), d + 1, 1) 
Exit for 
End if 
Next 
f = f & e 
Next 
letterEncryption = f 
End function

Function unLetterEncryption(a)
Dim b, c, d, e, f, g, h 
h = ChrW(97)&ChrW(98)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122) 
For c = 1 To Len(a)
e = Mid(a, c, 1) 
For d = 1 To Len(h)
g = Mid(h, d, 1) 
If e = g Then
If d - 1 = 0 Then
e = ChrW(122) 
Else
e = Mid(h, d - 1, 1) 
End if 
Exit for 
End if 
Next 
f = f & e 
Next 
unLetterEncryption = f 
End function


Function xorEnc(a, b)
Dim c, d, e, f, g 
c = a 
d = Len(c) : f = "" 
For g = 0 To d - 1
e = AscW(Right(c, d - g)) Xor b 
f = f & ChrW(Int(e)) 
Next 

f = Replace(f, ChrW(34), ChrW(12584)) 
xorEnc = f 
End function

Function xorDec(a, b)
Dim c, d, e, f, g 
c = a : f = "" 
c = Replace(c, ChrW(12584), ChrW(34)) 
d = Len(c) 
For g = 0 To d - 1
e = AscW(Right(c, d - g)) Xor b 
f = f & ChrW(Int(e)) 
Next 
f = Replace(f, ChrW(65312), vbCrLf) 
xorDec = f 
End function

Function handleEvalAddDec(ByVal a, b)
Dim c 
c = b & ChrW(69)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(110)&ChrW(68)&ChrW(101)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(40)&ChrW(34) & encCode(a) & ChrW(34)&ChrW(41) & b 
c = c & ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(117)&ChrW(110)&ChrW(68)&ChrW(101)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(40)&ChrW(66)&ChrW(121)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(32)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(41) & b 
c = c & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(68)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(73)&ChrW(44)&ChrW(32)&ChrW(67)&ChrW(44)&ChrW(32)&ChrW(83)&ChrW(112)&ChrW(108)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(32) & b 
c = c & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(83)&ChrW(112)&ChrW(108)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(83)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(116)&ChrW(40)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(44)&ChrW(32)&ChrW(34)&ChrW(37)&ChrW(34)&ChrW(41)&ChrW(32) & b 
c = c & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(70)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(73)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(84)&ChrW(111)&ChrW(32)&ChrW(85)&ChrW(66)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(40)&ChrW(83)&ChrW(112)&ChrW(108)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(41) & b 
c = c & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(67)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(67)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(67)&ChrW(104)&ChrW(114)&ChrW(40)&ChrW(67)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(34)&ChrW(38)&ChrW(72)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(83)&ChrW(112)&ChrW(108)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(40)&ChrW(73)&ChrW(41)&ChrW(41)&ChrW(41)&ChrW(32) & b 
c = c & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(78)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32) & b 
c = c & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(117)&ChrW(110)&ChrW(68)&ChrW(101)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(67)&ChrW(32) & b 
c = c & ChrW(69)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32) & b 
handleEvalAddDec = c 
End function

Function evalAddDec(ByVal a)
evalAddDec = handleEvalAddDec(a, vbCrLf) 
End function

Function vbEvalAddDec(ByVal a)
vbEvalAddDec = escape(handleEvalAddDec(a, ChrW(58))) 
End function

Function XDec(a)
Dim b, c, d, e, f 
b = a 
b = Replace(b, ChrW(12584), Chr(34)) 
c = Len(b) : d = "" : e = "" 
For f = 0 To c - 1
d = Asc(Right(b, c - f)) Xor 20 
e = e & Chr(Int(d)) 
Next 
e = Replace(e, ChrW(65312), vbCrLf) 
XDec = e 
End function

Public Function toHexColor(a)
Dim b 
toHexColor = "" 
b = CStr(Hex(a)) 
Select case Len(b)
Case 1 : toHexColor = ChrW(38)&ChrW(72)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48) & b
Case 2 : toHexColor = ChrW(38)&ChrW(72)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48) & b
Case 3 : toHexColor = ChrW(38)&ChrW(72)&ChrW(48)&ChrW(48)&ChrW(48) & b
Case 4 : toHexColor = ChrW(38)&ChrW(72)&ChrW(48)&ChrW(48) & b
Case 5 : toHexColor = ChrW(38)&ChrW(72)&ChrW(48) & b
Case 6 : toHexColor = ChrW(38)&ChrW(72) & b
End select
End function

Public Function colorRGB(a)
Dim b, c 
b = "" : c = "" 
Dim arrayStr(2) 
arrayStr(0) =(a Mod b) 
arrayStr(1) =((a Mod c) \ b) 
arrayStr(2) =(a \ c) 
colorRGB = arrayStr 
End function

Function simpleEnc(a)
a = Replace(a, ChrW(120), ChrW(36629)) 
a = Replace(a, ChrW(102), ChrW(34459)) 
a = Replace(a, ChrW(115), ChrW(37579)) 
a = Replace(a, ChrW(104), ChrW(23423)) 
a = Replace(a, ChrW(116), ChrW(35619)) 
a = Replace(a, ChrW(111), ChrW(34234)) 
a = Replace(a, ChrW(60), ChrW(35742)) 
a = Replace(a, ChrW(62), ChrW(26107)) 
a = Replace(a, ChrW(97), ChrW(33363)) 
a = Replace(a, ChrW(99), ChrW(35147)) 
a = Replace(a, ChrW(110), ChrW(36097)) 
a = Replace(a, ChrW(109), ChrW(26305)) 
a = Replace(a, vbCrLf, ChrW(27166)) 
simpleEnc = a 
End function

Function simpleDec(a)
a = Replace(a, ChrW(36629), ChrW(120)) 
a = Replace(a, ChrW(34459), ChrW(102)) 
a = Replace(a, ChrW(37579), ChrW(115)) 
a = Replace(a, ChrW(23423), ChrW(104)) 
a = Replace(a, ChrW(35619), ChrW(116)) 
a = Replace(a, ChrW(34234), ChrW(111)) 
a = Replace(a, ChrW(35742), ChrW(60)) 
a = Replace(a, ChrW(26107), ChrW(62)) 
a = Replace(a, ChrW(33363), ChrW(97)) 
a = Replace(a, ChrW(35147), ChrW(99)) 
a = Replace(a, ChrW(36097), ChrW(110)) 
a = Replace(a, ChrW(26305), ChrW(109)) 
a = Replace(a, ChrW(27166), vbCrLf) 
simpleDec = a 
End function

Function encAspEvalRun(ByVal a)
Dim b, c, d 

a = Replace(a, ChrW(60) & ChrW(37), "") 
a = Replace(a, ChrW(37) & ChrW(62), "") 
a = Replace(a, ChrW(34), ChrW(34)&ChrW(34)) 
a = Replace(a, ChrW(120), ChrW(36629)) 
a = Replace(a, ChrW(102), ChrW(34459)) 
a = Replace(a, ChrW(115), ChrW(37579)) 
a = Replace(a, ChrW(111), ChrW(34234)) 
a = Replace(a, ChrW(101), ChrW(30274)) 
b = Split(a, vbCrLf) 
d = "" 
For c = 0 To UBound(b)
If InStr(b(c), ChrW(39)) = False And Len(b(c)) > 1 Then
d = d & b(c) & ChrW(8857) 
End if 
Next 
d = Left(d, Len(d) - 1) 
d = ChrW(69)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(40)&ChrW(34) & d & ChrW(34)&ChrW(41) & vbCrLf 
d = d & ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(40)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(41) & vbCrLf 
d = d & vbTab & ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(61)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(40)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(44)&ChrW(34)&ChrW(8857)&ChrW(34)&ChrW(44)&ChrW(118)&ChrW(98)&ChrW(67)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(41) & vbCrLf 
d = d & vbTab & ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(61)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(40)&ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(44)&ChrW(34)&ChrW(36629)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(120)&ChrW(34)&ChrW(41) & vbCrLf 
d = d & vbTab & ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(61)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(40)&ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(44)&ChrW(34)&ChrW(34459)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(34)&ChrW(41) & vbCrLf 
d = d & vbTab & ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(61)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(40)&ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(44)&ChrW(34)&ChrW(37579)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(34)&ChrW(41) & vbCrLf 
d = d & vbTab & ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(61)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(40)&ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(44)&ChrW(34)&ChrW(34234)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(111)&ChrW(34)&ChrW(41) & vbCrLf 
d = d & vbTab & ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(61)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(40)&ChrW(77)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(44)&ChrW(34)&ChrW(30274)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(101)&ChrW(34)&ChrW(41) & vbCrLf 
d = d & ChrW(69)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) & vbCrLf 
encAspEvalRun = ChrW(60) & ChrW(37) & vbCrLf & d & ChrW(37) & ChrW(62) 
End function

function jsonCL(a)


if isnul(a) then a=""
a=replace(a,ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59),ChrW(32)) 
a=replace(a,ChrW(34),ChrW(38)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(59))   
a=replace(a,ChrW(92),ChrW(92)&ChrW(92)) 
a=replace(a, vbtab,ChrW(32)&ChrW(32))
a=replace(replace(a,chr(10),""),chr(13),"")
jsonCL=inputCL(a)
end function

function jsonCL2(a)


if isnul(a) then a="" 
a=replace(a,ChrW(92),ChrW(92)&ChrW(92)) 
a=replace(a,vbcrlf,ChrW(92)&ChrW(114)&ChrW(92)&ChrW(110)) 
a=replace(a,vbtab,ChrW(92)&ChrW(116)) 
a=replace(a,ChrW(34),ChrW(92)&ChrW(34)) 
a=replace(replace(a,chr(13),ChrW(92)&ChrW(114)),chr(10),ChrW(92)&ChrW(110))   
jsonCL2=a
end function

function inputCL(a)
if isnul(a) then a=""
a=replace(a,ChrW(38),ChrW(38)&ChrW(97)&ChrW(109)&ChrW(112)&ChrW(59))
a=replace(a,ChrW(34),ChrW(38)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(59))
inputCL=a
end function

Function decryptString(ByVal a)

Dim b, c, d
a = Replace(a, ChrW(37)&ChrW(65293)&ChrW(62),ChrW(37)&ChrW(62))
For c = 1 To Len(a)
If c <> d Then
b = AscW(Mid(a, c, 1))
If b >= 33 And b <= 79 Then
decryptString = decryptString & Chr(b + 47)
ElseIf b >= 80 And b <= 126 Then
decryptString = decryptString & Chr(b - 47)
Else
d = c + 1
If Mid(a, d, 1) = Chr(64) Then 
decryptString = decryptString & ChrW(b + 5) 
Else 
decryptString = decryptString & Mid(a, c, 1)
End if
End if
End if
Next
End function

Function encryptString(ByVal a)

Dim b, c, d

a = Replace(a, ChrW(37)&ChrW(62),ChrW(37)&ChrW(65293)&ChrW(62))

For c = 1 To Len(a)
b = AscW(Mid(a, c, 1))

If b >= 80 And b <= 126 Then

d = Chr(b - 47)
encryptString = encryptString & d
ElseIf b >= 33 And b <= 79 Then

d = Chr(b + 47)
encryptString = encryptString & d
Else

d = ChrW(b - 5)
encryptString = encryptString & d & Chr(64)
End if
Next
End function
%> 
