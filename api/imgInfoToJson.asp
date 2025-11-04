<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../inc/config.asp"-->
<%



if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(105)&ChrW(109)&ChrW(103) then
call getImgInfoToJson(request(ChrW(115)&ChrW(114)&ChrW(99)))
end if

sub getImgInfoToJson(a)
dim b,c,d,e,f,g,h,i
Set b = new GPS
if a=ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(49) then
i=ChrW(47)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(47)&ChrW(50)&ChrW(51)&ChrW(48)&ChrW(51)&ChrW(50)&ChrW(48)&ChrW(47)&ChrW(49)&ChrW(46)&ChrW(98)&ChrW(109)&ChrW(112)
elseif a=ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(50) then
i=ChrW(47)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(47)&ChrW(50)&ChrW(51)&ChrW(48)&ChrW(51)&ChrW(50)&ChrW(48)&ChrW(47)&ChrW(50)&ChrW(46)&ChrW(98)&ChrW(109)&ChrW(112) 
else
i=ChrW(47)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(47)&ChrW(50)&ChrW(51)&ChrW(48)&ChrW(51)&ChrW(50)&ChrW(48)&ChrW(47)&ChrW(48)&ChrW(46)&ChrW(98)&ChrW(109)&ChrW(112) 
call saveRemoteFile(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(89)&ChrW(90)&ChrW(77)&ChrW(47)& a &ChrW(63)&ChrW(110)&ChrW(61)&getrnd(6),i)
end if

i=handlePath(i)
if checkfile(i)=false then
g=ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(33719)&ChrW(24471)&ChrW(22270)&ChrW(29255)&ChrW(20449)&ChrW(24687)&ChrW(22833)&ChrW(36133)&ChrW(34)
g=ChrW(34)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& i &ChrW(34)
g=g&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)
call die(ChrW(123)& g &ChrW(125))
end if
f=b.getimagesize(i)
h=imagesToBase64(i)
h=replace(replace(h,chr(10),""),chr(13),"")
g=ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(33719)&ChrW(24471)&ChrW(22270)&ChrW(29255)&ChrW(20449)&ChrW(24687)&ChrW(25104)&ChrW(21151)&ChrW(34)
g=g&ChrW(44)&ChrW(34)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& f(1) &ChrW(34)
g=g&ChrW(44)&ChrW(34)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& f(2) &ChrW(34)
g=g&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& b.getimagetype(i) &ChrW(34)
g=g&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& getFSize(i) &ChrW(34)
g=g&ChrW(44)&ChrW(34)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(54)&ChrW(52)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& h &ChrW(34)

g=g&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)
call die(ChrW(123)& g &ChrW(125))
call die(b.getimagesize(handlePath(ChrW(49)&ChrW(46)&ChrW(98)&ChrW(109)&ChrW(112)))(1))
end sub
%>