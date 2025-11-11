<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Server.ScriptTimeOut=5000
Response.AddHeader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)
%>
<!--#include file="UpLoadClass.asp"-->
<%

function loadUpload(a,b,c,d)
dim e,f,g,h,i,j
if c="" then c=ChrW(98)&ChrW(109)&ChrW(112)&ChrW(47)&ChrW(103)&ChrW(105)&ChrW(102)&ChrW(47)&ChrW(106)&ChrW(112)&ChrW(103)&ChrW(47)&ChrW(106)&ChrW(112)&ChrW(101)&ChrW(103)&ChrW(47)&ChrW(112)&ChrW(110)&ChrW(103)&ChrW(47)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(112)
saveFolderPath=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(85)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&b&ChrW(47) 
if checkFolder(saveFolderPath) then 

set e=new UpLoadClass 

e.filetype=c 

e.savepath=saveFolderPath

e.charset=ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56) 

e.open()

if Ubound(e.fileitem)<d then
d=Ubound(e.fileitem)
end if

g=0
for h=1 to d

f=e.fileitem(h)

file_path=e.form(f&ChrW(95)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) 
file_name=e.form(f&ChrW(95)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))  

file_size=e.form(f&ChrW(95)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)) 
file_error=e.form(f&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114))
file_msg=Error2Info(e.form(f&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114)))
i=ChrW(47)&ChrW(85)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&b&ChrW(47)& e.form(f)
if instr(ChrW(47)&c&ChrW(47),ChrW(47)&ChrW(109)&ChrW(100)&ChrW(98)&ChrW(47))>0 then
j=ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(34)& getAccessPass(i) &ChrW(34)
end if
if file_url <>"" then file_url=file_url&ChrW(44) 
file_url=file_url&ChrW(123)&ChrW(34)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(34)&ChrW(58)&ChrW(34)& i &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34)& webDoMain & i &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)& e.form(f) &ChrW(34)&j&ChrW(125) 
if e.form(f&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114))=0 then g=g+1
next

set e=nothing
else 
g=0
file_error=2
file_url=ChrW(34)&ChrW(34)
file_msg=ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(30446)&ChrW(24405)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(19978)&ChrW(20256)&ChrW(22833)&ChrW(36133)&ChrW(65281)
end if

if a=true then
str=ChrW(123)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&file_error&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&file_error&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(58)&g&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&file_msg&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(91)&file_url&ChrW(93)&ChrW(125)
else
str=ChrW(123)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&file_error&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&file_error&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(58)&g&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&file_msg&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(32)&file_url&ChrW(125)
end if
response.Write str  
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

function checkFolder(byVal a)
dim b,c
b=server.mapPath(a)
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
checkFolder = c.folderexists(b) 
set c = nothing 
end function 

function getAccessPass(a)
on error resume next
Dim b:Set b = Server.CreateObject(ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(68)&ChrW(108)&ChrW(108)&ChrW(46)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97))
getAccessPass=b.getaccesspass(server.mapPath(a)) 
end function
%>
<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%>