<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%

function getHttpUrlState(a)
getHttpUrlState = handleGetHttpPage(a, "")(1) 
end function 

function getHttpUrlServerName(a)
getHttpUrlServerName = ""
end function 

function getHttpPage(byVal a, byVal b)
getHttpPage = handleGetHttpPage(a, b)(0)   
end function

function getURLContent(a, b)
getURLContent = getHttpPage(a, b) 
end function 

function getHttpUrl(a, b)
getHttpUrl = getHttpPage(a, b) 
end function 
function bytesToBstr(a, b)
dim c 
if isNul(a) then exit function
set c = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
c.type = 1 
c.mode = 3 
c.open 
call c.write(a) 
c.position = 0 
c.type = 2 
c.charset = b 
bytesToBstr = c.readtext 
c.close 
set c = nothing 
end function 

function handleGetHttpPage(byVal a, byVal b)
on error resume next 
dim c, d, e, f, g, h 
c = now() 
g = ChrW(124)&ChrW(45)&ChrW(42)&ChrW(121)&ChrW(112)&ChrW(105)&ChrW(97)&ChrW(61)&ChrW(124) 
b = handleStrCharSet(b) 
if isNull(a) = true or len(a) < 7 or a = ChrW(36)&ChrW(70)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(36) then
handleGetHttpPage = split("" & g & - 1 & g & e & g & h, g) 
exit function 
end if 
dim i 
set i = createObject(ChrW(77)&ChrW(83)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(50)&ChrW(46)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80))
call i.open(ChrW(71)&ChrW(69)&ChrW(84), a, false) 
i.send 
if i.readystate <> 4 then
set i = nothing 
handleGetHttpPage = split("" & g & i.readystate & g & e & g & h, g) 
exit function 
end if 
f = bytesToBstr(i.responsebody, b) 
d = i.status 
e = dateDiff(ChrW(115), c, now()) 
h = strLength(f) 
handleGetHttpPage = split(f & g & d & g & e & g & h, g) 
set i = nothing 
end function 
%>