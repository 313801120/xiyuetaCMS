<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 



sub msgBox(byVal a)    
a = replace(replace(a, chr(10), ChrW(92)&ChrW(110)), chr(13), ChrW(92)&ChrW(110)) 
response.write(ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39) & a & ChrW(39)&ChrW(41)&ChrW(59)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62))  
end sub 

sub MBInfo(a, b) 
call msgBox(a)   
end sub   

sub addRq(a, b)  
response.queryString(a) = b   
end sub  

sub rr(a)
response.redirect(a) 
end sub 

function rf(a)
rf = request.form(a) 
end function 

function rq(a)
rq = request.queryString(a) 
end function 

function rfq(a)
rfq = request(a) 
end function 

function ADSqlRf(a)
dim b
b=replace(request.form(a), ChrW(39), ChrW(39)&ChrW(39))
if EDITORTYPE=ChrW(106)&ChrW(115)&ChrW(112) then
b=replace(b,ChrW(92),ChrW(92)&ChrW(92))
end if 
ADSqlRf =b & ""
end function 

Function ADSql(a) 
dim b
b=replace(a, ChrW(39), ChrW(39)&ChrW(39))
if EDITORTYPE=ChrW(106)&ChrW(115)&ChrW(112) then
b=replace(b,ChrW(92),ChrW(92)&ChrW(92))
end if
ADSql =b
End function 

sub rw(a)
response.write(a) 
end sub 

sub rwBr(a)
response.write(a & vbCrLf) 
end sub 

sub rwEnd(a)
response.write(a) 
response.end() 
end sub 

sub rwPre(a)
response.Write(ChrW(60)&ChrW(112)&ChrW(114)&ChrW(101)&ChrW(62)& replace(a,ChrW(60),ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)) &ChrW(60)&ChrW(47)&ChrW(112)&ChrW(114)&ChrW(101)&ChrW(62))
end sub
function pre(a)
pre = ChrW(60)&ChrW(112)&ChrW(114)&ChrW(101)&ChrW(62)& replace(a,ChrW(60),ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)) &ChrW(60)&ChrW(47)&ChrW(112)&ChrW(114)&ChrW(101)&ChrW(62)
end function

sub htmEnd(a)
call rwEnd(a) 
end sub 

sub die(a)
call rwEnd(a) 
end sub 

sub debug(a)
response.write(ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(58)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(49)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(35)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(59)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(58)&ChrW(50)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(34)&ChrW(62)&ChrW(35843)&ChrW(35797) & a & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbCrLf) 
end sub 

sub trace(a)
call debug(a) 
end sub 

sub echoPrompt(a, b)
response.write(ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(71)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub echoStr(a, b)
call echoPrompt(a, b) 
end sub 

sub echo(a, b)
call echoPrompt(a, b) 
end sub 

sub echoB(a, b)
response.write(ChrW(60)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(71)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub echoRed(a, b)
response.write(ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub echoRedB(a, b)
response.write(ChrW(60)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub echoYellow(a, b)
response.write(ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(35)&ChrW(66)&ChrW(51)&ChrW(56)&ChrW(55)&ChrW(48)&ChrW(52)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub echoYellowB(a, b)
response.write(ChrW(60)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(35)&ChrW(66)&ChrW(51)&ChrW(56)&ChrW(55)&ChrW(48)&ChrW(52)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub echoBlue(a, b)
response.write(ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(98)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub echoBlueB(a, b)
response.write(ChrW(60)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(98)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub echoGay(a, b)
response.write(ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(35)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub echoGayB(a, b)
response.write(ChrW(60)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(35)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub print_R(a)
dim b, c  
if typeName(a) = ChrW(86)&ChrW(97)&ChrW(114)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(41) then
for b = 0 to uBound(a)
c = c & ChrW(91) & b & ChrW(93)&ChrW(32)&ChrW(61)&ChrW(62)&ChrW(32) & a(b) & vbCrLf 
next 
else
c = a 
end if 
response.write(c) 
end sub 

sub setColorEcho(a, b, c)
response.write(ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61) & a & ChrW(62) & b & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & c & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end sub 

sub eerr(a, b)

response.write(ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(62) & a & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)&ChrW(65306) & b) 
response.end() 
end sub 

sub doEvents()
response.flush() 
end sub 

function IIF(a, b, c)
if(a) then IIF = b else IIf = c 
end function 

sub hr()
response.write(ChrW(60)&ChrW(104)&ChrW(114)&ChrW(32)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(49)&ChrW(39)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(39)&ChrW(35)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(39)&ChrW(62)&ChrW(32)) 
end sub 

sub br()
response.write(ChrW(60)&ChrW(98)&ChrW(114)&ChrW(47)&ChrW(62)) 
end sub 



sub print(byVal a)
response.write(a & vbCrLf) : response.flush() 
end sub 

sub println(byVal a)
response.write(a & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(32)&ChrW(47)&ChrW(62) & vbCrLf) : response.flush() 
end sub 

sub printHtml(byVal a)
response.write(replace(replace(a, ChrW(60), ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)), ChrW(62), ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59)) & vbCrLf)  
end sub
sub printlnHtml(byVal a) 
response.write(replace(replace(a, ChrW(60), ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)), ChrW(62), ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59)) & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(32)&ChrW(47)&ChrW(62) & vbCrLf)  
end sub 







sub printEnd(byVal a)
response.write(a) : response.end() 
end sub

function setIsChecked(byVal a, byVal b)
setIsChecked=IIF(a = b,ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)&ChrW(39),"")  
end function 

function setIsSelected(byVal a, byVal b)
setIsSelected=IIF(a = b,ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(39),"") 
end function  

sub doError(a, b)

dim c, d 
randomize 
c = cint(rnd() * 29252)
d = ChrW(60)&ChrW(98)&ChrW(114)&ChrW(32)&ChrW(47)&ChrW(62) 
d = d & ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58)&ChrW(49)&ChrW(48)&ChrW(48)&ChrW(37)&ChrW(59)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(49)&ChrW(50)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(59)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(49)&ChrW(53)&ChrW(48)&ChrW(37)&ChrW(34)&ChrW(62) 
d = d & ChrW(32)&ChrW(32)&ChrW(60)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(101)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(61)&ChrW(34)&ChrW(69)&ChrW(82)&ChrW(82)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(73)&ChrW(86) & c & ChrW(46)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(61)&ChrW(40)&ChrW(69)&ChrW(82)&ChrW(82)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(73)&ChrW(86) & c & ChrW(46)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(61)&ChrW(61)&ChrW(39)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(39)&ChrW(63)&ChrW(39)&ChrW(39)&ChrW(58)&ChrW(39)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(39)&ChrW(41)&ChrW(34)&ChrW(62) 
d = d & ChrW(32)&ChrW(32)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(35)&ChrW(56)&ChrW(50)&ChrW(48)&ChrW(50)&ChrW(50)&ChrW(50)&ChrW(59)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(35)&ChrW(70)&ChrW(70)&ChrW(70)&ChrW(70)&ChrW(70)&ChrW(70)&ChrW(59)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(50)&ChrW(51)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(49)&ChrW(52)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(99)&ChrW(117)&ChrW(114)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(112)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(62)&ChrW(12310)&ChrW(32)&ChrW(20986)&ChrW(38169)&ChrW(32)&ChrW(25552)&ChrW(31034)&ChrW(20449)&ChrW(24687)&ChrW(32)&ChrW(69)&ChrW(82)&ChrW(82)&ChrW(79)&ChrW(82)&ChrW(32)&ChrW(12311)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(32)&ChrW(47)&ChrW(62) 
d = d & ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(101)&ChrW(108)&ChrW(62) 
d = d & ChrW(32)&ChrW(32)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(69)&ChrW(82)&ChrW(82)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(73)&ChrW(86) & c & ChrW(34)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58)&ChrW(57)&ChrW(57)&ChrW(37)&ChrW(59)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(58)&ChrW(49)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(35)&ChrW(56)&ChrW(50)&ChrW(48)&ChrW(50)&ChrW(50)&ChrW(50)&ChrW(59)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(58)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(58)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(59)&ChrW(34)&ChrW(62) 
if a <>"" then d = d & ChrW(32)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(35)&ChrW(70)&ChrW(70)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(59)&ChrW(34)&ChrW(62)&ChrW(20986)&ChrW(38169)&ChrW(25551)&ChrW(36848)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(32) & a & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(32)&ChrW(47)&ChrW(62) 
if b <>"" then d = d & ChrW(32)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(35)&ChrW(70)&ChrW(70)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(59)&ChrW(34)&ChrW(62)&ChrW(22238)&ChrW(26174)&ChrW(20449)&ChrW(24687)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(32) & b & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(32)&ChrW(47)&ChrW(62) 
d = d & ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) 
d = d & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) 
d = d & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(32)&ChrW(47)&ChrW(62) 
response.write(d) 
response.end()
end sub 

function exec(byVal a)
if a = "" then exit function : end if 
on error resume next 
execute(a) 
on error goto 0 
end function 

function handleBodyQQFace(a)
dim b
for b=1 to 75
a=replace(a,ChrW(91)&ChrW(101)&ChrW(109)&ChrW(95)& b  &ChrW(93),ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(39)&ChrW(47)&ChrW(107)&ChrW(102)&ChrW(47)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(113)&ChrW(113)&ChrW(102)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(47)& b & ChrW(46)&ChrW(112)&ChrW(110)&ChrW(103)&ChrW(39)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(45)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(109)&ChrW(105)&ChrW(100)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(59)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& getQQFaceDescribe(b) &ChrW(39)&ChrW(62))
next
a=replace(a,ChrW(91)&ChrW(101)&ChrW(109)&ChrW(95)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(93),ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(39)&ChrW(47)&ChrW(107)&ChrW(102)&ChrW(47)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(113)&ChrW(113)&ChrW(102)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(47)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(46)&ChrW(112)&ChrW(110)&ChrW(103)&ChrW(39)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(45)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(109)&ChrW(105)&ChrW(100)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(59)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(39)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(36190)&ChrW(39)&ChrW(62))
handleBodyQQFace=a
end function
function getQQFaceDescribe(a)
dim b
b=split(ChrW(24494)&ChrW(31505)&ChrW(65292)&ChrW(25735)&ChrW(22068)&ChrW(65292)&ChrW(33394)&ChrW(65292)&ChrW(21457)&ChrW(21574)&ChrW(65292)&ChrW(24471)&ChrW(24847)&ChrW(65292)&ChrW(27969)&ChrW(27882)&ChrW(65292)&ChrW(23475)&ChrW(32670)&ChrW(65292)&ChrW(38381)&ChrW(22068)&ChrW(65292)&ChrW(30561)&ChrW(65292)&ChrW(22823)&ChrW(21741)&ChrW(65292)&ChrW(23604)&ChrW(23596)&ChrW(65292)&ChrW(21457)&ChrW(24594)&ChrW(65292)&ChrW(35843)&ChrW(30382)&ChrW(65292)&ChrW(21618)&ChrW(29273)&ChrW(65292)&ChrW(24778)&ChrW(35766)&ChrW(65292)&ChrW(38590)&ChrW(36807)&ChrW(65292)&ChrW(37239)&ChrW(65292)&ChrW(20919)&ChrW(27735)&ChrW(65292)&ChrW(25235)&ChrW(29378)&ChrW(65292)&ChrW(21520)&ChrW(65292)&ChrW(20599)&ChrW(31505)&ChrW(65292)&ChrW(21487)&ChrW(29233)&ChrW(65292)&ChrW(30333)&ChrW(30524)&ChrW(65292)&ChrW(20658)&ChrW(24930)&ChrW(65292)&ChrW(39269)&ChrW(39295)&ChrW(65292)&ChrW(22256)&ChrW(65292)&ChrW(24778)&ChrW(24656)&ChrW(65292)&ChrW(27969)&ChrW(27735)&ChrW(65292)&ChrW(25000)&ChrW(31505)&ChrW(65292)&ChrW(24736)&ChrW(38386)&ChrW(65292)&ChrW(22859)&ChrW(26007)&ChrW(65292)&ChrW(21650)&ChrW(39554)&ChrW(65292)&ChrW(30097)&ChrW(38382)&ChrW(65292)&ChrW(22040)&ChrW(65292)&ChrW(26197)&ChrW(65292)&ChrW(25240)&ChrW(30952)&ChrW(65292)&ChrW(34928)&ChrW(65292)&ChrW(39607)&ChrW(39621)&ChrW(65292)&ChrW(25970)&ChrW(25171)&ChrW(65292)&ChrW(20877)&ChrW(35265)&ChrW(65292)&ChrW(25830)&ChrW(27735)&ChrW(65292)&ChrW(25248)&ChrW(40763)&ChrW(65292)&ChrW(40723)&ChrW(25484)&ChrW(65292)&ChrW(33261)&ChrW(22823)&ChrW(20102)&ChrW(65292)&ChrW(22351)&ChrW(31505)&ChrW(65292)&ChrW(24038)&ChrW(21756)&ChrW(21756)&ChrW(65292)&ChrW(21491)&ChrW(21756)&ChrW(21756)&ChrW(65292)&ChrW(21704)&ChrW(27424)&ChrW(65292)&ChrW(37145)&ChrW(35270)&ChrW(65292)&ChrW(22996)&ChrW(23624)&ChrW(65292)&ChrW(24555)&ChrW(21741)&ChrW(20102)&ChrW(65292)&ChrW(38452)&ChrW(38505)&ChrW(65292)&ChrW(21491)&ChrW(20146)&ChrW(20146)&ChrW(65292)&ChrW(24038)&ChrW(20146)&ChrW(20146)&ChrW(65292)&ChrW(21523)&ChrW(65292)&ChrW(21487)&ChrW(20278)&ChrW(65292)&ChrW(30504)&ChrW(30524)&ChrW(30555)&ChrW(65292)&ChrW(31505)&ChrW(21741)&ChrW(65292)&ChrW(100)&ChrW(111)&ChrW(103)&ChrW(101)&ChrW(65292)&ChrW(27882)&ChrW(22868)&ChrW(65292)&ChrW(26080)&ChrW(22856)&ChrW(65292)&ChrW(25176)&ChrW(33134)&ChrW(65292)&ChrW(21334)&ChrW(33804)&ChrW(65292)&ChrW(26012)&ChrW(30524)&ChrW(31505)&ChrW(65292)&ChrW(21943)&ChrW(34880)&ChrW(65292)&ChrW(24778)&ChrW(21916)&ChrW(65292)&ChrW(39578)&ChrW(25200)&ChrW(65292)&ChrW(23567)&ChrW(32416)&ChrW(32467)&ChrW(65292)&ChrW(25105)&ChrW(26368)&ChrW(32654)&ChrW(65292)&ChrW(21152)&ChrW(27833)&ChrW(24517)&ChrW(32988)&ChrW(65292)&ChrW(21475)&ChrW(32617)&ChrW(25252)&ChrW(20307)&ChrW(65292)&ChrW(25644)&ChrW(30742)&ChrW(20013),ChrW(65292))
if ubound(b) >=a-1 then
getQQFaceDescribe=b(a-1)
else
getQQFaceDescribe=ChrW(26080)
end if
end function
%>   
