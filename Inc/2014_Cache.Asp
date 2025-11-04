<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 

sub noCache()
response.buffer = true 
response.expires = 0 
response.expiresAbsolute = now() - 1 
response.cacheControl = ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101) 
response.addHeader ChrW(69)&ChrW(120)&ChrW(112)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(115), date() 
response.addHeader ChrW(80)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(109)&ChrW(97), ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101) 
response.addHeader ChrW(67)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(45)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108), ChrW(112)&ChrW(114)&ChrW(105)&ChrW(118)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(45)&ChrW(99)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(109)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(45)&ChrW(114)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101) 
end sub 

function XY_clearCache(a)
on error resume next
dim b 
b = lCase(rParam(a, ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101))) 
if b = ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) and handleisCache = false then
call noCache() 
handleisCache = false 
end if 
end function 
%> 
