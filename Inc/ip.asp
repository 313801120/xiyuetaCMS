<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%
class tqqwry
dim country,localstr,buf,offset
private startip,endip,countryflag
public qqwryfile
public firststartip,laststartip,recordcount
private stream,endipoff
private sub class_initialize
country=""
localstr=""
startip=0
endip=0
countryflag=0
firststartip=0
laststartip=0
endipoff=0 
qqwryfile=server.mappath(ipMDBPath)
end sub
function ipToint(a) 
if instr(a,ChrW(58))>0 then a=ChrW(49)&ChrW(50)&ChrW(55)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(49)
dim b,c
b=split(a,ChrW(46),-1)
for c=0 to 3
if not isnumeric(b(c)) then b(c)=0
if cint(b(c))<0 then b(c)=Abs(cint(b(c)))
if cint(b(c))>255 then b(c)=255
next
ipToint=(cint(b(0))*256*256*256)+(cint(b(1))*256*256)+(cint(b(2))*256)+cint(b(3))
end function
function intToip(a)
p4=a-fix(a/256)*256
a=(a-p4)/256
p3=a-fix(a/256)*256
a=(a-p3)/256
p2=a-fix(a/256)*256
a=(a-p2)/256
p1=a
intToip=cstr(p1)&ChrW(46)&cstr(p2)&ChrW(46)&cstr(p3)&ChrW(46)&cstr(p4)
end function
private function getstartip(a)
offset=firststartip+a*7
stream.position=offset
buf=stream.Read(7)
endipoff=AscB(MidB(buf,5,1))+(AscB(MidB(buf,6,1))*256)+(AscB(MidB(buf,7,1))*256*256)
startip=AscB(MidB(buf,1,1))+(AscB(MidB(buf,2,1))*256)+(AscB(MidB(buf,3,1))*256*256)+(AscB(MidB(buf,4,1))*256*256*256)
getstartip=startip
end function
private function getendip()
stream.position=endipoff
buf=stream.Read(5)
endip=AscB(MidB(buf,1,1))+(AscB(MidB(buf,2,1))*256)+(AscB(MidB(buf,3,1))*256*256)+(AscB(MidB(buf,4,1))*256*256*256)
countryflag=AscB(MidB(buf,5,1))
getendip=endip
end function
private sub Getcountry(a)
if (countryflag=1 or countryflag=2) then
country=getflagstr(endipoff+4)
if countryflag=1 then
localstr=getflagstr(stream.position)

if a >=ipToint(ChrW(50)&ChrW(53)&ChrW(53)&ChrW(46)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(46)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(46)&ChrW(48)) and a <=ipToint(ChrW(50)&ChrW(53)&ChrW(53)&ChrW(46)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(46)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(46)&ChrW(50)&ChrW(53)&ChrW(53)) then
localstr=getflagstr(endipoff+21)
country=getflagstr(endipoff+12)
end if
else
localstr=getflagstr(endipoff + 8)
end if
else
country=getflagstr(endipoff+4)
localstr=getflagstr(stream.position)
end if

country=trim(country)
localstr=trim(localstr)
if instr(country,ChrW(67)&ChrW(90)&ChrW(56)&ChrW(56)&ChrW(46)&ChrW(78)&ChrW(69)&ChrW(84)) then country=ChrW(26412)&ChrW(22320)&ChrW(47)&ChrW(23616)&ChrW(22495)&ChrW(32593)
if instr(localstr,ChrW(67)&ChrW(90)&ChrW(56)&ChrW(56)&ChrW(46)&ChrW(78)&ChrW(69)&ChrW(84)) then localstr=ChrW(26412)&ChrW(22320)&ChrW(47)&ChrW(23616)&ChrW(22495)&ChrW(32593)
end sub
private function getflagstr(a)
dim b
b=0
do while (true)
stream.position=a
b=AscB(stream.Read(1))
if(b=1 or b=2) then
buf=stream.Read(3)
if (b=2) then
countryflag=2
endipoff=a-4
end if
a=AscB(MidB(buf,1,1))+(AscB(MidB(buf,2,1))*256)+(AscB(MidB(buf,3,1))*256*256)
else
exit do
end if
loop
if (a<12) then
getflagstr=""
else
stream.position=a
getflagstr=GetStr()
end if
end function
private function getstr()
dim a
getstr=""
dim b
set b=server.createobject(ChrW(97)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
b.type=1
b.mode=3
b.open
a=stream.read(1)
do while (ascb(a) <>0 and not stream.eos)
b.write a
a=stream.read(1)
loop
b.position=0
b.type=2
b.charset=ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)
getstr=b.readtext
b.close
set b=nothing
end function
public function qqwry(a)
dim b,c
dim d,e,f
b=ipToint(a)
set stream=CreateObject(ChrW(97)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
stream.mode=3
stream.type=1
stream.open
stream.LoadFromFile qqwryfile
stream.position=0
buf=stream.Read(8)
firststartip=AscB(MidB(buf,1,1))+(AscB(MidB(buf,2,1))*256)+(AscB(MidB(buf,3,1))*256*256)+(AscB(MidB(buf,4,1))*256*256*256)
laststartip=AscB(MidB(buf,5,1))+(AscB(MidB(buf,6,1))*256)+(AscB(MidB(buf,7,1))*256*256)+(AscB(MidB(buf,8,1))*256*256*256)
recordcount=int((laststartip-firststartip)/7)

if (recordcount <=1) then
country=ChrW(26410)&ChrW(30693)
qqwry=2
exit function
end if
d=0
e=recordcount
do while (d<(e-1))
f=int((d+e)/2)
call getstartip (f)
if (b=startip) then
d=f
exit do
end if
if (b>startip) then
d=f
else
e=f
end if
loop
call getstartip(d)
call getendip()
if (startip <=b) and (endip >=b) then

c=0
else

c=3
end if
call Getcountry(b)
qqwry=c
end function
private sub Class_Terminate
on error resume next
stream.close
if err then err.clear
set stream=nothing
end sub
end class
public function look_ip(byval a)
if a="" or isNull(a) then
look_ip=""
exit function
end if
dim b,c,d,e
set b=new tqqwry
c=b.qqwry(a) 
look_ip=b.country
set b=nothing
end function
%>