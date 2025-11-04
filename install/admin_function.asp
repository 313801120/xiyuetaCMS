<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


Function callFunction()
Dim a 
a = Request(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)) 
If a = ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(116) Then
updateWebsiteStat()
ElseIf a = ChrW(99)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(116) Then
call clearWebsiteStat()
ElseIf a = ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(116) Then
call updateTodayWebStat()
ElseIf a = ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) Then
call websiteDetail()
ElseIf a = ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110) Then
call displayAccessDomain()
ElseIf a = ChrW(100)&ChrW(101)&ChrW(108)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101) Then
call delTemplate()
Else
call eerr(ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(49)&ChrW(39029)&ChrW(37324)&ChrW(27809)&ChrW(26377)&ChrW(21160)&ChrW(20316), Request(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))) 
End if 
End function

Function displayAccessDomain()
Dim a, b, c, d 
call handlePower(ChrW(26174)&ChrW(31034)&ChrW(35775)&ChrW(38382)&ChrW(22495)&ChrW(21517)) 
call openconn() 
d = 0 

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116), conn, 1, 1 
While Not rs.EOF
a = LCase(getWebSite(rs(ChrW(118)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(108)))) 

If InStr(vbCrLf & b & vbCrLf, vbCrLf & a & vbCrLf) = 0 Then
If a <> LCase(getWebSite(webDoMain())) Then
b = b & a & vbCrLf 
d = d + 1 
c = c & d & ChrW(12289)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39) & rs(ChrW(118)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(108)) & ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62) & rs(ChrW(118)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(108)) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62) 
End if 
End if 
rs.MoveNext : Wend : rs.Close 

call echo(ChrW(26174)&ChrW(31034)&ChrW(35775)&ChrW(38382)&ChrW(22495)&ChrW(21517), ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(39)&ChrW(62)&ChrW(28857)&ChrW(20987)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
call rwend(b & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62) & c) 
End function

Function getHandleTableList()
Dim a, b
b = ChrW(34920)&ChrW(21015)&ChrW(34920)&ChrW(91) & Request(ChrW(109)&ChrW(100)&ChrW(98)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)) & ChrW(93) 
If WEB_CACHEContent = "" Then
WEB_CACHEContent = readFile(WEB_CACHEFile, "") 
End if 
a = getConfigContentBlock(WEB_CACHEContent, ChrW(35) & b & ChrW(35)) 
If a = "" Then
a = LCase(getTableList()) 
a = ChrW(124) & Replace(a, vbCrLf, ChrW(124)) & ChrW(124) 
WEB_CACHEContent = setConfigFileBlock(WEB_CACHEFile, a, ChrW(35) & b & ChrW(35)) 
If isCacheTip = True Then
call echo(ChrW(32531)&ChrW(20914), b) 
End if 
End if 
getHandleTableList = a 
End function

Function getHandleFieldList(a, b)
Dim c 
If WEB_CACHEContent = "" Then
WEB_CACHEContent = readFile(WEB_CACHEFile, "") 
End if 
c = getConfigContentBlock(WEB_CACHEContent, ChrW(35) & a & b & ChrW(35)) 
If c = "" Then
If b = ChrW(23383)&ChrW(27573)&ChrW(37197)&ChrW(32622)&ChrW(21015)&ChrW(34920) Then
c = LCase(getFieldConfigList(a)) 
Else
c = LCase(getFieldList(a)) 
End if 
WEB_CACHEContent = setConfigFileBlock(WEB_CACHEFile, c, ChrW(35) & a & b & ChrW(35)) 
If isCacheTip = True Then
call echo(ChrW(32531)&ChrW(20914), a & b) 
End if 
End if 
getHandleFieldList = c 
End function

Function getTemplateContent(a)
call loadWebConfig() 

Dim b, c, d 
c = ROOT_PATH & ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(47) & db_PREFIX & ChrW(47) & a 

If checkMobile() = True Or Request(ChrW(109)) = ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101) Then
b = ROOT_PATH & ChrW(47)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(47)&ChrW(109)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(47) & a 
End if 

If checkFile(b) = False Then
If checkFile(c) = True Then
b = c 
Else
b = ROOT_PATH & a 
End if 
End if 
d = readFile(b, "") 
d = replaceLableContent(d) 
getTemplateContent = d 
End function

Function replaceLableContent(a)
Dim b, c, d, e 
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(86)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(36)&ChrW(125), webVersion)
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(95)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(36)&ChrW(125), cfg_webTitle)
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(36)&ChrW(125), EDITORTYPE)
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(36)&ChrW(125), adminDir)
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(36)&ChrW(125), incDir)
a = Replace(a, ChrW(91)&ChrW(36)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(36)&ChrW(93), getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100)))
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(36)&ChrW(125), getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(36)&ChrW(125), EDITORTYPE)
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(87)&ChrW(69)&ChrW(66)&ChrW(95)&ChrW(86)&ChrW(73)&ChrW(69)&ChrW(87)&ChrW(85)&ChrW(82)&ChrW(76)&ChrW(36)&ChrW(125), WEB_VIEWURL)
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(86)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(36)&ChrW(125), webVersion)
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(36)&ChrW(125), getConfigFileBlock(WEB_CACHEFile, ChrW(35)&ChrW(35775)&ChrW(23458)&ChrW(20449)&ChrW(24687)&ChrW(35)))
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(36)&ChrW(125), databaseType)
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(68)&ChrW(66)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(36)&ChrW(125), db_PREFIX)
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(36)&ChrW(125), IIF(getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) = ChrW(124)&ChrW(42)&ChrW(124), ChrW(36229)&ChrW(32423)&ChrW(31649)&ChrW(29702)&ChrW(21592), ChrW(26222)&ChrW(36890)&ChrW(31649)&ChrW(29702)&ChrW(21592)))
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(83)&ChrW(79)&ChrW(70)&ChrW(84)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(69)&ChrW(36)&ChrW(125), Request.ServerVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(83)&ChrW(79)&ChrW(70)&ChrW(84)&ChrW(87)&ChrW(65)&ChrW(82)&ChrW(69)))
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69)&ChrW(36)&ChrW(125), Request.ServerVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69)))
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(76)&ChrW(79)&ChrW(67)&ChrW(65)&ChrW(76)&ChrW(95)&ChrW(65)&ChrW(68)&ChrW(68)&ChrW(82)&ChrW(36)&ChrW(125), Request.ServerVariables(ChrW(76)&ChrW(79)&ChrW(67)&ChrW(65)&ChrW(76)&ChrW(95)&ChrW(65)&ChrW(68)&ChrW(68)&ChrW(82)))
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(80)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(36)&ChrW(125), Request.ServerVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(80)&ChrW(79)&ChrW(82)&ChrW(84)))
a = replaceValueParam(a, ChrW(109)&ChrW(100)&ChrW(98)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104), Request(ChrW(109)&ChrW(100)&ChrW(98)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104))) 
a = replaceValueParam(a, ChrW(119)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(105)&ChrW(114), webDir) 
a = replaceValueParam(a, ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69), EDITORTYPE)

If InStr(a, ChrW(123)&ChrW(36)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(36)&ChrW(125)) > 0 Then
c = getDirTxtNameList(adminDir & ChrW(47)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(66)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(85)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(115)&ChrW(47)) 
d = Split(c, vbCrLf) 
For each b In d
e = e & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(62) & b & ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62) & vbCrLf 
Next 
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(36)&ChrW(125), e) 
End if 

If EDITORTYPE = ChrW(112)&ChrW(104)&ChrW(112) Then
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(95)&ChrW(80)&ChrW(72)&ChrW(80)&ChrW(36)&ChrW(125), ChrW(112)&ChrW(104)&ChrW(112))
End if 
a = Replace(a, ChrW(123)&ChrW(36)&ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(95)&ChrW(80)&ChrW(72)&ChrW(80)&ChrW(36)&ChrW(125), "")
replaceLableContent = a 
End function

Function displayFlags(a)
Dim b 

If InStr(ChrW(124) & a & ChrW(124), ChrW(124)&ChrW(104)&ChrW(124)) > 0 Then
b = b & ChrW(22836)&ChrW(32) 
End if 

If InStr(ChrW(124) & a & ChrW(124), ChrW(124)&ChrW(99)&ChrW(124)) > 0 Then
b = b & ChrW(25512)&ChrW(32) 
End if 

If InStr(ChrW(124) & a & ChrW(124), ChrW(124)&ChrW(102)&ChrW(124)) > 0 Then
b = b & ChrW(24187)&ChrW(32) 
End if 

If InStr(ChrW(124) & a & ChrW(124), ChrW(124)&ChrW(97)&ChrW(124)) > 0 Then
b = b & ChrW(29305)&ChrW(32) 
End if 

If InStr(ChrW(124) & a & ChrW(124), ChrW(124)&ChrW(115)&ChrW(124)) > 0 Then
b = b & ChrW(28378)&ChrW(32) 
End if 

If InStr(ChrW(124) & a & ChrW(124), ChrW(124)&ChrW(98)&ChrW(124)) > 0 Then
b = b & ChrW(31895)&ChrW(32) 
End if 
If b <> "" Then b = ChrW(91)&ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(34)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(34)&ChrW(62) & b & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(93) 
displayFlags = b 
End function

Function showColumnList(ByVal a, ByVal b, c, ByVal d, e, ByVal f)
Dim g, h, i, j, k, l, m, n, o, p, q, r 
Dim s, t, u, v 
Dim w
w = ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101) 
If InStr(ChrW(124)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(124)&ChrW(98)&ChrW(98)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(124)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(124), ChrW(124) & LCase(b) & ChrW(124)) > 0 Then
w = ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101) 
End if 
a = Trim(a) 
p = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) 
q = getStrCut(f, ChrW(91)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(93), ChrW(91)&ChrW(47)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(93), 2) 
v = getStrCut(f, ChrW(91)&ChrW(114)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(93), ChrW(91)&ChrW(47)&ChrW(114)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(93), 2) 
s = getColumnName(a) 

If a <> q Then

If InStr(f, ChrW(91)&ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108) & e & ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)) > 0 Then
p = ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108) & e & ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) 
ElseIf InStr(f, ChrW(91)&ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)) > 0 Then
p = ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) 
End if 
End if 

Dim x : Set x = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))

Dim y, z, a1, a2, a3, a4, a5, a6, a7, a8 
Dim a9, a10, a11, a12, a13, a14 
y = getHandleFieldList(db_PREFIX & b, ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)) 
z = Split(y, ChrW(44)) 
n = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & b & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61) & a 


a4 = ChrW(91)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(45) & e & ChrW(93) : a5 = ChrW(91)&ChrW(47)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(45) & e & ChrW(93) 
If InStr(f, a4) = False And InStr(f, a5) = 0 Then
a4 = ChrW(91)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(93) : a5 = ChrW(91)&ChrW(47)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(93) 
End if 
o = getStrCut(f, a4, a5, 2) 
If o <> "" Then
n = getWhereAnd(n, o) 
End if 

n = n & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99) 

x.open n, conn, 1, 1 

r = x.recordcount 

For g = 1 To r
If Not x.eof Then

a4 = "" : a5 = "" 
k = "" 
m = False 

If CStr(x(ChrW(105)&ChrW(100))) = CStr(d) Or(v <> "" And CStr(x(ChrW(105)&ChrW(100))) = CStr(v)) Then
k = ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(32) 
m = True 
End if 

If m = True Then
a4 = ChrW(91) & p & ChrW(45)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(93) : a5 = ChrW(91)&ChrW(47) & p & ChrW(45)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(93) 
Else
a4 = ChrW(91) & p & ChrW(45) & s & ChrW(93) : a5 = ChrW(91)&ChrW(47) & p & ChrW(45) & s & ChrW(93) 
If InStr(f, a4) = 0 And InStr(f, a5) = 0 Then
a4 = ChrW(91) & p & ChrW(45) & g & ChrW(93) : a5 = ChrW(91)&ChrW(47) & p & ChrW(45) & g & ChrW(93) 
Else

End if 
End if 

If g = a6 And m = False Then
a4 = ChrW(91) & p & ChrW(45)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(93) : a5 = ChrW(91)&ChrW(47) & p & ChrW(45)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(93) 
End if 

For a7 = 6 To 2 Step - 1
If InStr(f, a4) = False And g Mod a7 = 0 Then
a4 = ChrW(91) & p & ChrW(45)&ChrW(109)&ChrW(111)&ChrW(100) & a7 & ChrW(93) : a5 = ChrW(91)&ChrW(47) & p & ChrW(45)&ChrW(109)&ChrW(111)&ChrW(100) & a7 & ChrW(93) 
If InStr(f, a4) > 0 Then
Exit for 
End if 
End if 
Next 

If InStr(f, a4) = 0 And InStr(f, a5) = 0 Then
a4 = ChrW(91) & p & ChrW(93) : a5 = ChrW(91)&ChrW(47) & p & ChrW(93) 
End if 


If InStr(f, a4) > 0 And InStr(f, a5) > 0 Then
h = strCut(f, a4, a5, 2) 
h = replaceValueParam(h, ChrW(105)&ChrW(100), x(ChrW(105)&ChrW(100))) 
h = replaceValueParam(h, ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100), k) 
j = x(c) : a8 = j 
If e >= 1 Then
j = copystr(ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59), e) & ChrW(9500)&ChrW(9472) & j 
End if 
h = replaceValueParam(h, ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101), j) 
h = replaceValueParam(h, ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101), a8) 
For a1 = 0 To UBound(z)
If z(a1) <> "" Then
a2 = z(a1) 
a3 = x(a2) & "" 
h = replaceValueParam(h, a2, a3) 
End if 
Next 

l = WEB_VIEWURL & ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(38)&ChrW(105)&ChrW(100)&ChrW(61) & x(ChrW(105)&ChrW(100))
l = handleWebUrl(l)

If Trim(x(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(117)&ChrW(114)&ChrW(108))) <> "" Then
l = Trim(x(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(117)&ChrW(114)&ChrW(108))) 
End if 
h = Replace(h, ChrW(91)&ChrW(36)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(36)&ChrW(93), l) 
h = replaceValueParam(h, ChrW(117)&ChrW(114)&ChrW(108), l) 
h = replaceValueParam(h, ChrW(105), g)
h = replaceValueParam(h, ChrW(32534)&ChrW(21495), g)

l = WEB_ADMINURL & ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(32593)&ChrW(31449)&ChrW(26639)&ChrW(30446)&ChrW(38)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(61)&ChrW(49)&ChrW(48)&ChrW(38)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61)&ChrW(38)&ChrW(105)&ChrW(100)&ChrW(61) & x(ChrW(105)&ChrW(100)) & ChrW(38)&ChrW(110)&ChrW(61) & getRnd(11) 
h = handleDisplayOnlineEditDialog(l, h, "", ChrW(100)&ChrW(105)&ChrW(118)&ChrW(124)&ChrW(108)&ChrW(105)&ChrW(124)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110))
If EDITORTYPE = ChrW(112)&ChrW(104)&ChrW(112) Then
h = Replace(h, ChrW(91)&ChrW(36)&ChrW(112)&ChrW(104)&ChrW(112)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)&ChrW(93), ChrW(91)&ChrW(93)) 
Else
h = Replace(h, ChrW(91)&ChrW(36)&ChrW(112)&ChrW(104)&ChrW(112)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)&ChrW(93), "") 
End if 

If x(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) = ChrW(45)&ChrW(49) And InStr(f, ChrW(91)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(93)) > 0 Then
t = getStrCut(f, ChrW(91)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(93), ChrW(91)&ChrW(47)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(93), 2) 
u = getStrCut(f, ChrW(91)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(93), ChrW(91)&ChrW(47)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(93), 2) 
If m = True Then
If InStr(f, ChrW(91)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(93)) > 0 Then
t = getStrCut(f, ChrW(91)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(93), ChrW(91)&ChrW(47)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(93), 2) 
End if 
If InStr(f, ChrW(91)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(93)) > 0 Then
u = getStrCut(f, ChrW(91)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(93), ChrW(91)&ChrW(47)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(93), 2) 
End if 
End if 
End if 
If EDITORTYPE <> ChrW(106)&ChrW(115)&ChrW(112) Then
i = i & t & h & vbCrLf 
h = showColumnList(x(ChrW(105)&ChrW(100)), b, c, d, e + 1, f) & u 
End if 
a11 = ChrW(91)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45) & x(w) & ChrW(93) : a12 = ChrW(91)&ChrW(47)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45) & x(w) & ChrW(93) 
If InStr(f, a11) = 0 And InStr(f, a12) = 0 Then
a11 = ChrW(91)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(93) : a12 = ChrW(91)&ChrW(47)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(93) 
End if 
a13 = ChrW(91)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(45) & x(w) & ChrW(93) : a14 = ChrW(91)&ChrW(47)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(45) & x(w) & ChrW(93) 
If InStr(f, a13) = 0 And InStr(f, a13) = 0 Then
a13 = ChrW(91)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(93) : a14 = ChrW(91)&ChrW(47)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(93) 
End if 

If g = r Then
a13 = ChrW(91)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(93) : a14 = ChrW(91)&ChrW(47)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(93) 
If InStr(f, a13) = 0 And InStr(f, a13) = 0 Then
a13 = ChrW(91)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(93) : a14 = ChrW(91)&ChrW(47)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(93) 
End if 
End if 
a9 = getStrCut(f, a11, a12, 2) 
a10 = getStrCut(f, a13, a14, 2) 

If h <> "" Then h = vbCrLf & a9 & h & a10 
i = i & h 
End if 
End if 
x.movenext : Next : x.close 

showColumnList = i 
End function

Function getMsg1(a, b)
Dim c 
c = readFile(ROOT_PATH & ChrW(109)&ChrW(115)&ChrW(103)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108), "") 
a = a & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62) & jsTiming(b, 5) 
c = Replace(c, ChrW(91)&ChrW(36)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(36)&ChrW(93), a) 
c = Replace(c, ChrW(91)&ChrW(36)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(36)&ChrW(93), b) 
c = replaceL(c, ChrW(25552)&ChrW(31034)&ChrW(20449)&ChrW(24687)) 
c = replaceL(c, ChrW(22914)&ChrW(26524)&ChrW(24744)&ChrW(30340)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(27809)&ChrW(26377)&ChrW(33258)&ChrW(21160)&ChrW(36339)&ChrW(36716)&ChrW(65292)&ChrW(35831)&ChrW(28857)&ChrW(20987)&ChrW(36825)&ChrW(37324)) 
c = replaceL(c, ChrW(20498)&ChrW(35745)&ChrW(26102)) 
getMsg1 = c 
End function

Function checkPower(a)
Dim b 
checkPower = False 
If getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100)) <> "" Then
call openconn()

b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100)) 

rss.Open b, conn, 1, 1 
If Not rss.EOF Then
call setsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115), rss(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115))) 
End if : rss.Close 

If InStr(ChrW(124) & getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) & ChrW(124), ChrW(124) & a & ChrW(124)) > 0 Or InStr(ChrW(124) & getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) & ChrW(124), ChrW(124)&ChrW(42)&ChrW(124)) > 0 Then
checkPower = True 
Else
checkPower = False 
End if 
Else
checkPower = True 
End if 
End function

Function handlePower(a)
If checkPower(a) = False Then
call eerr(ChrW(25552)&ChrW(31034), ChrW(20320)&ChrW(27809)&ChrW(26377)&ChrW(12304) & a & ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(65292)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(28857)&ChrW(20987)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
End if 
End function

Function dispalyManage(a, b, ByVal c, d)
call handlePower(ChrW(26174)&ChrW(31034) & b)
call loadWebConfig() 
Dim e, f, g, h, i, j, k, l
Dim m, n, o, p 
Dim q 
Dim r, s, t 
Dim u
Dim v
Dim w, x
Dim y
Dim z
r = LCase(a)
Dim a1 : a1 = ChrW(119)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)
If InStr(LCase(ChrW(124)&ChrW(98)&ChrW(98)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(124)), LCase(r)) > 0 Then
a1 = ChrW(98)&ChrW(98)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)
ElseIf InStr(LCase(ChrW(124)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(124)), LCase(r)) > 0 Then
a1 = ChrW(99)&ChrW(97)&ChrW(105)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) 
End if 
w = Request(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))
x = Request(ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100))
If Request.Form(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <> "" Then
y = Request.Form(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) 
Else
y = Request.QueryString(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) 
End if 
Dim a2 
Dim a3
a2 = rq(ChrW(105)&ChrW(100)) 
a3 = rq(ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(105)&ChrW(100)) 
i = getHandleFieldList(db_PREFIX & r, ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)) 
i = specialStrReplace(i)
v = Split(i, ChrW(44))

Dim a4, a5 
a5 = ChrW(109)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95) & r & ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) 
If Request(ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)) <> "" Then
a4 = ChrW(109)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95) & Request(ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)) & ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) 
If checkFile(a4) = True Then
a5 = a4 
End if 
End if 

e = getTemplateContent(a5) 
k = getStrCut(e, ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93), ChrW(91)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93), 2) 

If a = ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) Or a = ChrW(66)&ChrW(66)&ChrW(83)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) Or a = ChrW(67)&ChrW(97)&ChrW(105)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) Then
k = getStrCut(e, ChrW(91)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93), ChrW(91)&ChrW(47)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93), 1) 
e = Replace(e, k, showColumnList(ChrW(45)&ChrW(49), a, ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101), "", 0, k)) 
ElseIf a = ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(77)&ChrW(101)&ChrW(110)&ChrW(117) Then
k = getStrCut(e, ChrW(91)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93), ChrW(91)&ChrW(47)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93), 1) 
e = Replace(e, k, showColumnList(ChrW(45)&ChrW(49), ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117), ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101), "", 0, k)) 
Else
If x <> "" And w <> "" Then
If Left(x, 2) = ChrW(61)&ChrW(61) Then
x = Mid(x, 3) 
If w <> ChrW(105)&ChrW(100) And InStr(getHandleFieldList(db_PREFIX & r, ChrW(23383)&ChrW(27573)&ChrW(37197)&ChrW(32622)&ChrW(21015)&ChrW(34920)), ChrW(44) & w & ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(124)) = False Then
x = ChrW(39) & x & ChrW(39) 
End if 
d = getWhereAnd(ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & w & ChrW(32)&ChrW(61)&ChrW(32) & x & ChrW(32), d) 
Else
d = getWhereAnd(ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & w & ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & x & ChrW(37)&ChrW(39)&ChrW(32), d) 
End if 
End if 
If y <> "" Then
d = getWhereAnd(ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61) & y & ChrW(32), d) 
End if 

j = getWhereAnd(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & r, d)

If checksql(j) = False Then
call errorLog(ChrW(20986)&ChrW(38169)&ChrW(25552)&ChrW(31034)&ChrW(53)&ChrW(65306)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61) & k & ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61) & j & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
Exit function 
End if 

rs.Open j, conn, 1, 1 

o = rs.RecordCount 
g = handleNumber(Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))) 
If g = "" Then
p = 0 
Else
p = CInt(g) 
End if 
e = Replace(e, ChrW(91)&ChrW(36)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(36)&ChrW(93), webPageControl(o, c, CStr(p), n, "")) 
e = Replace(e, ChrW(91)&ChrW(36)&ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(36)&ChrW(93), j) 
If EDITORTYPE = ChrW(97)&ChrW(115)&ChrW(112) Then
m = getRsPageNumber(rs, o, c, p)
ElseIf EDITORTYPE = ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120) Then
















ElseIf EDITORTYPE = ChrW(106)&ChrW(115)&ChrW(112) Then

















Else
If p <> 0 Then
p = p - 1
End if
j = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & "" & r & ChrW(32) & d & ChrW(32)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(32) & c * p & ChrW(44) & c
rs.Open j, conn, 1, 1

m = rs.RecordCount
End if 

e = replaceValueParam(e, ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(95)&ChrW(115)&ChrW(113)&ChrW(108), j)
For f = 1 To m



g = Replace(k, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(100)&ChrW(36)&ChrW(93), rs(ChrW(105)&ChrW(100))) 
For s = 0 To UBound(v)
If v(s) <> "" Then
t = Split(v(s) & ChrW(124)&ChrW(124)&ChrW(124), ChrW(124)) 
u = t(0) 
z = rs(u) & "" 

If u = ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115) Then
z = displayFlags(z) 
End if 


g = replaceValueParam(g, u, z) 
End if 
Next 
q = ChrW(105)&ChrW(100) 
g = Replace(g, ChrW(91)&ChrW(36)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(36)&ChrW(93), ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(39)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & q & ChrW(39)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39) & q & ChrW(39)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(39) & rs(ChrW(105)&ChrW(100)) & ChrW(39)&ChrW(32)&ChrW(62)) 
g = Replace(g, ChrW(91)&ChrW(36)&ChrW(112)&ChrW(104)&ChrW(112)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)&ChrW(93), "") 
n = ChrW(12304)&ChrW(78)&ChrW(79)&ChrW(12305) 
If a = ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) Then
n = WEB_VIEWURL & ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(38)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100))
l= rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
ElseIf a = ChrW(79)&ChrW(110)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101) Then
n = WEB_VIEWURL & ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(38)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100)) 

ElseIf a = ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116) Then
n = WEB_VIEWURL & ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(38)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(105)&ChrW(100)) 
End if 

If InStr(i, ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(117)&ChrW(114)&ChrW(108)) > 0 Then

If Trim(rs(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(117)&ChrW(114)&ChrW(108))) <> "" Then
n = Trim(rs(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(117)&ChrW(114)&ChrW(108))) 
End if 
End if 
g = Replace(g, ChrW(91)&ChrW(36)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(36)&ChrW(93), n) 
g = Replace(g, ChrW(91)&ChrW(36)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(36)&ChrW(93), l) 
g = replaceValueParam(g, ChrW(99)&ChrW(102)&ChrW(103)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(117)&ChrW(114)&ChrW(108), cfg_webSiteUrl) 

g = replaceValueParam(g, ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(105)&ChrW(100), a3) 
h = h & g 
rs.MoveNext : Next : rs.Close 

e = Replace(e, ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93) & k & ChrW(91)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93), h) 

n = ChrW(63)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61)&ChrW(91)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(38)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61) & Request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)) & ChrW(38)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(61) & Request(ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)) & ChrW(38)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(61) & Request(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)) & ChrW(38)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61) & Request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) 
n = getUrlAddToParam(getUrl(), n, ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 

e = Replace(e, ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93) & k & ChrW(91)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93), h) 
End if 
If InStr(e, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(36)&ChrW(93)) > 0 Then
k = ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(91)&ChrW(36)&ChrW(105)&ChrW(100)&ChrW(36)&ChrW(93)&ChrW(34)&ChrW(91)&ChrW(36)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(36)&ChrW(93)&ChrW(62)&ChrW(91)&ChrW(36)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(36)&ChrW(93)&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)&ChrW(91)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93) 
h = ChrW(60)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(34)&ChrW(62)&ChrW(8801)&ChrW(32)&ChrW(36873)&ChrW(25321)&ChrW(26639)&ChrW(30446)&ChrW(32)&ChrW(8801)&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62) & showColumnList(ChrW(45)&ChrW(49), a1, ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101), y, 0, k) & vbCrLf & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(62) 
e = Replace(e, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(36)&ChrW(93), h)
End if 
e = replaceValueParam(e, ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100), Request(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)))
e = replaceValueParam(e, ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100), Request(ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)))
e = replaceValueParam(e, ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101), Request(ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)))
e = replaceValueParam(e, ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108), Request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)))
e = replaceValueParam(e, ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101), r)
e = replaceValueParam(e, ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), Request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)))
e = replaceValueParam(e, ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101), Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
e = replaceValueParam(e, ChrW(105)&ChrW(100), a2)
e = replaceValueParam(e, ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101), Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)))
e = replaceValueParam(e, ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100), Request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
e = replaceValueParam(e, ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(105)&ChrW(100), a3) 
n = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(38)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(61)&ChrW(38)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(61)&ChrW(38)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61), ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)) 
e = replaceValueParam(e, ChrW(112)&ChrW(111)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110), ChrW(31995)&ChrW(32479)&ChrW(31649)&ChrW(29702)&ChrW(32)&ChrW(62)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39) & n & ChrW(39)&ChrW(62) & b & ChrW(21015)&ChrW(34920)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62))
e = Replace(e, ChrW(123)&ChrW(36)&ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(36)&ChrW(125), EDITORTYPE)
e = Replace(e, ChrW(123)&ChrW(36)&ChrW(87)&ChrW(69)&ChrW(66)&ChrW(95)&ChrW(86)&ChrW(73)&ChrW(69)&ChrW(87)&ChrW(85)&ChrW(82)&ChrW(76)&ChrW(36)&ChrW(125), WEB_VIEWURL)
e = Replace(e, ChrW(123)&ChrW(36)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(95)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(36)&ChrW(125), cfg_webTitle) 
e = replaceValueParam(e, ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69), EDITORTYPE)
e = e & stat2016(True) 
e = handleDisplayLanguage(e, ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(76)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101))
call rw(e) 
End function

Function addEditDisplay(a, b, ByVal c)
Dim d, e, f, g, h, i, j, k, l, m 
Dim n
Dim o
Dim p
Dim q
Dim r
Dim s
Dim t
Dim u
Dim v
Dim w, x, y, z 
Dim a1, a2
Dim a3, a4, a5, a6 
Dim a7 : a7 = Request(ChrW(105)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
If a7 = "" Then
a7 = ChrW(105)&ChrW(100) 
End if 
Dim a8 
a8 = rq(ChrW(105)&ChrW(100)) 
e = ChrW(28155)&ChrW(21152) 
If a8 <> "" Then
e = ChrW(20462)&ChrW(25913) 
If a8 = ChrW(57)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(57) And a = ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110) Then
call eerr(ChrW(25552)&ChrW(31034), ChrW(38750)&ChrW(27491)&ChrW(24120)&ChrW(30331)&ChrW(24405)&ChrW(19981)&ChrW(33021)&ChrW(20462)&ChrW(25913)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(21518)&ChrW(21488)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(39)&ChrW(62)&ChrW(36827)&ChrW(20837)&ChrW(21518)&ChrW(21488)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(21015)&ChrW(34920)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
End if 
End if 
If InStr(ChrW(44)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(44), ChrW(44) & a & ChrW(44)) > 0 And a8 = getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100)) & "" Then
call handlePower(ChrW(20462)&ChrW(25913)&ChrW(33258)&ChrW(36523))
Else
call handlePower(ChrW(26174)&ChrW(31034) & b)
End if 
c = ChrW(44) & specialStrReplace(c) & ChrW(44)
k = LCase(a)
Dim a9
a9 = getHandleFieldList(db_PREFIX & k, ChrW(23383)&ChrW(27573)&ChrW(37197)&ChrW(32622)&ChrW(21015)&ChrW(34920)) 
w = Split(a9, ChrW(44)) 

Dim a10, a11 
a11 = ChrW(97)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(95) & k & ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) 
If Request(ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)) <> "" Then
a10 = ChrW(97)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(95) & Request(ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)) & ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) 
If checkFile(a10) = True Then
a11 = a10 
End if 
End if 

d = getTemplateContent(a11) 

If InStr(cfg_flags, ChrW(124)&ChrW(105)&ChrW(115)&ChrW(99)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(124)) > 0 Then
i = getStrCut(d, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(35)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(35)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(35)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(35)&ChrW(45)&ChrW(45)&ChrW(62), 1) 
If i <> "" Then
d = Replace(d, i, "") 
End if 
End if 

If a8 = ChrW(42) Then
r = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & "" & k 
Else
r = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & "" & k & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & a7 & ChrW(61) & a8 
End if 
If InStr(ChrW(44)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(44), ChrW(44) & a & ChrW(44)) > 0 Then

If v = ChrW(124)&ChrW(42)&ChrW(124) Then
call handlePower(ChrW(42))
End if 

a3 = getStrCut(d, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(47)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(45)&ChrW(62), 2) 
a4 = getStrCut(a3, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(45)&ChrW(62), 2) 
If a4 <> "" Then

rsx.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(77)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)&ChrW(60)&ChrW(62)&ChrW(45)&ChrW(49)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99), conn, 1, 1 
While Not rsx.EOF

a5 = getStrCut(d, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) & rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) & rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(45)&ChrW(45)&ChrW(62), 2) 
If a5 = "" Then
a5 = a4 
End if 
a5 = Replace(a5, ChrW(91)&ChrW(36)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(36)&ChrW(93), rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) 
a5 = Replace(a5, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(100)&ChrW(36)&ChrW(93), rsx(ChrW(105)&ChrW(100))) 
a6 = a6 & a5 & vbCrLf 
rsx.MoveNext : Wend : rsx.Close 

End if 
If a3 <> "" Then
d = Replace(d, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(45)&ChrW(62) & a3 & ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(47)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(45)&ChrW(62), a6) 
End if 

If CStr(getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100))) = CStr(a8) And getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) = ChrW(124)&ChrW(42)&ChrW(124) And a8 <> "" Then
i = getStrCut(d, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(26222)&ChrW(36890)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(26222)&ChrW(36890)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(45)&ChrW(62), 1) 
d = Replace(d, i, ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(39)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(42)&ChrW(39)&ChrW(32)&ChrW(47)&ChrW(62)) 
i = getStrCut(d, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(29992)&ChrW(25143)&ChrW(26435)&ChrW(38480)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(29992)&ChrW(25143)&ChrW(26435)&ChrW(38480)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(45)&ChrW(62), 1) 
d = Replace(d, i, "") 
i = getStrCut(d, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(36229)&ChrW(32423)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(36229)&ChrW(32423)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(45)&ChrW(62), 1) 
d = Replace(d, i, "") 

ElseIf(a8 <> "" Or e = ChrW(28155)&ChrW(21152)) And getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) = ChrW(124)&ChrW(42)&ChrW(124) Then
i = getStrCut(d, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(36229)&ChrW(32423)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(36229)&ChrW(32423)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(45)&ChrW(62), 1) 
d = Replace(d, i, "") 
i = getStrCut(d, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(29992)&ChrW(25143)&ChrW(26435)&ChrW(38480)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(29992)&ChrW(25143)&ChrW(26435)&ChrW(38480)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(45)&ChrW(62), 1) 
d = Replace(d, i, "") 
End if 
End if 

If a8 <> "" Then
rs.Open r, conn, 1, 1 
If Not rs.EOF Then
a8 = rs(a7)
End if 

If InStr(a9, ChrW(44)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(124)) > 0 Then
u = rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)) 
End if 

If InStr(a9, ChrW(44)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(124)) > 0 Then
v = rs(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) 
End if 
End if 
For each x In w
If x <> "" Then
f = Split(x & ChrW(124)&ChrW(124)&ChrW(124), ChrW(124)) 
n = f(0)
p = "" 
y = "" 

p = f(1)
y = f(2)


If InStr(c, ChrW(44) & n & ChrW(124)) > 0 Then
x = Mid(c, InStr(c, ChrW(44) & n & ChrW(124)) + 1) 
x = Mid(x, 1, InStr(x, ChrW(44)) - 1) 
f = Split(x & ChrW(124)&ChrW(124)&ChrW(124), ChrW(124)) 
p = "" 
y = "" 

p = f(1)
y = f(2)

End if 
q = y 
If e = ChrW(20462)&ChrW(25913) Then
q = "" 

q = rs(n) 




Else
If p = ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101) Then
q = Now() 
End if 
End if 


If p = ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100) Then
q = "" 
End if 
If q <> "" Then
q = Replace(Replace(q, ChrW(34), ChrW(38)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(59)), ChrW(60), ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59))
End if 
If InStr(LCase(ChrW(44)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(44)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(44)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(77)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(44)&ChrW(66)&ChrW(66)&ChrW(83)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(44)&ChrW(66)&ChrW(66)&ChrW(83)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(44)&ChrW(67)&ChrW(97)&ChrW(105)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(44)&ChrW(67)&ChrW(97)&ChrW(105)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(44)), ChrW(44) & LCase(a) & ChrW(44)) > 0 And n = ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) Then
s = ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(91)&ChrW(36)&ChrW(105)&ChrW(100)&ChrW(36)&ChrW(93)&ChrW(34)&ChrW(91)&ChrW(36)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(36)&ChrW(93)&ChrW(62)&ChrW(91)&ChrW(36)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(36)&ChrW(93)&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)&ChrW(91)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93) 
If e = ChrW(28155)&ChrW(21152) Then
q = Request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) 
End if 
a1 = ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) 
If InStr(LCase(ChrW(124)&ChrW(66)&ChrW(66)&ChrW(83)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(124)&ChrW(66)&ChrW(66)&ChrW(83)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(124)), ChrW(124) & LCase(a) & ChrW(124)) > 0 Then
a1 = ChrW(98)&ChrW(98)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) 
ElseIf InStr(LCase(ChrW(124)&ChrW(67)&ChrW(97)&ChrW(105)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(124)&ChrW(67)&ChrW(97)&ChrW(105)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(124)), ChrW(124) & LCase(a) & ChrW(124)) > 0 Then
a1 = ChrW(99)&ChrW(97)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) 
End if 
a2 = ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101) 
If a = ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(77)&ChrW(101)&ChrW(110)&ChrW(117) Then
a1 = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117) 
a2 = ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101) 
End if 
j = ChrW(60)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(45)&ChrW(49)&ChrW(34)&ChrW(62)&ChrW(8801)&ChrW(32)&ChrW(20316)&ChrW(20026)&ChrW(19968)&ChrW(32423)&ChrW(26639)&ChrW(30446)&ChrW(32)&ChrW(8801)&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62) & showColumnList(ChrW(45)&ChrW(49), a1, a2, q, 0, s) & vbCrLf & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(62) 
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(36)&ChrW(93), j)
ElseIf a = ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) And n = ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101) Then
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(36)&ChrW(93), showSelectList(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101), WEBCOLUMNTYPE, ChrW(124), q)) 
ElseIf InStr(ChrW(44)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(44)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(44), ChrW(44) & a & ChrW(44)) > 0 And n = ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115) Then
t = ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115) 
If EDITORTYPE = ChrW(112)&ChrW(104)&ChrW(112) Then
t = ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(91)&ChrW(93)
End if 
If a = ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) Then
i = inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(104)&ChrW(124)) > 0, True, False), ChrW(104), ChrW(22836)&ChrW(26465)&ChrW(91)&ChrW(104)&ChrW(93)) 
i = i & inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(99)&ChrW(124)) > 0, True, False), ChrW(99), ChrW(25512)&ChrW(33616)&ChrW(91)&ChrW(99)&ChrW(93)) 
i = i & inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(102)&ChrW(124)) > 0, True, False), ChrW(102), ChrW(24187)&ChrW(28783)&ChrW(91)&ChrW(102)&ChrW(93)) 
i = i & inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(97)&ChrW(124)) > 0, True, False), ChrW(97), ChrW(29305)&ChrW(33616)&ChrW(91)&ChrW(97)&ChrW(93)) 
i = i & inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(115)&ChrW(124)) > 0, True, False), ChrW(115), ChrW(28378)&ChrW(21160)&ChrW(91)&ChrW(115)&ChrW(93)) 
i = i & Replace(inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(98)&ChrW(124)) > 0, True, False), ChrW(98), ChrW(21152)&ChrW(31895)&ChrW(91)&ChrW(98)&ChrW(93)), "", "") 
i = Replace(i, ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(39)&ChrW(62), ChrW(32)&ChrW(111)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(61)&ChrW(39)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(40)&ChrW(41)&ChrW(39)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(39)&ChrW(62)) 
ElseIf a = ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) Then
i = inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(124)) > 0, True, False), ChrW(116)&ChrW(111)&ChrW(112), ChrW(39030)&ChrW(37096)&ChrW(26174)&ChrW(31034)) 
i = i & inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(124)) > 0, True, False), ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116), ChrW(24213)&ChrW(37096)&ChrW(26174)&ChrW(31034)) 
i = i & inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(124)) > 0, True, False), ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116), ChrW(24038)&ChrW(36793)&ChrW(26174)&ChrW(31034)) 
i = i & inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(124)) > 0, True, False), ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114), ChrW(20013)&ChrW(38388)&ChrW(26174)&ChrW(31034)) 
i = i & inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(124)) > 0, True, False), ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116), ChrW(21491)&ChrW(36793)&ChrW(26174)&ChrW(31034)) 
i = i & inputCheckBox3(t, iif(InStr(ChrW(124) & q & ChrW(124), ChrW(124)&ChrW(111)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(124)) > 0, True, False), ChrW(111)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(114), ChrW(20854)&ChrW(23427)&ChrW(20301)&ChrW(32622)&ChrW(26174)&ChrW(31034)) 
End if 
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(36)&ChrW(93), i) 
ElseIf p = ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(49) Then
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95) & n & ChrW(36)&ChrW(93), handleInputHiddenTextArea(n, q, ChrW(57)&ChrW(55)&ChrW(37), ChrW(49)&ChrW(50)&ChrW(48)&ChrW(112)&ChrW(120), ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116), "")) 
ElseIf p = ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(50) Then
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95) & n & ChrW(36)&ChrW(93), handleInputHiddenTextArea(n, q, ChrW(57)&ChrW(55)&ChrW(37), ChrW(51)&ChrW(48)&ChrW(48)&ChrW(112)&ChrW(120), ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116), "")) 
ElseIf p = ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(51) Then
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95) & n & ChrW(36)&ChrW(93), handleInputHiddenTextArea(n, q, ChrW(57)&ChrW(55)&ChrW(37), ChrW(53)&ChrW(48)&ChrW(48)&ChrW(112)&ChrW(120), ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116), "")) 
ElseIf p = ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100) Then
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95) & n & ChrW(36)&ChrW(93), ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & n & ChrW(39)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(39)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39) & n & ChrW(39)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(39) & q & ChrW(39)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58)&ChrW(57)&ChrW(55)&ChrW(37)&ChrW(59)&ChrW(39)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(39)&ChrW(62)) 
ElseIf InStr(d, ChrW(91)&ChrW(36)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(49)&ChrW(95) & n & ChrW(36)&ChrW(93)) > 0 Then
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(49)&ChrW(95) & n & ChrW(36)&ChrW(93), handleInputHiddenTextArea(n, q, ChrW(57)&ChrW(55)&ChrW(37), ChrW(49)&ChrW(50)&ChrW(48)&ChrW(112)&ChrW(120), ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116), "")) 
Else

If InStr(d, ChrW(91)&ChrW(36)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(49)&ChrW(95) & n & ChrW(36)&ChrW(93)) > 0 Then
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(49)&ChrW(95) & n & ChrW(36)&ChrW(93), handleInputHiddenTextArea(n, q, ChrW(57)&ChrW(55)&ChrW(37), ChrW(49)&ChrW(50)&ChrW(48)&ChrW(112)&ChrW(120), ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116), "")) 
ElseIf InStr(d, ChrW(91)&ChrW(36)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(50)&ChrW(95) & n & ChrW(36)&ChrW(93)) > 0 Then
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(50)&ChrW(95) & n & ChrW(36)&ChrW(93), handleInputHiddenTextArea(n, q, ChrW(57)&ChrW(55)&ChrW(37), ChrW(51)&ChrW(48)&ChrW(48)&ChrW(112)&ChrW(120), ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116), "")) 
ElseIf InStr(d, ChrW(91)&ChrW(36)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(51)&ChrW(95) & n & ChrW(36)&ChrW(93)) > 0 Then
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(51)&ChrW(95) & n & ChrW(36)&ChrW(93), handleInputHiddenTextArea(n, q, ChrW(57)&ChrW(55)&ChrW(37), ChrW(53)&ChrW(48)&ChrW(48)&ChrW(112)&ChrW(120), ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116), "")) 
Else
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(95) & n & ChrW(36)&ChrW(93), inputText2(n, q, ChrW(57)&ChrW(55)&ChrW(37), ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116), "")) 
End if 
End if 
d = replaceValueParam(d, n, q) 
End if 
Next 
If a8 <> "" Then
rs.Close 
End if 

d = Replace(d, ChrW(91)&ChrW(36)&ChrW(115)&ChrW(119)&ChrW(105)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(73)&ChrW(100)&ChrW(36)&ChrW(93), Request(ChrW(115)&ChrW(119)&ChrW(105)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(73)&ChrW(100))) 
l = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
l = getUrlAddToParam(l, ChrW(63)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(105)&ChrW(100)&ChrW(61) & a8, ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 

If InStr(ChrW(124)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(83)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(124), ChrW(124) & a & ChrW(124)) = 0 Then
m = ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39) & l & ChrW(39)&ChrW(62) & b & ChrW(21015)&ChrW(34920)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)&ChrW(62)&ChrW(32) 
End if 
d = replaceValueParam(d, ChrW(112)&ChrW(111)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110), ChrW(31995)&ChrW(32479)&ChrW(31649)&ChrW(29702)&ChrW(32)&ChrW(62)&ChrW(32) & m & e & ChrW(20449)&ChrW(24687)) 
d = replaceValueParam(d, ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100), Request(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)))
d = replaceValueParam(d, ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100), Request(ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)))
d = replaceValueParam(d, ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101), Request(ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)))
d = replaceValueParam(d, ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108), Request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)))
d = replaceValueParam(d, ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101), k)
d = replaceValueParam(d, ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), Request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)))
d = replaceValueParam(d, ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101), Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
d = replaceValueParam(d, ChrW(105)&ChrW(100), a8)
d = replaceValueParam(d, ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101), Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)))
d = replaceValueParam(d, ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100), Request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
d = Replace(d, ChrW(123)&ChrW(36)&ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(36)&ChrW(125), EDITORTYPE)
d = Replace(d, ChrW(123)&ChrW(36)&ChrW(87)&ChrW(69)&ChrW(66)&ChrW(95)&ChrW(86)&ChrW(73)&ChrW(69)&ChrW(87)&ChrW(85)&ChrW(82)&ChrW(76)&ChrW(36)&ChrW(125), WEB_VIEWURL)
d = Replace(d, ChrW(123)&ChrW(36)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(95)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(36)&ChrW(125), cfg_webTitle) 
d = replaceValueParam(d, ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69), EDITORTYPE)
d = replaceValueParam(d, ChrW(105)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101), a7)
z = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(105)&ChrW(100)&ChrW(61) & a8, ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
d = replaceValueParam(d, ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(85)&ChrW(114)&ChrW(108), z) 

If EDITORTYPE = ChrW(112)&ChrW(104)&ChrW(112) Then
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(112)&ChrW(104)&ChrW(112)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)&ChrW(93), ChrW(91)&ChrW(93)) 
Else
d = Replace(d, ChrW(91)&ChrW(36)&ChrW(112)&ChrW(104)&ChrW(112)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)&ChrW(93), "") 
End if 
d = handleDisplayLanguage(d, ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(76)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101))
call rw(d) 
End function

Function saveAddEdit(a, b, ByVal c)
Dim d, e, f 
Dim g, h, i 
g = Request(ChrW(105)&ChrW(100)) 
h = IIF(g = "", ChrW(28155)&ChrW(21152), ChrW(20462)&ChrW(25913)) 
call handlePower(h & b)
call openconn() 
c = ChrW(44) & specialStrReplace(c) & ChrW(44)
d = LCase(a)
i = getPostSql(g, d, c) 


If checksql(i) = False Then
call errorLog(ChrW(20986)&ChrW(38169)&ChrW(25552)&ChrW(31034)&ChrW(65306)&ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61) & i & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
Exit function 
End if 


If LCase(a) = ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101) Then
If InStr(Request(ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)), ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(114)&ChrW(117)&ChrW(110)) = 0 Then
call deleteFile(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)) 
End if 
End if 
f = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
f = getUrlAddToParam(f, ChrW(63)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(105)&ChrW(100)&ChrW(61) & g, ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 

If g = "" Then
e = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
e = getUrlAddToParam(e, ChrW(63)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(105)&ChrW(100)&ChrW(61) & g, ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
call rw(getMsg1(ChrW(25968)&ChrW(25454)&ChrW(28155)&ChrW(21152)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(36820)&ChrW(22238)&ChrW(32487)&ChrW(32493)&ChrW(28155)&ChrW(21152) & b & ChrW(46)&ChrW(46)&ChrW(46)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39) & f & ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238) & b & ChrW(21015)&ChrW(34920)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62), e)) 
Else
e = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(115)&ChrW(119)&ChrW(105)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(73)&ChrW(100)&ChrW(61) & Request.Form(ChrW(115)&ChrW(119)&ChrW(105)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(73)&ChrW(100)), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
e = getUrlAddToParam(e, ChrW(63)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(105)&ChrW(100)&ChrW(61) & g, ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 

If InStr(ChrW(124)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(83)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(124), ChrW(124) & a & ChrW(124)) > 0 Then
call rw(getMsg1(ChrW(25968)&ChrW(25454)&ChrW(20462)&ChrW(25913)&ChrW(25104)&ChrW(21151), e)) 
Else
call rw(getMsg1(ChrW(25968)&ChrW(25454)&ChrW(20462)&ChrW(25913)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837) & b & ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39) & e & ChrW(39)&ChrW(62)&ChrW(32487)&ChrW(32493)&ChrW(32534)&ChrW(36753)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62), f)) 
End if 
End if 
call writeSystemLog(d, h & b)
End function

Function del(a, b)
Dim c, d 
c = LCase(a)
Dim e 
Dim f : f = Request(ChrW(105)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
If f = "" Then
f = ChrW(105)&ChrW(100) 
End if 
call handlePower(ChrW(21024)&ChrW(38500) & b)
e = Request(ChrW(105)&ChrW(100)) 
If e <> "" Then
d = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
call openconn() 

If a = ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110) Then

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & "" & c & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & f & ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40) & e & ChrW(41)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(124)&ChrW(42)&ChrW(124)&ChrW(39), conn, 1, 1 
If Not rs.EOF Then
call rwend(getMsg1(ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(31995)&ChrW(32479)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(19981)&ChrW(21487)&ChrW(20197)&ChrW(21024)&ChrW(38500)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837) & b & ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46), d)) 
End if : rs.Close 

End if 
conn.Execute(ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & "" & c & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40) & e & ChrW(41)) 
call rw(getMsg1(ChrW(21024)&ChrW(38500) & b & ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837) & b & ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46), d)) 

If c <> ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(108)&ChrW(111)&ChrW(103) Then
call writeSystemLog(c, ChrW(21024)&ChrW(38500) & b)
End if 
End if 
End function

Function updateHandle(a)
Dim b, c, d, e, f, g, h, i,j,k,l
Dim m : m = Request(ChrW(105)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
If m = "" Then
m = ChrW(105)&ChrW(100) 
End if 
g = LCase(a)
b = Split(Request(ChrW(105)&ChrW(100)), ChrW(44)) 
c = Split(Request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)), ChrW(44)) 
j=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
k=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))
if j="" then j=ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)
For d = 0 To UBound(b)
e = b(d) 
i = c(d) 
if k=ChrW(49) then
If i = "" Then
l = 0 
Else
l = CInt(i) 
End if 
else
l=i
end if
conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & g & ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)& j &ChrW(61) & l & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & m & ChrW(61) & e) 
Next 
h = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
call rw(getMsg1(ChrW(26356)&ChrW(26032)&ChrW(23436)&ChrW(25104)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36820)&ChrW(22238)&ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46), h)) 
call writeSystemLog(g, ChrW(26356)&ChrW(26032) & Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
End function

Function sortHandle(a)
Dim b, c, d, e, f, g, h, i 
Dim j : j = Request(ChrW(105)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
If j = "" Then
j = ChrW(105)&ChrW(100) 
End if 
g = LCase(a)
b = Split(Request(ChrW(105)&ChrW(100)), ChrW(44)) 
c = Split(Request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)), ChrW(44)) 
For d = 0 To UBound(b)
e = b(d) 
i = c(d) 
If i = "" Then
f = 0 
Else
f = CInt(i) 
End if 
conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & g & ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(61) & f & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & j & ChrW(61) & e) 
Next 
h = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
call rw(getMsg1(ChrW(26356)&ChrW(26032)&ChrW(25490)&ChrW(24207)&ChrW(23436)&ChrW(25104)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36820)&ChrW(22238)&ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46), h)) 
call writeSystemLog(g, ChrW(25490)&ChrW(24207) & Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
End function

Function viewsHandle(a)
Dim b, c, d, e, f, g, h, i 
Dim j : j = Request(ChrW(105)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
If j = "" Then
j = ChrW(105)&ChrW(100) 
End if 
g = LCase(a)
b = Split(Request(ChrW(105)&ChrW(100)), ChrW(44)) 
c = Split(Request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)), ChrW(44)) 
For d = 0 To UBound(b)
e = b(d) 
i = c(d) 
If i = "" Then
f = 0 
Else
f = CInt(i) 
End if 
conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & g & ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(61) & f & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & j & ChrW(61) & e) 
Next 
h = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
call rw(getMsg1(ChrW(26356)&ChrW(26032)&ChrW(28857)&ChrW(20987)&ChrW(23436)&ChrW(25104)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36820)&ChrW(22238)&ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46), h)) 
call writeSystemLog(g, ChrW(28857)&ChrW(20987) & Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
End function

Function batchEditPrice(a)
Dim b, c, d, e, f, g, h, i 
Dim j : j = Request(ChrW(105)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
If j = "" Then
j = ChrW(105)&ChrW(100) 
End if 
g = LCase(a)
b = Split(Request(ChrW(105)&ChrW(100)), ChrW(44)) 
c = Split(Request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)), ChrW(44)) 
For d = 0 To UBound(b)
e = b(d) 
i = c(d) 
If i = "" Then
f = 0 
Else
f = CInt(i) 
End if 
conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & g & ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(61) & f & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & j & ChrW(61) & e) 
Next 
h = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
call rw(getMsg1(ChrW(26356)&ChrW(26032)&ChrW(20215)&ChrW(26684)&ChrW(23436)&ChrW(25104)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36820)&ChrW(22238)&ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46), h)) 
call writeSystemLog(g, ChrW(20215)&ChrW(26684) & Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
End function

Function updateField()
Dim a, b, c, d, e, f 
a = LCase(Request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)))
b = Request(ChrW(105)&ChrW(100))
c = LCase(Request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
d = Request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
e = getHandleFieldList(db_PREFIX & a, ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)) 


If InStr(e, ChrW(44) & c & ChrW(44)) = 0 Then
call eerr(ChrW(20986)&ChrW(38169)&ChrW(25552)&ChrW(31034)&ChrW(50), ChrW(34920)&ChrW(40) & a & ChrW(41)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(23383)&ChrW(27573)&ChrW(40) & c & ChrW(41)) 
Else
conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & a & ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32) & c & ChrW(61) & d & ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & b) 
End if 
f = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
call rw(getMsg1(ChrW(25805)&ChrW(20316)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36820)&ChrW(22238)&ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46), f)) 
End function

Sub saveRobots()
Dim a, b 
call handlePower(ChrW(20462)&ChrW(25913)&ChrW(29983)&ChrW(25104)&ChrW(82)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115))
a = Request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)) 
call createfile(ROOT_PATH & ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(114)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116), a) 
b = ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(38)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(107)&ChrW(101)&ChrW(82)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(29983)&ChrW(25104)&ChrW(82)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115) 
call rw(getMsg1(ChrW(20445)&ChrW(23384)&ChrW(82)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837)&ChrW(82)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115)&ChrW(30028)&ChrW(38754)&ChrW(46)&ChrW(46)&ChrW(46), b)) 
call writeSystemLog("", ChrW(20445)&ChrW(23384)&ChrW(82)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116))
End sub

Function deleteAllMakeHtml()
Dim a 


rsx.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99), conn, 1, 1 
While Not rsx.EOF
If CInt(rsx(ChrW(110)&ChrW(111)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119))) = 0 Then
a = getRsUrl(rsx(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)), rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(65)&ChrW(85)&ChrW(114)&ChrW(108)), ChrW(47)&ChrW(110)&ChrW(97)&ChrW(118) & rsx(ChrW(105)&ChrW(100))) 
If Right(a, 1) = ChrW(47) Then
a = a & ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) 
End if 
call echo(ChrW(26639)&ChrW(30446)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39) & a & ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
call deleteFile(a) 
End if 
rsx.MoveNext : Wend : rsx.Close 

rsx.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99), conn, 1, 1 
While Not rsx.EOF
If CInt(rsx(ChrW(110)&ChrW(111)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119))) = 0 Then
a = getRsUrl(rsx(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)), rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(65)&ChrW(85)&ChrW(114)&ChrW(108)), ChrW(47)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(47)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) & rsx(ChrW(105)&ChrW(100))) 
If Right(a, 1) = ChrW(47) Then
a = a & ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) 
End if 
call echo(ChrW(25991)&ChrW(31456)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39) & a & ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
call deleteFile(a) 
End if 
rsx.MoveNext : Wend : rsx.Close 

rsx.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(111)&ChrW(110)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99), conn, 1, 1 
While Not rsx.EOF
If CInt(rsx(ChrW(110)&ChrW(111)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119))) = 0 Then
a = getRsUrl(rsx(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)), rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(65)&ChrW(85)&ChrW(114)&ChrW(108)), ChrW(47)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) & rsx(ChrW(105)&ChrW(100))) 
If Right(a, 1) = ChrW(47) Then
a = a & ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) 
End if 
call echo(ChrW(21333)&ChrW(39029)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39) & a & ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
call deleteFile(a) 
End if 
rsx.MoveNext : Wend : rsx.Close 

End function

Function stat2016(a)
Dim b 
If getcookie(ChrW(116)&ChrW(106)&ChrW(66)) = "" And getIP() <> ChrW(49)&ChrW(50)&ChrW(55)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(49) Then
call setCookie(ChrW(116)&ChrW(106)&ChrW(66), ChrW(49), 3600) 
b = b & Chr(60) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(32) & Chr(115) & Chr(114) & Chr(99) & Chr(61) & Chr(34) & Chr(104) & Chr(116) & Chr(116) & Chr(112) & Chr(58) & Chr(47) & Chr(47) & Chr(106) & Chr(115) & Chr(46) & Chr(117) & Chr(115) & Chr(101) & Chr(114) & Chr(115) & Chr(46) & Chr(53) & Chr(49) & Chr(46) & Chr(108) & Chr(97) & Chr(47) & Chr(52) & Chr(53) & Chr(51) & Chr(50) & Chr(57) & Chr(51) & Chr(49) & Chr(46) & Chr(106) & Chr(115) & Chr(34) & Chr(62) & Chr(60) & Chr(47) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(62) 
If a = True Then
b = ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(58)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(59)&ChrW(34)&ChrW(62) & b & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) 
End if 
End if 
stat2016 = b 
End function

Function getOfficialWebsite()
Dim a, b  
If getcookie(ChrW(80)&ChrW(65)&ChrW(65)&ChrW(74)&ChrW(67)&ChrW(77)&ChrW(83)&ChrW(71)&ChrW(87)) = "" Then
b = Chr(104) & Chr(116) & Chr(116) & Chr(112) & Chr(58) & Chr(47) & Chr(47) & Chr(115) & Chr(104) & Chr(97) & Chr(114) & Chr(101) & Chr(109) & Chr(98) & Chr(119) & Chr(101) & Chr(98) & Chr(46) & Chr(99) & Chr(111) & Chr(109) & Chr(47) & Chr(112) & Chr(97) & Chr(97) & Chr(106) & Chr(99) & Chr(109) & Chr(115) & Chr(47) & Chr(112) & Chr(97) & Chr(97) & Chr(106) & Chr(99) & Chr(109) & Chr(115) & Chr(46) & Chr(97) & Chr(115) & Chr(112) & ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(38)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(61) & escape(webDoMain()) & ChrW(38)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61) & escape(webVersion) & ChrW(38)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61) & language 

a = ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62) 
Else 
a = getcookie(ChrW(80)&ChrW(65)&ChrW(65)&ChrW(74)&ChrW(67)&ChrW(77)&ChrW(83)&ChrW(71)&ChrW(87))
a=ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(100)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(119)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(117)&ChrW(110)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(101)&ChrW(40)&ChrW(34)& a &ChrW(34)&ChrW(41)&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)
End if 
getOfficialWebsite = a 

End function

Function updateWebsiteStat()
Dim a, b, c, d, e 
Dim f, g, h 
call handlePower(ChrW(26356)&ChrW(26032)&ChrW(32593)&ChrW(31449)&ChrW(32479)&ChrW(35745))
conn.Execute(ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116))
a = getDirTxtList(adminDir & ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(47)) 
b = Split(a, vbCrLf) 
h = 1 
For each d In b
e = getFileName(d) 
If d <> "" And Left(e, 1) <> ChrW(35) Then
h = h + 1 
call echo(h & ChrW(12289)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104), d) 
doevents 
a = readFile(d, "") 
a = Replace(a, Chr(0), "") 
call whiteWebStat(a) 
End if 
Next 
f = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
call rw(getMsg1(ChrW(26356)&ChrW(26032)&ChrW(20840)&ChrW(37096)&ChrW(32479)&ChrW(35745)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837) & Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46), f)) 
call writeSystemLog("", ChrW(26356)&ChrW(26032)&ChrW(32593)&ChrW(31449)&ChrW(32479)&ChrW(35745))
End function

Function clearWebsiteStat()
Dim a 
call handlePower(ChrW(28165)&ChrW(31354)&ChrW(32593)&ChrW(31449)&ChrW(32479)&ChrW(35745))
conn.Execute(ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)) 
a = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
call rw(getMsg1(ChrW(28165)&ChrW(31354)&ChrW(32593)&ChrW(31449)&ChrW(32479)&ChrW(35745)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837) & Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46), a)) 
call writeSystemLog("", ChrW(28165)&ChrW(31354)&ChrW(32593)&ChrW(31449)&ChrW(32479)&ChrW(35745))
End function

Function updateTodayWebStat()
Dim a, b, c, d 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)) <> "" Then

c = sAddTime(Now(), ChrW(100), CInt(Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)))) 
d = ChrW(26152)&ChrW(22825) 
Else
c = CStr(Now()) 
d = ChrW(20170)&ChrW(22825) 
End if 
call handlePower(ChrW(26356)&ChrW(26032) & d & ChrW(32479)&ChrW(35745))

conn.Execute(ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39) & format_Time(c, 2) & ChrW(39)) 
a = readFile(adminDir & ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(47) & format_Time(c, 2) & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116), "") 
call whiteWebStat(a) 
b = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
call rw(getMsg1(ChrW(26356)&ChrW(26032) & d & ChrW(32479)&ChrW(35745)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837) & Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(46)&ChrW(46), b)) 
call writeSystemLog("", ChrW(26356)&ChrW(26032)&ChrW(32593)&ChrW(31449)&ChrW(32479)&ChrW(35745))
End function

Function whiteWebStat(a)
Dim b, c, d, e 
Dim f, g, h, i, j, k, l, m, n, o, p, q, r 
c = Split(a, vbCrLf & ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45) & vbCrLf) 
e = 0 
For each g In c
If InStr(g, ChrW(24403)&ChrW(21069)&ChrW(65306)) > 0 Then
e = e + 1 
g = vbCrLf & g & vbCrLf 
r = ADSql(getFileAttr(d, ChrW(51))) 
h = ADSql(getStrCut(g, vbCrLf & ChrW(26469)&ChrW(35775), vbCrLf, 0)) 
i = ADSql(getStrCut(g, vbCrLf & ChrW(24403)&ChrW(21069)&ChrW(65306), vbCrLf, 0)) 
j = ADSql(getStrCut(g, vbCrLf & ChrW(26102)&ChrW(38388)&ChrW(65306), vbCrLf, 0)) 
k = ADSql(getStrCut(g, vbCrLf & ChrW(73)&ChrW(80)&ChrW(58), vbCrLf, 0)) 
l = ADSql(getStrCut(g, vbCrLf & ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(58)&ChrW(32), vbCrLf, 0)) 
m = ADSql(getStrCut(g, vbCrLf & ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(61), vbCrLf, 0)) 
n = ADSql(getStrCut(g, vbCrLf & ChrW(67)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115)&ChrW(61), vbCrLf, 0)) 
o = ADSql(getStrCut(g, vbCrLf & ChrW(83)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(61), vbCrLf, 0)) 
p = ADSql(getStrCut(g, vbCrLf & ChrW(29992)&ChrW(25143)&ChrW(20449)&ChrW(24687)&ChrW(61), vbCrLf, 0)) 
l = ADSql(getBrType(p)) 
If InStr(vbCrLf & q & vbCrLf, vbCrLf & k & vbCrLf) = 0 Then
q = q & k & vbCrLf 
End if 
j = Replace(j, ChrW(26469)&ChrW(35775), ChrW(48)&ChrW(48)) 
If IsDate(j) = False Then
j = ChrW(49)&ChrW(57)&ChrW(56)&ChrW(56)&ChrW(47)&ChrW(48)&ChrW(55)&ChrW(47)&ChrW(49)&ChrW(50)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(58)&ChrW(49)&ChrW(48)&ChrW(58)&ChrW(49)&ChrW(48) 
End if 
o = Left(o, 20) 
If 1 = 2 Then
call echo(ChrW(32534)&ChrW(21495), e) 
call echo(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115), r) 
call echo(ChrW(118)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(85)&ChrW(114)&ChrW(108), h) 
call echo(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(85)&ChrW(114)&ChrW(108), i) 
call echo(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101), j) 
call echo(ChrW(73)&ChrW(80), k) 
call echo(ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114), l) 
call echo(ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109), m) 
call echo(ChrW(99)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101), n) 
call echo(ChrW(115)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(119)&ChrW(104), o) 
call echo(ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111), p) 
call hr() 
End if 
conn.Execute(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(32)&ChrW(40)&ChrW(118)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(44)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(44)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(119)&ChrW(104)&ChrW(44)&ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(44)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(105)&ChrW(112)&ChrW(44)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39) & h & ChrW(39)&ChrW(44)&ChrW(39) & i & ChrW(39)&ChrW(44)&ChrW(39) & l & ChrW(39)&ChrW(44)&ChrW(39) & m & ChrW(39)&ChrW(44)&ChrW(39) & o & ChrW(39)&ChrW(44)&ChrW(39) & p & ChrW(39)&ChrW(44)&ChrW(39) & j & ChrW(39)&ChrW(44)&ChrW(39) & k & ChrW(39)&ChrW(44)&ChrW(39) & r & ChrW(39)&ChrW(41)) 
End if 
Next 
End function

Function websiteDetail()
Dim a, b, c 
Dim d, e, f 
Dim g, h, i, j, k 
call handlePower(ChrW(32593)&ChrW(31449)&ChrW(32479)&ChrW(35745)&ChrW(35814)&ChrW(32454))
For i = 1 To 30
j = getHandleDate((i - 1) * - 1)
c = adminDir & ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(47) & j & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116) 
a = readFile(c, "") 
b = Split(a, vbCrLf & ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45) & vbCrLf) 
g = 0 
h = 0 
f = "" 
For each d In b
If InStr(d, ChrW(24403)&ChrW(21069)&ChrW(65306)) > 0 Then
d = vbCrLf & d & vbCrLf 
e = ADSql(getStrCut(d, vbCrLf & ChrW(73)&ChrW(80)&ChrW(58), vbCrLf, 0)) 
h = h + 1 
If InStr(vbCrLf & f & vbCrLf, vbCrLf & e & vbCrLf) = 0 Then
f = f & e & vbCrLf 
g = g + 1 
End if 
End if 
Next 
call echo(j, ChrW(73)&ChrW(80)&ChrW(40) & g & ChrW(41)&ChrW(32)&ChrW(80)&ChrW(86)&ChrW(40) & h & ChrW(41)) 
If i < 4 Then
k = k & j & ChrW(32)&ChrW(73)&ChrW(80)&ChrW(40) & g & ChrW(41)&ChrW(32)&ChrW(80)&ChrW(86)&ChrW(40) & h & ChrW(41) & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62) 
End if 
Next 
call setConfigFileBlock(WEB_CACHEFile, k, ChrW(35)&ChrW(35775)&ChrW(23458)&ChrW(20449)&ChrW(24687)&ChrW(35)) 
call writeSystemLog("", ChrW(35814)&ChrW(32454)&ChrW(32593)&ChrW(31449)&ChrW(32479)&ChrW(35745))
End function

Sub displayLayout()
Dim a, b, c 
b = Request(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) 
c = Request(ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)) 
call handlePower(ChrW(26174)&ChrW(31034) & b)
a = getTemplateContent(Request(ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101))) 
a = Replace(a, ChrW(91)&ChrW(36)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(36)&ChrW(93), b) 
a = replaceValueParam(a, ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101), b) 

If c = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(107)&ChrW(101)&ChrW(82)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) Then
a = Replace(a, ChrW(91)&ChrW(36)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(36)&ChrW(93), readFile(ChrW(47)&ChrW(114)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116), "")) 

ElseIf c = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(77)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) Then
a = replaceValueParam(a, ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121), getAdminMap()) 

ElseIf c = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) Then
a = displayTemplatesList(a) 

ElseIf c = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(77)&ChrW(97)&ChrW(107)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) Then
a = replaceValueParam(a, ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116), getMakeColumnList()) 
End if 
a = handleDisplayLanguage(a, ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(76)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101))
call rw(a) 
End sub

Function getMakeColumnList()
Dim a 


rsx.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99), conn, 1, 1 
While Not rsx.EOF
If CInt(rsx(ChrW(110)&ChrW(111)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119))) = 0 Then
a = a & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34) & rsx(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(62) & rsx(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62) & vbCrLf 
End if 
rsx.MoveNext : Wend : rsx.Close 

getMakeColumnList = a 
End function

Function getAdminMap()
Dim a, b, c, d, e 
If getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) <> ChrW(124)&ChrW(42)&ChrW(124) Then
d = ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(60)&ChrW(62)&ChrW(48)&ChrW(32) 
End if 

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32) & d & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107), conn, 1, 1 
While Not rs.EOF
b = b & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(45)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(117)&ChrW(108)&ChrW(62) & vbCrLf 
b = b & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(62) & rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbCrLf 
e = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100)) & ChrW(32) & d & ChrW(32)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107) 
rsx.Open e, conn, 1, 1 
While Not rsx.EOF
c = phptrim(rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(65)&ChrW(85)&ChrW(114)&ChrW(108))) 
If rsx(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) <> "" Then
c = c & ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61) & rsx(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
End if 
b = b & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & c & ChrW(34)&ChrW(62) & rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbCrLf 
rsx.MoveNext : Wend : rsx.Close 
b = b & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(117)&ChrW(108)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbCrLf 
rs.MoveNext : Wend : rs.Close 

b = replaceLableContent(b) 
getAdminMap = b 
End function

Function getAdminOneMenuList()
Dim a, b, c, d 
If getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) <> ChrW(124)&ChrW(42)&ChrW(124) Then
c = ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(60)&ChrW(62)&ChrW(48)&ChrW(32) 
End if 
d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32) & c & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(60)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107) 

If checksql(d) = False Then
call errorLog(ChrW(20986)&ChrW(38169)&ChrW(25552)&ChrW(31034)&ChrW(54)&ChrW(65306)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(79)&ChrW(110)&ChrW(101)&ChrW(77)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61) & d & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
Exit function 
End if 

rs.Open d, conn, 1, 1 
While Not rs.EOF
b = "" 
If a = "" Then
b = ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(102)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(34) 
End if 
a = a & ChrW(60)&ChrW(108)&ChrW(105) & b & ChrW(62) & rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbCrLf 
rs.MoveNext : Wend : rs.Close 

a = replaceLableContent(a) 
getAdminOneMenuList = a 
End function

Function getAdminMenuList()
Dim a, b, c, d, e, f, g, h, i 
If getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)) <> ChrW(124)&ChrW(42)&ChrW(124) Then
e = ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(60)&ChrW(62)&ChrW(48)&ChrW(32) 
End if 
f = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32) & e & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(60)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107) 

If checksql(f) = False Then
call errorLog(ChrW(20986)&ChrW(38169)&ChrW(25552)&ChrW(31034)&ChrW(55)&ChrW(65306)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(77)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61) & f & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
Exit function 
End if 

rs.Open f, conn, 1, 1 
While Not rs.EOF
d = ChrW(100)&ChrW(105)&ChrW(100)&ChrW(111)&ChrW(102)&ChrW(102) 
If b = "" Then
d = ChrW(100)&ChrW(105)&ChrW(100)&ChrW(111)&ChrW(110) 
End if 
b = b & ChrW(60)&ChrW(117)&ChrW(108)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(110)&ChrW(97)&ChrW(118)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(34)&ChrW(62) & vbCrLf 
b = b & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34) & d & ChrW(34)&ChrW(62) & rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbCrLf 

b = b & ChrW(91)&ChrW(45)&ChrW(95) & rs(ChrW(105)&ChrW(100)) & ChrW(95)&ChrW(45)&ChrW(93) 
If g <> "" Then
g = g & ChrW(124) 
End if 
g = g & rs(ChrW(105)&ChrW(100)) 
b = b & ChrW(60)&ChrW(47)&ChrW(117)&ChrW(108)&ChrW(62) & vbCrLf 
rs.MoveNext : Wend : rs.Close 

h = Split(g, ChrW(124)) 
For each i In h
If i <> "" Then
a = "" 
f = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61) & i & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(60)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(32) & e & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107) 

rsx.Open f, conn, 1, 1 
While Not rsx.EOF
c = phptrim(rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(65)&ChrW(85)&ChrW(114)&ChrW(108))) 
a = a & ChrW(32)&ChrW(60)&ChrW(108)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(34)&ChrW(32)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(61)&ChrW(34)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(49)&ChrW(40)&ChrW(39) & c & ChrW(39)&ChrW(44)&ChrW(39) & rsx(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(39)&ChrW(41)&ChrW(59)&ChrW(34)&ChrW(62) & rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbCrLf 
rsx.MoveNext : Wend : rsx.Close 

b = Replace(b, ChrW(91)&ChrW(45)&ChrW(95) & i & ChrW(95)&ChrW(45)&ChrW(93), a) 
End if 
Next 
b = replaceLableContent(b) 
getAdminMenuList = b 
End function

Function displayTemplatesList(a)
Dim b, c, d, e, f, g, h, i, j, k, l, m 
Dim n 

call loadWebConfig() 
f = getStrCut(a, ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93), ChrW(91)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93), 2) 
n = Split(ChrW(47)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(124)&ChrW(47)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(50)&ChrW(48)&ChrW(49)&ChrW(53)&ChrW(47)&ChrW(124)&ChrW(47)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(50)&ChrW(48)&ChrW(49)&ChrW(54)&ChrW(47), ChrW(124)) 
For each b In n
If b <> "" Then
g = getDirFolderNameList(b) 
h = Split(g, vbCrLf) 
For each e In h
If e <> "" And InStr(ChrW(35)&ChrW(95), Left(e, 1)) = 0 Then
c = b & e 
d = c 
i = f 
k = getStrCut(a, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(21551)&ChrW(29992)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(21551)&ChrW(29992)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(45)&ChrW(62), 2) 
l = getStrCut(a, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(24674)&ChrW(22797)&ChrW(25968)&ChrW(25454)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(24674)&ChrW(22797)&ChrW(25968)&ChrW(25454)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(45)&ChrW(62), 2) 
m = getStrCut(a, ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(21024)&ChrW(38500)&ChrW(27169)&ChrW(26495)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(45)&ChrW(45)&ChrW(62), ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(21024)&ChrW(38500)&ChrW(27169)&ChrW(26495)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(45)&ChrW(62), 2) 
If LCase(cfg_webtemplate) = LCase(c) Then
e = ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(62) & e & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62) 
d = ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(62) & d & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62) 
i = Replace(Replace(i, k, ""), m, "") 
Else
i = Replace(i, l, "") 
End if 
i = replaceValueParam(i, ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101), e) 
i = replaceValueParam(i, ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104), c) 
i = replaceValueParam(i, ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(50), d) 
j = j & i & vbCrLf 
End if 
Next 
End if 
Next 
a = Replace(a, ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93) & f & ChrW(91)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93), j) 
displayTemplatesList = a 
End function

Function isOpenTemplate()
Dim a, b, c, d 
call handlePower(ChrW(21551)&ChrW(29992)&ChrW(27169)&ChrW(26495))
a = Request(ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)) 
b = Request(ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
If getRecordCount(db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101), "") = 0 Then
conn.Execute(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39)&ChrW(27979)&ChrW(35797)&ChrW(39)&ChrW(41)) 
End if 
c = ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(61)&ChrW(39) & a & ChrW(39)&ChrW(44)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(61)&ChrW(39) & a & ChrW(47)&ChrW(73)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(39) 
c = c & ChrW(44)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39) & a & ChrW(47)&ChrW(67)&ChrW(115)&ChrW(115)&ChrW(39)&ChrW(44)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(106)&ChrW(115)&ChrW(61)&ChrW(39) & a & ChrW(47)&ChrW(74)&ChrW(115)&ChrW(39) 
conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32) & c) 
d = ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(38)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(27169)&ChrW(26495) 
call rw(getMsg1(ChrW(21551)&ChrW(29992)&ChrW(27169)&ChrW(26495)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837)&ChrW(27169)&ChrW(26495)&ChrW(30028)&ChrW(38754)&ChrW(46)&ChrW(46)&ChrW(46), d)) 
call writeSystemLog("", ChrW(24212)&ChrW(29992)&ChrW(27169)&ChrW(26495) & a)
End function

Function delTemplate()
Dim a, b, c 
a = Replace(Request(ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(68)&ChrW(105)&ChrW(114)), ChrW(92), ChrW(47)) 
call handlePower(ChrW(21024)&ChrW(38500)&ChrW(27169)&ChrW(26495))
b = Mid(a, 1, InStrRev(a, ChrW(47))) & ChrW(35) & Mid(a, InStrRev(a, ChrW(47)) + 1) & ChrW(95) & format_Time(Now(), 11) 

call moveFolder(a, b) 
c = ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(38)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(27169)&ChrW(26495) 
call rw(getMsg1(ChrW(21024)&ChrW(38500)&ChrW(27169)&ChrW(26495)&ChrW(23436)&ChrW(25104)&ChrW(65292)&ChrW(27491)&ChrW(22312)&ChrW(36827)&ChrW(20837)&ChrW(27169)&ChrW(26495)&ChrW(30028)&ChrW(38754)&ChrW(46)&ChrW(46)&ChrW(46), c)) 
End function

Function executeSQL()
Dim a 
a = ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(87)&ChrW(101)&ChrW(98)&ChrW(83)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(116) 
If Request(ChrW(115)&ChrW(113)&ChrW(108)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)) <> "" Then
a = Request(ChrW(115)&ChrW(113)&ChrW(108)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)) 
call openconn() 

If checksql(a) = False Then
call errorLog(ChrW(20986)&ChrW(38169)&ChrW(25552)&ChrW(31034)&ChrW(56)&ChrW(65306)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61) & a & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
Exit function 
End if 
call echo(ChrW(25191)&ChrW(34892)&ChrW(83)&ChrW(81)&ChrW(76)&ChrW(35821)&ChrW(21477)&ChrW(25104)&ChrW(21151), a) 
End if 
If getsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) = ChrW(80)&ChrW(65)&ChrW(65)&ChrW(74)&ChrW(67)&ChrW(77)&ChrW(83) Then
call rw(ChrW(60)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(49)&ChrW(34)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(49)&ChrW(34)&ChrW(32)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(34)&ChrW(32)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&ChrW(34)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(101)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(83)&ChrW(81)&ChrW(76)&ChrW(34)&ChrW(32)&ChrW(32)&ChrW(111)&ChrW(110)&ChrW(83)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(105)&ChrW(102)&ChrW(40)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(114)&ChrW(109)&ChrW(40)&ChrW(39)&ChrW(20320)&ChrW(30830)&ChrW(23450)&ChrW(35201)&ChrW(25805)&ChrW(20316)&ChrW(21527)&ChrW(65311)&ChrW(92)&ChrW(110)&ChrW(25805)&ChrW(20316)&ChrW(21518)&ChrW(23558)&ChrW(19981)&ChrW(21487)&ChrW(24674)&ChrW(22797)&ChrW(39)&ChrW(41)&ChrW(41)&ChrW(123)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(125)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(123)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(125)&ChrW(34)&ChrW(62)&ChrW(83)&ChrW(81)&ChrW(76)&ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(34)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34) & a & ChrW(34)&ChrW(32)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(56)&ChrW(48)&ChrW(37)&ChrW(34)&ChrW(32)&ChrW(47)&ChrW(62)&ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(34)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(25191)&ChrW(34892)&ChrW(34)&ChrW(32)&ChrW(47)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(62)) 
Else
call rw(ChrW(20320)&ChrW(27809)&ChrW(26377)&ChrW(26435)&ChrW(38480)&ChrW(25191)&ChrW(34892)&ChrW(83)&ChrW(81)&ChrW(76)&ChrW(35821)&ChrW(21477)) 
End if 
End function  
%> 