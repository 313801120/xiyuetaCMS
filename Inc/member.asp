<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%

function visitorLogin(a) 
dim b,c
c=mymd5(ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54))

if session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))="" then
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(61)&ChrW(39)& getIP() &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(28216)&ChrW(23458)&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(61)&ChrW(39)& c &ChrW(39)
rs.open b,conn,1,3

if rs.eof then
rs.addnew

rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=ChrW(65) & getrnd(4)
rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=ChrW(28216)&ChrW(23458)
rs(ChrW(112)&ChrW(105)&ChrW(99))=ChrW(47)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(47) & phpRnd(1,68) & ChrW(46)&ChrW(103)&ChrW(105)&ChrW(102)
rs(ChrW(116)&ChrW(101)&ChrW(108))=ChrW(49)&ChrW(51)&ChrW(56) & getRndTel(8)
rs(ChrW(105)&ChrW(112))=getIP()
rs(ChrW(112)&ChrW(119)&ChrW(100))=c
rs(ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121))=a
if session(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(111)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(73)&ChrW(100)) <>"" then
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=session(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(111)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(73)&ChrW(100))
end if
rs.update
end if:rs.close
rs.open b,conn,1,1
if not rs.eof then
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=rs(ChrW(105)&ChrW(100))
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))=rs(ChrW(112)&ChrW(119)&ChrW(100)) 
visitorLogin=true      
else      
call echo(ChrW(105)&ChrW(100),rs(ChrW(105)&ChrW(100)))
call echo(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100),session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)))
call echo(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114),session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)))
call echo(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115),session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)))
call eerr(ChrW(27979)&ChrW(35797),session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)))
visitorLogin=false      
end if:rs.close
end if
end function
function printNumberValue(byVal a)
printNumberValue=printNumberValue_plus(a)
end function

















Function printNumberValue_plus(byVal a)

If IsNull(a) Or a = "" Then
printNumberValue_plus = ChrW(48)
Exit function
End if

Dim b
b = False
If Left(CStr(a), 1) = ChrW(45) Then
b = True
a = Mid(CStr(a), 2)
End if

Dim c
c = CStr(a)
If InStr(c, ChrW(46)) > 0 Then
c = Left(c, InStr(c, ChrW(46)) - 1)
if c="" then c=ChrW(48)
End if

If Len(c) <= 4 Then
If b Then
printNumberValue_plus = ChrW(45) & c
Else
printNumberValue_plus = c 
End if
Exit function
End if
Dim d
If Len(c) > 8 Then

Dim e, f, g
e = Left(c, Len(c) - 8)
g = Right(c, 8)

f = CDbl(Left(g, 4) & ChrW(46) & Mid(g, 5, 2))
d = e & ChrW(20159)
If CDbl(g) > 0 Then
If f < 1000 Then
d = d & FormatNumber(f, 2)
Else
d = d & f
End if
d = d & ChrW(19975)
End if
Else
Dim h
h = CDbl(Left(c, Len(c) - 4) & ChrW(46) & Mid(c, Len(c) - 3, 2))
d = FormatNumber(h, 2) & ChrW(19975)
End if

d = Replace(d, ChrW(44), "")
If InStr(d, ChrW(46)&ChrW(48)&ChrW(48)) > 0 Then
d = Replace(d, ChrW(46)&ChrW(48)&ChrW(48), "")
End if
If b Then
d = ChrW(45) & d
End if
printNumberValue_plus = d
End function
%>