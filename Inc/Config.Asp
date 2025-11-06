<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% option explicit%> 
<!--#Include file = "Common.Asp"-->  
<!--#Include file = "FSO.Asp"-->  
<!--#Include file = "AdodbStream.Asp"-->  
<!--#Include file = "XML.Asp"-->  
<!--#Include file = "Time.Asp"-->  
<!--#Include file = "RegExp.Asp"-->  
<!--#Include file = "Http.Asp"-->   
<!--#Include file = "Cai.Asp"-->  
<!--#Include file = "StringNumber.Asp"-->  
<!--#Include file = "EncDec.Asp"-->  
<!--#Include file = "Access.Asp"-->   
<!--#Include file = "ASPPHPAccess.asp"-->   
<!--#Include file = "Check.Asp"-->   
<!--#Include file = "Url.Asp"-->  
<!--#Include file = "Conn.Asp"-->  
<!--#Include file = "Md5.Asp"-->   
<!--#Include file = "IE.Asp"-->   
<!--#Include file = "Json.Asp"-->
<!--#Include file = "2014_Js.Asp"-->  
<!--#Include file = "2014_Css.Asp"-->  
<!--#Include file = "2014_GBUTF.Asp"-->    
<!--#Include file = "2014_Cache.Asp"--> 
<!--#Include file = "2014_Cookies.Asp"--> 
<!--#Include file = "2014_Author.Asp"--> 
<!--#Include file = "2015_Color.Asp"--> 
<!--#Include file = "2015_SqlIn.Asp"-->
<!--#Include file = "2015_Json.Asp"-->
<!--#Include file = "2015_hexSwitch.asp"-->   
<!--#Include file = "2016_Log.Asp"-->   
<!--#Include file = "SystemInfo.Asp"-->   
<!--#Include file = "ip.Asp"-->    
<!--#Include file = "function.Asp"-->
<!--#Include file = "PinYin.Asp"-->
<!--#Include file = "2022_ip.asp"-->
<!--#Include file = "Class_image.asp"-->
<!--#Include file = "member.asp"-->
<!--#Include file = "JSON_2.0.4.asp"-->
<!--#Include file = "function_system_2024.asp"-->
<!--#Include file = "2025_mobile.asp"-->
<!--#Include file = "addUpdateAccessData.asp"-->
<%  
server.scriptTimeout = 9999
session.timeout = 1440
if request(ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)) <>ChrW(110)&ChrW(111) then
if request(ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50))=ChrW(49) then
response.addheader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(59)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)  
elseif request(ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110))=ChrW(49) then
Response.AddHeader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)
else
response.addheader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(59)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)
end if

response.buffer = true 
response.expires = 0 
response.expiresAbsolute = now() - 1 
response.cacheControl = ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)  
response.addHeader ChrW(69)&ChrW(120)&ChrW(112)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(115), date() 
response.addHeader ChrW(80)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(109)&ChrW(97), ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)   
response.addHeader ChrW(67)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(45)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108), ChrW(112)&ChrW(114)&ChrW(105)&ChrW(118)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(109)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(114)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101) 
end if

dim conn, rs, rsx, rss, rst, rsd, tempRs, tempRs2, rsTemp,rs1,rs2,rs3,bbsRs,rsWeb,userRs
dim pubTimer : pubTimer = now()

dim WEBCOLUMNTYPE : WEBCOLUMNTYPE = ChrW(39318)&ChrW(39029)&ChrW(124)&ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(25991)&ChrW(26412)&ChrW(124)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(44)&ChrW(20135)&ChrW(21697)&ChrW(124)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(116)&ChrW(44)&ChrW(26032)&ChrW(38395)&ChrW(124)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(44)&ChrW(35270)&ChrW(39057)&ChrW(124)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(111)&ChrW(44)&ChrW(19979)&ChrW(36733)&ChrW(124)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(44)&ChrW(26696)&ChrW(20363)&ChrW(124)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(44)&ChrW(30041)&ChrW(35328)&ChrW(124)&ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(98)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(44)&ChrW(21453)&ChrW(39304)&ChrW(124)&ChrW(102)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(44)&ChrW(25307)&ChrW(32856)&ChrW(124)&ChrW(106)&ChrW(111)&ChrW(98)&ChrW(44)&ChrW(25628)&ChrW(32034)&ChrW(124)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104) 
dim adminDir : adminDir = ChrW(47)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(47)
dim WEB_VIEWURL : WEB_VIEWURL = ChrW(47)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
dim WEB_ADMINURL : WEB_ADMINURL = adminDir & ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
dim EDITORTYPE : EDITORTYPE = ChrW(97)&ChrW(115)&ChrW(112)
dim webDir : webDir = "" 
MDBPath = "/data\data.mdb" 
dim ipMDBPath:ipMDBPath=ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(105)&ChrW(112)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116)
dim databaseType : databaseType = "access"
dim sqlServerHostIP : sqlServerHostIP = "localhost"
dim sqlServerVersion : sqlServerVersion = "2012"
dim sqlServerUsername : sqlServerUsername = "sa"
dim sqlServerPassword : sqlServerPassword = "saPass"
dim sqlServerDatabaseName : sqlServerDatabaseName = "webdata"
dim sqlServerPort : sqlServerPort = "1433"
dim db_PREFIX : db_PREFIX = "xy_"
dim countTi:countTi=200
dim WEB_CACHEFile : WEB_CACHEFile = ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(93)&ChrW(47)&ChrW(91)&ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(93)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
dim isLoginIPAllow:isLoginIPAllow=false
dim isOnAdminLoginOnlyAddress:isOnAdminLoginOnlyAddress=false
dim allowLoginErrors:allowLoginErrors=5
dim isAdminArticleOnPaiZhan:isAdminArticleOnPaiZhan=true
dim version:version=ChrW(86)&ChrW(49)&ChrW(46)&ChrW(51)
dim pubIsDownIPJson:pubIsDownIPJson=false
dim pubWebSite:pubWebSite=""
dim languageList
dim defaultLanguage:defaultLanguage=ChrW(99)&ChrW(110)
dim leftQuote,rightQuote
leftQuote=ChrW(91):rightQuote=ChrW(93)
if databaseType = "my"&ChrW(115)&ChrW(113)&ChrW(108) then
leftQuote=ChrW(96):rightQuote=ChrW(96)
end if
dim isAdminOnCRMShow:isAdminOnCRMShow=false

function addPrefix(a)  
addPrefix=leftQuote&db_PREFIX&a&rightQuote
end function

function getAccessDatediff(a)
if databaseType = "acc"&ChrW(101)&ChrW(115)&ChrW(115) then
getAccessDatediff=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(39)&ChrW(100)&ChrW(39)&ChrW(44)& a &ChrW(44)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(41)
elseif databaseType = "my"&ChrW(115)&ChrW(113)&ChrW(108) then
getAccessDatediff=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(67)&ChrW(85)&ChrW(82)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(40)&ChrW(41)&ChrW(44)& a &ChrW(41)
else
getAccessDatediff=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(44)& a &ChrW(44)&ChrW(71)&ChrW(69)&ChrW(84)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(40)&ChrW(41)&ChrW(41)
end if  
end function

function getAccessDatediffTime(a,b)
if databaseType = "acc"&ChrW(101)&ChrW(115)&ChrW(115) then
getAccessDatediffTime=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(39)&ChrW(100)&ChrW(39)&ChrW(44)& a &ChrW(44)&ChrW(35) & b &ChrW(35)&ChrW(41)
else
getAccessDatediffTime=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(44)& a &ChrW(44)&ChrW(39)& b &ChrW(39)&ChrW(41)
end if  
end function

function getAccessDatediffsecond(a)
if databaseType = "acc"&ChrW(101)&ChrW(115)&ChrW(115) then
getAccessDatediffsecond=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(39)&ChrW(115)&ChrW(39)&ChrW(44)& a &ChrW(44)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(41) 
else
getAccessDatediffsecond=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(100)&ChrW(44)& a &ChrW(44)&ChrW(71)&ChrW(69)&ChrW(84)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(40)&ChrW(41)&ChrW(41)
end if  
end function

function getAccessDatediffHour(a)
if databaseType = "acc"&ChrW(101)&ChrW(115)&ChrW(115) then
getAccessDatediffHour=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(39)&ChrW(104)&ChrW(39)&ChrW(44)& a &ChrW(44)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(41) 
else
getAccessDatediffHour=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(104)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(44)& a &ChrW(44)&ChrW(71)&ChrW(69)&ChrW(84)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(40)&ChrW(41)&ChrW(41)
end if  
end function

function getAccessDatediffWeek(a)
if databaseType = "acc"&ChrW(101)&ChrW(115)&ChrW(115) then
getAccessDatediffWeek=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(39)&ChrW(119)&ChrW(119)&ChrW(39)&ChrW(44)& a &ChrW(44)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(41)
else
getAccessDatediffWeek=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(119)&ChrW(101)&ChrW(101)&ChrW(107)&ChrW(44)& a &ChrW(44)&ChrW(71)&ChrW(69)&ChrW(84)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(40)&ChrW(41)&ChrW(41)
end if  
end function

function getAccessDatediffMonth(a)
if databaseType = "acc"&ChrW(101)&ChrW(115)&ChrW(115) then
getAccessDatediffMonth=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(39)&ChrW(109)&ChrW(39)&ChrW(44)& a &ChrW(44)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(41) 
elseif databaseType = "my"&ChrW(115)&ChrW(113)&ChrW(108) then
getAccessDatediffMonth=ChrW(32)&ChrW(84)&ChrW(73)&ChrW(77)&ChrW(69)&ChrW(83)&ChrW(84)&ChrW(65)&ChrW(77)&ChrW(80)&ChrW(68)&ChrW(73)&ChrW(70)&ChrW(70)&ChrW(40)&ChrW(77)&ChrW(79)&ChrW(78)&ChrW(84)&ChrW(72)&ChrW(44)& a &ChrW(44)&ChrW(67)&ChrW(85)&ChrW(82)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(40)&ChrW(41)&ChrW(41)
else
getAccessDatediffMonth=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(104)&ChrW(44)& a &ChrW(44)&ChrW(71)&ChrW(69)&ChrW(84)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(40)&ChrW(41)&ChrW(41)
end if  
end function

function getAccessDatediffYear(a)
if databaseType = "acc"&ChrW(101)&ChrW(115)&ChrW(115) then
getAccessDatediffYear=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(39)&ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121)&ChrW(39)&ChrW(44)& a &ChrW(44)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(41)
elseif databaseType = "my"&ChrW(115)&ChrW(113)&ChrW(108) then
getAccessDatediffYear=ChrW(32)&ChrW(84)&ChrW(73)&ChrW(77)&ChrW(69)&ChrW(83)&ChrW(84)&ChrW(65)&ChrW(77)&ChrW(80)&ChrW(68)&ChrW(73)&ChrW(70)&ChrW(70)&ChrW(40)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(44)& a &ChrW(44)&ChrW(67)&ChrW(85)&ChrW(82)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(40)&ChrW(41)&ChrW(41)
else
getAccessDatediffYear=ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(121)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(44)& a &ChrW(44)&ChrW(71)&ChrW(69)&ChrW(84)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(40)&ChrW(41)&ChrW(41)
end if  
end function

function sqlTextFieldEquation(a,b)
if databaseType = "acc"&ChrW(101)&ChrW(115)&ChrW(115) then
sqlTextFieldEquation= a & ChrW(61)&ChrW(39)&  b &ChrW(39)
else
sqlTextFieldEquation=ChrW(99)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(40)& a &ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(40)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(41)&ChrW(41)&ChrW(61)&ChrW(39)& b &ChrW(39)
end if
end function

function sqlTowTextFieldEquation(a,b)
if databaseType = "acc"&ChrW(101)&ChrW(115)&ChrW(115) then
sqlTowTextFieldEquation= a & ChrW(61)&ChrW(39)&  b &ChrW(39)
else
sqlTowTextFieldEquation=ChrW(99)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(40)& a &ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(40)&ChrW(55)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(41)&ChrW(41)&ChrW(61)&ChrW(39)& b &ChrW(39)
end if
end function

function sqlAorS(a)
if databaseType = "acc"&ChrW(101)&ChrW(115)&ChrW(115) then
if instr(ChrW(124)&ChrW(115)&ChrW(124)&ChrW(104)&ChrW(124)&ChrW(100)&ChrW(124)&ChrW(119)&ChrW(119)&ChrW(124)&ChrW(109)&ChrW(124)&ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121)&ChrW(124),ChrW(124)& a &ChrW(124))>0 then
a=ChrW(39)& a &ChrW(39)
end if
else

if a=ChrW(39)&ChrW(115)&ChrW(39) or a=ChrW(115) then
a=ChrW(115)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(100)
elseif a=ChrW(39)&ChrW(104)&ChrW(39) or a=ChrW(104) then
a=ChrW(104)&ChrW(111)&ChrW(117)&ChrW(114)
elseif a=ChrW(39)&ChrW(100)&ChrW(39) or a=ChrW(100) then
a=ChrW(100)&ChrW(97)&ChrW(121)
elseif a=ChrW(39)&ChrW(119)&ChrW(119)&ChrW(39) or a=ChrW(119)&ChrW(119) then
a=ChrW(119)&ChrW(101)&ChrW(101)&ChrW(107)
elseif a=ChrW(39)&ChrW(109)&ChrW(39) or a=ChrW(109) then
a=ChrW(109)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(104)
elseif a=ChrW(39)&ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121)&ChrW(39) or a=ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121) then
a=ChrW(121)&ChrW(101)&ChrW(97)&ChrW(114)
elseif a=ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41) or a=ChrW(110)&ChrW(111)&ChrW(119) then
a=ChrW(71)&ChrW(69)&ChrW(84)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(40)&ChrW(41)
elseif left(a,1)=ChrW(35) then
a=ChrW(39) & mid(a,2,len(a)-2) & ChrW(39)
end if

end if
sqlAorS=a
end function


















%> 