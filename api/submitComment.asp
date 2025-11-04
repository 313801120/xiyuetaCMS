<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../common.Asp"--><%
dim msg,jshref,autoToUrl
function cnToEnStr(a)
if language=ChrW(101)&ChrW(110) then
if a=ChrW(27492)&ChrW(84)&ChrW(65)&ChrW(71)&ChrW(19981)&ChrW(23384)&ChrW(22312) then
a=ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(103)&ChrW(32)&ChrW(100)&ChrW(111)&ChrW(101)&ChrW(115)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(101)&ChrW(120)&ChrW(105)&ChrW(115)&ChrW(116)
elseif a=ChrW(31995)&ChrW(32479)&ChrW(38480)&ChrW(21046)&ChrW(30340)&ChrW(25628)&ChrW(32034)&ChrW(20851)&ChrW(38190)&ChrW(23383)&ChrW(21482)&ChrW(33021)&ChrW(22312)&ChrW(32)&ChrW(50)&ChrW(126)&ChrW(50)&ChrW(48)&ChrW(32)&ChrW(20010)&ChrW(23383)&ChrW(31526)&ChrW(20043)&ChrW(38388) then
a=ChrW(84)&ChrW(104)&ChrW(101)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(32)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(32)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(32)&ChrW(98)&ChrW(101)&ChrW(32)&ChrW(98)&ChrW(101)&ChrW(116)&ChrW(119)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(50)&ChrW(45)&ChrW(50)&ChrW(48)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(115)
elseif a=ChrW(35831)&ChrW(36755)&ChrW(20837)&ChrW(39564)&ChrW(35777)&ChrW(30721)&ChrW(65281) then
a=ChrW(80)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(32)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(33)
elseif a=ChrW(39564)&ChrW(35777)&ChrW(30721)&ChrW(19981)&ChrW(27491)&ChrW(30830)&ChrW(65281) then
a=ChrW(84)&ChrW(104)&ChrW(101)&ChrW(32)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(33)
elseif a=ChrW(30041)&ChrW(35328)&ChrW(25104)&ChrW(21151)&ChrW(65281) then
a=ChrW(77)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(102)&ChrW(117)&ChrW(108)&ChrW(33)
elseif a=ChrW(22914)&ChrW(26524)&ChrW(24744)&ChrW(30340)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(27809)&ChrW(26377)&ChrW(33258)&ChrW(21160)&ChrW(36339)&ChrW(36716)&ChrW(65292)&ChrW(35831)&ChrW(28857)&ChrW(20987)&ChrW(36825)&ChrW(37324) then
a=ChrW(73)&ChrW(102)&ChrW(32)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(100)&ChrW(111)&ChrW(101)&ChrW(115)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(121)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(44)&ChrW(32)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(32)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)
elseif a=ChrW(20449)&ChrW(24687)&ChrW(25552)&ChrW(31034) then
a=ChrW(77)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101)
end if
end if
cnToEnStr=a
end function
jshref=ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)
autoToUrl=ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116) then
call replycomment()
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(116)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(114) then
msg=cnToEnStr(ChrW(27492)&ChrW(84)&ChrW(65)&ChrW(71)&ChrW(19981)&ChrW(23384)&ChrW(22312))
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(114) then
msg=cnToEnStr(ChrW(31995)&ChrW(32479)&ChrW(38480)&ChrW(21046)&ChrW(30340)&ChrW(25628)&ChrW(32034)&ChrW(20851)&ChrW(38190)&ChrW(23383)&ChrW(21482)&ChrW(33021)&ChrW(22312)&ChrW(32)&ChrW(50)&ChrW(126)&ChrW(50)&ChrW(48)&ChrW(32)&ChrW(20010)&ChrW(23383)&ChrW(31526)&ChrW(20043)&ChrW(38388))
end if
function replycomment()
dim a,b,c,d,e,f,g,h
a=requestHtmlHandle(request(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)))
b=requestHtmlHandle(request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
e=requestHtmlHandle(request(ChrW(115)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)))
g=requestHtmlHandle(request(ChrW(110)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)))
h=requestHtmlHandle(request(ChrW(114)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(100)))
f=request(ChrW(107)&ChrW(101)&ChrW(121))
if f="" then
msg=cnToEnStr(ChrW(35831)&ChrW(36755)&ChrW(20837)&ChrW(39564)&ChrW(35777)&ChrW(30721)&ChrW(65281))
exit function
elseif f <>session(ChrW(121)&ChrW(122)&ChrW(109)) or session(ChrW(121)&ChrW(122)&ChrW(109))="" then 
msg=cnToEnStr(ChrW(39564)&ChrW(35777)&ChrW(30721)&ChrW(19981)&ChrW(27491)&ChrW(30830)&ChrW(65281))
exit function
end if
session(ChrW(121)&ChrW(122)&ChrW(109))=""
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101) ,conn,1,3    
rs.addnew
rs(ChrW(105)&ChrW(112))=getip() 
if g <>ChrW(49) then
if session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)) <>"" then
rs(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))
end if
else
rs(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99))=ChrW(47)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(47) & phpRnd(1,68) & ChrW(46)&ChrW(103)&ChrW(105)&ChrW(102)
end if
if a <>"" then 
rs(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100))=a
end if
if h <>"" then rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=h
rs(ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=b 
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=e
rs.update:rs.close 
msg=cnToEnStr(ChrW(30041)&ChrW(35328)&ChrW(25104)&ChrW(21151)&ChrW(65281))
jshref=getGoToUrl()
autoToUrl=ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(46)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)& jshref &ChrW(39)

exit function
end function

function requestHtmlHandle(a)
a=replace(a,ChrW(60),ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59))
a=replace(a,ChrW(62),ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59))
requestHtmlHandle=a
end function
%><!DOCTYPE html>
<html>
<script language=javascript>
var secs = 4; //4秒
for (i = 1; i <= secs; i++) { window.setTimeout("update(" + i + ")", i * 1000); }
function update(num) {
if (num == secs) { <%=autoToUrl%> } else {}
}
</script>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=cnToEnStr(ChrW(20449)&ChrW(24687)&ChrW(25552)&ChrW(31034))%></title> 
</head>
<body class="gray-bg">
<div class="middle-box text-center">
<h2><i class="fa fa-spinner fa-spin fa-3x"></i></h2>
</div>
<div class="middle-box text-center animated ">
<h3 class="font-bold"><%=msg%></h3>
</div>
<div class="middle-box text-center">
<div class="error-desc">
<a href="<%=jshref%>" class="btn btn-primary m-t"><%=cnToEnStr(ChrW(22914)&ChrW(26524)&ChrW(24744)&ChrW(30340)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(27809)&ChrW(26377)&ChrW(33258)&ChrW(21160)&ChrW(36339)&ChrW(36716)&ChrW(65292)&ChrW(35831)&ChrW(28857)&ChrW(20987)&ChrW(36825)&ChrW(37324))%></a>
</div>
</div> 
</body>
</html>