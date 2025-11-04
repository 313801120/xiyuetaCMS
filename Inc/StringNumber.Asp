<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%

Function getCharacterLength(a)
Dim b, c
c = 0
For b = 1 To Len(a)
If AscW(Mid(a, b, 1)) < 256 Then
c = c + 1
Else
c = c + 2
End if
Next
getCharacterLength = c
End function

function handleFormatNumber(a,b)
dim c,d,e,f,g,h
if isNul(a) then handleFormatNumber=0:exit function


c=cstr(numberBeforeAddZero(formatNumber(a,b)))
d=split(c,ChrW(46))
f=d(0)    
for h=1 to len(d(1))
e=mid(d(1),h,1)
if e="" or e=ChrW(48) then exit for
g=g & e
next
if g <>"" then
f=f & ChrW(46) & g
end if
handleFormatNumber=replace(f,ChrW(44),"")
end function
function myFormatNumber(a,b)
dim c,d
d=a & ""
if d="" then a=0
c=formatNumber(a,b)
if c<1 then c=ChrW(48) & c
myFormatNumber=c
end function

function numberBeforeAddZero(a) 
if left(cstr(a),1)=ChrW(46) then
a=0 & a
end if  
numberBeforeAddZero=a
end function







function idcardYMDHide(a)
idcardYMDHide=mid(a,1,10) & ChrW(42)&ChrW(42)&ChrW(42)&ChrW(42) & mid(a,15)
end function

function isStrTransferred(a)
dim b, c, d, e 
e = 0 
isStrTransferred = false  
for c = 0 to len(a) - 1   
d = mid(a, len(a) - c, 1) 
if d = ChrW(92) then
e = e + 1 
else
isStrTransferred = IIF(e mod 2 = 1, true, false) 
exit function 
end if 
next  
end function  

function getRatioNewWidth(a,b,c)
dim d,e,f,g,h,i,j
e=a+b
f=100/e   
g=f*a
h=f*b
i=cint(c/100*g)
j=cint(c/100*h)
getRatioNewWidth=array(i,j)
end function

function getBL(a, b, c)
dim arrNSplStr(3) 
dim d : d = 1
dim e : e = 1
dim f
dim g
if a < 0 then
a = a * - 1 
d = -1 
end if 
if b < 0 then
b = b * - 1 
e = -1 
end if 
if a > b then
f = cint(formatNumber(a / b, 2))
arrNSplStr(0) = f 
arrNSplStr(1) = 1 
else
f = cint(formatNumber(b / a, 2))
arrNSplStr(0) = 1 
arrNSplStr(1) = f 
end if 


g = cint(formatNumber(c / f, 2)) 
arrNSplStr(0) = arrNSplStr(0) * g 
arrNSplStr(1) = arrNSplStr(1) * g 

arrNSplStr(0) = arrNSplStr(0) * d 
arrNSplStr(1) = arrNSplStr(1) * e 
arrNSplStr(2) = f 
arrNSplStr(3) = getCountPage(a, arrNSplStr(0)) 

arrNSplStr(3) = getCountStep(a, b, arrNSplStr(0), arrNSplStr(1), arrNSplStr(3)) 
getBL = arrNSplStr 
end function 

function getCountStep(a, b, c, d, e)
dim f 
getCountStep = 0
if a < 0 then
a = a * - 1  
end if 
if b < 0 then
b = b * - 1 
end if 
if c < 0 then
c = c * - 1 
end if 
if d < 0 then
d = d * - 1 
end if 
for f = e - 10 to e

if c * f >= a or d * f >= b then
getCountStep = f 

end if 
next 
end function 

function getChina(a)
dim b, c, d, e 
for b = 1 to len(a)
d = asc(mid(a, b, 1)) 
e = mid(a, b, 1) 

if d < 0 then
if (d <= -22033 and d >= -24158) = false then
c = c & e 
end if 
end if 
next 
getChina = c 
end function 

function isChina(a)
dim b, c, d 
isChina = false 
for b = 1 to len(a)
c = asc(mid(a, b, 1)) 
d = mid(a, b, 1) 

if c < 0 then
if (c <= -22033 and c >= -24158) = false then
isChina = true 
exit function 
end if 
end if 
next 
end function  

function checkChina(a)
checkChina = isChina(a) 
end function 

function phpRand(a, b)
randomize 
phpRand = 0
dim c 
for c = 1 to 9
phpRand = CInt((a + b) * rnd) 
if phpRand >= a and phpRand <= b then 
exit for 
end if 
next 
if phpRand < a then
phpRand = a 
elseIf phpRand > b then
phpRand = b 
end if 
end function 

function phpRnd(a, b)
phpRnd = phpRand(a, b) 
end function 

function deleteRepeatStr(a, b)
dim c, d, e 
e = "" 
c = split(a, b) 
for each d in c
if d <> "" then
if inStr(b & e & b, b & d & b) = 0 then
e = e & d & b 
end if 
end if 
next 
if e <> "" then e = left(e, len(e) - len(b)) 
deleteRepeatStr = e 
end function 

function replaceN(a, b, c, d)
dim e,f
f = handleNumber(cStr(d))
if f = "" then
d = 1 
else
d = CInt(f) 
end if 
for e = 1 to d
a = replace(a, b, c) 
next 
replaceN = a 
end function 

function fillZero(a)
fillZero=""
if len(a) = 1 then
fillZero = ChrW(48) & a 
else
fillZero = a 
end if 
end function 

function caseInsensitiveReplace(a, b, c)
dim d, e, f, g, h, i, j 
i = "" 
if LCase(b) = LCase(c) then
caseInsensitiveReplace = a 
end if 
f = LCase(a) 
for j = 1 to 99
if inStr(f, b) > 0 then
d = inStr(f, b) - 1 
g = left(a, d) 
e = d + len(b) + 1 
h = mid(a, e)   
a = g & c & h 



f = LCase(a) 
else
exit for 
end if 
next 
caseInsensitiveReplace = a 
end function  

function array_Sort(a)
dim b, c, d, e, f 
for b = uBound(a) to 0 step - 1
e = a(b)  
d = 0 
for c = 1 to b
if a(c) > e then
e = a(c) 
d = c 
end if 
next 
if d <> b then
f = a(d) 
a(d) = a(b) 
a(b) = f 
end if 
next 
array_Sort = a 
end function 

function handleZipSize(byVal a)
on error resume next 
dim b 
a = LCase(a) 
b = getDianNumb(a) 
if inStr(a, ChrW(103))>0 then
b = b * 1073741824 
elseIf inStr(a, ChrW(109))>0 then
b = b * 1048576 
elseIf inStr(a, ChrW(107))>0 then
b = b * 1024 
end if 
handleZipSize = b 
if err then call doError(Err.description, ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(90)&ChrW(105)&ChrW(112)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(32)&ChrW(22788)&ChrW(29702)&ChrW(90)&ChrW(105)&ChrW(112)&ChrW(22823)&ChrW(23567)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(90)&ChrW(105)&ChrW(112)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(61) & a) 
end function 

function getRnd(byVal a)
randomize 
dim b, c, d 
for c = 1 to a
if c mod 2 = 0 then
b = chrW((57 - 48) * rnd + 48)
elseIf c mod 3 = 0 then
b = chrW((90 - 65) * rnd + 65)
else
b = chrW((122 - 97) * rnd + 97)
end if 
d = d & b 
next 
getRnd = d 
end function 


function getRndTel(byVal a)
randomize 
dim b, c, d 
for c = 1 to a
b = chrW((57 - 48) * rnd + 48)
d = d & b 
next 
getRndTel = d 
end function 

function mathRandom()
dim a, b 
b = "" 
randomize 
for a = 1 to 16
b = b & cint(int(rnd() * 9)) 
next 
mathRandom = ChrW(48)&ChrW(46) & b 
end function 

function getRndAZ(a)
dim b, c, d, e 
e = "" : b = "" 
randomize 
b = ChrW(97)&ChrW(98)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122) & uCase(b) 
for c = 1 to a
d = mid(b, phpRnd(1, len(b)), 1) 
e = e & d 
next 
getRndAZ = e 
end function 

function getRand(byVal a)
getRand = getRnd(a) 
end function 


function copyStrNumb(byVal a, b)
dim c, d 
if b > 0 then
d = a 
for c = 1 to b - 1
a = a & d 
next 
else
a = "" 
end if 
copyStrNumb = a 
end function 

function str_Repeat(byVal a, b)
str_Repeat = copyStrNumb(a, b) 
end function 

function copyStr(a, b)
copyStr = copyStrNumb(a, b) 
end function 

function contentAddTab(byVal a, b)
contentAddTab = copyStr(ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32), b) & join(split(a, vbCrLf), vbCrLf & copyStr(ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32), b)) 
end function  

function deleteEndStr(a, b)
if a <> "" then a = left(a, len(a) - b) 
deleteEndStr = a 
end function 

function toNumber(byVal a, byVal b)
toNumber = cint(formatNumber(a, b, - 1))   
end function  

function handleNumber(byVal a)
dim b, c, d 
d = ""   
for b = 1 to len(a)
c = mid(a, b, 1) 
if inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57), c) > 0 then
d = d & c 
end if 
next 
handleNumber = d
end function 

function strDrawInt(byVal a)
strDrawInt = handleNumber(a) 
end function 

function getFirstNegativeNumber(byVal a)
dim b, c, d 
d = "" 
a = trim(a) 
for b = 1 to len(a)
c = mid(a, b, 1) 
if c = ChrW(45) and d = "" then
d = d & c 
elseIf inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57), c) > 0 then
d = d & c 
end if 
next 
if d = "" then d = ChrW(48)
getFirstNegativeNumber = d 
end function 

function checkNumberType(byVal a)
checkNumberType = handleNumber(a) 
end function 

function checkStrIsNumberType(byVal a)
dim b, c 
checkStrIsNumberType = true 
for b = 1 to len(a)
c = mid(a, b, 1) 
if inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57), c) = 0 then
checkStrIsNumberType = false 
exit function 
end if 
next 
end function 

function handleNumberType(byVal a)
dim b, c, d 
d = "" 
a = trim(a) 
for b = 1 to len(a)
c = mid(a, b, 1) 
if b = 1 and inStr(ChrW(43)&ChrW(45)&ChrW(42)&ChrW(47), left(a, 1)) > 0 then
d = d & c 
elseIf b > 1 and c = ChrW(46) then
d = d & c 
elseIf inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57), c) > 0 then
d = d & c 
end if 
next 
handleNumberType = d 
end function 

function getStrToNumber(byVal a)
dim b, c, d 
d = "" 
a = trim(a) 
for b = 1 to len(a)
c = mid(a, b, 1) 
if b = 1 and inStr(ChrW(45), left(a, 1)) > 0 then
d = d & c 
elseIf b > 1 and c = ChrW(46) then
d = d & c 
elseIf inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57), c) > 0 then
d = d & c 
end if 
next 
getStrToNumber = d 
end function 

function getNumber(byVal a)
dim b, c, d 
d = "" 
a = trim(a) 
for b = 1 to len(a)
c = mid(a, b, 1) 
if inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57), c) > 0 then
if d = "" and c = ChrW(48) then
else
d = d & c 
end if 
end if 
next 
getNumber = d
end function 

function checkNumb(a)
dim b,c
checkNumb = true
for c = 1 to len(a)
b=mid(a,c,1)
if inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57)&ChrW(46), b) =0 then
checkNumb = false
exit function
end if 
next
end function 

function getDianNumb(byVal a)
dim b, c, d,e
d = "" 
e=false
for b = 1 to len(a)
c = mid(a, b, 1)
if c=ChrW(46) and e=true then
exit for
elseif c=ChrW(46) and d <>"" and e=false then
d=d & c
e=true 
elseif inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57)&ChrW(46), c) > 0 then
d = d & c 
end if 
next 
getDianNumb = d 
end function 

function getCountPage(a, b)

dim c 
if a < 0 then
a = a * - 1 
end if 
if b < 0 then
b = b * - 1 
end if 
c = fix(a / b) 
if  a Mod b  > 0 then c = c + 1 
getCountPage = c 
end function 

function getPageNumb(a, b)
dim c 
c = int(a / b) 
if a mod b > 0 then
c = c + 1 
end if 
getPageNumb = c 
end function 

function getCaiHandleCountPage(a)
a = delHtml(a) 
a = handleNumber(a) 
getCaiHandleCountPage = "" 
if len(a) < 10 then
getCaiHandleCountPage = right(a, 1) 
elseIf len(a) < 200 then
getCaiHandleCountPage = right(a, 2) 
end if 
end function 

function getCaiSortCountPage(byVal a)
dim b, c 
getCaiSortCountPage = "" 
a = delHtml(a) 
a = handleNumber(a) 
for b = 1 to 30
c = mid(a, 1, len(b)) 
if c = CStr(b) then
getCaiSortCountPage = cstr(b) 

a = right(a, len(a) - len(b)) 
end if 
next 
end function 

function minMaxBetween(a, b, c)



minMaxBetween = a
if a > b then
minMaxBetween = b 
elseIf c > a then
minMaxBetween = c 
if c > b then
minMaxBetween = b 
end if 
end if 
end function 

function getStrFileType(a)
dim b 
b = "" 
if inStr(a, ChrW(46)) > 0 then
b = LCase(mid(a, inStrRev(a, ChrW(46)) + 1)) 
if inStr(b, ChrW(63)) > 0 then
b = mid(b, 1, inStr(b, ChrW(63)) - 1) 
end if 
end if 
getStrFileType = b 
end function 

function val(byVal a)
val = cint(a) 
if a = "" or not isNumeric(a) then
val = 0  
end if 
end function 

function strLen(a)
on error resume next 
strLen = 0 
if isNull(a) <>false and a <> "" then
dim b, c, d, e  
d = 0 
c = len(a) 
for b = 1 to c
e = mid(a, b, 1) 





if e < 0 then e = e + 65536 
if e < 255 then d = d + 1 
if e > 255 then d = d + 2 
next 
strLen = d 
end if 
end function 

function addIndent(a, b)
dim c, d, e 
e = "" 
c = split(a, vbCrLf) 
for each d in c
e = e & b & d & vbCrLf 
next 
addIndent = trimVbCrlf(e) 
end function 

function getNumberBeforeStr(a)
dim b, c, d 
d = "" 
for b = 1 to len(a)
c = mid(a, b, 1) 
if inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57), c) > 0 then exit for 
d = d & c 
next 
getNumberBeforeStr = d 
end function

function getNumberGroup(a)
dim b, c, d 
d = "" 
for b = 1 to len(a)
c = mid(a, b, 1) 
if c=ChrW(45) and d="" then
d=c
elseif inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57), c) > 0 then
d = d & c 
end if
next 
getNumberGroup = d 
end function 

function getParamNumb(a)
dim b, c, d 
d = "" 
for b = 1 to len(a)
c = mid(a, b, 1) 
if inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57), c) > 0 then
d = d & c 
end if
next 
getParamNumb = d 
end function 


function makePassword(byVal a)
dim b ,c
dim d, e, f, g 
randomize 
b = "" 
for g = 1 to a
d = int((1 - 0 + 1) * rnd + 0) 
if d = 0 then 
e = 90 
f = 65 
else
e = 57 
f = 48 
end if 
c=cint( (e - f + 1) * rnd + f)
b = b & chr(c)
next 
makePassword = b 
end function 



function rndCode(byVal a, byVal b)
dim c, d 
randomize 
rndCode = "" 
c = int(a * rnd + b - a) 
for d = 1 to c
randomize 
rndCode = rndCode & chr(cint(127 * rnd + 1)) 
next 
end function 


function getRandomPhoneNumber(a)
dim b, c, d, e ,f
e = "" : c = "" 
d = 1 
do while d < a
randomize 
do while len(c) < 9
f = cint((57 - 48) * rnd + 48)
c = c & chr(f)
loop 
e = e & 13 & c & vbCrLf 
c = "" 
d = d + 1 
loop 
if e <> "" then e = left(e, len(e) - 2) 
getRandomPhoneNumber = e 
end function 

function lenStr(a)
dim b, c, d 
d = "" 
dim e 
b = len(a)  
c = 0 
for e = 1 to b
d = asc(mid(a, e, 1))  
if d < 0 then d = d + 65536 
if d < 255 then c = c + 1 
if d > 255 then c = c + 2  
next 
lenStr = c 
end function 

function toString(byVal a)
dim b 
if isArray(a) then
b = join(a, ChrW(44))   
end if 
toString = b 
end function 

function remoteNumber(a)
dim b, c, d 
for b = 1 to len(a)
c = mid(a, b, 1) 
if inStr(ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57)&ChrW(46), c) = 0 then
d = d & c 
end if 
next 
remoteNumber = d 
end function 


function handleHaveStr(a, b)
dim c, d 
handleHaveStr = false 
for d = 1 to len(b)
c = mid(b, d, 1) 
if inStr(a, c) > 0 then
handleHaveStr = true 
exit function 
end if 
next 
end function 

function haveLowerCase(a)
haveLowerCase = handleHaveStr(a, ChrW(97)&ChrW(98)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122)) 
end function 

function haveUpperCase(a)
haveUpperCase = handleHaveStr(a, ChrW(65)&ChrW(66)&ChrW(67)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(71)&ChrW(72)&ChrW(73)&ChrW(74)&ChrW(75)&ChrW(76)&ChrW(77)&ChrW(78)&ChrW(79)&ChrW(80)&ChrW(81)&ChrW(82)&ChrW(83)&ChrW(84)&ChrW(85)&ChrW(86)&ChrW(87)&ChrW(88)&ChrW(89)&ChrW(90)) 
end function 

function haveNumber(a)
haveNumber = handleHaveStr(a, ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57)) 
end function 

function haveChina(a)
dim b, c 
haveChina = false 
for b = 1 to len(a)
c = asc(mid(a, b, 1)) 

if c < 0 then
if (c <= -22033 and c >= -24158) = false then
haveChina = true 
exit function 
end if 
end if 
next 
end function 





function encodeJP(a)
if not a = "" then
a = replace(a, ChrW(12460), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(54)&ChrW(48)&ChrW(59)) 
a = replace(a, ChrW(12462), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(54)&ChrW(50)&ChrW(59)) 
a = replace(a, ChrW(12464), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(54)&ChrW(52)&ChrW(59)) 
a = replace(a, ChrW(12450), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(53)&ChrW(48)&ChrW(59)) 
a = replace(a, ChrW(12466), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(54)&ChrW(54)&ChrW(59)) 
a = replace(a, ChrW(12468), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(54)&ChrW(56)&ChrW(59)) 
a = replace(a, ChrW(12470), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(55)&ChrW(48)&ChrW(59)) 
a = replace(a, ChrW(12472), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(55)&ChrW(50)&ChrW(59)) 
a = replace(a, ChrW(12474), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(55)&ChrW(52)&ChrW(59)) 
a = replace(a, ChrW(12476), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(55)&ChrW(54)&ChrW(59)) 
a = replace(a, ChrW(12478), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(55)&ChrW(56)&ChrW(59)) 
a = replace(a, ChrW(12480), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(56)&ChrW(48)&ChrW(59)) 
a = replace(a, ChrW(12482), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(56)&ChrW(50)&ChrW(59)) 
a = replace(a, ChrW(12485), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(56)&ChrW(53)&ChrW(59)) 
a = replace(a, ChrW(12487), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(56)&ChrW(55)&ChrW(59)) 
a = replace(a, ChrW(12489), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(56)&ChrW(57)&ChrW(59)) 
a = replace(a, ChrW(12496), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(54)&ChrW(59)) 
a = replace(a, ChrW(12497), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(55)&ChrW(59)) 
a = replace(a, ChrW(12499), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(57)&ChrW(59)) 
a = replace(a, ChrW(12500), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(48)&ChrW(59)) 
a = replace(a, ChrW(12502), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(50)&ChrW(59)) 
a = replace(a, ChrW(12502), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(50)&ChrW(59)) 
a = replace(a, ChrW(12503), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(51)&ChrW(59)) 
a = replace(a, ChrW(12505), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(53)&ChrW(59)) 
a = replace(a, ChrW(12506), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(54)&ChrW(59)) 
a = replace(a, ChrW(12508), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(56)&ChrW(59)) 
a = replace(a, ChrW(12509), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(57)&ChrW(59)) 
a = replace(a, ChrW(12532), ChrW(38)&ChrW(35)&ChrW(49)&ChrW(50)&ChrW(53)&ChrW(51)&ChrW(50)&ChrW(59)) 
end if 
encodeJP = a 
end function 

function cnTounicode(a)
cnTounicode=""
dim b
for b=1 to len(a)



cnTounicode=cnTounicode & ChrW(92)&ChrW(117) & LCase(Right(ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48) & Cstr(hex(AscW(mid(a,b,1)))),4))
next
end function

function unicodeto(a)
dim b,c,d
for b=1 to len(a)
c=mid(a & ChrW(32)&ChrW(32),b,2)
if c=ChrW(92)&ChrW(117) then
d=d & ChrW(cint(ChrW(38)&ChrW(72) & mid(a,b+2,4)))
b=b+5
else
d=d & mid(a,b,1)
end if
next
unicodeto=d
end function

function getHanZiTxt(a)
dim b,c,d
for c=1 to len(a)
b=mid(a,c,1)

if isChinese(b) then
d=d & b
end if
next
getHanZiTxt=d
end function

Function isChinese(a)
Dim b, c
Set b = New RegExp
b.pattern = ChrW(94)&ChrW(91)&ChrW(92)&ChrW(117)&ChrW(52)&ChrW(101)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(117)&ChrW(57)&ChrW(102)&ChrW(97)&ChrW(53)&ChrW(93)&ChrW(43)&ChrW(36)
b.ignorecase = True
c = b.test(a)
Set b = Nothing
isChinese = c
End function

function myLeft(a,b)
dim c, d, e,f,g
g = "" 
d=0

for c = 1 to len(a)
f=mid(a, c, 1)
if isChinese(f)=true then
d=d+2
else
d=d+1
end if


if d>b then
exit for
end if
g=g & f 
next 
myLeft = g
end function 

function nHleZhe(a)
dim b,c,d
if isnul(a) then
nHleZhe=""
exit function
end if
b=cstr(a)
if left(b,1)=ChrW(46) then
b=ChrW(48)&ChrW(46) & mid(b,2)
elseif left(b,2)=ChrW(45)&ChrW(46) then
b=ChrW(45)&ChrW(48)&ChrW(46) & mid(b,3)
end if

for c =1 to 99
d=right(b,1)

if (d=ChrW(48) and instr(b,ChrW(46))>0) or d=ChrW(46) then
b=mid(b,1,len(b)-1)
else
exit for
end if
next 
nHleZhe=b
end function

function newCStr(a)
if isnul(a) then
newCStr=""
else
newCStr=cstr(a)
end if
end function
%>   
