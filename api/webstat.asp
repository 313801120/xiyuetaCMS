<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../common.Asp"--><%
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116) then
call saveWebStat()
end if
function saveWebStat()
dim a,b,c,d,e
a=request(ChrW(116)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(108))
b=request(ChrW(117)&ChrW(114)&ChrW(108))
c=request(ChrW(119))
d=request(ChrW(104))
e=unescape(request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116)))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(61)&ChrW(39)& getIP() &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(39)& b&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediff(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48) ,conn,1,3
if rs.eof then 
rs.addnew
rs(ChrW(105)&ChrW(112))=getip()
rs(ChrW(117)&ChrW(114)&ChrW(108))=b
rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114))=look_ip(getip())
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116))=e
rs(ChrW(116)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(108))=a
rs(ChrW(112)&ChrW(118))=1
rs(ChrW(119))=c
rs(ChrW(104))=d
else
rs(ChrW(112)&ChrW(118))=rs(ChrW(112)&ChrW(118))+1
end if
rs.update:rs.close 
end function
%>