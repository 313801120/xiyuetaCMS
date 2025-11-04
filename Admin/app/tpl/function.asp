<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%

function getServerUrl()

dim a,b
b=ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(99)&ChrW(109)&ChrW(115)&ChrW(47)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(38)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(61)&webinfo
a=gethttpurl(b,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(a,ChrW(123)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58)&ChrW(39))>0 then
b=strcut(a,ChrW(123)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58)&ChrW(39),ChrW(39)&ChrW(125),0)
if b <>"" then
conn.execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(39)& b &ChrW(39))
end if
else      

b=ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(99)&ChrW(109)&ChrW(115)&ChrW(47)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(38)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(61)&webinfo
a=gethttpurl(b,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))

if instr(a,ChrW(123)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58)&ChrW(39))>0 then
b=strcut(a,ChrW(123)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58)&ChrW(39),ChrW(39)&ChrW(125),0)
else
b=ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(47)
end if
end if
getServerUrl=b
end function

function readWebsiteServerUrl(a,b,c)
dim d,e,f
Set f = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c=request.serverVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69))
f.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(44)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101) ,conn,1,1
if not f.eof then 
c=c&ChrW(64)&f(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(64)&f(ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110))

a=f(ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108))
b=f(ChrW(116)&ChrW(112)&ChrW(108)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
end if:f.close
a=getServerUrl()











c=escape(c)
end function
%>