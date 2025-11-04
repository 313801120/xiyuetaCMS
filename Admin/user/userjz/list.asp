<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
dim inadminid,sqlWhereinadminid,sqlAndinadminid
inadminid=request(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))
if inadminid <>"" then
sqlWhereinadminid=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(61)& inadminid
sqlAndinadminid=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(61)& inadminid
end if
call openconn()  

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(101)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(88)&ChrW(84) then
dim c,filePath,toFilePath
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100) 
rs.open sql,conn,1,1
while not rs.eof
c=c&ChrW(12304)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(12305)&rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(12305)&rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(12305)&rs(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) & vbcrlf
c=c&ChrW(12304)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(12305)&rs(ChrW(115)&ChrW(101)&ChrW(120)) & vbcrlf
c=c&ChrW(12304)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(12305)&rs(ChrW(112)&ChrW(105)&ChrW(99)) & vbcrlf
c=c&ChrW(12304)&ChrW(100)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305)&rs(ChrW(100)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)) & vbcrlf
c=c&ChrW(12304)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(111)&ChrW(102)&ChrW(98)&ChrW(105)&ChrW(114)&ChrW(116)&ChrW(104)&ChrW(12305)&rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(111)&ChrW(102)&ChrW(98)&ChrW(105)&ChrW(114)&ChrW(116)&ChrW(104)) & vbcrlf
c=c&ChrW(12304)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(12305)&rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)) & vbcrlf
c=c&ChrW(12304)&ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110)&ChrW(12305)&rs(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110)) & vbcrlf
c=c&ChrW(12304)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(121)&ChrW(12305)&rs(ChrW(97)&ChrW(108)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(121)) & vbcrlf
c=c&ChrW(12304)&ChrW(113)&ChrW(113)&ChrW(12305)&rs(ChrW(113)&ChrW(113)) & vbcrlf
c=c&ChrW(12304)&ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(12305)&rs(ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(12305)&rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)) & vbcrlf
c=c&ChrW(12304)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(12305)&rs(ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(12305)&rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) & vbcrlf 
if rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)) <>"" then c=c&ChrW(12304)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305)&rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)) & ChrW(12304)&ChrW(47)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305) & vbcrlf 
c=c&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&vbcrlf
rs.MoveNext:wend:rs.close
filePath=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
toFilePath=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(47)&ChrW(35)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95) & format_Time(now(),6) &ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if checkFile(filePath) then
call movefile(filePath,toFilePath)
end if
call writetofile(filePath,c,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))

c=""
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100) 
rs.open sql,conn,1,1
while not rs.eof
c=c&ChrW(12304)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(12305)&rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)) & vbcrlf
c=c&ChrW(12304)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(12305)&rs(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) & vbcrlf
c=c&ChrW(12304)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(12305)&rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(12305)&rs(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(100)&ChrW(105)&ChrW(114)&ChrW(12305)&rs(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(100)&ChrW(105)&ChrW(114)) & vbcrlf
c=c&ChrW(12304)&ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(12305)&rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50)&ChrW(12305)&rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50)) & vbcrlf
c=c&ChrW(12304)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51)&ChrW(12305)&rs(ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51)) & vbcrlf
c=c&ChrW(12304)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(12305)&rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(12305)&rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) & vbcrlf 
if rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)) <>"" then c=c&ChrW(12304)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305)&rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)) & ChrW(12304)&ChrW(47)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305) & vbcrlf 
c=c&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&vbcrlf
rs.MoveNext:wend:rs.close
filePath=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
toFilePath=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(47)&ChrW(35)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95) & format_Time(now(),6) &ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if checkFile(filePath) then
call movefile(filePath,toFilePath)
end if
call writetofile(filePath,c,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))

c=""
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(100)&ChrW(105)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100) 
rs.open sql,conn,1,1
while not rs.eof
c=c&ChrW(12304)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(12305)&rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(12305)&rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(12305)&rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & vbcrlf
c=c&ChrW(12304)&ChrW(119)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(12305)&rs(ChrW(119)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(114)) & vbcrlf
c=c&ChrW(12304)&ChrW(119)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(12305)&rs(ChrW(119)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & vbcrlf
if rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)) <>"" then c=c&ChrW(12304)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305)&rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)) & ChrW(12304)&ChrW(47)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305) & vbcrlf 
c=c&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&vbcrlf
rs.MoveNext:wend:rs.close
filePath=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
toFilePath=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(47)&ChrW(35)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95) & format_Time(now(),6) &ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if checkFile(filePath) then
call movefile(filePath,toFilePath)
end if
call writetofile(filePath,c,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
call rw(jsTiming(ChrW(63),6))
call eerr(ChrW(25552)&ChrW(31034),ChrW(23548)&ChrW(20986)&ChrW(25104)&ChrW(84)&ChrW(88)&ChrW(84)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(26377)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(34920)&ChrW(21644)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(34920)&ChrW(21644)&ChrW(100)&ChrW(105)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(34920))
end if
dim num,page,stemp,sql,currentPage,perpage,page_count,i,n,totalrec,isthrough,id,price,ncount,pinjuiMonery,bodycontent
dim thisYearPrice,lastYearPrice,beforeLastYearPrice,threeYearsAgoPrice

If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then
num = UCase(Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))) 
page = UCase(Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)))        
stemp = ""
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93) 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110)) <> "" Then
sql=sql & IIF(instr(sql,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & getAccessDatediffTime(ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110))) & ChrW(60)&ChrW(61)&ChrW(48) 
End if 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120)) <> "" Then
sql=sql & IIF(instr(sql,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & getAccessDatediffTime(ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120))) & ChrW(62)&ChrW(61)&ChrW(48) 
End if 
If Request(ChrW(107)&ChrW(101)&ChrW(121)) <> "" Then
sql =  sql & IIF(instr(sql,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)) & ChrW(40)&ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & Request(ChrW(107)&ChrW(101)&ChrW(121)) & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(91)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & Request(ChrW(107)&ChrW(101)&ChrW(121)) & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(41) 
End if 
sql=sql & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99) 

rs.Open sql, conn, 1, 1 
If Not rs.EOF Then
If Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)) = "" Then
currentPage = 1 
Else
currentPage = CInt(Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))) 
End if 
perpage = num 
rs.PageSize = perpage 
rs.AbsolutePage = currentPage 
page_count = 0 
i =(page - 1) * num 
totalrec = rs.RecordCount 
While (Not rs.EOF) And(Not page_count = rs.PageSize)
i = i + 1 
page_count = page_count + 1 
If totalrec Mod perpage = 0 Then
n = totalrec \ perpage 
Else
n = totalrec \ perpage + 1 
End if  
isthrough=""
if rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) <>0 then
isthrough=ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)
end if
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100)) & sqlAndinadminid,conn,1,1
price=IIF(isnull(rsx(ChrW(116)&ChrW(112)&ChrW(118)))=true,0,rsx(ChrW(116)&ChrW(112)&ChrW(118)))
rsx.close
ncount=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100)) & sqlAndinadminid)(0)
if ncount=0 then
pinjuiMonery=0
else
pinjuiMonery=Formatnumber(price/ncount,0) 
end if
pinjuiMonery=replace(cstr(pinjuiMonery),ChrW(44),"")

rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(61)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&sqlAorS(ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41))&ChrW(41) & sqlAndinadminid, conn, 1, 1
thisYearPrice = IIF(isnull(rsx(ChrW(116)&ChrW(112)&ChrW(118)))=true, 0, rsx(ChrW(116)&ChrW(112)&ChrW(118)))
rsx.close

rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(61)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&sqlAorS(ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41))&ChrW(41)&ChrW(45)&ChrW(49) & sqlAndinadminid, conn, 1, 1
lastYearPrice = IIF(isnull(rsx(ChrW(116)&ChrW(112)&ChrW(118)))=true, 0, rsx(ChrW(116)&ChrW(112)&ChrW(118)))
rsx.close

rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(61)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&sqlAorS(ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41))&ChrW(41)&ChrW(45)&ChrW(50) & sqlAndinadminid, conn, 1, 1
beforeLastYearPrice = IIF(isnull(rsx(ChrW(116)&ChrW(112)&ChrW(118)))=true, 0, rsx(ChrW(116)&ChrW(112)&ChrW(118)))
rsx.close

rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(61)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&sqlAorS(ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41))&ChrW(41)&ChrW(45)&ChrW(51) & sqlAndinadminid, conn, 1, 1
threeYearsAgoPrice = IIF(isnull(rsx(ChrW(116)&ChrW(112)&ChrW(118)))=true, 0, rsx(ChrW(116)&ChrW(112)&ChrW(118)))
rsx.close
bodycontent=jsonCL(rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)))




if not (price=0 and request(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) <>"") then
if stemp <>"" then stemp=stemp & ChrW(44)
stemp = stemp & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) &i& ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(113)&ChrW(113)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(113)&ChrW(113)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) & isthrough & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & format_Time(rs(ChrW(114)&ChrW(101)&ChrW(103)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & price & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & ncount & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(105)&ChrW(110)&ChrW(106)&ChrW(117)&ChrW(105)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(34)&ChrW(58)&ChrW(34) & pinjuiMonery & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & bodycontent & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(121)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(97)&ChrW(108)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(121)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(89)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & thisYearPrice & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(89)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & lastYearPrice & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(98)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(76)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(89)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & beforeLastYearPrice & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(89)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(65)&ChrW(103)&ChrW(111)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & threeYearsAgoPrice & ChrW(34)&ChrW(125) 
end if
rs.MoveNext 
Wend 
End if 
stemp = ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) & stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & rs.RecordCount & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(125) 
Response.Write stemp 
rs.Close 
Response.end()
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(101)&ChrW(108) then
id=request(ChrW(105)&ChrW(100))
if userrs(ChrW(112)&ChrW(119)&ChrW(100)) <>mymd5(request(ChrW(112)&ChrW(119)&ChrW(100))) then
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125)
else
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) &id,conn,1,3
if not rs.eof then
rs.delete
rs.update
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(29992)&ChrW(25143)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
else
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(29992)&ChrW(25143)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(29992)&ChrW(25143)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125)
end if:rs.close
end if
Response.end()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104) then
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&IIF(request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101),1,0) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(105)&ChrW(100))
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(35774)&ChrW(32622)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
Response.end()
End if 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员列表</title>
<script type="text/javascript" src="../../js/jquery.js"></script><link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
<style>
.layui-table-cell .layui-form-checkbox[lay-skin="primary"] {/*让列表选项位置上下居中 20230331*/
top: 4px;
}
</style>
</head>
<body style="padding:10px 6px 30px 6px;background: #FFF">  
<div class="layui-form ">
<div class="layui-inline">
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_min" placeholder="开始日期" autocomplete="off" class="layui-input date">
</div>
<div class="layui-input-inline">-</div>
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_max" placeholder="结束日期" autocomplete="off" class="layui-input date">
</div>
</div>
<div class="layui-inline">
<input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的账号">
</div>
<button class="layui-btn" data-type="reload">搜索</button>
<button class="layui-btn" onclick="showwin('添加用户','userform.asp?inadminid=<%=inadminid%>')">添加</button>
<button class="layui-btn" onclick="confirmExport()">导出</button>
<div class="layui-inline"> 
<span id="msg">审核通过才会在首页界面里统计</span>
</div>
</div> 
<script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="jizhang"><i class="layui-icon layui-icon-edit"></i>记账</a> 
</script>
<table class="layui-hide" id="table" lay-filter="demo"></table>
<script> 
//重新加载表格20240524
function reloadTable(){
$('button[data-type=reload]').click();
layer.closeAll(); // 关闭所有弹窗，无论类型
}
function confirmExport(){
layer.confirm('确定要导出数据吗？', {
btn: ['确定','取消'] //按钮
}, function(){
var loadIndex = layer.load(2, {shade: [0.3,'#000']}); // 显示加载层
layer.msg('正在跳转导出页面，请稍候...', {icon: 16, time: 0}); // 显示提示信息
setTimeout(function(){
window.location='?act=exportTXT';
}, 500); // 延迟500毫秒后跳转，让用户能看到提示
}, function(){
layer.msg('已取消导出', {icon: 1});
});
}
layui.use(['form','table'],function(){
var form = layui.form
table = layui.table; 
//方法级渲染
table.render({
elem: '#table',
url: '?act=userlist&inadminid=<%=inadminid%>',
cols: [
[
{ field: 'i', title: '序列', width:80, sort: true }
, { field: 'username', title: '用户名',width:120, sort: true , align:'center', templet:function(d){ 
return '<span style="cursor: pointer;" lay-event="tubian" title="详细信息">'+d.username+'</span>'}}
,{field: 'nickname', title: '昵称',width:120, sort: true, align:'center', templet:function(d){ 
return '<span style="cursor: pointer;" lay-event="kainfo" title="任务列表">'+d.nickname+'</span>'}}
, { field: 'price', title: '总收款',width:90, sort: true }
, { field: 'ncount', title: '次数',width:80, sort: true }
, { field: 'pinjuiMonery', title: '单价',width:80, sort: true }
, { field: 'thisYearPrice', title: '今年总',minWidth:90, sort: true }
, { field: 'lastYearPrice', title: '去年总',minWidth:90, sort: true }
, { field: 'beforeLastYearPrice', title: '前年总',minWidth:90, sort: true }
, { field: 'threeYearsAgoPrice', title: '大前年',minWidth:90, sort: true }
, { field: 'qq', title: 'QQ',minWidth:200, sort: true }  
, { field: 'weixin', title: '微信',minWidth:150, sort: false }
, { field: 'alipay', title: '支付宝',minWidth:150, sort: false }
, { field: 'bodycontent', title: '说明',sort: true } 
,{field: 'isthrough', title: '审核状态',width:100, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
, { field: 'regtime', title: '加入时间',width:160, sort: true }
, { fixed: 'right', title: '操作', width: 220, toolbar: '#barDemo' }
]
],
id: 'testReload',
page: true,
limit: 100
});
//是否置顶
form.on('switch', function(data){
var index = layer.msg('修改中，请稍候',{icon: 16,time:false,shade:0.8});
setTimeout(function(){
var pid=data.elem.value
layer.close(index);
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=isthrough",
data: { "id": pid,"isthrough":data.elem.checked }, 
success: function(data) { 
switch (data.status) {
case "y": 
break;
case "n":                       
break;
}
}
});
if(data.elem.checked){
layer.msg("审核通过！");
}else{
layer.msg("取消审核！");
}
},500);
})
var $ = layui.$,
active = {
reload: function() {
//执行重载
table.reload('testReload', {
page: {
curr: 1 //重新从第 1 页开始
},
where: {
date_min: $('input[name=date_min]').val(),
date_max: $('input[name=date_max]').val(),
key: $('input[name=key]').val()
}
});
}
};
$('.layui-form .layui-btn').on('click', function() {
var type = $(this).data('type');
active[type] ? active[type].call(this) : '';
});
//监听行工具事件
table.on('tool(demo)', function(obj) {
var data = obj.data;
var pid = obj.data["id"]
var nickname = obj.data["nickname"]
if (obj.event === 'del') {
layer.prompt({
formType: 1,
title: '敏感操作，请验证密码'
}, function(value, index) {
layer.close(index);
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=del",
data: { "id": pid,"pwd":value }, 
success: function(data) { 
switch (data.status) {
case "y":
obj.del();                                                   
layer.msg(data.info);
break;
case "n":                                    
layer.msg(data.info);
break;
}
}
});
});
} else if (obj.event === 'edit') {
showwin('编辑用户', 'userform.asp?id=' + pid)
} else if (obj.event === 'jizhang') {
showwin('添加任务','../../app/money/listform.asp?userid=' + pid+'&inadminid=<%=request(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))%>')   
} else if (obj.event === 'kainfo') {
// showwin2
// showwin3('任务列表', '/admin/app/money/list.asp?inadminid=<%=inadminid%>&key=' + nickname)
showwin3('任务列表', '/admin/app/money/list.asp?userid=' + pid+'&inadminid=<%=request(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))%>')   
} else if (obj.event === 'tubian') {//图表
showwin3(obj.data["nickname"]+' - 详细信息', '/admin/home/console_jz.asp?inadminid=<%=inadminid%>&userid=' + obj.data["id"])
}
});
}); 
</script>
<script type="text/javascript" src="../../js/pc.js?v612"></script>
</body>
</html>
