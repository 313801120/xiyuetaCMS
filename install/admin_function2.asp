<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%  

function callFunction2()
dim a 
a = request(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)) 
if a = ChrW(114)&ChrW(117)&ChrW(110)&ChrW(83)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(85)&ChrW(114)&ChrW(108) then
call runScanWebUrl()
elseif a = ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110) then
call scanCheckDomain()
elseif a = ChrW(98)&ChrW(97)&ChrW(110)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(73)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110) then
call bantchImportDomain()
elseif a = ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101) then
call scanDomainHomePage()
elseif a = ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101) then
call scanDomainHomePageSize()
elseif a = ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(84)&ChrW(114)&ChrW(117)&ChrW(101) then
call isthroughTrue()
elseif a = ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(79)&ChrW(75)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(83)&ChrW(105)&ChrW(116)&ChrW(101) then
call printOKWebSite()
elseif a = ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(83)&ChrW(105)&ChrW(116)&ChrW(101) then
call printAspServerWebSite()
elseif a = ChrW(99)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97) then
call fun2_clearAllData()
elseif a = ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(50)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116) then
call function2test()
else 
call eerr(ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(50)&ChrW(39029)&ChrW(37324)&ChrW(27809)&ChrW(26377)&ChrW(21160)&ChrW(20316), request(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)))
end if 
end function

function function2test()
Call openconn()     

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(61)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101), conn, 1, 1
call echo(ChrW(20849),rs.recordcount)
While Not rs.EOF
call echo(rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)),rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)))
rs.movenext:wend:rs.close

end function

function fun2_clearAllData()
Call openconn() 
conn.Execute(ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)) 
Call echo(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(38)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(32593)&ChrW(31449)&ChrW(22495)&ChrW(21517)&ChrW(39)&ChrW(62)&ChrW(79)&ChrW(75)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
end function

function printOKWebSite()  
Call openconn()

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(61)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101), conn, 1, 1 
call echo(ChrW(20849),rs.recordcount)
Call echo(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(38)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(32593)&ChrW(31449)&ChrW(22495)&ChrW(21517)&ChrW(39)&ChrW(62)&ChrW(79)&ChrW(75)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
While Not rs.EOF

call rw(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)) & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62))
rs.movenext:wend:rs.close

end function

function printAspServerWebSite()  
Call openconn()

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(61)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120)&ChrW(61)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(104)&ChrW(112)&ChrW(61)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(41), conn, 1, 1 
call echo(ChrW(20849),rs.recordcount)
Call echo(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(38)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(32593)&ChrW(31449)&ChrW(22495)&ChrW(21517)&ChrW(39)&ChrW(62)&ChrW(79)&ChrW(75)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
While Not rs.EOF

call rw(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)) & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62))
rs.movenext:wend:rs.close

end function

function isthroughTrue()
Call openconn() 
conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)) 
Call echo(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(38)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(32593)&ChrW(31449)&ChrW(22495)&ChrW(21517)&ChrW(39)&ChrW(62)&ChrW(79)&ChrW(75)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
end function

Function scanDomainHomePageSize()
Dim a, b, c, d, e,f,g,h
dim i,j,k,l,m,n,o,p,q,r,s
if request(ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115))="" then
g=0
else
g=request(ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115))
end if
b = 3 
Call openconn() 

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(60)&ChrW(62)&ChrW(39)&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(61)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(61)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101), conn, 1, 1 
if request(ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))="" then
h=rs.recordcount
else
h=request(ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))
end if
While Not rs.EOF
g=g+1 
Call echo(g & ChrW(47) & h, rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101))) 
doevents 
d = ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(32593)&ChrW(31449)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(83)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(47)&ChrW(22495)&ChrW(21517)&ChrW(39318)&ChrW(39029)&ChrW(22823)&ChrW(23567)&ChrW(47)
Call createDirFolder(d) 
e = d & ChrW(47) & setFileName(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101))) & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
If checkFile(e) = True Then 
Call echo(ChrW(31867)&ChrW(22411), ChrW(26412)&ChrW(22320)) 
b=1
Else
l=getwebsite(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)))
if l="" then
call eerr(ChrW(22495)&ChrW(21517)&ChrW(20026)&ChrW(31354),l)
end if
o=getHttpPage(l,rs(ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)))

if o="" then
o=ChrW(32)
end if
Call createFile(e, o)
Call echo(ChrW(31867)&ChrW(22411), ChrW(32593)&ChrW(32476)) 
End if 
o=readFile(e,"")
q=getHtmlValue(o,ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
r=getHtmlValue(o,ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
s=getHtmlValue(o,ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
n=getfsize(e)
call echo(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101),q)

conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& ADSql(q) &ChrW(39)&ChrW(44)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(61)&ChrW(39)& r &ChrW(39)&ChrW(44)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&ChrW(39)& s &ChrW(39)&ChrW(44)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(61)& n &ChrW(44)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(44)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & Now() & ChrW(39)&ChrW(32)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100)) & "")
if request(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))="" then
p=now()
else
p=request(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))
end if
call rw(VBRunTimer(p) & ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62))
a = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(61)& g &ChrW(38)&ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(61)& h &ChrW(38)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(61)& p &ChrW(38)&ChrW(78)&ChrW(61) & getRnd(11), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
Call rw(jsTiming(a, b)) 
Response.End() 
rs.MoveNext : Wend : rs.Close 

Call echo(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(38)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(32593)&ChrW(31449)&ChrW(22495)&ChrW(21517)&ChrW(39)&ChrW(62)&ChrW(79)&ChrW(75)&ChrW(65292)&ChrW(20849)&ChrW(40)& g &ChrW(41)&ChrW(26465)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
End function 

Function scanDomainHomePage()
Dim a, b, c, d, e,f,g,h
dim i,j,k,l,m,n
dim o,p,q,r,s
o=0:p=0:q=0:r=0
if request(ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115))="" then
g=0
else
g=request(ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115))
end if
b = 3 
Call openconn() 

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(60)&ChrW(62)&ChrW(39)&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(61)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101), conn, 1, 1 
if request(ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))="" then
h=rs.recordcount
else
h=request(ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))
end if
While Not rs.EOF
g=g+1 
Call echo(g & ChrW(47) & h, rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101))) 
doevents 
d = ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(32593)&ChrW(31449)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(83)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(47)&ChrW(22495)&ChrW(21517)&ChrW(39318)&ChrW(39029)&ChrW(47)
Call createDirFolder(d) 
e = d & ChrW(47) & setFileName(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101))) & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
If checkFile(e) = True Then
k = phptrim(readFile(e,""))
o=cint(getstrcut(k,ChrW(105)&ChrW(115)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(61),vbcrlf,1))
p=cint(getstrcut(k,ChrW(105)&ChrW(115)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(120)&ChrW(61),vbcrlf,1))
q=cint(getstrcut(k,ChrW(105)&ChrW(115)&ChrW(80)&ChrW(104)&ChrW(112)&ChrW(61),vbcrlf,1))
r=cint(getstrcut(k,ChrW(105)&ChrW(115)&ChrW(74)&ChrW(115)&ChrW(112)&ChrW(61),vbcrlf,1))
Call echo(ChrW(31867)&ChrW(22411), ChrW(26412)&ChrW(22320)) 
b=1
Else
l=getwebsite(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)))
if l="" then
call eerr(ChrW(22495)&ChrW(21517)&ChrW(20026)&ChrW(31354),l)
end if
i=split(ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(124)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120)&ChrW(124)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(112)&ChrW(104)&ChrW(112)&ChrW(124)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(106)&ChrW(115)&ChrW(112)&ChrW(124)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(124)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(124)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(124)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120)&ChrW(124)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(106)&ChrW(115)&ChrW(112)&ChrW(124)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(124)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108),ChrW(124))
s=""
f=""
for each j in i
a=l & j
m=getHttpUrlState(a)
call echo(a,m & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(40)& getHttpUrlStateAbout(m) &ChrW(41))
doevents
if (j=ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112) or j=ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)) and (m=200 or m=302) then
o=1
elseif (j=ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120) or j=ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120)) and (m=200 or m=302) then
p=1
elseif (j=ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(112)&ChrW(104)&ChrW(112) or j=ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(112)&ChrW(104)&ChrW(112)) and (m=200 or m=302) then
q=1
elseif (j=ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(46)&ChrW(106)&ChrW(115)&ChrW(112) or j=ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(106)&ChrW(115)&ChrW(112)) and (m=200 or m=302) then
r=1
end if
if m=200 or m=302 then
f=f & j & ChrW(124)
end if
s=s & j & ChrW(61) & m & vbcrlf
next
k= ChrW(105)&ChrW(115)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(61) & o & vbcrlf
k= k & ChrW(105)&ChrW(115)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(120)&ChrW(61) & p & vbcrlf
k= k & ChrW(105)&ChrW(115)&ChrW(80)&ChrW(104)&ChrW(112)&ChrW(61) & q & vbcrlf
k= k & ChrW(105)&ChrW(115)&ChrW(74)&ChrW(115)&ChrW(112)&ChrW(61) & r & vbcrlf & s
if f="" then
f=ChrW(26080)
end if
Call createFile(e, k) 
Call echo(ChrW(31867)&ChrW(22411), ChrW(32593)&ChrW(32476)) 
End if 

conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(61)& o &ChrW(44)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120)&ChrW(61)& p &ChrW(44)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(104)&ChrW(112)&ChrW(61)& q &ChrW(44)&ChrW(105)&ChrW(115)&ChrW(106)&ChrW(115)&ChrW(112)&ChrW(61)& r &ChrW(44)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(44)&ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(61)&ChrW(39)& f &ChrW(39)&ChrW(44)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & Now() & ChrW(39)&ChrW(32)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100)) & "") 
if request(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))="" then
n=now()
else
n=request(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))    
end if
call rw(VBRunTimer(n) & ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62))
a = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(61)& g &ChrW(38)&ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(61)& h &ChrW(38)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(61)& n &ChrW(38)&ChrW(78)&ChrW(61) & getRnd(11), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
Call rw(jsTiming(a, b)) 
Response.End() 
rs.MoveNext : Wend : rs.Close 

Call echo(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(38)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(32593)&ChrW(31449)&ChrW(22495)&ChrW(21517)&ChrW(39)&ChrW(62)&ChrW(79)&ChrW(75)&ChrW(65292)&ChrW(20849)&ChrW(40)& g &ChrW(41)&ChrW(26465)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
End function 

Function bantchImportDomain()
Dim a, b, c, d, e 
a = LCase(Request.Form(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))) 
b = Split(a, vbCrLf) 
e = 0 
Call openconn() 
For each c In b
d = getwebsite(c) 
If d <> "" Then

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(61)&ChrW(39) & d & ChrW(39), conn, 1, 1 
If rs.EOF Then
conn.Execute(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(40)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39) & d & ChrW(39)&ChrW(44)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(41)) 
Call echo(ChrW(28155)&ChrW(21152)&ChrW(25104)&ChrW(21151), d) 
e = e + 1 
Else
Call echo(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101), d) 
End if : rs.Close 

End if 
Next 
Call echo(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(38)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(32593)&ChrW(31449)&ChrW(22495)&ChrW(21517)&ChrW(39)&ChrW(62)&ChrW(79)&ChrW(75)&ChrW(32)&ChrW(20849)&ChrW(40) & e & ChrW(41)&ChrW(26465)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
End function 

Function scanCheckDomain()
Dim a, b, c, d, e, f,g,h
b = 3 
if request(ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115))="" then
f=0
else
f=request(ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115))
end if
Call openconn()

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101), conn, 1, 1 
if request(ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))="" then
g=rs.recordcount
else
g=request(ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))
end if
While Not rs.EOF
f=f+1
Call echo(f & ChrW(47) & g, rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101))) 
doevents 
d = ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(32593)&ChrW(31449)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(83)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(47)&ChrW(22495)&ChrW(21517)&ChrW(47)
Call createDirFolder(d) 
e = d & ChrW(47) & setFileName(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101))) & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
If checkFile(e) = True Then
c = cint(phptrim(readFile(e,"")))
Call echo(ChrW(31867)&ChrW(22411), ChrW(26412)&ChrW(22320)) 
b=1
Else
c = IIF(checkDomainName(rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101))), 1, 0) 
Call createFile(e, c & ChrW(32))
Call echo(ChrW(31867)&ChrW(22411), ChrW(32593)&ChrW(32476) & e & ChrW(40)& checkFile(e) &ChrW(41)&ChrW(61) & c) 
End if 

conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(61) & c & ChrW(44)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & Now() & ChrW(39)&ChrW(32)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100)) & "") 
if request(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))="" then
h=now()
else
h=request(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))
end if
call rw(VBRunTimer(h) & ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62))
a = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(61)& f &ChrW(38)&ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(61)& g &ChrW(38)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(61)& h &ChrW(38)&ChrW(78)&ChrW(61) & getRnd(11), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
Call rw(jsTiming(a, b)) 
Response.End() 
rs.MoveNext : Wend : rs.Close 

Call echo(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(38)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(32593)&ChrW(31449)&ChrW(22495)&ChrW(21517)&ChrW(39)&ChrW(62)&ChrW(79)&ChrW(75)&ChrW(65292)&ChrW(20849)&ChrW(40)& f &ChrW(41)&ChrW(26465)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
End function 

Function runScanWebUrl()
Dim a, b, c, d, e ,f,g,h
b = ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)




c = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(115)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(47) 

If e = ChrW(117)&ChrW(102)&ChrW(111)&ChrW(101)&ChrW(114) Then
c = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)&ChrW(117)&ChrW(102)&ChrW(111)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(47) 
b = ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56) 
End if
if request(ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115))="" then
f=0
else
f=request(ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115))
end if
Call openconn() 

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110), conn, 1, 1   
if request(ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))="" then
g=rs.recordcount
else
g=request(ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))
end if
If rs.EOF Then
conn.Execute(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(40)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(44)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39) & c & ChrW(39)&ChrW(44)&ChrW(39)&ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(39)&ChrW(44)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(39) & b & ChrW(39)&ChrW(41)) 
End if : rs.Close 



rsx.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(84)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101), conn, 1, 1 
If Not rsx.EOF Then
f=f+1
Call echo(f,  rsx(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)))  
doevents 
a = scanUrl(rsx(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)), rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)), rsx(ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116))) 

conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & rsx(ChrW(105)&ChrW(100)) & "") 
if request(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))="" then
h=now()
else
h=request(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))
end if
call VBRunTimer(h)
d = getUrlAddToParam(getThisUrl(), ChrW(63)&ChrW(110)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(61)& f &ChrW(38)&ChrW(110)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(61)& g &ChrW(38)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(61)& h &ChrW(38)&ChrW(78)&ChrW(61) & getRnd(11), ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) 
Call rw(jsTiming(d, a)) 
Response.End()
End if : rsx.Close  

Call echo(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(108)&ChrW(121)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(38)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(83)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(38)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(32593)&ChrW(22336)&ChrW(25195)&ChrW(25551)&ChrW(39)&ChrW(62)&ChrW(79)&ChrW(75)&ChrW(65292)&ChrW(20849)&ChrW(40)& f &ChrW(41)&ChrW(26465)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 


rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(61)&ChrW(52)&ChrW(48)&ChrW(52), conn, 1, 1 
While Not rs.EOF
Call echo(ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39) & rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)) & ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62) & rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39) & rs(ChrW(116)&ChrW(111)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)) & ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62) & rs(ChrW(116)&ChrW(111)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)) & ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
rs.MoveNext : Wend : rs.Close 

End function 

Function scanUrl(a, b, c)
Dim d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u ,v
Dim w, x, y, z, a1
n = ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(32593)&ChrW(31449)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(83)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(47) & setFileName(getwebsite(a)) 
Call createDirFolder(n) 
o = n & ChrW(47) & setFileName(a) & ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) 
t = n & ChrW(47)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(105)&ChrW(102)&ChrW(103) 
Call createfolder(t) 
u = t & ChrW(47) & setFileName(a) & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116) 

r = 0 
w = 1 
y = 0 
If checkFile(o) = False Then
x = Now() 
Call echo(ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(101)&ChrW(116), c) 
q = handleXmlGet(a, c) 
g = q(0) 

r = cint(q(1)) 
y = DateDiff(ChrW(115), x, Now()) 


Call writeToFile(o, g, c) 
Call createFile(u, r & vbCrLf & y) 
w = 3 
z = false
Else

g = readFile(o, c) 

d = Split(readFile(u,""), vbCrLf) 
r = CInt(d(0)) 
y = CInt(d(0)) 
z = true 
End if 
v=getFSize(o)
Call echo(ChrW(105)&ChrW(115)&ChrW(76)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108), z) 

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(39) & a & ChrW(39), conn, 1, 1 
If rs.EOF Then
conn.Execute(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(40)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(44)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39) & a & ChrW(39)&ChrW(44)&ChrW(39) & b & ChrW(39)&ChrW(44)&ChrW(39) & c & ChrW(39)&ChrW(41)) 
End if : rs.Close 

conn.Execute(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(61) & r & ChrW(44)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(61) & v & ChrW(44)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(112)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(61) & y & ChrW(44)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39) & c & ChrW(39)&ChrW(32)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(39) & a & ChrW(39)) 

f = getContentAHref("", g, h, i) 
f = handleScanUrlList(a, f) 



p = 0 
j = Split(h, vbCrLf) 
k = Split(i, vbCrLf) 
For e = 1 To UBound(j)
l = k(e) 
m = j(e) 

If InStr(m, ChrW(35)) > 0 Then
m = Mid(m, 1, InStr(m, ChrW(35)) - 1) 
End if 
If m = "" Then
If l <> "" Then
Call echo(ChrW(32593)&ChrW(22336)&ChrW(20026)&ChrW(31354), l) 
End if 
Else
m = handleScanUrlList(a, m) 
m = handleWithWebSiteList(a, m) 
If m <> "" Then

rs.Open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61)&ChrW(39) & m & ChrW(39), conn, 1, 1 
If rs.EOF Then
s = LCase(m)
If InStr(s, ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(115)&ChrW(47)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)) > 0 Or InStr(s, ChrW(47)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)) > 0 Or InStr(s, ChrW(47)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)) > 0 Or InStr(s, ChrW(47)&ChrW(112)&ChrW(104)&ChrW(112)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(46)&ChrW(112)&ChrW(104)&ChrW(112)&ChrW(63)) > 0 Or s = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(46)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(47)&ChrW(113)&ChrW(113)&ChrW(47) Or InStr(s, ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(111)&ChrW(58)) > 0 Or InStr(s, ChrW(116)&ChrW(101)&ChrW(108)&ChrW(58)) > 0 Or InStr(s, ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(63)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121)&ChrW(116)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(109)) > 0 Then
a1 = 0 
Else
a1 = 1
End if 
conn.Execute(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(110)&ChrW(40)&ChrW(116)&ChrW(111)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(44)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(44)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39) & a & ChrW(39)&ChrW(44)&ChrW(39) & b & ChrW(39)&ChrW(44)&ChrW(39) & m & ChrW(39)&ChrW(44)&ChrW(39) & Left(l, 255) & ChrW(39)&ChrW(44) & a1 & ChrW(44)&ChrW(39) & c & ChrW(39)&ChrW(41)) 
p = p + 1 
Call echo(e, m) 
Else
Call echo(l, m) 
End if : rs.Close 

End if 
End if 
Next
scanUrl = w 
End function 
%>                  
