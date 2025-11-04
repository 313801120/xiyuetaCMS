<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 

function handleAspStrSafe(a)
if isNul(a) then
a=""
else      
a=replace(a,ChrW(60)&ChrW(37),ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)&ChrW(37))
a=replace(a,ChrW(37)&ChrW(62),ChrW(37)&ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59))
end if
handleAspStrSafe=a
end function

function handleAspStrSafeAZDouHao(a)
dim b,c,d,e
for e=1 to len(a)
c=mid(a,e,1)
if instr(ChrW(97)&ChrW(98)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122)&ChrW(65)&ChrW(66)&ChrW(67)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(71)&ChrW(72)&ChrW(73)&ChrW(74)&ChrW(75)&ChrW(76)&ChrW(77)&ChrW(78)&ChrW(79)&ChrW(80)&ChrW(81)&ChrW(82)&ChrW(83)&ChrW(84)&ChrW(85)&ChrW(86)&ChrW(87)&ChrW(88)&ChrW(89)&ChrW(90)&ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57)&ChrW(32)&ChrW(44),c)>0 then
d=d&c
end if
next
handleAspStrSafeAZDouHao=d
end function

function handleAspStrSafeDirFileName(a)
dim b,c,d,e
for e=1 to len(a)
c=phptrim(mid(a,e,1))
if c <>"" then
if instr(ChrW(97)&ChrW(98)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122)&ChrW(65)&ChrW(66)&ChrW(67)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(71)&ChrW(72)&ChrW(73)&ChrW(74)&ChrW(75)&ChrW(76)&ChrW(77)&ChrW(78)&ChrW(79)&ChrW(80)&ChrW(81)&ChrW(82)&ChrW(83)&ChrW(84)&ChrW(85)&ChrW(86)&ChrW(87)&ChrW(88)&ChrW(89)&ChrW(90)&ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57)&ChrW(95)&ChrW(45),c)>0 then
d=d&c
end if
end if
next
handleAspStrSafeDirFileName=d
end function

function getFindIdToTableCount(a,b,c,d,e)
dim f
dim g:Set g = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
f=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(b)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&c&ChrW(61)&a & ChrW(32) & e

g.open f,conn,1,1 
getFindIdToTableCount=replace(d,ChrW(42),g.recordcount)
g.close
end function 

function printMoneyCnInfo(a)
dim b
b=printNumberValue(a)
if a >=100000000 or a <=-100000000 then
b=ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(39)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&a&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(62)&b&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)
elseif a >=10000000 or a <=-10000000 then
b=ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(39)&ChrW(35)&ChrW(101)&ChrW(49)&ChrW(99)&ChrW(54)&ChrW(50)&ChrW(57)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&a&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(62)&b&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)
elseif a >=1000000 or a <=-1000000 then
b=ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&a&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(62)&b&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)
elseif a >=100000 or a <=-100000 then
b=ChrW(60)&ChrW(98)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&a&ChrW(39)&ChrW(62)&b&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)
else
b=ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&a&ChrW(39)&ChrW(62)&b&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)
end if
printMoneyCnInfo=b
end function 
%>