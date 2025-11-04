<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 



sub connInsertInto(a)
conn.Execute(a)
end sub

sub connUpdate(a) 

conn.Execute(a)
end sub

function handleAccessData(byVal a)
handleAccessData = replace(a, ChrW(39), ChrW(39)&ChrW(39)) 
end function 

function checkAccessPass(a, b)
on error resume next 
dim c 
checkAccessPass = true 
set c = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
c.open ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(58)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(39) & b & ChrW(39)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32) & a 
c.close 
if err <> 0 then
err.clsoe 
checkAccessPass = false 
end if 
end function 

function checkSql(a)
on error resume next 
conn.execute(a) 
checkSql = IIF(err = 0, true, false) 
end function 

function createTable(a)
dim b 
if checkSql(a) = false then
b = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & a & ChrW(32)&ChrW(40)&ChrW(73)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(41) 
conn.execute(b) 
createTable = true 
else
createTable = false 
end if 
end function 

function showIsTable(a)
showIsTable = existsTable(a) 
if showIsTable = false then
call rw(ChrW(21019)&ChrW(24314)&ChrW(34920)&ChrW(91) & a & ChrW(93)&ChrW(25104)&ChrW(21151)&ChrW(8730)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
else
call rw(ChrW(34920)&ChrW(91) & a & ChrW(93)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)) 
end if 
end function 

function getRecordCount(a, b)

call OpenConn() 
getRecordCount = conn.execute(ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32) & b)(0) 
end function
function tableCount(a, b)
tableCount = getRecordCount(a, b) 
end function  

function openTable(a, b)
rs.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32) & b, conn, 1, 1 
end function 

function insertTable(a, b, c)
conn.execute(ChrW(73)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(91) & a & ChrW(93)&ChrW(40) & b & ChrW(41)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39) & c & ChrW(39)&ChrW(41)) 
end function 

function getTableText(a, b, c)
on error resume next 
getTableText = conn.execute(ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32) & b & ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & a & ChrW(93) & c)(0) 
if err.number <> 0 then call eerr(ChrW(20986)&ChrW(38169)&ChrW(20102), a & ChrW(45) & b & ChrW(45) & c) 
end function 

function createMdb(a)
dim b 
a = handlePath(a) 
set b = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(88)&ChrW(46)&ChrW(67)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(111)&ChrW(103))
b.create(ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(61) & a) 
createMdb = ChrW(21019)&ChrW(24314)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(91) & a & ChrW(93)&ChrW(25104)&ChrW(21151)&ChrW(8730)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62) & vbCrLf 
set b = nothing 
end function 

function deleteTable(a)
a = trim(a) 
deleteTable = false 
if a = "" then
exit function 
end if 
if checkTable(a) then
deleteTable = true 
Conn.Execute(ChrW(68)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & a & ChrW(93))
end if 

end function 

function deleteAllTable(a)
dim b, c, d 
b = split(a, vbCrLf) 
for each c in b
if d <> "" then d = d & vbCrLf 
d = d & ChrW(21024)&ChrW(38500)&ChrW(34920)&ChrW(12304) & c & ChrW(12305) & deleteTable(c) 
next 
deleteAllTable = d 
end function 

function checkTable(a)
dim b,c
b=ChrW(91)
c=ChrW(93)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then        
b=ChrW(96)
c=ChrW(96)
end if
on error resume next 
conn.execute(ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&b&a&c) 
if not err.number = 0 then
err.clear
checkTable = false 
else
checkTable = true 
end if 
end function

function checkTable_show(a)
checkTable_show=checkTable(a)
if checkTable_show=true then
call rw(ChrW(34920)&ChrW(91) & a & ChrW(93)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62))    
else
call rw(ChrW(21019)&ChrW(24314)&ChrW(34920)&ChrW(91) & a & ChrW(93)&ChrW(25104)&ChrW(21151)&ChrW(8730)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62))
end if
end function

function existsTable(a)
existsTable = checkTable(a) 
end function 

function editTable(a, b, c)
dim d, e, f 
editTable = false 
if checkTable(b) and checkTable(c) = false then
d = ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(61) & a 
set e = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(88)&ChrW(46)&ChrW(67)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(111)&ChrW(103))
e.activeconnection = d 
set f = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(88)&ChrW(46)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101))
set f = e.tables(b)
f.name = c
set e = nothing 
set f = nothing 
editTable = true 
set e = nothing 
end if 
end function 

function checkField(a, b)
checkField = false 
if checkTable(a) then
on error resume next 
conn.execute(ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32) & b & ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & a & ChrW(93)) 
if not err.number = 0 then
err.clear
checkField = false 
else
checkField = true 
end if 
err.clear 
end if 
end function 

function existsField(a, b)
existsField = checkField(a, b) 
end function 

function editField(a, b, c)

dim d 
editField = false 
if checkTable(a) then
if checkField(a, c) = false and checkField(a, b) then
d = getFieldAlt(a, b) 
if d <> "" then

conn.execute(ChrW(65)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(32)&ChrW(91) & c & ChrW(93)&ChrW(32) & d & "")
conn.execute(ChrW(85)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32)&ChrW(83)&ChrW(101)&ChrW(116)&ChrW(32) & c & ChrW(61)&ChrW(91) & b & ChrW(93))
conn.execute(ChrW(65)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32)&ChrW(68)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(91) & b & ChrW(93))
end if 
if err.number <> 0 then msgBox(a & vbCrLf & b & vbCrLf & c & ChrW(31867)&ChrW(22411) & d) 
end if 
end if  
end function

function addField(a,b,c)
if c="" then
c=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)
end if
if checkField(a,b) = false then
conn.execute(ChrW(65)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(32)&ChrW(91) & b & ChrW(93)&ChrW(32) & c & "")
addField=true
exit function
end if 
addField=false
end function

function delField(a,b)
if checkField(a,b) = true then
conn.execute(ChrW(65)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32)&ChrW(68)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(91) & b & ChrW(93))
delField=true
exit function
end if 
delField=false
end function

function delFieldPlus(a,b)
if checkField(a,b) = true then

conn.Execute(ChrW(73)&ChrW(70)&ChrW(32)&ChrW(69)&ChrW(88)&ChrW(73)&ChrW(83)&ChrW(84)&ChrW(83)&ChrW(32)&ChrW(40)&ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(82)&ChrW(79)&ChrW(77)&ChrW(32)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(46)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(115)&ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(95)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(79)&ChrW(66)&ChrW(74)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(95)&ChrW(73)&ChrW(68)&ChrW(40)&ChrW(39) & a & ChrW(39)&ChrW(41)&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(95)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(95)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(39) & b & ChrW(39)&ChrW(41)&ChrW(32)&ChrW(66)&ChrW(69)&ChrW(71)&ChrW(73)&ChrW(78)&ChrW(32)&ChrW(68)&ChrW(69)&ChrW(67)&ChrW(76)&ChrW(65)&ChrW(82)&ChrW(69)&ChrW(32)&ChrW(64)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(110)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(40)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)&ChrW(64)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(70)&ChrW(82)&ChrW(79)&ChrW(77)&ChrW(32)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(46)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(115)&ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(95)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(79)&ChrW(66)&ChrW(74)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(95)&ChrW(73)&ChrW(68)&ChrW(40)&ChrW(39) & a & ChrW(39)&ChrW(41)&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(95)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(95)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(39) & b & ChrW(39)&ChrW(59)&ChrW(32)&ChrW(69)&ChrW(88)&ChrW(69)&ChrW(67)&ChrW(40)&ChrW(39)&ChrW(65)&ChrW(76)&ChrW(84)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32) & a & ChrW(32)&ChrW(68)&ChrW(82)&ChrW(79)&ChrW(80)&ChrW(32)&ChrW(67)&ChrW(79)&ChrW(78)&ChrW(83)&ChrW(84)&ChrW(82)&ChrW(65)&ChrW(73)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(39)&ChrW(32)&ChrW(43)&ChrW(32)&ChrW(64)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(69)&ChrW(78)&ChrW(68))

conn.Execute(ChrW(65)&ChrW(76)&ChrW(84)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32) & a & ChrW(32)&ChrW(68)&ChrW(82)&ChrW(79)&ChrW(80)&ChrW(32)&ChrW(67)&ChrW(79)&ChrW(76)&ChrW(85)&ChrW(77)&ChrW(78)&ChrW(32) & b)
delFieldPlus=true
exit function
end if 
delFieldPlus=false
end function

function batchDelFieldPlus(a,b)
dim c,d
b=replace(replace(b,ChrW(44),ChrW(124)),ChrW(65292),ChrW(124))
c=split(b,ChrW(124))
for each d in c
if d <>"" then
call echoB(ChrW(21024)&ChrW(38500) & a & ChrW(34920)&ChrW(37324) & d&ChrW(23383)&ChrW(27573),delFieldPlus(a,d))
end if
next
end function


function editFieldTypeDefault(a,b,c)
if checkField(a,b) = true then
conn.execute(ChrW(65)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32)&ChrW(65)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(67)&ChrW(79)&ChrW(76)&ChrW(85)&ChrW(77)&ChrW(78)&ChrW(32)&ChrW(91) & b & ChrW(93)&ChrW(32) & c)
editFieldTypeDefault=true
exit function
end if 
editFieldTypeDefault=false
end function

function getFieldAlt(a, b) 
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
getFieldAlt=getMysqlFieldAlt_conn(a, b,conn)
else
getFieldAlt=getFieldAlt_conn(a, b,conn)
end if
end function

function getFieldAlt_conn(a, b,c)
getFieldAlt_conn=handle_getFieldAlt_conn(a, b,c,ChrW(91),ChrW(93))
end function 

function getMysqlFieldAlt(a, b)
getMysqlFieldAlt=getMysqlFieldAlt_conn(a, b,conn)
end function

function getMysqlFieldAlt_conn(a, b,c)
getMysqlFieldAlt_conn=handle_getFieldAlt_conn(a, b,c,ChrW(96),ChrW(96))
end function 
function handle_getFieldAlt_conn(a, b,c,d,e)
dim f, g, h, i,j,k,l
set i = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))    
j=ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&d& a & e

i.open j, c, 1, 1 
g = i.fields.count 
for f = 0 to g - 1
set h = i.fields.item(f)
if lcase(b) = lcase(h.name) then


l=cStr(i.fields(f).type)

select case l
case ChrW(50)&ChrW(48)&ChrW(48),ChrW(50)&ChrW(48)&ChrW(50)
k = ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) 
case ChrW(50)&ChrW(48)&ChrW(51)
k = ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) 
case ChrW(50)&ChrW(48)&ChrW(49)
k = ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) 
case ChrW(55)
k = ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) 
case ChrW(49)&ChrW(51)&ChrW(53)
k = ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) 
case ChrW(51)
k = ChrW(73)&ChrW(110)&ChrW(116)    
case ChrW(50)
k = ChrW(73)&ChrW(110)&ChrW(116)  
case ChrW(50)&ChrW(48)
k = ChrW(73)&ChrW(110)&ChrW(116)
case ChrW(49)&ChrW(55)
k = ChrW(73)&ChrW(110)&ChrW(116)
case ChrW(49)&ChrW(49)
k = ChrW(89)&ChrW(101)&ChrW(115)&ChrW(78)&ChrW(111) 
case ChrW(53)
k = ChrW(70)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116) 
case ChrW(54)
k = ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121) 
case else
msgBox(i.fields(f).type & vbCrLf & b & ChrW(31867)&ChrW(22411)&ChrW(65288)&i.fields(f).type&ChrW(65289)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(25910)&ChrW(24405)&ChrW(32)&ChrW(34920)&ChrW(20026) & a) 
k = ChrW(27809)&ChrW(31867)&ChrW(22411) & i.fields(f).type 
end select
exit for 
end if 
set h = nothing 
next : i.close 
handle_getFieldAlt_conn=k
end function

function getFieldAltNumb_conn(a, b,c) 
getFieldAltNumb_conn=handle_getFieldAltNumb_conn(a, b,c,ChrW(91),ChrW(93))
end function

function getMysqlFieldAltNumb_conn(a, b,c) 
getMysqlFieldAltNumb_conn=handle_getFieldAltNumb_conn(a, b,c,ChrW(96),ChrW(96))
end function

function handle_getFieldAltNumb_conn(a, b,c,d,e)
dim f, g, h, i,j
handle_getFieldAltNumb_conn=""
set i = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))  
j=ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&d&a&e

i.open j, c, 1, 1 
g = i.fields.count 
for f = 0 to g - 1
set h = i.fields.item(f)
if lcase(b) = lcase(h.name) then
handle_getFieldAltNumb_conn=i.fields(f).type
exit for
end if 
set h = nothing 
next : i.close 
end function

function getFieldDefaltValue(a,b)  
getFieldDefaltValue = getFieldDefaltValue_Conn(a,b,conn)
end function

function getFieldDefaltValue_Conn(a,b,c)  
on error resume next
Dim d 
Set d = c.openschema(4, Array(Empty, Empty, a, b))
getFieldDefaltValue_Conn = d(ChrW(67)&ChrW(79)&ChrW(76)&ChrW(85)&ChrW(77)&ChrW(78)&ChrW(95)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(65)&ChrW(85)&ChrW(76)&ChrW(84))  
end function

function getTableList_Conn(a) 
dim b, c, d 
set d = a.openschema(20)
d.movefirst 
do until d.eof
if d(ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(95)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)) = ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69) then
b = d(ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69)) 
if c <> "" then c = c & vbCrLf 
c = c & b 
end if 
d.movenext 
loop 
getTableList_Conn = c 
end function

function getTableList()
getTableList = getTableList_Conn(conn) 
end function 

function getFieldList(a)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
getFieldList = getMysqlFieldList_conn(a,conn)
else
getFieldList = getFieldList_conn(a,conn)
end if
end function 

function getFieldList_conn(a,b) 
getFieldList_conn = handle_getFieldList_conn(a,b,ChrW(91),ChrW(93)) 
end function

function getMysqlFieldList(a)
getMysqlFieldList = getMysqlFieldList_conn(a,conn)
end function 

function getMysqlFieldList_conn(a,b) 
getMysqlFieldList_conn = handle_getFieldList_conn(a,b,ChrW(96),ChrW(96)) 
end function

function handle_getFieldList_conn(a,b,c,d) 
dim e, f, g, h,i,j
Set i = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))


j=ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&c&a&d


i.open j, b, 1, 1 
if i.fields.count = 0 then exit function
e = i.fields.count 

f = ChrW(44) 
for h = 0 to e - 1
set g = i.fields.item(h)
f = f & g.name & ChrW(44) 
set g = nothing 
next : i.close 
handle_getFieldList_conn = f 
end function

function getFieldConfigList(a)
dim b, c, d, e, f 
dim g,h
g=ChrW(91)
h=ChrW(93)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then        
g=ChrW(96)
h=ChrW(96)
end if


tempRs.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&g& a&h, conn, 1, 1 
if tempRs.fields.count = 0 then exit function
b = tempRs.fields.count 

c = ChrW(44) 
for e = 1 to b - 1
set d = tempRs.fields.item(e)


if d.type = 3 or d.type = 5 or d.type = 11 then
f = ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(124)&ChrW(48) 
elseif d.type = 7 or d.type = 135 then
f = ChrW(124)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(124) 
elseif d.type = 203 or d.type = 201 then
f = ChrW(124)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(124) 
else
f = ChrW(124)&ChrW(124) 
end if 
c = c & d.name & f & ChrW(44) 
set d = nothing 
next : tempRs.close 
getFieldConfigList = c 
end function 

function getFirstField(a)
dim b, c, d, e ,f
dim g,h
g=ChrW(91)
h=ChrW(93)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then        
g=ChrW(96)
h=ChrW(96)
end if
Set f = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))


f.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&g& a &h, conn, 1, 1 
if f.fields.count = 0 then exit function
b = f.fields.count 

getFirstField =f.fields.item(0).name
end function 

function getInstallFieldList(a)
dim b, c, d, e,f 
dim g,h
g=ChrW(91)
h=ChrW(93)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then        
g=ChrW(96)
h=ChrW(96)
end if
Set f = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))


f.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&g& a &h, conn, 1, 1 
if f.fields.count = 0 then exit function
b = f.fields.count 

for e =1 to b - 1
set d = f.fields.item(e)
if c <>"" then
c=c & ChrW(44)
end if
c = c & d.name
set d = nothing 
next : f.close 
getInstallFieldList = c 
end function 

function getDifferentTableFieldList(a, b)
dim c, d, e, f ,g,h
Set g = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))

if typeName(a) = ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) then
set h = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
h.open(a) 
end if

g.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & b & ChrW(93), h, 1, 1 
c = g.fields.count 
d = ChrW(44) 
for f = 1 to c - 1
set e = g.fields.item(f)
d = d & e.name & ChrW(44) 
set e = nothing 
next : g.close 
getDifferentTableFieldList = d 
end function 



function compactDB(a, b)
dim c, d, e, f 
a = handlePath(a) 
e = left(a, inStrRev(a, ChrW(92))) 
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.fileexists(a) then
c.copyfile a, e & ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98) 
set d = createObject(ChrW(74)&ChrW(82)&ChrW(79)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(69)&ChrW(110)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(101))
if b = true then
d.compactdatabase ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(61) & e & ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98), ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(61) & e & ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(49)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98)&ChrW(59) & ChrW(74)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(58)&ChrW(69)&ChrW(110)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61) & f 
else
d.compactdatabase ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(61) & e & ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98), ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(61) & e & ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(49)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98) 
end if 
c.copyfile e & ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(49)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98), a 
c.deletefile(e & ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98)) 
c.deletefile(e & ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(49)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98)) 
set d = nothing 
compactDB = ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(35)&ChrW(70)&ChrW(70)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(62)&ChrW(20320)&ChrW(30340)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(44)&ChrW(32) & a & ChrW(44)&ChrW(32)&ChrW(24050)&ChrW(32463)&ChrW(21387)&ChrW(32553)&ChrW(25104)&ChrW(21151)&ChrW(33)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62) & vbCrLf 
else
compactDB = ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(35)&ChrW(70)&ChrW(70)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(62)&ChrW(60)&ChrW(98)&ChrW(62)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(21517)&ChrW(31216)&ChrW(25110)&ChrW(36335)&ChrW(24452)&ChrW(19981)&ChrW(27491)&ChrW(30830)&ChrW(46)&ChrW(32)&ChrW(35831)&ChrW(37325)&ChrW(35797)&ChrW(33)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62) & vbCrLf 
end if 
set c = nothing 
end function 

function getAccessPass(a)
on error resume next
Dim b:Set b = Server.CreateObject(ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(68)&ChrW(108)&ChrW(108)&ChrW(46)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97))
getAccessPass=b.getaccesspass(server.mapPath(a)) 
end function

function editAccessPassWord(a, b, c)
dim d, e 
set e = createObject(ChrW(74)&ChrW(82)&ChrW(79)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(69)&ChrW(110)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(101))
call handlePath(a)
d = ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(78)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(46)&ChrW(77)&ChrW(100)&ChrW(98) 
call handlePath(d)
call deleteFile(d) 
on error resume next 
e.compactdatabase ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(61) & a & ChrW(59)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(58)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(61) & b, ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(61) & d & ChrW(59)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(58)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(61) & c 
if err.number <> 0 then editAccessPassWord = ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823) : err.clear : exit function 
call deleteFile(a)
call MoveFile(d, a)
editAccessPassWord = ChrW(20462)&ChrW(25913)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(26032)&ChrW(23494)&ChrW(30721)&ChrW(20026)&ChrW(91) & c & ChrW(93) 
set e = nothing 
end function 



sub exportToExcel(a)
response.contentType = ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(118)&ChrW(110)&ChrW(100)&ChrW(46)&ChrW(109)&ChrW(115)&ChrW(45)&ChrW(69)&ChrW(120)&ChrW(99)&ChrW(101)&ChrW(108) 
response.addHeader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(68)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110), ChrW(97)&ChrW(116)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(59)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(82)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(115)&ChrW(46)&ChrW(120)&ChrW(108)&ChrW(115) 
response.write(ChrW(60)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbCrLf) 
response.write(a & vbCrLf) 
response.write(ChrW(60)&ChrW(47)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62) & vbCrLf) 
response.write(ChrW(60)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(62) & vbCrLf) 
end sub 

sub importToDatabase()

dim a, b, c 
a = server.mapPath(ChrW(49)&ChrW(46)&ChrW(120)&ChrW(108)&ChrW(115)) 
set b = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
b.open ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(69)&ChrW(120)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(101)&ChrW(115)&ChrW(61)&ChrW(69)&ChrW(120)&ChrW(99)&ChrW(101)&ChrW(108)&ChrW(32)&ChrW(56)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(61) & a 
set c = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))

dim d, e, f 
d = server.mapPath("" & adminDir & ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98)) 
set e = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
e.open ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(77)&ChrW(105)&ChrW(99)&ChrW(114)&ChrW(111)&ChrW(115)&ChrW(111)&ChrW(102)&ChrW(116)&ChrW(46)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(46)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(52)&ChrW(46)&ChrW(48)&ChrW(59)&ChrW(74)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(79)&ChrW(76)&ChrW(69)&ChrW(68)&ChrW(66)&ChrW(58)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(39)&ChrW(39)&ChrW(59)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32) & d 
set f = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))

dim g, h, i, j 
c.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&ChrW(69)&ChrW(120)&ChrW(99)&ChrW(101)&ChrW(108)&ChrW(36)&ChrW(93), b, 1, 1 
g = c.fields.count 
for h = 1 to g - 1
set i = c.fields.item(h)
j = j & i.name & ChrW(44) 
set i = nothing 
next : c.close 
call echo(ChrW(120)&ChrW(108)&ChrW(115)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116), j) 

dim k, l 
k = split(j, ChrW(44)) 
c.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&ChrW(69)&ChrW(120)&ChrW(99)&ChrW(101)&ChrW(108)&ChrW(36)&ChrW(93), b, 1, 1 
call echo(ChrW(120)&ChrW(108)&ChrW(115)&ChrW(37324)&ChrW(25968)&ChrW(25454)&ChrW(26377), c.recordcount) 

while not c.eof
f.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(116)&ChrW(93), e, 1, 3 
f.addnew 
for each l in k
l = trim(l) 
if l <> "" then
call echo(ChrW(26174)&ChrW(31034)&ChrW(23383)&ChrW(27573), l) 
doevents 
f(l) = c(l) 
end if 
next 
call echo(ChrW(28155)&ChrW(21152)&ChrW(35760)&ChrW(24405), "") 

f.update : f.close 
c.movenext : wend : c.close 
end sub

function getDataTableList(a, b)
dim c, d, e, f, g 
f = f & ChrW(60)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(61)&ChrW(34)&ChrW(49)&ChrW(48)&ChrW(48)&ChrW(37)&ChrW(34)&ChrW(32)&ChrW(98)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(34)&ChrW(49)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(101)&ChrW(108)&ChrW(108)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(99)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(61)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(101)&ChrW(108)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(61)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(62) & vbCrLf 

c = getFieldList(a) 

d = split(c, ChrW(44)) 
f = f & ChrW(32)&ChrW(32)&ChrW(60)&ChrW(116)&ChrW(114)&ChrW(62) & vbCrLf 
for e = 1 to uBound(d) - 1
f = f & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(116)&ChrW(100)&ChrW(62) & d(e) & ChrW(60)&ChrW(47)&ChrW(116)&ChrW(100)&ChrW(62) & vbCrLf 
next 
f = f & ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(114)&ChrW(62) & vbCrLf 
rs.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32) & b, conn, 1, 1 
while not rs.EOF
f = f & ChrW(32)&ChrW(32)&ChrW(60)&ChrW(116)&ChrW(114)&ChrW(62) & vbCrLf 
for each g in d
if g <> "" then
f = f & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(116)&ChrW(100)&ChrW(62) & rs(g) & ChrW(60)&ChrW(47)&ChrW(116)&ChrW(100)&ChrW(62) & vbCrLf 
end if 
next 
f = f & ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(114)&ChrW(62) & vbCrLf 
rs.moveNext : wend : rs.close 
f = f & ChrW(60)&ChrW(47)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(62) & vbCrLf 
getDataTableList = f 
end function 

function setTableField(a, b)
dim c, d, e, f, g, h, i, j 
c = split(b, ChrW(124)) 
for e = 0 to uBound(c)
f = c(e) 
if f <> "" then
d = split(f, ChrW(44)) 
h = d(0) 
i = d(1) 
on error resume next 
j = ChrW(97)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & h & ChrW(32)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32) & i & ChrW(32) & d(2) & "" 
a.execute j 
if err.number = 0 then
g = g & ChrW(91)&ChrW(34920) & h & ChrW(93)&ChrW(12304)&ChrW(23383)&ChrW(27573) & i & ChrW(12305)&ChrW(28155)&ChrW(21152)&ChrW(26032)&ChrW(23383)&ChrW(27573)&ChrW(25104)&ChrW(21151)&ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62) & vbCrLf 
else
err.close 
g = g & ChrW(91)&ChrW(34920) & h & ChrW(93)&ChrW(12304)&ChrW(23383)&ChrW(27573) & i & ChrW(12305)&ChrW(28155)&ChrW(21152)&ChrW(22833)&ChrW(36133)&ChrW(60)&ChrW(104)&ChrW(114)&ChrW(62) & vbCrLf 
end if 
end if 
next 
setTableField = g 
end function 

function getTypeString(a)
select case a
case 0 : getTypeString = ChrW(69)&ChrW(109)&ChrW(112)&ChrW(116)&ChrW(121)
case 16 : getTypeString = ChrW(84)&ChrW(105)&ChrW(110)&ChrW(121)&ChrW(73)&ChrW(110)&ChrW(116)
case 2 : getTypeString = ChrW(83)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(73)&ChrW(110)&ChrW(116)
case 3 : getTypeString = ChrW(73)&ChrW(110)&ChrW(116)
case 20 : getTypeString = ChrW(66)&ChrW(105)&ChrW(103)&ChrW(73)&ChrW(110)&ChrW(116)
case 17 : getTypeString = ChrW(85)&ChrW(110)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(101)&ChrW(100)&ChrW(84)&ChrW(105)&ChrW(110)&ChrW(121)&ChrW(73)&ChrW(110)&ChrW(116)
case 18 : getTypeString = ChrW(85)&ChrW(110)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(101)&ChrW(100)&ChrW(83)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(73)&ChrW(110)&ChrW(116)
case 19 : getTypeString = ChrW(85)&ChrW(110)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(101)&ChrW(100)&ChrW(73)&ChrW(110)&ChrW(116)
case 21 : getTypeString = ChrW(85)&ChrW(110)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(101)&ChrW(100)&ChrW(66)&ChrW(105)&ChrW(103)&ChrW(73)&ChrW(110)&ChrW(116)
case 4 : getTypeString = ChrW(83)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(101)
case 5 : getTypeString = ChrW(68)&ChrW(111)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(101)
case 6 : getTypeString = ChrW(67)&ChrW(117)&ChrW(114)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(121)
case 14 : getTypeString = ChrW(68)&ChrW(101)&ChrW(99)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(108)
case 131 : getTypeString = ChrW(78)&ChrW(117)&ChrW(109)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(99)
case 11 : getTypeString = ChrW(66)&ChrW(105)&ChrW(116)
case 10 : getTypeString = ChrW(69)&ChrW(114)&ChrW(114)&ChrW(111)&ChrW(114)
case 132 : getTypeString = ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(100)
case 12 : getTypeString = ChrW(86)&ChrW(97)&ChrW(114)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(116)
case 9 : getTypeString = ChrW(73)&ChrW(68)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)
case 13 : getTypeString = ChrW(73)&ChrW(85)&ChrW(110)&ChrW(107)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(110)
case 72 : getTypeString = ChrW(71)&ChrW(85)&ChrW(73)&ChrW(68)
case 7 : getTypeString = ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)
case 133 : getTypeString = ChrW(68)&ChrW(66)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)
case 134 : getTypeString = ChrW(68)&ChrW(66)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)
case 135 : getTypeString = ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)
case 8 : getTypeString = ChrW(66)&ChrW(83)&ChrW(84)&ChrW(82)
case 129 : getTypeString = ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)
case 200 : getTypeString = ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)
case 201 : getTypeString = ChrW(76)&ChrW(111)&ChrW(110)&ChrW(103)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)
case 130 : getTypeString = ChrW(87)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)
case 202 : getTypeString = ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)
case 203 : getTypeString = ChrW(77)&ChrW(101)&ChrW(109)&ChrW(111)
case 128 : getTypeString = ChrW(66)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121)
case 204 : getTypeString = ChrW(86)&ChrW(97)&ChrW(114)&ChrW(66)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121)
case 205 : getTypeString = ChrW(76)&ChrW(111)&ChrW(110)&ChrW(103)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(66)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121)
case else : getTypeString = ChrW(85)&ChrW(110)&ChrW(107)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(32)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)
end select
end function 

function getProductRndIdList(a, b)
dim c, d, e, f, g, h, i, j 

c = a.recordcount 
b = CInt(b)
h = 0 
randomize timer

for e = 1 to 3
for d = 1 to c
i = int(rnd * c + 1) 
if inStr(ChrW(44) & f & ChrW(44), ChrW(44) & i & ChrW(44)) = false then
f = f & i & ChrW(44) 
h = h + 1 
if h >= b then

exit for 
end if 
end if 
next 
if h >= b then exit for 
next 

j = split(f, ChrW(44)) 
for d = 1 to c
if inStr(ChrW(44) & f & ChrW(44), ChrW(44) & d & ChrW(44)) > 0 then
g = g & a(0) & ChrW(44) 
end if 
a.movenext : next 
if g <> "" then g = left(g, len(g) - 1) 
getProductRndIdList = g 

end function 

function getFieldValue(a, b, c)
dim d 
call OpenConn() 
set d = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
d.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32) & c, conn, 1, 1 
if not d.eof then
getFieldValue = d(b) 
end if : d.close 
end function

function getFieldValueList(a, b)
dim c,d,e
call OpenConn() 
set c = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open a, conn, 1, 1 
while not c.eof
if e <>"" then
e=e & vbcrlf
end if
e=e & c(b) 
c.movenext:wend:c.close
getFieldValueList=e
end function

function getConnFieldValue(a, b, c, d)
on error resume next 
dim e 
set e = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
e.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & b & ChrW(93)&ChrW(32) & d, a, 1, 1 
if not e.eof then

getConnFieldValue = e(c) 
end if : e.close 
if err <> 0 then call eerr(b, c) 
end function

function setFieldValue(a, b, c, d)
dim e 
call OpenConn() 
setFieldValue = false 
set e = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
e.open ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32) & d, conn, 1, 3 
if not e.eof then
e(b) = c 
e.update 
setFieldValue = true 
end if : e.close 
end function

function fileBinaryAddAccess(a, b, c, d, e, f)
dim g, h 
set h = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
g = ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32) & c & ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & b & ChrW(93) 
g = getWhereAnd(g, e) 
if d <> "" then
g = getWhereAnd(g, ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(61) & d) 
end if 
h.open g, a, 1, 3 
if not h.eof then
h(c).appendChunk getFileBinaryContent(f) 

h.update 
end if : h.close 
end function

function showAccessStream(a, b, c, d, e)
dim f, g 
set g = createObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
f = ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32) & c & ChrW(32)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91) & b & ChrW(93) 
f = getWhereAnd(f, e) 
if d <> "" then
f = getWhereAnd(f, ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(61) & d) 
end if 
g.open f, a, 1, 3 
if not g.eof then

response.binaryWrite g(c).getChunk(7500000) 
end if : g.close 
end function

function databaseToMysql(a,b,c,d)
dim e,f,g,h,i,j,k,l,m,n,o,p,q
e=getTableList_Conn(b)
f=split(e,vbcrlf)
if d then call echo(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116),e)
if d then  call echo(ChrW(102)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),c)
if d then  call echo(ChrW(117)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(40)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(41),ubound(f))
for g=0 to ubound(f)
h=f(g):o=h
if d then call echo(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),h)
if g>129 then exit for
if a <>"" then o=mid(h,len(a)+1)
if d then call echo(c,o)
if instr(ChrW(124)& c &ChrW(124),ChrW(124)& lcase(o) &ChrW(124)) or c=ChrW(42) then

m=m&ChrW(67)&ChrW(82)&ChrW(69)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32)&ChrW(96)& o &ChrW(96)&ChrW(32)&ChrW(40) & vbcrlf

if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
i=getMysqlFieldList_conn(h,b)
else
i=getFieldList_conn(h,b)
end if

if d then call echo(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),h)
j=IIF(i <>lcase(i),ChrW(60)&ChrW(98)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(39)&ChrW(62)&ChrW(26377)&ChrW(22823)&ChrW(20889)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62),"")
if d then call echo(copystr(ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59),4) & ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116) & j,i)
k=split(i,ChrW(44))
for each l in k
if l <>"" then
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
n=getMysqlFieldAlt_conn(h,l,b)
else
n=getFieldAlt_conn(h,l,b)
end if
if d then call echo(copystr(ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59),8) & ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),l &ChrW(32)&ChrW(32)&ChrW(40)& n &ChrW(41))
q=""           
if n=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(40)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(39)&ChrW(44)&ChrW(32) & vbcrlf
elseif n=ChrW(73)&ChrW(110)&ChrW(116) then
if instr(ChrW(124)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(50)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf
elseif instr(ChrW(124)&ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108)&ChrW(124)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(124)&ChrW(119)&ChrW(124)&ChrW(104)&ChrW(124)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(124)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(124)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(124)&ChrW(102)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(104)&ChrW(117)&ChrW(124)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(51)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf
elseif instr(ChrW(124)&ChrW(108)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(124)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(52)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf
elseif instr(ChrW(124)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(124)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(124)&ChrW(112)&ChrW(118)&ChrW(124)&ChrW(102)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(121)&ChrW(124)&ChrW(109)&ChrW(97)&ChrW(120)&ChrW(102)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(121)&ChrW(124)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(115)&ChrW(124)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(101)&ChrW(114)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(121)&ChrW(124)&ChrW(101)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(115)&ChrW(111)&ChrW(99)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(124)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(124)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(101)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(110)&ChrW(99)&ChrW(101)&ChrW(124)&ChrW(112)&ChrW(97)&ChrW(121)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(121)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(97)&ChrW(117)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(101)&ChrW(120)&ChrW(97)&ChrW(109)&ChrW(124)&ChrW(99)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(124)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(124)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(111)&ChrW(100)&ChrW(124)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(111)&ChrW(100)&ChrW(124)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(124)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(115)&ChrW(111)&ChrW(99)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(124)&ChrW(106)&ChrW(111)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(124)&ChrW(99)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(124)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(124)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(97)&ChrW(124)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(98)&ChrW(124)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(124)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(115)&ChrW(101)&ChrW(98)&ChrW(124)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(124)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(124)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(124)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(124)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(51)&ChrW(50)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(124)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(107)&ChrW(121)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(124)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(107)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(104)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(51)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(52)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(53)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(54)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(55)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(56)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(57)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(48)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(49)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(50)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(51)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(52)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(53)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(54)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(55)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(56)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(49)&ChrW(57)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(48)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(49)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(50)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(51)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(52)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(53)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(54)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(55)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(56)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(50)&ChrW(57)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(51)&ChrW(48)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(51)&ChrW(49)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(53)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf
elseif instr(ChrW(124)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(101)&ChrW(120)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(111)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(124)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(122)&ChrW(105)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(116)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(124)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(124)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(116)&ChrW(111)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(105)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(54)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf 
elseif instr(ChrW(124)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115)&ChrW(124)&ChrW(103)&ChrW(111)&ChrW(111)&ChrW(100)&ChrW(124)&ChrW(98)&ChrW(97)&ChrW(100)&ChrW(124)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(57)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf 
elseif instr(ChrW(124)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(124)&ChrW(111)&ChrW(110)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(124)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(124)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(124)&ChrW(110)&ChrW(98)&ChrW(117)&ChrW(121)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(116)&ChrW(124)&ChrW(115)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(124)&ChrW(111)&ChrW(112)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(124)&ChrW(98)&ChrW(111)&ChrW(121)&ChrW(111)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(114)&ChrW(108)&ChrW(124)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(121)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(49)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(32)&vbcrlf 
elseif instr(ChrW(124)&ChrW(105)&ChrW(100)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q=ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(54)&ChrW(41)&ChrW(32)&ChrW(117)&ChrW(110)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(101)&ChrW(100)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(44) & vbcrlf
p=l
else
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(57)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf

end if
elseif n=ChrW(70)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116) then 
if instr(ChrW(124)&ChrW(102)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(104)&ChrW(117)&ChrW(124)&ChrW(103)&ChrW(111)&ChrW(116)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(107)&ChrW(124)&ChrW(97)&ChrW(115)&ChrW(107)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(124)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(97)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(124)&ChrW(98)&ChrW(101)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(124)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(124)&ChrW(124)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(40)&ChrW(51)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf
elseif instr(ChrW(124)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(101)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(108)&ChrW(102)&ChrW(101)&ChrW(101)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(40)&ChrW(53)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf
elseif instr(ChrW(124)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(124),ChrW(124)&l&ChrW(124))>0 then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(40)&ChrW(57)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf
else
call eerr(ChrW(25552)&ChrW(31034),ChrW(70)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(28014)&ChrW(28857)&ChrW(31867)&ChrW(22411)&ChrW(27809)&ChrW(26377)&ChrW(21028)&ChrW(26029))   
end if
elseif n=ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(65)&ChrW(85)&ChrW(76)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(44)&vbcrlf
elseif n=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(109)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(117)&ChrW(109)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(44)&vbcrlf
elseif n="" then
q=ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(54)&ChrW(41)&ChrW(32)&ChrW(117)&ChrW(110)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(101)&ChrW(100)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(44) & vbcrlf
p=l
elseif n=ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121) then
q= ChrW(96)& l &ChrW(96)&ChrW(32)&ChrW(68)&ChrW(69)&ChrW(67)&ChrW(73)&ChrW(77)&ChrW(65)&ChrW(76)&ChrW(40)&ChrW(49)&ChrW(57)&ChrW(44)&ChrW(52)&ChrW(41)&ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(39)&ChrW(48)&ChrW(39)&ChrW(44)&vbcrlf
else
call eerr(ChrW(25552)&ChrW(31034),ChrW(23383)&ChrW(31526)&ChrW(31867)&ChrW(22411)&ChrW(27809)&ChrW(26377)&ChrW(21028)&ChrW(26029)&ChrW(44)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(108)&ChrW(116)&ChrW(61)&n)
end if
if q <>"" then m=m & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&q 
end if
next
doevents
m=m & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(80)&ChrW(82)&ChrW(73)&ChrW(77)&ChrW(65)&ChrW(82)&ChrW(89)&ChrW(32)&ChrW(75)&ChrW(69)&ChrW(89)&ChrW(32)&ChrW(32)&ChrW(40)&ChrW(96)& p &ChrW(96)&ChrW(41) & vbcrlf
m=m & ChrW(41) & vbcrlf

end if
next
databaseToMysql=m
end function

function databaseToInstall(a,b,c,d)
databaseToInstall=handle_databaseTo(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108),a,b,c,d)
end function

function databaseToAccess(a,b,c,d)
databaseToAccess=handle_databaseTo(ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115),a,b,c,d)
end function

function databaseToSqlServer(a,b,c,d)
databaseToSqlServer=handle_databaseTo(ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114),a,b,c,d)
end function

function handle_databaseTo(a,b,c,d,e)
dim f,g,h,i,j,k,l,m,n,o,p,q
dim r,s,t,u,v,w,x,y
f=getTableList_Conn(c)
f=lcase(f)
d=lcase(d)
g=split(f,vbcrlf)
if e then call echo(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116),f)
for h=0 to ubound(g)
i=g(h):p=i
if h>129 then exit for
if b <>"" then p=mid(i,len(b)+1)
if e then call echo(d,p)
t=p 
if instr(ChrW(124)& d &ChrW(124),ChrW(124)& p &ChrW(124)) or d=ChrW(42) then
n=n & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)& t &ChrW(34)&ChrW(32) & vbcrlf
n=n & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(40)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110) & vbcrlf
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
j=getMysqlFieldList_conn(i,c)
else
j=getFieldList_conn(i,c)
end if
if e then call echo(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),i)
k=IIF(j <>lcase(j),ChrW(60)&ChrW(98)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(39)&ChrW(62)&ChrW(26377)&ChrW(22823)&ChrW(20889)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62),"")
if e then call echo(copystr(ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59),4) & ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116) & k,j)
l=split(j,ChrW(44))
s=0 
v=v&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&t&ChrW(32)&ChrW(40) & vbcrlf
x=x&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&t&ChrW(32)&ChrW(40) & vbcrlf
n=n & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(32)&ChrW(40)&ChrW(34)&ChrW(32) & vbcrlf 
for each m in l
s=s+1
if m <>"" then
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
o=getMysqlFieldAlt_conn(i,m,c)
else
o=getFieldAlt_conn(i,m,c)
end if
r=getFieldDefaultVal_conn(i,m,c)
if isnul(r) then r=""
if r <>"" then
if o=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or o=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) then
r=replace(r,ChrW(34),"")
r=ChrW(34)&ChrW(34)& r &ChrW(34)&ChrW(34)
end if
end if
if r="" then 
r=ChrW(34)&ChrW(34)&ChrW(34)&ChrW(34)
elseif databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
if r=ChrW(39)&ChrW(67)&ChrW(85)&ChrW(82)&ChrW(82)&ChrW(69)&ChrW(78)&ChrW(84)&ChrW(95)&ChrW(84)&ChrW(73)&ChrW(77)&ChrW(69)&ChrW(83)&ChrW(84)&ChrW(65)&ChrW(77)&ChrW(80)&ChrW(39) then
r=ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)
end if
end if
if r <>"" then 
r = ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)& r
end if
if e then call echo(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108),r)
if e then call echo(copystr(ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59),8) & ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),m &ChrW(32)&ChrW(32)&ChrW(40)& o &ChrW(41))    
y=getFieldNote(i,m)
if y <>"" then y=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39) & y
if o=ChrW(73)&ChrW(110)&ChrW(116)  and s<3 and 1=1 then

v=v&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&m &ChrW(32)&ChrW(65)&ChrW(85)&ChrW(84)&ChrW(79)&ChrW(73)&ChrW(78)&ChrW(67)&ChrW(82)&ChrW(69)&ChrW(77)&ChrW(69)&ChrW(78)&ChrW(84)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) & vbcrlf
x=x&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&m &ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) & vbcrlf
n=n & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(91)&m &ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)&ChrW(34)&ChrW(32) & vbcrlf

else
n=n&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(91)&m&ChrW(93)&ChrW(32)& o & r &""& IIF(s <>ubound(l),ChrW(44),ChrW(41)) &ChrW(34) & y & vbcrlf
if o=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) then
w=ChrW(84)&ChrW(69)&ChrW(88)&ChrW(84)&ChrW(40)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(41)
elseif o=ChrW(73)&ChrW(110)&ChrW(116) then
w=ChrW(73)&ChrW(78)&ChrW(84)&ChrW(69)&ChrW(71)&ChrW(69)&ChrW(82)
elseif o=ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) then
w=ChrW(68)&ChrW(65)&ChrW(84)&ChrW(69)&ChrW(84)&ChrW(73)&ChrW(77)&ChrW(69)
elseif o=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) then
w=ChrW(77)&ChrW(69)&ChrW(77)&ChrW(79)
end if 

v=v&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&m&ChrW(32)& w &  IIF(s <>ubound(l),ChrW(44),ChrW(41)) & vbcrlf
x=x&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&m &ChrW(32)& o & replace(r,ChrW(34)&ChrW(34),ChrW(39)) &""& IIF(s <>ubound(l),ChrW(44),ChrW(41)) &y & vbcrlf
end if
end if
next
doevents
n=n & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(41)&ChrW(32)&ChrW(39)&ChrW(25226)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(31867)&ChrW(22411)&ChrW(36716)&ChrW(25104)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(31867)&ChrW(22411) & vbcrlf
n=n & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(46)&ChrW(101)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(41) & vbcrlf
n=n & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102) & vbcrlf
end if
next
if a=ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108) then
handle_databaseTo=n
elseif a=ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) then
handle_databaseTo=v
elseif a=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then
handle_databaseTo=handleSqlServer(x) 
end if
end function

function getFieldDefaultVal_conn(a,b,c)
dim d,e
b=lcase(b)
Set d = c.openschema(4,Array(Empty, Empty, a))
do while not d.eof


e=lcase(d(ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(95)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))
if e=b then
getFieldDefaultVal_conn=d(ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(95)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116))
if getFieldDefaultVal_conn=ChrW(34)&ChrW(34) then getFieldDefaultVal_conn=""
Set d = Nothing
Set d = Nothing
exit function
end if 
d.movenext
Loop
Set d = Nothing
Set d = Nothing
getFieldDefaultVal_conn=""
end function 

function getFieldDefaultVal(a,b)
getFieldDefaultVal=getFieldDefaultVal_conn(a,b,conn)
end function 

function getFieldNote(a,b)
dim c,d,e
dim f 
Dim g
Dim h
Dim i
set i=server.createobject(ChrW(97)&ChrW(100)&ChrW(111)&ChrW(120)&ChrW(46)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(111)&ChrW(103))
Dim j
set j=server.createobject(ChrW(97)&ChrW(100)&ChrW(111)&ChrW(120)&ChrW(46)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101))
Dim k
set k =server.createobject(ChrW(97)&ChrW(100)&ChrW(111)&ChrW(120)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110))
Dim l
a=lcase(a)

i.activeconnection =conn
For each j In i.tables
if lcase(j.name)=a then
For each k In j.columns 
if lcase(k.name)=b then
For each l In k.properties
if l.name=ChrW(68)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) then
getFieldNote=l.value
exit function
end if
Next
end if
Next
end if
Next 
getFieldNote=""
end function

function getTableListToSql(a,b,c)
dim d,e,f,g,h,i,j,k,l,m
d=getFieldList(b)
f=split(d,ChrW(44))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & b,conn,1,1 
for i=1 to c
if rs.eof then exit for
m=b
if a <>"" then
m=mid(b,len(a)+1)
end if
e=e & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(46)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(34)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(34)& m &ChrW(34)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(44)&ChrW(49)&ChrW(44)&ChrW(51) & vbcrlf
e=e & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(46)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&vbcrlf
for h=1 to ubound(f)-1
g=f(h)
l=getFieldAlt(b,g)
j=rs(g)
if isNull(j) then j=""
j=replace(replace(j,ChrW(34),ChrW(34)&ChrW(34)),vbcrlf,ChrW(34)&ChrW(38)&ChrW(118)&ChrW(98)&ChrW(99)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(38)&ChrW(34))

if j="" and l=ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) then
j=ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)
elseif j <>"" then
j=ChrW(34) & j & ChrW(34)
end if
if j <>"" then

e=e & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)& g &ChrW(34)&ChrW(41)&ChrW(61) & j & vbcrlf
end if
next
e=e & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(46)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(58)&ChrW(114)&ChrW(115)&ChrW(46)&ChrW(99)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101) & vbcrlf & vbcrlf
rs.movenext:next:rs.close
getTableListToSql=e
end function

function getTableListToSqlLanguage(a,b,c,d)
dim e,f,g,h,i,j,k,l,m,n
dim o,p
e=getFieldList(b)
g=split(e,ChrW(44))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & b,conn,1,1 

if d <>"" then
f=f & ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)& d &ChrW(32)&ChrW(111)&ChrW(102)&ChrW(102)&vbcrlf 
end if
f=f & ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)& b &ChrW(32)&ChrW(111)&ChrW(110)&vbcrlf
for j=1 to c
if rs.eof then exit for
n=b
if a <>"" then
n=mid(b,len(a)+1)
end if
o="":p=""
for i=1 to ubound(g)-1
h=g(i)
m=getFieldAlt(b,h)
if o <>"" then o=o & ChrW(44)&ChrW(32)
o=o & ChrW(91) & h & ChrW(93)
k=rs(h)
if isNull(k) then k=ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)
k=replace(k,ChrW(39),ChrW(39)&ChrW(39))
if p <>"" then p=p&ChrW(44)
p=p & ChrW(78)&ChrW(39)& k &ChrW(39)
next
f=f & ChrW(73)&ChrW(78)&ChrW(83)&ChrW(69)&ChrW(82)&ChrW(84)&ChrW(32)&ChrW(73)&ChrW(78)&ChrW(84)&ChrW(79)&ChrW(32)&ChrW(91)& b &ChrW(93)&ChrW(32)&ChrW(40)& o &ChrW(41)&ChrW(32)&ChrW(86)&ChrW(65)&ChrW(76)&ChrW(85)&ChrW(69)&ChrW(83)&ChrW(40)& p &ChrW(41) & vbcrlf & vbcrlf
rs.movenext:next:rs.close
getTableListToSqlLanguage=f
end function

function handleTableListToFile(a,b,c)
dim d,e,f,g,h,i,j,k,l,m,n
d=getFieldList(b)
f=split(d,ChrW(44))
m=ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(92)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(92) & b
if a <>"" then
m=ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(92)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(92) & mid(b,len(a)+1)
end if
call createFolder(m)
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & b,conn,1,1 
for i=1 to c
if rs.eof then exit for
n=m & ChrW(47) & i & ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)        
if checkFile(n)=false then
e=""
for h=1 to ubound(f)-1
g=f(h)
l=getFieldAlt(b,g)
j=rs(g)
if isNull(j) then j=""

e=e & ChrW(12304)& g &ChrW(12305)& j &ChrW(12304)&ChrW(47)& g &ChrW(12305) & vbcrlf
next
call writeToFile(n,e,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
call echo(ChrW(20445)&ChrW(23384)&ChrW(25991)&ChrW(20214),n)
doevents
end if
rs.movenext:next:rs.close
handleTableListToFile=i
end function 

function getTableListToSqlAspRun(a,b,c,d)
dim e,f,g,h,i,j,k,l,m,n
dim o,p,q,r
e=getFieldList(b)
g=split(e,ChrW(44))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & b,conn,1,1 
q=b
r=d
if a <>"" then
q=mid(q,len(a)+1)
r=mid(r,len(a)+1)
end if

if d <>"" then
f=f & ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(46)&ChrW(101)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(34)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(34)& r &ChrW(32)&ChrW(111)&ChrW(102)&ChrW(102)&ChrW(34)&ChrW(41)&vbcrlf 
end if
f=f & ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(46)&ChrW(101)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(34)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(34)& q &ChrW(32)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(41)&vbcrlf
for j=1 to c
if rs.eof then exit for
n=b
if a <>"" then
n=mid(b,len(a)+1)
end if
o="":p=""
for i=1 to ubound(g)-1
h=g(i)
m=getFieldAlt(b,h)
if o <>"" then o=o & ChrW(44)&ChrW(32)
o=o & ChrW(91) & h & ChrW(93)
k=rs(h)
if isNull(k) then 
k=ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)
if p <>"" then p=p&ChrW(44)
p=p & k
else
k=replace(k,ChrW(39),ChrW(39)&ChrW(39))
k=replace(k,ChrW(34), ChrW(34)&ChrW(34))
k=replace(k,ChrW(37)&ChrW(62), ChrW(37)&ChrW(34)&ChrW(38)&ChrW(34)&ChrW(62))
k=replace(k,ChrW(60)&ChrW(37), ChrW(60)&ChrW(34)&ChrW(38)&ChrW(34)&ChrW(37))
k=replace(k,vbcrlf,ChrW(32)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(118)&ChrW(98)&ChrW(99)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(32)&ChrW(38)&ChrW(34)&ChrW(32))
if p <>"" then p=p&ChrW(44)
p=p & ChrW(78)&ChrW(39)& k &ChrW(39)
end if
next
f=f & ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(46)&ChrW(101)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(34)&ChrW(32)&ChrW(73)&ChrW(78)&ChrW(83)&ChrW(69)&ChrW(82)&ChrW(84)&ChrW(32)&ChrW(73)&ChrW(78)&ChrW(84)&ChrW(79)&ChrW(32)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(34)&n&ChrW(40)& o &ChrW(41)&ChrW(32)&ChrW(86)&ChrW(65)&ChrW(76)&ChrW(85)&ChrW(69)&ChrW(83)&ChrW(40)& p &ChrW(41)&ChrW(34)&ChrW(41) & vbcrlf & vbcrlf
rs.movenext:next:rs.close
getTableListToSqlAspRun=f
end function


function accessDataToSqlServerData(a)
dim b,c,d,e,f,g,h,i
if a="" then a=3
call openconn()
b=getTableList()
call echo(ChrW(99)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),b)
c=split(b,vbcrlf)
for each e in c
call echo(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),e)
f=f & getTableListToSqlAspRun(db_PREFIX,e,a,d)
d=e
doevents
next


i=readfile(ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(112)&ChrW(108),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
g=replace(i,ChrW(39)&ChrW(20869)&ChrW(23481)&ChrW(39),f)
call writetofile(ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112),g,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
accessDataToSqlServerData=f
end function

function getTableComment(a)
dim b,c,d
d=lcase(a)
Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b=ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(46)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(39)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(39)&ChrW(44)
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(112)&ChrW(46)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(39)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(39)
b=b&ChrW(70)&ChrW(82)&ChrW(79)&ChrW(77)&ChrW(32)
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(46)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(116)
b=b&ChrW(32)&ChrW(73)&ChrW(78)&ChrW(78)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(74)&ChrW(79)&ChrW(73)&ChrW(78)&ChrW(32)
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(95)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(101)&ChrW(115)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(112)&ChrW(32)&ChrW(79)&ChrW(78)&ChrW(32)&ChrW(116)&ChrW(46)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(112)&ChrW(46)&ChrW(109)&ChrW(97)&ChrW(106)&ChrW(111)&ChrW(114)&ChrW(95)&ChrW(105)&ChrW(100)
b=b&ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32)
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(112)&ChrW(46)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(111)&ChrW(114)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(48)


c.open b,conn,1,1
while not c.eof
if a = lcase(c(ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))) then
getTableComment=c(ChrW(67)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116))
exit function
end if
c.movenext:wend:c.close
end function

function editTableComment(a,b)
on error resume next
dim c
c=ChrW(69)&ChrW(88)&ChrW(69)&ChrW(67)&ChrW(32)&ChrW(115)&ChrW(112)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(121)&ChrW(32)&ChrW(39)&ChrW(77)&ChrW(83)&ChrW(95)&ChrW(68)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)& b &ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(83)&ChrW(67)&ChrW(72)&ChrW(69)&ChrW(77)&ChrW(65)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(100)&ChrW(98)&ChrW(111)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)& a &ChrW(39)&ChrW(59) 
conn.execute(c) 
c=ChrW(69)&ChrW(88)&ChrW(69)&ChrW(67)&ChrW(32)&ChrW(115)&ChrW(112)&ChrW(95)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(121)&ChrW(32)&ChrW(39)&ChrW(77)&ChrW(83)&ChrW(95)&ChrW(68)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)& b &ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(83)&ChrW(67)&ChrW(72)&ChrW(69)&ChrW(77)&ChrW(65)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(100)&ChrW(98)&ChrW(111)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)& a &ChrW(39)
conn.execute(c)
end function

function getTableFieldComment(a,b)
dim c,d    
Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c=ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(112)&ChrW(46)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(121)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(112)&ChrW(46)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(121)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(32)&ChrW(32)
c=c&ChrW(32)&ChrW(70)&ChrW(82)&ChrW(79)&ChrW(77)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(46)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(32)&ChrW(32)&ChrW(73)&ChrW(78)&ChrW(78)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(74)&ChrW(79)&ChrW(73)&ChrW(78)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(32)&ChrW(79)&ChrW(78)&ChrW(32)&ChrW(116)&ChrW(46)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(99)&ChrW(46)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(32)
c=c&ChrW(32)&ChrW(76)&ChrW(69)&ChrW(70)&ChrW(84)&ChrW(32)&ChrW(79)&ChrW(85)&ChrW(84)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(74)&ChrW(79)&ChrW(73)&ChrW(78)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(95)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(101)&ChrW(115)&ChrW(32)&ChrW(101)&ChrW(112)&ChrW(32)&ChrW(79)&ChrW(78)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(112)&ChrW(46)&ChrW(109)&ChrW(97)&ChrW(106)&ChrW(111)&ChrW(114)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(99)&ChrW(46)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(32)
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(101)&ChrW(112)&ChrW(46)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(111)&ChrW(114)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(99)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(101)&ChrW(112)&ChrW(46)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(101)&ChrW(112)&ChrW(46)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(39)&ChrW(77)&ChrW(83)&ChrW(95)&ChrW(68)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(39)&ChrW(32)&ChrW(32)&ChrW(32)
c=c&ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(46)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(39)& a &ChrW(39)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(99)&ChrW(46)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(39)& b &ChrW(39)&ChrW(32)&ChrW(32)&ChrW(32)
d.open c,conn,1,1

if not d.eof then
getTableFieldComment=d(ChrW(80)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(121)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
end if:d.close
end function

function editTableFieldComment(a,b,c)
on error resume next
dim d
d=ChrW(69)&ChrW(88)&ChrW(69)&ChrW(67)&ChrW(32)&ChrW(115)&ChrW(112)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(121)&ChrW(32)&ChrW(39)&ChrW(77)&ChrW(83)&ChrW(95)&ChrW(68)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)& c &ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(83)&ChrW(67)&ChrW(72)&ChrW(69)&ChrW(77)&ChrW(65)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(100)&ChrW(98)&ChrW(111)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&a&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(67)&ChrW(79)&ChrW(76)&ChrW(85)&ChrW(77)&ChrW(78)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&b&ChrW(39)&ChrW(59)

conn.execute(d) 
d=ChrW(69)&ChrW(88)&ChrW(69)&ChrW(67)&ChrW(32)&ChrW(115)&ChrW(112)&ChrW(95)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(121)&ChrW(32)&ChrW(39)&ChrW(77)&ChrW(83)&ChrW(95)&ChrW(68)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)& c &ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(83)&ChrW(67)&ChrW(72)&ChrW(69)&ChrW(77)&ChrW(65)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(100)&ChrW(98)&ChrW(111)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&a&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(67)&ChrW(79)&ChrW(76)&ChrW(85)&ChrW(77)&ChrW(78)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&b&ChrW(39)&ChrW(59)

conn.execute(d)
end function
function getSql2(a)
dim b,c

If a=ChrW(26152)&ChrW(22825) or a=ChrW(26152)&ChrW(26085) Then
b = DateAdd(ChrW(100), -1, Date())
c = DateAdd(ChrW(100), -1, Date())

elseIf a=ChrW(21069)&ChrW(22825) or a=ChrW(21069)&ChrW(26085) Then
b = DateAdd(ChrW(100), -2, Date())
c = DateAdd(ChrW(100), -2, Date())

elseIf a=ChrW(22823)&ChrW(21069)&ChrW(22825) or a=ChrW(22823)&ChrW(21069)&ChrW(26085) Then
b = DateAdd(ChrW(100), -3, Date())
c = DateAdd(ChrW(100), -3, Date())

elseIf a=ChrW(26412)&ChrW(21608) Then
b = DateAdd(ChrW(100), 1 - Weekday(Date(), 2), Date())
c = Date()

elseIf a=ChrW(19978)&ChrW(21608) Then
b = DateAdd(ChrW(100), -7 - (Weekday(Date(), 2) - 1), Date())
c = DateAdd(ChrW(100), -1 - Weekday(Date(), 2), Date())

elseIf a=ChrW(26412)&ChrW(26376) Then
b = DateSerial(Year(Date()), Month(Date()), 1)
c = Date()

elseIf a=ChrW(19978)&ChrW(26376) Then
b = DateSerial(Year(Date()), Month(Date()) - 1, 1)
c = DateSerial(Year(Date()), Month(Date()), 0)

elseIf a=ChrW(26412)&ChrW(24180) Then
b = DateSerial(Year(Date()), 1, 1)
c = Date()

elseIf a=ChrW(21435)&ChrW(24180) Then
b = DateSerial(Year(Date()) - 1, 1, 1)
c = DateSerial(Year(Date()) - 1, 12, 31)

elseIf a=ChrW(21069)&ChrW(24180) Then
b = DateSerial(Year(Date()) - 2, 1, 1)
c = DateSerial(Year(Date()) - 2, 12, 31)
elseIf a=ChrW(20170)&ChrW(22825) or a=ChrW(20170)&ChrW(26085) Then
b = Date()
c = Date()
else
getSql2=""
exit function
End if
getSql2=ChrW(32)&ChrW(66)&ChrW(69)&ChrW(84)&ChrW(87)&ChrW(69)&ChrW(69)&ChrW(78)&ChrW(32)&ChrW(39) & b & ChrW(32)&ChrW(48)&ChrW(48)&ChrW(58)&ChrW(48)&ChrW(48)&ChrW(58)&ChrW(48)&ChrW(48) & ChrW(39)&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(39) & c & ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&ChrW(58)&ChrW(53)&ChrW(57) & ChrW(39)
end function
%>      
