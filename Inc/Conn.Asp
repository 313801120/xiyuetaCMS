<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 
Public MDBPath, accessPass

function checkSqlServer(byval a)
dim b
checkSqlServer=true
on error resume next
Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))  
b.open a 
if err <>0 then
checkSqlServer=false
end if
end function

Sub openConn()  
Set conn = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
call selectOpenConn(conn)
end sub

Sub selectOpenConn(a)
call handle_selectOpenConn(a,databaseType,sqlServerHostIP,sqlServerDatabaseName,sqlServerUsername,sqlServerPassword,MDBPath,accessPass)
end sub

sub oepnSqlServerConn(a,b,c,d,e)
call handle_selectOpenConn(a,ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114),b,c,d,e,"","")
end sub

sub oepnMysqlConn(a,b,c,d,e)
call handle_selectOpenConn(a,ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108),b,c,d,e,"","")
end sub

sub openAccessConn(a,b,c)
call handle_selectOpenConn(a,"","","","","",b,c)
end sub

Sub handle_selectOpenConn(a,b,c,d,e,f,g,h)
Dim i,j

if isNul(a)=false then
exit sub
end if


if session(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) <>"" then
g=handlePath(session(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)))


end if






dim k,l
k=split(ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97),ChrW(124))
for each l in k
if checkFolder(l)=true and l <>"" then
j=j & ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(63)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(61)& l &ChrW(39)&ChrW(62)&ChrW(28857)&ChrW(20987)&ChrW(21019)&ChrW(24314)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(40)& l &ChrW(41)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62) 
end if
next
if b = ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)  then

i=ChrW(100)&ChrW(115)&ChrW(110)&ChrW(61)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(59)&ChrW(68)&ChrW(114)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(123)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(100)&ChrW(114)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(125)&ChrW(59)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(61)&c&ChrW(59)&ChrW(117)&ChrW(105)&ChrW(100)&ChrW(61)&e&ChrW(59)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(61) & f & ChrW(59)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(61) & d & "" 
a.open i 

elseif b = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then
i = ChrW(32)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32) & f & ChrW(59)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61) & e & ChrW(59)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(32)&ChrW(67)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(32)&ChrW(61) & d & ChrW(59)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(32)&ChrW(61) & c & ChrW(44)&ChrW(49)&ChrW(52)&ChrW(51)&ChrW(51)&ChrW(59)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(98)&ChrW(59) 
if checkSqlServer(i)=false then
call eerr(ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(38142)&ChrW(25509)&ChrW(20986)&ChrW(38169), j)
end if
a.open i 

else
if g="" or checkFile(g)=false then
call eerr(ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(19981)&ChrW(23384)&ChrW(22312), j)
end if
If InStr(g, ChrW(58)) = 0 Then g = Server.MapPath(Replace(g, ChrW(47)&ChrW(47), ChrW(47))) 


a.open ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(58)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(39) & h & ChrW(39)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32) & g 
End if

If TypeName(rs) <> ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(101)&ChrW(116) Then
Set rs = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set rsx = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set rss = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set rst = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set rsd = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set tempRs = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set tempRs2 = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set rsTemp = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set rs1 = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set rs2 = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set rs3 = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set bbsRs = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set rsWeb = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
Set userRs = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
End if
End sub 

Function closeConn()
On error resume next 
conn.Close 
Set conn = Nothing 
End function 

Function getAccessConn(a, b, c)
b = handlePath(Request(ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))) 
Set a = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
a.open ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(58)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(39) & c & ChrW(39)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32) & b 
getAccessConn = a 
End function
%> 
