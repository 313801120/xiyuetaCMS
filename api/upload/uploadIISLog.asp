<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%@LANGUAGE=ChrW(86)&ChrW(66)&ChrW(83)&ChrW(67)&ChrW(82)&ChrW(73)&ChrW(80)&ChrW(84) CODEPAGE=ChrW(54)&ChrW(53)&ChrW(48)&ChrW(48)&ChrW(49)%>
<%
Server.ScriptTimeOut=5000
%>
<!--#include file="UpLoadClass.asp"-->
<%



dim request2,formPath,formName,intCount,intTemp

set request2=new UpLoadClass

request2.FileType=ChrW(108)&ChrW(111)&ChrW(103)

request2.SavePath=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(85)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(120)&ChrW(108)&ChrW(115)&ChrW(47)

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
if file_url <>"" then file_url=file_url&ChrW(44)

file_url=file_url&ChrW(123)&ChrW(34)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(47)&ChrW(85)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(120)&ChrW(108)&ChrW(115)&ChrW(47)&formPath&request2.form(formName)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)& request2.form(formName) &ChrW(34)&ChrW(125)
if request2.form(formName&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114))=0 then intCount=intCount+1
next
str=ChrW(123)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&file_error&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&file_error&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&file_msg&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(91)&file_url&ChrW(93)&ChrW(125)
if request.QueryString(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(109)&ChrW(100) then
response.Write mdstr  
else
response.Write str  
end if  

set request2=nothing
%>