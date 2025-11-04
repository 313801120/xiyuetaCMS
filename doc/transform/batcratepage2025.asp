<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../../inc/config.asp"-->
<%

dim idList,splstr,id,i,url,s
idList=request(ChrW(105)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))
splstr=split(idList,ChrW(44))
i=0
for each id in splstr
if id <>"" then
i=i+1
call echo(ChrW(105),i)
call echo(ChrW(105)&ChrW(100),id)
url=ChrW(97)&ChrW(115)&ChrW(112)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(105)&ChrW(100)&ChrW(61)&id 
s=ChrW(60)&ChrW(105)&ChrW(102)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(39)&url&ChrW(39)&ChrW(32)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(61)&ChrW(39)&ChrW(49)&ChrW(48)&ChrW(48)&ChrW(37)&ChrW(39)&ChrW(32)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(49)&ChrW(48)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(39)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(39)&ChrW(49)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(102)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(62)
call echo(url,s)
call hr()
end if
next
%>