<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%

function cssCompression(a, b) 

if b = 1 then
a = regExp_Replace(a, ChrW(92)&ChrW(47)&ChrW(92)&ChrW(42)&ChrW(40)&ChrW(46)&ChrW(124) & vbCrLf & ChrW(41)&ChrW(42)&ChrW(63)&ChrW(92)&ChrW(42)&ChrW(92)&ChrW(47), "") 
a = regExp_Replace(a, ChrW(92)&ChrW(115)&ChrW(42)&ChrW(40)&ChrW(91)&ChrW(92)&ChrW(123)&ChrW(92)&ChrW(125)&ChrW(92)&ChrW(58)&ChrW(92)&ChrW(59)&ChrW(92)&ChrW(44)&ChrW(93)&ChrW(41)&ChrW(92)&ChrW(115)&ChrW(42), ChrW(36)&ChrW(49)) 
a = regExp_Replace(a, ChrW(92)&ChrW(44)&ChrW(91)&ChrW(92)&ChrW(115)&ChrW(92)&ChrW(46)&ChrW(92)&ChrW(35)&ChrW(92)&ChrW(100)&ChrW(93)&ChrW(42)&ChrW(92)&ChrW(123), ChrW(123)) 
a = regExp_Replace(a, ChrW(59)&ChrW(92)&ChrW(115)&ChrW(42)&ChrW(59), ChrW(59)) 

else
if b >= 2 then
a = regExp_Replace(a, ChrW(92)&ChrW(47)&ChrW(92)&ChrW(42)&ChrW(40)&ChrW(46)&ChrW(124) & vbCrLf & ChrW(41)&ChrW(42)&ChrW(63)&ChrW(92)&ChrW(42)&ChrW(92)&ChrW(47), "")
end if 
a = regExp_Replace(a, ChrW(92)&ChrW(115)&ChrW(42)&ChrW(40)&ChrW(91)&ChrW(92)&ChrW(123)&ChrW(92)&ChrW(125)&ChrW(92)&ChrW(58)&ChrW(92)&ChrW(59)&ChrW(92)&ChrW(44)&ChrW(93)&ChrW(41)&ChrW(92)&ChrW(115)&ChrW(42), ChrW(36)&ChrW(49)) 
a = regExp_Replace(a, ChrW(92)&ChrW(44)&ChrW(91)&ChrW(92)&ChrW(115)&ChrW(92)&ChrW(46)&ChrW(92)&ChrW(35)&ChrW(92)&ChrW(100)&ChrW(93)&ChrW(42)&ChrW(92)&ChrW(123), ChrW(123))
a = regExp_Replace(a, ChrW(59)&ChrW(92)&ChrW(115)&ChrW(42)&ChrW(59), ChrW(59))
a = regExp_Replace(a, ChrW(59)&ChrW(92)&ChrW(115)&ChrW(42)&ChrW(125), ChrW(125))
a = regExp_Replace(a, ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(115)&ChrW(93)&ChrW(41)&ChrW(92)&ChrW(123)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(115)&ChrW(93)&ChrW(41), ChrW(36)&ChrW(49)&ChrW(123)&ChrW(36)&ChrW(50)) 
a = regExp_Replace(a, ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(115)&ChrW(93)&ChrW(41)&ChrW(92)&ChrW(125)&ChrW(40)&ChrW(91)&ChrW(94) & vbCrLf & ChrW(93)&ChrW(115)&ChrW(42)&ChrW(41), ChrW(36)&ChrW(49)&ChrW(125) & vbCrLf & ChrW(36)&ChrW(50)) 
end if 
a = trimVBcrlf(a) 
cssCompression = a 
end function 

function deleteCssNote(a)
deleteCssNote = regExp_Replace(a, ChrW(92)&ChrW(47)&ChrW(92)&ChrW(42)&ChrW(40)&ChrW(46)&ChrW(124) & vbCrLf & ChrW(41)&ChrW(42)&ChrW(63)&ChrW(92)&ChrW(42)&ChrW(92)&ChrW(47), "")
end function 

function unCssCompression(a)
a = regExp_Replace(a, ChrW(92)&ChrW(115)&ChrW(42)&ChrW(40)&ChrW(91)&ChrW(92)&ChrW(123)&ChrW(92)&ChrW(125)&ChrW(92)&ChrW(58)&ChrW(92)&ChrW(59)&ChrW(92)&ChrW(44)&ChrW(93)&ChrW(41)&ChrW(92)&ChrW(115)&ChrW(42), ChrW(36)&ChrW(49)) 
a = regExp_Replace(a, ChrW(59)&ChrW(92)&ChrW(115)&ChrW(42)&ChrW(59), ChrW(59))
a = regExp_Replace(a, ChrW(92)&ChrW(44)&ChrW(91)&ChrW(92)&ChrW(115)&ChrW(92)&ChrW(46)&ChrW(92)&ChrW(35)&ChrW(92)&ChrW(100)&ChrW(93)&ChrW(42)&ChrW(123), ChrW(123)) 
a = regExp_Replace(a, ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(115)&ChrW(93)&ChrW(41)&ChrW(92)&ChrW(123)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(115)&ChrW(93)&ChrW(41), ChrW(36)&ChrW(49)&ChrW(32)&ChrW(123) & vbCrLf & "" & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32) & ChrW(36)&ChrW(50))
a = regExp_Replace(a, ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(115)&ChrW(93)&ChrW(41)&ChrW(92)&ChrW(125)&ChrW(40)&ChrW(91)&ChrW(94) & vbCrLf & ChrW(93)&ChrW(42)&ChrW(41), ChrW(36)&ChrW(49) & vbCrLf & ChrW(125) & vbCrLf & ChrW(36)&ChrW(50)) 
a = regExp_Replace(a, ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(115)&ChrW(93)&ChrW(41)&ChrW(59)&ChrW(40)&ChrW(91)&ChrW(94)&ChrW(92)&ChrW(115)&ChrW(92)&ChrW(125)&ChrW(93)&ChrW(41), ChrW(36)&ChrW(49)&ChrW(59) & vbCrLf & "" & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32) & ChrW(36)&ChrW(50))
unCssCompression = a 
end function

function trimVbCrlf(a)
trimVbCrlf = phpRTrim(phpLTrim(a)) 
end function 

function phpTrim(a)
phpTrim = trimVbCrlf(a) 
end function 

function phpLTrim(byval a)
dim b,c,d,e
if isnul(a) then 
phpLTrim=""
exit function
end if
b = len(a)
c=0
for d=1 to b
e=left(a,1)
if e=ChrW(32) or e=vbTab or e=chr(10) or e=chr(13) then
a=mid(a,2)
elseif e=vbcrlf then
a=mid(a,3)
else
exit for
end if
next  
phpLTrim=a
end function 

function phpRTrim(byval a)
dim b,c,d,e
b = len(a)
c=0
for d=1 to b
e=right(a,1)
if e=ChrW(32) or e=vbTab or e=chr(10) or e=chr(13) then
a=mid(a,1,len(a)-1)
elseif e=vbcrlf then
a=mid(a,1,len(a)-2)
else
exit for
end if
next  
phpRTrim=a
end function 
%>