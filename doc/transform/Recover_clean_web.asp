<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../../inc/config.asp"--><%

call recover_clean_web()
function recover_clean_web()
dim a,b,c,d,e,f,g,h
f=0
g=0

a=split(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(44)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(44)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(116)&ChrW(44)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(44)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(44)&ChrW(111)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(44)&ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(98)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(44)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108),ChrW(44))
for each d in a
if d <>"" then
b=ChrW(47) & d &ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
if checkFile(b) then
call deleteFile(b)
call echoB(ChrW(21024)&ChrW(38500)&ChrW(25991)&ChrW(20214)&ChrW(25104)&ChrW(21151),b)
f=f+1
else
call echoRed(ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312),b)
end if
doevents
end if
next
b=ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(47)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
call copyFile(b,ChrW(47)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112))

a=split(ChrW(99)&ChrW(110)&ChrW(44)&ChrW(102)&ChrW(116)&ChrW(44)&ChrW(101)&ChrW(110)&ChrW(44)&ChrW(116)&ChrW(112)&ChrW(108),ChrW(44))
for each d in a
if d <>"" then
c=ChrW(47) & d
if checkFolder(c) then
call deleteFolder(c)
call echoB(ChrW(21024)&ChrW(38500)&ChrW(30446)&ChrW(24405)&ChrW(25104)&ChrW(21151),c)
g=g+1
else
call echoRed(ChrW(30446)&ChrW(24405)&ChrW(19981)&ChrW(23384)&ChrW(22312),c)
end if
doevents
end if
next

e=getDirHtmlList(ChrW(47)) 
a=split(e,vbcrlf)
for each b in a
if b <>"" then
if checkFile(b) then
call deleteFile(b)
call echoB(ChrW(21024)&ChrW(38500)&ChrW(25991)&ChrW(20214)&ChrW(25104)&ChrW(21151),b)
f=f+1
else
call echoRed(ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312),b)
end if
doevents
end if
next

b=ChrW(47)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)
if checkFile(b) then
call deleteFile(b)
call echoB(ChrW(21024)&ChrW(38500)&ChrW(25991)&ChrW(20214)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108),b)
f=f+1
end if

b=ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98)
h=ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(95)&format_Time(now(),6)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98)
if checkFile(b) then

call moveFile(b,h)
call echoB(ChrW(31227)&ChrW(21160)&ChrW(25991)&ChrW(20214)&ChrW(25104)&ChrW(21151),b & ChrW(32)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(32) & h)
f=f+1
else
call echoRed(ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312),b)
end if
call echo(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(30446)&ChrW(24405)&g&ChrW(20010)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(25991)&ChrW(20214)&f&ChrW(20010),ChrW(39029)&ChrW(38754)&ChrW(25191)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(32) & getTimerSet() &ChrW(32)&ChrW(31186))
end function
%>