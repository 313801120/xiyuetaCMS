<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%>
<%
function getMobileToAddr(a)
getMobileToAddr=mobileToAddr2025(a,"")
end function





function mobileToAddr2025(a,b)
dim c,d,e,f,g,h,i,j,k,l
dim m,n,o,p,q,r,s,t,u
dim v:v=false
b=trim(cstr(b & ""))
if b=ChrW(97)&ChrW(108)&ChrW(108)&ChrW(44)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) then
b=ChrW(97)&ChrW(108)&ChrW(108)
v=true
end if
if isNul(a) then mobileToAddr2025="":exit function
dim w
w=ChrW(68)&ChrW(58)&ChrW(92)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(107)&ChrW(92)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(92)
if checkFolder(w)=false then
if v then call echo(ChrW(30446)&ChrW(24405)&w,ChrW(19981)&ChrW(23384)&ChrW(22312))
w=ChrW(47)
call createFolder(ChrW(47)&ChrW(105)&ChrW(112))
call createFolder(ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101))
call createFolder(ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
call createFolder(ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(47)&ChrW(116)&ChrW(120)&ChrW(116))
else
if v then call echo(ChrW(25552)&ChrW(31034),ChrW(26681)&ChrW(30446)&ChrW(24405)&ChrW(23384)&ChrW(22312) & w):doevents
end if
a=left(a,7) & ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)
m=left(a,7)
dim x,y,z,a1,a2
set x = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
set y = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
set z = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116)) 
dim a3,a4
a3=ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if checkFile(a3) then 
dim a5,a6,a7,a8
a2=readfile(a3,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
a1=split(a2&ChrW(44)&ChrW(44)&ChrW(44),ChrW(44))
if v then call echo(ChrW(25552)&ChrW(31034),ChrW(20351)&ChrW(29992)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(25968)&ChrW(25454)&ChrW(24211)) 
a5=a1(0)
a6=a1(1)
a7=a1(2)
a8=a1(3)
a4=ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)
if a5="" then a5 = ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(104)&ChrW(111)&ChrW(115)&ChrW(116) 
if a6=""  then a6=ChrW(115)&ChrW(97)
if a8="" then a8=ChrW(49)&ChrW(52)&ChrW(51)&ChrW(51)
l = ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a6&ChrW(59)&ChrW(32)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(61)&a7&ChrW(59)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(32)&ChrW(67)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(32)&ChrW(61)&ChrW(105)&ChrW(112)&ChrW(59)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(32)&ChrW(61) & a5 & ChrW(44)&a8&ChrW(59)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(98)&ChrW(59)
if checkSqlServer(l) = false then
call eerr(ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(38142)&ChrW(25509)&ChrW(20986)&ChrW(38169), l) 
end if 
set x = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
x.open l 
if v then call echo(ChrW(25171)&ChrW(24320)&ChrW(22806)&ChrW(37096)&ChrW(25968)&ChrW(25454)&ChrW(24211),ChrW(26159)&ChrW(30340))
else
call selectOpenConn(x)
a4=db_PREFIX & ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)
if v then call echo(ChrW(25552)&ChrW(31034),ChrW(20351)&ChrW(29992)&ChrW(24403)&ChrW(21069)&ChrW(25968)&ChrW(25454)&ChrW(24211))
end if 

k=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&a4&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&m&ChrW(39)

y.open k,x,1,1
j=false
if not y.eof then
j=true
else    

dim a9,a10,a11
a11=false
r=w&ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(47)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47) & m & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116) 
s=w&ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(47) & a & ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
if v then call echo(ChrW(25552)&ChrW(31034),ChrW(37319)&ChrW(38598)&ChrW(24320)&ChrW(22987))
if checkFile(s) then
a10=readfile(s,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if v then call echo(ChrW(25552)&ChrW(31034),ChrW(35835)&ChrW(26412)&ChrW(22320)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) & s)
else
t=ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(105)&ChrW(112)&ChrW(49)&ChrW(51)&ChrW(56)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(47)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(61)&a&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)
u=ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(97)&ChrW(111)&ChrW(115)&ChrW(104)&ChrW(117)&ChrW(100)&ChrW(105)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(47)&a&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)
if checkFile(s)=false then
call saveRemoteFile_WinHttp(t,s,t)  
if v then call echo(ChrW(19979)&ChrW(36733)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(49)&ChrW(32593)&ChrW(22336)&ChrW(23436)&ChrW(25104), t)
if len(a10)=0 then
call saveRemoteFile_WinHttp(u,s,u)  
if v then call echo(ChrW(19979)&ChrW(36733)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(50)&ChrW(32593)&ChrW(22336)&ChrW(23436)&ChrW(25104), u)
end if
end if
a10=readfile(s,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))

if v then call echo(ChrW(25552)&ChrW(31034),ChrW(37319)&ChrW(38598)&ChrW(20869)&ChrW(23481)&ChrW(38271)&ChrW(24230) & len(a10))
end if
e=getStrCut(a10,ChrW(60)&ChrW(116)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62),ChrW(60)&ChrW(47)&ChrW(116)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62),2)
if instr(a10,ChrW(60)&ChrW(116)&ChrW(100)&ChrW(62)&ChrW(21345)&ChrW(21495)&ChrW(24402)&ChrW(23646)&ChrW(22320)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(100)&ChrW(62))>0 then
f=getStrCut(a10,ChrW(60)&ChrW(116)&ChrW(100)&ChrW(62)&ChrW(21345)&ChrW(21495)&ChrW(24402)&ChrW(23646)&ChrW(22320)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(100)&ChrW(62),ChrW(60)&ChrW(47)&ChrW(116)&ChrW(114)&ChrW(62),2) 
if v then call echo(ChrW(25552)&ChrW(31034),ChrW(25552)&ChrW(21462)&ChrW(20869)&ChrW(23481)&ChrW(31532)&ChrW(49)&ChrW(31181) & len(a10))
else
f=getStrCut(a10,ChrW(60)&ChrW(116)&ChrW(100)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(104)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(25163)&ChrW(26426)&ChrW(24402)&ChrW(23646)&ChrW(22320)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(100)&ChrW(62),ChrW(60)&ChrW(47)&ChrW(116)&ChrW(114)&ChrW(62),2)
f=replace(f,ChrW(60)&ChrW(97)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(34),ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(34))
f=replace(f,ChrW(19978)&ChrW(25253)&ChrW(32416)&ChrW(38169),"")
if v then call echo(ChrW(25552)&ChrW(31034),ChrW(25552)&ChrW(21462)&ChrW(20869)&ChrW(23481)&ChrW(31532)&ChrW(50)&ChrW(31181) & len(a10))
end if
f=delhtml(f)
n=split(f&ChrW(32),ChrW(32))
o=phptrim(n(0))
p=phptrim(n(1))
if right(o,1)=ChrW(30465) then
o=mid(o,1,len(o)-1)
end if
if right(p,1)=ChrW(24066) then
p=mid(p,1,len(p)-1)
end if
if instr(a10,ChrW(60)&ChrW(116)&ChrW(100)&ChrW(62)&ChrW(36816)&ChrW(32)&ChrW(33829)&ChrW(32)&ChrW(21830)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(100)&ChrW(62))>0 then
q=delhtml( getStrCut(a10,ChrW(60)&ChrW(116)&ChrW(100)&ChrW(62)&ChrW(36816)&ChrW(32)&ChrW(33829)&ChrW(32)&ChrW(21830)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(100)&ChrW(62),ChrW(60)&ChrW(47)&ChrW(116)&ChrW(114)&ChrW(62),2) )
else
q=delhtml( getStrCut(a10,ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(36816)&ChrW(33829)&ChrW(21830)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(100)&ChrW(62),ChrW(60)&ChrW(47)&ChrW(116)&ChrW(114)&ChrW(62),2) )
end if
q=phptrim(q)
if left(q,2)=ChrW(20013)&ChrW(22269) then
q=mid(q,3)
end if
if v then call echo(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118),o)
if v then call echo(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121),p)
if v then call echo(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(77)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101),q)
if v then call echo(ChrW(115),f):doevents
if o="" and p="" then exit function

if checkfile(r)=false then
call writeToFile(r,e,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if
z.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&a4&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&a&ChrW(39),x,1,3
if z.eof then

z.addnew 
z(ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101))=a
z(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118))=o
z(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121))=p 
z(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=q
z.update 

end if:z.close
end if

if j=false then
y.close    
k=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&a4&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&a&ChrW(39)

y.open k,x,1,1
end if
if not y.eof then
if b=ChrW(99)&ChrW(116) then
mobileToAddr2025=y(ChrW(99)&ChrW(116))
elseif b=ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118) then
mobileToAddr2025=y(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118))
elseif b=ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121) then
mobileToAddr2025=y(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121))
elseif b=ChrW(51) then
mobileToAddr2025=y(ChrW(99)&ChrW(116))&y(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118))&y(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121))
elseif b=ChrW(97)&ChrW(108)&ChrW(108) then
mobileToAddr2025=y(ChrW(99)&ChrW(116)) & ChrW(32)& y(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)) & ChrW(32) &y(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121)) 
else
mobileToAddr2025=y(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)) & y(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121))

if y(ChrW(99)&ChrW(116)) <>ChrW(20013)&ChrW(22269) then
mobileToAddr2025=y(ChrW(99)&ChrW(116)) & mobileToAddr2025
end if
end if 
end if
y.close
set y=nothing
set x=nothing
end function
%>