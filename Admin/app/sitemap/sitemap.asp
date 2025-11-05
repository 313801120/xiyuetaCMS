<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<%
call showCheckAdminRule(ChrW(29983)&ChrW(25104)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108))
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) then
call getSiteMapXML()
call getSiteMapHTML()
call die(ChrW(29983)&ChrW(25104)&ChrW(25104)&ChrW(21151)&ChrW(65281)&ChrW(26102)&ChrW(38388)&ChrW(65306) & now() & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62)&ChrW(26597)&ChrW(30475)&ChrW(32)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)&ChrW(124)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62)&ChrW(26597)&ChrW(30475)&ChrW(32)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62))
else
call echo(ChrW(29983)&ChrW(25104)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112),ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(39)&ChrW(62)&ChrW(28857)&ChrW(20987)&ChrW(29983)&ChrW(25104)&ChrW(32)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(32)&ChrW(21644)&ChrW(32)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62))
end if
function handleWebUrl(a)
if a=ChrW(47)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112) then a=ChrW(47)
if left(a,1) <>ChrW(47) then a=ChrW(47) & a
handleWebUrl=webDoMain() & a
end function







function getSiteMapXML()
call openconn()
dim a
a=ChrW(60)&ChrW(63)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(32)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&ChrW(39)&ChrW(49)&ChrW(46)&ChrW(48)&ChrW(39)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(61)&ChrW(39)&ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56)&ChrW(39)&ChrW(63)&ChrW(62) & vbcrlf
a=a&ChrW(60)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(110)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(115)&ChrW(46)&ChrW(111)&ChrW(114)&ChrW(103)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(115)&ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(47)&ChrW(48)&ChrW(46)&ChrW(57)&ChrW(34)&ChrW(62)&vbcrlf









a=a&getNavToSiteMap(ChrW(42))
a=a&getArticleSiteMap(ChrW(42))
a=a & ChrW(60)&ChrW(47)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(62)
call writetofile(ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108),a,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
getSiteMapXML=a
end function

function getNavToSiteMap(a)  
dim b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x 
if a <>"" then
p=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(61)&ChrW(49)
if a <>ChrW(42) then
p=p & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&a&ChrW(41)
end if
dim y:Set y = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
y.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not y.eof then
u=y(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)) 
call echo(ChrW(38656)&ChrW(35201)&ChrW(29983)&ChrW(25104)&ChrW(30340)&ChrW(29256)&ChrW(26412)&ChrW(26377),y(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)))
t=split(y(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))&ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124),ChrW(124))
s=t(1)
call echo(ChrW(40664)&ChrW(35748)&ChrW(35821)&ChrW(35328)&ChrW(20026),s)
end if:y.close

p=p&ChrW(32)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(66)&ChrW(89)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
o=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&p
call echo(ChrW(115)&ChrW(113)&ChrW(108),o):doevents 
y.open o,conn,1,1
v=y.recordcount
if v>9999 then v=9999
for m=1 to v
if y.eof then exit for      
call echoBlueB(ChrW(22788)&ChrW(29702)&ChrW(23548)&ChrW(34892)&ChrW(105)&ChrW(100)&ChrW(61)&y(ChrW(105)&ChrW(100)),m&ChrW(47)&v)
d=true
if phptrim(y(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))) <>"" then
d=false
end if
f=y(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
if f=ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116) then f=ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)
if phptrim(y(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) <>"" then
c=ChrW(47)&phptrim(y(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
elseif f=ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101) then
c=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
else
c=ChrW(47)&f & ChrW(95) & y(ChrW(105)&ChrW(100)) &  ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
end if 
if d then

dim z
if f=ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101) then
z=ChrW(49)&ChrW(46)&ChrW(48)
else
z=ChrW(48)&ChrW(46)&ChrW(57)
end if
if instr(u,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),c,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),z)
call echo(ChrW(99)&ChrW(110),b)
end if                
if instr(u,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then      
b=getWebUrl(ChrW(101)&ChrW(110),c,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),z)
call echo(ChrW(101)&ChrW(110),b)
end if    
if instr(u,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then  
b=getWebUrl(ChrW(102)&ChrW(116),c,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),z)
call echo(ChrW(102)&ChrW(116),b)
end if

if instr(ChrW(124)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(116)&ChrW(124)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(124)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(111)&ChrW(124)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(124)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(124),ChrW(124)&f&ChrW(124))>0 then
a=getColumAllID20251015(y(ChrW(105)&ChrW(100)))
if a <>"" then a=a+ChrW(44)
a=a & y(ChrW(105)&ChrW(100))
p=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)& a &ChrW(41)
o=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&p
rsx.open o ,conn,1,1
l=IIF(isnull(rsx(ChrW(99)&ChrW(116)))=true,0,rsx(ChrW(99)&ChrW(116))):rsx.close
k=calculateTotalPages(l,y(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)))
call echo(ChrW(115)&ChrW(113)&ChrW(108),o)
call echo(ChrW(26465)&ChrW(25968),l)
call echo(ChrW(27599)&ChrW(39029)&ChrW(26174)&ChrW(31034),y(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)))
call echo(ChrW(39029)&ChrW(25968)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115),k)
if k>1 then
for w=2 to k
r=instrrev(c,ChrW(46))
q=mid(c,1,r-1) & ChrW(95)&w&mid(c,r)
call echo(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101),q) 
if instr(u,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),q,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(55))
call echo(ChrW(32763)&ChrW(39029)&ChrW(99)&ChrW(110),b)
doevents
end if
if instr(u,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then  
b=getWebUrl(ChrW(101)&ChrW(110),q,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(55))
call echo(ChrW(32763)&ChrW(39029)&ChrW(101)&ChrW(110),b)
doevents
end if
if instr(u,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then  
b=getWebUrl(ChrW(102)&ChrW(116),q,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(55))
call echo(ChrW(32763)&ChrW(39029)&ChrW(102)&ChrW(116),b)
doevents
end if
next
end if
doevents
end if
end if 
y.movenext:next:y.close
end if 
getNavToSiteMap=x
end function

function getArticleSiteMap(a)  
dim b,c,d,e,f,g,h,i,j,k,l,m,n
if a <>"" then
g=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(61)&ChrW(49)
if a <>ChrW(42) then
g=g & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&a&ChrW(41)
end if
dim o:Set o = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
o.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not o.eof then 
l=o(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)) 
call echo(ChrW(38656)&ChrW(35201)&ChrW(29983)&ChrW(25104)&ChrW(30340)&ChrW(29256)&ChrW(26412)&ChrW(26377),o(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)))
k=split(o(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))&ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124),ChrW(124))
j=k(1)
call echo(ChrW(40664)&ChrW(35748)&ChrW(35821)&ChrW(35328)&ChrW(20026),j)
end if:o.close

g=g&ChrW(32)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(66)&ChrW(89)&ChrW(32)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(69)&ChrW(83)&ChrW(67)
f=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&g
call echo(ChrW(115)&ChrW(113)&ChrW(108),f):doevents
o.open f,conn,1,1
m=o.recordcount
if m>9999 then m=9999
for d=1 to m
if o.eof then exit for           
call echoBlueB(ChrW(29983)&ChrW(25104)&ChrW(25991)&ChrW(31456),d&ChrW(47)&m)
if phptrim(o(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) <>"" then
c=ChrW(47)&phptrim(o(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) 
else
c=ChrW(47)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(95) & o(ChrW(105)&ChrW(100)) &  ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
end if
if o(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) then

if instr(l,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),c,j)
n=n & getSitemapC(b,o(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(56))
call echo(ChrW(25991)&ChrW(31456)&ChrW(99)&ChrW(110),b)
end if                
if instr(l,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then      
b=getWebUrl(ChrW(101)&ChrW(110),c,j)
n=n & getSitemapC(b,o(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(56))
call echo(ChrW(25991)&ChrW(31456)&ChrW(101)&ChrW(110),b)
end if    
if instr(l,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then  
b=getWebUrl(ChrW(102)&ChrW(116),c,j)
n=n & getSitemapC(b,o(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(56))
call echo(ChrW(25991)&ChrW(31456)&ChrW(102)&ChrW(116),b)
end if
end if
o.movenext:next:o.close
end if
getArticleSiteMap=n
end function
function getSitemapC(a,b,c)
dim d,e

if isDate(b) then
e=format_Time(b,2)
else
e=format_Time(now(),2)
end if

if c="" or not isnumeric(c) then c=ChrW(48)&ChrW(46)&ChrW(56)
d=d & vbtab & ChrW(60)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(62)&vbcrlf
d=d & copystr(vbtab,2) & ChrW(60)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(62)&ChrW(60)&ChrW(33)&ChrW(91)&ChrW(67)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(65)&ChrW(91) & phptrim(a) &ChrW(93)&ChrW(93)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(62) & vbcrlf
d=d & copystr(vbtab,2) & ChrW(60)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(100)&ChrW(62)&e&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(100)&ChrW(62) & vbcrlf
d=d & copystr(vbtab,2) & ChrW(60)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(62)&ChrW(119)&ChrW(101)&ChrW(101)&ChrW(107)&ChrW(108)&ChrW(121)&ChrW(60)&ChrW(47)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(62) & vbcrlf
d=d & copystr(vbtab,2) & ChrW(60)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(111)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(62)&c&ChrW(60)&ChrW(47)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(111)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(62) & vbcrlf
d=d & vbtab & ChrW(60)&ChrW(47)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(62)&vbcrlf
getSitemapC=d
end function

function getWebUrl(a,b,c)
dim d
if a <>c then
call createFolder(ChrW(47)&a&ChrW(47))
d=ChrW(47) & a & b
else
d= b
end if
getWebUrl=webDoMain() & d
end function

function getColumAllID20251015(a)
if a="" then getColumAllID20251015="": exit function
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
while not b.eof 
if c <>"" then c=c & ChrW(44)
c=c & b(ChrW(105)&ChrW(100))
d=getColumAllID20251015(b(ChrW(105)&ChrW(100)))
if d <>"" then
c=c & ChrW(44) & d
end if
b.movenext:wend:b.close
getColumAllID20251015=c
end function

Function calculateTotalPages(a, b)
If b <= 0 Then
calculateTotalPages = 0
Exit function
End if
If a <= 0 Then
calculateTotalPages = 0
Exit function
End if

calculateTotalPages = Int((a - 1) / b) + 1
End function

function getSiteMapHTML()
call openconn()
dim a,b,c
c=webDoMain()

dim d:Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
d.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not d.eof then
b=phptrim(d(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
if b="" then b=ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)
else
b=ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)
end if
d.close

a=ChrW(60)&ChrW(33)&ChrW(68)&ChrW(79)&ChrW(67)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(32)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(61)&ChrW(34)&ChrW(122)&ChrW(104)&ChrW(45)&ChrW(67)&ChrW(78)&ChrW(34)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56)&ChrW(34)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(61)&ChrW(100)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(45)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(44)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(45)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(49)&ChrW(46)&ChrW(48)&ChrW(34)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(114)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(44)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(34)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(62) & server.HTMLEncode(b) & ChrW(32)&ChrW(45)&ChrW(32)&ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(62) & vbcrlf
a=a & vbtab & vbtab & ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(102)&ChrW(97)&ChrW(109)&ChrW(105)&ChrW(108)&ChrW(121)&ChrW(58)&ChrW(32)&ChrW(65)&ChrW(114)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(32)&ChrW(89)&ChrW(97)&ChrW(72)&ChrW(101)&ChrW(105)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(115)&ChrW(97)&ChrW(110)&ChrW(115)&ChrW(45)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(102)&ChrW(59)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(46)&ChrW(54)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(32)&ChrW(50)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(102)&ChrW(53)&ChrW(102)&ChrW(53)&ChrW(102)&ChrW(53)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(102)&ChrW(102)&ChrW(102)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(32)&ChrW(51)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(117)&ChrW(115)&ChrW(58)&ChrW(32)&ChrW(56)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(45)&ChrW(115)&ChrW(104)&ChrW(97)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(58)&ChrW(32)&ChrW(48)&ChrW(32)&ChrW(50)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(114)&ChrW(103)&ChrW(98)&ChrW(97)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(48)&ChrW(44)&ChrW(48)&ChrW(44)&ChrW(48)&ChrW(46)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(104)&ChrW(49)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(51)&ChrW(51)&ChrW(51)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(51)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(48)&ChrW(48)&ChrW(55)&ChrW(98)&ChrW(102)&ChrW(102)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(51)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(104)&ChrW(50)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(53)&ChrW(53)&ChrW(53)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(58)&ChrW(32)&ChrW(51)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(52)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(48)&ChrW(48)&ChrW(55)&ChrW(98)&ChrW(102)&ChrW(102)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(45)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(52)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(32)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(32)&ChrW(56)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(101)&ChrW(101)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(58)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(99)&ChrW(104)&ChrW(105)&ChrW(108)&ChrW(100)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(97)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(48)&ChrW(48)&ChrW(55)&ChrW(98)&ChrW(102)&ChrW(102)&ChrW(59)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(45)&ChrW(100)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(48)&ChrW(46)&ChrW(51)&ChrW(115)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(97)&ChrW(58)&ChrW(104)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(48)&ChrW(48)&ChrW(53)&ChrW(54)&ChrW(98)&ChrW(51)&ChrW(59)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(45)&ChrW(100)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(46)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(59)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(50)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(45)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(50)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(59)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(32)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(102)&ChrW(48)&ChrW(102)&ChrW(48)&ChrW(102)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(117)&ChrW(115)&ChrW(58)&ChrW(32)&ChrW(52)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(45)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(58)&ChrW(32)&ChrW(52)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(45)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(58)&ChrW(32)&ChrW(50)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(101)&ChrW(101)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(59)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(50)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(47)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(62) & vbcrlf
a=a & vbtab & vbtab & ChrW(60)&ChrW(104)&ChrW(49)&ChrW(62)&ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)&ChrW(32)&ChrW(45)&ChrW(32) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(104)&ChrW(49)&ChrW(62) & vbcrlf
a=a & vbtab & vbtab & ChrW(60)&ChrW(112)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(51)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(34)&ChrW(62)&ChrW(26368)&ChrW(21518)&ChrW(26356)&ChrW(26032)&ChrW(65306) & format_Time(now(),1) & ChrW(32)&ChrW(124)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34)&ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62)&ChrW(26597)&ChrW(30475)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(26684)&ChrW(24335)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(112)&ChrW(62) & vbcrlf

a=a & getNavToSiteMapHTML(ChrW(42))

a=a & getArticleSiteMapHTML(ChrW(42))
a=a & vbtab & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(62) & vbcrlf
a=a & vbtab & vbtab & vbtab & ChrW(60)&ChrW(112)&ChrW(62)&ChrW(169)&ChrW(32) & year(now()) & ChrW(32) & server.HTMLEncode(b) & ChrW(32)&ChrW(124)&ChrW(32)&ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)&ChrW(33258)&ChrW(21160)&ChrW(29983)&ChrW(25104)&ChrW(60)&ChrW(47)&ChrW(112)&ChrW(62) & vbcrlf
a=a & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(62) & vbcrlf
call writetofile(ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108),a,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
getSiteMapHTML=a
end function

function getNavToSiteMapHTML(a)
dim b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t
k=""
if a <>"" then
m=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(61)&ChrW(49)
if a <>ChrW(42) then
m=m & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&a&ChrW(41)
end if
Set l = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
l.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not l.eof then
h=l(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))
g=split(h&ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124),ChrW(124))
f=g(1)
end if
l.close
m=m&ChrW(32)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(66)&ChrW(89)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
n=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&m
l.open n,conn,1,1
i=l.recordcount
if i>9999 then i=9999
k=k & vbtab & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(45)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(62) & vbcrlf
k=k & vbtab & vbtab & vbtab & ChrW(60)&ChrW(104)&ChrW(50)&ChrW(62)&ChrW(23548)&ChrW(33322)&ChrW(39029)&ChrW(38754)&ChrW(60)&ChrW(47)&ChrW(104)&ChrW(50)&ChrW(62) & vbcrlf
for j=1 to i
if l.eof then exit for
d=true
if phptrim(l(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))) <>"" then
d=false
end if
e=l(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
if e=ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116) then e=ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)
if phptrim(l(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) <>"" then
c=ChrW(47)&phptrim(l(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
elseif e=ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101) then
c=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
else
c=ChrW(47)&e & ChrW(95) & l(ChrW(105)&ChrW(100)) &  ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
end if
if d then
k=k & vbtab & vbtab & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(45)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(34)&ChrW(62) & vbcrlf
k=k & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(62) & server.HTMLEncode(l(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
k=k & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(117)&ChrW(108)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(34)&ChrW(62) & vbcrlf
if instr(h,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),c,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(h,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(101)&ChrW(110),c,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(h,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then
b=getWebUrl(ChrW(102)&ChrW(116),c,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if

if instr(ChrW(124)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(116)&ChrW(124)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(124)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(111)&ChrW(124)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(124)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(124),ChrW(124)&e&ChrW(124))>0 then
t=getColumAllID20251015(l(ChrW(105)&ChrW(100)))
if t <>"" then t=t+ChrW(44)
t=t & l(ChrW(105)&ChrW(100))
m=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)& t &ChrW(41)
n=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&m
Set rsx = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
rsx.open n ,conn,1,1
p=IIF(isnull(rsx(ChrW(99)&ChrW(116)))=true,0,rsx(ChrW(99)&ChrW(116))):rsx.close
o=calculateTotalPages(p,l(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)))
if o>1 then
for s=2 to o
r=instrrev(c,ChrW(46))
q=mid(c,1,r-1) & ChrW(95)&s&mid(c,r)
if instr(h,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),q,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(h,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(101)&ChrW(110),q,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(h,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then
b=getWebUrl(ChrW(102)&ChrW(116),q,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
next
end if
end if
k=k & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(117)&ChrW(108)&ChrW(62) & vbcrlf
k=k & vbtab & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
end if
l.movenext:next:l.close
k=k & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
end if
getNavToSiteMapHTML=k
end function

function getArticleSiteMapHTML(a)
dim b,c,d,e,f,g,h,i,j,k,l,m
i=""
if a <>"" then
l=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(61)&ChrW(49)
if a <>ChrW(42) then
l=l & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&a&ChrW(41)
end if
Set j = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
j.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not j.eof then
f=j(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))
e=split(f&ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124),ChrW(124))
d=e(1)
end if
j.close
l=l&ChrW(32)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(66)&ChrW(89)&ChrW(32)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(69)&ChrW(83)&ChrW(67)
m=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&l
j.open m,conn,1,1
g=j.recordcount
if g>9999 then g=9999

k=0
if g>500 then g=500
i=i & vbtab & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(45)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(62) & vbcrlf
i=i & vbtab & vbtab & vbtab & ChrW(60)&ChrW(104)&ChrW(50)&ChrW(62)&ChrW(25991)&ChrW(31456)&ChrW(20869)&ChrW(23481)&ChrW(32)&ChrW(40) & g & ChrW(32)&ChrW(26465)&ChrW(26368)&ChrW(26032)&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(104)&ChrW(50)&ChrW(62) & vbcrlf
i=i & vbtab & vbtab & vbtab & ChrW(60)&ChrW(117)&ChrW(108)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(34)&ChrW(62) & vbcrlf
for h=1 to g
if j.eof then exit for
if j(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) then
if phptrim(j(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) <>"" then
c=ChrW(47)&phptrim(j(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
else
c=ChrW(47)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(95) & j(ChrW(105)&ChrW(100)) &  ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
end if
if instr(f,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),c,d)
i=i & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(j(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) & ChrW(32)&ChrW(45)&ChrW(32) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(j(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(f,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(101)&ChrW(110),c,d)
i=i & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(j(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) & ChrW(32)&ChrW(45)&ChrW(32) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(j(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(f,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then
b=getWebUrl(ChrW(102)&ChrW(116),c,d)
i=i & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(j(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) & ChrW(32)&ChrW(45)&ChrW(32) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(j(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
k=k+1
end if
j.movenext:next:j.close
i=i & vbtab & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(117)&ChrW(108)&ChrW(62) & vbcrlf
i=i & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
end if
getArticleSiteMapHTML=i
end function
%>