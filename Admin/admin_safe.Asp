<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%  

call openconn()  
call isLogin()
dim userRs_permission,userRs_adminRoleId,userRs_adminRoleTitle,userRs_nickname


rsWeb.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99) ,conn,1,1
if not rsWeb.eof then
languageList=rsWeb(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))
end if

function gotoLogin(a,b)

if request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) <>"" then
call die(ChrW(123)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(52)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&a&ChrW(34)&ChrW(125))
else
response.Redirect(adminDir &ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&b)        
end if
response.end
end function
function isLogin()
dim a,b

if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) <>"" then 
if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=-999 then
userRs_permission=ChrW(42)
userRs_nickname=ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(101)&ChrW(117)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(77)&ChrW(83)&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)
userRs_adminRoleTitle=ChrW(31995)&ChrW(32479)&ChrW(31649)&ChrW(29702)&ChrW(21592)













exit function
end if
userRs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) ,conn,1,3
if userRs.eof then 
call gotoLogin(ChrW(30331)&ChrW(24405)&ChrW(22833)&ChrW(25928),1)
end if

elseif getCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) <>"" and getCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)) <>"" then  
userRs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& getCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) &ChrW(39) ,conn,1,3 
if userRs.eof then  
call gotoLogin(ChrW(30331)&ChrW(24405)&ChrW(22833)&ChrW(25928),2)
else 

if getCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)) <>mymd5(userrs(ChrW(112)&ChrW(119)&ChrW(100))&userrs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))) then





call gotoLogin(ChrW(23494)&ChrW(30721)&ChrW(19981)&ChrW(27491)&ChrW(30830),2)


end if
session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=userRs(ChrW(105)&ChrW(100))
end if
elseif request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) <>"" and request(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)) <>"" then  
userRs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&replace(request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)),ChrW(39),"")&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(61)&ChrW(39)&mymd5(request(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)))&ChrW(39),conn,1,3
if userRs.eof then 
call gotoLogin(ChrW(36134)&ChrW(21495)&ChrW(23494)&ChrW(30721),4)

else
session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=userRs(ChrW(105)&ChrW(100))
end if
else
call gotoLogin(ChrW(23494)&ChrW(30721)&ChrW(19981)&ChrW(27491)&ChrW(30830),2)

end if
userRs_nickname=userrs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&userrs(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(82)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(100)),conn,1,1
if not rs.eof then
userRs_permission=rs(ChrW(112)&ChrW(101)&ChrW(114)&ChrW(109)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110))
userRs_adminRoleId=rs(ChrW(105)&ChrW(100))
userRs_adminRoleTitle=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
end if:rs.close

if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(114)&ChrW(117)&ChrW(108)&ChrW(101)) <>ChrW(115)&ChrW(101)&ChrW(108)&ChrW(102) then 

if userrs(ChrW(105)&ChrW(115)&ChrW(84)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=0 then
a=ChrW(20250)&ChrW(21592)&ChrW(40)& userrs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(41)&ChrW(26410)&ChrW(23457)&ChrW(26680)&ChrW(65292)&ChrW(36864)&ChrW(20986)&ChrW(30331)&ChrW(24405)

if request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) <>"" then
call die(ChrW(123)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(52)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&a&ChrW(34)&ChrW(125))
end if
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110), a)
call die(a &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34)& adminDir &ChrW(47)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(34)&ChrW(62)&ChrW(30331)&ChrW(24405)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62))
end if 

if checkIpLimitList(userrs(ChrW(105)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))) then
a=ChrW(20250)&ChrW(21592)&ChrW(40)& userrs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(41)&ChrW(73)&ChrW(80)&ChrW(40)& getIP() &ChrW(41)&ChrW(34987)&ChrW(38480)&ChrW(21046)&ChrW(30331)&ChrW(24405)

if request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) <>"" then
call die(ChrW(123)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(52)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&a&ChrW(34)&ChrW(125))
end if
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110), a) 
call die(a &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34)& adminDir &ChrW(47)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(34)&ChrW(62)&ChrW(30331)&ChrW(24405)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
end if

if isLoginIPAllow then 
if checkAdminLoginIPAllow(getIP())=false then
a=ChrW(30331)&ChrW(24405)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(105)&ChrW(112)&ChrW(40)&getip()&ChrW(41)&ChrW(65292)&ChrW(19981)&ChrW(22312)&ChrW(20801)&ChrW(35768)&ChrW(30331)&ChrW(24405)&ChrW(21015)&ChrW(34920)

if request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) <>"" then
call die(ChrW(123)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(52)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&a&ChrW(34)&ChrW(125))
end if
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110), a) 
call die(a &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34)& adminDir &ChrW(47)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(34)&ChrW(62)&ChrW(30331)&ChrW(24405)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
end if 
end if

if isOnAdminLoginOnlyAddress then
if userrs(ChrW(117)&ChrW(112)&ChrW(105)&ChrW(112)) <>getip() then
session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=""
call removeCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))
call removeCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))
a=ChrW(36134)&ChrW(21495)&ChrW(34987)&ChrW(73)&ChrW(80)&ChrW(40)& userrs(ChrW(117)&ChrW(112)&ChrW(105)&ChrW(112)) &ChrW(41)&ChrW(30331)&ChrW(24405)&ChrW(65292)&ChrW(20320)&ChrW(24050)&ChrW(36864)&ChrW(20986)&ChrW(12290)

if request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) <>"" then
call die(ChrW(123)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(52)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&a&ChrW(34)&ChrW(125))
end if
call eerr(ChrW(25552)&ChrW(31034),a&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)& adminDir &ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(51)&ChrW(39)&ChrW(62)&ChrW(28857)&ChrW(20987)&ChrW(37325)&ChrW(26032)&ChrW(30331)&ChrW(24405)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62))
end if
end if

userrs(ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
userrs.update
end if
end function

function checkPermission(a)
on error resume next
if userrs(ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108))=1 then checkPermission=true:exit function
dim b
b=replace(userrs(ChrW(112)&ChrW(101)&ChrW(114)&ChrW(109)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)) & "",ChrW(32),ChrW(44)) 
if instr(ChrW(124)& b &ChrW(124),ChrW(124)& a &ChrW(124))>0 then
checkPermission=true
exit function
end if
checkPermission=false
if err.number <>0 then
checkPermission=false
end if
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
%>