<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


Function encodeChar(a) 
dim b
Set b = Server.CreateObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))

With b
.Type = 2
.Mode = 3
.Open
.Charset = ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56)
.WriteText a
.Position = 0
.Type = 1
.Position = 3
dim c
c = .Read
.Close
End With
Set b = Nothing

dim d, e
d = ""
for e = 1 to lenb(c)

d = d & ChrW(37) & Right(ChrW(48) & Hex(ascb(midb(c, e, 1))), 2)
next

encodeChar = UCase(d)
End function










Function unicodeToString(a)
Dim b, c, d
b = ""
c = 1

Do while c <= Len(a)

If Mid(a, c, 2) = ChrW(92)&ChrW(117) Then

d = Mid(a, c + 2, 4)

b = b & ChrW(ChrW(38)&ChrW(72) & d)

c = c + 6
Else

b = b & Mid(a, c, 1)

c = c + 1
End if
Loop

unicodeToString = b
End function 

function UTF2GB(byVal a)
dim b, c 
for b = 1 to len(a)

if mid(a, b, 1) = ChrW(37) then

if len(a) >= b + 8 then
c = c & convChinese(mid(a, b, 9)) 
b = b + 8 
else
c = c & mid(a, b, 1) 
end if 
else
c = c & mid(a, b, 1) 
end if 
next 
UTF2GB = c 
end function 

function checkUTFToGB2312(byVal a)
dim b, c 
checkUTFToGB2312 = true 
for b = 1 to len(a)

if mid(a, b, 1) = ChrW(37) then

if len(a) >= b + 8 then
if convChinese(mid(a, b, 9)) = ChrW(91)&ChrW(20986)&ChrW(38169)&ChrW(69)&ChrW(114)&ChrW(114)&ChrW(111)&ChrW(114)&ChrW(93) then
checkUTFToGB2312 = false : exit function 
end if 
b = b + 8 
else
c = c & mid(a, b, 1) 
end if 
else
c = c & mid(a, b, 1) 
end if 
next  
end function 

function convChinese(a)
on error resume next 
err.clear 
dim b, c, d, e, f 
b = split(mid(a, 2), ChrW(37)) 
c = 0 
d = 0 
for c = 0 to uBound(b)
b(c) = c16to2(b(c)) 
next 
for c = 0 to uBound(b) - 1
e = inStr(b(c), ChrW(48)) 
f = "" 
for d = 1 to e - 1
if d = 1 then
b(c) = right(b(c), len(b(c)) - e) 
f = f & b(c) 
else
c = c + 1 
b(c) = right(b(c), len(b(c)) - 2) 
f = f & b(c) 
end if 
next 
if len(c2to16(f)) = 4 then
convChinese = convChinese & chrW(int(ChrW(38)&ChrW(72) & c2to16(f))) 
else
convChinese = convChinese & chr(int(ChrW(38)&ChrW(72) & c2to16(f))) 
end if 
if err <> 0 then convChinese = ChrW(91)&ChrW(20986)&ChrW(38169)&ChrW(69)&ChrW(114)&ChrW(114)&ChrW(111)&ChrW(114)&ChrW(93) : exit function
next 
end function 

function UTF8_URLEncoding(a)
dim b, c, d 
dim e 
dim f 
if a = "" then
UTF8_URLEncoding = a 
exit function 
end if   
for e = 1 to len(a)
b = mid(a, e, 1) 
f = ascW(b) 
if f < 0 then f = f + 65536 
if(f and &HFF80) = 0 then
d = d & b 
else
if(f and &HF000) = 0 then
c = ChrW(37) & hex(((f \ 2 ^ 6)) or &HC0) & hex(f and &H3F or &H80) 
d = d & c 
else
c = ChrW(37) & hex((f \ 2 ^ 12) or &HE0) & ChrW(37) & _ 
hex((f \ 2 ^ 6) and &H3F or &H80) & ChrW(37) & _ 
hex(f and &H3F or &H80) 
d = d & c 
end if 
end if 
next 
UTF8_URLEncoding = d 
end function 

function toUTF8(a)
dim b, c, d 
dim e 
dim f 

if a = "" then
toUTF8 = a 
exit function 
end if 

for e = 1 to len(a)

b = mid(a, e, 1) 


f = ascW(b) 
if f < 0 then f = f + 65536 
if(f and &HFF80) = 0 then
d = d & b 
else
if(f and &HF000) = 0 then
c = ChrW(37) & hex(((f / 2 ^ 6)) or &HC0) & hex(f and &H3F or &H80) 
d = d & c 
else

c = ChrW(37) & hex((f / 2 ^ 12) or &HE0) & ChrW(37) & _ 
hex((f / 2 ^ 6) and &H3F or &H80) & ChrW(37) & _ 
hex(f and &H3F or &H80) 
d = d & c 
end if 
end if 
next 
toUTF8 = d 
end function 

function chinese2unicode(a)
dim b 
dim c 
dim d 
if(isNull(a)) then
exit function 
end if 
for b = 1 to len(a)
c = mid(a, b, 1) 
d = d & chr(38) 
d = d & chr(35) 
d = d & chr(120) 
d = d & hex(ascW(c)) 
d = d & chr(59) 
next 
chinese2unicode = d 
end function 

function isvalidhex(a)
dim b 
isvalidhex = true 
a = uCase(a) 
if len(a) <> 3 then isvalidhex = false : exit function 
if left(a, 1) <> ChrW(37) then isvalidhex = false : exit function 
b = mid(a, 2, 1) 
if not(((b >= ChrW(48)) and(b <= ChrW(57))) or((b >= ChrW(65)) and(b <= ChrW(90)))) then isvalidhex = false : exit function 
b = mid(a, 3, 1) 
if not(((b >= ChrW(48)) and(b <= ChrW(57))) or((b >= ChrW(65)) and(b <= ChrW(90)))) then isvalidhex = false : exit function 
end function 


function escape(a)
dim b, c, d, e 
c = ""
a=a & ""
for b = 1 to len(a)
d = mid(a, b, 1) 
e = ascW(d) 
if(e >= 48 and e <= 57) or(e >= 65 and e <= 90) or(e >= 97 and e <= 122) then
c = c & d 
elseIf inStr(ChrW(64)&ChrW(42)&ChrW(95)&ChrW(45)&ChrW(46)&ChrW(47), d) > 0 then
c = c & d 
elseIf e > 0 and e < 16 then
c = c & ChrW(37)&ChrW(48) & hex(e) 
elseIf e >= 16 and e < 256 then
c = c & ChrW(37) & hex(e) 
else
c = c & ChrW(37)&ChrW(117) & hex(e) 
end if 
next 
escape = c 
end function 

function unescape(a)
dim b, c, d, e, f, g, h 
e = false 
f = "" 
c = "" 
for b = 1 to len(a)
d = mid(a, b, 1) 
if d = ChrW(43) then
c = c & ChrW(32) 
elseIf mid(a, b, 2) = ChrW(37)&ChrW(117) and b <= len(a) - 5 then
if isNumeric(ChrW(38)&ChrW(72) & mid(a, b + 2, 4)) then
c = c & chrW(CInt(ChrW(38)&ChrW(72) & mid(a, b + 2, 4))) 
b = b + 5 
else
c = c & d 
end if 







elseIf d = ChrW(37) and b <= len(a) - 2 then
g = mid(a, b + 1, 2) 
if isNumeric(ChrW(38)&ChrW(72) & g) then
h = CInt(ChrW(38)&ChrW(72) & g) 
if e = true then
e = false 
c = c & chr(CInt(ChrW(38)&ChrW(72) & f & g)) 
else
if abs(h) <= 127 then
c = c & chr(h) 
else
e = true 
f = g 
end if 
end if 
b = b + 2 
else
c = c & d 
end if 
else
c = c & d 
end if 
next 
unescape = c 
end function 

function chineseToUnicode(a)
dim b, c, d 
for b = 1 to len(a)
c = mid(a, b, 1) 
c = ChrW(38)&ChrW(35)&ChrW(120) & hex(ascW(c)) & ChrW(59) 
d = d & c 
next 
chineseToUnicode = d 
end function 

function unicodeToChinese(a)
dim b, c, d 
b = split(a, ChrW(59)) 
for each c in b
if inStr(c, ChrW(38)&ChrW(35)&ChrW(120)) > 0 then
c = right(c, len(c) - 3) 
d = d & chrW(CInt(ChrW(38)&ChrW(72) & c)) 
end if 
next 
unicodeToChinese = d 
end function 

function chineseToUnicode2(a)
dim b, c, d 
for b = 1 to len(a)
c = mid(a, b, 1) 
c = ChrW(38)&ChrW(35) & ascW(c) & ChrW(59) 
d = d & c 
next 
chineseToUnicode2 = d 
end function  

function unicodeToChinese2(a)
dim b, c, d 
b = split(a, ChrW(59)) 
for each c in b
if inStr(c, ChrW(38)&ChrW(35)) > 0 then
c = right(c, len(c) - 2) 
d = d & chrW(c)
end if 
next 
unicodeToChinese2 = d 
end function 

function autoUnicodeToChinese(a)
dim b,c,d,e,f
f=0
for b=1 to len(a)
c=mid(a,b,1) 
e=e & c
if c=ChrW(38) then
if len(a)>b+2 then
if mid(a,b+1,2)=ChrW(35)&ChrW(120) then
f=2
end if
end if
if f=0 and len(a)>b+1 then 
if mid(a,b+1,1)=ChrW(35) then
f=1
end if      
end if
elseif c=ChrW(59) then
if f=1 then
e=chrW(mid(e,3,len(e)-3)) 
f=0
elseif f=1 then
e=chrW(mid(e,2,len(e)-2)) 
f=0
end if
end if
if f=0 then
d=d & e
e=""
end if  
autoUnicodeToChinese=d
next
end function 

function URLEncode(byRef a)
dim b 
dim c 
URLEncode=""
for b = 1 to len(a)
if asc(mid(a, b, 1)) < 0 then
c = ChrW(37) & right(CStr(hex(asc(mid(a, b, 1)))), 2) 
c = ChrW(37) & left(CStr(hex(asc(mid(a, b, 1)))), len(CStr(hex(asc(mid(a, b, 1))))) - 2) & c 
URLEncode = URLEncode & c 
elseIf(asc(mid(a, b, 1)) >= 65 and asc(mid(a, b, 1)) <= 90) or(asc(mid(a, b, 1)) >= 97 and asc(mid(a, b, 1)) <= 122) then
URLEncode = URLEncode & mid(a, b, 1) 
else
URLEncode = URLEncode & ChrW(37) & hex(asc(mid(a, b, 1))) 
end if 
next 
end function 

function URLDecode(byRef a)
dim b 
URLDecode=""
if inStr(a, ChrW(37)) = 0 then URLDecode = a : exit function 
for b = 1 to len(a)
if mid(a, b, 1) = ChrW(37) then
if val(ChrW(38)&ChrW(72) & mid(a, b + 1, 2)) > 127 then
URLDecode = URLDecode & chr(val(ChrW(38)&ChrW(72) & mid(a, b + 1, 2) & mid(a, b + 4, 2))) 
b = b + 5 
else
URLDecode = URLDecode & chr(val(ChrW(38)&ChrW(72) & mid(a, b + 1, 2))) 
b = b + 2 
end if 
else
URLDecode = URLDecode & mid(a, b, 1) 
end if 
next 
end function 

function toUTFChar(a)
dim b, c, d 
dim e 
dim f 

if a = "" then
toUTFChar = a 
exit function 
end if 

for e = 1 to len(a)
b = mid(a, e, 1) 
f = ascW(b) 
if f < 0 then f = f + 65536 
if(f and &HFF80) = 0 then
d = d & b 
else
if(f and &HF000) = 0 then
c = ChrW(37) & hex(((f \ 2 ^ 6)) or &HC0) & hex(f and &H3F or &H80) 
d = d & c 
else
c = ChrW(37) & hex((f \ 2 ^ 12) or &HE0) & ChrW(37) & _ 
hex((f \ 2 ^ 6) and &H3F or &H80) & ChrW(37) & _ 
hex(f and &H3F or &H80) 
d = d & c 
end if  
end if 
next 
toUTFChar = d 
end function 

function encDecURL(byVal a, byVal b)
dim c, d, e, f, g, h 
c = ChrW(97)&ChrW(98)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122)&ChrW(48)&ChrW(49)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57)&ChrW(58)&ChrW(47)&ChrW(46)&ChrW(61)&ChrW(38)&ChrW(32)&ChrW(40)&ChrW(41)&ChrW(37) 
d = ChrW(57)&ChrW(97)&ChrW(98)&ChrW(49)&ChrW(99)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(104)&ChrW(105)&ChrW(106)&ChrW(50)&ChrW(51)&ChrW(52)&ChrW(107)&ChrW(108)&ChrW(109)&ChrW(110)&ChrW(111)&ChrW(112)&ChrW(113)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(117)&ChrW(118)&ChrW(119)&ChrW(120)&ChrW(121)&ChrW(122)&ChrW(58)&ChrW(47)&ChrW(46)&ChrW(48)&ChrW(53)&ChrW(42)&ChrW(45)&ChrW(36)&ChrW(91)&ChrW(93)&ChrW(64) 
if b = ChrW(35299)&ChrW(23494) or b = ChrW(48) then
e = c 
c = d 
d = e 
end if 
for f = 1 to len(a)
g = mid(a, f, 1) 
if inStr(c, g) > 0 then
g = mid(d, inStr(c, g), 1) 
end if 
h = h & g 
next 
encDecURL = h 
end function 

function encURL(a)
encURL = encDecURL(a, ChrW(21152)&ChrW(23494)) 
end function 

function decURL(a)
decURL = encDecURL(a, ChrW(35299)&ChrW(23494)) 
end function 
%>   
