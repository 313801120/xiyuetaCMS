<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 





sub sqlIn(a)

dim b, c, d, e,f,g,h

b = ChrW(39)&ChrW(124)&ChrW(59)&ChrW(124)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(124)&ChrW(40)&ChrW(124)&ChrW(41)&ChrW(124)&ChrW(101)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(124)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(124)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(124)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(42)&ChrW(124)&ChrW(99)&ChrW(104)&ChrW(114)&ChrW(124)&ChrW(109)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(109)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(124)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(124)&ChrW(100)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(114)&ChrW(101) 
c = split(b, ChrW(124))                                                      

if request.queryString <> "" then
for each h in request.queryString
if instr(ChrW(124)& a &ChrW(124),ChrW(124)& lcase(h) &ChrW(124))>0 or a=ChrW(42) then

for d = 0 to uBound(c)
f=ChrW(32)& lCase(request.queryString(h)) &ChrW(32)
g=ChrW(32)& c(d) &ChrW(32)



if inStr(f, g) <> 0 then
call saveSqlInInfo(ChrW(71)&ChrW(101)&ChrW(116),c(d)) 
call eerr(ChrW(71)&ChrW(101)&ChrW(116)&ChrW(27880)&ChrW(20837), ChrW(20320)&ChrW(30340)&ChrW(73)&ChrW(80)&ChrW(91) & getIP & ChrW(93)&ChrW(24050)&ChrW(34987)&ChrW(25910)&ChrW(24405)) 
end if 
next 
end if
next 
end if 

if request.form <> "" then

for each h in request.form

if instr(ChrW(124)& a &ChrW(124),ChrW(124)& lcase(h) &ChrW(124))>0 or a=ChrW(42) then
for d = 0 to uBound(c)
f=ChrW(32)& lCase(request.form(h)) &ChrW(32)
g=ChrW(32)& c(d) &ChrW(32)


if inStr(f, g) <> 0 then
call saveSqlInInfo(ChrW(80)&ChrW(111)&ChrW(115)&ChrW(116),c(d)) 
call eerr(ChrW(80)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(27880)&ChrW(20837), ChrW(20320)&ChrW(30340)&ChrW(73)&ChrW(80)&ChrW(91) & getIP & ChrW(93)&ChrW(24050)&ChrW(34987)&ChrW(25910)&ChrW(24405)) 
end if 
next 
end if
next 
end if 

if request.cookies <> "" then
for each h in request.cookies
if instr(ChrW(124)& a &ChrW(124),ChrW(124)& lcase(h) &ChrW(124))>0 or a=ChrW(42) then
if isArray(request.cookies(h)) then
for e = lbound(request.cookies(h)) to ubound(request.cookies(h))
for d = 0 to uBound(c)
f=ChrW(32)& lCase(request.cookies(h)(e)) &ChrW(32)
g=ChrW(32)& c(d) &ChrW(32)
if inStr(f, g) <> 0 then
call saveSqlInInfo(ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115),c(d)) 
call eerr(ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115)&ChrW(27880)&ChrW(20837), ChrW(20320)&ChrW(30340)&ChrW(73)&ChrW(80)&ChrW(91) & getIP & ChrW(93)&ChrW(24050)&ChrW(34987)&ChrW(25910)&ChrW(24405)) 
end if 
next
next
else
for d = 0 to uBound(c)
f=ChrW(32)& lCase(request.cookies(h)) &ChrW(32)
g=ChrW(32)& c(d) &ChrW(32)
if inStr(f, g) <> 0 then
call saveSqlInInfo(ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115),c(d)) 
call eerr(ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115)&ChrW(27880)&ChrW(20837), ChrW(20320)&ChrW(30340)&ChrW(73)&ChrW(80)&ChrW(91) & getIP & ChrW(93)&ChrW(24050)&ChrW(34987)&ChrW(25910)&ChrW(24405)) 
end if 
next
end if
end if
next 
end if
end sub 

function saveSqlInInfo(a,b)
dim c, d, e, f, g, h, i 
c = server.mapPath(ChrW(47)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)) 
d = now() 
e = request.serverVariables(ChrW(82)&ChrW(101)&ChrW(109)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(114)) 
b = d & ChrW(32)&ChrW(45)&ChrW(32) & e & ChrW(32)&ChrW(45)&ChrW(32)& a &ChrW(32)&ChrW(32)&ChrW(32) & b & ChrW(32)&ChrW(32)&ChrW(32) & getThisUrl()
set h = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if h.fileexists(c) then
set f = h.opentextfile(c, 1)
set i = h.getfile(c)
if i.size > 0 then g = f.readall 
set i = nothing 
set f = nothing 
set f = h.createtextfile(c, true)
f.writeline(g & b) 
set f = nothing 
else
set f = h.createtextfile(c, true)
f.writeline(b) 
set f = nothing 
end if 
set h = nothing 
end function 
%>  
