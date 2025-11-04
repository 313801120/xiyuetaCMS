<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%@LANGUAGE=ChrW(86)&ChrW(66)&ChrW(83)&ChrW(67)&ChrW(82)&ChrW(73)&ChrW(80)&ChrW(84) CODEPAGE=ChrW(54)&ChrW(53)&ChrW(48)&ChrW(48)&ChrW(49)%>
<%
Server.ScriptTimeOut=5000
%>
<!--#include file="UpLoadClass.asp"-->
<%
if session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))="" then
response.write(ChrW(123)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(49)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(35831)&ChrW(20808)&ChrW(30331)&ChrW(24405)&ChrW(34)&ChrW(125))
response.end()
end if



dim request2,formPath,formName,intCount,intTemp

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

function createFolder(byVal a)
on error resume next 
dim b 
call handlePath(a)
createFolder = false 
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.folderexists(a) = false then
b.createfolder(a) 
createFolder = true 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(21019)&ChrW(24314)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a & ChrW(58)&ChrW(58)&ChrW(58) & b.folderexists(a)) 
end function 

function handlePath(a)
a = replace(a, ChrW(47), ChrW(92)) 
a = replace(a, ChrW(92)&ChrW(92), ChrW(92)) 
a = replace(a, ChrW(92)&ChrW(92), ChrW(92)) 
dim b
b = false 
if right(a, 1) = ChrW(92) then
b = true 
end if 
if inStr(a, ChrW(58)) = 0 then
if left(a, 1) = ChrW(92) then
a = server.mapPath(ChrW(92)) & ChrW(92) & a 
else
a = server.mapPath(ChrW(46)&ChrW(92)) & ChrW(92) & a 
end if 
end if 
a = replace(a, ChrW(47), ChrW(92)) 
a = replace(a, ChrW(92)&ChrW(92), ChrW(92)) 
a = replace(a, ChrW(92)&ChrW(92), ChrW(92)) 
a = fullPath(a) 
if b = true then
a = a & ChrW(92) 
end if 
handlePath = a 
end function 

function fullPath(byVal a)
dim b, c, d 
d = "" 
a = replace(a, ChrW(47), ChrW(92)) 
b = split(a, ChrW(92)) 
for each c in b
c = trim(c) 
if c <> "" and c <> ChrW(46) then
if inStr(d, ChrW(92)) > 0 and c = ChrW(46)&ChrW(46) then
d = mid(d, 1, inStrRev(d, ChrW(92)) - 1) 
else
if d <> "" and right(d, 1) <> ChrW(92) then d = d & ChrW(92) 
d = d & c 
end if 
end if 
next 
fullPath = d 
end function 
dim sDirName

set request2=new UpLoadClass

request2.FileType=ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(47)&ChrW(120)&ChrW(108)&ChrW(115)&ChrW(47)&ChrW(109)&ChrW(100)&ChrW(98)

sDirName=ChrW(85)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(120)&ChrW(108)&ChrW(115)&ChrW(47)& getIP() &ChrW(47)
request2.SavePath=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)& sDirName
call createFolder(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47) & sDirName)

request2.Charset=ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56)

request2.Open() 

intCount=0
for intTemp=1 to Ubound(request2.FileItem)

formName=request2.FileItem(intTemp)

file_path=request2.form(formName&ChrW(95)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))
file_name=request2.form(formName&ChrW(95)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))

file_size=request2.form(formName&ChrW(95)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101))
file_error=request2.form(formName&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114))
file_msg=Error2Info(request2.form(formName&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114)))

file_url=file_url&ChrW(123)&ChrW(34)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(47)& sDirName &ChrW(47)&formPath&request2.form(formName)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)& request2.form(formName) &ChrW(34)&ChrW(125)
if request2.form(formName&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114))=0 then intCount=intCount+1
next
str=ChrW(123)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&file_error&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&file_error&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&file_msg&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(32)&file_url&ChrW(125)
if request.QueryString(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(109)&ChrW(100) then
response.Write mdstr  
else
response.Write str  
end if  

set request2=nothing
%>