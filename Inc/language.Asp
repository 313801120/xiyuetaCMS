<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%
dim spl_language,is_languesOK
is_languesOK=false
dim language
language=phptrim(request(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)))

function toLanguage(a)

if language=ChrW(101)&ChrW(110) then
a=languageToEn(a)
elseif language=ChrW(102)&ChrW(116) then
a=jtToft(a)
end if
toLanguage=a
end function

function languageToEn(a)
dim b,c,d
if is_languesOK=false then
b=readfile(ChrW(47)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(47)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(101)&ChrW(110)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
b=replace(replace(b,vbcrlf,chr(10)),chr(13),chr(10))
spl_language=split(b,chr(10))
is_languesOK=true

end if
for each d in spl_language
if instr(d,ChrW(61))>0 then
c=split(d,ChrW(61))

if c(0)=a then
a=c(1) 

exit for
exit function
end if
end if
next 
languageToEn=a
end function
%>   
