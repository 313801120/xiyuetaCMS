<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


function saveRemoteFile(byVal a, byVal b)
on error resume next 
saveRemoteFile = 0 
dim c, d, e 
call handlePath(b)
set d = createObject(ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)) 
with d 
call .open(ChrW(71)&ChrW(101)&ChrW(116), a, false, "", "")
.send
if err then
saveRemoteFile = 9999 : exit function
end if
e =.responseBody
saveRemoteFile =.status
end with
set d = nothing
set c = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
with c
.type = 1
.open
call .write(e)


call .saveToFile(b, 2)
.cancel 
.close 
end with 
set c = nothing 
if err then
saveRemoteFile=9999
end if
if err then

call echoRed(ChrW(19979)&ChrW(36733)&ChrW(20986)&ChrW(38169),a & ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62) & b)
end if

end function 

function saveRemoteFile_WinHttp(a,b, c)
on error resume next 
dim d, e, f,g
dim h,i,j
call handlePath(b) 
set h = createObject(ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(46)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(53)&ChrW(46)&ChrW(49))
with h

if c = "" then
c = getwebsite(a)  
end if 

if d = "" then
d = ChrW(65)&ChrW(83)&ChrW(80)&ChrW(83)&ChrW(69)&ChrW(83)&ChrW(83)&ChrW(73)&ChrW(79)&ChrW(78)&ChrW(73)&ChrW(68)&ChrW(65)&ChrW(81)&ChrW(65)&ChrW(67)&ChrW(84)&ChrW(65)&ChrW(81)&ChrW(66)&ChrW(61)&ChrW(72)&ChrW(75)&ChrW(70)&ChrW(72)&ChrW(74)&ChrW(79)&ChrW(80)&ChrW(68)&ChrW(79)&ChrW(77)&ChrW(65)&ChrW(73)&ChrW(75)&ChrW(71)&ChrW(77)&ChrW(80)&ChrW(71)&ChrW(66)&ChrW(74)&ChrW(74)&ChrW(68)&ChrW(75)&ChrW(76)&ChrW(74)&ChrW(59) 
end if 

f = trim(f) 
if f = "" or f = ChrW(49) or f = ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) then
f = ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) 
else
f = ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56) 
end if 

.setTimeOuts 60000, 60000, 60000, 3000





.option(4) = 13056
.option(6) = false

.open ChrW(71)&ChrW(69)&ChrW(84), a, false 

.setRequestHeader ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(112)&ChrW(116), ChrW(42)&ChrW(47)&ChrW(42)
.setRequestHeader ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(112)&ChrW(116)&ChrW(45)&ChrW(76)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101), ChrW(122)&ChrW(104)&ChrW(45)&ChrW(99)&ChrW(110)&ChrW(44)&ChrW(122)&ChrW(104)
.setRequestHeader ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(65)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116), ChrW(77)&ChrW(111)&ChrW(122)&ChrW(105)&ChrW(108)&ChrW(108)&ChrW(97)&ChrW(47)&ChrW(54)&ChrW(46)&ChrW(48)
.setRequestHeader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(100)
.setRequestHeader ChrW(82)&ChrW(101)&ChrW(102)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(114), c
.setRequestHeader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110), ChrW(67)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101)


.setRequestHeader ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101), d
e = handlePostCookiesParame(e, ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116))

.send(e)
.waitForResponse








j =.responseBody 
saveRemoteFile_WinHttp =.Status   


if .Status=302 then
g=h.getresponseheader(ChrW(76)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
if getWebSite(g) <>"" and g <>a then

saveRemoteFile_WinHttp=saveRemoteFile_WinHttp(g,b, c)
exit function
else
saveRemoteFile_WinHttp=9999
exit function
end if

elseif .Status=301 then
saveRemoteFile_WinHttp=9999
exit function
end if
set i = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
with i
.type = 1 
.open 
call .write(j ) 


call .saveToFile(b, 2) 
.cancel 
.close 
end with 
set i = nothing 
if err then
saveRemoteFile_WinHttp=9999
end if
if err then

end if 
end with  
if err then
saveRemoteFile_WinHttp=9999
end if
end function

function getWinHttpCooke(a)
a.getresponseheader(ChrW(83)&ChrW(101)&ChrW(116)&ChrW(45)&ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101))
end function

function getHttpurl_WinHttp(a,b,c)

if b="" then 
b=ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)
end if
dim d, e, f
dim g,h,i

set g = createObject(ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(46)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(53)&ChrW(46)&ChrW(49))
with g

if c = "" then
c = getwebsite(a)  
end if 

if d = "" then
d = ChrW(65)&ChrW(83)&ChrW(80)&ChrW(83)&ChrW(69)&ChrW(83)&ChrW(83)&ChrW(73)&ChrW(79)&ChrW(78)&ChrW(73)&ChrW(68)&ChrW(65)&ChrW(81)&ChrW(65)&ChrW(67)&ChrW(84)&ChrW(65)&ChrW(81)&ChrW(66)&ChrW(61)&ChrW(72)&ChrW(75)&ChrW(70)&ChrW(72)&ChrW(74)&ChrW(79)&ChrW(80)&ChrW(68)&ChrW(79)&ChrW(77)&ChrW(65)&ChrW(73)&ChrW(75)&ChrW(71)&ChrW(77)&ChrW(80)&ChrW(71)&ChrW(66)&ChrW(74)&ChrW(74)&ChrW(68)&ChrW(75)&ChrW(76)&ChrW(74)&ChrW(59) 
end if 

f = trim(f) 
if f = "" or f = ChrW(49) or f = ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) then
f = ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) 
else
f = ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56) 
end if 

.setTimeOuts 60000, 60000, 60000, 3000





.option(4) = 13056
.option(6) = false

.open ChrW(71)&ChrW(69)&ChrW(84), a, false 

.setRequestHeader ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(112)&ChrW(116), ChrW(42)&ChrW(47)&ChrW(42)
.setRequestHeader ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(112)&ChrW(116)&ChrW(45)&ChrW(76)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101), ChrW(122)&ChrW(104)&ChrW(45)&ChrW(99)&ChrW(110)&ChrW(44)&ChrW(122)&ChrW(104)
.setRequestHeader ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(65)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116), ChrW(77)&ChrW(111)&ChrW(122)&ChrW(105)&ChrW(108)&ChrW(108)&ChrW(97)&ChrW(47)&ChrW(54)&ChrW(46)&ChrW(48)
.setRequestHeader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(100)
.setRequestHeader ChrW(82)&ChrW(101)&ChrW(102)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(114), c
.setRequestHeader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110), ChrW(67)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101)


.setRequestHeader ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101), d
e = handlePostCookiesParame(e, ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)) 

.send(e)
.waitForResponse
i =.responseBody 
getHttpurl_WinHttp =bytesToBstr(.responseBody, b) 
end with  
if err then
getHttpurl_WinHttp=9999
end if
end function

function downFile(a, b)
downFile = saveRemoteFile(a, b) 
end function 

function xmlGetStatus(byVal a)
on error resume next 
dim b 
set b = createObject(ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80))
with b
call .open(ChrW(71)&ChrW(101)&ChrW(116), a, false) 
call .setRequestHeader(ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108), ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)) 
call .setRequestHeader(ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(100)) 
call .send 
xmlGetStatus =.status 
end with 
set b = nothing 




end function 


function xmlPost(a, b)
dim c
c = handleXMLPost(a, b, ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50))
xmlPost=c(0) 
end function 

function utfXMLPost(a, b)
utfXMLPost = handleXMLPost(a, b, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))(0) 
end function 

function handleXMLPost(byVal a, byVal b, c)
dim d, dataArray(6), e 
c = handleStrCharSet(c) 
set d = createObject(ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80))
call d.open(ChrW(80)&ChrW(79)&ChrW(83)&ChrW(84), a, false) 
call d.setrequestheader(ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108), ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)) 
call d.setrequestheader(ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(100)) 
call d.setrequestheader(ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110), ChrW(99)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101)) 
call d.setrequestheader(ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(76)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(116)&ChrW(104), len(b))
call d.send(cStr(b))
if d.readystate <> 4 then
e = ChrW(101)&ChrW(114)&ChrW(114)&ChrW(111)&ChrW(114) 
else
e = bytesToBstr(d.responsebody, c) 

end if 
dataArray(0) = e 
dataArray(1) = d.status 
dataArray(2) = d.responsebody
handleXMLPost = dataArray 
set d = nothing 
end function 

function xmlGet(byVal a)
xmlGet = handleXmlGet(a, ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50))(0) 
end function 

function handleXmlGet(byVal a, b)

dim c, dataArray(1), d 

b = handleStrCharSet(b) 
set c = createObject(ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80))
call c.open(ChrW(71)&ChrW(101)&ChrW(116), a, false) 
call c.setrequestheader(ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108), ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)) 
call c.setrequestheader(ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(100)) 

call c.send 
if c.readystate <> 4 then
d = ChrW(101)&ChrW(114)&ChrW(114)&ChrW(111)&ChrW(114) 
else

d = bytesToBstr(c.responsebody, b) 

end if 
dataArray(0) = d 
dataArray(1) = c.status 
set c = nothing 
if err then
dataArray(0) = "" 
dataArray(1) = -1 
end if 
handleXmlGet = dataArray 
end function 

function cookiesPost(a, b)
cookiesPost = handleCookiesPost(a, b, ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)) 
end function 

function handleCookiesPost(a, b, c)
dim d, dataArray(1), e 
c = handleStrCharSet(c) 
b = ChrW(65)&ChrW(83)&ChrW(80)&ChrW(83)&ChrW(69)&ChrW(83)&ChrW(83)&ChrW(73)&ChrW(79)&ChrW(78)&ChrW(73)&ChrW(68)&ChrW(65)&ChrW(81)&ChrW(65)&ChrW(67)&ChrW(84)&ChrW(65)&ChrW(81)&ChrW(66)&ChrW(61)&ChrW(72)&ChrW(75)&ChrW(70)&ChrW(72)&ChrW(74)&ChrW(79)&ChrW(80)&ChrW(68)&ChrW(79)&ChrW(77)&ChrW(65)&ChrW(73)&ChrW(75)&ChrW(71)&ChrW(77)&ChrW(80)&ChrW(71)&ChrW(66)&ChrW(74)&ChrW(74)&ChrW(68)&ChrW(75)&ChrW(76)&ChrW(74)&ChrW(59) & b 
set d = createObject(ChrW(109)&ChrW(115)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(50)&ChrW(46)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80))
call d.open(ChrW(80)&ChrW(79)&ChrW(83)&ChrW(84), a, false) 

call d.setrequestheader(ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(100)) 

call d.setrequestheader(ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101), b) 
call d.send 
if d.readystate <> 4 then
e = ChrW(101)&ChrW(114)&ChrW(114)&ChrW(111)&ChrW(114) 
else
e = bytesToBstr(d.responsebody, c) 

end if 
dataArray(0) = e 
dataArray(1) = d.status 
set d = nothing 
handleCookiesPost = dataArray 
end function 



function getRemoteFileSize(a)
dim b 
set b = createObject(ChrW(77)&ChrW(83)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(50)&ChrW(46)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80))
with b
.open ChrW(103)&ChrW(101)&ChrW(116), a, false
call.setRequestHeader(ChrW(114)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(101), ChrW(98)&ChrW(121)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(61)&ChrW(45)&ChrW(49)) 
.send 
getRemoteFileSize = split(.getResponseHeader(ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(82)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(101)), ChrW(47))(1) 
end with 
set b = nothing 
end function 

sub popupDownFile(a)
dim b, c 
call handlePath(a)
response.clear 
set b = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
b.open 
b.type = 1 
call b.loadfromfile(a) 
c = inStrRev(a, ChrW(92)) + 1 
call response.addHeader( ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(68)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110), ChrW(97)&ChrW(116)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(59)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & mid(a, c) )
call response.addHeader ( ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(76)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(116)&ChrW(104), b.size )
response.charset = ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56) 
response.contentType = ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(111)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109) 
call response.binaryWrite( b.read )
response.flush 
response.write("") 
b.close 
set b = nothing 
end sub 

sub downRemoteFile(a)
call popupDownFile(a)
end sub 

function readFileTBase64(a) 
readFileTBase64 = imagesToBase64(a) 
end function

function imagesToBase64(a)
dim b 
dim c 
dim d 
dim e 
dim f 
dim g 
dim h 
dim i 


e = handlePath(a) 
i = mid(e, inStrRev(e, ChrW(46)) + 1) 
set g = createObject(ChrW(109)&ChrW(115)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(50)&ChrW(46)&ChrW(70)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(84)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(68)&ChrW(79)&ChrW(77)&ChrW(68)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116))

call g.loadxml(ChrW(60)&ChrW(63)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(32)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&ChrW(39)&ChrW(49)&ChrW(46)&ChrW(48)&ChrW(39)&ChrW(63)&ChrW(62)&ChrW(60)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(47)&ChrW(62)) 
set d = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if d.fileexists(e) then

set f = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
f.type = 1 
f.open 
call f.loadfromfile(e) 
g.documentelement.datatype = ChrW(98)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52) 
g.documentelement.nodetypedvalue = f.read 


set b = createObject(ChrW(109)&ChrW(115)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(50)&ChrW(46)&ChrW(70)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(84)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(68)&ChrW(79)&ChrW(77)&ChrW(68)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116))
call b.load(g) 
if b.readystate > 2 then
set c = b.getelementsbytagname(ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97))
h=ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(58)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47) & i & ChrW(59)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52)&ChrW(44)& replace(c.item(0).Text,chr(10),"")&ChrW(34)&ChrW(62)
h = ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(58)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47) & i & ChrW(59)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52)&ChrW(44) & vbCrLf & c.item(0).text
h = c.item(0).text 
else
h = "" 
end if 
set b = nothing
set f = nothing
else
h = "" 
end if 
set d = nothing
set g = nothing
imagesToBase64 = h 
end function

function handleSaveBase64(a)
dim b,c 
c=ChrW(59)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52)&ChrW(44)
b=instr(a,c)

if b>0 then
a=mid(a,b+len(c)) 
end if
handleSaveBase64=a
end function

function base64ToImages(a,byval b)
dim c 
a = handlePath(a) 
b=handleSaveBase64(b)
c = ChrW(60)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(62) & b & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(62) 
dim d : set d = createObject(ChrW(77)&ChrW(83)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(50)&ChrW(46)&ChrW(68)&ChrW(79)&ChrW(77)&ChrW(68)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116))
dim e : set e = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
d.resolveexternals = false 
call d.loadxml(c) 
call d.documentelement.setattribute(ChrW(120)&ChrW(109)&ChrW(108)&ChrW(110)&ChrW(115)&ChrW(58)&ChrW(100)&ChrW(116), ChrW(117)&ChrW(114)&ChrW(110)&ChrW(58)&ChrW(115)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(115)&ChrW(45)&ChrW(109)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)) 
d.documentelement.datatype = ChrW(98)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52) 
e.type = 1
e.open 
call e.write(d.documentelement.nodetypedvalue) 

call e.savetofile(a) 
e.close 
set d = nothing 
set e = nothing 
end function 


function getSqlInContent(a, b, c, d)
getSqlInContent = handleSqlIn(a, b, c, d, ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50))(0) 
end function 

function handleSqlIn(a, b, c, d, e)
dim f, g
c = LCase(c) 

if c = ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116) then
g = handleXMLPost(a, handlePostCookiesParame(b, ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)), e) 

elseIf c = ChrW(103)&ChrW(101)&ChrW(116) then
b = handlUrlCanShu(b)
g = handleXmlGet(a & b, e) 

elseIf c = ChrW(99)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115) then
g = handleCookiesPost(a, handlePostCookiesParame(b, ChrW(99)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115)), e) 
end if 
if CStr(d) = ChrW(48) then
g(0) = replace(g(0), ChrW(60), ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)) 
elseIf CStr(d) = ChrW(49) then
g(0) = replace(g(0), ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62), vbCrLf) 
g(0) = delHtml(g(0)) 
end if 
handleSqlIn = g 
end function 

function sqlInUrl(byVal a)
dim b, c, d 
sqlInUrl = false 
c = false : d = false 
set b = createObject(ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80))
with b
.open ChrW(71)&ChrW(69)&ChrW(84), a, false
.send 
if b.status <> 200 then
exit function 
end if 
call b.open(ChrW(71)&ChrW(69)&ChrW(84), a & ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(49)&ChrW(61)&ChrW(49), false)
.send 
c =.status 
call b.open(ChrW(71)&ChrW(69)&ChrW(84), a & ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(49)&ChrW(61)&ChrW(50), false)
.send("") 
d =.status 
end with 
set b = nothing 
if c = 200 and d = 500 then sqlInUrl = true 
end function 

function getWinHttp(a, b, c, d, e)
getWinHttp=handleGetWinHttp(a, b, c, d, e,ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))
end function
function handleGetWinHttp(byval a, byval b, byval c, byval d, byval e, byval f)
dim g, h,i,j,k
set g = createObject(ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(46)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(53)&ChrW(46)&ChrW(49))
with g

if b = "" then
b = getwebsite(a) 
end if 

if c = "" then
c = ChrW(65)&ChrW(83)&ChrW(80)&ChrW(83)&ChrW(69)&ChrW(83)&ChrW(83)&ChrW(73)&ChrW(79)&ChrW(78)&ChrW(73)&ChrW(68)&ChrW(65)&ChrW(81)&ChrW(65)&ChrW(67)&ChrW(84)&ChrW(65)&ChrW(81)&ChrW(66)&ChrW(61)&ChrW(72)&ChrW(75)&ChrW(70)&ChrW(72)&ChrW(74)&ChrW(79)&ChrW(80)&ChrW(68)&ChrW(79)&ChrW(77)&ChrW(65)&ChrW(73)&ChrW(75)&ChrW(71)&ChrW(77)&ChrW(80)&ChrW(71)&ChrW(66)&ChrW(74)&ChrW(74)&ChrW(68)&ChrW(75)&ChrW(76)&ChrW(74)&ChrW(59) 
end if 

e = trim(e) 
if e = "" or e = ChrW(49) or e = ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) then
e = ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) 
else
e = ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56) 
end if 

.setTimeOuts 160000, 160000, 160000, 13000





.option(4) = 13056
.option(6) = false

.open ChrW(71)&ChrW(69)&ChrW(84), a, false 

.setRequestHeader ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(112)&ChrW(116), ChrW(42)&ChrW(47)&ChrW(42)
.setRequestHeader ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(112)&ChrW(116)&ChrW(45)&ChrW(76)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101), ChrW(122)&ChrW(104)&ChrW(45)&ChrW(99)&ChrW(110)&ChrW(44)&ChrW(122)&ChrW(104)

.setRequestHeader ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(65)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116), ChrW(77)&ChrW(111)&ChrW(122)&ChrW(105)&ChrW(108)&ChrW(108)&ChrW(97)&ChrW(47)&ChrW(53)&ChrW(46)&ChrW(48)&ChrW(32)&ChrW(40)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(54)&ChrW(52)&ChrW(59)&ChrW(32)&ChrW(120)&ChrW(54)&ChrW(52)&ChrW(41)&ChrW(32)&ChrW(65)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(75)&ChrW(105)&ChrW(116)&ChrW(47)&ChrW(53)&ChrW(51)&ChrW(55)&ChrW(46)&ChrW(51)&ChrW(54)&ChrW(32)&ChrW(40)&ChrW(75)&ChrW(72)&ChrW(84)&ChrW(77)&ChrW(76)&ChrW(44)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(71)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(111)&ChrW(41)&ChrW(32)&ChrW(67)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(47)&ChrW(49)&ChrW(48)&ChrW(57)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(32)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(97)&ChrW(114)&ChrW(105)&ChrW(47)&ChrW(53)&ChrW(51)&ChrW(55)&ChrW(46)&ChrW(51)&ChrW(54)
.setRequestHeader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(100)
.setRequestHeader ChrW(82)&ChrW(101)&ChrW(102)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(114), b
.setRequestHeader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110), ChrW(67)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101)


.setRequestHeader ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101), c
d = handlePostCookiesParame(d, ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)) 

.send(d)
.waitForResponse



if f=ChrW(99)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115) then
i=.GetAllResponseHeaders & ChrW(59)
for j=1 to 20
if instr(i,ChrW(83)&ChrW(101)&ChrW(116)&ChrW(45)&ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(58)&ChrW(32))>0 then
k=getStrCut(i, ChrW(83)&ChrW(101)&ChrW(116)&ChrW(45)&ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(58)&ChrW(32),ChrW(59),0) 
h=h & k & ChrW(59)
i=replace(i,ChrW(83)&ChrW(101)&ChrW(116)&ChrW(45)&ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(58)&ChrW(32)&k&ChrW(59),"")
else
exit for
end if
next
else
h = bytesToBstr(.responseBody, e)   
end if




end with 
handleGetWinHttp = h 
end function

function getWinHttpCookies(a, b, c, d, e)
getWinHttpCookies=handleGetWinHttp(a, b, c, d, e,ChrW(99)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115))
end function
%>      
