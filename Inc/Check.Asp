<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


function checkUrlFileNameParam(a, b)
dim c, d, e 
c = lcase(a) 
b = lcase(b) 
d = split(b, ChrW(124)) 
for each e in d
if e <> "" then
e = ChrW(46) & e & ChrW(63) 

if inStr(c, e) > 0 then 
checkUrlFileNameParam = true 
exit function 
end if 
end if 
next 
checkUrlFileNameParam = false 
end function 

function isUCase(a)
dim b, c 
isUCase = true 
for b = 1 to len(a)
c = mid(a, b, 1) 
if inStr(ChrW(65)&ChrW(66)&ChrW(67)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(71)&ChrW(72)&ChrW(73)&ChrW(74)&ChrW(75)&ChrW(76)&ChrW(77)&ChrW(78)&ChrW(79)&ChrW(80)&ChrW(81)&ChrW(82)&ChrW(83)&ChrW(84)&ChrW(85)&ChrW(86)&ChrW(87)&ChrW(88)&ChrW(89)&ChrW(90), c) = false then
isUCase = false 
exit function 
end if 
next 
end function 

function isLCase(a)
dim b, c 
isLCase = true 
for b = 1 to len(a)
c = mid(a, b, 1) 
if inStr(ChrW(97)&ChrW(98)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122), c) = false then
isLCase = false 
exit function 
end if 
next 
end function 

sub checkErr(a)
if err.number <> 0 then
call echo(err.number, ChrW(33258)&ChrW(23450)&ChrW(20041)&ChrW(38169)&ChrW(35823)&ChrW(20449)&ChrW(24687)&ChrW(65306) & a & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(31995)&ChrW(32479)&ChrW(38169)&ChrW(35823)&ChrW(20449)&ChrW(24687)&ChrW(65306) & err.description & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(26368)&ChrW(21021)&ChrW(29983)&ChrW(25104)&ChrW(38169)&ChrW(35823)&ChrW(30340)&ChrW(23545)&ChrW(35937)&ChrW(25110)&ChrW(24212)&ChrW(29992)&ChrW(31243)&ChrW(24207)&ChrW(30340)&ChrW(21517)&ChrW(31216)&ChrW(65306) & err.source) 
end if 
end sub 

function strToTrueFalse(byVal a)
a = trim(LCase(a)) 
strToTrueFalse = IIF(a = ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101), true, false) 
end function 

function strTrueFalseToInt(byVal a)
a = trim(LCase(a)) 
strTrueFalseToInt = IIF(a = ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101), 1, 0) 
end function 

function checkVbCrlf(a)
checkVbCrlf = false 
if inStr(a, vbCrLf) > 0 then checkVbCrlf = true 
end function 

function checkBr(a)
checkBr = checkVbCrlf(a) 
end function 

function isParity(a)
isParity = true
if not isNumeric(a) then
isParity = ChrW(36825)&ChrW(19981)&ChrW(26159)&ChrW(19968)&ChrW(20010)&ChrW(25968)&ChrW(23383)&ChrW(21834)
exit function
end if
if a mod 2 = 0 then
isParity = false  
end if 
end function 

function checkEval(a)
on error resume next 
call execute(a) 
if err.number = 0 then
checkEval = true 
else
checkEval = false 
end if 
end function 



function replace_SQLText(a)
replace_SQLText = "" 
if isNull(a) then
exit function 
else
a = trim(a) 
a = replace(a, ChrW(39), ChrW(39)&ChrW(39)) 
a = replace(a, ChrW(59), ChrW(65307)) 
a = replace(a, ChrW(45)&ChrW(45), ChrW(8212))  
a = displayHtml(a) 
replace_SQLText = a 
end if 
end function 



function chkPost()
dim a, b  
chkPost = false 
a = CStr(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(82))) 
b = CStr(request.serverVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69))) 
call echo(a, b) 
if mid(a, 8, len(b)) <> b then
chkPost = false 
else
chkPost = true 
end if 
end function 

function isValidMobileNo(a)
dim b
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.pattern = ChrW(94)&ChrW(49)&ChrW(92)&ChrW(100)&ChrW(123)&ChrW(49)&ChrW(48)&ChrW(125)&ChrW(36)
isValidMobileNo=b.test(a)
end function 


function isMail(a)
isMail = true 
dim b 
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.pattern = ChrW(40)&ChrW(91)&ChrW(92)&ChrW(46)&ChrW(97)&ChrW(45)&ChrW(122)&ChrW(65)&ChrW(45)&ChrW(90)&ChrW(48)&ChrW(45)&ChrW(57)&ChrW(95)&ChrW(45)&ChrW(93)&ChrW(41)&ChrW(123)&ChrW(50)&ChrW(44)&ChrW(49)&ChrW(48)&ChrW(125)&ChrW(64)&ChrW(40)&ChrW(91)&ChrW(97)&ChrW(45)&ChrW(122)&ChrW(65)&ChrW(45)&ChrW(90)&ChrW(48)&ChrW(45)&ChrW(57)&ChrW(95)&ChrW(45)&ChrW(93)&ChrW(41)&ChrW(123)&ChrW(50)&ChrW(44)&ChrW(49)&ChrW(48)&ChrW(125)&ChrW(40)&ChrW(92)&ChrW(46)&ChrW(40)&ChrW(91)&ChrW(97)&ChrW(45)&ChrW(122)&ChrW(65)&ChrW(45)&ChrW(90)&ChrW(48)&ChrW(45)&ChrW(57)&ChrW(93)&ChrW(41)&ChrW(123)&ChrW(50)&ChrW(44)&ChrW(125)&ChrW(41)&ChrW(123)&ChrW(49)&ChrW(44)&ChrW(52)&ChrW(125)&ChrW(36) 
isMail = b.test(a) 
set b = nothing 
end function 

function isValidEmail(a)
dim b, c, d, e 
isValidEmail = true 
b = split(a, ChrW(64)) 
if uBound(b) <> 1 then isValidEmail = false : exit function 
for each c in b
if len(c) <= 0 then isValidEmail = false : exit function 
for d = 1 to len(c)
e = LCase(mid(c, d, 1)) 
if inStr(ChrW(97)&ChrW(98)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122)&ChrW(95)&ChrW(45)&ChrW(46), e) <= 0 and not isNumeric(e) then isValidEmail = false : exit function 
next 
if left(c, 1) = ChrW(46) or right(c, 1) = ChrW(46) then isValidEmail = false : exit function 
next 
if inStr(b(1), ChrW(46)) <= 0 then isValidEmail = false : exit function 
d = len(b(1)) - inStrRev(b(1), ChrW(46)) 
if d <> 2 and d <> 3 then isValidEmail = false : exit function 
isValidEmail=IIF(inStr(a, ChrW(46)&ChrW(46)) > 0,false,true) 
end function 

function isCode(byVal a)
dim b 
b = replace(a, ChrW(32), "") 
b = replace(b, chr(13), "") 
b = replace(b, chr(10), "") 
b = replace(b, vbTab, "") 
isCode = IIF(b <> "", true, false) 
end function 

function checkNumber(byVal a)
dim b, c 
checkNumber = true 
if len(a) = 0 then checkNumber = false : exit function 
for b = 1 to len(a)
c = mid(a, b, 1) 
if inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57), LCase(c)) = false then
checkNumber = false 
exit function 
end if 
next 
end function 

function isNumber(byVal a)
isNumber = checkNumber(a) 
end function 

function checkABC(byVal a)
dim b, c 
checkABC = true 
for b = 1 to len(a)
c = mid(a, b, 1) 
if inStr(ChrW(97)&ChrW(98)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122), LCase(c)) = false then
checkABC = false 
exit function  
end if 
next 
end function 

function getLen(a)
dim b, c, d 
d = 0 
for b = 1 to len(a)
c = asc(mid(CStr(a), b, 1)) 
if c < 0 then
d = d + 2 
else
d = d + 1 
end if 
next 
getLen = d 
end function 

function checkTime(a)
checkTime = IIF(isDate(a) = false, false, true) 
end function 

function isNul(byVal a)
on error resume next : if err.number <> 0 then err.clear 
isNul = false 
select case varType(a)
case vbEmpty, vbNull
isNul = true : exit function 
case vbString
if a = "" then isNul = true : exit function 
case vbObject
select case typeName(a)
case ChrW(78)&ChrW(111)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(110)&ChrW(103), ChrW(69)&ChrW(109)&ChrW(112)&ChrW(116)&ChrW(121)
isNul = true : exit function 
case ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(101)&ChrW(116)
if a.state = 0 then isNul = true : exit function 
if a.bof and a.eof then isNul = true : exit function 
case ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121)
if a.count = 0 then isNul = true : exit function 
end select
case vbArray, 8194, 8204, 8209
if uBound(a) = -1 then isNul = true : exit function 
end select 
on error goto 0 
end function 










function foundInArr(a, b, c)
dim d, e 
foundInArr = false 
if inStr(a, c) > 0 then
d = split(a, c) 
for e = 0 to uBound(d)
if LCase(trim(d(e))) = LCase(trim(b)) then
foundInArr = true : exit for 
end if 
next 
else
if LCase(trim(a)) = LCase(trim(b)) then foundInArr = true 
end if 
end function 
%>   
