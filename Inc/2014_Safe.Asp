<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 




function isSelfRefer()
dim a, b 
a = cStr(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(82))) 
b = cStr(request.serverVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69))) 
if mid(a, 8, len(b)) = b then
isSelfRefer = true 
else
isSelfRefer = false 
end if 
end function 



function isSafeStr(a)
dim b, c, d 
b = ChrW(39)&ChrW(32)&ChrW(12288)&ChrW(38)&ChrW(60)&ChrW(62)&ChrW(63)&ChrW(37)&ChrW(44)&ChrW(59)&ChrW(58)&ChrW(40)&ChrW(41)&ChrW(96)&ChrW(126)&ChrW(33)&ChrW(64)&ChrW(35)&ChrW(36)&ChrW(94)&ChrW(42)&ChrW(123)&ChrW(125)&ChrW(91)&ChrW(93)&ChrW(124)&ChrW(43)&ChrW(45)&ChrW(61) & chr(34) & chr(9) & chr(32) 
c = len(b) 
isSafeStr = true 
for d = 1 to c
if instr(a, mid(b, d, 1)) > 0 then
isSafeStr = false 
exit function 
end if 
next 
end function 
%>  
