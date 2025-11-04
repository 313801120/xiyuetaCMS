<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


function midBin(a,b,c)
if lenB(a)<b+c-1 then
midBin=&HFF
else
midBin=ascB(midB(a, b, c))
end if
end function

function bin2Int(a,b)
dim c, d, e 
for c = 1 to lenB(a)
e = midB(a, c, 1) 
if ascB(e) < 128 then
d = d & ascB(e)+b & ChrW(124)
else
c = c + 1 
if c <= lenB(a) then d = d  &  ascB(e)+b & ChrW(124) & ascB(midB(a, c, 1))+b & ChrW(124)
end if 
next 
if len(d)>0 then
d=mid(d,1,len(d)-1)
end if
bin2Int = d 
end function 

function arrayToBin(a)
dim b,c

if typeName(a) <> ChrW(66)&ChrW(121)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41) then
reDim c(uBound(a) \ 2) 
for b = 0 to uBound(a) - 1 step 2
c(b \ 2) = chrW(a(b + 1) * 256 + a(b)) 
next 
if b = uBound(a) then c(b \ 2) = chrW(a(b)) 
c = join(c, "")  
else
c = a 
end if
arrayToBin=c
end function

function bin2Str(a)
dim b, c, d 
for b = 1 to lenB(a)
d = midB(a, b, 1) 
if ascB(d) < 128 then
c = c & chr(ascB(d)) 
else
b = b + 1 
if b <= lenB(a) then c = c & chr(ascW(midB(a, b, 1) & d)) 
end if 
next 
bin2Str = c 
end function 

function binVal(a)
dim b 
dim c 
b = 0 
for c = lenB(a) to 1 step - 1
b = b * 256 + ascB(midB(a, c, 1)) 
next 
binVal = b 
end function 

function binVal2(a)
dim b, c 
b = 0 
for c = 1 to lenB(a)
b = b * 256 + ascB(midB(a, c, 1)) 
next 
binVal2 = b 
end function 

function checkCode(byVal a)
checkCode = getFileCharset(a) 
end function 

function getFileCharset(byVal a)

dim b, c 
call handlePath(a)  
getFileCharset = ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)
if checkFile(a)=false then
exit function
end if

If getFSize(a) = 0 Then
Exit function
End if
set b = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
b.type = 1 
b.mode = 3 
b.open 
b.position = 0 
call b.loadfromfile(a) 
c = b.read
if typeName(c) = ChrW(78)&ChrW(117)&ChrW(108)&ChrW(108) or typeName(c) = ChrW(68)&ChrW(66)&ChrW(78)&ChrW(117)&ChrW(108)&ChrW(108) then 
set b=nothing
exit function
elseIf midBin(c, 1, 1) = 239 and midBin(c, 2, 1) = 187 and midBin(c, 3, 1) = 191 then
getFileCharset=ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56) 
elseIf midBin(c, 1, 1) = 255 and midBin(c, 2, 1) = 254 then
getFileCharset = ChrW(117)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)  
elseIf midBin(c, 1, 1) = 254 and midBin(c, 2, 1) = 255 then
getFileCharset = ChrW(117)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(98)&ChrW(105)&ChrW(103)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(105)&ChrW(97)&ChrW(110)
elseif isUTF8(c)=true then
getFileCharset=ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)  
end if
b.close 
set b = nothing 

if err then call doError(Err.description, ChrW(103)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(65292)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(32534)&ChrW(30721)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

Function is_valid_utf8(ByRef a)
Dim b, c
set c = CreateObject(ChrW(86)&ChrW(66)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(112))
b = ChrW(91)&ChrW(92)&ChrW(120)&ChrW(67)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(68)&ChrW(70)&ChrW(93)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)&ChrW(124)&ChrW(36)&ChrW(41)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(69)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(69)&ChrW(70)&ChrW(93)&ChrW(46)&ChrW(123)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(125)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)&ChrW(124)&ChrW(36)&ChrW(41)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(55)&ChrW(93)&ChrW(46)&ChrW(123)&ChrW(48)&ChrW(44)&ChrW(50)&ChrW(125)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)&ChrW(124)&ChrW(36)&ChrW(41)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(56)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(66)&ChrW(93)&ChrW(46)&ChrW(123)&ChrW(48)&ChrW(44)&ChrW(51)&ChrW(125)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)&ChrW(124)&ChrW(36)&ChrW(41)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(67)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(68)&ChrW(93)&ChrW(46)&ChrW(123)&ChrW(48)&ChrW(44)&ChrW(52)&ChrW(125)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)&ChrW(124)&ChrW(36)&ChrW(41)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(69)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(69)&ChrW(93)&ChrW(46)&ChrW(123)&ChrW(48)&ChrW(44)&ChrW(53)&ChrW(125)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)&ChrW(124)&ChrW(36)&ChrW(41)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(55)&ChrW(70)&ChrW(93)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(67)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(68)&ChrW(70)&ChrW(93)&ChrW(46)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(69)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(69)&ChrW(70)&ChrW(93)&ChrW(46)&ChrW(46)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(55)&ChrW(93)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(56)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(66)&ChrW(93)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(67)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(68)&ChrW(93)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)
b = b & ChrW(124)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(69)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(70)&ChrW(69)&ChrW(93)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(46)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)
b = b & ChrW(124)&ChrW(94)&ChrW(91)&ChrW(92)&ChrW(120)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(92)&ChrW(120)&ChrW(66)&ChrW(70)&ChrW(93)
c.pattern = b
is_valid_utf8 = (Not c.test(a))
End function

Function isUTF8(a)    
Dim b,  c  , d,e,f
d =lenB(a) 
isUTF8 = True

If d < 3 Then
isUTF8 = False
Exit function
ElseIf ascB(midB(a,1,1)) = &HEF And ascB(midB(a,2,1)) = &HBB And ascB(midB(a,3,1)) = &HBF Then 
isUTF8 = True
Exit function
End if 
f=lenB(a)
if f>18048 then f=18048
for b = 1 to f 
e = False
If b + 1 < d Then
If (ascB(midB(a,b,1)) And &HE0) = &HC0 And (ascB(midB(a,b+1,1)) And &HC0) = &H80 Then
e = True
End if
End if
If midBin(a,b,1) < 128 Then 
c = c + 1
elseIf e=true Then 
b = b + 1
ElseIf b + 2 < d Then 
If (ascB(midB(a, b, 1)) And &HF0) = &HE0 And (ascB(midB(a, b+1, 1)) And &HC0) = &H80 And (ascB(midB(a, b+2, 1)) And &HC0) = &H80 Then
b = b + 2
Else 
isUTF8 = false 
End if
Else 
isUTF8 = false 
End if
next 

If c = d Then
isUTF8 = false
End if
err.clear
End function

function checkFileCode(a)
dim b, c, d, e, f, g, h 
f = readBinary(a,0) 




if len(f) > 2500 then
f = right(f, 2500) 
end if 
h = len(f) 
e = a & ChrW(95)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112) 
b = split(ChrW(71)&ChrW(66)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)&ChrW(124)&ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56)&ChrW(124)&ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69), ChrW(124)) 
for each g in b
d = readFile(a, g) 
call writeToFile(e, d, g) 
c = readBinary(e,0) 
c = right(c, h) 
if f = c then
checkFileCode = g 
call deleteFile(e)
exit for 
end if 
next 
call deleteFile(e)
end function 

function autoReadFile(byval a)
autoReadFile=readFile(a,"")
end function

function readFile(byVal a, byVal b)

b=b & ""
if b = ChrW(49) or uCase(b) = ChrW(71)&ChrW(66)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) then
b = ChrW(71)&ChrW(66)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) 
elseIf b = ChrW(48) or uCase(b) = ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56) then
b = ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56) 
elseIf b = ChrW(50) or uCase(b) = ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69) then
b = ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69) 
elseIf b = ChrW(51) or uCase(b) = ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69)&ChrW(32)&ChrW(66)&ChrW(73)&ChrW(71)&ChrW(32)&ChrW(69)&ChrW(78)&ChrW(68)&ChrW(73)&ChrW(65)&ChrW(78) then
b = ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69) 
else
b = checkCode(a)    
if b = "" then exit function 
end if 
dim c, d, e, f 
call handlePath(a)
if checkFile(a) = false then
readFile = "" 
exit function 
end if 
set d = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
d.type = 2
d.mode = 3 
d.charset = b 
d.open 
set f = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
set e = f.getfile(a)
if e.size > 0 then
call d.loadfromfile(a) 
end if 
c = d.readtext 
d.close 
set d = nothing 
readFile = c 
if err then call doError(Err.description, ChrW(82)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(65292)&ChrW(25968)&ChrW(25454)&ChrW(27969)&ChrW(35835)&ChrW(20986)&ChrW(20869)&ChrW(23481)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
set f = nothing 
set d = nothing 
end function 

function getStext(a)
getStext = readFile(a, "") 
end function 

function getFTextUTF(a)
getFTextUTF = readFile(a, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
end function 

function writeToFile(byVal a, byVal b, byVal c)
on error resume next 
if c = ChrW(49) or uCase(c) = ChrW(71)&ChrW(66)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) then
c = ChrW(71)&ChrW(66)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) 
elseIf c = ChrW(48) or uCase(c) = ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56) then
c = ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56) 
elseIf c = ChrW(50) or uCase(c) = ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69) then
c = ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69) 
else
c = checkCode(a)    
if c = "" then exit function 
end if 

dim d 
call handlePath(a)
set d = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
d.type = 2
d.mode = 3 
d.charset = c 
d.open 
call d.writetext(b) 
call d.savetofile(a, 2) 
d.flush 
d.close 
writeToFile = a & ChrW(20889)&ChrW(20837)&ChrW(25104)&ChrW(21151) 
set d = nothing 
if err then call doError(Err.description, ChrW(87)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(65292)&ChrW(25968)&ChrW(25454)&ChrW(27969)&ChrW(20889)&ChrW(20837)&ChrW(20869)&ChrW(23481)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a & ChrW(65292)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(23383)&ChrW(31526) & len(b)) 
end function 

function createFileGBK(byval a, byval b)
call writeToFile(a, b, ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)) 
end function 

function createFileUTF(byval a, byval b)
call writeToFile(a, b, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
end function 

function createAddFile2(a, b)
dim c 
c = readFile(a, ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)) 
c = c & b 
call writeToFile(a, c, ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)) 
end function 


function getUGText(byVal a)
dim b, c, d 
dim e 
b = checkCode(a) 
e = false 

if b = ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56) then
c = ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) 
elseIf b = ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) then
c = ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56) 
end if 
d = c 
if c <> "" then
if checkStr(LCase(getUGText), ChrW(60)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(91)&ChrW(94)&ChrW(62)&ChrW(93)&ChrW(42)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(61)&ChrW(32)&ChrW(42) & c) = true then
getUGText = readFile(a, d) 
e = true 
end if 
end if 

if e = false then
getUGText = readFile(a, b) 
end if 
end function

function getFileBinaryContent(a)
dim b 
call handlePath(a)
set b = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
b.mode = 3 
b.type = 1 
b.open 
call b.loadfromfile(a) 
getFileBinaryContent = b.read 
b.close 
set b = nothing 

end function 

function readBinary(a, b)
readBinary=bin2Int(getFileBinaryContent(a),b)
end function 

function decSaveBinary(a, b, c)
dim d, buf(), e,f 
d = split(b, ChrW(124)) 
reDim buf(uBound(d))
f=0 
for e = 0 to uBound(d)
if d(e) <>"" then
f=f+1
buf(e) = CByte(CInt(d(e)) - c)
end if 
next 
call WriteBinary(a, buf) 
end function 

sub writeBinary(a, b) 
dim c, d,  e 
call handlePath(a)
d=arrayToBin(b)
set e = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
e.type = 1 
e.open 
with createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
.type = 2 
.open 
call.writeText(d) 
.position = 2 
call.copyTo(e) 
.close 
end with 
call e.savetofile(a, 2) 
e.close 
set e = nothing 
end sub 


public function getFileCharset2(byVal a)
dim b 

if err then
err.clear 
end if 
call handlePath(a)
dim c, d 
set c = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
with c
.type = 1 
.mode = 3 
.open 
.loadFromFile(a) 
d =.read(3) 
.close 
end with 
set c = nothing 
if err.number <> 0 then
err.clear : getFileCharset2 = "" : exit function 
end if 
b = binToHex(d) 
if b = ChrW(69)&ChrW(70)&ChrW(66)&ChrW(66)&ChrW(66)&ChrW(70) then
getFileCharset2 = ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56) 
else
b = left(b, 4) 
if b = ChrW(70)&ChrW(69)&ChrW(70)&ChrW(70) then
getFileCharset2 = ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69)&ChrW(32)&ChrW(66)&ChrW(73)&ChrW(71) 
elseIf b = ChrW(70)&ChrW(70)&ChrW(70)&ChrW(69) then
getFileCharset2 = ChrW(85)&ChrW(78)&ChrW(73)&ChrW(67)&ChrW(79)&ChrW(68)&ChrW(69) 
elseIf b = ChrW(51)&ChrW(67)&ChrW(50)&ChrW(53) or b = ChrW(51)&ChrW(67)&ChrW(50)&ChrW(49) then
getFileCharset2 = ChrW(71)&ChrW(66)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) 
else
getFileCharset2 = ChrW(71)&ChrW(66)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50) 
end if 
end if 
if err.number <> 0 then
err.clear : getFileCharset2 = "" : exit function 
end if 
end function 
public function binToHex(byVal a)
dim b, c 
b = 0 
for c = 1 to Ubound(a)
b = b * 256 + midBin(a, c, 1)
next 
binToHex = hex(b) 
end function 

function base64Encode(a)
dim b, c 
set b = createobject(ChrW(97)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
b.type = 2 
b.charset = ChrW(117)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101) 
b.mode = 3 
call b.open() 
call b.writetext(a) 
b.position = 0 
b.type = 1 

set c = createobject(ChrW(109)&ChrW(115)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(100)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116))
call c.loadxml(ChrW(60)&ChrW(114)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(47)&ChrW(62)) 
c.documentelement.datatype = ChrW(98)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52) 
c.documentelement.nodetypedvalue = b.read() 
base64Encode = c.documentelement.text 
end function

function base64Decode(a)
dim b 
set b = createobject(ChrW(109)&ChrW(115)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(100)&ChrW(111)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116))
call b.loadxml(ChrW(60)&ChrW(114)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(47)&ChrW(62)) 
b.documentelement.datatype = ChrW(98)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52) 
b.documentelement.text = a 
base64Decode = b.documentelement.nodetypedvalue 
end function


function binaryReadFile(a)
dim b, c, d, e 
call handlePath(a)
set e = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
e.mode = 3 
e.type = 1 
e.open 
call e.loadfromfile(a) 
d = "" : b = 0 : c = 1 
while b < e.size
d = d & ascB(e.read(c)) 
b = b + c 
doEvents 
wend 
set e = nothing 
binaryReadFile = d 
end function

function binaryReadFile2(a)
dim b, c, d, e 
call handlePath(a)
set e = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
e.mode = 3 
e.type = 1 
e.open 
call e.loadfromfile(a) 
d = "" : b = 0 : c = 1 
while b < e.size
if d <>"" then d=d & ChrW(124)
d = d & ascB(e.read(c)) 
b = b + c 
doEvents 
wend 
set e = nothing 
binaryReadFile2 = d 
end function 
%>  
