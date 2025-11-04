<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%
%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"-->
<!--#Include File = "merge.asp"-->
<!--#Include File = "function.asp"--><%
call showCheckAdminRule(ChrW(27169)&ChrW(26495)&ChrW(24211))
call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,id,title,isDebug,s,tplname,url,thisV
thisV=2
isDebug=false
dim serverUrl,webinfo 
call readWebsiteServerUrl(serverUrl,tplname,webinfo)
function useTplAction(a,b)
dim c,d,e,f,g,h,i,j
call echo(ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(85)&ChrW(114)&ChrW(108),serverUrl):doevents
call createFolder(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108))
j=serverUrl & ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(63)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(61)&a&ChrW(38)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(61)&webinfo
c=gethttpurl(j,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(c,ChrW(91)&ChrW(36)&ChrW(93))>0 then
e=split(c,ChrW(91)&ChrW(36)&ChrW(93))
if ubound(e) >=2 then
call eerr(ChrW(25552)&ChrW(31034)&ChrW(20449)&ChrW(24687),c)
end if
end if
if instr(c,ChrW(91)&ChrW(44)&ChrW(93))=false then
call eerr(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(112)&ChrW(108)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(24212)&ChrW(29992)&ChrW(27169)&ChrW(26495)&ChrW(24182)&ChrW(36816)&ChrW(34892)&ChrW(21160)&ChrW(20316)&ChrW(65292)&ChrW(26377)&ChrW(38382)&ChrW(39064)&ChrW(65292)&j,c)
end if
d=split(c,ChrW(91)&ChrW(44)&ChrW(93))
for each h in d
if instr(h,ChrW(91)&ChrW(124)&ChrW(93))>0 then
e=split(h,ChrW(91)&ChrW(124)&ChrW(93))
f=e(1)
g=e(2)
i=e(3)
if isDebug then call echo(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101),f)
if isDebug then call echo(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),g)
if isDebug then call echo(ChrW(114)&ChrW(101)&ChrW(115),i)
if f <>"" then
call forActionList(a,b,f,g)        
call downServerRes(i)    
end if
if isDebug then call hr()
end if
next 
dim k
k=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) & a & ChrW(47) & a & ChrW(46)&ChrW(106)&ChrW(112)&ChrW(103)
if checkfile(k)=false then
j=getServerUrl & ChrW(47)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(109)&ChrW(98)&ChrW(47) & a & ChrW(46)&ChrW(106)&ChrW(112)&ChrW(103)
if isDebug then call echo(ChrW(19979)&ChrW(36733)&ChrW(32553)&ChrW(27983)&ChrW(22270)&ChrW(23436)&ChrW(25104),k & ChrW(32)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(32)  & j)
call saveRemoteFile(j,k)
end if
call echo(ChrW(109)&ChrW(101)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(67)&ChrW(115)&ChrW(115)&ChrW(83)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101),ChrW(109)&ChrW(101)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(67)&ChrW(115)&ChrW(115)&ChrW(83)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101))
call mergeCssStyle(a)
if isDebug then 
useTplAction = c
else
useTplAction = ChrW(23436)&ChrW(25104)&ChrW(65292)&ChrW(35843)&ChrW(35797)&ChrW(20026)&ChrW(20551)&ChrW(65292)&ChrW(19981)&ChrW(26174)&ChrW(31034)&ChrW(35814)&ChrW(32454)&ChrW(20449)&ChrW(24687)&ChrW(65292)&ChrW(21487)&ChrW(25163)&ChrW(21160)&ChrW(20462)&ChrW(25913)&ChrW(21518)&ChrW(26597)&ChrW(30475)&ChrW(22238)&ChrW(26174)&ChrW(20449)&ChrW(24687)
end if
end function
function downServerRes(a)
dim b,c,d,e,f
b=split(a,vbcrlf)
for each c in b
if c <>"" then
d=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47) & c
e=serverUrl & c
d=handlePath(d)
f=""
if checkfile(d) then
f=ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(32)&ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(62)&ChrW(26412)&ChrW(26377)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(26080)&ChrW(38656)&ChrW(19979)&ChrW(36733)&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)
end if
if isDebug then call echo(ChrW(36164)&ChrW(28304)&ChrW(22320)&ChrW(22336),e & ChrW(32)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(32) & d & f)
if f="" then
call createDirFolder(d)
call saveRemoteFile(e,d)
if isDebug then call echo(ChrW(19979)&ChrW(36733)&ChrW(36164)&ChrW(28304)&ChrW(25104)&ChrW(21151),d)
end if
end if
next
end function
function forActionList(a,b,c,d)
dim e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u
if b=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
u=a & ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)
call createDirFolder(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) & a) 
call createDirFolder(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) & a & ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)) 
end if 
e=split(d,vbcrlf)
for each g in e
g=trim(g)
k="":l="":n="":o="":p="":q=""
if g <>"" then
k="":l=""
if isDebug then call echo(ChrW(115),g)
m=strCut(g,ChrW(123),ChrW(125),0)
if isDebug then call echo(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101),m)
if m <>"" then
g=replace(g,ChrW(123)& m &ChrW(125),"")
m=m&ChrW(44)
k=strCut(m,ChrW(100)&ChrW(105)&ChrW(100)&ChrW(58),ChrW(44),0)
l=strCut(m,ChrW(114)&ChrW(111)&ChrW(119)&ChrW(58),ChrW(44),0)
n=strCut(m,ChrW(97)&ChrW(115)&ChrW(99)&ChrW(58),ChrW(44),0)
o=strCut(m,ChrW(115)&ChrW(116)&ChrW(114)&ChrW(58),ChrW(44),0)
p=strCut(m,ChrW(115)&ChrW(116)&ChrW(114)&ChrW(49)&ChrW(58),ChrW(44),0)
q=strCut(m,ChrW(115)&ChrW(116)&ChrW(114)&ChrW(50)&ChrW(58),ChrW(44),0)
r=strCut(m,ChrW(115)&ChrW(116)&ChrW(114)&ChrW(51)&ChrW(58),ChrW(44),0)
s=strCut(m,ChrW(115)&ChrW(116)&ChrW(114)&ChrW(52)&ChrW(58),ChrW(44),0)
t=strCut(m,ChrW(115)&ChrW(116)&ChrW(114)&ChrW(53)&ChrW(58),ChrW(44),0)
if isDebug then 
call echo(ChrW(100)&ChrW(105)&ChrW(100),k)
call echo(ChrW(114)&ChrW(111)&ChrW(119),l)
call echo(ChrW(97)&ChrW(115)&ChrW(99),n)
call echo(ChrW(115)&ChrW(116)&ChrW(114),o)
call echo(ChrW(115)&ChrW(116)&ChrW(114)&ChrW(49),p)
call echo(ChrW(115)&ChrW(116)&ChrW(114)&ChrW(50),q)
call echo(ChrW(115)&ChrW(116)&ChrW(114)&ChrW(51),r)
call echo(ChrW(115)&ChrW(116)&ChrW(114)&ChrW(52),s)
call echo(ChrW(115)&ChrW(116)&ChrW(114)&ChrW(53),t)
end if
end if
if isDebug then call echo(ChrW(115)&ChrW(50),g)
g=replace(g,vbtab,ChrW(32))
g=replace(g,ChrW(32)&ChrW(32),ChrW(32))
g=replace(g,ChrW(32)&ChrW(32),ChrW(32))
g=replace(g,ChrW(32)&ChrW(32),ChrW(32))
f=split(g&ChrW(32)&ChrW(32)&ChrW(32),ChrW(32))
h=h & getTplModle(u,f(0),f(1),f(2),k,l,n,o,p,q,r,s,t) & vbcrlf
end if
next
if b <>ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
i=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47) & c
if checkfile(i)=false then
if checkfile(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112))=false then
call die(ChrW(40664)&ChrW(35748)&ChrW(27169)&ChrW(26495)&ChrW(39029)&ChrW(26410)&ChrW(25214)&ChrW(21040)&ChrW(65292)&ChrW(26597)&ChrW(30475)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(35831)&ChrW(27880)&ChrW(24847)&ChrW(26597)&ChrW(30475)&ChrW(32)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(32) & handlePath(i))
end if
j=readfile(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
else
j=readfile(i,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if
f=split(j,ChrW(60)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62))
h=f(0) & ChrW(60)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbcrlf & h & vbcrlf & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbcrlf &ChrW(60)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(62)
call writetofile(i,h,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if isDebug then call echo(ChrW(29983)&ChrW(25104)&ChrW(32593)&ChrW(39029),i)
else
i=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) & a & ChrW(47) & c
if checkfile(i)=false then
if checkfile(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112))=false then
call die(ChrW(40664)&ChrW(35748)&ChrW(27169)&ChrW(26495)&ChrW(39029)&ChrW(26410)&ChrW(25214)&ChrW(21040)&ChrW(65292)&ChrW(24212)&ChrW(29992)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(35831)&ChrW(27880)&ChrW(24847)&ChrW(26597)&ChrW(30475)&ChrW(32)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(32) & handlePath(i))
end if
j=readfile(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
else
j=readfile(i,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if
f=split(j,ChrW(60)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62))
h=f(0) & ChrW(60)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbcrlf & h & vbcrlf & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbcrlf &ChrW(60)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(62)
h=replace(h,ChrW(60)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62),ChrW(60)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbcrlf & ChrW(60)&ChrW(37)&ChrW(32)&ChrW(111)&ChrW(110)&ChrW(65)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(111)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(37)&ChrW(62) & showThisWebAuthorInfo2022())    
call writetofile(i,h,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if isDebug then call echo(ChrW(29983)&ChrW(25104)&ChrW(39044)&ChrW(35272)&ChrW(32593)&ChrW(39029),i)
end if 
end function
function showThisWebAuthorInfo2022()
dim a,b,c,d
a=authorInfo2()
d=ChrW(99)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(40)&ChrW(34)& replace(a,vbcrlf,ChrW(92)&ChrW(110))  &ChrW(34)&ChrW(41)
d=ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)& d &ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)
showThisWebAuthorInfo2022=ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)& vbcrlf & a &ChrW(45)&ChrW(45)&ChrW(62) & vbcrlf & d
end function
dim modleUrlList
function getTplModle(a,b,c,d,e,f,g,h,i,j,k,l,m)
dim n
d=d & ""
c=c&""
if d=ChrW(48) or d=ChrW(49) then d=""
if c="" then c=ChrW(48)&ChrW(48)&ChrW(49)
n=b & ChrW(95) & c 
if d <>"" then n=n & ChrW(95) & d
if lcase(right(n,4)) <>ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112) then
n=n & ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
end if
dim o,p 
p=serverUrl & ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)&ChrW(63)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)& b &ChrW(38)&ChrW(105)&ChrW(100)&ChrW(61)& c &ChrW(38)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61) & d& ChrW(38)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(61)&webinfo
if e <>"" then p=p & ChrW(38)&ChrW(100)&ChrW(105)&ChrW(100)&ChrW(61)&escape(e)
if f <>"" then p=p  & ChrW(38)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(61)&f
if g <>"" then p=p & ChrW(38)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(61)&g 
if h <>"" then p=p & ChrW(38)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(61)&escape(h)
if i <>"" then p=p & ChrW(38)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(49)&ChrW(61)&escape(i)
if j <>"" then p=p & ChrW(38)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(50)&ChrW(61)&escape(j)
if k <>"" then p=p & ChrW(38)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(51)&ChrW(61)&escape(k)
if l <>"" then p=p & ChrW(38)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(52)&ChrW(61)&escape(l)
if m <>"" then p=p & ChrW(38)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(53)&ChrW(61)&escape(m)
if instr(ChrW(12304)& modleUrlList &ChrW(12305),ChrW(12304)& p &ChrW(12305))>0 then
getTplModle=ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(35)&ChrW(73)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)& n &ChrW(34)&ChrW(45)&ChrW(45)&ChrW(62)
exit function
end if
modleUrlList=modleUrlList & ChrW(12304)& p &ChrW(12305)
if isDebug then call echo(ChrW(26679)&ChrW(24335)&ChrW(117)&ChrW(114)&ChrW(108),p)
o=gethttpurl(p,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
call writetofile(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) & a & n,o,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if isDebug then call echo(ChrW(33719)&ChrW(24471)&ChrW(27169)&ChrW(26495)&ChrW(22359),n)
getTplModle=ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(35)&ChrW(73)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)& n &ChrW(34)&ChrW(45)&ChrW(45)&ChrW(62)
end function
If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then
dim updateusername,sListStr,splVersion
sListStr=gethttpurl(serverUrl & ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(47)&ChrW(63)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(61)&webinfo&ChrW(38)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&tplname&ChrW(38)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(118)&ChrW(61)& thisV &ChrW(38)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(61)&escape(request(ChrW(107)&ChrW(101)&ChrW(121)))&ChrW(38)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&escape(request(ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(66)&ChrW(121)))&ChrW(38)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61)&request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(sListStr,ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58))=false then
serverUrl=getServerUrl()
sListStr=gethttpurl(serverUrl & ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(47)&ChrW(63)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(61)&webinfo&ChrW(38)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(61)&escape(request(ChrW(107)&ChrW(101)&ChrW(121))),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if
if instr(sListStr,ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34))>0 then
updateusername=strcut(sListStr,ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34),ChrW(34),0)
if updateusername <>"" then
conn.execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& updateusername &ChrW(39))
end if
end if
call die(sListStr)
elseIf Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(117)&ChrW(115)&ChrW(101) Then
s= useTplAction(request(ChrW(116)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(100)),ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))
call useTpl2022(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47),request(ChrW(116)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(100)))
call die(s)
elseIf Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) Then
s= useTplAction(request(ChrW(116)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(100)),ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))
call die(s)
elseIf Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(109)&ChrW(121)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114) Then
sListStr=gethttpurl(serverUrl & ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(47)&ChrW(63)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(61)&webinfo,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& sListStr &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
elseIf Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101) Then
url=serverUrl & ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(47)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(38)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(61)&webinfo&ChrW(38)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&escape(request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
s=gethttpurl(url,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if left(s,4)=ChrW(91)&ChrW(79)&ChrW(75)&ChrW(93) then 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101) ,conn,1,3
if not rs.eof then
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
rs.update
end if:rs.close
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
else
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(22495)&ChrW(21517)&ChrW(23545)&ChrW(24212)&ChrW(30340)&ChrW(36134)&ChrW(21495)&ChrW(19981)&ChrW(27491)&ChrW(30830)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
elseIf Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101) Then
call updateTemplatePage()
End if 
function updateTemplatePage()
dim a
a=ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
if checkfile(a)=false then
url=serverUrl & ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(47)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)
call saveRemoteFile(url,a)
end if
if checkfile(a) then
response.redirect(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112))
end if
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(26356)&ChrW(26032)&ChrW(27169)&ChrW(26495)&ChrW(23436)&ChrW(25104)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>模板列表</title>
<script type="text/javascript" src="../../js/jquery.js"></script><link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
<style>
.layui-table, .layui-table-view {margin: 10px 0;}
.layui-table thead tr {background-color: #f2f2f2}/*表格头背景颜色*/
body{padding:10px 6px 30px 6px;background: #FFF}
</style>
</head>
<body>  
<div class="layui-form ">
<div class="layui-inline">
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_min" placeholder="开始日期" autocomplete="off" class="layui-input date">
</div>
<div class="layui-input-inline">-</div>
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_max" placeholder="结束日期" autocomplete="off" class="layui-input date">
</div>
</div>
<div class="layui-inline" style="width:110px"> 
<select name="orderBy">
<option value="">选择排序</option> 
<option value="hot" selected>热度</option> 
<option value="sortrank">排序</option>  
<option value="id">ID</option>  
</select> 
</div>
<div class="layui-inline"> 
<input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称" onkeypress="if (event.keyCode === 13) {$('button[data-type=reload]').click(); }">
</div>
<button class="layui-btn" data-type="reload" id="btnsearch">搜索<%=serverUrl%></button>
<button class="layui-btn"  data-type="myuser" id="myuser"></button>
<!-- <button class="layui-btn" onclick="showwin('添加信息','listform.asp?')">添加</button> -->
<!-- <button class="layui-btn" data-type="batchdel">删除</button> -->
</div>
<script type="text/html" id="barDemo">
<!--   <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> 
<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>  -->
{{#  if(d.usetplid == '1'){ }}
<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="use"><i class="layui-icon layui-icon-app"></i>应该</a> 
{{#  } else { }}
<a class="layui-btn layui-btn-xs layui-btn-normal layui-btn-disabled"><i class="layui-icon layui-icon-dollar"></i>开通</a> 
{{#  } }}
{{#  if(d.usetplid == '1'){ }}
<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="view"><i class="layui-icon layui-icon-template"></i>预览</a> 
{{#  } else { }}
<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="gotoview"><i class="layui-icon layui-icon-link"></i>演示</a> 
{{#  } }}
{{#  if(d.edittplid == '1'){ }}
<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="customizecustomize"><i class="layui-icon layui-icon-set"></i>自定义</a>      {{#  } else { }}
<a class="layui-btn layui-btn-xs layui-btn-normal layui-btn-disabled" ><i class="layui-icon layui-icon-set"></i>自定义</a>  
{{#  } }}
</script>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
<script>
layui.use(['form','table'],function(){
var form = layui.form
table = layui.table; 
//方法级渲染
table.render({
elem: '#demo',
url: '?act=list',
cols: [
[
// {type: 'checkbox', fixed: 'left'},
{ field: 'id', title: 'ID', width:70,sort: false }
,{ field: 'img', title: '缩览图', width:120, sort: false, templet: function(d){
return '<span>'+d.img+'</span>';
}} 
,{ field: 'ahref', title: '模板ID', width:120, sort: false, templet: function(d){
return '<span>'+d.ahref+'</span>';
}} 
// ,{ field: 'pic', title: '预览', sort: false } 
,{ field: 'ntype', title: '类型', width:90, sort: false }
,{ field: 'title', title: '标题', sort: false, templet: function(d){
return '<span>'+d.title+'</span>';
}} 
// ,{ field: 'sortrank', title: '排序', width:90, sort: false }
, { fixed: 'right', title: '操作', width: 240, toolbar: '#barDemo' }
]
],
id: 'testReload',
page: true,
limit: 20,
done: function(res, curr, count) {
//不用这种
// $('.layui-table tbody td[data-field="img"]').each(function(){  
//   $(this).html($(this).text()); // 这里的.text()其实取到的是HTML字符串，.html()会解析它  
// }); 
// $('.layui-table tbody td[data-field="ahref"]').each(function(){  
//   $(this).html($(this).text()); // 这里的.text()其实取到的是HTML字符串，.html()会解析它  
// });  
// console.log(res)
$("#myuser",).text("积分："+res.money)
if(res.isUpdateTemplatePage!=undefined){ 
layer.confirm('已经有新版模板更新程序，是否更新？', function(index) { 
layer.close(index);
var layerIndex = layer.msg('正在处理更新模板程序，请等待！', { icon: 16, time: false, shade: 0.8 });
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=update",
data: {  },
success: function(data) {
switch (data.status) {                                
case "y":
layer.msg(data.info);
location.reload();
break;
}
}
});
});
}
// alert("加载完成")
// 表格加载完成后执行其他动作
// res 为接口返回的数据
// curr 为当前页码
// count 为数据总数
// 其他动作...
}
});
//是否置顶
form.on('switch', function(data){
var index = layer.msg('修改中，请稍候',{icon: 16,time:false,shade:0.8});
setTimeout(function(){
var pid=data.elem.value
layer.close(index);
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=isthrough",
data: { "id": pid,"isthrough":data.elem.checked }, 
success: function(data) { 
switch (data.status) {
case "y": 
break;
case "n":                       
break;
}
}
});
if(data.elem.checked){
layer.msg("置顶成功！");
}else{
layer.msg("取消置顶成功！");
}
},500);
})
var $ = layui.$,
active = {
reload: function() {
var demoReload = $('#demoReload');
//执行重载
table.reload('testReload', {
page: {
curr: 1 //重新从第 1 页开始
},
where: {
date_min: $('input[name=date_min]').val()
,date_max: $('input[name=date_max]').val()
,key: $('input[name=key]').val()
,parentid: $('select[name=parentid]').val()
,orderBy: $('select[name=orderBy]').val()
}
});
},batchdel: function(){
//testReload为table渲染时改变的 id: 'testReload'
var checkStatus = table.checkStatus('testReload')
,checkData = checkStatus.data; //得到选中的数据
if(checkData.length === 0){
return layer.msg('请选择数据');
}
var idlist='';
for(var i=0;i<checkData.length;i++){
if(idlist!='')idlist+=',';
idlist+=checkData[i].id;
}              
layer.confirm('确定删除吗？', function(index) {
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=del",
data: { "id": idlist },
success: function(data) {
switch (data.status) {
case "y":
table.reload('testReload');
layer.msg('已删除');
break;
}
}
});
});
},myuser: function(){                   
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=myuser", 
success: function(data) {
switch (data.status) {
case "y": 
var splxx=data.info.split("[$]");
if(splxx.length>=3){
layer.open({
title: '提示'
,content: splxx[1]
});
if(splxx.length>=4){
$("#myuser",).text("积分："+splxx[2])
}
}else{
layer.msg(data.info);
} 
break;
}
}
});
} 
};
$('.layui-form .layui-btn').on('click', function() {
var type = $(this).data('type');
active[type] ? active[type].call(this) : '';
});
//监听行工具事件
table.on('tool(demo)', function(obj) {
var data = obj.data;
var pid = obj.data["id"]
var tplid = obj.data["tplid"]
if (obj.event === 'del') {
layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'}, function(index) {
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=del",
data: { "id": pid },
success: function(data) {
switch (data.status) {
case "y":
obj.del();
break;
}
}
});
layer.close(index);
});
}else if (obj.event === 'use') {
layer.confirm('确定要使用此模板？',{icon:3, title:'提示信息'}, function(index) {
var aTplHtml="<a href='<%=WEB_VIEWURL%>' style='color:red' target='_blank'>点击查看：/</a>"
var winObj=layer.open({
title: '应用模板'
,content: '正在应用当前选中模板，请等待！'
});      
$.ajax({
type: "POST",
cache: true,
dataType: "html",
url: "?act=use",
data: { "tplid": obj.data["tplid"] },
success: function(data) {  
var splxx=data.split("[$]");
if(splxx.length==3){
layer.open({
title: '提示'
,content: splxx[1]
});  
}else{ 
layer.msg("处理应该模板完成。"+aTplHtml, {
icon: 1,
time: 4000 //2秒关闭（如果不配置，默认是3秒）
});
}
}
});
layer.close(index);
});
}else if (obj.event === 'view') {
layer.confirm('确定要查看此模板？',{icon:3, title:'提示信息'}, function(index) {
var aTplHtml="<a href='/tpl/"+tplid+"' style='color:red' target='_blank'>点击查看：/tpl/"+tplid+"</a>"
var winObj=layer.open({
title: '预览模板'
,content: "正在处理预览模板，请等待！"
});  
$.ajax({
type: "POST",
cache: true,
dataType: "html",
url: "?act=view",
data: { "tplid": obj.data["tplid"] },
success: function(data) { 
var splxx=data.split("[$]");
if(splxx.length==3){
layer.open({
title: '提示'
,content: splxx[1]
});  
}else{
// layer.msg('查找模板成功' +tplid);
// window.open('/tpl/'+tplid,"xiyueta.com"+tplid)
layer.msg("处理预览模板完成。"+aTplHtml, {
icon: 1,
time: 4000 //2秒关闭（如果不配置，默认是3秒）
});
}
}
});
layer.close(index);
});
}else if (obj.event === 'gotoview') {//预览
window.open('http://www.xiyueta.com/tpl/'+tplid,"xiyueta.com")
} else if (obj.event === 'edit') {
showwin('修改信息', 'listform.asp?id=' + pid)
} else if (obj.event === 'edit2') {
showwin('修改信息', 'listform.asp?editor=no&id=' + pid)
} else if (obj.event === 'customizecustomize') {
showwin('自定义', 'userform.asp?editor=no&tplid=' + tplid)
} else if (obj.event === 'editusername') {
layer.prompt({
formType: 1,
title: '输入网站对应的账号'
}, function(value, index) {
layer.close(index);
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=editusername",
data: { "username":value }, 
success: function(data) { 
switch (data.status) {
case "y":                                                    
layer.msg(data.info,{icon:1});
$("#btnsearch").click();//刷新列表
break;
case "n":                                    
layer.msg(data.info,{icon:2});
break;
}
}
});
});
}
});
//监听单元格编辑
table.on('edit(demo)', function(obj){
var value = obj.value //得到修改后的值
,data = obj.data //得到所在行所有键值
,field = obj.field; //得到字段
var thisObj=obj
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=onlineedit&id="+data.id,
data: { "title":  value  },
success: function(data) {
switch (data.status) {
case "y": 
layer.msg(data.info, {icon: 1});
break;
case "n": 
layer.msg(data.info, {icon: 2}); 
break;
}
}
}); 
});
});
</script>
<script type="text/javascript" src="../../js/pc.js"></script>  
</body>
</html>
