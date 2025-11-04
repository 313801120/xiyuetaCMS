<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../common.Asp"--><%
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) then   
call sumbitliuya()
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(108)&ChrW(121)&ChrW(50) then   
call ly2()
end if
function sumbitliuya()
dim a,b,c,d,e
a=requestHtmlHandle(request(ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
b=requestHtmlHandle(request(ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)))
c=requestHtmlHandle(request(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)))
d=requestHtmlHandle(request(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)))
e=request(ChrW(121)&ChrW(122)&ChrW(109))
if e="" then
call eerr(ChrW(30041)&ChrW(35328)&ChrW(22833)&ChrW(36133),ChrW(35831)&ChrW(36755)&ChrW(20837)&ChrW(39564)&ChrW(35777)&ChrW(30721)&ChrW(65281)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(40)&ChrW(41)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(19978)&ChrW(19968)&ChrW(39029)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62) & jsTiming(ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107),6))
elseif e <>session(ChrW(121)&ChrW(122)&ChrW(109)) or session(ChrW(121)&ChrW(122)&ChrW(109))="" then
call eerr(ChrW(30041)&ChrW(35328)&ChrW(22833)&ChrW(36133),ChrW(39564)&ChrW(35777)&ChrW(30721)&ChrW(19981)&ChrW(27491)&ChrW(30830)&ChrW(65281)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(40)&ChrW(41)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(19978)&ChrW(19968)&ChrW(39029)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62) & jsTiming(ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107),6))
end if
session(ChrW(121)&ChrW(122)&ChrW(109))=""
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(98)&ChrW(111)&ChrW(111)&ChrW(107) ,conn,1,3    
rs.addnew
rs(ChrW(105)&ChrW(112))=getip()
rs(ChrW(116)&ChrW(101)&ChrW(108))=b
rs(ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=a
rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))=c
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=d
rs.update:rs.close
call die(ChrW(30041)&ChrW(35328)&ChrW(25104)&ChrW(21151)&ChrW(65281)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(39318)&ChrW(39029)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59) & jsTiming(ChrW(47),6))
end function
function ly2()
dim a,b,c,d,e
a=requestHtmlHandle(request(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(104)&ChrW(117)))
b=requestHtmlHandle(request(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(108)))
c=requestHtmlHandle(request(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)))
d=requestHtmlHandle(request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(98)&ChrW(111)&ChrW(111)&ChrW(107) ,conn,1,3   
rs.addnew
rs(ChrW(105)&ChrW(112))=getip()
rs(ChrW(116)&ChrW(101)&ChrW(108))=b
rs(ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=a
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=c
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=d
rs.update:rs.close
call die(ChrW(30041)&ChrW(35328)&ChrW(25104)&ChrW(21151)&ChrW(65281))
end function

function requestHtmlHandle(a)
a=replace(a,ChrW(60),ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59))
a=replace(a,ChrW(62),ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59))
requestHtmlHandle=a
end function
%>