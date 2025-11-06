<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<%
call showCheckAdminRule(ChrW(29983)&ChrW(25104)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108))
dim genXml, genHtml, msg, resultLinks,isDebug,isFirstVisit
isDebug=false
msg = ""
resultLinks = ""

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) then

genXml = request(ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(120)&ChrW(109)&ChrW(108))
genHtml = request(ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))

if genXml = "" then
session(ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(120)&ChrW(109)&ChrW(108)) = ""
else
session(ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(120)&ChrW(109)&ChrW(108)) = genXml
end if
if genHtml = "" then
session(ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)) = ""
else
session(ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)) = genHtml
end if
else

if request(ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(120)&ChrW(109)&ChrW(108)) <> "" or request(ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)) <> "" then

genXml = request(ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(120)&ChrW(109)&ChrW(108))
genHtml = request(ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
else

if isempty(session(ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(120)&ChrW(109)&ChrW(108))) then
genXml = ""
else
genXml = session(ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(120)&ChrW(109)&ChrW(108))
end if
if isempty(session(ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))) then
genHtml = ""
else
genHtml = session(ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
end if
end if
end if

dim hasSessionXml, hasSessionHtml
hasSessionXml = not isempty(session(ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(120)&ChrW(109)&ChrW(108)))
hasSessionHtml = not isempty(session(ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)))
isFirstVisit = (genXml = "" and genHtml = "" and request(ChrW(97)&ChrW(99)&ChrW(116)) <> ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) and not hasSessionXml and not hasSessionHtml)
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) then
msg = ""
resultLinks = ""

if genXml <> ChrW(111)&ChrW(110) and genHtml <> ChrW(111)&ChrW(110) then
msg = ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(110)&ChrW(109)&ChrW(39)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(52)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(102)&ChrW(102)&ChrW(53)&ChrW(55)&ChrW(50)&ChrW(50)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(50)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(99)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(45)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(108)&ChrW(39)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(102)&ChrW(102)&ChrW(53)&ChrW(55)&ChrW(50)&ChrW(50)&ChrW(59)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(56)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)&ChrW(32)&ChrW(60)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(110)&ChrW(103)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(102)&ChrW(102)&ChrW(53)&ChrW(55)&ChrW(50)&ChrW(50)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(24744)&ChrW(36824)&ChrW(27809)&ChrW(26377)&ChrW(36873)&ChrW(25321)&ChrW(20219)&ChrW(20309)&ChrW(29983)&ChrW(25104)&ChrW(31867)&ChrW(22411)&ChrW(65281)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(110)&ChrW(103)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(35831)&ChrW(33267)&ChrW(23569)&ChrW(36873)&ChrW(25321)&ChrW(19968)&ChrW(20010)&ChrW(36873)&ChrW(39033)&ChrW(65288)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(49)&ChrW(69)&ChrW(57)&ChrW(70)&ChrW(70)&ChrW(70)&ChrW(59)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(53)&ChrW(48)&ChrW(48)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(29983)&ChrW(25104)&ChrW(32)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(32)&ChrW(25110)&ChrW(32)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(49)&ChrW(69)&ChrW(57)&ChrW(70)&ChrW(70)&ChrW(70)&ChrW(59)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(53)&ChrW(48)&ChrW(48)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(29983)&ChrW(25104)&ChrW(32)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(65289)&ChrW(25165)&ChrW(33021)&ChrW(29983)&ChrW(25104)&ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)&ChrW(12290)&ChrW(24744)&ChrW(21487)&ChrW(20197)&ChrW(21516)&ChrW(26102)&ChrW(36873)&ChrW(25321)&ChrW(20004)&ChrW(20010)&ChrW(36873)&ChrW(39033)&ChrW(26469)&ChrW(29983)&ChrW(25104)&ChrW(20004)&ChrW(31181)&ChrW(26684)&ChrW(24335)&ChrW(12290)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62)
else
dim successCount
successCount = 0

if genXml = ChrW(111)&ChrW(110) then
call getSiteMapXML()
successCount = successCount + 1
resultLinks = resultLinks & ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(115)&ChrW(109)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)&ChrW(32)&ChrW(26597)&ChrW(30475)&ChrW(32)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)
end if

if genHtml = ChrW(111)&ChrW(110) then
call getSiteMapHTML()
successCount = successCount + 1
resultLinks = resultLinks & ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(115)&ChrW(109)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)&ChrW(32)&ChrW(26597)&ChrW(30475)&ChrW(32)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)
end if
if successCount > 0 then
msg = ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(110)&ChrW(109)&ChrW(39)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(52)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(53)&ChrW(70)&ChrW(66)&ChrW(56)&ChrW(55)&ChrW(56)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(111)&ChrW(107)&ChrW(39)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(53)&ChrW(70)&ChrW(66)&ChrW(56)&ChrW(55)&ChrW(56)&ChrW(59)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)&ChrW(32)&ChrW(29983)&ChrW(25104)&ChrW(25104)&ChrW(21151)&ChrW(65281)&ChrW(20849)&ChrW(29983)&ChrW(25104)&ChrW(32) & successCount & ChrW(32)&ChrW(20010)&ChrW(25991)&ChrW(20214)&ChrW(65292)&ChrW(26102)&ChrW(38388)&ChrW(65306) & format_Time(now(),1) & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(39)&ChrW(62) & resultLinks & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62)
end if
end if
end if
function handleWebUrl(a)
if a=ChrW(47)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112) then a=ChrW(47)
if left(a,1) <>ChrW(47) then a=ChrW(47) & a
handleWebUrl=webDoMain() & a
end function







function getSiteMapXML()
call openconn()
dim a
a=ChrW(60)&ChrW(63)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(32)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&ChrW(39)&ChrW(49)&ChrW(46)&ChrW(48)&ChrW(39)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(61)&ChrW(39)&ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56)&ChrW(39)&ChrW(63)&ChrW(62) & vbcrlf
a=a&ChrW(60)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(110)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(115)&ChrW(46)&ChrW(111)&ChrW(114)&ChrW(103)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(115)&ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(47)&ChrW(48)&ChrW(46)&ChrW(57)&ChrW(34)&ChrW(62)&vbcrlf









a=a&getNavToSiteMap(ChrW(42))
a=a&getArticleSiteMap(ChrW(42))
a=a & ChrW(60)&ChrW(47)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(62)
call writetofile(ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108),a,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
getSiteMapXML=a
end function

function getNavToSiteMap(a)  
dim b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x 
if a <>"" then
p=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(61)&ChrW(49)
if a <>ChrW(42) then
p=p & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&a&ChrW(41)
end if
dim y:Set y = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
y.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not y.eof then
u=y(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)) 
if isDebug then call echo(ChrW(38656)&ChrW(35201)&ChrW(29983)&ChrW(25104)&ChrW(30340)&ChrW(29256)&ChrW(26412)&ChrW(26377),y(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)))
t=split(y(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))&ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124),ChrW(124))
s=t(1)
if isDebug then call echo(ChrW(40664)&ChrW(35748)&ChrW(35821)&ChrW(35328)&ChrW(20026),s)
end if:y.close

p=p&ChrW(32)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(66)&ChrW(89)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
o=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&p
if isDebug then call echo(ChrW(115)&ChrW(113)&ChrW(108),o):doevents 
y.open o,conn,1,1
v=y.recordcount
if v>9999 then v=9999
for m=1 to v
if y.eof then exit for      
if isDebug then call echoBlueB(ChrW(22788)&ChrW(29702)&ChrW(23548)&ChrW(34892)&ChrW(105)&ChrW(100)&ChrW(61)&y(ChrW(105)&ChrW(100)),m&ChrW(47)&v)
d=true
if phptrim(y(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))) <>"" then
d=false
end if
f=y(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
if f=ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116) then f=ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)
if phptrim(y(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) <>"" then
c=ChrW(47)&phptrim(y(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
elseif f=ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101) then
c=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
else
c=ChrW(47)&f & ChrW(95) & y(ChrW(105)&ChrW(100)) &  ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
end if 
if d then

dim z
if f=ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101) then
z=ChrW(49)&ChrW(46)&ChrW(48)
else
z=ChrW(48)&ChrW(46)&ChrW(57)
end if
if instr(u,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),c,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),z)
if isDebug then call echo(ChrW(99)&ChrW(110),b)
end if                
if instr(u,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then      
b=getWebUrl(ChrW(101)&ChrW(110),c,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),z)
if isDebug then call echo(ChrW(101)&ChrW(110),b)
end if    
if instr(u,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then  
b=getWebUrl(ChrW(102)&ChrW(116),c,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),z)
if isDebug then call echo(ChrW(102)&ChrW(116),b)
end if

if instr(ChrW(124)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(116)&ChrW(124)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(124)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(111)&ChrW(124)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(124)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(124),ChrW(124)&f&ChrW(124))>0 then
a=getColumAllID20251015(y(ChrW(105)&ChrW(100)))
if a <>"" then a=a+ChrW(44)
a=a & y(ChrW(105)&ChrW(100))
p=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)& a &ChrW(41)
o=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&p
rsx.open o ,conn,1,1
l=IIF(isnull(rsx(ChrW(99)&ChrW(116)))=true,0,rsx(ChrW(99)&ChrW(116))):rsx.close
k=calculateTotalPages(l,y(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)))
if isDebug then call echo(ChrW(115)&ChrW(113)&ChrW(108),o)
if isDebug then call echo(ChrW(26465)&ChrW(25968),l)
if isDebug then call echo(ChrW(27599)&ChrW(39029)&ChrW(26174)&ChrW(31034),y(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)))
if isDebug then call echo(ChrW(39029)&ChrW(25968)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115),k)
if k>1 then
for w=2 to k
r=instrrev(c,ChrW(46))
q=mid(c,1,r-1) & ChrW(95)&w&mid(c,r)
if isDebug then call echo(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101),q) 
if instr(u,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),q,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(55))
if isDebug then call echo(ChrW(32763)&ChrW(39029)&ChrW(99)&ChrW(110),b)
doevents
end if
if instr(u,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then  
b=getWebUrl(ChrW(101)&ChrW(110),q,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(55))
if isDebug then call echo(ChrW(32763)&ChrW(39029)&ChrW(101)&ChrW(110),b)
doevents
end if
if instr(u,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then  
b=getWebUrl(ChrW(102)&ChrW(116),q,s)
x=x & getSitemapC(b,y(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(55))
if isDebug then call echo(ChrW(32763)&ChrW(39029)&ChrW(102)&ChrW(116),b)
doevents
end if
next
end if
doevents
end if
end if 
y.movenext:next:y.close
end if 
getNavToSiteMap=x
end function

function getArticleSiteMap(a)  
dim b,c,d,e,f,g,h,i,j,k,l,m,n
if a <>"" then
g=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(61)&ChrW(49)
if a <>ChrW(42) then
g=g & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&a&ChrW(41)
end if
dim o:Set o = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
o.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not o.eof then 
l=o(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)) 
if isDebug then call echo(ChrW(38656)&ChrW(35201)&ChrW(29983)&ChrW(25104)&ChrW(30340)&ChrW(29256)&ChrW(26412)&ChrW(26377),o(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)))
k=split(o(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))&ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124),ChrW(124))
j=k(1)
if isDebug then call echo(ChrW(40664)&ChrW(35748)&ChrW(35821)&ChrW(35328)&ChrW(20026),j)
end if:o.close

g=g&ChrW(32)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(66)&ChrW(89)&ChrW(32)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(69)&ChrW(83)&ChrW(67)
f=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&g
if isDebug then call echo(ChrW(115)&ChrW(113)&ChrW(108),f):doevents
o.open f,conn,1,1
m=o.recordcount
if m>9999 then m=9999
for d=1 to m
if o.eof then exit for           
if isDebug then call echoBlueB(ChrW(29983)&ChrW(25104)&ChrW(25991)&ChrW(31456),d&ChrW(47)&m)
if phptrim(o(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) <>"" then
c=ChrW(47)&phptrim(o(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) 
else
c=ChrW(47)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(95) & o(ChrW(105)&ChrW(100)) &  ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
end if
if o(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) then

if instr(l,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),c,j)
n=n & getSitemapC(b,o(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(56))
if isDebug then call echo(ChrW(25991)&ChrW(31456)&ChrW(99)&ChrW(110),b)
end if                
if instr(l,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then      
b=getWebUrl(ChrW(101)&ChrW(110),c,j)
n=n & getSitemapC(b,o(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(56))
if isDebug then call echo(ChrW(25991)&ChrW(31456)&ChrW(101)&ChrW(110),b)
end if    
if instr(l,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then  
b=getWebUrl(ChrW(102)&ChrW(116),c,j)
n=n & getSitemapC(b,o(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),ChrW(48)&ChrW(46)&ChrW(56))
if isDebug then call echo(ChrW(25991)&ChrW(31456)&ChrW(102)&ChrW(116),b)
end if
end if
o.movenext:next:o.close
end if
getArticleSiteMap=n
end function
function getSitemapC(a,b,c)
dim d,e

if isDate(b) then
e=format_Time(b,2)
else
e=format_Time(now(),2)
end if

if c="" or not isnumeric(c) then c=ChrW(48)&ChrW(46)&ChrW(56)
d=d & vbtab & ChrW(60)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(62)&vbcrlf
d=d & copystr(vbtab,2) & ChrW(60)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(62)&ChrW(60)&ChrW(33)&ChrW(91)&ChrW(67)&ChrW(68)&ChrW(65)&ChrW(84)&ChrW(65)&ChrW(91) & phptrim(a) &ChrW(93)&ChrW(93)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(62) & vbcrlf
d=d & copystr(vbtab,2) & ChrW(60)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(100)&ChrW(62)&e&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(100)&ChrW(62) & vbcrlf
d=d & copystr(vbtab,2) & ChrW(60)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(62)&ChrW(119)&ChrW(101)&ChrW(101)&ChrW(107)&ChrW(108)&ChrW(121)&ChrW(60)&ChrW(47)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(62) & vbcrlf
d=d & copystr(vbtab,2) & ChrW(60)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(111)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(62)&c&ChrW(60)&ChrW(47)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(111)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(62) & vbcrlf
d=d & vbtab & ChrW(60)&ChrW(47)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(62)&vbcrlf
getSitemapC=d
end function

function getWebUrl(a,b,c)
dim d
if a <>c then
call createFolder(ChrW(47)&a&ChrW(47))
d=ChrW(47) & a & b
else
d= b
end if
getWebUrl=webDoMain() & d
end function

function getColumAllID20251015(a)
if a="" then getColumAllID20251015="": exit function
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
while not b.eof 
if c <>"" then c=c & ChrW(44)
c=c & b(ChrW(105)&ChrW(100))
d=getColumAllID20251015(b(ChrW(105)&ChrW(100)))
if d <>"" then
c=c & ChrW(44) & d
end if
b.movenext:wend:b.close
getColumAllID20251015=c
end function

Function calculateTotalPages(a, b)
If b <= 0 Then
calculateTotalPages = 0
Exit function
End if
If a <= 0 Then
calculateTotalPages = 0
Exit function
End if

calculateTotalPages = Int((a - 1) / b) + 1
End function

function getSiteMapHTML()
call openconn()
dim a,b,c
c=webDoMain()

dim d:Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
d.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not d.eof then
b=phptrim(d(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
if b="" then b=ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)
else
b=ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)
end if
d.close

a=ChrW(60)&ChrW(33)&ChrW(68)&ChrW(79)&ChrW(67)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(32)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(61)&ChrW(34)&ChrW(122)&ChrW(104)&ChrW(45)&ChrW(67)&ChrW(78)&ChrW(34)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56)&ChrW(34)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(61)&ChrW(100)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(45)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(44)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(45)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(49)&ChrW(46)&ChrW(48)&ChrW(34)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(114)&ChrW(111)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(115)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(44)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(34)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(62) & server.HTMLEncode(b) & ChrW(32)&ChrW(45)&ChrW(32)&ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(62) & vbcrlf
a=a & vbtab & vbtab & ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(102)&ChrW(97)&ChrW(109)&ChrW(105)&ChrW(108)&ChrW(121)&ChrW(58)&ChrW(32)&ChrW(65)&ChrW(114)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(32)&ChrW(89)&ChrW(97)&ChrW(72)&ChrW(101)&ChrW(105)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(115)&ChrW(97)&ChrW(110)&ChrW(115)&ChrW(45)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(102)&ChrW(59)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(46)&ChrW(54)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(32)&ChrW(50)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(102)&ChrW(53)&ChrW(102)&ChrW(53)&ChrW(102)&ChrW(53)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(102)&ChrW(102)&ChrW(102)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(32)&ChrW(51)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(117)&ChrW(115)&ChrW(58)&ChrW(32)&ChrW(56)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(45)&ChrW(115)&ChrW(104)&ChrW(97)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(58)&ChrW(32)&ChrW(48)&ChrW(32)&ChrW(50)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(114)&ChrW(103)&ChrW(98)&ChrW(97)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(48)&ChrW(44)&ChrW(48)&ChrW(44)&ChrW(48)&ChrW(46)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(104)&ChrW(49)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(51)&ChrW(51)&ChrW(51)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(51)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(48)&ChrW(48)&ChrW(55)&ChrW(98)&ChrW(102)&ChrW(102)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(51)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(104)&ChrW(50)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(53)&ChrW(53)&ChrW(53)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(58)&ChrW(32)&ChrW(51)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(52)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(48)&ChrW(48)&ChrW(55)&ChrW(98)&ChrW(102)&ChrW(102)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(45)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(52)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(32)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(32)&ChrW(56)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(101)&ChrW(101)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(58)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(99)&ChrW(104)&ChrW(105)&ChrW(108)&ChrW(100)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(97)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(48)&ChrW(48)&ChrW(55)&ChrW(98)&ChrW(102)&ChrW(102)&ChrW(59)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(45)&ChrW(100)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(48)&ChrW(46)&ChrW(51)&ChrW(115)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(97)&ChrW(58)&ChrW(104)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(48)&ChrW(48)&ChrW(53)&ChrW(54)&ChrW(98)&ChrW(51)&ChrW(59)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(45)&ChrW(100)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(46)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(59)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(50)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(45)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(50)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(59)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(32)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(102)&ChrW(48)&ChrW(102)&ChrW(48)&ChrW(102)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(117)&ChrW(115)&ChrW(58)&ChrW(32)&ChrW(52)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & vbtab & ChrW(46)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(45)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(58)&ChrW(32)&ChrW(52)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(45)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(58)&ChrW(32)&ChrW(50)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(101)&ChrW(101)&ChrW(101)&ChrW(59)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(59)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(50)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(125) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(47)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(62) & vbcrlf
a=a & vbtab & vbtab & ChrW(60)&ChrW(104)&ChrW(49)&ChrW(62)&ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)&ChrW(32)&ChrW(45)&ChrW(32) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(104)&ChrW(49)&ChrW(62) & vbcrlf
a=a & vbtab & vbtab & ChrW(60)&ChrW(112)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(59)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(51)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(34)&ChrW(62)&ChrW(26368)&ChrW(21518)&ChrW(26356)&ChrW(26032)&ChrW(65306) & format_Time(now(),1) & ChrW(32)&ChrW(124)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34)&ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62)&ChrW(26597)&ChrW(30475)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(26684)&ChrW(24335)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(112)&ChrW(62) & vbcrlf

a=a & getNavToSiteMapHTML(ChrW(42))

a=a & getArticleSiteMapHTML(ChrW(42))
a=a & vbtab & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(62) & vbcrlf
a=a & vbtab & vbtab & vbtab & ChrW(60)&ChrW(112)&ChrW(62)&ChrW(169)&ChrW(32) & year(now()) & ChrW(32) & server.HTMLEncode(b) & ChrW(32)&ChrW(124)&ChrW(32)&ChrW(32593)&ChrW(31449)&ChrW(22320)&ChrW(22270)&ChrW(33258)&ChrW(21160)&ChrW(29983)&ChrW(25104)&ChrW(60)&ChrW(47)&ChrW(112)&ChrW(62) & vbcrlf
a=a & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
a=a & vbtab & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbcrlf
a=a & ChrW(60)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(62) & vbcrlf
call writetofile(ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108),a,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
getSiteMapHTML=a
end function

function getNavToSiteMapHTML(a)
dim b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t
k=""
if a <>"" then
m=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(61)&ChrW(49)
if a <>ChrW(42) then
m=m & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&a&ChrW(41)
end if
Set l = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
l.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not l.eof then
h=l(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))
g=split(h&ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124),ChrW(124))
f=g(1)
end if
l.close
m=m&ChrW(32)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(66)&ChrW(89)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
n=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&m
l.open n,conn,1,1
i=l.recordcount
if i>9999 then i=9999
k=k & vbtab & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(45)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(62) & vbcrlf
k=k & vbtab & vbtab & vbtab & ChrW(60)&ChrW(104)&ChrW(50)&ChrW(62)&ChrW(23548)&ChrW(33322)&ChrW(39029)&ChrW(38754)&ChrW(60)&ChrW(47)&ChrW(104)&ChrW(50)&ChrW(62) & vbcrlf
for j=1 to i
if l.eof then exit for
d=true
if phptrim(l(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))) <>"" then
d=false
end if
e=l(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
if e=ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116) then e=ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)
if phptrim(l(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) <>"" then
c=ChrW(47)&phptrim(l(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
elseif e=ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101) then
c=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
else
c=ChrW(47)&e & ChrW(95) & l(ChrW(105)&ChrW(100)) &  ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
end if
if d then
k=k & vbtab & vbtab & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(45)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(34)&ChrW(62) & vbcrlf
k=k & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(62) & server.HTMLEncode(l(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
k=k & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(117)&ChrW(108)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(34)&ChrW(62) & vbcrlf
if instr(h,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),c,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(h,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(101)&ChrW(110),c,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(h,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then
b=getWebUrl(ChrW(102)&ChrW(116),c,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if

if instr(ChrW(124)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(116)&ChrW(124)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(124)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(111)&ChrW(124)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(124)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(124),ChrW(124)&e&ChrW(124))>0 then
t=getColumAllID20251015(l(ChrW(105)&ChrW(100)))
if t <>"" then t=t+ChrW(44)
t=t & l(ChrW(105)&ChrW(100))
m=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)& t &ChrW(41)
n=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&m
Set rsx = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
rsx.open n ,conn,1,1
p=IIF(isnull(rsx(ChrW(99)&ChrW(116)))=true,0,rsx(ChrW(99)&ChrW(116))):rsx.close
o=calculateTotalPages(p,l(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)))
if o>1 then
for s=2 to o
r=instrrev(c,ChrW(46))
q=mid(c,1,r-1) & ChrW(95)&s&mid(c,r)
if instr(h,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),q,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(h,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(101)&ChrW(110),q,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(h,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then
b=getWebUrl(ChrW(102)&ChrW(116),q,f)
k=k & vbtab & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(l(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
next
end if
end if
k=k & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(117)&ChrW(108)&ChrW(62) & vbcrlf
k=k & vbtab & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
end if
l.movenext:next:l.close
k=k & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
end if
getNavToSiteMapHTML=k
end function

function getArticleSiteMapHTML(a)
dim b,c,d,e,f,g,h,i,j,k,l,m
i=""
if a <>"" then
l=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(61)&ChrW(49)
if a <>ChrW(42) then
l=l & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&a&ChrW(41)
end if
Set j = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
j.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not j.eof then
f=j(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))
e=split(f&ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124),ChrW(124))
d=e(1)
end if
j.close
l=l&ChrW(32)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(66)&ChrW(89)&ChrW(32)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(69)&ChrW(83)&ChrW(67)
m=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&l
j.open m,conn,1,1
g=j.recordcount
if g>9999 then g=9999

k=0
if g>500 then g=500
i=i & vbtab & vbtab & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(45)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(62) & vbcrlf
i=i & vbtab & vbtab & vbtab & ChrW(60)&ChrW(104)&ChrW(50)&ChrW(62)&ChrW(25991)&ChrW(31456)&ChrW(20869)&ChrW(23481)&ChrW(32)&ChrW(40) & g & ChrW(32)&ChrW(26465)&ChrW(26368)&ChrW(26032)&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(104)&ChrW(50)&ChrW(62) & vbcrlf
i=i & vbtab & vbtab & vbtab & ChrW(60)&ChrW(117)&ChrW(108)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(34)&ChrW(62) & vbcrlf
for h=1 to g
if j.eof then exit for
if j(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) then
if phptrim(j(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) <>"" then
c=ChrW(47)&phptrim(j(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
else
c=ChrW(47)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(95) & j(ChrW(105)&ChrW(100)) &  ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
end if
if instr(f,ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(99)&ChrW(110),c,d)
i=i & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(j(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) & ChrW(32)&ChrW(45)&ChrW(32) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(j(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(f,ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124))>0 then
b=getWebUrl(ChrW(101)&ChrW(110),c,d)
i=i & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(j(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) & ChrW(32)&ChrW(45)&ChrW(32) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(j(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
if instr(f,ChrW(124)&ChrW(102)&ChrW(116)&ChrW(124))>0 then
b=getWebUrl(ChrW(102)&ChrW(116),c,d)
i=i & vbtab & vbtab & vbtab & vbtab & ChrW(60)&ChrW(108)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34) & b & ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(62) & server.HTMLEncode(j(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) & ChrW(32)&ChrW(45)&ChrW(32) & server.HTMLEncode(b) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(62) & format_Time(j(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(62) & vbcrlf
end if
k=k+1
end if
j.movenext:next:j.close
i=i & vbtab & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(117)&ChrW(108)&ChrW(62) & vbcrlf
i=i & vbtab & vbtab & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
end if
getArticleSiteMapHTML=i
end function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>生成网站地图</title>
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
<link href="../../css/nprogress.min.css" rel="stylesheet" />
<script src="../../js/nprogress.min.js"></script>
<style>
.sitemap-container {
padding: 20px;
max-width: 900px;
margin: 0 auto;
}
.sitemap-card {
background: #fff;
border-radius: 8px;
box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
padding: 30px;
margin-bottom: 20px;
}
.sitemap-title {
font-size: 24px;
font-weight: 500;
color: #333;
margin-bottom: 10px;
padding-bottom: 15px;
border-bottom: 2px solid #1E9FFF;
}
.sitemap-desc {
color: #666;
line-height: 1.8;
margin-bottom: 30px;
font-size: 14px;
}
.sitemap-options {
margin: 30px 0;
}
.sitemap-option-item {
padding: 20px;
margin-bottom: 15px;
border: 2px solid #e6e6e6;
border-radius: 6px;
transition: all 0.3s;
cursor: pointer;
background: #fafafa;
}
.sitemap-option-item:hover {
border-color: #1E9FFF;
background: #f0f8ff;
}
.sitemap-option-item.active {
border-color: #1E9FFF;
background: #e8f4ff;
}
.sitemap-option-item input[type="checkbox"] {
margin-right: 10px;
cursor: pointer;
}
.sitemap-option-label {
font-size: 16px;
font-weight: 500;
color: #333;
cursor: pointer;
display: flex;
align-items: center;
user-select: none;
}
.sitemap-option-desc {
font-size: 13px;
color: #999;
margin-top: 8px;
margin-left: 28px;
line-height: 1.6;
}
.sitemap-icon {
font-size: 24px;
color: #1E9FFF;
margin-right: 12px;
}
.sitemap-submit-btn {
width: 100%;
height: 50px;
font-size: 16px;
margin-top: 20px;
}
.sitemap-info-box {
background: #f8f9fa;
border-left: 4px solid #1E9FFF;
padding: 15px;
margin-top: 20px;
border-radius: 4px;
}
.sitemap-info-box .layui-icon {
font-size: 16px;
margin-right: 8px;
}
@keyframes shake {
0%, 100% { transform: translateX(0); }
10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
20%, 40%, 60%, 80% { transform: translateX(5px); }
}
.sitemap-option-item.error-highlight {
border-color: #ff5722 !important;
background-color: #fff5f5 !important;
animation: shake 0.5s;
}
</style>
</head>
<body style="background: #f2f2f2;">
<div class="sitemap-container">
<div class="sitemap-card">
<h1 class="sitemap-title">
<i class="layui-icon layui-icon-location" style="color: #1E9FFF;"></i> 网站地图生成器
</h1>
<div class="sitemap-desc">
网站地图可以帮助搜索引擎更好地抓取和索引您的网站内容。您可以选择生成 XML 格式（供搜索引擎使用）或 HTML 格式（供用户浏览），也可以同时生成两种格式。
</div>
<%if msg <>"" then call rw(msg)%>
<form id="sitemapForm" name="sitemapForm" class="layui-form" method="post" action="?act=submit">
<div class="sitemap-options">
<div class="sitemap-option-item<% if genXml = ChrW(111)&ChrW(110) or isFirstVisit then response.write ChrW(32)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(118)&ChrW(101)%>" id="option_xml">
<label class="sitemap-option-label" for="gen_xml">
<input type="checkbox" name="gen_xml" id="gen_xml" value="on" lay-skin="primary" title="生成 sitemap.xml"<% if genXml = ChrW(111)&ChrW(110) or isFirstVisit then response.write ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)%>>
<span class="sitemap-icon"><i class="layui-icon layui-icon-file"></i></span>
<span>生成 sitemap.xml</span>
</label>
<div class="sitemap-option-desc">
XML 格式的网站地图，符合搜索引擎标准，用于提交给 Google、Bing 等搜索引擎，帮助提高网站收录率。
</div>
</div>
<div class="sitemap-option-item<% if genHtml = ChrW(111)&ChrW(110) or isFirstVisit then response.write ChrW(32)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(118)&ChrW(101)%>" id="option_html">
<label class="sitemap-option-label" for="gen_html">
<input type="checkbox" name="gen_html" id="gen_html" value="on" lay-skin="primary" title="生成 sitemap.html"<% if genHtml = ChrW(111)&ChrW(110) or isFirstVisit then response.write ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)%>>
<span class="sitemap-icon"><i class="layui-icon layui-icon-file"></i></span>
<span>生成 sitemap.html</span>
</label>
<div class="sitemap-option-desc">
HTML 格式的网站地图，用户友好的可视化页面，方便访客浏览网站结构，提升用户体验。
</div>
</div>
</div>
<div class="sitemap-info-box">
<i class="layui-icon layui-icon-tips"></i>
<strong>提示：</strong>生成过程可能需要一些时间，请耐心等待。建议定期更新网站地图以保持内容同步。
</div>
<button type="submit" class="layui-btn layui-btn-lg layui-btn-normal sitemap-submit-btn">
<i class="layui-icon layui-icon-play"></i> 开始生成
</button>
</form>
</div>
</div>
<script>
layui.use(['form', 'layer'], function(){
var form = layui.form;
var layer = layui.layer;
// 初始化表单
form.render();
// 延迟初始化，确保 Layui 渲染完成
setTimeout(function() {
// 同步所有复选框的初始状态（根据服务器端设置的值）
$('#gen_xml, #gen_html').each(function() {
var checkbox = this;
// 确保 Layui 样式与原生复选框状态一致
if (checkbox.checked) {
$(checkbox).next('.layui-form-checkbox').addClass('layui-form-checked');
} else {
$(checkbox).next('.layui-form-checkbox').removeClass('layui-form-checked');
}
// 同步选项卡片样式
syncCheckboxState(checkbox);
});
}, 150);
// 更新选项样式
function updateOptionStyle(item, checked) {
if (checked) {
item.addClass('active');
} else {
item.removeClass('active');
}
}
// 同步复选框状态（原生复选框和 Layui 样式）
function syncCheckboxState(checkbox) {
if (!checkbox) return;
var $checkbox = $(checkbox);
var layuiCheckbox = $checkbox.next('.layui-form-checkbox');
// 同步 Layui 样式
if (checkbox.checked) {
layuiCheckbox.addClass('layui-form-checked');
} else {
layuiCheckbox.removeClass('layui-form-checked');
}
// 更新选项样式
var item = $checkbox.closest('.sitemap-option-item');
updateOptionStyle(item, checkbox.checked);
}
// 监听复选框变化（Layui 的 checkbox 事件）
form.on('checkbox', function(data){
var checkbox = data.elem;
var item = $(checkbox).closest('.sitemap-option-item');
// 确保原生复选框状态与 Layui 事件数据同步
if (checkbox) {
checkbox.checked = data.elem.checked;
}
// 更新样式
updateOptionStyle(item, checkbox.checked);
});
// 防止重复点击的标记
var isProcessing = false;
// 使用事件委托处理点击事件，避免冲突
$(document).on('click', '.sitemap-option-item', function(e){
// 如果正在处理中，忽略点击
if (isProcessing) {
e.preventDefault();
e.stopPropagation();
return false;
}
// 如果点击的是复选框本身，不处理（让浏览器和 Layui 处理）
if ($(e.target).is('input[type="checkbox"]')) {
return;
}
// 如果点击的是 label 内的文字，不处理（label 会触发复选框）
if ($(e.target).closest('label').length > 0 && !$(e.target).is('.sitemap-option-desc')) {
return;
}
// 阻止事件冒泡，避免重复触发
e.preventDefault();
e.stopPropagation();
// 设置处理标记
isProcessing = true;
// 点击选项区域的其他部分时，切换复选框
var checkbox = $(this).find('input[type="checkbox"]')[0];
if (checkbox) {
// 切换状态
var newState = !checkbox.checked;
checkbox.checked = newState;
// 先同步状态
syncCheckboxState(checkbox);
// 触发 change 事件，让 Layui 知道状态变化
try {
var event = new Event('change', { bubbles: true });
checkbox.dispatchEvent(event);
} catch(err) {
// 兼容旧浏览器
try {
var event = document.createEvent('Event');
event.initEvent('change', true, true);
checkbox.dispatchEvent(event);
} catch(e2) {
// 如果都失败，手动触发 jQuery 事件
$(checkbox).trigger('change');
}
}
// 重新渲染 Layui 复选框
form.render('checkbox');
// 再次同步状态（确保 Layui 渲染后状态正确）
setTimeout(function() {
syncCheckboxState(checkbox);
isProcessing = false;
}, 100);
} else {
isProcessing = false;
}
return false;
});
// 监听原生复选框的 change 事件作为备用
$(document).on('change', '#gen_xml, #gen_html', function() {
syncCheckboxState(this);
});
// 直接点击复选框时，确保状态同步
$(document).on('click', '#gen_xml, #gen_html', function(e) {
// 让浏览器和 Layui 先处理
setTimeout(function() {
syncCheckboxState(this);
}.bind(this), 50);
});
// 表单提交
$('#sitemapForm').submit(function(e){
// 先移除之前可能添加的隐藏字段
$('input[name="gen_xml"][type="hidden"]').remove();
$('input[name="gen_html"][type="hidden"]').remove();
// 直接检查原生复选框的 checked 属性（最可靠的方法）
var xmlCheckbox = document.getElementById('gen_xml');
var htmlCheckbox = document.getElementById('gen_html');
// 方法1: 检查原生复选框状态
var genXml = xmlCheckbox && (xmlCheckbox.checked === true || xmlCheckbox.checked === 'checked');
var genHtml = htmlCheckbox && (htmlCheckbox.checked === true || htmlCheckbox.checked === 'checked');
// 方法2: 如果原生复选框状态不明确，通过 Layui 的样式类判断
if (xmlCheckbox && genXml === false) {
var layuiXml = $('input[name="gen_xml"]').next('.layui-form-checkbox');
if (layuiXml.length > 0 && layuiXml.hasClass('layui-form-checked')) {
genXml = true;
}
} else if (!xmlCheckbox) {
// 如果原生复选框不存在，尝试通过 Layui 样式判断
var layuiXml = $('input[name="gen_xml"]').next('.layui-form-checkbox');
if (layuiXml.length > 0 && layuiXml.hasClass('layui-form-checked')) {
genXml = true;
}
}
if (htmlCheckbox && genHtml === false) {
var layuiHtml = $('input[name="gen_html"]').next('.layui-form-checkbox');
if (layuiHtml.length > 0 && layuiHtml.hasClass('layui-form-checked')) {
genHtml = true;
}
} else if (!htmlCheckbox) {
// 如果原生复选框不存在，尝试通过 Layui 样式判断
var layuiHtml = $('input[name="gen_html"]').next('.layui-form-checkbox');
if (layuiHtml.length > 0 && layuiHtml.hasClass('layui-form-checked')) {
genHtml = true;
}
}
if (!genXml && !genHtml) {
// 显示更明确的错误提示
layer.msg('您还没有选择任何生成类型！请至少选择一个选项（sitemap.xml 或 sitemap.html）才能生成网站地图。', {
icon: 2,
time: 4000,
area: ['400px', 'auto']
});
// 添加视觉反馈：高亮未选中的选项并添加错误样式
$('.sitemap-option-item').each(function() {
var checkbox = $(this).find('input[type="checkbox"]')[0];
if (checkbox && !checkbox.checked) {
$(this).addClass('error-highlight');
setTimeout(function() {
$(this).removeClass('error-highlight');
}.bind(this), 1000);
}
});
e.preventDefault();
return false;
}
// 确保选中的复选框值会被正确提交
// 方法：如果复选框被选中，确保它有正确的值，并且没有被禁用
if (genXml) {
if (xmlCheckbox) {
xmlCheckbox.value = 'on';
xmlCheckbox.disabled = false;
xmlCheckbox.checked = true;
} else {
// 如果原生复选框不存在，创建隐藏字段
$('<input>').attr({
type: 'hidden',
name: 'gen_xml',
value: 'on'
}).appendTo('#sitemapForm');
}
}
if (genHtml) {
if (htmlCheckbox) {
htmlCheckbox.value = 'on';
htmlCheckbox.disabled = false;
htmlCheckbox.checked = true;
} else {
// 如果原生复选框不存在，创建隐藏字段
$('<input>').attr({
type: 'hidden',
name: 'gen_html',
value: 'on'
}).appendTo('#sitemapForm');
}
}
// 显示加载提示
var index = layer.load(1, {
shade: [0.1,'#fff']
});
// 提交后会刷新页面，所以这里不需要手动关闭
return true;
});
});
</script>
</body>
</html>