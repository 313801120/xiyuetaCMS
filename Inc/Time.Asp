<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


Function getDaysInMonth(a)
Dim b, c
dim d,e
d = Year(a)
e = Month(a)
b = DateSerial(d, e, 1)
c = DateSerial(d, e + 1, 0)
getDaysInMonth = Day(c)
End function

function getWeekDayNumber(a)
dim b
b = Weekday(a)  
Select case b  
Case 1  
b = 7
Case 2  
b = 1
Case 3  
b = 2
Case 4  
b = 3
Case 5  
b = 4
Case 6  
b = 5
Case 7  
b = 6
Case else  

b = -1
End select  
getWeekDayNumber=b
end function

function getFormatYMD(a, b)

getFormatYMD = dateDiff(b, a, now())   
end function

function getHandleHowLongAgoTime(a)
dim b, c, d, e, f, g, h
b = DateDiff(ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121), a, Now())
c = DateDiff(ChrW(109), a, Now())
d = DateDiff(ChrW(100), a, Now())
e = DateDiff(ChrW(104), a, Now())
f = DateDiff(ChrW(110), a, Now())
g = DateDiff(ChrW(115), a, Now())
if DateAdd(ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121), b, a) > Now() then
b = b - 1
elseif DateAdd(ChrW(109), c, a) > Now() then
c = c - 1
elseif DateAdd(ChrW(100), d, a) > Now() then
d = d - 1
elseif DateAdd(ChrW(104), e, a) > Now() then
e = e - 1
end if
if b > 0 then
h = b & ChrW(24180)&ChrW(21069)
elseif c > 0 then
h = c & ChrW(20010)&ChrW(26376)&ChrW(21069)
elseif d > 0 then
h = d & ChrW(22825)&ChrW(21069)
elseif e > 0 then
h = e & ChrW(23567)&ChrW(26102)&ChrW(21069)
elseif f > 0 then
h = f & ChrW(20998)&ChrW(38047)&ChrW(21069)
else
if g < 60 then
if g < 2 then
h = ChrW(21018)&ChrW(21018)
else
h = g & ChrW(31186)&ChrW(21069)
end if
end if
end if
getHandleHowLongAgoTime = h 
end function

function getHandleTimeToDAy(a)
dim b,c,d,e,f
b=dateDiff(ChrW(100), a, now())  
c=dateDiff(ChrW(104), a, now())  
d=dateDiff(ChrW(110), a, now())
e=dateDiff(ChrW(115), a, now())
if b>0 then
f=b & ChrW(22825)&ChrW(21069)
if b>30 then
f=format_Time(a,2)
end if
elseif c>0 then
f=c & ChrW(23567)&ChrW(26102)&ChrW(21069)
elseif d>0 then
f=d & ChrW(20998)&ChrW(38047)&ChrW(21069)
else
f=e & ChrW(31186)&ChrW(21069)
end if
getHandleTimeToDAy=f 
end function

function format_Time(a, b)
dim c, d, e, f, g, h ,i,j
if isDate(a) = false then exit function 
a = CDate(a)
c = CStr(year(a)) 
d = CStr(month(a))  
if len(d) = 1 then d = ChrW(48) & d 
e = CStr(day(a))

j=fix(day(a)/7)
if day(a) mod 7>0 then
j=j+1
end if
if len(e) = 1 then e = ChrW(48) & e 
f = CStr(hour(a))  
if len(f) = 1 then f = ChrW(48) & f 
g = CStr(minute(a)) 
if len(g) = 1 then g = ChrW(48) & g 
h = CStr(second(a)) 
if len(h) = 1 then h = ChrW(48) & h
select case b
case 1:

i = c & ChrW(45) & d & ChrW(45) & e & ChrW(32) & f & ChrW(58) & g & ChrW(58) & h 
case 2:

i = c & ChrW(45) & d & ChrW(45) & e 
case 3:

i = f & ChrW(58) & g & ChrW(58) & h 
case 4:

i = c & ChrW(24180) & d & ChrW(26376) & e & ChrW(26085) 
case 5:

i = c & d & e 
case 6:

i = c & d & e & f & g & h 
case 7:

i = d & ChrW(45) & e 
case 8:

i = c & ChrW(24180) & d & ChrW(26376) & e & ChrW(26085) & ChrW(32) & f & ChrW(58) & g & ChrW(58) & h 
case 9:

i = c & ChrW(24180) & d & ChrW(26376) & e & ChrW(26085) & ChrW(32) & f & ChrW(26102) & g & ChrW(20998) & h & ChrW(31186)&ChrW(65292) & getDayStatus(f, 1) 
case 10:

i = c & ChrW(24180) & d & ChrW(26376) & e & ChrW(26085) & f & ChrW(26102) 
case 11:

i = c & ChrW(24180) & d & ChrW(26376) & e & ChrW(26085) & ChrW(32) & f & ChrW(26102) & g & ChrW(20998) & h & ChrW(31186) 
case 12:

i = c & ChrW(24180) & d & ChrW(26376) & e & ChrW(26085) & ChrW(32) & f & ChrW(26102) & g & ChrW(20998) 
case 13:

i = d & ChrW(26376) & e & ChrW(26085) & ChrW(32) & f & ChrW(58) & g & ChrW(32) & getDayStatus(f, 0) 
case 14:

i = c & ChrW(47) & d & ChrW(47) & e 
case 15:

i = c & ChrW(24180) & d & ChrW(26376)&ChrW(32)&ChrW(31532) & j & ChrW(21608) 
case 16:

i =  d & ChrW(26376) & e & ChrW(26085) 
case 17:

i = f & ChrW(58) & g
case 18:
i = d & ChrW(45) & e & ChrW(32) & ChrW(32) & f & ChrW(58) & g 
case 19:
i =f & ChrW(26102) & g & ChrW(20998) & h & ChrW(31186) 
case 20:

i = c & ChrW(47) & d & ChrW(47) & e & ChrW(32) & f & ChrW(58) & g & ChrW(58) & h 
case 30:

i = c & ChrW(45) & d
case 88: 
i = e
case 89: 
i = d     
case 120:
select case d
case ChrW(48)&ChrW(49):i=ChrW(74)&ChrW(97)&ChrW(110)&ChrW(117)&ChrW(114)&ChrW(97)&ChrW(114)&ChrW(121)
case ChrW(48)&ChrW(50):i=ChrW(70)&ChrW(101)&ChrW(98)&ChrW(114)&ChrW(117)&ChrW(97)&ChrW(114)&ChrW(121)
case ChrW(48)&ChrW(51):i=ChrW(77)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)
case ChrW(48)&ChrW(52):i=ChrW(65)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(108)
case ChrW(48)&ChrW(53):i=ChrW(77)&ChrW(97)&ChrW(121)
case ChrW(48)&ChrW(54):i=ChrW(74)&ChrW(117)&ChrW(110)&ChrW(101)
case ChrW(48)&ChrW(55):i=ChrW(74)&ChrW(117)&ChrW(108)&ChrW(121)
case ChrW(48)&ChrW(56):i=ChrW(65)&ChrW(117)&ChrW(103)&ChrW(117)&ChrW(115)&ChrW(116)
case ChrW(48)&ChrW(57):i=ChrW(83)&ChrW(101)&ChrW(112)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)
case ChrW(49)&ChrW(48):i=ChrW(79)&ChrW(99)&ChrW(116)&ChrW(111)&ChrW(98)&ChrW(101)&ChrW(114)
case ChrW(49)&ChrW(49):i=ChrW(78)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)
case ChrW(49)&ChrW(50):i=ChrW(68)&ChrW(101)&ChrW(99)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)
end select  
end select
format_Time=i
end function

function handleStrToHM(a)
dim b,c,d,e
b=phptrim(a)
if instr(b,ChrW(32))>0 then
c=split(b,ChrW(32))
b=c(1)
end if
if instr(b,ChrW(58))>0 then
c=split(b,ChrW(58))
b=c(0) & ChrW(58) & c(1)
handleStrToHM=b
end if
end function

function getWeekDay(a, b)
dim c
b=cstr(b)
c=weekday(a)-1
if b=ChrW(49) then
c=ChrW(26143)&ChrW(26399) & replace(replace(replace(replace(replace(replace(replace(c,ChrW(49),ChrW(19968)),ChrW(50),ChrW(20108)),ChrW(51),ChrW(19977)),ChrW(52),ChrW(22235)),ChrW(53),ChrW(20116)),ChrW(54),ChrW(20845)),ChrW(48),ChrW(22825))
end if
getWeekDay=c
end function

function getHandleDate(a)




getHandleDate=dateAdd(ChrW(100),a,now())
end function 

function getDayStatus(a, b)
dim c,d
if left(a, 1) = ChrW(48) then
a = right(a, 1) 
end if 
d = CInt(a) 
if d >= 0 and d <= 5 then
c = ChrW(20940)&ChrW(26216) 
elseIf d >= 6 and d <= 8 then
c = ChrW(26089)&ChrW(19978) 
elseIf d >= 9 and d <= 12 then
c = ChrW(19978)&ChrW(21320) 
elseIf d >= 13 and d <= 18 then
c = ChrW(19979)&ChrW(21320) 
elseIf d >= 19 and d <= 24 then
c = ChrW(26202)&ChrW(19978) 
else
c = ChrW(28145)&ChrW(22812) 
end if 
if b = 1 then c = ChrW(60)&ChrW(98)&ChrW(62) & c & ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62) 
getDayStatus = c 
end function 

function printTimeValue(byval a) 
dim b, c, d 
b=a
if a >= 86400*366 then
d = a mod 86400*366 
a = fix(a / 60 / 60 / 24 /366)
c = c & a & ChrW(24180) 
a = d 
end if
if a >= 86400 then
d = a mod 86400 
a = fix(a / 60 / 60 / 24)
c = c & a & ChrW(22825) 
a = d 
end if  
if a >= 3600 then
d = a mod 3600 
a = fix(a / 60 / 60) 
c = c & a & ChrW(23567)&ChrW(26102) 
a = d 
end if 
if a >= 60 then
d = a mod 60 
a = fix(a / 60) 
c = c & a & ChrW(20998) 
a = d 
end if 
if a > 0 then
c = c & a & ChrW(31186) 
end if
if c="" then
c=ChrW(48)&ChrW(31186)
end if
printTimeValue = c 
end function 

function printAskTime(a)
on error resume next 
dim  b, c  
if a >= 3600 then 
c = a mod 3600 
a = fix(a / 60 / 60) 
b = b & a & ChrW(23567)&ChrW(26102) 
a = c 
printAskTime = b : exit function
end if 
if a >= 60 then
c = a mod 60 
a = fix(a / 60) 
b = b & a & ChrW(20998)&ChrW(38047) 
a = c 
printAskTime = b : exit function 
end if 
if a >= 0 then
b = b & a & ChrW(31186)&ChrW(38047)  
printAskTime = b : exit function 
end if    
end function  

function getTimerSet()
getTimerSet = calculationTimer(pubTimer,now)
end function  

function calculationTimer(a,b)
dim c 


calculationTimer=dateDiff(ChrW(115), a,b) 
end function  

function getTimer()
getTimer = ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(39029)&ChrW(38754)&ChrW(25191)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(65306) & getTimerSet() & ChrW(32)&ChrW(31186) 
end function 

function getTimerDetail()
getTimerDetail = ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(39029)&ChrW(38754)&ChrW(25191)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(65306) & getTimerSet() & ChrW(32)&ChrW(31186)&ChrW(32)&(formatNumber((timer() - pubTimer) * 1000, 2, - 1) / 1000 )
end function 

function vbGetTimer()
VBGetTimer = vbCrLf & ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45) & vbCrLf & ChrW(36816)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(65306) & calculationTimer(pubTimer,now())
end function 

function vbEchoTimer()
VBEchoTimer = ChrW(36816)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(65306) & calculationTimer(pubTimer,now()) & ChrW(32)&ChrW(31186)
end function 

function vbRunTimer(a)
VBRunTimer = ChrW(36816)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(65306) & calculationTimer(a, now()) & ChrW(32)&ChrW(31186)
end function

function sAddTime(a,b,c)
dim d

if b=ChrW(115) then
d=a+0.00001*c

elseif b=ChrW(110) then
d=a+0.00060*c

elseif b=ChrW(104) then
d=a+0.00001*c*60*60

elseif b=ChrW(100) then
d=a+0.00001*c*60*60*24

elseif b=ChrW(119) then
d=a+0.00001*c*60*60*24*7

elseif b=ChrW(109) then
d=a+0.00001*c*60*60*24*30

elseif b=ChrW(113) then
d=a+0.00001*c*60*60*24*120

elseif b=ChrW(121) then
d=a+0.00001*c*60*60*24*366
end if
sAddTime=d
end function

function numberToTime(a)
dim b,c,d,e
b=getNumberGroup(a)
if b <>"" then
b=cint(b)
c=cint(b/60)
if c<10 then
c=ChrW(48) & c
end if
d=(b mod 60)
if d<10 then
d=ChrW(48)&d
end if
e=c & ChrW(58) & d
end if
numberToTime=e
end function








Function secToTime(a)
Dim b, c, d
Dim e

If IsNumeric(a) Then
e = CLng(a)
Else
e = 0
End if

b = Int(e / 3600)



c = Int((e Mod 3600) / 60)


d = e Mod 60




secToTime = b & ChrW(58) & _
Right(ChrW(48) & c, 2) & ChrW(58) & _
Right(ChrW(48) & d, 2)
End function

Function toUnixTime(a, b)
If IsEmpty(a) or Not IsDate(a) Then a = Now
If IsEmpty(b) or Not isNumeric(b) Then b = 0
toUnixTime = DateAdd(ChrW(104),-b,a)
toUnixTime = DateDiff(ChrW(115),ChrW(49)&ChrW(57)&ChrW(55)&ChrW(48)&ChrW(45)&ChrW(48)&ChrW(49)&ChrW(45)&ChrW(48)&ChrW(49)&ChrW(32)&ChrW(48)&ChrW(48)&ChrW(58)&ChrW(48)&ChrW(48)&ChrW(58)&ChrW(48)&ChrW(48), toUnixTime)
End function

Function fromUnixTime(a, b)
a=left(a,10)
If IsEmpty(a) or Not IsNumeric(a) Then
fromUnixTime = Now()
Exit function
End if         
If IsEmpty(a) or Not IsNumeric(b) Then b = 0
fromUnixTime = DateAdd(ChrW(115), a, ChrW(49)&ChrW(57)&ChrW(55)&ChrW(48)&ChrW(45)&ChrW(48)&ChrW(49)&ChrW(45)&ChrW(48)&ChrW(49)&ChrW(32)&ChrW(48)&ChrW(48)&ChrW(58)&ChrW(48)&ChrW(48)&ChrW(58)&ChrW(48)&ChrW(48))
fromUnixTime = DateAdd(ChrW(104), b, fromUnixTime)
End function

Function to13UnixTime(a)
to13UnixTime = (a - CDate(ChrW(48)&ChrW(49)&ChrW(47)&ChrW(48)&ChrW(49)&ChrW(47)&ChrW(49)&ChrW(57)&ChrW(55)&ChrW(48)&ChrW(32)&ChrW(48)&ChrW(48)&ChrW(58)&ChrW(48)&ChrW(48)&ChrW(58)&ChrW(48)&ChrW(48))) * 86400000 
End function

Function from13UnixTime(a)
from13UnixTime=DateAdd(ChrW(115), CLng(a / 1000), ChrW(48)&ChrW(49)&ChrW(47)&ChrW(48)&ChrW(49)&ChrW(47)&ChrW(49)&ChrW(57)&ChrW(55)&ChrW(48)&ChrW(32)&ChrW(48)&ChrW(48)&ChrW(58)&ChrW(48)&ChrW(48)&ChrW(58)&ChrW(48)&ChrW(48))
End function

function getHandleTimeToDAy(a)
dim b,c,d,e,f
b=dateDiff(ChrW(100), a, now())  
c=dateDiff(ChrW(104), a, now())  
d=dateDiff(ChrW(110), a, now())
e=dateDiff(ChrW(115), a, now())
if b>0 then
f=b & ChrW(22825)&ChrW(21069)
if b>30 then
f=format_Time(a,2)
end if
elseif c>0 then
f=c & ChrW(23567)&ChrW(26102)&ChrW(21069)
elseif d>0 then
f=d & ChrW(20998)&ChrW(38047)&ChrW(21069)
else
f=e & ChrW(31186)&ChrW(21069)
end if
getHandleTimeToDAy=f 
end function
%>   
