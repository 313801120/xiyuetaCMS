<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


dim debugType
debugType=ChrW(44)&ChrW(26597)&ChrW(30475)&ChrW(34920)&ChrW(23548)&ChrW(20837)&ChrW(25490)&ChrW(24207)&ChrW(44)&ChrW(29305)&ChrW(27530)&ChrW(23383)&ChrW(27573)&ChrW(22788)&ChrW(29702)&ChrW(25552)&ChrW(31034)&ChrW(44)&ChrW(28155)&ChrW(21152)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(26174)&ChrW(31034)&ChrW(44)
debugType=ChrW(44)&ChrW(26597)&ChrW(51)

function getArticlePicInArticleId(a) 
dim b,c,d,e,f,g,h
if instr(a,ChrW(62))>0 then
b=split(a,ChrW(62))
f=b(ubound(b))
for g=0 to ubound(b)-1
c=b(g)
e=ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & c & ChrW(39)
if d <>"" then e = e & ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&d
rsx.open e, conn, 1, 1 
if not rsx.EOF then
d = rsx(ChrW(105)&ChrW(100))        

end if : rsx.close 
next

if d="" then d=-1 
end if 
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)& d &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39) & f & ChrW(39), conn, 1, 1 
if not rsx.eof then
h=rsx(ChrW(105)&ChrW(100))
end if:rsx.close

getArticlePicInArticleId=h
end function 

function tempdataidToGetArticleId(a) 
dim b 
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39) & a & ChrW(39), conn, 1, 1 
if not rsx.eof then
b=rsx(ChrW(105)&ChrW(100))
end if:rsx.close 
tempdataidToGetArticleId=b
end function

function gettimoclassId(a)
dim b,c,d,e
if instr(a,ChrW(62))>0 then
b=split(a,ChrW(62))
for each c in b
e=ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(116)&ChrW(105)&ChrW(109)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & c & ChrW(39)
if d <>"" then e = e & ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&d
rsx.open e, conn, 1, 1 
if not rsx.EOF then
d = rsx(ChrW(105)&ChrW(100))        

end if : rsx.close 
next

if d="" then d=-1
gettimoclassId=d
exit function
end if
gettimoclassId = ChrW(45)&ChrW(49) 
rsx.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(116)&ChrW(105)&ChrW(109)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & a & ChrW(39), conn, 1, 1 
if not rsx.EOF then
gettimoclassId = rsx(ChrW(105)&ChrW(100))        
end if : rsx.close 
end function

function getXiyuetaClassId(a)
dim b,c,d,e
if instr(a,ChrW(62))>0 then
b=split(a,ChrW(62))
for each c in b
e=ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & c & ChrW(39)
if d <>"" then e = e & ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&d
rsx.open e, conn, 1, 1 
if not rsx.EOF then
d = rsx(ChrW(105)&ChrW(100))        

end if : rsx.close 
next

if d="" then d=-1
getXiyuetaClassId=d
exit function
end if
getXiyuetaClassId = ChrW(45)&ChrW(49) 
rsx.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & a & ChrW(39), conn, 1, 1 
if not rsx.EOF then
getXiyuetaClassId = rsx(ChrW(105)&ChrW(100))        
end if : rsx.close 
end function

function getColumnId(a)
dim b,c,d,e
if instr(a,ChrW(62))>0 then
b=split(a,ChrW(62))
for each c in b
e=ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & c & ChrW(39)
if d <>"" then e = e & ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&d
rsx.open e, conn, 1, 1 
if not rsx.EOF then
d = rsx(ChrW(105)&ChrW(100))        

end if : rsx.close 
next

if d="" then d=-1
getColumnId=d
exit function
end if
getColumnId = ChrW(45)&ChrW(49) 
rsx.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & a & ChrW(39), conn, 1, 1 
if not rsx.EOF then
getColumnId = rsx(ChrW(105)&ChrW(100))        
end if : rsx.close 
end function

function getSheShiId(a)
getSheShiId = ChrW(45)&ChrW(49) 
rsx.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39) & a & ChrW(39), conn, 1, 1 
if not rsx.EOF then
getSheShiId = rsx(ChrW(105)&ChrW(100)) 
end if : rsx.close 
end function

function callfile_setAccess()
dim a 
a = request(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)) 
if a = ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101) then
call backupDatabase()
elseif a = ChrW(114)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101) then
call recoveryDatabase()
else
call eerr(ChrW(115)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(39029)&ChrW(37324)&ChrW(27809)&ChrW(26377)&ChrW(21160)&ChrW(20316), request(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))) 
end if 
end function

function recoveryDatabase()
dim a, b 
dim c, d, e, f 
call handlePower(ChrW(24674)&ChrW(22797)&ChrW(25968)&ChrW(25454)&ChrW(24211)) 
a = adminDir & ChrW(47)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(66)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(85)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(115)&ChrW(47) 
b = a & ChrW(47) & request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)) 
if checkFile(b) = false then
call eerr(ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312), b) 
end if 
c = readFile(b,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
e = split(c, ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61) & vbCrLf) 
for each d in e
f = newGetStrCut(d, ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)) 
if f <> "" then
conn.execute(ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & f) 
call echo(f, nImportTXTData(b,d, f, ChrW(28155)&ChrW(21152))) 
end if 
next 
call echo(ChrW(24674)&ChrW(22797)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(23436)&ChrW(25104), "") 
end function 

function backupDatabase()
dim a, b, c, d, e, f, g, h, i, j 
dim k, l, m, n, o, p, q 
call handlePower(ChrW(22791)&ChrW(20221)&ChrW(25968)&ChrW(25454)&ChrW(24211)) 
b = lcase(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)))
a = IIF(request(ChrW(105)&ChrW(115)&ChrW(85)&ChrW(110)&ChrW(105)&ChrW(102)&ChrW(121)&ChrW(84)&ChrW(111)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)) = ChrW(49), true, false)
c = lcase(db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) & vbCrLf & getTableList())
i = len(db_PREFIX) 

if b <> "" then
k = split(b, ChrW(124)) 
for each m in k
if instr(vbCrLf & c & vbCrLf, vbCrLf & db_PREFIX & m & vbCrLf) > 0 then
if o <> "" then
o = o & vbCrLf 
end if 
o = o & db_PREFIX & m 
end if 
next 
if o = "" then
call eerr(ChrW(33258)&ChrW(23450)&ChrW(20041)&ChrW(22791)&ChrW(20221)&ChrW(34920)&ChrW(19981)&ChrW(27491)&ChrW(30830)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(34)&ChrW(62)&ChrW(28857)&ChrW(20987)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62), b) 
end if 
c = o 
end if 
k = split(c, vbCrLf) 
o = "" 
for each m in k
m = trim(m) 
j = true 

if i > 0 then
if mid(m, 1, i) <> db_PREFIX then
j = false 
end if 
end if 
if j = true then
d = lcase(getFieldConfigList(m)) 
call echo(m, d) 

rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & m, conn, 1, 1 
o = o & ChrW(12304)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(12305) & mid(m, len(db_PREFIX) + 1) & vbCrLf 
while not rs.eof
g = split(d, ChrW(44)) 
for each n in g
if instr(n, ChrW(124)) > 0 then
l = split(n & ChrW(124), ChrW(124)) 
e = l(0) 
f = l(1) 
h = rs(e) 
if f = ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98) then
h = replace(replace(h, ChrW(84)&ChrW(114)&ChrW(117)&ChrW(101), ChrW(49)), ChrW(70)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101), ChrW(48)) 
end if 

if m = db_PREFIX & ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117) and e = ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
h = getListMenuName(h) 

elseif m = db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) and e = ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
h = getColumnName(h) 
end if 
if h <> "" then
if instr(h, vbCrLf) > 0 then
h = h & ChrW(12304)&ChrW(47) & e & ChrW(12305) 
end if 
o = o & ChrW(12304) & e & ChrW(12305) & h & vbCrLf 
end if 
end if 
next 
o = o & ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45) & vbCrLf 
rs.movenext : wend : rs.close 

o = o & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61) & vbCrLf 
end if 
next 
p = adminDir & ChrW(47)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(66)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(85)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(115)&ChrW(47) 
q = p & ChrW(47) & format_Time(now(), 4) & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116) 
call createDirFolder(p) 
call deleteFile(q)
call createfile(q, o)
call hr() 
call echo(ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(112)&ChrW(68)&ChrW(105)&ChrW(114), p) 
call echo(ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(112)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104), q) 
call eerr(ChrW(25805)&ChrW(20316)&ChrW(23436)&ChrW(25104), ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(38)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(115)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(38)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(39)&ChrW(62)&ChrW(28857)&ChrW(20987)&ChrW(36820)&ChrW(22238)&ChrW(32)&ChrW(22791)&ChrW(20221)&ChrW(24674)&ChrW(22797)&ChrW(25968)&ChrW(25454)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
end function 

sub resetAccessData()
call handlePower(ChrW(24674)&ChrW(22797)&ChrW(27169)&ChrW(26495)&ChrW(25968)&ChrW(25454))
call OpenConn() 
dim a, b, c, d, e, f, g 
g = request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(68)&ChrW(105)&ChrW(114)) 
if g <> "" then
if checkFolder(g) = false then
call eerr(ChrW(32593)&ChrW(31449)&ChrW(25968)&ChrW(25454)&ChrW(30446)&ChrW(24405)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(24674)&ChrW(22797)&ChrW(40664)&ChrW(35748)&ChrW(25968)&ChrW(25454)&ChrW(26410)&ChrW(25104)&ChrW(21151), g) 
end if 
else
g = ChrW(47)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47) 
end if 

call nImportTXTData(g,readFile(g & ChrW(47)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)), ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101), ChrW(20462)&ChrW(25913)) 

call batchImportDirTXTData(g, handleTableListSort(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(44)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(77)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(44)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(44)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(44)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(44)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(44)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(44)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(79)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(44)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)))

call echo(ChrW(25552)&ChrW(31034), ChrW(24674)&ChrW(22797)&ChrW(25968)&ChrW(25454)&ChrW(23436)&ChrW(25104)&ChrW(65292) & vbEchoTimer()) 
call rw(ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)& WEB_VIEWURL &ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62)&ChrW(36827)&ChrW(20837)&ChrW(39318)&ChrW(39029)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)&ChrW(124)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(47)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62)&ChrW(36827)&ChrW(20837)&ChrW(21518)&ChrW(21488)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
call writeSystemLog("", ChrW(24674)&ChrW(22797)&ChrW(40664)&ChrW(35748)&ChrW(25968)&ChrW(25454) & db_PREFIX)
end sub
function handleTableListSort(a)
dim b,c,d,e,f
c=lcase(getTableList())
a=lcase(a)
if instr(debugType,ChrW(44)&ChrW(26597)&ChrW(30475)&ChrW(34920)&ChrW(23548)&ChrW(20837)&ChrW(25490)&ChrW(24207)&ChrW(44))>0 then call echo(ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116), c)
b=split(a,ChrW(44))
for each f in b
if f <>"" then
d=db_PREFIX & f
if instr(vbcrlf & e & vbcrlf, vbcrlf & d & vbcrlf)=false then
if instr(vbcrlf & c & vbcrlf, vbcrlf & d & vbcrlf)>0 then
if e <>"" then e=e & vbcrlf
e=e & d
end if
end if
end if
next
if instr(debugType,ChrW(44)&ChrW(26597)&ChrW(30475)&ChrW(34920)&ChrW(23548)&ChrW(20837)&ChrW(25490)&ChrW(24207)&ChrW(44))>0 then
call echo(ChrW(105)&ChrW(110)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),a)
call echo(ChrW(99),e)
call hr():doevents
end if
b=split(c,vbcrlf)
for each d in b
if d <>"" then
if instr(vbcrlf & e & vbcrlf, vbcrlf & d & vbcrlf)=false then
if e <>"" then e=e & vbcrlf
e=e & d
end if
end if
next
if instr(debugType,ChrW(44)&ChrW(26597)&ChrW(30475)&ChrW(34920)&ChrW(23548)&ChrW(20837)&ChrW(25490)&ChrW(24207)&ChrW(44))>0 then
call echoBlueB(ChrW(111)&ChrW(107)&ChrW(99),e)
end if
handleTableListSort=e
end function


function importArticle() 
call importData(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108),request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(68)&ChrW(105)&ChrW(114)),request(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)))
end function


function importData(a,b,c)
dim d,e,f,g,h
call echo(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),a)
call echo(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(68)&ChrW(105)&ChrW(114),b)
call echo(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104),c)
if a="" then exit function
if c <>"" then
h=nImportTXTData(b,readFile(c,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)), a, ChrW(28155)&ChrW(21152))             
call eerr(a, e & ChrW(32)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(32) & h) 
end if
f = getDirAllFileList(b, ChrW(116)&ChrW(120)&ChrW(116)) 
d = split(f, vbCrLf) 
for each e in d
g = getFileName(e) 
if e <> "" and inStr(ChrW(95)&ChrW(35), left(g, 1)) = false then
h=nImportTXTData(b,readFile(e,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)), a, ChrW(28155)&ChrW(21152))             
call echo(a, e & ChrW(32)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(32) & h) 
doevents 
end if 
next 
end function

function importSheShi()
dim a,b,c,d,e,f,g
a = request(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(68)&ChrW(105)&ChrW(114))
f=ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)
conn.execute(ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(120)&ChrW(121)&ChrW(95)&ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105))
call echo(ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(83)&ChrW(104)&ChrW(101)&ChrW(83)&ChrW(104)&ChrW(105),f)
d = getDirAllFileList(a, ChrW(116)&ChrW(120)&ChrW(116)) 
b = split(d, vbCrLf) 
for each c in b
e = getFileName(c) 
if c <> "" and inStr(ChrW(95)&ChrW(35), left(e, 1)) = false then
g=nImportTXTData(a,readFile(c,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)), f, ChrW(28155)&ChrW(21152))             
call echo(f, c & ChrW(32)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(32) & g) 
doevents 
end if 
next 
end function

function batchImportDirTXTData(a, b)
dim c, d, e, f, g, h, i, j 

e = split(b, vbCrLf) 
for each d in e
if d <> "" then
if db_PREFIX <> "" then
d = mid(d, len(db_PREFIX) + 1) 
end if 
d = trim(lcase(d)) 

if instr(ChrW(124) & j & ChrW(124), ChrW(124) & d & ChrW(124)) = false then
j = j & d & ChrW(124) 
c = handlePath(a & ChrW(47) & d) 
if checkFolder(c) = true then
conn.execute(ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & d)
call echoYellow(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101), d)
f = getDirAllFileList(c, ChrW(116)&ChrW(120)&ChrW(116)) 
g = split(f, vbCrLf) 
for each h in g

if instr(h,ChrW(47)&ChrW(35))=false and instr(h,ChrW(92)&ChrW(35))=false then

i = getFileName(h) 
if h <> "" and inStr(ChrW(95)&ChrW(35), left(i, 1)) = false then
call echoRedB(d, h) 

call nImportTXTData(c,readFile(h,""), d, ChrW(28155)&ChrW(21152)) 
doevents 
end if 
end if
next 
end if 
end if 
end if 
next 
end function 

function nImportTXTData(a,b, c, d)
dim e, f, g, h, i, j, k, l,m
dim n, o, p, q, r, s 
dim t,u,v,w,x
c = trim(lcase(c))

if instr(b, vbCrLf) = false then
b = replace(b, chr(10), vbCrLf) 
b=replace(b,vbcrlf & vbcrlf, vbcrlf)
end if 
e = lcase(getFieldConfigList(db_PREFIX & c)) 
h = split(e, ChrW(44)) 
f = split(b, vbCrLf & ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)) 
l = 0 
for each g in f
if instr(g,ChrW(12304))>0 then
q = ""
r = ""
s = ""
u = lcase(trim(newGetStrCut(g, ChrW(35)&ChrW(106)&ChrW(117)&ChrW(109)&ChrW(112)&ChrW(35)))) 
v = lcase(trim(newGetStrCut(g, ChrW(35)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(35))))
x = lcase(trim(newGetStrCut(g, ChrW(35)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(35))))

if v = ChrW(49) or v = ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) then
nImportTXTData = l 
exit function
end if
if lcase(x)=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) or x=ChrW(49) then
x=true
else
x=false
end if 

if u <> ChrW(49) and u <> ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) then
w=""
for each t in h 
if t <> "" then
i = split(t & ChrW(124)&ChrW(32), ChrW(124))
n = i(0) 
o = i(1)
if instr(g, ChrW(12304) & n & ChrW(12305)) > 0 then
g = g & vbCrLf
if q <> "" then
q = q & ChrW(44) 
r = r & ChrW(44) 
s = s & ChrW(44) 
end if 
q = q & n 


p = newGetStrCut(g, n) 
if o = ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97) or ( EDITORTYPE=ChrW(106)&ChrW(115)&ChrW(112) and o="") then
p = contentTranscoding(p) 

elseif o = ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111) or o = ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98) then
if lcase(p)=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) then
p=ChrW(49)
elseif lcase(p)=ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101) then
p=ChrW(48)
end if  
end if 

if o = ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101) and p = "" then
p = date() 
elseif (o = ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101) or o = ChrW(110)&ChrW(111)&ChrW(119)) and p = "" then
p = cstr(now()) 
end if 
if o <> ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111) and o <> ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98) then
p = ChrW(39) & p & ChrW(39) 

elseif p = "" then
p = ChrW(48) 
end if


if instr(p,ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93))>0 then
if instr(debugType,ChrW(44)&ChrW(29305)&ChrW(27530)&ChrW(23383)&ChrW(27573)&ChrW(22788)&ChrW(29702)&ChrW(25552)&ChrW(31034)&ChrW(44))>0 then call echo(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101),p):doevents
p=getTSFieldValue(p)
if instr(debugType,ChrW(44)&ChrW(29305)&ChrW(27530)&ChrW(23383)&ChrW(27573)&ChrW(22788)&ChrW(29702)&ChrW(25552)&ChrW(31034)&ChrW(44))>0 then call echoBlueB(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101),p)
end if
if (c = ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)) and x=false then

if n=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)& p &""
elseif n=ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)& p &""
end if
elseif (c = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)) then
if n=ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)& p &""

end if
elseif (c = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)) then
if n=ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)& p &""

end if 
elseif (c = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)) then
if n=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)& p &"" 
elseif n=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)& p &"" 
end if
elseif  c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114) or c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) or c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109) then
if n=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)& p &""  
elseif n=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)& p &""
elseif n=ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)& p &""
end if
elseif (c = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)) or c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) then
if n=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)& p &""  
elseif n=ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101) then
w=w & IIF(w="",ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32),ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32))
w=w & ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)& p &""
end if
end if

r = r & p
s = s & n & ChrW(61) & p
end if 
end if 
next 

if q <> "" then 
m=true
if w <>"" and d = ChrW(28155)&ChrW(21152) then
call openconn()
k=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & "" & c & w
if instr(debugType,ChrW(44)&ChrW(28155)&ChrW(21152)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(26174)&ChrW(31034)&ChrW(44))>0 then call echo(ChrW(115)&ChrW(113)&ChrW(108),k):doevents
rs.open k,conn,1,1

if not rs.eof then m=false
rs.close
end if

if m=true then
if d = ChrW(20462)&ChrW(25913) then
k = ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & db_PREFIX & "" & c & ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32) & s 
else
k = ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & db_PREFIX & "" & c & ChrW(32)&ChrW(40) & handleFieldListToAccess(q) & ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40) & r & ChrW(41)
end if

if checksql(k) = false then
call eerr(ChrW(20986)&ChrW(38169)&ChrW(25552)&ChrW(31034)&ChrW(49), ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61) & replace(replace(k,ChrW(60),ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)),ChrW(62),ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59)) & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end if
l = l + 1  
end if
else
l = nBatchImportColumnList(a,b,h, g, l, c) 
end if 
end if
end if 
next 
nImportTXTData = l 
end function

function handleFieldListToAccess(a)
dim b
b=a
if a <>"" then 
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then   
a=ChrW(96) & replace(a,ChrW(44),ChrW(96)&ChrW(44)&ChrW(96)) & ChrW(96)
else
a=ChrW(91) & replace(a,ChrW(44),ChrW(93)&ChrW(44)&ChrW(91)) & ChrW(93)
end if
end if

handleFieldListToAccess=a
end function

function nBatchImportColumnList(a,b,c, byval d, e, f)
dim g, h, i, j, k, l, m, n, parentIdArray(99), columntypeArray(99), flagsArray(99), o, p, q, r, s, t
dim u, v, w,x,y
i = false 
s = 0 
d = replace(d, vbTab, ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)) 
g = split(d, vbCrLf) 
for each k in g
w = "" 
if left(trim(k), 1) = ChrW(35) then

elseif k = ChrW(12304)&ChrW(35)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(35)&ChrW(12305) then
i = true 
elseif i = true then
j = k 
if instr(j, ChrW(12304)&ChrW(124)&ChrW(12305)) > 0 then
j = mid(j, 1, instr(j, ChrW(12304)&ChrW(124)&ChrW(12305)) - 1) 
end if 
j = rTrim(j) 
m = len(j) 
j = ltrim(j) 
m = m - len(j) 
o = cint(m / 4) 
if j <> "" then
parentIdArray(o) = j 
w = w & ChrW(12304)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(12305) & j & vbCrLf 
for each p in c
h = split(p & ChrW(124), ChrW(124)) 
q = h(0) 
if q <> "" and q <> ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101) and instr(k, q & ChrW(61)&ChrW(39)) > 0 then
r = getStrCut(k, q & ChrW(61)&ChrW(39), ChrW(39), 2) 
w = w & ChrW(12304) & q & ChrW(12305) & r & vbCrLf 
if q = ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101) then
columntypeArray(o) = r 
elseif q = ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115) then
flagsArray(o) = r 
elseif q = ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104) then
v = r 
elseif q = ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101) then
u = r 
end if 
end if 
next 

if instr(u, ChrW(91)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(93)) > 0 then
w = vbCrLf & ChrW(12304)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(12305) & replace(u, ChrW(91)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(93), v) & vbCrLf & w 
end if 
if o <> 0 then
w = w & ChrW(12304)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(12305) & parentIdArray(o - 1) & vbCrLf 
w = w & ChrW(12304)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(12305) & columntypeArray(o - 1) & vbCrLf 
w = w & ChrW(12304)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(12305) & flagsArray(o - 1) & vbCrLf 
if columntypeArray(o) = "" then
columntypeArray(o) = columntypeArray(o - 1) 
end if 
if flagsArray(o) = "" then
flagsArray(o) = flagsArray(o - 1) 
end if 
else
w = w & ChrW(12304)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(12305)&ChrW(45)&ChrW(49) & vbCrLf 
end if 
w = w & ChrW(12304)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(12305) & s & vbCrLf


x=readFile(a & ChrW(47) & j & ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))

k=getStrCut(b & x,ChrW(12304)& j &ChrW(12305),ChrW(12304)&ChrW(47)& j &ChrW(12305),2)
y=getStrCut(b & x,ChrW(12304)& j &ChrW(45)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305),ChrW(12304)&ChrW(47)& j &ChrW(45)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305),2)
w = w & ChrW(12304)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305) & k & ChrW(12304)&ChrW(47)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305) & vbCrLf
w = w & ChrW(12304)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305) & y & ChrW(12304)&ChrW(47)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(12305) & vbCrLf
if k <>"" then

end if
s = s + 1 
w = w & getRowConfigData(b,parentIdArray,o) 
l = l & w & ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45) & vbCrLf 
end if 
end if 
next 


if l <> "" then
call nImportTXTData(a,l, f, ChrW(28155)&ChrW(21152)) 
end if 
nBatchImportColumnList = s 
end function

function getRowConfigData(a,b,c)
dim d,e,f
for d=0 to c
e=b(d)
if f <>"" then
f=f & ChrW(47)
end if
f=f & e
next
e=getStrCut(a,ChrW(12304)&ChrW(35)&ChrW(35)&ChrW(35)& f &ChrW(35)&ChrW(35)&ChrW(35)&ChrW(12305),ChrW(12304)&ChrW(47)&ChrW(35)&ChrW(35)&ChrW(35)& f &ChrW(35)&ChrW(35)&ChrW(35)&ChrW(12305),2)
getRowConfigData= vbcrlf & e & vbcrlf
end function

function newGetStrCut(a, b)
dim c 

if instr(a, vbCrLf) = false then
a = replace(a, chr(10), vbCrLf) 
end if 
if inStr(a, ChrW(12304)&ChrW(47) & b & ChrW(12305)) > 0 then
c = aDSql(phptrim(getStrCut(a, ChrW(12304) & b & ChrW(12305), ChrW(12304)&ChrW(47) & b & ChrW(12305), 0))) 
else
c = aDSql(phptrim(getStrCut(a, ChrW(12304) & b & ChrW(12305), vbCrLf, 0))) 
end if 
newGetStrCut = c 
end function 

function contentTranscoding(byVal a)
a = replace(replace(replace(replace(a, ChrW(60)&ChrW(63), ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)&ChrW(63)), ChrW(63)&ChrW(62), ChrW(63)&ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59)), ChrW(60) & ChrW(37), ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)&ChrW(37)), ChrW(63)&ChrW(62), ChrW(37)&ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59)) 
dim b, c, d, e, f, g 
f = false 
g = false 

if instr(a, vbCrLf) = false then
a = replace(a, chr(10), vbCrLf) 
end if 
b = split(a, vbCrLf) 
for each d in b
if inStr(d, ChrW(91)&ChrW(38)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(36716)&ChrW(30721)&ChrW(38)&ChrW(93)) > 0 then
f = true 
end if 
if inStr(d, ChrW(91)&ChrW(38)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(36716)&ChrW(30721)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(38)&ChrW(93)) > 0 then
f = false 
end if 
if inStr(d, ChrW(91)&ChrW(38)&ChrW(20840)&ChrW(37096)&ChrW(25442)&ChrW(34892)&ChrW(38)&ChrW(93)) > 0 then
g = true 
end if 
if inStr(d, ChrW(91)&ChrW(38)&ChrW(20840)&ChrW(37096)&ChrW(25442)&ChrW(34892)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(38)&ChrW(93)) > 0 then
g = false 
end if 
if f = true then
d = replace(replace(d, ChrW(91)&ChrW(38)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(36716)&ChrW(30721)&ChrW(38)&ChrW(93), ""), ChrW(60), ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)) 
else
d = replace(d, ChrW(91)&ChrW(38)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(36716)&ChrW(30721)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(38)&ChrW(93), "") 
end if 
if g = true then
d = replace(d, ChrW(91)&ChrW(38)&ChrW(20840)&ChrW(37096)&ChrW(25442)&ChrW(34892)&ChrW(38)&ChrW(93), "") 
if right(trim(d), 8) <> ChrW(12304)&ChrW(12298)&ChrW(12305)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) then
d = d & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62) 
end if 
else
d = replace(d, ChrW(91)&ChrW(38)&ChrW(20840)&ChrW(37096)&ChrW(25442)&ChrW(34892)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(38)&ChrW(93), "") 
end if 

if instr(d, ChrW(12304)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(12305)) > 0 then
d = replace(d, ChrW(12304)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(12305), "") 
d = ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(62) & d & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) 
elseif instr(d, ChrW(12304)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(12305)) > 0 then
d = replace(d, ChrW(12304)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(12305), "") 
d = ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62) & d & ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) 
end if 
if e <> "" then
e = e & vbCrLf 
end if 
e = e & d 
next 
e = replace(replace(e, ChrW(12304)&ChrW(98)&ChrW(12305), ChrW(60)&ChrW(98)&ChrW(62)), ChrW(12304)&ChrW(47)&ChrW(98)&ChrW(12305), ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)) 
e = replace(e, ChrW(12304)&ChrW(12298)&ChrW(12305), ChrW(60)) 
e = replace(replace(e, ChrW(12304)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(110)&ChrW(103)&ChrW(12305), ChrW(60)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(110)&ChrW(103)&ChrW(62)), ChrW(12304)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(110)&ChrW(103)&ChrW(12305), ChrW(60)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(110)&ChrW(103)&ChrW(62)) 
contentTranscoding = e 
end function 

function getTSFieldValue(a)
dim b,c,d,e,f,g,h,i,j

dim k,l,m,n
dim o,p
o=ChrW(91)
p=ChrW(93)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then        
o=ChrW(96)
p=ChrW(96)
end if
b=split(a,ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93))
if ubound(b)=4 then
dim q:Set q = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
i=b(0)
l=b(1)
m=b(2)
k=b(3)
n=b(4)
if instr(debugType,ChrW(44)&ChrW(29305)&ChrW(27530)&ChrW(23383)&ChrW(27573)&ChrW(22788)&ChrW(29702)&ChrW(25552)&ChrW(31034)&ChrW(44))>0 then
call echoRedB(ChrW(25552)&ChrW(31034),a)
call echo(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),i)
call echo(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),l)
call echo(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),k)
call echo(ChrW(105)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),m)
call echo(ChrW(115)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101),n)
end if

if l <>"" then
f=getFieldAlt(db_PREFIX& i, l)
if instr(debugType,ChrW(44)&ChrW(29305)&ChrW(27530)&ChrW(23383)&ChrW(27573)&ChrW(22788)&ChrW(29702)&ChrW(25552)&ChrW(31034)&ChrW(44))>0 then call echo(ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101),f):doevents
if f <>ChrW(73)&ChrW(110)&ChrW(116) then l=""
end if
if l <>"" then
if instr(debugType,ChrW(44)&ChrW(29305)&ChrW(27530)&ChrW(23383)&ChrW(27573)&ChrW(22788)&ChrW(29702)&ChrW(25552)&ChrW(31034)&ChrW(44))>0 then call echo(ChrW(20026)&ChrW(22810)&ChrW(32423),i)
j=false
g=-1
c=split(n,ChrW(91)&ChrW(45)&ChrW(45)&ChrW(62)&ChrW(62)&ChrW(93))
for each d in c
h=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&o&db_PREFIX& i&p&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&l&ChrW(61)&g
if instr(debugType,ChrW(44)&ChrW(29305)&ChrW(27530)&ChrW(23383)&ChrW(27573)&ChrW(22788)&ChrW(29702)&ChrW(25552)&ChrW(31034)&ChrW(44))>0 then
call echo(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100),g)
call echo(ChrW(115)&ChrW(113)&ChrW(108)&ChrW(49)&ChrW(49)&ChrW(49),h)
call echo(ChrW(115)&ChrW(49)&ChrW(49)&ChrW(49),d):doevents
end if
q.open h,conn,1,1
for e=1 to q.recordcount
if q(k)=d then
g=q(m)
if instr(debugType,ChrW(44)&ChrW(29305)&ChrW(27530)&ChrW(23383)&ChrW(27573)&ChrW(22788)&ChrW(29702)&ChrW(25552)&ChrW(31034)&ChrW(44))>0 then call echoYellowB(d & ChrW(65292)&e&ChrW(25214)&ChrW(21040)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49),g) 
exit for
end if
q.movenext:next:q.close
next
getTSFieldValue=g

else            
if instr(debugType,ChrW(44)&ChrW(29305)&ChrW(27530)&ChrW(23383)&ChrW(27573)&ChrW(22788)&ChrW(29702)&ChrW(25552)&ChrW(31034)&ChrW(44))>0 then call echo(ChrW(20026)&ChrW(19968)&ChrW(32423),i)
j=false
q.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&o&db_PREFIX& i&p,conn,1,1
for e=1 to q.recordcount
if instr(debugType,ChrW(44)&ChrW(29305)&ChrW(27530)&ChrW(23383)&ChrW(27573)&ChrW(22788)&ChrW(29702)&ChrW(25552)&ChrW(31034)&ChrW(44))>0 then 
call echo(e,k)
call echo(e,q(k)&ChrW(61)&n)
end if
if q(k)=n then
getTSFieldValue=q(m) 
j=true
exit function
end if
q.movenext:next:q.close

if j=false then 
getTSFieldValue=-1
end if
end if
end if
end function
%>