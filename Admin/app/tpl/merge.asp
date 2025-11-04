<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%


function mergeCssStyle(a)
call echo(ChrW(25552)&ChrW(31034) & a,ChrW(22788)&ChrW(29702)&ChrW(109)&ChrW(101)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(67)&ChrW(115)&ChrW(115)&ChrW(83)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101))
dim b,c,d,e,f,g,h,i,j,k,l,m,n,o
dim p,q,r,s
p=ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) & a & ChrW(47)
b=p & ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) 
c=getDirAspList(b)
m=p & ChrW(47)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(99)&ChrW(115)&ChrW(115)
n=readfile(m,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
l=""
f=split(c,vbcrlf)
for each i in f
call echo(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(32)&ChrW(49)&ChrW(49)&ChrW(49),i)
d=readfile(i,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
e=d
k=getStrCut(d,ChrW(60)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(62),ChrW(60)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(62),0)
if k <>"" then
d=replace(d,ChrW(60)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(62)& k &ChrW(60)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(62),"")
if instr(d,ChrW(99)&ChrW(115)&ChrW(115)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34))>0 or instr(d,ChrW(99)&ChrW(115)&ChrW(115)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34))>0 then
j=getStrCut(d,ChrW(99)&ChrW(115)&ChrW(115)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34),ChrW(34),0)
if j="" then j=getStrCut(d,ChrW(99)&ChrW(115)&ChrW(115)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34),ChrW(34),0)
k=replace(k,ChrW(60) & ChrW(37)&ChrW(61)&ChrW(99)&ChrW(115)&ChrW(115)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(37) & ChrW(62),j)
k=replace(k,ChrW(60) & ChrW(37)&ChrW(61)&ChrW(99)&ChrW(115)&ChrW(115)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(37) & ChrW(62),j)
end if

if instr(d,ChrW(114)&ChrW(101)&ChrW(115)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(34))>0 or instr(d,ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(34))>0 then
o=getStrCut(d,ChrW(114)&ChrW(101)&ChrW(115)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(34),ChrW(34),0)
if o="" then o=getStrCut(d,ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(34),ChrW(34),0)
k=replace(k,ChrW(60) & ChrW(37)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(37) & ChrW(62),o)
k=replace(k,ChrW(60) & ChrW(37)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(37) & ChrW(62),o)
call echo(ChrW(114)&ChrW(101)&ChrW(115)&ChrW(85)&ChrW(114)&ChrW(108),o)
end if
k=cssCompression(k,0)
if instr(vbcrlf & l & vbcrlf, vbcrlf & k & vbcrlf)=false then
l=l & vbcrlf & k
end if
end if

if e <>d then
call writetofile(i,d,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if
call echo(ChrW(99)&ChrW(115)&ChrW(115)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),j)
call echo(ChrW(99)&ChrW(83)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101),k)
call hr()
next

if n <>l then    
call writetofile(m,l,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if

c=getDirAspList(p)
f=split(c,vbcrlf)
for each i in f
call echo(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(32)&ChrW(50)&ChrW(50)&ChrW(50)&ChrW(50),i)
d=readfile(i,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
e=d
q=ChrW(60)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(108)&ChrW(61)&ChrW(39)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(101)&ChrW(101)&ChrW(116)&ChrW(39)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)& a &ChrW(47)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(99)&ChrW(115)&ChrW(115)
r=ChrW(39)&ChrW(62)
s=getStrCut(d,q,r,1)
if s <>"" then
d=replace(d,s,"")
end if
q=q & ChrW(63)&ChrW(110)&ChrW(61) & getrnd(11) & r
if instr(d,q)=false then
d=replace(d,ChrW(60)&ChrW(47)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(62), ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32) & q & ChrW(60)&ChrW(47)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(62))        
if e <>d then
call writetofile(i,d,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if
end if
next
end function 
%>