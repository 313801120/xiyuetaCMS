<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<%
call showCheckAdminRule(ChrW(29983)&ChrW(25104)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108))
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) then
call getSiteMapXML()
call die(ChrW(29983)&ChrW(25104)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)&ChrW(25104)&ChrW(21151)&ChrW(65281)&ChrW(26102)&ChrW(38388)&ChrW(65306) & now())
else
call echo(ChrW(29983)&ChrW(25104)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112),ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(39)&ChrW(62)&ChrW(28857)&ChrW(20987)&ChrW(29983)&ChrW(25104)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62))
end if
function handleWebUrl(a)
if a=ChrW(47)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112) then a=ChrW(47)
if left(a,1) <>ChrW(47) then a=ChrW(47) & a
handleWebUrl=webDoMain() & a
end function
function getSiteMapXML()
dim a,b
a=webDoMain() & ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
call echo(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108),a)
b=gethttpurl(a,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
call writetofile(ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108),b,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
end function
%>