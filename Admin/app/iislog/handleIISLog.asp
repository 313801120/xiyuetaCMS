<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><%
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(101)&ChrW(110)&ChrW(100) then
call handleIISLog(request(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)))
end if
sub handleIISLog(a)
dim b,c,d,e,f,g,h,i,j,k,l
c=readfile(a,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
d=split(c,vbcrlf)
g=0
h=0
for each f in d
if instr(f,ChrW(32)) and left(f,1) <>ChrW(35) then
g=g+1
e=split(f,ChrW(32))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(93),conn,1,3
rs.addnew


















rs(ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=format_Time(e(0) & ChrW(32)& e(1),1) 
rs(ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(112))=e(2)
rs(ChrW(109)&ChrW(101)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(100))=e(3)
rs(ChrW(117)&ChrW(114)&ChrW(108))=left(e(4),255)
rs(ChrW(117)&ChrW(114)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(114))=e(5)
rs(ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116))=e(6)
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=e(7)
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(112))=e(8)
rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100))=e(9)
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116))=left(e(10),255)
rs(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))=e(11)
rs(ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))=e(12)
e(13)=left(e(13),4)

rs(ChrW(119)&ChrW(105)&ChrW(110)&ChrW(51)&ChrW(50)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))=e(13)
rs(ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=e(14)
j=e(4)
i=instrrev(j,ChrW(47))
if i>0 then
k=mid(j,i+1)
rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=k
i=instrrev(k,ChrW(46))
if i>0  then
l=mid(k,i+1)
rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=lcase(l)
end if
end if
rs.update:rs.close
h=h+1
end if
next
call die(ChrW(20849)&ChrW(28155)&ChrW(21152)& h &ChrW(26465)&ChrW(65292) & vbEchoTimer())
end sub
%>
