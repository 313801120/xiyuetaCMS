<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%








Const nMaxSaturation = 100
Const nBlankNoisyDotOdds = 0.2
Const nColorNoisyDotOdds = 0.1
Const nCharCount = 4
Const nPixelWidth = 22
Const nPixelHeight = 22
Const nColorHue = -1
Const nAngleRandom = 10
Const nLengthRandom = 30
Const cCharSet = "0123456789"


Dim Buf(), DigtalStr
Dim Lines(), LineCount
Dim CursorX, CursorY, DirX, DirY
Randomize
Call CreatValidCode(ChrW(121)&ChrW(122)&ChrW(109))
Sub CDGen_Reset()

LineCount = 0
CursorX = 0
CursorY = 0

DirX = 0
DirY = 1
End sub
Sub CDGen_Clear()

Dim a, b
ReDim Buf(nPixelHeight - 1, nCharCount * nPixelWidth - 1)
For b = 0 To nPixelHeight - 1
For a = 0 To nCharCount * nPixelWidth - 1
Buf(b, a) = 0
Next
Next
End sub
Sub CDGen_PSet(a, b)

Buf(b, a) = 1
End sub
Sub CDGen_Line(a, b, c, d)

Dim e, f, g, h
e = c - a
f = d - b
If Abs(e) > Abs(f) Then g = Abs(e) Else g = Abs(f)
For h = 0 To g
CDGen_PSet a + e * h / g, b + f * h / g
Next
End sub
Sub CDGen_FowardDraw(a)

a = Sgn(a) * Abs(a) * (1 - nLengthRandom / 100 + Rnd * nLenghtRandom * 2 / 100)
ReDim Preserve Lines(3, LineCount)
Lines(0, LineCount) = CursorX
Lines(1, LineCount) = CursorY
CursorX = CursorX + DirX * a
CursorY = CursorY + DirY * a
Lines(2, LineCount) = CursorX
Lines(3, LineCount) = CursorY
LineCount = LineCount + 1
End sub
Sub CDGen_SetDirection(a)

Dim b, c
a = Sgn(a) * (Abs(a) - nAngleRandom + Rnd * nAngleRandom * 2) / 180 * 3.1415926
b = DirX
c = DirY
DirX = b * Cos(a) - c * Sin(a)
DirY = b * Sin(a) + c * Cos(a)
End sub
Sub CDGen_MoveToMiddle(a, b)

Dim c, d
c = Lines(2, a) - Lines(0, a)
d = Lines(3, a) - Lines(1, a)
CursorX = Lines(0, a) + Sgn(c) * Abs(c) * b / 100
CursorY = Lines(1, a) + Sgn(d) * Abs(d) * b / 100
End sub
Sub CDGen_MoveCursor(a)

CursorX = Lines(0, a)
CursorY = Lines(1, a)
End sub
Sub CDGen_Close(a)

ReDim Preserve Lines(3, LineCount)
Lines(0, LineCount) = CursorX
Lines(1, LineCount) = CursorY
CursorX = Lines(0, a)
CursorY = Lines(1, a)
Lines(2, LineCount) = CursorX
Lines(3, LineCount) = CursorY
LineCount = LineCount + 1
End sub
Sub CDGen_CloseToMiddle(a, b)

Dim c, d
ReDim Preserve Lines(3, LineCount)
Lines(0, LineCount) = CursorX
Lines(1, LineCount) = CursorY
c = Lines(2, a) - Lines(0, a)
d = Lines(3, a) - Lines(1, a)
CursorX = Lines(0, a) + Sgn(c) * Abs(c) * b / 100
CursorY = Lines(1, a) + Sgn(d) * Abs(d) * b / 100
Lines(2, LineCount) = CursorX
Lines(3, LineCount) = CursorY
LineCount = LineCount + 1
End sub
Sub CDGen_Flush(a, b)

Dim c, d, e, f
Dim g, h, i, j, k, l
Dim m
c = d = e = f = 0
For m = 0 To LineCount - 1
If c < Lines(0, m) Then c = Lines(0, m)
If c < Lines(2, m) Then c = Lines(2, m)
If d > Lines(0, m) Then d = Lines(0, m)
If d > Lines(2, m) Then d = Lines(2, m)
If e < Lines(1, m) Then e = Lines(1, m)
If e < Lines(3, m) Then e = Lines(3, m)
If f > Lines(1, m) Then f = Lines(1, m)
If f > Lines(3, m) Then f = Lines(3, m)
Next
g = c - d
h = e - f
If g = 0 Then g = 1
If h = 0 Then h = 1
c = d
e = f
If g > h Then
i = (nPixelWidth - 2) / g
j = (nPixelHeight - 2) / g
k = 0
l = (g - h) / 2
Else
i = (nPixelWidth - 2) / h
j = (nPixelHeight - 2) / h
k = (h - g) / 2
l = 0
End if
For m = 0 To LineCount - 1
Lines(0, m) = Round((Lines(0, m) - c + k) * i, 0)
If Lines(0, m) < 0 Then Lines(0, m) = 0
If Lines(0, m) >= nPixelWidth - 2 Then Lines(0, m) = nPixelWidth - 3
Lines(1, m) = Round((Lines(1, m) - e + l) * j, 0)
If Lines(1, m) < 0 Then Lines(1, m) = 0
If Lines(1, m) >= nPixelHeight - 2 Then Lines(1, m) = nPixelHeight - 3
Lines(2, m) = Round((Lines(2, m) - d + k) * i, 0)
If Lines(2, m) < 0 Then Lines(2, m) = 0
If Lines(2, m) >= nPixelWidth - 2 Then Lines(2, m) = nPixelWidth - 3
Lines(3, m) = Round((Lines(3, m) - f + l) * j, 0)
If Lines(3, m) < 0 Then Lines(3, m) = 0
If Lines(3, m) >= nPixelHeight - 2 Then Lines(3, m) = nPixelHeight - 3
CDGen_Line Lines(0, m) + a + 1, Lines(1, m) + b + 1, Lines(2, m) + a + 1, Lines(3, m) + b + 1
Next
End sub
Sub CDGen_Char(a, b, c)

CDGen_Reset
Select case a
Case ChrW(48)
CDGen_SetDirection -60
CDGen_FowardDraw -0.7
CDGen_SetDirection -60
CDGen_FowardDraw -0.7
CDGen_SetDirection 120
CDGen_FowardDraw 1.5
CDGen_SetDirection -60
CDGen_FowardDraw 0.7
CDGen_SetDirection -60
CDGen_FowardDraw 0.7
CDGen_Close 0
Case ChrW(49)
CDGen_SetDirection -90
CDGen_FowardDraw 0.5
CDGen_MoveToMiddle 0, 50
CDGen_SetDirection 90
CDGen_FowardDraw -1.4
CDGen_SetDirection 30
CDGen_FowardDraw 0.4
Case ChrW(50)
CDGen_SetDirection 45
CDGen_FowardDraw -0.7
CDGen_SetDirection -120
CDGen_FowardDraw 0.4
CDGen_SetDirection 60
CDGen_FowardDraw 0.6
CDGen_SetDirection 60
CDGen_FowardDraw 1.6
CDGen_SetDirection -135
CDGen_FowardDraw 1.0
Case ChrW(51)
CDGen_SetDirection -90
CDGen_FowardDraw 0.8
CDGen_SetDirection 135
CDGen_FowardDraw 0.8
CDGen_SetDirection -120
CDGen_FowardDraw 0.6
CDGen_SetDirection 80
CDGen_FowardDraw 0.5
CDGen_SetDirection 60
CDGen_FowardDraw 0.5
CDGen_SetDirection 60
CDGen_FowardDraw 0.5
Case ChrW(52)
CDGen_SetDirection 20
CDGen_FowardDraw 0.8
CDGen_SetDirection -110
CDGen_FowardDraw 1.2
CDGen_MoveToMiddle 1, 60
CDGen_SetDirection 90
CDGen_FowardDraw 0.7
CDGen_MoveCursor 2
CDGen_FowardDraw -1.5
Case ChrW(53)
CDGen_SetDirection 90
CDGen_FowardDraw 1.0
CDGen_SetDirection -90
CDGen_FowardDraw 0.8
CDGen_SetDirection -90
CDGen_FowardDraw 0.8
CDGen_SetDirection 30
CDGen_FowardDraw 0.4
CDGen_SetDirection 60
CDGen_FowardDraw 0.4
CDGen_SetDirection 30
CDGen_FowardDraw 0.5
CDGen_SetDirection 60
CDGen_FowardDraw 0.8
Case ChrW(54)
CDGen_SetDirection -60
CDGen_FowardDraw -0.7
CDGen_SetDirection -60
CDGen_FowardDraw -0.7
CDGen_SetDirection 120
CDGen_FowardDraw 1.5
CDGen_SetDirection 120
CDGen_FowardDraw -0.7
CDGen_SetDirection 120
CDGen_FowardDraw 0.7
CDGen_SetDirection 120
CDGen_FowardDraw -0.7
CDGen_SetDirection 120
CDGen_FowardDraw 0.5
CDGen_CloseToMiddle 2, 50
Case ChrW(55)
CDGen_SetDirection 180
CDGen_FowardDraw 0.3
CDGen_SetDirection 90
CDGen_FowardDraw 0.9
CDGen_SetDirection 120
CDGen_FowardDraw 1.3
Case ChrW(56)
CDGen_SetDirection -60
CDGen_FowardDraw -0.8
CDGen_SetDirection -60
CDGen_FowardDraw -0.8
CDGen_SetDirection 120
CDGen_FowardDraw 0.8
CDGen_SetDirection 110
CDGen_FowardDraw -1.5
CDGen_SetDirection -110
CDGen_FowardDraw 0.9
CDGen_SetDirection 60
CDGen_FowardDraw 0.8
CDGen_SetDirection 60
CDGen_FowardDraw 0.8
CDGen_SetDirection 60
CDGen_FowardDraw 0.9
CDGen_SetDirection 70
CDGen_FowardDraw 1.5
CDGen_Close 0
Case ChrW(57)
CDGen_SetDirection 120
CDGen_FowardDraw -0.7
CDGen_SetDirection -60
CDGen_FowardDraw -0.7
CDGen_SetDirection -60
CDGen_FowardDraw -1.5
CDGen_SetDirection -60
CDGen_FowardDraw -0.7
CDGen_SetDirection -60
CDGen_FowardDraw -0.7
CDGen_SetDirection 120
CDGen_FowardDraw 0.7
CDGen_SetDirection -60
CDGen_FowardDraw 0.5
CDGen_CloseToMiddle 2, 50

Case ChrW(65)
CDGen_SetDirection -(Rnd * 20 + 150)
CDGen_FowardDraw Rnd * 0.2 + 1.1
CDGen_SetDirection Rnd * 20 + 140
CDGen_FowardDraw Rnd * 0.2 + 1.1
CDGen_MoveToMiddle 0, 30
CDGen_CloseToMiddle 1, 70
Case ChrW(66)
CDGen_SetDirection -(Rnd * 20 + 50)
CDGen_FowardDraw Rnd * 0.4 + 0.8
CDGen_SetDirection Rnd * 20 + 110
CDGen_FowardDraw Rnd * 0.2 + 0.6
CDGen_SetDirection -(Rnd * 20 + 110)
CDGen_FowardDraw Rnd * 0.2 + 0.6
CDGen_SetDirection Rnd * 20 + 110
CDGen_FowardDraw Rnd * 0.4 + 0.8
CDGen_Close 0
Case ChrW(67)
CDGen_SetDirection -60
CDGen_FowardDraw -0.7
CDGen_SetDirection -60
CDGen_FowardDraw -0.7
CDGen_SetDirection 120
CDGen_FowardDraw 1.5
CDGen_SetDirection 120
CDGen_FowardDraw -0.7
CDGen_SetDirection 120
CDGen_FowardDraw 0.7
End select
CDGen_Flush b, c
End sub
Sub CDGen_Blur()

Dim a, b
For b = 1 To nPixelHeight - 2
For a = 1 To nCharCount * nPixelWidth - 2
If Buf(b, a) = 0 Then
If ((Buf(b, a - 1) Or Buf(b + 1, a)) And 1) <> 0 Then

Buf(b, a) = 2
End if
End if
Next
Next
End sub
Sub CDGen_NoisyDot()

Dim a, b, c, d
For b = 0 To nPixelHeight - 1
For a = 0 To nCharCount * nPixelWidth - 1
If Buf(b, a) <> 0 Then
c = Int(Rnd * Rnd * nMaxSaturation)
Select case nColorNoisyDotOdds
Case 0
d = nMaxSaturation
Case 1
d = 0
Case else
d = c
End select
If Rnd < nColorNoisyDotOdds Then Buf(b, a) = d Else Buf(b, a) = nMaxSaturation
Else
c = Int(Rnd * nMaxSaturation)
Select case nBlankNoisyDotOdds
Case 0
d = 0
Case 1
d = nMaxSaturation
Case else
d = c
End select
If Rnd < nBlankNoisyDotOdds Then Buf(b, a) = d Else Buf(b, a) = 0
End if
Next
Next
End sub
Sub CDGen()

Dim a, b
DigtalStr = ""
CDGen_Clear
For a = 0 To nCharCount - 1
b = Mid(cCharSet, Int(Rnd * Len(cCharSet)) + 1, 1)
DigtalStr = DigtalStr + b
CDGen_Char b, a * nPixelWidth, 0
Next
CDGen_Blur
CDGen_NoisyDot
End sub
Function HSBToRGB(a, b, c)

Dim aRGB(3), d, e, f
Dim g, h, i
Dim j, k, l, m, n
a = (a Mod 360)
If b > 100 Then
b = 100
ElseIf b < 0 Then
b = 0
End if
If c > 100 Then
c = 100
ElseIf c < 0 Then
c = 0
End if
If b > 0 Then
g = a / 60
h = b / 100
i = c / 100
j = Int(g)
k = g - j
l = i * (1 - h)
m = i * (1 - h * k)
n = i * (1 - h * (1 - k))
Select case j
Case 0
aRGB(0) = i * 255
aRGB(1) = n * 255
aRGB(2) = l * 255
Case 1
aRGB(0) = m * 255
aRGB(1) = i * 255
aRGB(2) = l * 255
Case 2
aRGB(0) = l * 255
aRGB(1) = i * 255    
aRGB(2) = n * 255
Case 3
aRGB(0) = l * 255
aRGB(1) = m * 255
aRGB(2) = i * 255
Case 4
aRGB(0) = n * 255
aRGB(1) = l * 255
aRGB(2) = i * 255
Case 5
aRGB(0) = i * 255
aRGB(1) = l * 255
aRGB(2) = m * 255
End select      
Else
aRGB(0) = (c * 255) / 100
aRGB(1) = aRGB(0)
aRGB(2) = aRGB(0)
End if
HSBToRGB = ChrB(Round(aRGB(2), 0)) & ChrB(Round(aRGB(1), 0)) & ChrB(Round(aRGB(0), 0))
End function
Sub CreatValidCode(a)
Dim b, c, d

Response.Expires = -9999
Response.AddHeader ChrW(112)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(109)&ChrW(97), ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)
Response.AddHeader ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108), ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)
Response.ContentType = ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47)&ChrW(98)&ChrW(109)&ChrW(112)
Call CDGen
Session(a) = DigtalStr
Dim e, f, g, h
e = nCharCount * nPixelWidth
f = nPixelHeight
h = e * f * 3
g = h + 54

Response.BinaryWrite ChrB(66) & ChrB(77) & _
ChrB(g Mod 256) & ChrB((g \ 256) Mod 256) & ChrB((g \ 256 \ 256) Mod 256) & ChrB(g \ 256 \ 256 \ 256) & _
ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & _
ChrB(54) & ChrB(0) & ChrB(0) & ChrB(0)

Response.BinaryWrite ChrB(40) & ChrB(0) & ChrB(0) & ChrB(0) & _
ChrB(e Mod 256) & ChrB((e \ 256) Mod 256) & ChrB((e \ 256 \ 256) Mod 256) & ChrB(e \ 256 \ 256 \ 256) & _
ChrB(f Mod 256) & ChrB((f \ 256) Mod 256) & ChrB((f \ 256 \ 256) Mod 256) & ChrB(f \ 256 \ 256 \ 256) & _
ChrB(1) & ChrB(0) & _
ChrB(24) & ChrB(0) & _
ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & _
ChrB(h Mod 256) & ChrB((h \ 256) Mod 256) & ChrB((h \ 256 \ 256) Mod 256) & ChrB(h \ 256 \ 256 \ 256) & _
ChrB(18) & ChrB(11) & ChrB(0) & ChrB(0) & _
ChrB(18) & ChrB(11) & ChrB(0) & ChrB(0) & _
ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & _
ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0)

If nColorHue = -1 Then
d = Int(Rnd * 360)
ElseIf nColorHue = -2 Then
d = 0
Else
d = nColorHue
End if
For c = 0 To nPixelHeight - 1
For b = 0 To Len(DigtalStr) * nPixelWidth - 1
If nColorHue = -2 Then
Response.BinaryWrite HSBToRGB(d, 0, 100 - Buf(nPixelHeight - 1 - c, b))
Else
Response.BinaryWrite HSBToRGB(d, Buf(nPixelHeight - 1 - c, b), 100)
End if
Next
Next
End sub
%>
