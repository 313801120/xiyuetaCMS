<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../inc/config.asp"-->
<%

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) then
call handleUpfileClipboardImg(request(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)))
end if
function handleUpfileClipboardImg(a)
dim b,c,d,e
d=ChrW(106)&ChrW(112)&ChrW(103)
if left(a,11)=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(58)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47) then
b=instr(a,ChrW(59))
if b>0 then
d=lcase(mid(a,12,b-12))
if instr(ChrW(124)&ChrW(106)&ChrW(112)&ChrW(103)&ChrW(124)&ChrW(103)&ChrW(105)&ChrW(102)&ChrW(124)&ChrW(98)&ChrW(109)&ChrW(112)&ChrW(124)&ChrW(112)&ChrW(110)&ChrW(103)&ChrW(124)&ChrW(106)&ChrW(112)&ChrW(101)&ChrW(103)&ChrW(124),d)=false then
d=ChrW(106)&ChrW(112)&ChrW(103)
end if
end if
b=instr(a,ChrW(59)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52)&ChrW(44))
if b>0 then
a=mid(a,b+8)
e=format_Time(now(),6) & ChrW(46) & d
c=ChrW(47)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(47) & e
call base64ToImages(c,a)
end if
end if


call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(19978)&ChrW(20256)&ChrW(22270)&ChrW(29255)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(47) & e &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end function
%>
