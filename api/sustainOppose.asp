<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../common.Asp"--><%

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(110) then   
call sustainOppose(ChrW(115)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(110),ChrW(25903)&ChrW(25345))
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(111)&ChrW(112)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(101) then   
call sustainOppose(ChrW(111)&ChrW(112)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(101),ChrW(21453)&ChrW(23545))
end if
function sustainOppose(a,b)
dim c,d,e,f
c=request(ChrW(105)&ChrW(100))
e=request(ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c ,conn,1,3
if not rs.eof then 
d=rs(a)

rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(32)& getAccessDatediff(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))&ChrW(61)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)& a &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100)) ,conn,1,3
if rsx.eof then
rsx.addnew
rsx(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100))=rs(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100))
rsx(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(100))=rs(ChrW(105)&ChrW(100))
rsx(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=a
rsx(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))=1
rsx(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rsx(ChrW(105)&ChrW(112))=getip()
rsx.update
rs(a)=1
rs.update
d=rs(a)
if b=ChrW(25903)&ChrW(25345) then
f=ChrW(35874)&ChrW(35874)&ChrW(24744)&ChrW(30340)&ChrW(25903)&ChrW(25345)
else
f=ChrW(35874)&ChrW(35874)&ChrW(24744)&ChrW(30340)&ChrW(24847)&ChrW(35265)
end if 
else 
rsx(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rsx(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))=rsx(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))+1
rsx.update
rs(a)=rsx.recordcount
rs.update
d=rs(a)
f=ChrW(24744)&ChrW(24050)&ChrW(25552)&ChrW(20132)&ChrW(36807)
end if:rsx.close
end if:rs.close
if e=ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110) then 
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& f &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& d &ChrW(34)&ChrW(125))
else
call die(d)
end if
end function
%>