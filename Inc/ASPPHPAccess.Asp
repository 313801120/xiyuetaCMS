<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


function getWhereAnd(byVal a, byVal b)
dim c, d, e 

if trim(b) = "" then getWhereAnd = a : exit function 
if inStr(LCase(a), ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)) > 0 then
d = ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32) 
else
d = ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) 
end if 
if b <> "" then
b = trim(b) 
c = LCase(b) 
if left(c, 6) = ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32) or left(c, 6) = ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32) then
getWhereAnd = a & ChrW(32) & b : exit function
elseIf left(c, 6) = ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) then
b = mid(b, 7) 
elseIf left(c, 4) = ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32) then
b = mid(b, 5) 
end if 

e = lcase(b) 
if e <> ChrW(97)&ChrW(110)&ChrW(100) and e <> ChrW(111)&ChrW(114) and e <> ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101) then
a = a & d & b 
end if 
end if 
getWhereAnd = a 
end function 

function orAndSearch(a, b, c)
dim d, e, f 
c = regExp_Replace(c, ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32), ChrW(32)&ChrW(79)&ChrW(114)&ChrW(32)) 
c = regExp_Replace(c, ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32), ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32)) 
if inStr(c, ChrW(32)&ChrW(79)&ChrW(114)&ChrW(32)) > 0 then
d = split(c, ChrW(32)&ChrW(79)&ChrW(114)&ChrW(32)) 
for each e in d
if e <> "" then
if f <> "" then f = f & ChrW(32)&ChrW(79)&ChrW(114)&ChrW(32) 
f = f & ChrW(32) & b & ChrW(32)&ChrW(76)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & e & ChrW(37)&ChrW(39) 
end if 
next 
elseIf inStr(c, ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32)) > 0 then
d = split(c, ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32)) 
for each e in d
if e <> "" then
if f <> "" then f = f & ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32) 
f = f & ChrW(32) & b & ChrW(32)&ChrW(76)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & e & ChrW(37)&ChrW(39) 
end if 
next 
elseIf c <> "" then
d = split(c, ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32)) 
for each e in d
if e <> "" then
if f <> "" then f = f & ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32) 
f = f & ChrW(32) & b & ChrW(32)&ChrW(76)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & e & ChrW(37)&ChrW(39) 
end if 
next 
end if 
if f <> "" then
if inStr(LCase(a), ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)) = 0 then
f = ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & f 
else
f = ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32) & f 
end if 
a = a & f 
end if 
orAndSearch = a 
end function 

function getThisIdPage(a, b, c)
dim d 

getThisIdPage = ChrW(49) 
if b = "" then
exit function 
end if

d = nGetRecordCount( a ,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(61) & b) 
getThisIdPage = cstr(getCountPage(cint(d), c)) 

end function

function nGetRecordCount(a,b)
nGetRecordCount=0

rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & a & ChrW(32) & b,conn,1,1
if not rsx.eof then
nGetRecordCount=cint(rsx.recordcount)
end if:rsx.close

end function


function handleSqlServer(byVal a)
dim b, c, d, e, f, g ,h
if EDITORTYPE=ChrW(106)&ChrW(115)&ChrW(112) then
handleSqlServer=handleMySql(a)
exit function
end if
g = split(a, ChrW(44)) 
for each a in g
a = replace(a, ChrW(34)&ChrW(34), ChrW(39)&ChrW(39))
a = replace(a, ChrW(34), ChrW(39))
a = replace(a, ChrW(39)&ChrW(39)&ChrW(39)&ChrW(39), ChrW(39)&ChrW(39)) 
a = replace(a, ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41), ChrW(71)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41)) 
a = replace(a, ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41), ChrW(71)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41)) 



a = replace(a, ChrW(89)&ChrW(101)&ChrW(115)&ChrW(78)&ChrW(111)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(89)&ChrW(101)&ChrW(115), ChrW(32)&ChrW(66)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(39)) 
a = replace(a, ChrW(89)&ChrW(101)&ChrW(115)&ChrW(78)&ChrW(111)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111), ChrW(32)&ChrW(66)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(39)) 
a = replace(a, ChrW(32)&ChrW(89)&ChrW(101)&ChrW(115)&ChrW(78)&ChrW(111), ChrW(32)&ChrW(32)&ChrW(66)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(39)) 
if inStr(a, ChrW(89)&ChrW(101)&ChrW(115)&ChrW(78)&ChrW(111)) > 0 then
call eerr(ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116), a) 
end if 
for b = 1 to len(a)
c = mid(a, b, 1) 
if c = ChrW(32) then
d = LCase(mid(a, b + 1, 7)) 
e = LCase(mid(a, b + 1, 8)) 
h = LCase(mid(a, b + 1, 4)) 
if d = ChrW(118)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114) and e <> ChrW(118)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(40) then
f = f & ChrW(32)&ChrW(110)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(40)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(41)
b = b + 7 
elseif h = ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)  then
f = f & ChrW(32)&ChrW(110)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(40)&ChrW(109)&ChrW(97)&ChrW(120)&ChrW(41)
b = b + 4
else
f = f & c 
end if 
else
f = f & c 
end if 
next 
f = f & ChrW(44)   
next 
if f <> "" then f = left(f, len(f) - 1) 

handleSqlServer = f 
end function 

function handleMySql(byval a)
a=replace(replace(replace(a,ChrW(34)&ChrW(39318)&ChrW(39029)&ChrW(34),ChrW(34)&ChrW(34)),ChrW(34)&ChrW(20869)&ChrW(39029)&ChrW(34),ChrW(34)&ChrW(34)) ,ChrW(34)&ChrW(35814)&ChrW(32454)&ChrW(39029)&ChrW(34),ChrW(34)&ChrW(34)) 
a= replace(a,ChrW(34)&ChrW(30007)&ChrW(34),ChrW(34)&ChrW(34)) 
a= replace(replace(a,ChrW(34)&ChrW(92)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(34),ChrW(34)&ChrW(34)) ,ChrW(34)&ChrW(92)&ChrW(83)&ChrW(107)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(92)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(92)&ChrW(34),ChrW(34)&ChrW(34)) 
a= replace(replace(a,ChrW(34)&ChrW(92)&ChrW(83)&ChrW(107)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(92)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(92)&ChrW(73)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(92)&ChrW(34),ChrW(34)&ChrW(34)) ,ChrW(34)&ChrW(92)&ChrW(83)&ChrW(107)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(92)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(92)&ChrW(67)&ChrW(115)&ChrW(115)&ChrW(92)&ChrW(34),ChrW(34)&ChrW(34))  
a= replace( replace(a,ChrW(34)&ChrW(92)&ChrW(83)&ChrW(107)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(92)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(92)&ChrW(74)&ChrW(115)&ChrW(92)&ChrW(34),ChrW(34)&ChrW(34)) ,ChrW(34)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(51)&ChrW(34),ChrW(34)&ChrW(34)) 
dim b
b=getstrcut(a,ChrW(32)&ChrW(40),ChrW(32),0)

a=replace(a,ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34),ChrW(32)&ChrW(109)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(117)&ChrW(109)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)) 
a=replace(a,ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41),ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(44))
a=replace(a,ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44),ChrW(75)&ChrW(101)&ChrW(121)&ChrW(40)&b&ChrW(41)&ChrW(44))
a=replace(a,ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32),ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(40)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(41)&ChrW(32))  
a=replace(a,ChrW(32)&ChrW(34)&ChrW(34),ChrW(32)&ChrW(39)&ChrW(39))
a=replace(a,ChrW(32)&ChrW(89)&ChrW(101)&ChrW(115)&ChrW(78)&ChrW(111)&ChrW(32),ChrW(32)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(121)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(49)&ChrW(41)&ChrW(32)) 
a=replace(a,ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32),ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(56)&ChrW(41)&ChrW(32)) 
a=replace(a,ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41),ChrW(32)&ChrW(67)&ChrW(85)&ChrW(82)&ChrW(82)&ChrW(69)&ChrW(78)&ChrW(84)&ChrW(95)&ChrW(84)&ChrW(73)&ChrW(77)&ChrW(69)&ChrW(83)&ChrW(84)&ChrW(65)&ChrW(77)&ChrW(80)) 
a=replace(a,ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41),ChrW(32)&ChrW(67)&ChrW(85)&ChrW(82)&ChrW(82)&ChrW(69)&ChrW(78)&ChrW(84)&ChrW(95)&ChrW(84)&ChrW(73)&ChrW(77)&ChrW(69)&ChrW(83)&ChrW(84)&ChrW(65)&ChrW(77)&ChrW(80))


a=replace(a,ChrW(32)&ChrW(89)&ChrW(101)&ChrW(115),ChrW(32)&ChrW(49))
a=replace(a,ChrW(32)&ChrW(78)&ChrW(111),ChrW(32)&ChrW(48)) 
a=replace(a,ChrW(44)&ChrW(91),ChrW(44)&ChrW(96)) 
a=replace(a,ChrW(93)&ChrW(32),ChrW(96)&ChrW(32)) 
a=replace(a,ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91),ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(96)) 
a=replace(a,ChrW(96)&ChrW(32)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(32),ChrW(96)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(99)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(32))
a=a & ChrW(69)&ChrW(78)&ChrW(71)&ChrW(73)&ChrW(78)&ChrW(69)&ChrW(61)&ChrW(77)&ChrW(121)&ChrW(73)&ChrW(83)&ChrW(65)&ChrW(77)&ChrW(32)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(65)&ChrW(85)&ChrW(76)&ChrW(84)&ChrW(32)&ChrW(67)&ChrW(72)&ChrW(65)&ChrW(82)&ChrW(83)&ChrW(69)&ChrW(84)&ChrW(61)&ChrW(117)&ChrW(116)&ChrW(102)&ChrW(56)&ChrW(59)
handleMySql=a
end function
%> 
