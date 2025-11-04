<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../inc/Config.asp"-->
<!--#Include File = "../admin_function.asp"-->
<!--#Include File = "../admin_safe.Asp"-->
<% 
call openconn() 

dim inadminid, sqlAndinadminid
inadminid = request(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))
if inadminid <>"" then
sqlAndinadminid = ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(61)& inadminid &""
end if

function getLast7DaysData()
dim a, b, c, d, e
e = ChrW(91)
for a = 6 to 0 step -1
b = DateAdd(ChrW(100), -a, Date())
c = DateAdd(ChrW(100), -a, Date())

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediff(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)& a & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
if a < 6 then e = e & ChrW(44)
e = e & ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & Year(b) & ChrW(45) & Right(ChrW(48) & Month(b), 2) & ChrW(45) & Right(ChrW(48) & Day(b), 2) & ChrW(34)&ChrW(44)
e = e & ChrW(34)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(44)
end if
rs.close

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediff(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)& a & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
e = e & ChrW(34)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(125)
end if
rs.close
next
e = e & ChrW(93)
getLast7DaysData = e
end function

Response.ContentType = ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)
Response.CharSet = ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)

Response.Write getLast7DaysData()
%> 