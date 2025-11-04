<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%








Function GetUserDeviceInfo(a)

Dim b, c, d, e, f






If InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)) > 0 Or InStr(a,ChrW(88)&ChrW(49)&ChrW(49)&ChrW(59)&ChrW(32)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)) > 0 Then
b = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(80)&ChrW(67)

Select case True
Case InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(46)&ChrW(48)) > 0
c = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(49)&ChrW(48)
Case InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(54)&ChrW(46)&ChrW(51)) > 0
c = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(56)&ChrW(46)&ChrW(49)
Case InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(54)&ChrW(46)&ChrW(50)) > 0
c = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(56)
Case InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(54)&ChrW(46)&ChrW(49)) > 0
c = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(55)
Case InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(54)&ChrW(46)&ChrW(48)) > 0
c = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(86)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(97)
Case InStr(a,ChrW(88)&ChrW(49)&ChrW(49)&ChrW(59)&ChrW(32)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)) > 0
c = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(40)&ChrW(88)&ChrW(49)&ChrW(49)&ChrW(41)
Case else
c = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)
End select

ElseIf InStr(a,ChrW(67)&ChrW(72)&ChrW(65)&ChrW(45)) > 0 Then
b = ChrW(21326)&ChrW(20026)
g = InStr(a,ChrW(67)&ChrW(72)&ChrW(65)&ChrW(45))
c = Mid(a, g, 8)
c = Trim(c)
ElseIf InStr(a,ChrW(72)&ChrW(79)&ChrW(78)&ChrW(79)&ChrW(82)) > 0 Then
b = ChrW(21326)&ChrW(20026)

If InStr(a,ChrW(72)&ChrW(79)&ChrW(78)&ChrW(79)&ChrW(82)) > 0 Then
Dim g, h
g = InStr(a,ChrW(72)&ChrW(79)&ChrW(78)&ChrW(79)&ChrW(82))
c = Mid(a, g, 20)

c = Replace(c, ChrW(66)&ChrW(117)&ChrW(105)&ChrW(108)&ChrW(100), "")
c = Replace(c, ChrW(41), "")
c = Trim(c)
End if
ElseIf InStr(a,ChrW(72)&ChrW(117)&ChrW(97)&ChrW(119)&ChrW(101)&ChrW(105)) > 0 Then
b = ChrW(21326)&ChrW(20026)

If InStr(a,ChrW(72)&ChrW(85)&ChrW(65)) > 0 Then
g = InStr(a,ChrW(72)&ChrW(85)&ChrW(65))
c = Mid(a, g, 20)
c = Replace(c, ChrW(66)&ChrW(117)&ChrW(105)&ChrW(108)&ChrW(100), "")
c = Replace(c, ChrW(41), "")
c = Trim(c)
End if
ElseIf InStr(a,ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)) > 0 Then
b = ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)

If InStr(a,ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)) > 0 Then
g = InStr(a,ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101))
c = Mid(a, g, 8)
c = Replace(c, ChrW(59), "")
c = Trim(c)
End if
ElseIf InStr(a,ChrW(80)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(108)) > 0 Then
b = ChrW(71)&ChrW(111)&ChrW(111)&ChrW(103)&ChrW(108)&ChrW(101)

If InStr(a,ChrW(80)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(108)) > 0 Then
g = InStr(a,ChrW(80)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(108))
c = Mid(a, g, 10)
c = Replace(c, ChrW(59), "")
c = Replace(c, ChrW(41), "")
c = Trim(c)
End if
ElseIf InStr(a,ChrW(77)&ChrW(73)) > 0 Or InStr(a,ChrW(77)&ChrW(105)&ChrW(32)&ChrW(49)&ChrW(48)) > 0 Then
b = ChrW(23567)&ChrW(31859)

If InStr(a,ChrW(77)&ChrW(105)&ChrW(32)&ChrW(49)&ChrW(48)) > 0 Then
c = ChrW(77)&ChrW(105)&ChrW(32)&ChrW(49)&ChrW(48)
ElseIf InStr(a,ChrW(77)&ChrW(73)) > 0 Then
g = InStr(a,ChrW(77)&ChrW(73))
c = Mid(a, g, 15)
c = Replace(c, ChrW(66)&ChrW(117)&ChrW(105)&ChrW(108)&ChrW(100), "")
c = Replace(c, ChrW(41), "")
c = Trim(c)
End if
ElseIf InStr(a,ChrW(77)&ChrW(50)&ChrW(48)&ChrW(49)&ChrW(50)&ChrW(75)&ChrW(49)&ChrW(49)&ChrW(65)&ChrW(67)) > 0 Then
b = ChrW(23567)&ChrW(31859)
c = ChrW(23567)&ChrW(31859)&ChrW(49)&ChrW(49)
ElseIf InStr(a,ChrW(77)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(54)&ChrW(67)&ChrW(51)&ChrW(76)&ChrW(67)) > 0 Then
b = ChrW(23567)&ChrW(31859)
c = ChrW(82)&ChrW(101)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(32)&ChrW(57)&ChrW(65)
ElseIf InStr(a,ChrW(50)&ChrW(52)&ChrW(49)&ChrW(49)&ChrW(53)&ChrW(82)&ChrW(65)&ChrW(56)&ChrW(69)&ChrW(67)) > 0 Then
b = ChrW(23567)&ChrW(31859)
c = ChrW(23567)&ChrW(31859)&ChrW(49)&ChrW(53)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
ElseIf InStr(a,ChrW(50)&ChrW(51)&ChrW(48)&ChrW(57)&ChrW(48)&ChrW(82)&ChrW(65)&ChrW(57)&ChrW(56)&ChrW(67)) > 0 Then
b = ChrW(23567)&ChrW(31859)
c = ChrW(82)&ChrW(101)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(49)&ChrW(51)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(43)
ElseIf InStr(a,ChrW(77)&ChrW(50)&ChrW(49)&ChrW(48)&ChrW(50)&ChrW(74)&ChrW(50)&ChrW(83)&ChrW(67)) > 0 Then
b = ChrW(23567)&ChrW(31859)
c = ChrW(23567)&ChrW(31859)&ChrW(49)&ChrW(48)&ChrW(83)
ElseIf InStr(a,ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)&ChrW(67)&ChrW(82)&ChrW(65)&ChrW(68)&ChrW(51)&ChrW(67)) > 0 Then
b = ChrW(23567)&ChrW(31859)
c = ChrW(82)&ChrW(101)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(49)&ChrW(51)&ChrW(82)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
ElseIf InStr(a,ChrW(50)&ChrW(52)&ChrW(49)&ChrW(50)&ChrW(57)&ChrW(80)&ChrW(78)&ChrW(55)&ChrW(52)&ChrW(67)) > 0 Then
b = ChrW(23567)&ChrW(31859)
c = ChrW(50)&ChrW(52)&ChrW(49)&ChrW(50)&ChrW(57)&ChrW(80)&ChrW(78)&ChrW(55)&ChrW(52)&ChrW(67)
ElseIf InStr(a,ChrW(50)&ChrW(51)&ChrW(49)&ChrW(49)&ChrW(51)&ChrW(82)&ChrW(75)&ChrW(67)&ChrW(54)&ChrW(67)) > 0 Then
b = ChrW(23567)&ChrW(31859)
c = ChrW(50)&ChrW(51)&ChrW(49)&ChrW(49)&ChrW(51)&ChrW(82)&ChrW(75)&ChrW(67)&ChrW(54)&ChrW(67)
ElseIf InStr(a,ChrW(82)&ChrW(101)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(56)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)) > 0 Then
b = ChrW(23567)&ChrW(31859)
c = ChrW(82)&ChrW(101)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(56)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
ElseIf InStr(a,ChrW(72)&ChrW(85)&ChrW(65)&ChrW(87)&ChrW(69)&ChrW(73)) > 0 Or InStr(a,ChrW(72)&ChrW(87)&ChrW(73)&ChrW(45)&ChrW(65)&ChrW(76)&ChrW(48)&ChrW(48)) > 0 Or InStr(a,ChrW(66)&ChrW(65)&ChrW(76)&ChrW(45)&ChrW(65)&ChrW(78)&ChrW(50)&ChrW(48)) > 0 Or InStr(a,ChrW(71)&ChrW(65)&ChrW(82)&ChrW(45)&ChrW(65)&ChrW(78)&ChrW(54)&ChrW(48)) > 0 Then
b = ChrW(21326)&ChrW(20026)

If InStr(a,ChrW(66)&ChrW(65)&ChrW(76)&ChrW(45)&ChrW(65)&ChrW(78)&ChrW(50)&ChrW(48)) > 0 Then
c = ChrW(66)&ChrW(65)&ChrW(76)&ChrW(45)&ChrW(65)&ChrW(78)&ChrW(50)&ChrW(48)
ElseIf InStr(a,ChrW(72)&ChrW(87)&ChrW(73)&ChrW(45)&ChrW(65)&ChrW(76)&ChrW(48)&ChrW(48)) > 0 Then
c = ChrW(72)&ChrW(87)&ChrW(73)&ChrW(45)&ChrW(65)&ChrW(76)&ChrW(48)&ChrW(48)
ElseIf InStr(a,ChrW(71)&ChrW(65)&ChrW(82)&ChrW(45)&ChrW(65)&ChrW(78)&ChrW(54)&ChrW(48)) > 0 Then
c = ChrW(87)&ChrW(73)&ChrW(75)&ChrW(79)&ChrW(32)&ChrW(72)&ChrW(105)&ChrW(30021)&ChrW(20139)&ChrW(54)&ChrW(48)&ChrW(115)&ChrW(32)&ChrW(53)&ChrW(71)
ElseIf InStr(a,ChrW(72)&ChrW(85)&ChrW(65)&ChrW(87)&ChrW(69)&ChrW(73)) > 0 Then
g = InStr(a,ChrW(72)&ChrW(85)&ChrW(65)&ChrW(87)&ChrW(69)&ChrW(73))
c = Mid(a, g, 15)
c = Replace(c, ChrW(66)&ChrW(117)&ChrW(105)&ChrW(108)&ChrW(100), "")
c = Replace(c, ChrW(41), "")
c = Trim(c)
End if
ElseIf InStr(a,ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)) > 0 Or InStr(a,ChrW(80)&ChrW(67)&ChrW(72)) > 0 Or InStr(a,ChrW(80)&ChrW(71)&ChrW(71)) > 0 Or InStr(a,ChrW(80)&ChrW(66)&ChrW(66)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(74)&ChrW(82)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Or InStr(a,ChrW(75)&ChrW(66)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(66)&ChrW(68)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(69)&ChrW(69)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(70)&ChrW(74)&ChrW(77)&ChrW(49)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(72)&ChrW(74)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(69)&ChrW(77)&ChrW(77)&ChrW(50)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(75)&ChrW(83)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(69)&ChrW(71)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(69)&ChrW(70)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(72)&ChrW(77)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(69)&ChrW(76)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(74)&ChrW(85)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(67)&ChrW(75)&ChrW(77)&ChrW(56)&ChrW(48)) > 0 Or InStr(a,ChrW(80)&ChrW(66)&ChrW(69)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Then
b = ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)

If InStr(a,ChrW(80)&ChrW(67)&ChrW(72)&ChrW(77)&ChrW(51)&ChrW(48)) > 0 Then
c = ChrW(80)&ChrW(67)&ChrW(72)&ChrW(77)&ChrW(51)&ChrW(48)
ElseIf InStr(a,ChrW(80)&ChrW(71)&ChrW(71)&ChrW(77)&ChrW(49)&ChrW(48)) > 0 Then
c = ChrW(80)&ChrW(71)&ChrW(71)&ChrW(77)&ChrW(49)&ChrW(48)
ElseIf InStr(a,ChrW(80)&ChrW(66)&ChrW(66)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Then
c = ChrW(80)&ChrW(66)&ChrW(66)&ChrW(77)&ChrW(48)&ChrW(48)
ElseIf InStr(a,ChrW(80)&ChrW(74)&ChrW(82)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Then
c = ChrW(80)&ChrW(74)&ChrW(82)&ChrW(49)&ChrW(49)&ChrW(48)
ElseIf InStr(a,ChrW(75)&ChrW(66)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(48)) > 0 Then
c = ChrW(75)&ChrW(66)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(48)
ElseIf InStr(a,ChrW(80)&ChrW(66)&ChrW(68)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Then
c = ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(82)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(51)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
ElseIf InStr(a,ChrW(80)&ChrW(69)&ChrW(69)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Then
c = ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(70)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(88)&ChrW(51)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
ElseIf InStr(a,ChrW(80)&ChrW(70)&ChrW(74)&ChrW(77)&ChrW(49)&ChrW(48)) > 0 Then
c = ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(82)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(55)
ElseIf InStr(a,ChrW(80)&ChrW(72)&ChrW(74)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Then
c = ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(65)&ChrW(49)&ChrW(120)
ElseIf InStr(a,ChrW(80)&ChrW(69)&ChrW(77)&ChrW(77)&ChrW(50)&ChrW(48)) > 0 Then
c = ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(65)&ChrW(53)&ChrW(53)
ElseIf InStr(a,ChrW(80)&ChrW(75)&ChrW(83)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Then
c = ChrW(80)&ChrW(75)&ChrW(83)&ChrW(49)&ChrW(49)&ChrW(48)
ElseIf InStr(a,ChrW(80)&ChrW(69)&ChrW(71)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Then
c = ChrW(80)&ChrW(69)&ChrW(71)&ChrW(77)&ChrW(48)&ChrW(48)
ElseIf InStr(a,ChrW(80)&ChrW(69)&ChrW(70)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Then
c = ChrW(80)&ChrW(69)&ChrW(70)&ChrW(77)&ChrW(48)&ChrW(48)
ElseIf InStr(a,ChrW(80)&ChrW(72)&ChrW(77)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Then
c = ChrW(80)&ChrW(72)&ChrW(77)&ChrW(49)&ChrW(49)&ChrW(48)
ElseIf InStr(a,ChrW(80)&ChrW(69)&ChrW(76)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Then
c = ChrW(80)&ChrW(69)&ChrW(76)&ChrW(77)&ChrW(48)&ChrW(48)
ElseIf InStr(a,ChrW(80)&ChrW(74)&ChrW(85)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Then
c = ChrW(80)&ChrW(74)&ChrW(85)&ChrW(49)&ChrW(49)&ChrW(48)
ElseIf InStr(a,ChrW(80)&ChrW(67)&ChrW(75)&ChrW(77)&ChrW(56)&ChrW(48)) > 0 Then
c = ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(82)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(32)&ChrW(90)
ElseIf InStr(a,ChrW(80)&ChrW(66)&ChrW(69)&ChrW(77)&ChrW(48)&ChrW(48)) > 0 Then
c = ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(82)&ChrW(49)&ChrW(55)
ElseIf InStr(a,ChrW(80)&ChrW(67)&ChrW(72)) > 0 Then
g = InStr(a,ChrW(80)&ChrW(67)&ChrW(72))
c = Mid(a, g, 8)
c = Replace(c, ChrW(66)&ChrW(117)&ChrW(105)&ChrW(108)&ChrW(100), "")
c = Replace(c, ChrW(41), "")
c = Trim(c)
ElseIf InStr(a,ChrW(80)&ChrW(71)&ChrW(71)) > 0 Then
g = InStr(a,ChrW(80)&ChrW(71)&ChrW(71))
c = Mid(a, g, 8)
c = Replace(c, ChrW(66)&ChrW(117)&ChrW(105)&ChrW(108)&ChrW(100), "")
c = Replace(c, ChrW(41), "")
c = Trim(c)
Else
g = InStr(a,ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79))
c = Mid(a, g, 15)
c = Replace(c, ChrW(66)&ChrW(117)&ChrW(105)&ChrW(108)&ChrW(100), "")
c = Replace(c, ChrW(41), "")
c = Trim(c)
End if
ElseIf InStr(a,ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(50)&ChrW(48)&ChrW(55)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(49)&ChrW(54)&ChrW(54)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(51)&ChrW(50)&ChrW(51)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(49)&ChrW(57)&ChrW(48)&ChrW(49)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(48)&ChrW(53)&ChrW(55)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(51)&ChrW(53)&ChrW(50)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(50)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(52)&ChrW(48)&ChrW(53)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(50)&ChrW(56)&ChrW(52)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(49)&ChrW(57)&ChrW(51)&ChrW(56)&ChrW(67)&ChrW(84)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(51)&ChrW(48)&ChrW(55)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(48)&ChrW(52)&ChrW(55)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(49)&ChrW(57)&ChrW(48)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(52)&ChrW(50)&ChrW(53)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(48)&ChrW(53)&ChrW(53)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(49)&ChrW(54)&ChrW(52)&ChrW(75)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(49)&ChrW(56)&ChrW(48)&ChrW(57)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(48)&ChrW(55)&ChrW(50)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(50)&ChrW(56)&ChrW(50)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(49)&ChrW(51)&ChrW(51)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(51)&ChrW(51)&ChrW(56)&ChrW(65)) > 0 Or InStr(a,ChrW(86)&ChrW(50)&ChrW(50)&ChrW(52)&ChrW(52)&ChrW(65)) > 0 Then
b = ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)

If InStr(a,ChrW(86)&ChrW(50)&ChrW(50)&ChrW(48)&ChrW(55)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(50)&ChrW(48)&ChrW(55)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(49)&ChrW(54)&ChrW(54)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(49)&ChrW(54)&ChrW(54)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(51)&ChrW(50)&ChrW(51)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(51)&ChrW(50)&ChrW(51)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(49)&ChrW(57)&ChrW(48)&ChrW(49)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(49)&ChrW(57)&ChrW(48)&ChrW(49)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(48)&ChrW(53)&ChrW(55)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(48)&ChrW(53)&ChrW(55)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(51)&ChrW(53)&ChrW(50)&ChrW(65)) > 0 Then
c = ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(88)&ChrW(49)&ChrW(48)&ChrW(48)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(50)&ChrW(65)) > 0 Then
c = ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(83)&ChrW(55)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(52)&ChrW(48)&ChrW(53)&ChrW(65)) > 0 Then
c = ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(89)&ChrW(49)&ChrW(48)&ChrW(48)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(50)&ChrW(56)&ChrW(52)&ChrW(65)) > 0 Then
c = ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(88)&ChrW(57)&ChrW(48)
ElseIf InStr(a,ChrW(86)&ChrW(49)&ChrW(57)&ChrW(51)&ChrW(56)&ChrW(67)&ChrW(84)) > 0 Then
c = ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(90)&ChrW(53)&ChrW(120)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(51)&ChrW(48)&ChrW(55)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(51)&ChrW(48)&ChrW(55)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(48)&ChrW(52)&ChrW(55)&ChrW(65)) > 0 Then
c = ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(88)&ChrW(54)&ChrW(48)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(49)&ChrW(57)&ChrW(48)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(49)&ChrW(57)&ChrW(48)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(52)&ChrW(50)&ChrW(53)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(52)&ChrW(50)&ChrW(53)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(48)&ChrW(53)&ChrW(53)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(48)&ChrW(53)&ChrW(53)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(49)&ChrW(54)&ChrW(52)&ChrW(75)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(49)&ChrW(54)&ChrW(52)&ChrW(75)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(49)&ChrW(56)&ChrW(48)&ChrW(57)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(49)&ChrW(56)&ChrW(48)&ChrW(57)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(48)&ChrW(55)&ChrW(50)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(48)&ChrW(55)&ChrW(50)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(50)&ChrW(56)&ChrW(50)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(50)&ChrW(56)&ChrW(50)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(49)&ChrW(51)&ChrW(51)&ChrW(65)) > 0 Then
c = ChrW(86)&ChrW(50)&ChrW(49)&ChrW(51)&ChrW(51)&ChrW(65)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(51)&ChrW(51)&ChrW(56)&ChrW(65)) > 0 Then
c = ChrW(105)&ChrW(81)&ChrW(79)&ChrW(79)&ChrW(32)&ChrW(78)&ChrW(101)&ChrW(111)&ChrW(57)
ElseIf InStr(a,ChrW(86)&ChrW(50)&ChrW(50)&ChrW(52)&ChrW(52)&ChrW(65)) > 0 Then
c = ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(83)&ChrW(49)&ChrW(54)
ElseIf InStr(a,ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)) > 0 Then
g = InStr(a,ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111))
c = Mid(a, g, 15)
c = Replace(c, ChrW(66)&ChrW(117)&ChrW(105)&ChrW(108)&ChrW(100), "")
c = Replace(c, ChrW(41), "")
c = Trim(c)
End if
ElseIf InStr(a,ChrW(82)&ChrW(77)&ChrW(88)&ChrW(49)&ChrW(57)&ChrW(48)&ChrW(49)) > 0 Then
b = ChrW(82)&ChrW(101)&ChrW(97)&ChrW(108)&ChrW(109)&ChrW(101)
c = ChrW(82)&ChrW(101)&ChrW(97)&ChrW(108)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(88)
ElseIf InStr(a,ChrW(50)&ChrW(48)&ChrW(50)&ChrW(49)&ChrW(65)&ChrW(50)&ChrW(57)&ChrW(57)) > 0 Then
b = ChrW(19968)&ChrW(21152)
c = ChrW(19968)&ChrW(21152)&ChrW(57)&ChrW(31995)&ChrW(21015)
ElseIf InStr(a,ChrW(80)&ChrW(76)&ChrW(65)&ChrW(49)&ChrW(49)&ChrW(48)) > 0 Then
b = ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)
c = ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(82)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(52)
ElseIf InStr(a,ChrW(83)&ChrW(77)&ChrW(45)) > 0 Then
b = ChrW(19977)&ChrW(26143)

If InStr(a,ChrW(83)&ChrW(77)&ChrW(45)&ChrW(78)&ChrW(57)&ChrW(55)&ChrW(54)&ChrW(86)) > 0 Then
c = ChrW(71)&ChrW(97)&ChrW(108)&ChrW(97)&ChrW(120)&ChrW(121)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(49)&ChrW(48)&ChrW(43)&ChrW(32)&ChrW(53)&ChrW(71)
Else
g = InStr(a,ChrW(83)&ChrW(77)&ChrW(45))
c = Mid(a, g, 10)
c = Replace(c, ChrW(66)&ChrW(117)&ChrW(105)&ChrW(108)&ChrW(100), "")
c = Replace(c, ChrW(41), "")
c = Trim(c)
End if
Else
b = ChrW(20854)&ChrW(20182)&ChrW(35774)&ChrW(22791)
c = ChrW(26410)&ChrW(30693)&ChrW(22411)&ChrW(21495)
End if

If InStr(a,ChrW(77)&ChrW(105)&ChrW(117)&ChrW(105)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)) > 0 Then
Dim i
i = Mid(a, InStr(a,ChrW(77)&ChrW(105)&ChrW(117)&ChrW(105)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(47)) + 12)
If InStr(i, ChrW(32)) > 0 Then
i = Left(i, InStr(i, ChrW(32)) - 1)
End if
d = ChrW(23567)&ChrW(31859)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(32) & i
ElseIf InStr(a,ChrW(86)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)) > 0 Then
Dim j
j = Mid(a, InStr(a,ChrW(86)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(47)) + 12)
If InStr(j, ChrW(32)) > 0 Then
j = Left(j, InStr(j, ChrW(32)) - 1)
End if
d = ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(32) & j
ElseIf InStr(a,ChrW(77)&ChrW(83)&ChrW(73)&ChrW(69)) > 0 Then
Dim k
k = Mid(a, InStr(a,ChrW(77)&ChrW(83)&ChrW(73)&ChrW(69)) + 5)
If InStr(k, ChrW(59)) > 0 Then
k = Left(k, InStr(k, ChrW(59)) - 1)
End if
d = ChrW(73)&ChrW(69)&ChrW(32) & k
ElseIf InStr(a,ChrW(84)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(47)&ChrW(55)&ChrW(46)&ChrW(48)) > 0 Then
d = ChrW(73)&ChrW(69)&ChrW(32)&ChrW(49)&ChrW(49)
ElseIf InStr(a,ChrW(77)&ChrW(81)&ChrW(81)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)) > 0 Then
Dim l
l = Mid(a, InStr(a,ChrW(77)&ChrW(81)&ChrW(81)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(47)) + 11)
If InStr(l, ChrW(32)) > 0 Then
l = Left(l, InStr(l, ChrW(32)) - 1)
End if
d = ChrW(81)&ChrW(81)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(32) & l
ElseIf InStr(a,ChrW(85)&ChrW(67)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)) > 0 Then
Dim m
m = Mid(a, InStr(a,ChrW(85)&ChrW(67)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(47)) + 10)
If InStr(m, ChrW(32)) > 0 Then
m = Left(m, InStr(m, ChrW(32)) - 1)
End if
d = ChrW(85)&ChrW(67)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(32) & m
ElseIf InStr(a,ChrW(67)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(47)) > 0 Then
Dim n
n = Mid(a, InStr(a,ChrW(67)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(47)) + 7)
If InStr(n, ChrW(32)) > 0 Then
n = Left(n, InStr(n, ChrW(32)) - 1)
End if
d = ChrW(67)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(32) & n
ElseIf InStr(a,ChrW(70)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(120)&ChrW(47)) > 0 Then
Dim o
o = Mid(a, InStr(a,ChrW(70)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(120)&ChrW(47)) + 8)
If InStr(o, ChrW(32)) > 0 Then
o = Left(o, InStr(o, ChrW(32)) - 1)
End if
d = ChrW(70)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(120)&ChrW(32) & o
ElseIf InStr(a,ChrW(81)&ChrW(117)&ChrW(97)&ChrW(114)&ChrW(107)&ChrW(47)) > 0 Then
Dim p
p = Mid(a, InStr(a,ChrW(81)&ChrW(117)&ChrW(97)&ChrW(114)&ChrW(107)&ChrW(47)) + 6)
If InStr(p, ChrW(32)) > 0 Then
p = Left(p, InStr(p, ChrW(32)) - 1)
End if
d = ChrW(22840)&ChrW(20811)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(32) & p
ElseIf InStr(a,ChrW(72)&ChrW(101)&ChrW(121)&ChrW(84)&ChrW(97)&ChrW(112)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)) > 0 Then
Dim q
q = Mid(a, InStr(a,ChrW(72)&ChrW(101)&ChrW(121)&ChrW(84)&ChrW(97)&ChrW(112)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(47)) + 14)
If InStr(q, ChrW(32)) > 0 Then
q = Left(q, InStr(q, ChrW(32)) - 1)
End if
d = ChrW(72)&ChrW(101)&ChrW(121)&ChrW(84)&ChrW(97)&ChrW(112)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(32) & q
ElseIf InStr(a,ChrW(83)&ChrW(97)&ChrW(102)&ChrW(97)&ChrW(114)&ChrW(105)) > 0 Then
d = ChrW(83)&ChrW(97)&ChrW(102)&ChrW(97)&ChrW(114)&ChrW(105)
Else
d = ChrW(20854)&ChrW(20182)&ChrW(27983)&ChrW(35272)&ChrW(22120)
End if

If InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)) > 0 Or InStr(a,ChrW(88)&ChrW(49)&ChrW(49)&ChrW(59)&ChrW(32)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)) > 0 Then
Select case True
Case InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(46)&ChrW(48)) > 0
e = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(49)&ChrW(48)
Case InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(54)&ChrW(46)&ChrW(51)) > 0
e = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(56)&ChrW(46)&ChrW(49)
Case InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(54)&ChrW(46)&ChrW(50)) > 0
e = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(56)
Case InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(54)&ChrW(46)&ChrW(49)) > 0
e = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(55)
Case InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(54)&ChrW(46)&ChrW(48)) > 0
e = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(86)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(97)
Case InStr(a,ChrW(88)&ChrW(49)&ChrW(49)&ChrW(59)&ChrW(32)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)) > 0
e = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(40)&ChrW(88)&ChrW(49)&ChrW(49)&ChrW(41)
Case else
e = ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)
End select

If InStr(a,ChrW(87)&ChrW(105)&ChrW(110)&ChrW(54)&ChrW(52)) > 0 Or InStr(a,ChrW(120)&ChrW(54)&ChrW(52)) > 0 Then
e = e & ChrW(32)&ChrW(54)&ChrW(52)&ChrW(20301)
End if
ElseIf InStr(a,ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)) > 0 Then
e = ChrW(105)&ChrW(79)&ChrW(83)
ElseIf InStr(a,ChrW(65)&ChrW(110)&ChrW(100)&ChrW(114)&ChrW(111)&ChrW(105)&ChrW(100)) > 0 Then
e = ChrW(65)&ChrW(110)&ChrW(100)&ChrW(114)&ChrW(111)&ChrW(105)&ChrW(100)
Dim r
If InStr(a, ChrW(65)&ChrW(110)&ChrW(100)&ChrW(114)&ChrW(111)&ChrW(105)&ChrW(100)&ChrW(32)) > 0 Then
r = Mid(a, InStr(a, ChrW(65)&ChrW(110)&ChrW(100)&ChrW(114)&ChrW(111)&ChrW(105)&ChrW(100)&ChrW(32)) + 8)
If InStr(r, ChrW(59)) > 0 Then
r = Left(r, InStr(r, ChrW(59)) - 1)
End if
e = e & ChrW(32) & r
End if
Else
e = ChrW(20854)&ChrW(20182)&ChrW(31995)&ChrW(32479)
End if


Dim s,t
s = GetDevicePrice(c, b)
If s <> ChrW(26410)&ChrW(30693) And b <> ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(80)&ChrW(67) And b <> ChrW(20854)&ChrW(20182)&ChrW(35774)&ChrW(22791) Then
t=ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(62)&ChrW(21442)&ChrW(32771)&ChrW(20215)&ChrW(26684)&ChrW(65306)&ChrW(60)&ChrW(98)&ChrW(62) & s & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(20803)&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)
f = ChrW(35774)&ChrW(22791)&ChrW(65306) & b & ChrW(65292)&ChrW(22411)&ChrW(21495)&ChrW(65306) & c & ChrW(65292)&t&ChrW(65292)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(65306) & d & ChrW(65292)&ChrW(31995)&ChrW(32479)&ChrW(65306) & e
Else
f = ChrW(35774)&ChrW(22791)&ChrW(65306) & b & ChrW(65292)&ChrW(22411)&ChrW(21495)&ChrW(65306) & c & ChrW(65292)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(65306) & d & ChrW(65292)&ChrW(31995)&ChrW(32479)&ChrW(65306) & e
End if
GetUserDeviceInfo = f
End function

Function GetDevicePrice(a, b)
Dim c

Select case a

Case ChrW(77)&ChrW(105)&ChrW(32)&ChrW(49)&ChrW(48)
c = ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(54)&ChrW(57)&ChrW(57)
Case ChrW(23567)&ChrW(31859)&ChrW(49)&ChrW(49)
c = ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(53)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(23567)&ChrW(31859)&ChrW(49)&ChrW(53)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
c = ChrW(53)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(54)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(82)&ChrW(101)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(49)&ChrW(51)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(43)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(82)&ChrW(101)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(32)&ChrW(57)&ChrW(65)
c = ChrW(53)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(55)&ChrW(57)&ChrW(57)
Case ChrW(23567)&ChrW(31859)&ChrW(49)&ChrW(48)&ChrW(83)
c = ChrW(50)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(82)&ChrW(101)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(49)&ChrW(51)&ChrW(82)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
c = ChrW(49)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(50)&ChrW(52)&ChrW(49)&ChrW(50)&ChrW(57)&ChrW(80)&ChrW(78)&ChrW(55)&ChrW(52)&ChrW(67)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(50)&ChrW(51)&ChrW(49)&ChrW(49)&ChrW(51)&ChrW(82)&ChrW(75)&ChrW(67)&ChrW(54)&ChrW(67)
c = ChrW(49)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(49)&ChrW(57)&ChrW(57)
Case ChrW(82)&ChrW(101)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(56)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
c = ChrW(49)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(49)&ChrW(53)&ChrW(57)&ChrW(57)

Case ChrW(72)&ChrW(87)&ChrW(73)&ChrW(45)&ChrW(65)&ChrW(76)&ChrW(48)&ChrW(48)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(51)&ChrW(57)&ChrW(57)
Case ChrW(67)&ChrW(72)&ChrW(65)&ChrW(45)&ChrW(65)&ChrW(76)&ChrW(56)&ChrW(48)
c = ChrW(50)&ChrW(54)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(72)&ChrW(79)&ChrW(78)&ChrW(79)&ChrW(82)&ChrW(69)&ChrW(76)&ChrW(73)&ChrW(45)&ChrW(65)&ChrW(78)&ChrW(48)&ChrW(48)
c = ChrW(50)&ChrW(56)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(72)&ChrW(79)&ChrW(78)&ChrW(79)&ChrW(82)&ChrW(75)&ChrW(75)&ChrW(71)&ChrW(45)&ChrW(65)&ChrW(78)&ChrW(55)&ChrW(48)
c = ChrW(50)&ChrW(49)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(54)&ChrW(57)&ChrW(57)
Case ChrW(72)&ChrW(79)&ChrW(78)&ChrW(79)&ChrW(82)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(66)&ChrW(65)&ChrW(76)&ChrW(45)&ChrW(65)&ChrW(78)&ChrW(50)&ChrW(48)
c = ChrW(50)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(55)&ChrW(57)&ChrW(57)
Case ChrW(87)&ChrW(73)&ChrW(75)&ChrW(79)&ChrW(32)&ChrW(72)&ChrW(105)&ChrW(30021)&ChrW(20139)&ChrW(54)&ChrW(48)&ChrW(115)&ChrW(32)&ChrW(53)&ChrW(71)
c = ChrW(49)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(49)&ChrW(54)&ChrW(57)&ChrW(57)

Case ChrW(80)&ChrW(66)&ChrW(66)&ChrW(77)&ChrW(48)&ChrW(48)
c = ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(82)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(51)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
c = ChrW(51)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(67)&ChrW(72)&ChrW(77)&ChrW(51)&ChrW(48)
c = ChrW(49)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(49)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(71)&ChrW(71)&ChrW(77)&ChrW(49)&ChrW(48)
c = ChrW(50)&ChrW(49)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(53)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(74)&ChrW(82)&ChrW(49)&ChrW(49)&ChrW(48)
c = ChrW(50)&ChrW(51)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(56)&ChrW(57)&ChrW(57)
Case ChrW(75)&ChrW(66)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(48)
c = ChrW(50)&ChrW(54)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(67)&ChrW(72)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(71)&ChrW(71)
c = ChrW(50)&ChrW(49)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(56)&ChrW(57)&ChrW(57)

Case ChrW(86)&ChrW(50)&ChrW(50)&ChrW(48)&ChrW(55)&ChrW(65)
c = ChrW(50)&ChrW(54)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(50)&ChrW(49)&ChrW(54)&ChrW(54)&ChrW(65)
c = ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(50)&ChrW(51)&ChrW(50)&ChrW(51)&ChrW(65)
c = ChrW(50)&ChrW(53)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(48)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(49)&ChrW(57)&ChrW(48)&ChrW(49)&ChrW(65)
c = ChrW(49)&ChrW(56)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(50)&ChrW(48)&ChrW(53)&ChrW(55)&ChrW(65)
c = ChrW(50)&ChrW(48)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(53)&ChrW(57)&ChrW(57)
Case ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(88)&ChrW(49)&ChrW(48)&ChrW(48)
c = ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(53)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(88)&ChrW(57)&ChrW(48)
c = ChrW(51)&ChrW(54)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(83)&ChrW(55)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(56)&ChrW(45)&ChrW(50)&ChrW(55)&ChrW(57)&ChrW(56)
Case ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(89)&ChrW(49)&ChrW(48)&ChrW(48)
c = ChrW(49)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(49)&ChrW(57)&ChrW(57)
Case ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(90)&ChrW(53)&ChrW(120)
c = ChrW(49)&ChrW(51)&ChrW(57)&ChrW(56)&ChrW(45)&ChrW(49)&ChrW(57)&ChrW(57)&ChrW(56)
Case ChrW(86)&ChrW(50)&ChrW(51)&ChrW(48)&ChrW(55)&ChrW(65)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(88)&ChrW(54)&ChrW(48)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
c = ChrW(51)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(50)&ChrW(49)&ChrW(57)&ChrW(48)&ChrW(65)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(50)&ChrW(52)&ChrW(50)&ChrW(53)&ChrW(65)
c = ChrW(50)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(55)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(50)&ChrW(48)&ChrW(53)&ChrW(53)&ChrW(65)
c = ChrW(49)&ChrW(56)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(50)&ChrW(49)&ChrW(54)&ChrW(52)&ChrW(75)&ChrW(65)
c = ChrW(49)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(49)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(49)&ChrW(56)&ChrW(48)&ChrW(57)&ChrW(65)
c = ChrW(49)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(49)&ChrW(54)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(50)&ChrW(48)&ChrW(55)&ChrW(50)&ChrW(65)
c = ChrW(49)&ChrW(56)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(50)&ChrW(50)&ChrW(56)&ChrW(50)&ChrW(65)
c = ChrW(50)&ChrW(48)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(86)&ChrW(50)&ChrW(49)&ChrW(51)&ChrW(51)&ChrW(65)
c = ChrW(49)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(49)&ChrW(57)&ChrW(57)
Case ChrW(105)&ChrW(81)&ChrW(79)&ChrW(79)&ChrW(32)&ChrW(78)&ChrW(101)&ChrW(111)&ChrW(57)
c = ChrW(50)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(55)&ChrW(57)&ChrW(57)
Case ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)&ChrW(32)&ChrW(83)&ChrW(49)&ChrW(54)
c = ChrW(50)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(55)&ChrW(57)&ChrW(57)

Case ChrW(82)&ChrW(101)&ChrW(97)&ChrW(108)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(88)
c = ChrW(49)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)

Case ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)
c = ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(49)&ChrW(53)
c = ChrW(53)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(49)&ChrW(52)
c = ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(54)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(49)&ChrW(51)
c = ChrW(52)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(54)&ChrW(55)&ChrW(57)&ChrW(57)
Case ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(49)&ChrW(50)
c = ChrW(52)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(54)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(49)&ChrW(49)
c = ChrW(51)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(53)&ChrW(50)&ChrW(57)&ChrW(57)

Case ChrW(80)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(108)&ChrW(32)&ChrW(55)
c = ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(108)&ChrW(32)&ChrW(54)
c = ChrW(51)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(108)&ChrW(32)&ChrW(53)
c = ChrW(50)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(108)
c = ChrW(50)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)

Case ChrW(50)&ChrW(48)&ChrW(50)&ChrW(49)&ChrW(65)&ChrW(50)&ChrW(57)&ChrW(57)
c = ChrW(49)&ChrW(56)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(51)&ChrW(57)&ChrW(57)
Case ChrW(19968)&ChrW(21152)&ChrW(57)&ChrW(31995)&ChrW(21015)
c = ChrW(51)&ChrW(54)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(82)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(52)
c = ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(71)&ChrW(97)&ChrW(108)&ChrW(97)&ChrW(120)&ChrW(121)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(49)&ChrW(48)&ChrW(43)&ChrW(32)&ChrW(53)&ChrW(71)
c = ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(70)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(88)&ChrW(51)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)
c = ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(82)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(55)
c = ChrW(50)&ChrW(49)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(55)&ChrW(57)&ChrW(57)
Case ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(65)&ChrW(49)&ChrW(120)
c = ChrW(49)&ChrW(51)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(49)&ChrW(55)&ChrW(57)&ChrW(57)
Case ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(65)&ChrW(53)&ChrW(53)
c = ChrW(49)&ChrW(49)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(49)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(75)&ChrW(83)&ChrW(49)&ChrW(49)&ChrW(48)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(69)&ChrW(71)&ChrW(77)&ChrW(48)&ChrW(48)
c = ChrW(49)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(50)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(69)&ChrW(70)&ChrW(77)&ChrW(48)&ChrW(48)
c = ChrW(49)&ChrW(53)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(72)&ChrW(77)&ChrW(49)&ChrW(49)&ChrW(48)
c = ChrW(50)&ChrW(49)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(54)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(69)&ChrW(76)&ChrW(77)&ChrW(48)&ChrW(48)
c = ChrW(49)&ChrW(54)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(48)&ChrW(57)&ChrW(57)
Case ChrW(80)&ChrW(74)&ChrW(85)&ChrW(49)&ChrW(49)&ChrW(48)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(82)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(32)&ChrW(90)
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)
Case ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)&ChrW(32)&ChrW(82)&ChrW(49)&ChrW(55)
c = ChrW(49)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(49)&ChrW(55)&ChrW(57)&ChrW(57)

Case else

If InStr(a, ChrW(72)&ChrW(79)&ChrW(78)&ChrW(79)&ChrW(82)) > 0 Then
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)
ElseIf InStr(a, ChrW(77)&ChrW(73)) > 0 Or InStr(a, ChrW(82)&ChrW(101)&ChrW(100)&ChrW(109)&ChrW(105)) > 0 Then
c = ChrW(49)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)
ElseIf InStr(a, ChrW(72)&ChrW(85)&ChrW(65)&ChrW(87)&ChrW(69)&ChrW(73)) > 0 Or InStr(a, ChrW(72)&ChrW(85)&ChrW(65)) > 0 Then
c = ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)
ElseIf InStr(a, ChrW(79)&ChrW(80)&ChrW(80)&ChrW(79)) > 0 Or InStr(a, ChrW(80)&ChrW(67)&ChrW(72)) > 0 Or InStr(a, ChrW(80)&ChrW(71)&ChrW(71)) > 0 Then
c = ChrW(49)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(57)&ChrW(57)&ChrW(57)
ElseIf InStr(a, ChrW(118)&ChrW(105)&ChrW(118)&ChrW(111)) > 0 Or InStr(a, ChrW(86)) > 0 Then
c = ChrW(49)&ChrW(56)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(53)&ChrW(57)&ChrW(57)
ElseIf InStr(a, ChrW(105)&ChrW(80)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)) > 0 Then
c = ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(57)
ElseIf InStr(a, ChrW(80)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(108)) > 0 Then
c = ChrW(50)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)
ElseIf InStr(a, ChrW(82)&ChrW(101)&ChrW(97)&ChrW(108)&ChrW(109)&ChrW(101)) > 0 Then
c = ChrW(49)&ChrW(50)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)
ElseIf InStr(a, ChrW(19968)&ChrW(21152)) > 0 Then
c = ChrW(50)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(53)&ChrW(57)&ChrW(57)&ChrW(57)
ElseIf a = "" Or a = ChrW(26410)&ChrW(30693)&ChrW(22411)&ChrW(21495) Or InStr(a, ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)) > 0 Then
c = ChrW(26410)&ChrW(30693)
ElseIf InStr(a, ChrW(67)&ChrW(72)&ChrW(65)&ChrW(45)) > 0 Then
c = ChrW(50)&ChrW(54)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(51)&ChrW(50)&ChrW(57)&ChrW(57)
Else
c = ChrW(49)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)
End if
End select

If b = ChrW(21326)&ChrW(20026) And (a = "" Or a = ChrW(26410)&ChrW(30693)&ChrW(22411)&ChrW(21495)) Then
c = ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(45)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(57)
End if
GetDevicePrice = c
End function
%>