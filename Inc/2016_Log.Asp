<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


Function errorLog(a)
If openErrorLog = True Then
Call rw(a) 
End if 
End function 

Function writeSystemLog(a, b)
dim c
c=ChrW(124)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(124)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(124)
Dim d, e, f, g, h,i
i= adminDir & ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(47) 
call createDirFolder(i)
d =i & ChrW(47) & format_Time(Now(), 2) & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116) 
f = ADSql(getThisUrlFileParam())
h = format_Time(Now(), 1) 
g = getIP() 
If InStr(c, ChrW(124)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(124)) > 0 Then
e = e & ChrW(22995)&ChrW(21517)&ChrW(65306) & getSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & vbCrLf 
e = e & ChrW(34920)&ChrW(65306) & a & vbCrLf 
e = e & ChrW(20449)&ChrW(24687)&ChrW(65306) & b & vbCrLf 
e = e & ChrW(32593)&ChrW(22336)&ChrW(65306) & f & vbCrLf 
e = e & ChrW(26102)&ChrW(38388)&ChrW(65306) & h & vbCrLf 
e = e & ChrW(73)&ChrW(80)&ChrW(65306) & g & vbCrLf 
e = e & ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45) & vbCrLf 
Call createAddFile(d, e) 

End if 
If InStr(c, ChrW(124)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(124)) > 0 Then
Call OpenConn()

conn.Execute(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & db_PREFIX & ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(32)&ChrW(40)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(44)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(105)&ChrW(112)&ChrW(44)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39) & a & ChrW(39)&ChrW(44)&ChrW(39) & b & ChrW(39)&ChrW(44)&ChrW(39) & f & ChrW(39)&ChrW(44)&ChrW(39) & getSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(39)&ChrW(44)&ChrW(39) & g & ChrW(39)&ChrW(44)&ChrW(39) & h & ChrW(39)&ChrW(41)) 
End if 
End function 

Function jsWebStat()
Dim a
a = ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(100)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(119)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(110)&ChrW(40)&ChrW(34)&ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(92)&ChrW(39)&ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(38)&ChrW(116)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(34) 
a = a & ChrW(43)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(101)&ChrW(40)&ChrW(100)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(101)&ChrW(114)&ChrW(114)&ChrW(101)&ChrW(114)&ChrW(41)&ChrW(43)&ChrW(34)&ChrW(38)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(34)&ChrW(43)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(101)&ChrW(40)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(46)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(41)&ChrW(43)&ChrW(34)&ChrW(38)&ChrW(119)&ChrW(61)&ChrW(34)&ChrW(43)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(101)&ChrW(40)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(46)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(41)&ChrW(43)&ChrW(34)&ChrW(38)&ChrW(104)&ChrW(61)&ChrW(34)&ChrW(43)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(101)&ChrW(40)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(46)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(41) 
a = a & ChrW(43)&ChrW(34)&ChrW(38)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(43)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(101)&ChrW(40)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(105)&ChrW(103)&ChrW(97)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(46)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(65)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(41)
a = a & ChrW(43)&ChrW(34)&ChrW(32)&ChrW(92)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(92)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(34)&ChrW(41)&ChrW(59)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62) 
jsWebStat = a 
End function 
%>