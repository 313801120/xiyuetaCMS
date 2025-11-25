<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include virtual = "/Inc/Config.Asp"-->
<%
call openconn()
call run()
sub run()
dim a,b,c,d,e
dim f,g,h

e = ""

dim i,j,k,l,m,n
i = Request.ServerVariables(ChrW(81)&ChrW(85)&ChrW(69)&ChrW(82)&ChrW(89)&ChrW(95)&ChrW(83)&ChrW(84)&ChrW(82)&ChrW(73)&ChrW(78)&ChrW(71))
if i <> "" then
j = split(i,ChrW(38))
for each k in j
if instr(k,ChrW(61)) > 0 then
l = split(k,ChrW(61))
if ubound(l) >= 1 then
m = lcase(trim(l(0)))
n = trim(l(1))
if m = ChrW(99) and n <> "" then

on error resume next
n = Server.URLDecode(n)
on error goto 0

n = replace(n,ChrW(39),ChrW(39)&ChrW(39))
if e <> "" then e = e & ChrW(44)
e = e & ChrW(39) & n & ChrW(39)
end if
end if
end if
next
end if

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(121)&ChrW(105)&ChrW(121)&ChrW(97)&ChrW(110)
if e <> "" then
d = d & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(40) & e & ChrW(41)
end if

rs.open d,conn,1,1
b = 1

if b>rs.recordCount then b=rs.recordCount
if rs.recordCount = 0 then
rs.close
exit sub
end if
for a = 1 to b
Randomize()

for h=1 to 136
f = int(rs.recordCount*rnd)
if instr(ChrW(44)& g &ChrW(44) , ChrW(44)& f &ChrW(44))=false then
if g <> "" then g=g & ChrW(44)
g=g & f
exit for
end if
next

rs.Move f
c=ChrW(123)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&rs(ChrW(105)&ChrW(100))&ChrW(44)&ChrW(34)&ChrW(117)&ChrW(117)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(104)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(107)&ChrW(111)&ChrW(116)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(34)&jsonCL(rs(ChrW(104)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(107)&ChrW(111)&ChrW(116)&ChrW(111)))&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(99)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(34)&ChrW(58)&ChrW(34)&jsonCL(rs(ChrW(115)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)))&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(95)&ChrW(119)&ChrW(104)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34)&jsonCL(rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(111)&ChrW(114)))&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(95)&ChrW(117)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(57)&ChrW(48)&ChrW(57)&ChrW(55)&ChrW(44)&ChrW(34)&ChrW(114)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(49)&ChrW(48)&ChrW(52)&ChrW(52)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(95)&ChrW(97)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(49)&ChrW(54)&ChrW(49)&ChrW(57)&ChrW(49)&ChrW(55)&ChrW(48)&ChrW(52)&ChrW(53)&ChrW(55)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(116)&ChrW(104)&ChrW(34)&ChrW(58)&len(rs(ChrW(104)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(107)&ChrW(111)&ChrW(116)&ChrW(111)))&ChrW(125) 
call rw(c)
rs.Move -f
next:rs.close
end sub
%> 