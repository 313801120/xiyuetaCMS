<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 








function strCut(byVal a, byVal b, byVal c, byVal d)
dim e, f, g, h, i, j, k, l ,m
k = b 
l = c  
j = a 
m = ChrW(124) & d & ChrW(124) 

if inStr(m, ChrW(124)&ChrW(108)&ChrW(117)&ChrW(124)) > 0 then
a = LCase(a) 
b = LCase(b) 
c = LCase(c) 
end if 
if inStr(a, b) = false or inStr(a, c) = false then
i = "" 
exit function 
end if 
if inStr(m, ChrW(124)&ChrW(49)&ChrW(124)) > 0 then
e = inStr(a, b) 
f = mid(a, e + len(b)) 
g = e + inStr(f, c) + len(b) + len(c) - 1
else
e = inStr(a, b) + len(b) 
f = mid(a, e) 

g = e + inStr(f, c) - 1 
end if 
h = g - e 
if h >= 0 then
i = mid(j, e, h) 
else
i = "" 
end if 
if inStr(m, ChrW(124)&ChrW(51)&ChrW(124)) > 0 then
i = k & i 
end if 
if inStr(m, ChrW(124)&ChrW(52)&ChrW(124)) > 0 then
i = i & l 
end if 
strCut = i 
end function 

function getStrCut(byVal a, byVal b, byVal c, byVal d)
getStrCut = strCut(a, b, c, d) 
end function 

Function cutStr(ByVal a, ByVal b, ByVal c)
Dim d, e, f 
f = 0
If c = "" Then c = ChrW(46)&ChrW(46)&ChrW(46) 
If LCase(c) = ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101) Or LCase(c) = ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108) Then c = "" 
cutStr = a 
For d = 1 To Len(a)
e = Asc(Mid(CStr(a), d, 1)) 
If e < 0 Then e = e + 65536 
If e < 255 Then f = f + 1 
If e > 255 Then f = f + 2 
If f >= b Then cutStr = Left(a, d) & c : Exit function 
Next 
End function 

function cutStrNOLU(a, b, c)
dim d, e, f, g, h 
b = LCase(b) 
c = LCase(c) 
e = LCase(a) 
cutStrNOLU=""
if inStr(e, b) > 0 then
f = inStr(e, b) 
d = mid(a, f) 
e = mid(d, len(b) + 1) 
h = mid(d, 1, len(b) + 1)
e = replace(e, ChrW(60), ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)) 

g = inStr(e, c) 
call echo(ChrW(110)&ChrW(69)&ChrW(110)&ChrW(100)&ChrW(76)&ChrW(101)&ChrW(110), g)  
d = mid(a, f, g + len(b)) 


cutStrNOLU = d 
end if 
end function 

function setCutTDStr(byVal a, byVal b, byVal c)
dim d, e, f, g, h, i 
a = CStr(a & "") 
if a = "" then setCutTDStr = a : exit function 
if b = "" then setCutTDStr = a : exit function
g = 0 : i = false 
h = int(cint(b) / 6.3) 
for d = 1 to len(a)
e = mid(a, d, 1) 
if g >= h then
i = true 
exit for 
else
f = f & e 
end if 
if asc(e) < 0 then
g = g + 2 
else
g = g + 1 
end if 
next 
if i = true then

f = ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34) & displayHtml(a) & ChrW(34)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58) & c & ChrW(59)&ChrW(34)&ChrW(62) & f & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62) 
end if 
setCutTDStr = f 
end function 

function cutTDStr(a, b)
cutTDStr = setCutTDStr(a, b, ChrW(35)&ChrW(70)&ChrW(66)&ChrW(69)&ChrW(51)&ChrW(69)&ChrW(70)) 
end function 

function getArrayList(byVal a, byVal b, byVal c, byVal d, byVal e, byVal f)

if isNull(a) = true or isNull(b) = true or isNull(c) = true then
getArrayList = "" 
exit function 
end if 
dim g, h, i, j 
a = replace(replace(a, chr(10), ChrW(12304)&ChrW(25442)&ChrW(34892)&ChrW(12305)), chr(13), ChrW(12304)&ChrW(25442)&ChrW(34892)&ChrW(12305))
set h = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
h.ignorecase = true 
h.global = true 
h.pattern = ChrW(40) & b & ChrW(41)&ChrW(46)&ChrW(43)&ChrW(63)&ChrW(40) & c & ChrW(41) 
set i = h.execute(a)
for each j in i
g = g & ChrW(36)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36) & j.value 
next 
set i = nothing 
if g = "" then
getArrayList = "" 
exit function 
end if 
g = right(g, len(g) - 7) 
if d = false then
h.pattern = b 
g = h.replace(g, "") 
end if 
if e = false then
h.pattern = c 
g = h.replace(g, "") 
end if 
set h = nothing 
if f = ChrW(49) or f = ChrW(21435)&ChrW(25481)&ChrW(23383)&ChrW(31526) then
g = replace(g, ChrW(34), "") 
g = replace(g, ChrW(39), "") 
g = replace(g, ChrW(32), "") 
g = replace(g, ChrW(40), "") 
g = replace(g, ChrW(41), "") 
end if 
getArrayList = g 
end function 

function getArrayNew( byval a, b, c, d, e) 
dim f,g,h,i,j
for  f = 0 to  999


i=instr(a, b)
j=instr(a, c)
if i  > 0 and j > 0 then     
g=mid(a,1,j-1)
a=mid(a,j+len(c))
g=mid(g,instr(g,b)+len(b)) 
if h <>"" then
h=h & ChrW(36)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)
end if 
if d=true then
g=b & g
end if
if e=true then
g=g & c
end if
h=h & g
else
exit for
end if
next    
getArrayNew = h
end function

function getArray(a, b, c, d, e)
getArray = getArrayList(a, b, c, d, e, "") 
end function 

function getArray1(a, b, c, d, e)
getArray1 = getArrayList(a, b, c, d, e, ChrW(21435)&ChrW(25481)&ChrW(23383)&ChrW(31526)) 
end function 

function getSplit(byVal a, byVal b, byVal c)
dim d 
d = split(a, b) 
getSplit = d(c) 
end function  

function getSplitCount(byVal a, byVal b)
dim c 
c = split(a, b) 
getSplitCount=0
getSplitCount = uBound(c) 
if getSplitCount > 0 then getSplitCount = getSplitCount + 1
end function 

function agent(byVal a)

server.scriptTimeout = 999 


dim b 
set b = createObject(ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(46)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(53)&ChrW(46)&ChrW(49))
b.open ChrW(71)&ChrW(69)&ChrW(84), a, false 
if request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(82)) <> "" then
b.setrequestheader ChrW(82)&ChrW(101)&ChrW(102)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(114), request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(82)) 
end if 
if request.cookies <> "" then
b.setrequestheader ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101), request.cookies 
end if 
b.setrequestheader ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(65)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116), request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(85)&ChrW(83)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(65)&ChrW(71)&ChrW(69)&ChrW(78)&ChrW(84)) 
b.setrequestheader ChrW(88)&ChrW(45)&ChrW(70)&ChrW(111)&ChrW(114)&ChrW(119)&ChrW(97)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(45)&ChrW(70)&ChrW(111)&ChrW(114), request.serverVariables(ChrW(82)&ChrW(69)&ChrW(77)&ChrW(79)&ChrW(84)&ChrW(69)&ChrW(95)&ChrW(65)&ChrW(68)&ChrW(68)&ChrW(82)) & ChrW(44)&ChrW(32) & request.serverVariables(ChrW(76)&ChrW(79)&ChrW(67)&ChrW(65)&ChrW(76)&ChrW(95)&ChrW(65)&ChrW(68)&ChrW(68)&ChrW(82)) 
b.setrequestheader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110), ChrW(67)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101) 
b.setrequestheader ChrW(78)&ChrW(117)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(45)&ChrW(65)&ChrW(116)&ChrW(107), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47) & request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(72)&ChrW(79)&ChrW(83)&ChrW(84)) & request.serverVariables(ChrW(83)&ChrW(67)&ChrW(82)&ChrW(73)&ChrW(80)&ChrW(84)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69)) & ChrW(63) & request.queryString 
b.setrequestheader ChrW(78)&ChrW(117)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(45)&ChrW(65)&ChrW(116)&ChrW(107)&ChrW(45)&ChrW(72)&ChrW(111)&ChrW(115)&ChrW(116), request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(72)&ChrW(79)&ChrW(83)&ChrW(84)) 
b.send 
response.status = b.status & ChrW(32) & b.statustext
response.contentType = b.getresponseheader(ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))
response.binaryWrite b.responsebody
end function


function handlUrlCanShu(a)
dim b, c, d, e, f, g 
c = split(a, ChrW(61)) 
for d = 0 to uBound(c)
e = c(d) 
if b <> "" then b = b & ChrW(61) 
if inStr(e, ChrW(38))>0 then
f = mid(e, 1, inStr(e, ChrW(38)) - 1) 
g = mid(e, inStr(e, ChrW(38))) 
e = escape(f) & g 
elseIf d = uBound(c) then
e = escape(e) 
end if 
b = b & e 
next 
handlUrlCanShu = b 
end function 

function handleStrCharSet(a)
if a = ChrW(49) or uCase(a) = ChrW(71)&ChrW(66)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) or a = "" then
a = ChrW(71)&ChrW(66)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) 
elseIf a = ChrW(48) or uCase(a) = ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56) then
a = ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56) 
elseIf a = ChrW(50) or uCase(a) = ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69) then
a = ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69) 
end if 
handleStrCharSet = a 
end function 

function urlEncoding(a)

a = replace(a, ChrW(49), ChrW(37)&ChrW(51)&ChrW(49)) 
a = replace(a, ChrW(48), ChrW(37)&ChrW(51)&ChrW(48)) 
a = replace(a, ChrW(65), ChrW(37)&ChrW(52)&ChrW(49)) 
a = replace(a, ChrW(25105), ChrW(37)&ChrW(67)&ChrW(69)&ChrW(37)&ChrW(68)&ChrW(50)) 
a = replace(a, ChrW(35), ChrW(37)&ChrW(50)&ChrW(51)) 

a = replace(a, ChrW(97), ChrW(37)&ChrW(54)&ChrW(49)) 
a = replace(a, ChrW(110), ChrW(37)&ChrW(54)&ChrW(69)) 
a = replace(a, ChrW(100), ChrW(37)&ChrW(54)&ChrW(52)) 
a = replace(a, ChrW(32), ChrW(37)&ChrW(50)&ChrW(48)) 
a = replace(a, ChrW(61), ChrW(37)&ChrW(51)&ChrW(68)) 
a = replace(a, ChrW(101), ChrW(37)&ChrW(54)&ChrW(53)) 
a = replace(a, ChrW(120), ChrW(37)&ChrW(55)&ChrW(56)) 
a = replace(a, ChrW(105), ChrW(37)&ChrW(54)&ChrW(57)) 
a = replace(a, ChrW(115), ChrW(37)&ChrW(55)&ChrW(51)) 
a = replace(a, ChrW(116), ChrW(37)&ChrW(55)&ChrW(52)) 
a = replace(a, ChrW(40), ChrW(37)&ChrW(50)&ChrW(56)) 
a = replace(a, ChrW(41), ChrW(37)&ChrW(50)&ChrW(57)) 
a = replace(a, ChrW(108), ChrW(37)&ChrW(54)&ChrW(67)) 
a = replace(a, ChrW(99), ChrW(37)&ChrW(54)&ChrW(51)) 
a = replace(a, ChrW(42), ChrW(37)&ChrW(50)&ChrW(65)) 
a = replace(a, ChrW(102), ChrW(37)&ChrW(54)&ChrW(54)) 
a = replace(a, ChrW(114), ChrW(37)&ChrW(55)&ChrW(50)) 
a = replace(a, ChrW(111), ChrW(37)&ChrW(54)&ChrW(70)) 
a = replace(a, ChrW(109), ChrW(37)&ChrW(54)&ChrW(68)) 
a = replace(a, ChrW(119), ChrW(37)&ChrW(55)&ChrW(55)) 
a = replace(a, ChrW(104), ChrW(37)&ChrW(54)&ChrW(56)) 
urlEncoding = a 
end function 
%>     
