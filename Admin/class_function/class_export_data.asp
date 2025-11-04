<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%


Class exportData 

function getDaoChuColumAllID(a,b,c,d)
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim f,g,h
h=d & IIF(d <>"",ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32),ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)) & ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &""&b&ChrW(93)&ChrW(32)&h& ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&c&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not e.eof 
if f <>"" then f=f & ChrW(44)
f=f & e(ChrW(105)&ChrW(100))
g=getDaoChuColumAllID(e(ChrW(105)&ChrW(100)),b,c,d)
if g <>"" then
f=f & ChrW(44) & g
end if
e.movenext:wend:e.close
getDaoChuColumAllID=f
end function
function handleDaoChuData(a)
handleDaoChuData=handleDaoChuData_plus("",a,"")
end function

function handleDaoChuData_plus(a,b,c)
dim d,e,f,g,h,i,j,k,l,m,n,o
b=lcase(b)
call openconn()
m=false
if instr(ChrW(124)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(124)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(124)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(124)&ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(124)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(124)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124),ChrW(124)&b&ChrW(124))>0   then
j=ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
if c="" then 
c=ChrW(45)&ChrW(49) 
end if      
o=getDaoChuColumAllID(c,b,ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107),k)
if c <>ChrW(45)&ChrW(49) then
if o <>"" then
o=c & ChrW(44) & o
else
o=c
end if
end if
l=split(o,ChrW(44))
m=true
if o <>"" then
j=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&o&ChrW(41) & j
end if

elseif c <>"" then
j=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c
end if 
if 1=1 then 
k=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(50)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& b & ChrW(93) & j

rs.open k,conn,1,1
g=rs.recordcount
dim p,q,r,s
p=getFieldList(db_PREFIX& b)
q=split(p,ChrW(44))
if rs.recordcount>0 then
if m=true then
if ubound(l)+1 <>rs.recordcount then
call eerr(ChrW(25552)&ChrW(31034)&ChrW(65292)&ChrW(20108)&ChrW(32423)&ChrW(20998)&ChrW(31867)&b & ChrW(26377)&ChrW(38382)&ChrW(39064)&ChrW(65292),ubound(l)+1 & ChrW(32)&ChrW(61)&ChrW(32) & rs.recordcount)
else
g=ubound(l)
end if
end if
end if
for n=1 to rs.recordcount
for each d in q 
d=lcase(d)
if d <>"" and d <>ChrW(105)&ChrW(100)  then
e=rs(d)
if m then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & b &ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&l(n-1),conn,1,1
if not rsx.eof then
e=rsx(d)

end if:rsx.close
end if
if e <>"" then
r=""

e=hanldeTeShuFieldValue(b,d,e)
if instr(e,chr(10))>0 or instr(e,chr(13))>0  then
r=ChrW(12304)&ChrW(47)&d&ChrW(12305)
end if
e=replace(e,ChrW(60) & ChrW(37),ChrW(12304)&ChrW(12298)&ChrW(12305) & ChrW(37))
f=f & ChrW(12304)&d&ChrW(12305)& e & r &vbcrlf
end if
end if 
next 
f=f & ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&vbcrlf
rs.movenext:next:rs.close
end if

if a=ChrW(103)&ChrW(101)&ChrW(116) then
handleDaoChuData_plus=f
exit function
end if
h= ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47) & b 
i = h & ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if f <>"" then
call createfolder(h)
call writeToFile(i,f,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
else
call deleteFile(i)
end if 
handleDaoChuData_plus=ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23548)&ChrW(20986)& b &ChrW(34920)&ChrW(37324)& g &ChrW(26465)&ChrW(25968)&ChrW(25454)&ChrW(65281)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125) 
end function

function hanldeTeShuFieldValue(a,b,c) 
if a = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103) or a = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110) or a = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)   then
if b=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&rsx(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
end if:rsx.close
elseif b=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
end if:rsx.close
end if
elseif a = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101) then
if b=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))
end if:rsx.close 
end if
elseif a = ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110) then
if b=ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
end if:rsx.close 
end if
elseif a = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) then
if b=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&rsx(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
end if:rsx.close 
elseif b=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
end if:rsx.close
end if

elseif  a = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114) or a = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) or a = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109) then 
if b=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& a&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then 
c=handleGetMoreClass(a,c,ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101),ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100),ChrW(105)&ChrW(100))
end if:rsx.close 
elseif b=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&rsx(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
end if:rsx.close
end if

elseif  a = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) then 
if b=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& a&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then 
c=handleGetMoreClass(a,c,ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101),ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100),ChrW(105)&ChrW(100))
end if:rsx.close 
elseif b=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
end if:rsx.close
end if
elseif a = ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) then 
if b=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then 

c=getMoreClass(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110),c)  
end if:rsx.close
end if
elseif a = ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) then 
if b=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then 

c=getMoreClass(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110),c)  
end if:rsx.close
end if
elseif a = ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105) then
if b=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then 

c=getMoreClass(ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105),c)  
end if:rsx.close
end if
elseif a = ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(99) then
if b=ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&rsx(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
end if:rsx.close 
end if
elseif a = ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115) then 
if b=ChrW(110)&ChrW(116)&ChrW(111)&ChrW(112) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(109)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=handleGetMoreClass(ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115),c,ChrW(115)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101),ChrW(110)&ChrW(116)&ChrW(111)&ChrW(112),ChrW(109)&ChrW(105)&ChrW(100))
end if:rsx.close
end if

elseif a = ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97) then 
if b=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then 

c=getMoreClass(ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115),c)  
end if:rsx.close
elseif b=ChrW(120)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(101)&ChrW(110)&ChrW(108)&ChrW(101)&ChrW(105) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(110)&ChrW(101)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=getMoreClass(ChrW(110)&ChrW(101)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115),c)  
end if:rsx.close
elseif b=ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&rsx(ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
end if:rsx.close 
elseif b=ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(109)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then
c=handleGetMoreClass(ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115),c,ChrW(115)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101),ChrW(110)&ChrW(116)&ChrW(111)&ChrW(112),ChrW(109)&ChrW(105)&ChrW(100))
end if:rsx.close
end if
elseif a = ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115) then
if b=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& a &ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then

c=getMoreClass(a,c)  
end if:rsx.close
end if
elseif a = ChrW(110)&ChrW(101)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115) then
if b=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then


rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& a & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not rsx.eof then

c=getMoreClass(a,c)

end if:rsx.close
end if
else 

end if
hanldeTeShuFieldValue=c
end function

function getMoreClass(a,b)  
getMoreClass=handleGetMoreClass(a,b,ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101),ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100),ChrW(105)&ChrW(100))
end function

function handleGetMoreClass(a,b,c,d,e)  
dim f,g,h,i:i=false
dim j:Set j = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))  
if i then call echoREd(ChrW(24320)&ChrW(22987),b)
if c="" then c=ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)
if d="" then d=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)
if e="" then e=ChrW(105)&ChrW(100)
for h=1 to 10
j.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &a&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&e&ChrW(61)&b,conn,1,1
if not j.eof then
f=j(c)
if i then
call echo(ChrW(105),h)
call echo(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),a)
call echo(b,f)
call hr()
end if
if g <>"" then f= f & ChrW(91)&ChrW(45)&ChrW(45)&ChrW(62)&ChrW(62)&ChrW(93)
g=f&g
if b=-1 or isNul(b) then 
if i then call echo(ChrW(36864)&ChrW(20986)&ChrW(49),ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(78)&ChrW(117)&ChrW(108)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(41))
exit for
end if
if j(d)=-1 then 
if i then call echo(ChrW(36864)&ChrW(20986)&ChrW(50),ChrW(114)&ChrW(115)&ChrW(120)&ChrW(40)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(61)&ChrW(45)&ChrW(49))
exit for
end if
b=j(d)
end if:j.close 
next
g=a&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&d&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&e&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&c&ChrW(91)&ChrW(61)&ChrW(61)&ChrW(62)&ChrW(62)&ChrW(93)&g
handleGetMoreClass=g 
end function
End class
%>
