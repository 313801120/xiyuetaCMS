<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../common.Asp"--><%

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) then   
call sumbitliuya()
end if
function sumbitliuya()
dim a,b,c,d
a=request(ChrW(105)&ChrW(100))
c=request(ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a ,conn,1,3
if not rs.eof then    
b=rs(ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115))

rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(32)& getAccessDatediff(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))&ChrW(61)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115)&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100)) ,conn,1,3
if rsx.eof then
rsx.addnew
rsx(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100))=rs(ChrW(105)&ChrW(100))
rsx(ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115)
rsx(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))=1
rsx(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=date()  
rsx(ChrW(105)&ChrW(112))=getip()
rsx.update
rs(ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115))=1
rs.update
b=rs(ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115))
d=ChrW(28857)&ChrW(36190)&ChrW(25104)&ChrW(21151)&ChrW(65281)
else
rsx(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rsx(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))=rsx(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))+1
rsx.update
rs(ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115))=rsx.recordcount
rs.update
b=rs(ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115))
d=ChrW(20320)&ChrW(24050)&ChrW(32463)&ChrW(28857)&ChrW(36190)&ChrW(36807)&ChrW(20102)&ChrW(65281)
end if:rsx.close
end if:rs.close
if c=ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110) then 
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& d &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& b &ChrW(34)&ChrW(125))
else
call die(b)
end if
end function
%>