<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%

call openconn()

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(105)&ChrW(115)&ChrW(116) then 

if session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))="" then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(61)&ChrW(39)& getIP() &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(28216)&ChrW(23458)&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(61)&ChrW(39)& mymd5(ChrW(121)&ChrW(111)&ChrW(117)&ChrW(107)&ChrW(101)) &ChrW(39),conn,1,3
if rs.eof then
rs.addnew
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=ChrW(121)&ChrW(111)&ChrW(117)&ChrW(107)&ChrW(101) & mymd5(getip() & now())
rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=ChrW(28216)&ChrW(23458)
rs(ChrW(112)&ChrW(105)&ChrW(99))=ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(47) & phpRnd(1,68) & ChrW(46)&ChrW(103)&ChrW(105)&ChrW(102)
rs(ChrW(105)&ChrW(112))=getIP()
rs(ChrW(112)&ChrW(119)&ChrW(100))=mymd5(ChrW(121)&ChrW(111)&ChrW(117)&ChrW(107)&ChrW(101))
rs.update
end if
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=rs(ChrW(105)&ChrW(100))
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))=rs(ChrW(112)&ChrW(119)&ChrW(100))
rs.close 
if session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))="" or session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))="" then
call echo(session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)),session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)))
call eerr(ChrW(27979)&ChrW(35797),session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)))
end if 
end if
end if

if session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)) <>"" then 

userRs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(61)&ChrW(39)& session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)) &ChrW(39) ,conn,1,3 
if userRs.eof then 
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=""
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))=""
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))=""
session(ChrW(111)&ChrW(110)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(116))=""

call eerr(ChrW(27809)&ChrW(26377)&ChrW(30331)&ChrW(24405),ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(38)&ChrW(49)&ChrW(39)&ChrW(62)&ChrW(30331)&ChrW(24405)&ChrW(22833)&ChrW(25928)&ChrW(65292)&ChrW(28857)&ChrW(20987)&ChrW(20197)&ChrW(28216)&ChrW(23458)&ChrW(36523)&ChrW(20221)&ChrW(30331)&ChrW(24405)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62))
call eerr(ChrW(20250)&ChrW(21592)&ChrW(36134)&ChrW(21495)&ChrW(23494)&ChrW(30721)&ChrW(30331)&ChrW(24405)&ChrW(65292)&ChrW(20877)&ChrW(20808)&ChrW(30331)&ChrW(24405),ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)& ChrW(47)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(49)&ChrW(61)&session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) & ChrW(38)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)) &ChrW(39)&ChrW(62)& ChrW(47)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)& session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)) &ChrW(61)&session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) & ChrW(38)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)) &ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62))
end if

elseif getCookie(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) <>"" and getCookie(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)) <>"" then  
userRs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& getCookie(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(61)&ChrW(39)& getCookie(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)) &ChrW(39) ,conn,1,3 
if userRs.eof then 

call eerr(ChrW(25552)&ChrW(31034),ChrW(99)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(36134)&ChrW(21495)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823))
else
session(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=userRs(ChrW(105)&ChrW(100))
end if
else

call eerr(ChrW(27809)&ChrW(26377)&ChrW(30331)&ChrW(24405),ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(38)&ChrW(48)&ChrW(39)&ChrW(62)&ChrW(28857)&ChrW(20987)&ChrW(20197)&ChrW(28216)&ChrW(23458)&ChrW(36523)&ChrW(20221)&ChrW(30331)&ChrW(24405)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62))
call eerr(ChrW(25552)&ChrW(31034),ChrW(115)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(20840)&ChrW(37096)&ChrW(20026)&ChrW(31354)&ChrW(32)&ChrW(47)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(48))
end if

function checkPermission(a)
if userrs(ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108))=1 then checkPermission=true:exit function
dim b
b=replace(userrs(ChrW(112)&ChrW(101)&ChrW(114)&ChrW(109)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)) & "",ChrW(32),ChrW(44)) 
if instr(ChrW(44)& b &ChrW(44),ChrW(44)& a &ChrW(44))>0 then
checkPermission=true
exit function
end if
checkPermission=false
end function

function checkPermissionRw(a) 
if checkPermission(a)=false then
call die(ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(45)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(59)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(53)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(49)&ChrW(54)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(27809)&ChrW(26377)& a &ChrW(26435)&ChrW(38480)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62))
end if
end function

function checkPermissionJson(a) 
if checkPermission(a)=false then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(27809)&ChrW(26377)& a &ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(27809)&ChrW(26377)& a &ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
end function

function addInformation(a)  
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c 
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93),conn,1,3
b.addnew
b(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=userRs(ChrW(105)&ChrW(100))
b(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=a
b(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1
b.update:b.close
addInformation=true
end function
%>