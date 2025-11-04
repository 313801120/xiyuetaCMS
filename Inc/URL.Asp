<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 




























function getUrlDirName()
dim a,b,c,d
a=request.serverVariables(ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(95)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
b=split(a,ChrW(47))
for each c in b
if c <>"" and instr(c,ChrW(46))=false then
d=c
end if
next
getUrlDirName=d
end function

function getThisUrlFileParam()
dim a 
a = getUrl() 
a = mid(a, inStrRev(a, ChrW(47)) + 1) 
getThisUrlFileParam = a 
end function 

function getThisUrlNoParam()
dim a 
if LCase(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(83))) = ChrW(111)&ChrW(102)&ChrW(102) then
a = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47) 
else
a = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47) 
end if 
getThisUrlNoParam = a & request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(72)&ChrW(79)&ChrW(83)&ChrW(84)) & request.serverVariables(ChrW(83)&ChrW(67)&ChrW(82)&ChrW(73)&ChrW(80)&ChrW(84)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69)) 
end function 

function getGoToUrl()
getGoToUrl = request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(82)) 
end function 

function getGoToUrlNoParam()
dim a 
a = getGoToUrl() 
if inStr(a, ChrW(63)) > 0 then
a = mid(a, 1, inStr(a, ChrW(63)) - 1) 
end if 
getGoToUrlNoParam = a 
end function 

function getGoToUrlNoFileName()
dim a 
a = getGoToUrl() 
if right(a, 1) <> ChrW(47) then
if inStrRev(a, ChrW(47)) > 0 then
a = mid(getGoToUrlNoParam(), 1, inStrRev(getGoToUrlNoParam(), ChrW(47))) 
end if 
end if 
if right(a, 1) <> ChrW(47) then a = a & ChrW(47) 
getGoToUrlNoFileName = a 
end function 

function remoteUrlFileName(byval a)
if right(a, 1) <> ChrW(47) then
if inStrRev(a, ChrW(47)) > 0 then
a = mid(a, 1, inStrRev(a, ChrW(47))) 
end if 
end if 
remoteUrlFileName = a 
end function 

function remoteUrlParam(byval a)
if right(a, 1) <> ChrW(63) then
if inStrRev(a, ChrW(63)) > 0 then
a = mid(a, 1, inStrRev(a, ChrW(63)) - 1) 
end if 
end if 
remoteUrlParam = a 
end function 

function getUrlDir(byval a)
getUrlDir = getHandleUrlValue(a, ChrW(32593)&ChrW(22336)&ChrW(30446)&ChrW(24405)) 
end function 

function getIP2() 
on error resume next 
dim a, b, c 
a = request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(88)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(68)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)) 
b = request.serverVariables(ChrW(82)&ChrW(69)&ChrW(77)&ChrW(79)&ChrW(84)&ChrW(69)&ChrW(95)&ChrW(65)&ChrW(68)&ChrW(68)&ChrW(82)) 
c = IIF(isNul(a) or LCase(a) = ChrW(117)&ChrW(110)&ChrW(107)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(110), b, a) 
if inStr(c, ChrW(46)) = 0 then c = ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48) 
getIP2 = c 
end function 

function getIP()
on error resume next 
dim a 
if request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(88)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(68)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)) = "" or inStr(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(88)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(68)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)), ChrW(117)&ChrW(110)&ChrW(107)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(110)) > 0 then
a = request.serverVariables(ChrW(82)&ChrW(69)&ChrW(77)&ChrW(79)&ChrW(84)&ChrW(69)&ChrW(95)&ChrW(65)&ChrW(68)&ChrW(68)&ChrW(82)) 
elseIf inStr(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(88)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(68)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)), ChrW(44)) > 0 then
a = mid(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(88)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(68)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)), 1, inStr(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(88)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(68)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)), ChrW(44)) - 1) 
elseIf inStr(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(88)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(68)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)), ChrW(59)) > 0 then
a = mid(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(88)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(68)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)), 1, inStr(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(88)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(68)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)), ChrW(59)) - 1) 
else
a = request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(88)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(68)&ChrW(95)&ChrW(70)&ChrW(79)&ChrW(82)) 
end if 
getIP = trim(mid(a, 1, 30)) 
end function 

function getServicerIP()
getServicerIP = request.serverVariables(ChrW(76)&ChrW(79)&ChrW(67)&ChrW(65)&ChrW(76)&ChrW(95)&ChrW(65)&ChrW(68)&ChrW(68)&ChrW(82)) 
end function 

function getRemoteIP()
getRemoteIP = getServicerIP() 
end function 


function getHandleUrlValue(byval a, byval b)
b = ChrW(124) & b & ChrW(124) 
if instr(a, ChrW(58)&ChrW(47)&ChrW(47)) > 0 then
a = mid(a, instr(a, ChrW(58)&ChrW(47)&ChrW(47)) + 3) 
end if 

if instr(a, ChrW(47)) > 0 then
a = mid(a, instr(a, ChrW(47)) + 1) 
end if 
if instr(b, ChrW(124)&ChrW(32593)&ChrW(22336)&ChrW(30446)&ChrW(24405)&ChrW(124)) > 0 then
if instr(a, ChrW(47)) > 0 then
a = mid(a, 1, instrrev(a, ChrW(47)) - 1) 
end if 
else
if instr(a, ChrW(47)) > 0 then
a = mid(a, instrrev(a, ChrW(47)) + 1) 
end if 
if instr(a, ChrW(63)) > 0 then
a = mid(a, 1, instr(a, ChrW(63)) - 1) 
end if 
end if 
if instr(b, ChrW(124)&ChrW(21517)&ChrW(31216)&ChrW(124)) > 0 or instr(b, ChrW(124)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)) > 0 then
if instr(a, ChrW(46)) > 0 then
a = mid(a, 1, instrrev(a, ChrW(46)) - 1) 
end if 
end if 
getHandleUrlValue = a 
end function 

function handleHttpUrl(a)
dim b, c 
handleHttpUrl=""
if isNul(a) then exit function
a = replace(trim(a), ChrW(92), ChrW(47)) 
b = mid(a, 1, inStr(a, ChrW(58)) + 2) 
a = mid(a, inStr(a, ChrW(58)) + 3) 
a = replace(a, ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47), ChrW(12304)&ChrW(124)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(124)&ChrW(12305)) 
a = replace(a, ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47), ChrW(12304)&ChrW(124)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(124)&ChrW(12305)) 
a = replace(a, ChrW(102)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47), ChrW(12304)&ChrW(124)&ChrW(102)&ChrW(116)&ChrW(112)&ChrW(124)&ChrW(12305)) 
while inStr(a, ChrW(47)&ChrW(47)) > 0
a = replace(a, ChrW(47)&ChrW(47), ChrW(47)) 
wend 
a = replace(a, ChrW(12304)&ChrW(124)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(124)&ChrW(12305), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)) 
a = replace(a, ChrW(12304)&ChrW(124)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(124)&ChrW(12305), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47)) 
a = replace(a, ChrW(12304)&ChrW(124)&ChrW(102)&ChrW(116)&ChrW(112)&ChrW(124)&ChrW(12305), ChrW(102)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)) 
c = b & a 

if left(c, 2) = ChrW(47)&ChrW(34) then
c = mid(c, 3) 
end if 
if right(c, 2) = ChrW(47)&ChrW(34) then
c = mid(c, 1, len(c) - 2) 
end if 
handleHttpUrl = c 
end function 

function handleFileUrl(a)
if isNull(a) then
handleFileUrl=""
exit function
end if
a = replace(a, ChrW(47), ChrW(92)) 
dim b 
for b = 1 to 99
a = replace(a, ChrW(92)&ChrW(92), ChrW(92)) 
if inStr(a, ChrW(92)&ChrW(92)) = 0 then
exit for 
end if 
next 
handleFileUrl = a  
end function 

function handleUrlComplete(a)
dim b 
handleUrlComplete = a 
if inStr(a, ChrW(63)) > 0 then exit function

if right(a, 1) <> ChrW(47) then
if getWebSite(a)=a & ChrW(47) then
handleUrlComplete = a & ChrW(47) 
exit function 
end if 
end if 
b = mid(a, inStrRev(a, ChrW(47)) + 1) 
if b <> "" and inStr(b, ChrW(46)) = 0 then
handleUrlComplete = a & ChrW(47) 
end if 
end function 

function urlAddHttpUrl(a, b)
a = replace(a, ChrW(92), ChrW(47)) 
b = handleHttpUrl(b) 
if inStr(LCase(b), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)) = 0 and inStr(LCase(b), ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)) = 0 then
if right(a, 1) = ChrW(47) and left(b, 1) = ChrW(47) then
b = a & mid(b, 2) 
elseIf right(a, 1) <> ChrW(47) and left(b, 1) <> ChrW(47) then
b = a & ChrW(47) & b 
else
b = a & b 
end if 
end if 
urlAddHttpUrl = b  
end function 

function getPort()
dim a 
a = CStr(request.serverVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(80)&ChrW(79)&ChrW(82)&ChrW(84))) 
if a <> ChrW(56)&ChrW(48) and a <> ChrW(56)&ChrW(48)&ChrW(56)&ChrW(48) and a <> ChrW(52)&ChrW(52)&ChrW(51) and a <>"" then
a = ChrW(58) & a 
else
a = "" 
end if 
getPort = a 
end function
function getHttpOrHttps()
if CStr(request.serverVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(80)&ChrW(79)&ChrW(82)&ChrW(84)))  =ChrW(52)&ChrW(52)&ChrW(51) then
getHttpOrHttps = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47) 
else
getHttpOrHttps = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47) 
end if 
end function

function webDoMain()
webDoMain=getHttpOrHttps() &  request.serverVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69)) & getPort()  
end function 

function host()
host = getHttpOrHttps() & request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(72)&ChrW(79)&ChrW(83)&ChrW(84)) & ChrW(47) 
end function 

function httpHost()
httpHost = host() 
end function 

function getHost()
getHost = host() 
end function 

function getUrl()
getUrl = getThisUrl() 

end function 

function getThisUrl()
dim a 

a = request.serverVariables(ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(95)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 

if inStr(a, ChrW(58)) = 0 then
a = a & getPort() 
end if 
a = a & request.serverVariables(ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(95)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
if request.serverVariables(ChrW(81)&ChrW(85)&ChrW(69)&ChrW(82)&ChrW(89)&ChrW(95)&ChrW(83)&ChrW(84)&ChrW(82)&ChrW(73)&ChrW(78)&ChrW(71)) <> "" then a = a & ChrW(63) & request.serverVariables(ChrW(81)&ChrW(85)&ChrW(69)&ChrW(82)&ChrW(89)&ChrW(95)&ChrW(83)&ChrW(84)&ChrW(82)&ChrW(73)&ChrW(78)&ChrW(71)) 

getThisUrl = getHttpOrHttps() &   a 
end function 

function getThisUrlNoFileName()
dim a 
a = getThisUrl() 
if right(a, 1) <> ChrW(47) then
if inStrRev(a, ChrW(47)) > 0 then
a = mid(a, 1, inStrRev(a, ChrW(47))) 
end if 
end if 
getThisUrlNoFileName = a 
end function 

function getWebSiteName(byval a) 
dim b,c,d,e
d = ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(46)&ChrW(104)&ChrW(107)&ChrW(124)&ChrW(46)&ChrW(115)&ChrW(104)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(111)&ChrW(114)&ChrW(103)&ChrW(46)&ChrW(99)&ChrW(110) 
d = d & ChrW(124)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(124)&ChrW(46)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(124)&ChrW(46)&ChrW(111)&ChrW(114)&ChrW(103)&ChrW(124)&ChrW(46)&ChrW(116)&ChrW(118)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(99)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(116)&ChrW(119)&ChrW(124)&ChrW(58)&ChrW(56)&ChrW(49)&ChrW(124)&ChrW(58)&ChrW(57)&ChrW(57)&ChrW(124)&ChrW(46)&ChrW(98)&ChrW(105)&ChrW(122)&ChrW(124)&ChrW(46)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(124)&ChrW(46)&ChrW(104)&ChrW(107)&ChrW(124)&ChrW(46)&ChrW(117)&ChrW(115)&ChrW(124)&ChrW(46)&ChrW(108)&ChrW(97)&ChrW(124)&ChrW(46)&ChrW(103)&ChrW(108)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(124)&ChrW(46)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(118)&ChrW(105)&ChrW(112)&ChrW(124)&ChrW(46)&ChrW(112)&ChrW(119)&ChrW(124)&ChrW(46)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(46)&ChrW(119)&ChrW(105)&ChrW(107)&ChrW(105)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(111)&ChrW(124)&ChrW(46)&ChrW(108)&ChrW(117)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(109)&ChrW(124)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(124)&ChrW(46)&ChrW(120)&ChrW(121)&ChrW(122)&ChrW(124)&ChrW(46)&ChrW(119)&ChrW(97)&ChrW(110)&ChrW(103) 
b = split(d, ChrW(124)) 
a=a & ChrW(47)
for each c in b
if c <> "" then
c=c & ChrW(47)
e=inStr(a, c)
if  e> 0 then
a = mid(a,1,e-1)
exit for
end if 
end if 
next
e=instr(a,ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46))
if e>0 then
a=mid(a,e+4)
end if
e=instr(a,ChrW(58)&ChrW(47)&ChrW(47))
if e>0 then
a=mid(a,e+3)
end if
getWebSiteName=a
end function

function getWebSiteCleanName(byVal a)
dim b,c
b=getWebSite(a)
c=instr(b,ChrW(58)&ChrW(47)&ChrW(47))
if c>0 then
b=mid(b,c+3)
end if
b=replace(b,ChrW(47),"")
b=replace(b,ChrW(58),ChrW(45))
getWebSiteCleanName=b
end function

function getWebSite(byVal a)


dim b, c, d, e 
getWebSite=""
a=replace(replace(replace(a,ChrW(32),""),vbtab,""),ChrW(38)&ChrW(35)&ChrW(120)&ChrW(50)&ChrW(102)&ChrW(59),ChrW(47))
c = a 
b = trim(LCase(replace(a, ChrW(63), ChrW(47)))) 
b = replace(replace(b, ChrW(92), ChrW(47)), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47), "") 
if inStr(b, ChrW(47)) > 0 then b = mid(b, 1, inStr(b, ChrW(47)) - 1) 
b = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47) & b & ChrW(47) 
dim f, g, h 
a = replace(LCase(a), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47), "") 
e = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47) 

if instr(LCase(a), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47)) > 0 then
a = replace(LCase(a), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47), "") 
e = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47) 
end if 

if instr(a, ChrW(47)) > 0 then
a = mid(a, 1, instr(a, ChrW(47)) - 1) 
end if 
if inStr(a, ChrW(63)) > 0 then a = mid(a, 1, inStr(a, ChrW(63)) - 1) 
if left(a, 9) = ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(104)&ChrW(111)&ChrW(115)&ChrW(116) then
if inStr(a, ChrW(47)) > 0 then
a = mid(a, 1, inStr(a, ChrW(47)) - 1) 
else
a = ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(104)&ChrW(111)&ChrW(115)&ChrW(116) 
end if 
elseIf left(a, 8) = ChrW(49)&ChrW(57)&ChrW(50)&ChrW(46)&ChrW(49)&ChrW(54)&ChrW(56)&ChrW(46) or left(a, 9) = ChrW(49)&ChrW(50)&ChrW(55)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(49) or ubound(split(a,ChrW(46)))=3 then
a = a & ChrW(47) 
a =e & mid(a, 1, inStr(a, ChrW(47)) - 1) & ChrW(47) 
getWebSite = a : exit function 
else
f = split(a, ChrW(46)) 
if (inStr(a, ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)) > 0 and uBound(f) >= 2) or uBound(f) >= 1 then
if inStr(a, ChrW(47)) > 0 then
g = mid(a, 1, inStr(a, ChrW(47)) - 1) 
if g = getDianNumb(g) then
a = g 
end if 
end if 
else
a = ""
end if 
end if 
d = false
h = ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(46)&ChrW(104)&ChrW(107)&ChrW(124)&ChrW(46)&ChrW(115)&ChrW(104)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(111)&ChrW(114)&ChrW(103)&ChrW(46)&ChrW(99)&ChrW(110) 
h = h & ChrW(124)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(124)&ChrW(46)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(124)&ChrW(46)&ChrW(111)&ChrW(114)&ChrW(103)&ChrW(124)&ChrW(46)&ChrW(116)&ChrW(118)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(99)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(116)&ChrW(119)&ChrW(124)&ChrW(58)&ChrW(56)&ChrW(49)&ChrW(124)&ChrW(58)&ChrW(57)&ChrW(57)&ChrW(124)&ChrW(46)&ChrW(98)&ChrW(105)&ChrW(122)&ChrW(124)&ChrW(46)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(124)&ChrW(46)&ChrW(104)&ChrW(107)&ChrW(124)&ChrW(46)&ChrW(117)&ChrW(115)&ChrW(124)&ChrW(46)&ChrW(108)&ChrW(97)&ChrW(124)&ChrW(46)&ChrW(103)&ChrW(108)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(124)&ChrW(46)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(118)&ChrW(105)&ChrW(112)&ChrW(124)&ChrW(46)&ChrW(112)&ChrW(119)&ChrW(124)&ChrW(46)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(46)&ChrW(119)&ChrW(105)&ChrW(107)&ChrW(105)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(111)&ChrW(124)&ChrW(46)&ChrW(108)&ChrW(117)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(109)&ChrW(124)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(124)&ChrW(46)&ChrW(120)&ChrW(121)&ChrW(122)&ChrW(124)&ChrW(46)&ChrW(119)&ChrW(97)&ChrW(110)&ChrW(103) 
f = split(h, ChrW(124)) 
a=a & ChrW(47)
for each g in f
if g <> "" then
g=g & ChrW(47)
if inStr(a, g) > 0 then
a = e & left(a, inStr(a, g) + len(g) - 1) : d = true : exit for 
end if 
end if 
next 
getWebSite = left(a, 255)

if getWebSite = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(47) then getWebSite = ""
if d = false then
getWebSite = "" 
elseif instr(getWebSite,ChrW(44)) or instr(getWebSite,ChrW(12290))>0 then
getWebSite = "" 
end if 
end function 

function removeUrlPort(a)
dim b
b=split(a,ChrW(58))
if ubound(b)=2 then
a=b(0) & ChrW(58) & b(1) & ChrW(47)
end if
removeUrlPort=a
end function

function checkUrl(a)
checkUrl = IIF(getWebSite(a) = "", false, true) 
end function 

function checkHttpUrl(a)
checkHttpUrl = checkUrl(a) 
end function 

function isUrl(a)
isUrl = checkUrl(a) 
end function 

function isHttpUrl(a)
isHttpUrl = checkUrl(a)  
end function 

function batchFullHttpUrl(a,b)
dim c,d,e
c=split(b,vbcrlf) 
for each d in c 
d=fullHttpUrl(a, d) 
if e <>"" then
e=e & vbcrlf
end if
e=e & d
next
batchFullHttpUrl=e
end function


function fullHttpUrl(byVal a, byVal b)

fullHttpUrl=""
dim c, d, e, f, g, h, i, j, k, l, m, n, o 
dim p, q 
a = phpTrim(a)
b = phpTrim(b)
o = lcase(b)
if b = "" then fullHttpUrl = "" : exit function
if trim(a) = "" then fullHttpUrl = b : exit function
a = replace(a, ChrW(92), ChrW(47))
b = replace(b, ChrW(92), ChrW(47))

if left(b, 2) = ChrW(47)&ChrW(47) then
fullHttpUrl = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58) & b
exit function   
end if 

b = hanldeStyleBackgroundUrl(b, p, q) 
c = getWebSite(a)
l = c
m = getWebSite(b)
if right(c, 1) = ChrW(47) then c = left(c, len(c) - 1) 
d = left(a, inStrRev(a, ChrW(47)))
e = split(a, ChrW(47)) 
for f = 0 to uBound(e)
if f + 1 = uBound(e) then i = h
if f + 2 = uBound(e) then j = h
if f + 3 = uBound(e) then k = h
g = e(f) 
h = h & g & ChrW(47)
next  
b = trim(b)
dim r
r=e(ubound(e))
if instr(ChrW(47) & b,ChrW(47)&ChrW(63))>0 then
if instr(r,ChrW(63))>0 then
r=mid(r,1,instr(r,ChrW(63))-1)
d=d & r
elseif instr(r,ChrW(46))>0 then
d=d & r
end if
end if
n = false
if b <> "" and inStr(left(b, 10), ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)) = 0 and inStr(left(b, 10), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)) = 0 and inStr(left(b, 10), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47)) = 0 then
n = true 
if l <> m then
if l = replace(m, ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)) then
n = false 
if inStr(LCase(b), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)) > 0 then
b = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46) & right(b, len(b) - 7) 
else
b = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46) & b 
end if 
end if 
end if 
end if 

if n = true then
if left(b, 1) = ChrW(47) then
b=mid(b,2)
for f=1 to 9
if left(b,3) <>ChrW(46)&ChrW(46)&ChrW(47) then
b=ChrW(47) & b
exit for
end if
b=mid(b,4)
next
b = c & b
elseIf left(b, 3) = ChrW(46)&ChrW(46)&ChrW(47) or left(b, 2) = ChrW(46)&ChrW(47) then
if left(b, 2) = ChrW(46)&ChrW(47) then
b=mid(b, 3) 
end if
for f=1 to 9
if left(b,3) <>ChrW(46)&ChrW(46)&ChrW(47) then 
exit for
end if
if len(d) <>len(getWebSite(a)) then 
d=mid(d,1,len(d)-1)
d=mid(d,1,instrrev(d,ChrW(47))) 
end if
b=mid(b,4)
next
b = d & b 
else
b = d & b 
end if 
end if 
if inStr(LCase(b), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)) = 0 and inStr(LCase(b), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47)) = 0 then
if inStr(LCase(a), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)) > 0 and inStr(LCase(b), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)) = 0 then
b = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47) & b 
elseIf inStr(LCase(a), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47)) > 0 and inStr(LCase(b), ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47)) = 0 then
b = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47) & b 
end if 
end if
fullHttpUrl = p & b & q 

end function 

function hanldeStyleBackgroundUrl(byval a, b, c)
dim d 
a = phpTrim(a)
d = lcase(a) 
a = replace(a, ChrW(92), ChrW(47))
if (instr(a, ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)) > 0 or instr(a, ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)) > 0) and instr(a, ChrW(40)) > 0 and instr(a, ChrW(41)) > 0 then
b = mid(a, 1, instr(a, ChrW(40))) 
c = mid(a, instr(a, ChrW(41))) 
a = mid(a, len(b) + 1) 
a = phptrim(mid(a, 1, instr(a, ChrW(41)) - 1)) 
a = replace(replace(a, ChrW(39), ""), ChrW(34), "") 
end if 
hanldeStyleBackgroundUrl = a 
end function 

function uRLJianJieHandle(byVal a)
a = replace(a, ChrW(38)&ChrW(97)&ChrW(109)&ChrW(112)&ChrW(59), ChrW(38)) 
uRLJianJieHandle = a 
end function 

function urlToAsc(a)
dim b
urlToAsc=""
for b = 1 to len(a)
urlToAsc = urlToAsc & ChrW(37) & hex(ascW(mid(a, b, 1))) 
next 
end function 

function getWebTitle(a)
getWebTitle = getStrCut(a, ChrW(60)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(62), ChrW(60)&ChrW(47)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(62), 0) 
end function 

function getContentAHref(a, b, byref c, byref d)
dim e, f, g, h, i, j, k 
for e = 1 to len(b)
f = mid(b, e, 1) 
if f = ChrW(60) then
g = LCase(mid(b, e)) 
h = LCase(mid(g, 1, inStr(g, ChrW(32)))) 
if h = ChrW(60)&ChrW(97)&ChrW(32) then
j = mid(g, 1, inStr(g, ChrW(60)&ChrW(47)) + 2) 
i = len(j) - 1 
k = k & handleLink(a, j, ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102), "", ChrW(117)&ChrW(114)&ChrW(108), c, d) & vbCrLf 
e = e + i 
end if 
end if 
doEvents 
next 
if k <> "" then k = left(k, len(k) - 2) 
getContentAHref = k 
end function 

function getContentImgSrc(a, b, byref c, byref d)
dim e, f, g, h, i, j, k 
for e = 1 to len(b)
f = mid(b, e, 1) 
if f = ChrW(60) then
g = LCase(mid(b, e)) 
h = LCase(mid(g, 1, inStr(g, ChrW(32)))) 
if h = ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32) then
j = mid(g, 1, inStr(g, ChrW(62))) 
i = len(j) - 1 

k = k & handleLink(a, j, ChrW(115)&ChrW(114)&ChrW(99), "", ChrW(117)&ChrW(114)&ChrW(108), c, d) & vbCrLf 
e = e + i 
end if 
end if 
doEvents 
next 
if k <> "" then k = left(k, len(k) - 2) 
getContentImgSrc = k 
end function 

function replaceContentJsDir(a, b, byref c, byref d)
dim e, f, g 
e = split(a, vbCrLf) 
for each f in e
if g <> "" then g = g & vbCrLf 
if inStr(f, ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)) > 0 and inStr(f, ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)) > 0 then
f = handleLink(b, f, ChrW(115)&ChrW(114)&ChrW(99), "", ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(68)&ChrW(105)&ChrW(114), c, d) 
end if 
g = g & f 
next 
replaceContentJsDir = g 
end function 

function getEndUrlHandleName(a)
dim b 
b = replace(trim(a), ChrW(92), ChrW(47)) 
if right(b, 1) = ChrW(47) then b = mid(b, 1, len(b) - 1) 
b = mid(b, inStrRev(b, ChrW(47)) + 1) 
getEndUrlHandleName = b 
end function 

function getUrlListInWebSiteList(a)
dim b, c, d 
d = split(a, vbCrLf) 
for each b in d
b = getWebSite(b) 
if b <> "" and inStr(vbCrLf & c & vbCrLf, vbCrLf & b & vbCrLf) = 0 then
c = c & b & vbCrLf 
end if 
doevents 
next 
getUrlListInWebSiteList = c 
end function 

function getThisUrlFileName()
dim a 
a = request.serverVariables(ChrW(83)&ChrW(67)&ChrW(82)&ChrW(73)&ChrW(80)&ChrW(84)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69)) 
if left(a, 1) = ChrW(47) then a = right(a, len(a) - 1) 
getThisUrlFileName = a 
end function 

function handleWebHtmlImg(a, b, byref c, byref d)
dim e, f, g, h 
dim i, j 
e = getContentImgSrc("", b, c, d) 
f = split(e, vbCrLf) 
for each g in f
if g <> "" then
h = handleHttpUrl(g) 
if inStr(h, ChrW(47)) > 0 then
h = mid(h, inStrRev(h, ChrW(47)) + 1) 
end if 
h = a & h 

i = ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(34) : j = ChrW(34) 
if inStr(b, i) > 0 and inStr(b, j) > 0 then
b = regExp_Replace(b, i & g & j, i & h & j) 
end if 
i = ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(39) : j = ChrW(39) 
if inStr(b, i) > 0 and inStr(b, j) > 0 then
b = regExp_Replace(b, i & g & j, i & h & j) 
end if 
end if 
next 
handleWebHtmlImg = b 
end function  

function handleWebCssImg(a, b)
dim c, d, e, f, g, h, i 
c = ChrW(117)&ChrW(114)&ChrW(108)&ChrW(92)&ChrW(40) 
d = ChrW(92)&ChrW(41) 
e = getArray(b, c, d, false, false) 

f = split(e, ChrW(36)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)) 
for each h in f
if h <> "" then
i = handleHttpUrl(h) 
if inStr(i, ChrW(47)) > 0 then
i = mid(i, inStrRev(i, ChrW(47)) + 1) 
end if 
i = a & i 
c = ChrW(117)&ChrW(114)&ChrW(108)&ChrW(40) 
d = ChrW(41) 
if inStr(b, c) > 0 and inStr(b, d) > 0 then

b = regExp_Replace(b, c & h & d, c & i & d) 
end if 
end if 
next 
handleWebCssImg = b 
end function 

function batchHandleUrlIntegrity(a, b)
dim c, d, e 
c = split(b, vbCrLf) 
for each d in c
if d <> "" then
d = fullHttpUrl(a, d) 
if inStr(vbCrLf & e & vbCrLf, vbCrLf & d & vbCrLf) = 0 then
e = e & d & vbCrLf 
end if 
end if 
next 
batchHandleUrlIntegrity = e 
end function 

function replaceContentImagePath(a, b)
dim c, d, e, f 
a = handleHttpUrl(a) 
if right(a, 1) <> ChrW(47) then a = a & ChrW(47) 
e = getDirFileNameList(a, "") 
f = split(e, vbCrLf) 
for each c in f
if c <> "" then
d = ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(47) & a & c 

b = replace(b, ChrW(34) & c & ChrW(34), ChrW(34) & d & ChrW(34)) 
b = replace(b, ChrW(39) & c & ChrW(39), ChrW(34) & d & ChrW(34)) 
b = replace(b, ChrW(61) & c & ChrW(32), ChrW(34) & d & ChrW(34)) 
b = replace(b, ChrW(61) & c & ChrW(62), ChrW(34) & d & ChrW(34)) 

b = replace(b, ChrW(40) & c & ChrW(41), ChrW(40) & d & ChrW(41)) 
b = replace(b, ChrW(40) & c & ChrW(59), ChrW(40) & d & ChrW(59)) 
end if 
next 
replaceContentImagePath = b 
end function 

function getCssLinkList(byVal a)
dim b, c, d, e, f, g 
b = ChrW(60)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107) : c = ChrW(47)&ChrW(62) 
a = getArray(a, b, c, false, false) 
d = split(a, ChrW(36)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)) 
for each e in d
if inStr(LCase(e), ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(101)&ChrW(101)&ChrW(116)) > 0 then
g = strCut(e, ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34), ChrW(34), 2) 
call echo(g, e) 
f = f & g & vbCrLf 
end if 
next 
getCssLinkList = f 
end function 

function getHtmlBackGroundUrlList(a)
dim b, c, d, e, f, g, h, i, j, k 
for b = 1 to len(a)
c = mid(a, b, 1) 
if c = ChrW(60) then
d = mid(a, b) 
e = LCase(d) 
h = mid(d, 1, inStr(d, ChrW(62))) 
f = LCase(mid(e, 1, inStr(e, ChrW(32)))) 
if inStr(h, ChrW(117)&ChrW(114)&ChrW(108)&ChrW(40)) > 0 then
j = ChrW(117)&ChrW(114)&ChrW(108)&ChrW(40) : k = ChrW(41) 
i = i & strCut(h, j, k, 2) & vbCrLf 
b = b + g 
end if 
end if 
doEvents 
next 
getHtmlBackGroundUrlList = i 
end function 

function getImgUrlList(a)
dim b, c, d, e, f, g, h, i 
for b = 1 to len(a)
c = mid(a, b, 1) 
if c = ChrW(60) then
d = mid(a, b) 
e = LCase(d) 
h = mid(d, 1, inStr(d, ChrW(62))) 
f = LCase(mid(e, 1, inStr(e, ChrW(32)))) 
if f = ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32) then
i = i & getLinkUrl(h, ChrW(115)&ChrW(114)&ChrW(99)) & vbCrLf 
b = b + g 
end if 
end if 
doEvents 
next 
getImgUrlList = i 
end function 

function getLinkUrl(byVal a, b)
dim c, d, e, f 
a = replace(replace(a, ChrW(61)&ChrW(32), ChrW(61)), ChrW(61)&ChrW(32), ChrW(61)) 
a = replace(replace(a, ChrW(32)&ChrW(61), ChrW(61)), ChrW(32)&ChrW(61), ChrW(61)) 
c = LCase(a) 
getLinkUrl=""
d = b & ChrW(61)&ChrW(34) 
e = ChrW(34) 
if inStr(c, d) > 0 and inStr(c, e) > 0 then
f = strCut(c, d, e, 2) 
getLinkUrl = f 
end if 
end function 

function localUrlOrRemoteUrl(a, b)
dim c 
b = false 
a = trim(a) 
c = replace(a, ChrW(92), ChrW(47)) 
if left(LCase(c), 7) = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47) or left(LCase(c), 4) = ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46) or left(LCase(c), 4) = ChrW(91)&ChrW(32593)&ChrW(22336)&ChrW(93) then
b = true 
end if 
if b = false then
a = setFileName(a) 
end if 
localUrlOrRemoteUrl = a 
end function 

function checkRemoteUrl(a)
dim b 
a = trim(a) 
b = replace(unSetFileName(a), ChrW(92), ChrW(47)) 
checkRemoteUrl = false 
if left(LCase(b), 7) = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47) or left(LCase(b), 4) = ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46) or left(LCase(b), 4) = ChrW(91)&ChrW(32593)&ChrW(22336)&ChrW(93) then
if left(LCase(b), 4) = ChrW(91)&ChrW(32593)&ChrW(22336)&ChrW(93) then
a = mid(a, inStr(a, ChrW(91)&ChrW(32593)&ChrW(22336)&ChrW(93)) + 1) 
end if 
checkRemoteUrl = true 
end if 
end function 



function asaiLinkAdd(a)
dim b 
a = ChrW(32) & a 
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.ignorecase = true
b.global = true

b.pattern = ChrW(40)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(40)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(45)&ChrW(93)&ChrW(43)&ChrW(92)&ChrW(46)&ChrW(41)&ChrW(43)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(45)&ChrW(93)&ChrW(43)&ChrW(40)&ChrW(47)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(45)&ChrW(32)&ChrW(46)&ChrW(47)&ChrW(63)&ChrW(37)&ChrW(38)&ChrW(61)&ChrW(93)&ChrW(42)&ChrW(41)&ChrW(63)&ChrW(41) 
a = b.replace(a, ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(36)&ChrW(49)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62)&ChrW(36)&ChrW(49)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 

b.pattern = ChrW(40)&ChrW(91)&ChrW(94)&ChrW(40)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(92)&ChrW(47)&ChrW(92)&ChrW(47)&ChrW(41)&ChrW(93)&ChrW(41)&ChrW(40)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(92)&ChrW(46)&ChrW(40)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(45)&ChrW(93)&ChrW(43)&ChrW(92)&ChrW(46)&ChrW(41)&ChrW(43)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(93)&ChrW(43)&ChrW(40)&ChrW(92)&ChrW(47)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(45)&ChrW(93)&ChrW(43)&ChrW(41)&ChrW(42)&ChrW(91)&ChrW(92)&ChrW(47)&ChrW(93)&ChrW(63)&ChrW(40)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(45)&ChrW(93)&ChrW(43)&ChrW(92)&ChrW(46)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(93)&ChrW(43)&ChrW(41)&ChrW(63)&ChrW(40)&ChrW(92)&ChrW(63)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(93)&ChrW(43)&ChrW(61)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(93)&ChrW(43)&ChrW(40)&ChrW(38)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(93)&ChrW(43)&ChrW(61)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(93)&ChrW(43)&ChrW(41)&ChrW(42)&ChrW(41)&ChrW(63)&ChrW(41) 
a = b.replace(a, ChrW(36)&ChrW(49)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(36)&ChrW(50)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62)&ChrW(36)&ChrW(50)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 

b.pattern = ChrW(40)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(111)&ChrW(58)&ChrW(41)&ChrW(63)&ChrW(40)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(93)&ChrW(43)&ChrW(64)&ChrW(40)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(45)&ChrW(93)&ChrW(43)&ChrW(92)&ChrW(46)&ChrW(41)&ChrW(43)&ChrW(91)&ChrW(92)&ChrW(119)&ChrW(93)&ChrW(43)&ChrW(41) 
a = b.replace(a, ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(111)&ChrW(58)&ChrW(36)&ChrW(50)&ChrW(39)&ChrW(62)&ChrW(36)&ChrW(49)&ChrW(36)&ChrW(50)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
set b = nothing 
asaiLinkAdd = replace(trim(a), ChrW(32)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62), "") 
asaiLinkAdd = replace(trim(a), ChrW(32)&ChrW(59)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62), "") 
asaiLinkAdd = replace(trim(a), ChrW(32)&ChrW(65307)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62), "") 
end function 



function asaiLinkDel(a)
dim b 
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.ignorecase = true 
b.global = true 
b.pattern = ChrW(60)&ChrW(97)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(43)&ChrW(62)&ChrW(40)&ChrW(46)&ChrW(43)&ChrW(63)&ChrW(41)&ChrW(60)&ChrW(92)&ChrW(47)&ChrW(97)&ChrW(62) 
asaiLinkDel = b.replace(a, ChrW(36)&ChrW(49)) 
end function

function iswww(a)
iswww = false 
dim b, c 
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.pattern = ChrW(94)&ChrW(92)&ChrW(119)&ChrW(43)&ChrW(40)&ChrW(40)&ChrW(45)&ChrW(92)&ChrW(119)&ChrW(43)&ChrW(41)&ChrW(124)&ChrW(40)&ChrW(92)&ChrW(46)&ChrW(92)&ChrW(119)&ChrW(43)&ChrW(41)&ChrW(41)&ChrW(42)&ChrW(91)&ChrW(65)&ChrW(45)&ChrW(90)&ChrW(97)&ChrW(45)&ChrW(122)&ChrW(48)&ChrW(45)&ChrW(57)&ChrW(93)&ChrW(43)&ChrW(40)&ChrW(40)&ChrW(92)&ChrW(46)&ChrW(124)&ChrW(45)&ChrW(41)&ChrW(91)&ChrW(65)&ChrW(45)&ChrW(90)&ChrW(97)&ChrW(45)&ChrW(122)&ChrW(48)&ChrW(45)&ChrW(57)&ChrW(93)&ChrW(43)&ChrW(41)&ChrW(42)&ChrW(92)&ChrW(46)&ChrW(91)&ChrW(65)&ChrW(45)&ChrW(90)&ChrW(97)&ChrW(45)&ChrW(122)&ChrW(93)&ChrW(43)&ChrW(36) 
b.ignorecase = true 
set c = b.execute(a)
if c.count then iswww = true 
end function






function getUrlAddToParam(byVal a, byVal b, c)
dim d, e, f, g, h, i, j, k 
dim l
dim m
dim n
dim o
dim p
b = handleHttpUrl(b) 

a = trim(a) 

if right(a, 1) = ChrW(63) or right(a, 1) = ChrW(38) then
a = trim(mid(a, 1, len(a) - 1)) 
end if 

b = trim(b) 

if left(b, 1) = ChrW(63) or left(b, 1) = ChrW(38) then
b = trim(mid(b, 2)) 
end if 

if a = "" then getUrlAddToParam = ChrW(63) & b : exit function 
i = a 
if inStr(a, ChrW(63)) > 0 then
i = mid(a, 1, inStr(a, ChrW(63)) - 1)
k = getWebSite(a)
l = mid(a, inStr(a, ChrW(63)) + 1) 
i = handleHttpUrl(i) 
if right(i, 1) <> ChrW(47) then
j = mid(i, inStrRev(i, ChrW(47)) + 1) 
i = left(i, len(i) - len(j)) 

end if 
end if 

if LCase(c) = ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101) or c = ChrW(26367)&ChrW(25442) then
d = b & ChrW(38) & l 

if inStr(b, ChrW(63)) > 0 then
j = mid(b, 1, inStr(b, ChrW(63)) - 1) 

end if 
elseIf (LCase(c) <> ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101) or LCase(c) <> ChrW(100)&ChrW(101)&ChrW(108)) then
d = l & ChrW(38) & b 
end if 
d = replace(d, ChrW(63), ChrW(38)) 

if LCase(c) = ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101) or LCase(c) = ChrW(100)&ChrW(101)&ChrW(108) then
e = split(LCase(b), ChrW(38)) : b = ChrW(38) 
for each g in e
if inStr(g, ChrW(61))>0 then
g = mid(g, 1, inStr(g, ChrW(61)) - 1) 
end if 
if g <> "" then
b = b & g & ChrW(38) 
end if 
next 

end if 

e = split(d, ChrW(38)) 
for each g in e
if inStr(g, ChrW(61)) > 0 then
f = split(g, ChrW(61)) 
m = f(0) 
n=""

n = f(1) 

p = true 
if LCase(c) = ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101) or LCase(c) = ChrW(100)&ChrW(101)&ChrW(108) then
if inStr(ChrW(38) & b & ChrW(38), ChrW(38) & LCase(m) & ChrW(38)) > 0 then
p = false 
end if 
end if 
if inStr(ChrW(124) & o & ChrW(124), ChrW(124) & LCase(m) & ChrW(124)) = 0 and p = true then
o = o & LCase(m) & ChrW(124) 
h = h & IIF(h = "", ChrW(63), ChrW(38)) 
h = h & m & ChrW(61) & n 
end if 
end if 
next 
h = j & h 
if getWebSite(h) = "" then
if left(b, 1) = ChrW(47) then
h = k & h 
else
h = i & h 
end if 
end if 
h = replace(h, ChrW(92), ChrW(47))
getUrlAddToParam = h 
end function 

function groupUrl(a, b)
dim c, d 
c = ChrW(47) 
a = replace(a, IIF(c = ChrW(47), ChrW(92), ChrW(47)), c) 
b = replace(b, IIF(c = ChrW(47), ChrW(92), ChrW(47)), c) 
a = phptrim(a) 
b = phptrim(b) 
for d = 0 to 99
if right(a, 1) = c then
a = mid(a, 1, len(a) - 1) 
else
exit for 
end if 
next 
for d = 0 to 99
if left(b, 1) = c then
b = mid(b, 2) 
else
exit for 
end if 
next 
groupUrl = a & c & b 
end function 

Function GetCurrentParams()
Dim a, b
a = ""

For each b In Request.QueryString
If b <> ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) Then
If a <> "" Then a = a & ChrW(38)
a = a & b & ChrW(61) & Server.URLEncode(Request.QueryString(b))
End if
Next
If a <> "" Then
GetCurrentParams = ChrW(63) & a
Else
GetCurrentParams = ChrW(63)
End if
End function

function handlePostCookiesParame(a, b)
dim c, d, e, f, g 
c = split(a, ChrW(38)) 
for each d in c
if inStr(d, ChrW(61)) > 0 then
f = mid(d, 1, inStr(d, ChrW(61))) 
g = mid(d, inStr(d, ChrW(61)) + 1) 
if LCase(b) = ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116) or b = "" then
if e <> "" then 
e = e & ChrW(38)
end if
g = escape(g) 
elseIf LCase(b) = ChrW(99)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115) or LCase(b) = ChrW(99)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101) then
if e <> "" then e = e & ChrW(59) 
g = URLEncoding(g) 
end if 
e = e & f & g 

end if 
next 
handlePostCookiesParame = e 
end function 

function remoteHttpUrlParameter(a)
dim b, c, d, e, f 

if inStr(a, ChrW(63)) = 0 then
remoteHttpUrlParameter = a 
exit function 
end if 
b = split(a, ChrW(38)) 
for each c in b
if inStr(c, ChrW(61)) > 0 then
e = mid(c, 1, inStr(c, ChrW(61))) 
f = mid(c, inStr(c, ChrW(61)) + 1) 
if d <> "" then d = d & ChrW(38) 
d = d & e 
end if 
next 
remoteHttpUrlParameter = d 
end function 


function checkUrlName(a)
dim b, c, d 
a = LCase(a)
d = LCase(request.serverVariables(ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(95)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) 
b = split(a, ChrW(124)) 
for each c in b
if c <> "" then
if inStr(d, c) > 0 then
checkUrlName = true 
exit function 
end if 
end if 
next 
checkUrlName = false 
end function 










function handleHttpUrlArray(byVal a)

dim b, c, d, e, f, g, h 
a = handleHttpUrl(a) 
b = mid(a, 1, inStrRev(a, ChrW(47))) 
e = mid(a, inStrRev(a, ChrW(47)) + 1) : c = e 
if inStr(e, ChrW(63)) > 0 then
c = mid(e, 1, inStr(e, ChrW(63)) - 1) 
end if 
d = mid(c, inStrRev(c, ChrW(46)) + 1) 
f = mid(a, 1, inStr(a, ChrW(58)) - 1) 
g = getWebSite(a) 


if g <> "" then
h = mid(b, len(g)) 
else
call echoYellowB(ChrW(27880)&ChrW(24847)&ChrW(65306)&ChrW(19981)&ChrW(26159)&ChrW(26377)&ChrW(25928)&ChrW(32593)&ChrW(22336), a) 
end if 

dim i 
i = split(a & vbCrLf & b & vbCrLf & c & vbCrLf & d & vbCrLf & e & vbCrLf & f & vbCrLf & g & vbCrLf & h, vbCrLf) 
handleHttpUrlArray = i 
end function 

function remoteJsCssParam(a, b)
remoteJsCssParam = handleRemoteJsCssParam(a, b, ChrW(124)&ChrW(26367)&ChrW(25442)&ChrW(20869)&ChrW(23481)&ChrW(124)&ChrW(26367)&ChrW(25442)&ChrW(32593)&ChrW(22336)) 
end function 

function handleRemoteJsCssParam(a, b, c)
dim d, e, f, g, h, i, j, k 
c = ChrW(124) & c & ChrW(124) 
d = split(b, vbCrLf) 
for each f in d
if f <> "" then
if e <> "" then e = e & vbCrLf 
g = handleHttpUrlArray(f) 
h = g(2) 
i = LCase(g(3)) 
j = LCase(g(4)) 
if (i = ChrW(106)&ChrW(115) or i = ChrW(99)&ChrW(115)&ChrW(115)) and inStr(j, ChrW(63)) > 0 and instr(h, ChrW(46)) > 0 then
k = mid(f, 1, inStr(f, ChrW(63)) - 1) 


if inStr(c, ChrW(124)&ChrW(26367)&ChrW(25442)&ChrW(20869)&ChrW(23481)&ChrW(124)) > 0 then
a = replace(a, f, k) 
end if 
if inStr(c, ChrW(124)&ChrW(26367)&ChrW(25442)&ChrW(32593)&ChrW(22336)&ChrW(124)) > 0 then
b = replace(b, f, k) 
end if 
end if 
end if 
next 
end function 

function batchHandleHttpUrlComplete(a, b)
dim c, d, e, f, g 
c = getwebsite(a) 
d = split(b, vbCrLf) 
for each e in d
e = phptrim(e) 
f = LCase(e) 
if f <> ChrW(35) and left(f, 11) <> ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58) then
if inStr(vbCrLf & LCase(g) & vbCrLf, vbCrLf & f & vbCrLf) = 0 then
if g <> "" then g = g & vbCrLf 
g = g & urlAddHttpUrl(c, e) 
end if 
end if 
next 
batchHandleHttpUrlComplete = g 
end function 

function isWebSite(byVal a, byVal b)
isWebSite = handleIsWebSite(a, b, "") 
end function 

function isSonWebSite(byVal a, byVal b)
isSonWebSite = handleIsWebSite(a, b, ChrW(23376)&ChrW(22495)&ChrW(21517)) 
end function 

function handleIsWebSite(byVal a, byVal b, c)
a = getwebsite(a) 
b = getwebsite(b) 
if inStr(a, ChrW(58)&ChrW(47)&ChrW(47)) > 0 then
a = mid(a, inStr(a, ChrW(58)&ChrW(47)&ChrW(47)) + 3) 
end if 
if left(a, 4) = ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46) then
a = mid(a, 5) 
end if 
if inStr(b, ChrW(58)&ChrW(47)&ChrW(47)) > 0 then
b = mid(b, inStr(b, ChrW(58)&ChrW(47)&ChrW(47)) + 3) 
end if 
if left(b, 4) = ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46) then
b = mid(b, 5) 
end if 
if c = ChrW(23376)&ChrW(22495)&ChrW(21517) then
dim d, e, f 
f = ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(46)&ChrW(104)&ChrW(107)&ChrW(124)&ChrW(46)&ChrW(115)&ChrW(104)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(111)&ChrW(114)&ChrW(103)&ChrW(46)&ChrW(99)&ChrW(110) 
f = f & ChrW(124)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(124)&ChrW(46)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(124)&ChrW(46)&ChrW(111)&ChrW(114)&ChrW(103)&ChrW(124)&ChrW(46)&ChrW(116)&ChrW(118)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(99)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(124)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(116)&ChrW(119)&ChrW(124)&ChrW(58)&ChrW(56)&ChrW(49)&ChrW(124)&ChrW(58)&ChrW(57)&ChrW(57)&ChrW(124)&ChrW(46)&ChrW(98)&ChrW(105)&ChrW(122)&ChrW(124)&ChrW(46)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(124)&ChrW(46)&ChrW(104)&ChrW(107)&ChrW(124)&ChrW(46)&ChrW(117)&ChrW(115)&ChrW(124)&ChrW(46)&ChrW(108)&ChrW(97)&ChrW(124)&ChrW(46)&ChrW(103)&ChrW(108)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(124)&ChrW(46)&ChrW(115)&ChrW(111)&ChrW(124)&ChrW(46)&ChrW(105)&ChrW(109)&ChrW(124)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(124)&ChrW(46)&ChrW(120)&ChrW(121)&ChrW(122)&ChrW(124)&ChrW(46)&ChrW(119)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(124) 
d = split(f, ChrW(124)) 
for each e in d
if e <> "" then
a = replace(a, e, "") 
b = replace(b, e, "") 
end if 
next 
if inStr(a, ChrW(46))>0 then
a = mid(a, inStr(a, ChrW(46)) + 1) 
end if 
if inStr(b, ChrW(46))>0 then
b = mid(b, inStr(b, ChrW(46)) + 1) 
end if 
end if 
handleIsWebSite = false 
if a = b then
handleIsWebSite = true 
end if 
end function 

function getContentUrlList(a, byVal b)
getContentUrlList = handleGetContentUrlList(a, b, ChrW(124)&ChrW(42)&ChrW(124)&ChrW(20869)&ChrW(38142)&ChrW(124)) 
end function 

function handleGetContentUrlList(a, byVal b, c)
dim d, e, f, g, h, i, j, k, l, m, n, o, p, q 
c = ChrW(124) & LCase(trim(c)) & ChrW(124) 
n = getwebsite(a) 
for d = 1 to len(b)
e = mid(b, d, 1) 
f = mid(b & ChrW(32), d + 1, 1) 
h = mid(b, d + 1) : g = LCase(h) 
if e = ChrW(60) then
l = "" 
o = "" 
p = false 
if left(g, 2) = ChrW(97)&ChrW(32) then
o = ChrW(97) 
q = ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102) 
p = true 
elseIf left(g, 5) = ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(32) then
o = ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107) 
q = ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102) 
p = true 
elseIf left(g, 4) = ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32) then
o = ChrW(105)&ChrW(109)&ChrW(103) 
q = ChrW(115)&ChrW(114)&ChrW(99) 
p = true 
elseIf left(g, 7) = ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32) then
o = ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116) 
q = ChrW(115)&ChrW(114)&ChrW(99) 
p = true 
end if 
if p = true then
if inStr(c, ChrW(124) & o & ChrW(124)) > 0 or inStr(c, ChrW(124)&ChrW(42)&ChrW(124)) > 0 then
j = inStr(h, ChrW(62)) 
i = mid(h, 1, j) 
l = RParam(i, q) 
d = d + j 
end if 
end if 
if l <> "" then
m = LCase(l) 
if m <> ChrW(35) and left(m, 11) <> ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58) then
if inStr(vbCrLf & k & vbCrLf, vbCrLf & l & vbCrLf) = 0 then
l = fullHttpUrl(a, l) 
p = isSonWebSite(l, a) 
if inStr(c, ChrW(124)&ChrW(20869)&ChrW(38142)&ChrW(124)) > 0 then
if p = true then
k = k & l & vbCrLf 
end if 
elseIf inStr(c, ChrW(124)&ChrW(22806)&ChrW(38142)&ChrW(124)) > 0 then
if p = false then
k = k & l & vbCrLf 
end if 
else
k = k & l & vbCrLf 
end if 
end if 
end if 
end if 
end if 
next 
if k <> "" then k = left(k, len(k) - 2) 
handleGetContentUrlList = k 
end function 

function getInChain(a, b)
dim c, d, e, f, g 
c = split(b, vbCrLf) 
b = "" 
for each d in c
if d <> "" then
f = LCase(d) 
if left(f, 1) <> ChrW(35) and left(f, 11) <> ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58) then
if inStr(vbCrLf & b & vbCrLf, vbCrLf & d & vbCrLf) = 0 then
d = fullHttpUrl(a, d) 
g = isSonWebSite(d, a) 
if g = true then
b = b & d & vbCrLf 
end if 
end if 
end if 
end if 
next 
if b <> "" then b = left(b, len(b) - 2) 
getInChain = b 
end function 

function handleScanUrlList(a, b)
dim c, d, e, f 
c = split(b, vbCrLf) 
for each d in c
d = phptrim(d) 
f = lcase(d) 
if d <> "" and left(d, 10) <> ChrW(116)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(58)&ChrW(47)&ChrW(47) and left(d, 11) <> ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58) and left(d, 1) <> ChrW(35) then
d = fullHttpUrl(a, d) 
if instr(vbCrLf & e & vbCrLf, vbCrLf & d & vbCrLf) = 0 then
e = e & d & vbCrLf 
end if 
end if 
next 
handleScanUrlList = e 
end function 

function handleWithWebSiteList(a, b)
dim c, d, e, f, g, h 
c = lcase(getwebsite(a)) 
d = split(b, vbCrLf) 
for each e in d
if e <> "" then
if right(e, 1) <> ChrW(47) and instr(e, ChrW(63)) = 0 then
h = mid(e, instrrev(e, ChrW(47))) 

if (instr(h, ChrW(46)) = 0 or instr(h, ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)) > 0 or instr(h, ChrW(46)&ChrW(99)&ChrW(110)) > 0 or instr(h, ChrW(46)&ChrW(110)&ChrW(101)&ChrW(116)) > 0) and instr(h, ChrW(64)) = 0 then
e = e & ChrW(47) 
end if 

end if 
g = lcase(getwebsite(e)) 
if c = g and instr(vbCrLf & f & vbCrLf, vbCrLf & e & vbCrLf) = 0 then
if f <> "" then
f = f & vbCrLf 
end if 
f = f & e 
end if 
end if 
next 
handleWithWebSiteList = f 
end function 

function handleDifferenceWebSiteList(a, b)
dim c, d, e, f, g, h 
c = lcase(getwebsite(a)) 
d = split(b, vbCrLf) 
for each e in d
g = lcase(getwebsite(e)) 
if g <> "" and c <> g and instr(vbCrLf & h & vbCrLf, vbCrLf & g & vbCrLf) = 0 then
h = h & g & vbCrLf 
end if 
next 
handleDifferenceWebSiteList = h 
end function 

function checkDomainName(a)
dim b, c, d, e 
b = getwebsite(a) 
c = b & ChrW(47)&ChrW(97)&ChrW(47)&ChrW(49)&ChrW(47)&ChrW(98)&ChrW(47)&ChrW(50)&ChrW(47)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(47)  

checkDomainName = true 
d = getHttpUrl(b, "") 
e = getHttpUrl(c, "") 
if d = e then
checkDomainName = false  
end if 
end function 

function getHttpUrlStateAbout(a)
dim b, c 
b = cint(trim(a)) 
select case b
case 100 : c = ChrW(32487)&ChrW(32493)
case 101 : c = ChrW(24320)&ChrW(20851)&ChrW(21327)&ChrW(35758)
case 200 : c = ChrW(25104)&ChrW(21151)
case 201 : c = ChrW(21019)&ChrW(24314)
case 202 : c = ChrW(25509)&ChrW(21463)
case 203 : c = ChrW(38750)&ChrW(26435)&ChrW(23041)&ChrW(20449)&ChrW(24687)
case 204 : c = ChrW(19981)&ChrW(21547)&ChrW(20869)&ChrW(23481)
case 205 : c = ChrW(37325)&ChrW(32622)&ChrW(20869)&ChrW(23481)
case 206 : c = ChrW(37096)&ChrW(20998)&ChrW(20869)&ChrW(23481)
case 300 : c = ChrW(22810)&ChrW(39033)&ChrW(36873)&ChrW(25321)
case 301 : c = ChrW(31227)&ChrW(21160)&ChrW(27704)&ChrW(20037)
case 302 : c = ChrW(26242)&ChrW(26102)&ChrW(31227)&ChrW(21160)
case 303 : c = ChrW(30475)&ChrW(20854)&ChrW(20182)&ChrW(30340)
case 304 : c = ChrW(26410)&ChrW(20462)&ChrW(25913)
case 305 : c = ChrW(20351)&ChrW(29992)&ChrW(20195)&ChrW(29702)
case 307 : c = ChrW(20020)&ChrW(26102)&ChrW(37325)&ChrW(23450)&ChrW(21521)
case 400 : c = ChrW(22351)&ChrW(30340)&ChrW(35201)&ChrW(27714)
case 401 : c = ChrW(26410)&ChrW(32463)&ChrW(25480)&ChrW(26435)
case 402 : c = ChrW(20184)&ChrW(27454)&ChrW(35201)&ChrW(27714)
case 403 : c = ChrW(31105)&ChrW(27490)
case 404 : c = ChrW(26410)&ChrW(25214)&ChrW(21040)
case 405 : c = ChrW(19981)&ChrW(20801)&ChrW(35768)&ChrW(30340)&ChrW(26041)&ChrW(27861)
case 406 : c = ChrW(19981)&ChrW(21487)&ChrW(25509)&ChrW(21463)
case 407 : c = ChrW(20195)&ChrW(29702)&ChrW(39564)&ChrW(35777)&ChrW(25152)&ChrW(38656)
case 408 : c = ChrW(35831)&ChrW(27714)&ChrW(36229)&ChrW(26102)
case 409 : c = ChrW(20914)&ChrW(31361)
case 410 : c = ChrW(28040)&ChrW(22833)
case 411 : c = ChrW(25152)&ChrW(38656)&ChrW(38271)&ChrW(24230)
case 412 : c = ChrW(20808)&ChrW(20915)&ChrW(26465)&ChrW(20214)
case 413 : c = ChrW(35831)&ChrW(27714)&ChrW(23454)&ChrW(20307)&ChrW(36807)&ChrW(22823)
case 414 : c = ChrW(30340)&ChrW(35831)&ChrW(27714)&ChrW(85)&ChrW(82)&ChrW(73)&ChrW(22826)&ChrW(38271)
case 415 : c = ChrW(19981)&ChrW(25903)&ChrW(25345)&ChrW(30340)&ChrW(23186)&ChrW(20307)&ChrW(31867)&ChrW(22411)
case 416 : c = ChrW(30340)&ChrW(35831)&ChrW(27714)&ChrW(33539)&ChrW(22260)&ChrW(19981)&ChrW(28385)&ChrW(36275)
case 417 : c = ChrW(26399)&ChrW(26395)&ChrW(22833)&ChrW(36133)
case 500 : c = ChrW(20869)&ChrW(37096)&ChrW(26381)&ChrW(21153)&ChrW(22120)&ChrW(38169)&ChrW(35823)
case 501 : c = ChrW(26410)&ChrW(23454)&ChrW(26045)
case 502 : c = ChrW(22351)&ChrW(32593)&ChrW(20851)
case 503 : c = ChrW(26381)&ChrW(21153)&ChrW(19981)&ChrW(21487)&ChrW(29992)
case 504 : c = ChrW(32593)&ChrW(20851)&ChrW(36229)&ChrW(26102)
case 505 : c = ChrW(30340)&ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(29256)&ChrW(26412)&ChrW(19981)&ChrW(25903)&ChrW(25345)
case 509 : c = ChrW(24102)&ChrW(23485)&ChrW(38480)&ChrW(21046)&ChrW(36229)&ChrW(36807)
end select
getHttpUrlStateAbout = c 
end function 

function replaceUrlPort(a,b)
Dim c,d,e,f,g
d=getwebsite(a)
g=split(d,ChrW(58))
if ubound(g)=2 then
c=instrrev(d,ChrW(58))
e=mid(d,1,c) & b & ChrW(47)
f=e & mid(a,len(d)+1)
else
c=instrrev(d,ChrW(47))

e=mid(d,1,c-1) & ChrW(58) & b & ChrW(47)
f=e & mid(a,len(d)+1)
end if




replaceUrlPort=f
end function
%> 
