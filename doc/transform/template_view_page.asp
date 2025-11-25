<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%
dim public_viewPage_asp_function

function viewpage_getHandleTransfer(a,b,c)
dim d,e,f,g,h,i,j
e=split(encTsStrReplace2(b,ChrW(45)&ChrW(95))&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95),ChrW(95)) 
j=mid(b,10)

g=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 

if instr(public_viewPage_asp_function,g)=false then
public_viewPage_asp_function=public_viewPage_asp_function&g&vbcrlf
end if  
viewpage_getHandleTransfer=cfg_tabAdd2 & ChrW(60)&ChrW(37)&ChrW(61)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(40)&ChrW(34)&j&ChrW(34)&ChrW(44)& handleAspVar(c) &ChrW(41)&ChrW(37)&ChrW(62)
end function

function viewpage_getHandleOnLineSelectValue(a,b,c)
dim d,e,f,g,h,i,j,k,l
dim m,n,o,p,q,r,s,t,u,v 
e=split(encTsStrReplace2(b,ChrW(45)&ChrW(95))&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95),ChrW(95))
l=decTsStrReplace(e(0),ChrW(45)&ChrW(95))
m=decTsStrReplace(e(1),ChrW(45)&ChrW(95))
n=decTsStrReplace(e(2),ChrW(45)&ChrW(95))
o=decTsStrReplace(e(3),ChrW(45)&ChrW(95))
p=decTsStrReplace(e(4),ChrW(45)&ChrW(95))
q=decTsStrReplace(e(5),ChrW(45)&ChrW(95))
r=phptrim(decTsStrReplace(e(6),ChrW(45)&ChrW(95)))
u=decTsStrReplace(e(7),ChrW(45)&ChrW(95))
v=decTsStrReplace(e(8),ChrW(45)&ChrW(95))
if r <>"" then
s=r:t=r
if lcase(left(s,4))=ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32) then
s=ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & mid(s,5)
end if
if lcase(left(t,6))=ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) then
t=ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32) & mid(t,7)
end if 
end if
if instr(l&ChrW(45),ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(45))>0 or instr(l&ChrW(45),ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(45))>0 then
d=d&ChrW(39)&ChrW(33719)&ChrW(24471)&ChrW(19968)&ChrW(32423)&ChrW(20998)&ChrW(31867)&ChrW(21517) & vbcrlf
d=d&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&m&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(32) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(101)&ChrW(120)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(115)&ChrW(44)&ChrW(99) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(58)&ChrW(83)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(40)&ChrW(34)&ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116)&ChrW(34)&ChrW(41)&ChrW(32)&ChrW(32) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(46)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(34)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(70)&ChrW(117)&ChrW(72)&ChrW(97)&ChrW(111)&ChrW(40)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(34)&m&ChrW(34)&ChrW(41)&ChrW(38)&ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&n&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&ChrW(34)&ChrW(38)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(38)&ChrW(34)&ChrW(41)&ChrW(34)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(44)&ChrW(49)&ChrW(44)&ChrW(49) & vbcrlf



d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(46)&ChrW(101)&ChrW(111)&ChrW(102) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(61)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(40)&ChrW(34)&p&ChrW(34)&ChrW(41)&IIF(u <>"",ChrW(38)&ChrW(32)&ChrW(34)&ChrW(40)&ChrW(34)&ChrW(38)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(40)&ChrW(34)&u&ChrW(34)&ChrW(41)&ChrW(38)&ChrW(34)&ChrW(41)&ChrW(34),"") & vbcrlf  
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(60)&ChrW(62)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(61)&ChrW(99)&ChrW(38)&ChrW(34)&ChrW(32)&ChrW(44)&ChrW(32)&ChrW(34) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(61)&ChrW(99)&ChrW(38)&ChrW(115) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(46)&ChrW(109)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(58)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(46)&ChrW(99)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&m&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(99) & vbcrlf
d=d&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) & vbcrlf
if instr(public_viewPage_asp_function,d)=false then
public_viewPage_asp_function=public_viewPage_asp_function&d & vbcrlf
end if
viewpage_getHandleOnLineSelectValue=cfg_tabAdd2&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&m&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&c&ChrW(41)&ChrW(37)&ChrW(62)&vbcrlf
elseif e(1)=ChrW(97)&ChrW(108)&ChrW(108)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(73)&ChrW(99)&ChrW(111) then
viewpage_getHandleOnLineSelectValue=cfg_tabAdd2 & ChrW(60)&ChrW(37)&ChrW(61)&c&ChrW(37)&ChrW(62) & vbcrlf
else
viewpage_getHandleOnLineSelectValue=cfg_tabAdd2 & ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(79)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(40)&ChrW(34)& c & mid(b,13) &ChrW(34)&ChrW(44)& c &ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
end if 
end function

function viewpage_getHandleOnLiseSelect(a,b,c,d)
dim e,f,g 
dim h,i,j,k,l,m,n,o,p
f=split(encTsStrReplace2(b,ChrW(45)&ChrW(95))&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95),ChrW(95))
h=decTsStrReplace(f(1),ChrW(45)&ChrW(95))
i=decTsStrReplace(f(2),ChrW(45)&ChrW(95))
j=decTsStrReplace(f(3),ChrW(45)&ChrW(95))
k=decTsStrReplace(f(4),ChrW(45)&ChrW(95))
l=decTsStrReplace(f(5),ChrW(45)&ChrW(95))
m=phptrim(decTsStrReplace(f(6),ChrW(45)&ChrW(95)))
p=decTsStrReplace(f(7),ChrW(45)&ChrW(95))
if m <>"" then
n=m:o=m
if lcase(left(n,4))=ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32) then
n=ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & mid(n,5)
end if
if lcase(left(o,6))=ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) then
o=ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32) & mid(o,7)
end if 
end if






if i="" then i=ChrW(105)&ChrW(100)
if j="" then j=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)
if k="" then k=ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)
if l="" then l=ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107) 
if checkField(db_PREFIX & h, j)=false then
e=e&ChrW(39)&ChrW(33719)&ChrW(24471)&ChrW(19968)&ChrW(32423)&ChrW(20998)&ChrW(31867)&ChrW(21517) & vbcrlf
e=e&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&h&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(32) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(101)&ChrW(120)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(115) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(58)&ChrW(83)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(40)&ChrW(34)&ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116)&ChrW(34)&ChrW(41)&ChrW(32)&ChrW(32) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(46)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(34)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(70)&ChrW(117)&ChrW(72)&ChrW(97)&ChrW(111)&ChrW(40)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(34)&h&ChrW(34)&ChrW(41)&ChrW(38)&ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&i&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(44)&ChrW(49)&ChrW(44)&ChrW(49) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(46)&ChrW(101)&ChrW(111)&ChrW(102)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110) & vbcrlf 
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(61)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(40)&ChrW(34)&k&ChrW(34)&ChrW(41)&IIF(p <>"",ChrW(38)&ChrW(32)&ChrW(34)&ChrW(40)&ChrW(34)&ChrW(38)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(40)&ChrW(34)&p&ChrW(34)&ChrW(41)&ChrW(38)&ChrW(34)&ChrW(41)&ChrW(34),"") & vbcrlf  
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(58)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(46)&ChrW(99)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(32) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&h&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(115) & vbcrlf
e=e&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) & vbcrlf
public_viewPage_asp_function=public_viewPage_asp_function&e
viewpage_getHandleOnLiseSelect=cfg_tabAdd2&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&h&ChrW(95)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&c&ChrW(41)&ChrW(37)&ChrW(62)&vbcrlf
else
e=e&ChrW(39)&ChrW(33719)&ChrW(24471)&ChrW(20998)&ChrW(31867)&ChrW(23545)&ChrW(24212)&ChrW(30340)&ChrW(20840)&ChrW(37096)&ChrW(26641)&ChrW(21517)&ChrW(31216)&ChrW(32)&ChrW(22914)&ChrW(32)&ChrW(97)&ChrW(97)&ChrW(62)&ChrW(98)&ChrW(98)&ChrW(62) & vbcrlf
e=e&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&h&ChrW(95)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(84)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(32) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(105)&ChrW(44)&ChrW(99)&ChrW(44)&ChrW(115) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(101)&ChrW(99)&ChrW(104)&ChrW(111)&ChrW(40)&ChrW(34)&ChrW(22810)&ChrW(32423)&ChrW(20998)&ChrW(31867)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(44)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(58)&ChrW(100)&ChrW(111)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(115) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(101)&ChrW(120)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) & vbcrlf

e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(58)&ChrW(83)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(40)&ChrW(34)&ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116)&ChrW(34)&ChrW(41)&ChrW(32)&ChrW(32) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(105)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(32)&ChrW(49)&ChrW(48) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(46)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(34)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(70)&ChrW(117)&ChrW(72)&ChrW(97)&ChrW(111)&ChrW(40)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(34)&h&ChrW(34)&ChrW(41)&ChrW(38)&ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&i&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(44)&ChrW(49)&ChrW(44)&ChrW(49) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(46)&ChrW(101)&ChrW(111)&ChrW(102)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(40)&ChrW(34)&j&ChrW(34)&ChrW(41) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(61)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(40)&ChrW(34)&k&ChrW(34)&ChrW(41)&IIF(p <>"",ChrW(38)&ChrW(32)&ChrW(34)&ChrW(40)&ChrW(34)&ChrW(38)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(40)&ChrW(34)&p&ChrW(34)&ChrW(41)&ChrW(38)&ChrW(34)&ChrW(41)&ChrW(34),"") & vbcrlf  
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(60)&ChrW(62)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(61)&ChrW(32)&ChrW(115)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(62)&ChrW(62)&ChrW(34) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(61)&ChrW(115)&ChrW(38)&ChrW(99) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(78)&ChrW(117)&ChrW(108)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(101)&ChrW(120)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39)&ChrW(20026)&ChrW(20551)&ChrW(36864)&ChrW(20986)&ChrW(24490)&ChrW(29615)&ChrW(39) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(58)&ChrW(114)&ChrW(115)&ChrW(120)&ChrW(46)&ChrW(99)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(32) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(110)&ChrW(101)&ChrW(120)&ChrW(116) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&h&ChrW(95)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(84)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(99) & vbcrlf
e=e&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) & vbcrlf
public_viewPage_asp_function=public_viewPage_asp_function&e
viewpage_getHandleOnLiseSelect=cfg_tabAdd2&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&h&ChrW(95)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(84)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&c&ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
end if
end function

function viewpage_radio_input(a,b,c)
dim d,e,f,g,h,i,j
e=split(b&ChrW(95),ChrW(95))
f=e(1)
d=""
e=split(b,ChrW(45))
for i=1 to ubound(e)
h=e(i)
g=split(h&ChrW(95)&h,ChrW(95))
if j="" then
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(115)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&g(1)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&g(0)&ChrW(34) & vbcrlf
else
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(115)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&g(1)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&g(0)&ChrW(34) & vbcrlf
end if
next 
d=d&ChrW(32) & vbcrlf
d=d&ChrW(39)&ChrW(33719)&ChrW(24471)&c&ChrW(23383)&ChrW(27573)&ChrW(23545)&ChrW(24212)&ChrW(30340)&ChrW(21333)&ChrW(36873)&ChrW(39033)&ChrW(23545)&ChrW(24212)&ChrW(20540)&ChrW(39) & vbcrlf
d=d&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&c&ChrW(95)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(40)&ChrW(115)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(41) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(67)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(40)&ChrW(115)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(41) & vbcrlf
d=d&j
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&c&ChrW(95)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(115)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(32) & vbcrlf
d=d&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) & vbcrlf
public_viewPage_asp_function=public_viewPage_asp_function & d
viewpage_radio_input=cfg_tabAdd2& ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(95)&c&ChrW(95)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(40)&c&ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
end function 

function viewpage_rating_input(a,b,c)
dim d,e,f,g,h,i,j,k,l,m
e=split(encTsStrReplace2(b,ChrW(45)&ChrW(95))&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95)&ChrW(95),ChrW(95))
g=decTsStrReplace(e(0),ChrW(45)&ChrW(95))
g=mid(g,8) 
if g="" then g=5
h=decTsStrReplace(e(1),ChrW(45)&ChrW(95))
i=decTsStrReplace(e(2),ChrW(45)&ChrW(95)&ChrW(44))
if h="" then h=ChrW(35)&ChrW(70)&ChrW(70)&ChrW(56)&ChrW(48)&ChrW(48)&ChrW(48)

if instr(i,ChrW(61))>0 then
k=split(i,ChrW(44))
for each m in k
if instr(m,ChrW(61))>0 then
l=split(m,ChrW(61))
if j <>"" then j=j&ChrW(44)&vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39)&l(0)&ChrW(39)&ChrW(58)&ChrW(32)&ChrW(39)&l(1)&ChrW(39)
end if
next
end if
d=ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(45)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&c&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(123)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(58)&ChrW(60)&ChrW(37)&ChrW(61)&c&ChrW(37)&ChrW(62)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)&h&ChrW(39)&ChrW(44)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(116)&ChrW(104)&ChrW(58)&g&ChrW(125)&ChrW(34)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(59)&ChrW(32)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(45)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(109)&ChrW(105)&ChrW(100)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(59)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) 
d=d & vbcrlf 

f=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(46)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(123) & vbcrlf
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(46)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(45)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&c&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(32) & vbcrlf
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) & vbcrlf  
if j <>"" then
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(44)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) & vbcrlf
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(44)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(41)&ChrW(123)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(33258)&ChrW(23450)&ChrW(20041)&ChrW(25991)&ChrW(26412)&ChrW(30340)&ChrW(21021)&ChrW(22987)&ChrW(22238)&ChrW(35843) & vbcrlf
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(97)&ChrW(114)&ChrW(114)&ChrW(115)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(123) & vbcrlf
f=f&j& vbcrlf 
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(59) & vbcrlf
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(46)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(46)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(40)&ChrW(97)&ChrW(114)&ChrW(114)&ChrW(115)&ChrW(91)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(124)&ChrW(124)&ChrW(32)&ChrW(40)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(32)&ChrW(43)&ChrW(32)&ChrW(34)&ChrW(26143)&ChrW(34)&ChrW(41)&ChrW(41)&ChrW(59) & vbcrlf
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125) & vbcrlf
end if
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41)&ChrW(59) & vbcrlf
if instr(public_viewPage_jsCode,f)=false then
public_viewPage_jsCode=public_viewPage_jsCode & f
end if 
viewpage_rating_input=cfg_tabAdd2 & d  
end function 
%>