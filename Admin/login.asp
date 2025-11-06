<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../inc/config.Asp"-->
<!--#Include File = "admin_function.asp"--><% 
dim username,password,msg,captcha,rememberMe,addSql,anquan,adminpwd,pwd,cookiePwd,nBJMiao,tipMsg,ipLoginErrTotal
msg=""
username=phptrim(replace(request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),ChrW(39),""))
password=phptrim(replace(request(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)),ChrW(39),""))
captcha=replace(request(ChrW(99)&ChrW(97)&ChrW(112)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(97)),ChrW(39),"")
rememberMe=request(ChrW(114)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(77)&ChrW(101))
anquan=request(ChrW(97)&ChrW(110)&ChrW(113)&ChrW(117)&ChrW(97)&ChrW(110))

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(83)&ChrW(97)&ChrW(108)&ChrW(116) then

dim salt
randomize
salt = getRnd(16) & getRndTel(8)
session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)) = salt
session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) = now()
call die(ChrW(123)&ChrW(34)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& salt &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(101)&ChrW(115)&ChrW(34)&ChrW(125))
end if

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(111)&ChrW(117)&ChrW(116)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110) then 
if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) <>"" then 
call openconn()  
userRs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) ,conn,1,3
if not userRs.eof then
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110),ChrW(36864)&ChrW(20986)&ChrW(30331)&ChrW(24405))
session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=""
session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(114)&ChrW(117)&ChrW(108)&ChrW(101))=""
call removeCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))
call removeCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))   
call removeCookie(ChrW(112)&ChrW(119)&ChrW(100))
call removeCookie(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
userRs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115))=0
userRs.update
response.redirect(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(111)&ChrW(117)&ChrW(116))
end if
end if

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110) then 

if session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116))="" or anquan="" or anquan <>session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)) then
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110),ChrW(23433)&ChrW(20840)&ChrW(30721)&ChrW(39564)&ChrW(35777)&ChrW(22833)&ChrW(36133)&ChrW(65288)&ChrW(36229)&ChrW(32423)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(65289))
session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116))=""
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23433)&ChrW(20840)&ChrW(39564)&ChrW(35777)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(35831)&ChrW(21047)&ChrW(26032)&ChrW(39029)&ChrW(38754)&ChrW(37325)&ChrW(35797)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125))
end if

if session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) <>"" then
dim saltAge2
saltAge2 = dateDiff(ChrW(115), session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)), now())
if saltAge2 > 300 then
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110),ChrW(23433)&ChrW(20840)&ChrW(30721)&ChrW(24050)&ChrW(36807)&ChrW(26399)&ChrW(65288)&ChrW(36229)&ChrW(32423)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(65289))
session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116))=""
session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=""
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23433)&ChrW(20840)&ChrW(39564)&ChrW(35777)&ChrW(24050)&ChrW(36807)&ChrW(26399)&ChrW(65292)&ChrW(35831)&ChrW(21047)&ChrW(26032)&ChrW(39029)&ChrW(38754)&ChrW(37325)&ChrW(35797)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125))
end if
end if
adminpwd=ChrW(50)&ChrW(52)&ChrW(101)&ChrW(100)&ChrW(53)&ChrW(55)&ChrW(50)&ChrW(56)&ChrW(99)&ChrW(49)&ChrW(51)&ChrW(56)&ChrW(51)&ChrW(52)&ChrW(101)&ChrW(54)&ChrW(56)&ChrW(51)&ChrW(102)&ChrW(53)&ChrW(50)&ChrW(53)&ChrW(102)&ChrW(99)&ChrW(102)&ChrW(56)&ChrW(57)&ChrW(52)&ChrW(101)&ChrW(56)&ChrW(49)&ChrW(51)
if anquan <>"" then
adminpwd=md5(adminpwd & anquan) 
end if
if password=adminpwd then 


session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116))=""
session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=""
session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=-999
session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(114)&ChrW(117)&ChrW(108)&ChrW(101))=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(102) 

call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(30331)&ChrW(24405)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(101)&ChrW(115)&ChrW(34)&ChrW(125))








end if
call openconn()
if captcha="" or session(ChrW(121)&ChrW(122)&ChrW(109))="" or captcha <>session(ChrW(121)&ChrW(122)&ChrW(109)) then
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110),ChrW(39564)&ChrW(35777)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(65292)&ChrW(36134)&ChrW(21495)&ChrW(65306) & username)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(39564)&ChrW(35777)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125))
elseif username="" or password="" then
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110),ChrW(36134)&ChrW(21495)&ChrW(25110)&ChrW(23494)&ChrW(30721)&ChrW(19981)&ChrW(33021)&ChrW(20026)&ChrW(31354))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(36134)&ChrW(21495)&ChrW(25110)&ChrW(23494)&ChrW(30721)&ChrW(19981)&ChrW(33021)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125))
end if

if session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116))="" or anquan="" or anquan <>session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)) then
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110),ChrW(23433)&ChrW(20840)&ChrW(30721)&ChrW(39564)&ChrW(35777)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(36134)&ChrW(21495)&ChrW(65306) & username)
session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116))=""
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23433)&ChrW(20840)&ChrW(39564)&ChrW(35777)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(35831)&ChrW(21047)&ChrW(26032)&ChrW(39029)&ChrW(38754)&ChrW(37325)&ChrW(35797)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125))
end if

if session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) <>"" then
dim saltAge
saltAge = dateDiff(ChrW(115), session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)), now())
if saltAge > 300 then
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110),ChrW(23433)&ChrW(20840)&ChrW(30721)&ChrW(24050)&ChrW(36807)&ChrW(26399)&ChrW(65292)&ChrW(36134)&ChrW(21495)&ChrW(65306) & username)
session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116))=""
session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=""
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23433)&ChrW(20840)&ChrW(39564)&ChrW(35777)&ChrW(24050)&ChrW(36807)&ChrW(26399)&ChrW(65292)&ChrW(35831)&ChrW(21047)&ChrW(26032)&ChrW(39029)&ChrW(38754)&ChrW(37325)&ChrW(35797)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125))
end if
end if

dim currentSalt
currentSalt = session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116))
ipLoginErrTotal=1

if allowLoginErrors>0 then  
dim readErrCount
readErrCount=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(69)&ChrW(114)&ChrW(114)&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(61)&ChrW(39)& getip() &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32) & getAccessDatediff(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & ChrW(61)&ChrW(48)&ChrW(32))(0)

ipLoginErrTotal=ipLoginErrTotal+cint(readErrCount)
if ipLoginErrTotal>allowLoginErrors then
msg=ChrW(20170)&ChrW(22825)&ChrW(38169)&ChrW(35823)&ChrW(30331)&ChrW(24405)&ChrW(27425)&ChrW(25968)&ChrW(36798)&ChrW(21040)& allowLoginErrors &ChrW(27425)&ChrW(65292)&ChrW(19981)&ChrW(21487)&ChrW(20877)&ChrW(30331)&ChrW(24405)&ChrW(20102)
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110), msg& ChrW(65292)&ChrW(36134)&ChrW(21495)&ChrW(65306) & username)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& msg &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125)) 
end if  
end if   
addSql=ChrW(32)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& username &ChrW(39) 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110) & addSql ,conn,1,3 
if not rs.eof then 
pwd=rs(ChrW(112)&ChrW(119)&ChrW(100))
if anquan <>"" then
pwd=md5(pwd & anquan)
end if
if pwd <>password then
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(69)&ChrW(114)&ChrW(114),ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(65292)&ChrW(31532)& ipLoginErrTotal &ChrW(27425)&ChrW(23581)&ChrW(35797)&ChrW(30331)&ChrW(24405)&ChrW(65292)&ChrW(36134)&ChrW(21495)&ChrW(65306) & username) 
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(65292)&ChrW(38169)&ChrW(35823)&ChrW(30331)&ChrW(24405)&ChrW(32)& ipLoginErrTotal &ChrW(27425)&ChrW(65292)&ChrW(36798)&ChrW(21040)&ChrW(26368)&ChrW(22823)&ChrW(30331)&ChrW(24405)&ChrW(32)&allowLoginErrors&ChrW(27425)&ChrW(21017)&ChrW(19981)&ChrW(21487)&ChrW(30331)&ChrW(24405)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125)) 
end if

if rs(ChrW(105)&ChrW(115)&ChrW(84)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=0 then
msg=ChrW(20250)&ChrW(21592)&ChrW(40)& rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(41)&ChrW(26410)&ChrW(23457)&ChrW(26680)&ChrW(65292)&ChrW(30331)&ChrW(24405)&ChrW(22833)&ChrW(36133)
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110), msg  &ChrW(65292)&ChrW(32)&ChrW(36134)&ChrW(21495)&ChrW(65306)&rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&msg&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125)) 
end if  

if checkIpLimitList(rs(ChrW(105)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))) then 
msg=ChrW(30331)&ChrW(24405)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(105)&ChrW(112)&ChrW(40)&getip()&ChrW(41)&ChrW(65292)&ChrW(34987)&ChrW(38480)&ChrW(21046)&ChrW(30331)&ChrW(24405)
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110), msg&ChrW(65292)&ChrW(36134)&ChrW(21495)&ChrW(65306)&username)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&msg&ChrW(65292)&ChrW(35831)&ChrW(32852)&ChrW(31995)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125))  
end if

dim configFilePath,configContent,s
configFilePath=ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116) 
if checkFile(configFilePath) then  
configContent=readfile(configFilePath,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))   

s=lcase(phptrim(phptrim(getStrCut(configContent,ChrW(105)&ChrW(115)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(80)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34),ChrW(34),0))))
if s <>"" then                
isLoginIPAllow=IIF( (s=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) or s=ChrW(49)),true,false)
end if

s=lcase(phptrim(phptrim(getStrCut(configContent,ChrW(105)&ChrW(115)&ChrW(79)&ChrW(110)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(79)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34),ChrW(34),0))))
if s <>"" then
isOnAdminLoginOnlyAddress=IIF( (s=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) or s=ChrW(49)),true,false)
end if
end if

if isLoginIPAllow then 
if checkAdminLoginIPAllow(getIP())=false then
msg=ChrW(30331)&ChrW(24405)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(105)&ChrW(112)&ChrW(40)&getip()&ChrW(41)&ChrW(65292)&ChrW(19981)&ChrW(22312)&ChrW(20801)&ChrW(35768)&ChrW(30331)&ChrW(24405)&ChrW(21015)&ChrW(34920)
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110), msg&ChrW(65292)&ChrW(36134)&ChrW(21495)&ChrW(65306)&username)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&msg&ChrW(65292)&ChrW(35831)&ChrW(32852)&ChrW(31995)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125)) 
end if 
end if

if isOnAdminLoginOnlyAddress then

if rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115))=1 then
nBJMiao=dateDiff(ChrW(115), rs(ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)), now())
if  nBJMiao< 180 then
msg=ChrW(36134)&ChrW(21495)&ChrW(40)& username &ChrW(41)&ChrW(34987)&ChrW(73)&ChrW(80)&ChrW(40)& rs(ChrW(117)&ChrW(112)&ChrW(105)&ChrW(112)) &ChrW(41)&ChrW(30331)&ChrW(24405)&ChrW(65292)& (180-nBJMiao) &ChrW(31186)&ChrW(21518)&ChrW(23545)&ChrW(26041)&ChrW(19981)&ChrW(25805)&ChrW(20316)&ChrW(65292)&ChrW(20320)&ChrW(21487)&ChrW(30331)&ChrW(24405)
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110),msg)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& msg &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125))
end if
end if
end if 
session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=rs(ChrW(105)&ChrW(100))
session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(114)&ChrW(117)&ChrW(108)&ChrW(101))=""        
if password <>adminpwd then
rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rs(ChrW(117)&ChrW(112)&ChrW(105)&ChrW(112))=getIP()
rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115))=1
rs(ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rs.update
end if
if rememberMe=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) then
call removeCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114))
call removeCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115))
call setCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114),rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),99999)


cookiePwd=rs(ChrW(112)&ChrW(119)&ChrW(100)) & cstr(rs(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)))
call setCookie(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115),mymd5( cookiePwd  ),99999)


end if

session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116))=""
session(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=""
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110),ChrW(30331)&ChrW(24405)&ChrW(25104)&ChrW(21151) )
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(30331)&ChrW(24405)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(101)&ChrW(115)&ChrW(34)&ChrW(125))
else
call addSystemLog(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(69)&ChrW(114)&ChrW(114),ChrW(36134)&ChrW(21495)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(31532)& ipLoginErrTotal &ChrW(27425)&ChrW(23581)&ChrW(35797)&ChrW(30331)&ChrW(24405)&ChrW(65292)&ChrW(36134)&ChrW(21495)&ChrW(65306) & username)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(36134)&ChrW(21495)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(38169)&ChrW(35823)&ChrW(30331)&ChrW(24405)&ChrW(32)& ipLoginErrTotal &ChrW(27425)&ChrW(65292)&ChrW(36798)&ChrW(21040)&ChrW(26368)&ChrW(22823)&ChrW(30331)&ChrW(24405)&ChrW(32)& allowLoginErrors &ChrW(27425)&ChrW(21017)&ChrW(19981)&ChrW(21487)&ChrW(30331)&ChrW(24405)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(125))
end if:rs.close
end if 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xiyuetaCMS网站管理系统<%=version%>-登陆</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="layuiadmin/layui/css/layui.css" media="all">
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
html, body {width: 100%;height: 100%;overflow: hidden}
body {background: #1E9FFF;}
body:after {content:'';background-repeat:no-repeat;background-size:cover;-webkit-filter:blur(3px);-moz-filter:blur(3px);-o-filter:blur(3px);-ms-filter:blur(3px);filter:blur(3px);position:absolute;top:0;left:0;right:0;bottom:0;z-index:-1;}
.layui-container {width: 100%;height: 100%;overflow: hidden}
.admin-login-background {width:360px;height:300px;position:absolute;left:50%;top:40%;margin-left:-180px;margin-top:-100px;}
.logo-title {text-align:center;letter-spacing:2px;padding:14px 0;}
.logo-title h1 {color:#1E9FFF;font-size:25px;font-weight:bold;}
.login-form {background-color:#fff;border:1px solid #fff;border-radius:3px;padding:14px 20px;box-shadow:0 0 8px #eeeeee;}
.login-form .layui-form-item {position:relative;}
.login-form .layui-form-item label {position:absolute;left:1px;top:1px;width:38px;line-height:36px;text-align:center;color:#d2d2d2;}
.login-form .layui-form-item input {padding-left:36px;}
.captcha {width:60%;display:inline-block;}
.captcha-img {display:inline-block;width:34%;float:right;}
.captcha-img img {height:34px;border:1px solid #e6e6e6;height:36px;width:100%;}
</style>
</head>
<body>
<div class="layui-container">
<div class="admin-login-background">
<div class="layui-form login-form">
<form class="layui-form" action="" onsubmit="return false;">
<div class="layui-form-item logo-title">
<h1>xiyuetaCMS登录</h1>
</div>
<div class="layui-form-item">
<label class="layui-icon layui-icon-username" for="username"></label>
<input type="text" name="username" placeholder="用户名或者邮箱" autocomplete="off" class="layui-input" value="">
</div>
<div class="layui-form-item">
<label class="layui-icon layui-icon-password" for="password"></label>
<input type="password" name="password" placeholder="密码" autocomplete="off" class="layui-input" value="">
</div>
<div class="layui-form-item">
<label class="layui-icon layui-icon-vercode" for="captcha"></label>
<input type="tel" name="captcha"  placeholder="图形验证码" autocomplete="off" class="layui-input verification captcha" value="">
<div class="captcha-img">
<img id="captchaPic" src="/inc/yzm_7.asp?n=<%=getrnd(4)%>" onclick="src='/inc/yzm_7.asp?'+Math.random();" style="cursor: pointer;">
</div>
</div>
<div class="layui-form-item">
<input type="checkbox" name="rememberMe" value="true" checked lay-skin="primary" title="记住密码">
</div>
<div class="layui-form-item">
<button class="layui-btn layui-btn layui-btn-normal layui-btn-fluid" lay-submit="" lay-filter="login">登 入</button>
</div>
</form>
</div>
</div>
</div>
<script src="js/jquery.js" charset="utf-8"></script>
<script src="layuiadmin/layui/layui.js" charset="utf-8"></script>
<script src="js/jquery.particleground.min.js" charset="utf-8"></script>
<script src="js/md5.min.js" charset="utf-8"></script>
<script> 
layui.use(['form'], function () {
// document.write("admin=" + md5("admin"))
// console.log(md5("admin"))
var form = layui.form,
layer = layui.layer;
// 登录过期的时候，跳出ifram框架
if (top.location != self.location) top.location = self.location;
// 粒子线条背景
$(document).ready(function(){
$('.layui-container').particleground({
dotColor:'#7ec7fd',
lineColor:'#7ec7fd'
});
});
// 进行登录操作
form.on('submit(login)', function (data) {
data = data.field;
if (data.username == '') {
// layer.msg('用户名不能为空');
layer.tips('请输入登录用户名', $("input[name=username]"), {
tips: [1, '#058ff5']
});
$("input[name=username]").focus();
return false;
}
if (data.password == '') {
// layer.msg('密码不能为空');
layer.tips('请输入登录密码', $("input[name=password]"), {
tips: [1, '#058ff5']
});
$("input[name=password]").focus();
return false;
}
if (data.captcha == '') {
// layer.msg('验证码不能为空');
layer.tips('请输入登录验证码', $("input[name=captcha]"), {
tips: [1, '#058ff5']
});
$("input[name=captcha]").focus();
return false;
}
//改进的安全码机制：从服务器获取安全码，防止暴露在HTML中
var loginSalt = "";  //安全码
var saltRetrieved = false;  //是否已获取安全码
//先获取服务器端生成的安全码
$.ajax({
type: "post",
dataType: "json",
cache: false,
url: "?act=getSalt",
async: false,  //同步获取，确保安全码先获取
success: function(saltData) {
if(saltData.status == "yes") {
loginSalt = saltData.salt;
saltRetrieved = true;
} else {
layer.msg("获取安全码失败，请刷新页面重试", {
icon: 2,
time: 2000
});
return false;
}
},
error: function() {
layer.msg("网络错误，请刷新页面重试", {
icon: 2,
time: 2000
});
return false;
}
});
if(!saltRetrieved || loginSalt == "") {
return false;
}
//使用安全码加密密码（改进的加密方式）
var pwd = md5(md5(data.password));  //先对密码进行双重MD5
var pwdFinal = md5(pwd + loginSalt);  //加上安全码后再次MD5
$.ajax({
type: "post",
dataType: "json",
cache: false,  //禁用缓存，防止重放攻击
url: "?act=submitLogin",
data: {
"username":data.username,
"password":pwdFinal,
"captcha":data.captcha,
"anquan":loginSalt,  //传递安全码供服务器验证
"rememberMe":data.rememberMe
},
success: function(data) { 
if(data.status=="yes"){
layer.msg(data.info,{
icon:1,
shade:[0.5,'#000'],
time:500,
end:function () {
window.location = 'default.asp';
}
})  
}else{
layer.msg(data.info,{
icon:2,
time:1400,
anim:6,
shade:[0.5,'#000'],
});
}
},
});
return false;
});
});
</script>
</body>
</html>