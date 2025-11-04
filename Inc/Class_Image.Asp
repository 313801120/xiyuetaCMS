<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 













class GPS
dim aso 
sub class_Initialize()
set aso = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
aso.mode = 3 
aso.type = 1 
aso.open 
end sub
sub class_Terminate()
set aso = nothing 
end sub 

function getImageWidth(a)
getImageWidth=getImageSize(a)(1)
end function

function getImageHeight(a)
getImageHeight=getImageSize(a)(2)
end function

function getImageSize(a)
dim b, c 
a=handlePath(a)
if checkFile(a) = false or getFSize(a)=0 then exit function
aso.loadFromFile(a) 

dim ret(3) 

b = aso.read(3) 

select case hex(binVal(b))
case ChrW(52)&ChrW(69)&ChrW(53)&ChrW(48)&ChrW(56)&ChrW(57)
aso.read(15) 
ret(0) = ChrW(80)&ChrW(78)&ChrW(71) 
ret(1) = binVal2(aso.read(2)) 
aso.read(2) 
ret(2) = binVal2(aso.read(2)) 
case ChrW(52)&ChrW(54)&ChrW(52)&ChrW(57)&ChrW(52)&ChrW(55)
aso.read(3) 
ret(0) = ChrW(71)&ChrW(73)&ChrW(70) 
ret(1) = binVal(aso.read(2)) 
ret(2) = binVal(aso.read(2)) 
case ChrW(70)&ChrW(70)&ChrW(68)&ChrW(56)&ChrW(70)&ChrW(70)
do
do : c = binVal(aso.read(1)) : loop while c = 255 and not aso.EOS
if c > 191 and c < 196 then exit do else aso.read(binval2(aso.read(2)) - 2) 
do : c = binVal(aso.read(1)) : loop while c < 255 and not aso.EOS 
loop while true 
aso.read(3) 
ret(0) = ChrW(74)&ChrW(80)&ChrW(71) 
ret(2) = binval2(aso.read(2)) 
ret(1) = binval2(aso.read(2)) 
case else
if left(bin2Str(b), 2) = ChrW(66)&ChrW(77) then
aso.read(15) 
ret(0) = ChrW(66)&ChrW(77)&ChrW(80) 
ret(1) = binval(aso.read(4)) 
ret(2) = binval(aso.read(4)) 
else
ret(0) = "" 
end if
end select
ret(3) = ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(61)&ChrW(34) & ret(1) & ChrW(34)&ChrW(32)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(61)&ChrW(34) & ret(2) & ChrW(34) 
getImageSize = ret 
end function 

function getImageType(a)
dim b, c 
if checkFile(a) = false or getFSize(a)=0 then
getImageType=ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312)
exit function
end if
aso.loadFromFile(a) 

dim ret(3) 

b = aso.read(3) 

select case hex(binVal(b))
case ChrW(52)&ChrW(69)&ChrW(53)&ChrW(48)&ChrW(56)&ChrW(57) 
getImageType=ChrW(112)&ChrW(110)&ChrW(103)
exit function
case ChrW(52)&ChrW(54)&ChrW(52)&ChrW(57)&ChrW(52)&ChrW(55)
getImageType=ChrW(103)&ChrW(105)&ChrW(102)
exit function
case ChrW(70)&ChrW(70)&ChrW(68)&ChrW(56)&ChrW(70)&ChrW(70)                
getImageType=ChrW(106)&ChrW(112)&ChrW(103)
exit function
case ChrW(56)&ChrW(56)&ChrW(66)&ChrW(49)&ChrW(70)                
getImageType=ChrW(122)&ChrW(105)&ChrW(112)
exit function
case else
if left(bin2Str(b), 2) = ChrW(66)&ChrW(77) then
getImageType=ChrW(98)&ChrW(109)&ChrW(112)
exit function
elseif left(bin2Str(b), 2) = ChrW(80)&ChrW(75) then
getImageType=ChrW(122)&ChrW(105)&ChrW(112)
exit function
else
getImageType=ChrW(40)& left(bin2Str(b), 2) &ChrW(41)&ChrW(40)& Hex(binVal(b)) &ChrW(41)
exit function
end if
end select
getImageType=ChrW(51)&ChrW(51)
exit function
end function 
end class  
%>   
