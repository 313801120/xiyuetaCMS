<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


function checkStr(byVal a, byVal b)
on error resume next 
dim c, d 
checkStr = true 
set c = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
c.global = true
c.ignorecase = true
c.pattern = b 
set d = c.execute(a)
if d.count = 0 then checkStr = false 
set d = nothing 
set c = nothing 
if err then call doError(err.description, ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(32)&ChrW(26816)&ChrW(26597)&ChrW(23383)&ChrW(31526)&ChrW(26159)&ChrW(21542)&ChrW(23384)&ChrW(22312)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61) & b) 
end function 

function regExp_CheckStr(a, b)
regExp_CheckStr = checkStr(a, b) 
end function 

function existsStr(a, b)
existsStr = checkStr(a, b) 
end function 

function regExp_Instr(a, b)
regExp_Instr = checkStr(a, b) 
end function 

function replaceNoULCase(a,byval b,byval c)
dim d,e,f,g,h,i
d=lcase(a)
b=lcase(b)
if b=c then
replaceNoULCase=a
exit function
end if
for e=1 to 399 
g=instr(d,b) 
if g>0 then
h=mid(a,1,g-1)
i=mid(a,g+len(b))
a=h & c & i
d=lcase(a) 

else

exit for
end if
next
replaceNoULCase=a
end function

function regExp_Replace(byVal a, byVal b, byVal c)
on error resume next 
dim d 
set d = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
d.pattern = b
d.ignorecase = true
d.global = true
regExp_Replace = d.replace(a, c) 
set d = nothing 
if err then call doError(err.description, ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(95)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(32)&ChrW(26367)&ChrW(25442)&ChrW(20869)&ChrW(23481)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(83)&ChrW(101)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(61) & b & ChrW(32)&ChrW(124)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(61) & c) 
end function 

function replaceColor(a, b, c, d)
if d <> "" then c = ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61) & d & ChrW(62) & c & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62) 
replaceColor = regExp_Replace(a, b, c) 
end function 

function delHtml(byVal a)
on error resume next 

if isnul(a) then 
delHtml="" 
exit function
end if
dim b, c 
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.ignorecase = true 
b.global = true 
b.pattern = ChrW(40)&ChrW(60)&ChrW(91)&ChrW(97)&ChrW(45)&ChrW(122)&ChrW(65)&ChrW(45)&ChrW(90)&ChrW(93)&ChrW(46)&ChrW(42)&ChrW(63)&ChrW(62)&ChrW(41)&ChrW(124)&ChrW(40)&ChrW(60)&ChrW(91)&ChrW(92)&ChrW(47)&ChrW(93)&ChrW(91)&ChrW(97)&ChrW(45)&ChrW(122)&ChrW(65)&ChrW(45)&ChrW(90)&ChrW(93)&ChrW(46)&ChrW(42)&ChrW(63)&ChrW(62)&ChrW(41) 
c = b.replace(a, "") 
delHtml = c 
set b = nothing 
if err then call doError(err.description, ChrW(68)&ChrW(101)&ChrW(108)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(32)&ChrW(21024)&ChrW(38500)&ChrW(72)&ChrW(84)&ChrW(77)&ChrW(76)&ChrW(26631)&ChrW(31614)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)) 
end function 

Function delHtmlImg(ByVal a)  
On error resume next  
Dim b, c  
Set b = CreateObject(ChrW(86)&ChrW(66)&ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))  
b.ignorecase = True  
b.global = True  

b.pattern = ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(92)&ChrW(115)&ChrW(43)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(62)  
c = b.replace(a, ChrW(91)&ChrW(22270)&ChrW(29255)&ChrW(93))  
delHtmlImg = c  
Set b = Nothing  
If Err.Number <> 0 Then Call DoError(Err.Description, ChrW(68)&ChrW(101)&ChrW(108)&ChrW(73)&ChrW(109)&ChrW(103)&ChrW(84)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(32)&ChrW(21024)&ChrW(38500)&ChrW(22270)&ChrW(29255)&ChrW(26631)&ChrW(31614)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292))  
End function  

function regExp_DelHtml(a)
regExp_DelHtml = delHtml(a) 
end function 

function getAUrlTitleList(byVal a, byVal b)
on error resume next 
dim c, d, e, f, g 
d = "" 
set g = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
g.ignorecase = true 
g.global = true 
g.pattern = ChrW(60)&ChrW(97)&ChrW(32)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(32)&ChrW(42)&ChrW(61)&ChrW(32)&ChrW(42)&ChrW(91)&ChrW(34)&ChrW(39)&ChrW(93)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(34)&ChrW(39)&ChrW(62)&ChrW(32)&ChrW(93)&ChrW(43)&ChrW(41)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(62)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(60)&ChrW(93)&ChrW(43)&ChrW(41) 
set e = g.execute(a)
for each f in e
if b = ChrW(38142)&ChrW(25509) or b = ChrW(32593)&ChrW(22336) or b = ChrW(48) then
c = f.submatches(0) 
elseIf b = ChrW(26631)&ChrW(39064) or b = ChrW(49) then
c = f.submatches(1) 
else
c = f.submatches(0) & ChrW(36)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36) & f.submatches(1) 
end if 
if inStr(vbCrLf & d & vbCrLf, vbCrLf & c & vbCrLf) = false then
d = d & c & vbCrLf 
end if 
next 
set e = nothing 
set g = nothing 
if d <> "" then d = left(d, len(d) - 2) 
getAUrlTitleList = d 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(20869)&ChrW(23481)&ChrW(20013)&ChrW(38142)&ChrW(25509)&ChrW(19982)&ChrW(26631)&ChrW(39064)&ChrW(21015)&ChrW(34920)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(67)&ChrW(61) & d) 
end function 

function getAURL(a)
getAURL = getAUrlTitleList(a, 0) 
end function 

function getATitle(a)
getATitle = getAUrlTitleList(a, 1) 
end function 

function getAURLTitle(a)
getAURLTitle = getAUrlTitleList(a, ChrW(38142)&ChrW(25509)&ChrW(21644)&ChrW(26631)&ChrW(39064)) 
end function 

function getContentAUrlList(byVal a)
on error resume next 
dim b, c, d, e, f 
c = "" 
set f = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
f.ignorecase = true 
f.global = true 
f.pattern = ChrW(60)&ChrW(97)&ChrW(32)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(32)&ChrW(42)&ChrW(61)&ChrW(32)&ChrW(42)&ChrW(91)&ChrW(34)&ChrW(39)&ChrW(93)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(34)&ChrW(39)&ChrW(62)&ChrW(32)&ChrW(93)&ChrW(43)&ChrW(41)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(62) 
set d = f.execute(a)
for each e in d
b = e.submatches(0) 
if inStr(vbCrLf & c & vbCrLf, vbCrLf & b & vbCrLf) = false then
c = c & b & vbCrLf 
end if 
next 
set d = nothing 
set f = nothing 
if c <> "" then c = left(c, len(c) - 2) 
getContentAUrlList = c 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(20869)&ChrW(23481)&ChrW(20013)&ChrW(38142)&ChrW(25509)&ChrW(19982)&ChrW(26631)&ChrW(39064)&ChrW(21015)&ChrW(34920)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(67)&ChrW(61) & c) 
end function 

function regExp_GetImgUrlList(byVal a, byVal b)
on error resume next 
dim c, d, e, f, g, h 
h = "" 
b = LCase(b) 
set e = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
e.ignorecase = true 
e.global = true 
e.pattern = ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32)&ChrW(42)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(32)&ChrW(42)&ChrW(61)&ChrW(32)&ChrW(42)&ChrW(91)&ChrW(34)&ChrW(124)&ChrW(39)&ChrW(124)&ChrW(32)&ChrW(93)&ChrW(42)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(34)&ChrW(39)&ChrW(62)&ChrW(32)&ChrW(93)&ChrW(43)&ChrW(41) 
set c = e.execute(a)
for each d in c
g = d.submatches(0) 
f = right(g, len(g) - inStrRev(g, ChrW(46))) 
if b = f or b = ChrW(20840)&ChrW(37096) or b = "" then
if inStr(vbCrLf & h & vbCrLf, vbCrLf & g & vbCrLf) = false then
h = h & g & vbCrLf 
end if 
end if 
next 
set c = nothing 
set e = nothing 
if h <> "" then h = left(h, len(h) - 2) 
regExp_GetImgUrlList = h 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(73)&ChrW(77)&ChrW(71)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(22270)&ChrW(29255)&ChrW(20013)&ChrW(32593)&ChrW(22336)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(99)&ChrW(61) & h) 
end function 

function getIMG(a)
getIMG = regExp_GetImgUrlList(a, ChrW(20840)&ChrW(37096)) 
end function 

function getIMGJpg(a)
getIMGJpg = regExp_GetImgUrlList(a, ChrW(74)&ChrW(80)&ChrW(71)) 
end function 

function getIMGGif(a)
getIMGGif = regExp_GetImgUrlList(a, ChrW(71)&ChrW(73)&ChrW(70)) 
end function 

function getIMGBmp(a)
getIMGBmp = regExp_GetImgUrlList(a, ChrW(66)&ChrW(109)&ChrW(112)) 
end function 

function getASPFunctionList(byVal a)
on error resume next 
dim b, c, d, e, f, g 
g = "" 
set d = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
d.ignorecase = true 
d.global = true 
d.pattern = ChrW(40)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(124)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(41)&ChrW(32)&ChrW(46)&ChrW(42)&ChrW(63)&ChrW(92)&ChrW(41) 

set b = d.execute(a)
for each c in b
g = g & c & vbCrLf 
next 
set b = nothing 
set d = nothing 
if g <> "" then g = left(g, len(g) - 2) 
getASPFunctionList = g 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(20989)&ChrW(25968)&ChrW(21015)&ChrW(34920)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(99)&ChrW(61) & g) 
end function 

function getASPDimFunction(byVal a, b, c, d)

a = replace(a, ChrW(40)&ChrW(41), ChrW(40)&ChrW(32)&ChrW(41))
dim e, f, g 
set g = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
g.ignorecase = true 
g.global = true 

a = regExp_Replace(a, ChrW(66)&ChrW(121)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(32), "") 
g.pattern = ChrW(40)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(124)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(41)&ChrW(32)&ChrW(42)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(40)&ChrW(93)&ChrW(43)&ChrW(41)&ChrW(32)&ChrW(42)&ChrW(92)&ChrW(40)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(41)&ChrW(93)&ChrW(43)&ChrW(41)&ChrW(92)&ChrW(41) 
set e = g.execute(a)
for each f in e

if inStr(b, ChrW(123)) = false then
b = b & trim(f) & vbCrLf 
c = c & trim(f.submatches(1)) & vbCrLf 
d = d & replace(f.submatches(2), ChrW(32), "") & vbCrLf 
end if 
next 
set e = nothing 
set g = nothing 

getASPDimFunction = b 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(20989)&ChrW(25968)&ChrW(21015)&ChrW(34920)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)) 
end function 


function strLength(a)
dim b, c, d 
c = 0 
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.global = true 
b.ignorecase = true 
b.pattern = ChrW(91)&ChrW(92)&ChrW(117)&ChrW(52)&ChrW(69)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(117)&ChrW(57)&ChrW(70)&ChrW(65)&ChrW(53)&ChrW(92)&ChrW(117)&ChrW(70)&ChrW(57)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(117)&ChrW(70)&ChrW(65)&ChrW(50)&ChrW(68)&ChrW(93) 
for each d in b.execute(a)
c = c + 1 
next 
set b = nothing 
c = c + len(a) 
strLength = c 
end function 

function regExpGetLenght(a)
regExpGetLenght = strLength(a) 
end function 

function stringLength(a)
stringLength = strLength(a) 
end function 

function getCssHref(byVal a)
on error resume next 
dim b, c, d, e, f, g 
set d = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
d.ignorecase = true 
d.global = true 
d.pattern = ChrW(60)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(46)&ChrW(42)&ChrW(63)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(32)&ChrW(42)&ChrW(61)&ChrW(32)&ChrW(42)&ChrW(91)&ChrW(34)&ChrW(124)&ChrW(39)&ChrW(124)&ChrW(32)&ChrW(93)&ChrW(42)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(34)&ChrW(39)&ChrW(62)&ChrW(93)&ChrW(43)&ChrW(41) 
set b = d.execute(a)
for each c in b
if inStr(LCase(c), ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(101)&ChrW(101)&ChrW(116)) > 0 then
f = c.submatches(0) 
g = g & f & vbCrLf 
end if 
next 
set b = nothing 
set d = nothing 
if g <> "" then g = left(g, len(g) - 2) 
getCssHref = g 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(67)&ChrW(115)&ChrW(115)&ChrW(72)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(72)&ChrW(84)&ChrW(77)&ChrW(76)&ChrW(20013)&ChrW(67)&ChrW(115)&ChrW(115)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(67)&ChrW(32)&ChrW(61) & g) 
end function 

function getJsSrc(byVal a)
on error resume next 
dim b, c, d, e, f, g 
set d = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
d.ignorecase = true 
d.global = true 
d.pattern = ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(46)&ChrW(42)&ChrW(63)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(32)&ChrW(42)&ChrW(61)&ChrW(32)&ChrW(42)&ChrW(91)&ChrW(34)&ChrW(124)&ChrW(39)&ChrW(124)&ChrW(32)&ChrW(93)&ChrW(42)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(34)&ChrW(39)&ChrW(62)&ChrW(93)&ChrW(43)&ChrW(41) 
set b = d.execute(a)
for each c in b
f = c.submatches(0) 
g = g & f & vbCrLf 
next 
set b = nothing 
set d = nothing 
if g <> "" then g = left(g, len(g) - 2) 
getJsSrc = g 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(74)&ChrW(115)&ChrW(83)&ChrW(114)&ChrW(99)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(72)&ChrW(84)&ChrW(77)&ChrW(76)&ChrW(20013)&ChrW(74)&ChrW(115)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(67)&ChrW(32)&ChrW(61) & g) 
end function 

function delHTMLScript(byVal a)
on error resume next 
dim b, c 
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.ignorecase = true 
b.global = true 
b.pattern = ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(42)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62) 
c = b.replace(a, "") 
delHTMLScript = c 
set b = nothing 
if err then call doError(err.description, ChrW(21024)&ChrW(38500)&ChrW(72)&ChrW(84)&ChrW(77)&ChrW(76)&ChrW(20013)&ChrW(60)&ChrW(115)&ChrW(99)&ChrW(105)&ChrW(114)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)) 
end function 

function getMeta(byVal a, b, c)
on error resume next 
dim d, e, f, g, h, i 
i = "" 
b = LCase(b) 
c = 0 
set f = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
f.ignorecase = true 
f.global = true 
f.pattern = ChrW(60)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(46)&ChrW(42)&ChrW(63)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(61)&ChrW(32)&ChrW(42)&ChrW(91)&ChrW(34)&ChrW(124)&ChrW(39)&ChrW(124)&ChrW(32)&ChrW(93)&ChrW(42)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(34)&ChrW(39)&ChrW(62)&ChrW(93)&ChrW(43)&ChrW(41) 
set d = f.execute(a)
for each e in d
if inStr(LCase(e), b) > 0 then
h = e.submatches(0) 
i = i & h & vbCrLf 
c = c + 1 
end if 
next 
set d = nothing 
set f = nothing 
if i <> "" then i = left(i, len(i) - 2) 
getMeta = i 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(72)&ChrW(84)&ChrW(77)&ChrW(76)&ChrW(20013)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(67)&ChrW(32)&ChrW(61) & i) 
end function 

function delHtmlNote(a)
dim b, c 
b = CStr(a) 
set c = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
c.pattern = ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(92)&ChrW(47)&ChrW(42)&ChrW(91)&ChrW(94)&ChrW(60)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(45)&ChrW(45)&ChrW(62) 
c.ignorecase = true 
c.global = true 
b = c.replace(b, "") 
delHtmlNote = b 
set c = nothing 
end function 

function delHtmlMyNote(a)
dim b, c 
b = CStr(a) 
set c = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
c.pattern = ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(35)&ChrW(92)&ChrW(47)&ChrW(42)&ChrW(91)&ChrW(94)&ChrW(60)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(35)&ChrW(45)&ChrW(45)&ChrW(62) 
c.ignorecase = true 
c.global = true 
b = c.replace(b, "") 
delHtmlMyNote = b 
set c = nothing 
end function 

function getStrImgList(byVal a)
a = replace(a, ChrW(39), ChrW(34)) 
dim b, c, d, e, f 
b = "" : c = "" 
set f = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))

f.ignorecase = true 
f.global = true 
f.pattern = ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(34)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(34)&ChrW(62)&ChrW(93)&ChrW(43)&ChrW(41)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(43)&ChrW(62) 
set d = f.execute(a)
for each e in d
b = b & e & ChrW(124) 
c = c & e.submatches(0) & ChrW(124) 
next 
set d = nothing 
set f = nothing 
if b <> "" then
b = left(b, len(b) - 1) 
c = left(c, len(c) - 1) 
end if 


getStrImgList = c 
end function 

function getEMailList(a)
dim b, c, d, e
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.pattern = ChrW(92)&ChrW(119)&ChrW(43)&ChrW(40)&ChrW(91)&ChrW(45)&ChrW(43)&ChrW(46)&ChrW(93)&ChrW(92)&ChrW(119)&ChrW(43)&ChrW(41)&ChrW(42)&ChrW(64)&ChrW(92)&ChrW(119)&ChrW(43)&ChrW(40)&ChrW(91)&ChrW(45)&ChrW(46)&ChrW(93)&ChrW(92)&ChrW(119)&ChrW(43)&ChrW(41)&ChrW(42)&ChrW(92)&ChrW(46)&ChrW(92)&ChrW(119)&ChrW(43)&ChrW(40)&ChrW(91)&ChrW(45)&ChrW(46)&ChrW(93)&ChrW(92)&ChrW(119)&ChrW(43)&ChrW(41)&ChrW(42)
b.ignorecase = true
b.global = true
e = "" 
set d = b.execute(a)
for each c in d
if inStr(ChrW(44) & e & ChrW(44), ChrW(44) & c.value & ChrW(44)) = 0 then
e = e & c.value & ChrW(44) 
end if 
next 
set d = nothing 
set b = nothing 
if e <> "" then e = left(e, len(e) - 1) 
getEMailList = e 
end function 

function oflink_lcasetag(a)
dim b, c, d
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.pattern = ChrW(60)&ChrW(46)&ChrW(43)&ChrW(63)&ChrW(92)&ChrW(62)
b.ignorecase = true
b.global = true
set d = b.execute(a)
a = a 
for each c in d
a = replace(a, c.value, LCase(c.value)) 
next 
oflink_lcasetag = a 
set d = nothing 
set b = nothing 
end function 





function scriptHtml(byVal a, b, c)
dim d 
set d = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
d.ignorecase = true 
d.global = true 
select case c
case 1
d.pattern = ChrW(60) & b & ChrW(40)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(41)&ChrW(42)&ChrW(62) 
a = d.replace(a, "") 
case 2
d.pattern = ChrW(60) & b & ChrW(40)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(41)&ChrW(42)&ChrW(62)&ChrW(46)&ChrW(42)&ChrW(63)&ChrW(60)&ChrW(47) & b & ChrW(40)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(41)&ChrW(42)&ChrW(62) 
a = d.replace(a, "") 
case 3
d.pattern = ChrW(60) & b & ChrW(40)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(41)&ChrW(42)&ChrW(62) 
a = d.replace(a, "") 
d.pattern = ChrW(60)&ChrW(47) & b & ChrW(40)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(41)&ChrW(42)&ChrW(62) 
a = d.replace(a, "") 
end select
scriptHtml = a 
set d = nothing 
end function 




function getRegExp(a, b, c, d, e)
dim f, g, h, i, j, k 
i = "" 
if c <> "" then c = CInt(c)
if d <> "" then d = CInt(d)
if e <> "" then e = CInt(e)
j = false
if c <> "" or d <> "" or e <> "" then j = true 
set f = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
f.pattern = a
f.ignorecase = true
f.global = true
set h = f.execute(b)
for each g in h
if j = true then
k = "" 
if c <> "" then
k = k & g.submatches(c) 
end if 
if d <> "" then
if k <> "" then k = k & ChrW(91)&ChrW(36)&ChrW(83)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(116)&ChrW(36)&ChrW(93) 
k = k & g.submatches(d) 
end if 
if e <> "" then
if k <> "" then k = k & ChrW(91)&ChrW(36)&ChrW(83)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(116)&ChrW(36)&ChrW(93) 
k = k & g.submatches(e) 
end if 
if k <> "" then i = i & k & ChrW(91)&ChrW(36)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)&ChrW(93) 
else
i = i & g & ChrW(91)&ChrW(36)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)&ChrW(93) 
end if 
next 
if i <> "" then i = left(i, len(i) - 9) 
getRegExp = i 
end function

function getImgJsUrl(a, b)
dim c, d, e, f, g 
b = LCase(b)
d = regExpGetStr(ChrW(60)&ChrW(91)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(124)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(93)&ChrW(91)&ChrW(94)&ChrW(60)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(91)&ChrW(94)&ChrW(60)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(91)&ChrW(92)&ChrW(47)&ChrW(93)&ChrW(63)&ChrW(62), a, 2) 
e = split(d, ChrW(91)&ChrW(36)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)&ChrW(93)) 
g = "" 
for each c in e
f = regExpGetStr(ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(91)&ChrW(34)&ChrW(124)&ChrW(39)&ChrW(93)&ChrW(63)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(34)&ChrW(39)&ChrW(32)&ChrW(93)&ChrW(42)&ChrW(41)&ChrW(40)&ChrW(91)&ChrW(34)&ChrW(124)&ChrW(39)&ChrW(93)&ChrW(63)&ChrW(41)&ChrW(46)&ChrW(42)&ChrW(91)&ChrW(92)&ChrW(47)&ChrW(93)&ChrW(63)&ChrW(62), c, 1) 
if b = ChrW(49) or b = ChrW(19981)&ChrW(37325)&ChrW(22797) then
if inStr(vbCrLf & g & vbCrLf, vbCrLf & f & vbCrLf) then
f = "" 
end if 
end if 
if f <> "" then
g = g & f & vbCrLf 
end if 
next 
if g <> "" then g = left(g, len(g) - 2) 
getImgJsUrl = g 
end function 








function regExpGetStr(a, b, c)
dim d, e, f, g 
c = cstr(c) 
set d = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
d.ignorecase = true 
d.global = true 
d.pattern = a 
set f = d.execute(b)
for each e in f
if c = ChrW(49) then
e = d.replace(e, ChrW(36)&ChrW(49)) 
elseIf c = ChrW(50) then
g = g & e & ChrW(91)&ChrW(36)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(36)&ChrW(93) 
end if 
regExpGetStr = e 
next 
set f = nothing 
set d = nothing 
if c = ChrW(50) then
if g <> "" then g = left(g, len(g) - 9) 
regExpGetStr = g 
end if 
end function 

function newGetPingIP(a)
dim b, c, d 
dim e, f, g, h 
newGetPingIP = "" 
b = ChrW(47)&ChrW(22791)&ChrW(20221)&ChrW(47)&ChrW(99)&ChrW(109)&ChrW(100)&ChrW(46)&ChrW(101)&ChrW(120)&ChrW(101) 

c = getPingInfo(b, a) 
d = split(c, ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(100)&ChrW(32)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(46)) 

if uBound(d) >= 4 then
f = trim(replace(replace(replace(a, ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47), ""), ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46), ""), ChrW(47), "")) 
e = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(104)&ChrW(111)&ChrW(105)&ChrW(115)&ChrW(46)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(47)&ChrW(119)&ChrW(104)&ChrW(111)&ChrW(105)&ChrW(115)&ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(63)&ChrW(104)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(61) & f & ChrW(38)&ChrW(95)&ChrW(61) & getRnd(9) 
c = getHttpPage(e, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
g = ChrW(34)&ChrW(105)&ChrW(112)&ChrW(34)&ChrW(58)&ChrW(34) : h = ChrW(34) 
if inStr(c, g) > 0 and inStr(c, h) > 0 then
newGetPingIP = strCut(c, g, h, 2) 
end if 
else
g = ChrW(32)&ChrW(91) : h = ChrW(93) 
if inStr(c, g) > 0 and inStr(c, h) > 0 then
newGetPingIP = strCut(c, g, h, 2) 
else
newGetPingIP = ChrW(78)&ChrW(79) 

end if 
end if 
end function 

function getPingIP(a, b)
dim c, d, e 

d = ChrW(32)&ChrW(91) : e = ChrW(93) 
c = getPingInfo(a, b) 
if inStr(c, d) > 0 and inStr(c, e) > 0 then
getPingIP = strCut(c, d, e, 2) 
else
getPingIP = ChrW(78)&ChrW(79) 

end if 
end function 

function getPingInfo(a, b)
dim c, d 
set c = createObject(ChrW(87)&ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(83)&ChrW(104)&ChrW(101)&ChrW(108)&ChrW(108))
call handlePath(a)
set d = c.exec(a & ChrW(32)&ChrW(47)&ChrW(99)&ChrW(32)&ChrW(112)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(32) & b)
getPingInfo = d.stdout.readall 
end function

function regExpTest(a, b)
dim c 
set c = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
c.ignorecase = true 
c.global = true 
c.pattern = b 
regExpTest = c.test(a) 
set c = nothing 
end function 

function getRegExpStr(byVal a, byVal b, byVal c)
on error resume next 
dim d, e, f, g, h, i 
e = "" 
set h = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
h.ignorecase = true 
h.global = true 
h.pattern = b 
set f = h.execute(a)
for each g in f
i = replace(c, ChrW(92)&ChrW(83)&ChrW(49)&ChrW(92), g.submatches(0)) 
i = replace(i, ChrW(92)&ChrW(83)&ChrW(50)&ChrW(92), g.submatches(1)) 
i = replace(i, ChrW(92)&ChrW(83)&ChrW(51)&ChrW(92), g.submatches(2)) 
i = replace(i, ChrW(92)&ChrW(83)&ChrW(52)&ChrW(92), g.submatches(3)) 
i = replace(i, ChrW(92)&ChrW(83)&ChrW(53)&ChrW(92), g.submatches(4)) 
a = replace(a, g, i) 
next 
set f = nothing 
set h = nothing 
getRegExpStr = a 
end function 

function regExpReplaceCssDir(byVal a, b)
dim c, d, e, f 
dim g, h 
set e = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
e.ignorecase = true 
e.global = true 
e.pattern = ChrW(60)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(46)&ChrW(42)&ChrW(63)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(32)&ChrW(42)&ChrW(61)&ChrW(32)&ChrW(42)&ChrW(91)&ChrW(34)&ChrW(124)&ChrW(39)&ChrW(124)&ChrW(32)&ChrW(93)&ChrW(42)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(34)&ChrW(39)&ChrW(62)&ChrW(93)&ChrW(43)&ChrW(41) 
set c = e.execute(a)
for each d in c
if inStr(LCase(d), ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(101)&ChrW(101)&ChrW(116)) > 0 then
g = d.submatches(0) 
h = getStrFileName(g) 
f = replace(d, g, b & h) 
a = replace(a, d, f) 
end if 
next 
set c = nothing 
set e = nothing 
regExpReplaceCssDir = a 
end function 

function deleteNullRow(byVal a)
deleteNullRow = regExp_Replace(a, ChrW(92)&ChrW(114)&ChrW(92)&ChrW(110)&ChrW(92)&ChrW(115)&ChrW(42)&ChrW(92)&ChrW(114)&ChrW(92)&ChrW(110), "")
end function 

function nullLinkAddDefaultName(a)
dim b 
set b = createObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b.ignorecase = true 
b.global = true 
b.pattern = ChrW(60)&ChrW(97)&ChrW(32)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(32)&ChrW(42)&ChrW(61)&ChrW(32)&ChrW(42)&ChrW(91)&ChrW(34)&ChrW(39)&ChrW(93)&ChrW(91)&ChrW(34)&ChrW(39)&ChrW(93)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(62) 
a = b.replace(a, ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(39)&ChrW(62)) 
set b = nothing 
nullLinkAddDefaultName = a 
end function 
%>   
