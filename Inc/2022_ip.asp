<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><script language="javascript" runat="server">
function ipToNumber(ip) { 
var num = 0; 
if(ip == "") { 
return num; 
}   
var aNum = ip.split(".");  
if(aNum.length != 4) { 
return num; 
}   
num += parseInt(aNum[0]) << 24; 
num += parseInt(aNum[1]) << 16; 
num += parseInt(aNum[2]) << 8; 
num += parseInt(aNum[3]) << 0; 
num = num >>> 0;//这个很关键，不然可能会出现负数的情况 
return num;  
}   
function numberToIp(number) {   
var ip = ""; 
if(number <= 0) { 
return ip; 
} 
var ip3 = (number << 0 ) >>> 24; 
var ip2 = (number << 8 ) >>> 24; 
var ip1 = (number << 16) >>> 24; 
var ip0 = (number << 24) >>> 24 
ip += ip3 + "." + ip2 + "." + ip1 + "." + ip0; 
return ip;   
}
</script>
<% 
function getIpToAddr(a)
getIpToAddr = ipToAddr2022(a, "") 
end function

function ipToAddr2022(a, b)
dim c, d, e, f, g, h, i, j, k, l 
dim m, n, o, p, q, r, s, t, u,v
dim w : w = false 
b = trim(cstr(b & ""))
if isNul(a) then ipToAddr2022 = "" : exit function
v=ChrW(68)&ChrW(58)&ChrW(92)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(107)&ChrW(92)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(92)
if checkFolder(v)=false then
v=ChrW(47)
call createFolder(ChrW(47)&ChrW(105)&ChrW(112))
call createFolder(ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
call createFolder(ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(116)&ChrW(120)&ChrW(116))
if w then call echo(ChrW(30446)&ChrW(24405),ChrW(19981)&ChrW(23384)&ChrW(22312))
else
if w then call echo(ChrW(25552)&ChrW(31034),ChrW(26681)&ChrW(30446)&ChrW(24405)&ChrW(23384)&ChrW(22312) & v):doevents
end if
a = a & "" 
a = trim(a) 
if a = "" then
ipToAddr2022 = "" 
exit function 



elseif left(a, 8) = ChrW(49)&ChrW(57)&ChrW(50)&ChrW(46)&ChrW(49)&ChrW(54)&ChrW(56)&ChrW(46) then
ipToAddr2022 = ChrW(23616)&ChrW(22495)&ChrW(32593)&ChrW(73)&ChrW(80) 
exit function 
end if 
d = split(a, ChrW(46)) 
if uBound(d) < 3 then ipToAddr2022 = "" : exit function 
i = ipToNumber(a)

if i >= 2130706432 and i <= 2147483647 then
ipToAddr2022 = ChrW(20445)&ChrW(30041)&ChrW(22320)&ChrW(22336) 
exit function 
end if 
dim x,y,z,a1,a2
set x = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
set y = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
set z = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116)) 
dim a3,a4
a3=ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if checkFile(a3) then 
dim a5,a6,a7,a8
a2=readfile(a3,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
a1=split(a2&ChrW(44)&ChrW(44)&ChrW(44),ChrW(44))
if w then call echo(ChrW(25552)&ChrW(31034),ChrW(20351)&ChrW(29992)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(25968)&ChrW(25454)&ChrW(24211)) 
a5=a1(0)
a6=a1(1)
a7=a1(2)
a8=a1(3)
a4=ChrW(105)&ChrW(112)
if a5="" then a5 = ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(104)&ChrW(111)&ChrW(115)&ChrW(116) 
if a6=""  then a6=ChrW(115)&ChrW(97)
if a8="" then a8=ChrW(49)&ChrW(52)&ChrW(51)&ChrW(51)
l = ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a6&ChrW(59)&ChrW(32)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(61)&a7&ChrW(59)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(32)&ChrW(67)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(32)&ChrW(61)&ChrW(105)&ChrW(112)&ChrW(59)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(32)&ChrW(61) & a5 & ChrW(44)&a8&ChrW(59)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(98)&ChrW(59)
if checkSqlServer(l) = false then
call eerr(ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(38142)&ChrW(25509)&ChrW(20986)&ChrW(38169), l) 
end if 
set x = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
x.open l 
else
call selectOpenConn(x)
a4=db_PREFIX & ChrW(105)&ChrW(112)
if w then call echo(ChrW(25552)&ChrW(31034),ChrW(20351)&ChrW(29992)&ChrW(24403)&ChrW(21069)&ChrW(25968)&ChrW(25454)&ChrW(24211))
end if 
k = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&a4&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & i & ChrW(62)&ChrW(61)&ChrW(91)&ChrW(98)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32) & i & ChrW(60)&ChrW(61)&ChrW(91)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(93) 
if w then call echo(ChrW(115)&ChrW(113)&ChrW(108),k):doevents
y.open k, x, 1, 1 
j = false 
if not y.eof then
j = true 
else
if w then call echo(ChrW(25552)&ChrW(31034),ChrW(27809)&ChrW(26377)&ChrW(35760)&ChrW(24405))

dim a9, a10, a11, a12 
a12 = false 
h = v & ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47) & a & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116) 

if checkFile(h) then
e = readfile(h, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 


elseif pubIsDownIPJson = false then
ipToAddr2022 = look_ip(a)
exit function 
else
a9 = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)&ChrW(105)&ChrW(112)&ChrW(49)&ChrW(51)&ChrW(56)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(47)&ChrW(105)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(117)&ChrW(112)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(105)&ChrW(112)&ChrW(61) & a & ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&ChrW(50) 
a10 = v & ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(47) & a & ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) 
if checkFile(a10) = false then
call saveRemoteFile_WinHttp(a9, a10, a9) 

end if 
a11 = readfile(a10, ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)) 
e = strCut(a11, ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(95)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(32), ChrW(125)&ChrW(59), 0) 
if e <> "" then e = e & ChrW(125) 
end if 
dim a13, a14, a15, a16, a17, a18, a19, a20, a21 

if e = "" then
ipToAddr2022 = look_ip(a) 
if w then call echo(ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(20026)&ChrW(31354),ChrW(36864)&ChrW(20986)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) & h)
exit function 
end if 
if w then call echo(ChrW(25552)&ChrW(31034),ChrW(27491)&ChrW(24120)) 
if w then call echo(ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(83)&ChrW(116)&ChrW(114), e) : doevents 
set a14 = new aspJSON
a14.loadjson(e) 

if checkFile(v&ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47) & a & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)) = false then
call writeToFile(v&ChrW(47)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47) & a & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116), e, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
end if 
for each r in a14.data(ChrW(105)&ChrW(112)&ChrW(95)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))

m = a14.data(ChrW(105)&ChrW(112)&ChrW(95)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))(r)(ChrW(99)&ChrW(116)) 
n = a14.data(ChrW(105)&ChrW(112)&ChrW(95)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))(r)(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)) 
o = a14.data(ChrW(105)&ChrW(112)&ChrW(95)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))(r)(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121)) 
s = a14.data(ChrW(105)&ChrW(112)&ChrW(95)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))(r)(ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97))
t = a14.data(ChrW(105)&ChrW(112)&ChrW(95)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))(r)(ChrW(121)&ChrW(117)&ChrW(110)&ChrW(121)&ChrW(105)&ChrW(110))
u = a14.data(ChrW(105)&ChrW(112)&ChrW(95)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))(r)(ChrW(110)&ChrW(101)&ChrW(116))
p = a14.data(ChrW(105)&ChrW(112)&ChrW(95)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))(r)(ChrW(98)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(110)) 
q = a14.data(ChrW(105)&ChrW(112)&ChrW(95)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))(r)(ChrW(101)&ChrW(110)&ChrW(100)) 







z.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&a4&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & p & ChrW(62)&ChrW(61)&ChrW(91)&ChrW(98)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32) & q & ChrW(60)&ChrW(61)&ChrW(91)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(93), x, 1, 3
if z.eof then
if w then call echo(ChrW(98)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(110),p):doevents
z.addnew 
z(ChrW(98)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(110)) = p 
z(ChrW(101)&ChrW(110)&ChrW(100)) = q 
z(ChrW(99)&ChrW(116)) = m 
z(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)) = n 
z(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121)) = o 
z(ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)) = s 
z(ChrW(121)&ChrW(117)&ChrW(110)&ChrW(121)&ChrW(105)&ChrW(110)) = t 
z(ChrW(110)&ChrW(101)&ChrW(116)) = u 
z.update 
if w then call echo(ChrW(25552)&ChrW(31034), ChrW(28155)&ChrW(21152)) 
end if : z.close 
next 
end if

if j = false then
y.close 
k = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&a4&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) & i & ChrW(62)&ChrW(61)&ChrW(91)&ChrW(98)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32) & i & ChrW(60)&ChrW(61)&ChrW(91)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(93) 

y.open k, x, 1, 1 
end if 
if not y.eof then
if b = ChrW(99)&ChrW(116) then
ipToAddr2022 = y(ChrW(99)&ChrW(116)) 
elseif b = ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118) then
ipToAddr2022 = y(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)) 
elseif b = ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121) then
ipToAddr2022 = y(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121)) 
elseif b = ChrW(51) then
ipToAddr2022 = y(ChrW(99)&ChrW(116)) & y(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)) & y(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121)) 
elseif b = ChrW(97)&ChrW(108)&ChrW(108) then
ipToAddr2022 = y(ChrW(99)&ChrW(116)) & ChrW(32) & y(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)) & ChrW(32) & y(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121)) & ChrW(32) & y(ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)) & ChrW(32) & y(ChrW(121)&ChrW(117)&ChrW(110)&ChrW(121)&ChrW(105)&ChrW(110)) & ChrW(32) & y(ChrW(110)&ChrW(101)&ChrW(116)) 
else
ipToAddr2022 = y(ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)) & y(ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121))

if y(ChrW(99)&ChrW(116)) <> ChrW(20013)&ChrW(22269) then
ipToAddr2022 = y(ChrW(99)&ChrW(116)) & ipToAddr2022 
end if 
end if 
ipToAddr2022 = ipToAddr2022 
end if 
y.close 
set y = nothing 
set x = nothing 
end function
%>  