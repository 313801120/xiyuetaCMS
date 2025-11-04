<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%

function listPage_copy_template_handle(a,b,c,d,e)
dim f,g,h



if a=ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116) then
f=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_js_function,f)=false then
public_listPage_js_function=public_listPage_js_function&f&vbcrlf
end if
end if 
f=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_js_function,f)=false then
public_listPage_js_function=public_listPage_js_function & f & vbcrlf
end if
f=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,f)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode & f & vbcrlf
end if 
if e <>"" then
f=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(45)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if e <>ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then 
f=replace(f,ChrW(34)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(34),ChrW(34)& e &ChrW(34))
call echoYellowB(ChrW(25552)&ChrW(31034),ChrW(22797)&ChrW(21046)&ChrW(25226)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(26367)&ChrW(25442)&ChrW(25104)&e)
end if
if idindexname <>"" and idindexname <>ChrW(105)&ChrW(100) then
f=replace(f,ChrW(38)&ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(73)&ChrW(68),ChrW(38)&ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&lcase(idindexname)&ChrW(32)&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(73)&ChrW(68))
f=replace(f,ChrW(34)&ChrW(32)&ChrW(79)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(32)&ChrW(66)&ChrW(121)&ChrW(32)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(34),ChrW(34)&ChrW(32)&ChrW(79)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(32)&ChrW(66)&ChrW(121)&ChrW(32)&ChrW(32)&lcase(idindexname)&ChrW(32)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(34))
f=replace(f,ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(41),ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&lcase(idindexname)&ChrW(34)&ChrW(41))
f=replace(f,ChrW(114)&ChrW(115)&ChrW(120)&ChrW(40)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(41),ChrW(114)&ChrW(115)&ChrW(120)&ChrW(40)&ChrW(34)&lcase(idindexname)&ChrW(34)&ChrW(41))
end if 

else
f=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if
if instr(public_listPage_asp_function,f)=false then








if d <>"" then
h=ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&d&ChrW(45)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if checkfile(h)=false then
call eerr(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(25552)&ChrW(31034)&ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312) & h,ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312)&replace(h,ChrW(92),ChrW(92)&ChrW(92))&ChrW(39)&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62))
end if
g=readfile(h,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) & vbcrlf
f=replace(f,ChrW(39)&ChrW(123)&ChrW(36861)&ChrW(21152)&ChrW(20195)&ChrW(30721)&ChrW(49)&ChrW(125)&ChrW(39),g)     

if instr(public_listPage_asp_function,f)=false then
public_listPage_asp_function=public_listPage_asp_function & f & vbcrlf
end if

if d=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101) then
f=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(83)&ChrW(117)&ChrW(98)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,f)=false then
public_listPage_asp_function=public_listPage_asp_function & f & vbcrlf
end if 
f=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,f)=false then
public_listPage_asp_function=public_listPage_asp_function & f & vbcrlf
end if 
elseif d=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105) then

f=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,f)=false then
public_listPage_asp_function=public_listPage_asp_function & f & vbcrlf
end if 
end if
else
public_listPage_asp_function=public_listPage_asp_function & f & vbcrlf
end if
end if 
end function
function listPage_del_template_handle(a,b,c,d) 
dim e,f,g
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_js_function,e)=false then
public_listPage_js_function=public_listPage_js_function & e & vbcrlf
end if  
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,e)=false then 
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if  
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,e)=false then

if d <>"" then
g=ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&d&ChrW(45)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if checkfile(g)=false then
call eerr(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(25552)&ChrW(31034)&ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312) & g,ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312)&replace(g,ChrW(92),ChrW(92)&ChrW(92))&ChrW(39)&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62))
end if
f=readfile(g,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) & vbcrlf
e=replace(e,ChrW(39)&ChrW(123)&ChrW(36861)&ChrW(21152)&ChrW(20195)&ChrW(30721)&ChrW(49)&ChrW(125)&ChrW(39),f)     

if instr(public_listPage_asp_function,e)=false then
public_listPage_asp_function=public_listPage_asp_function & e & vbcrlf
end if
else
public_listPage_asp_function=public_listPage_asp_function & e & vbcrlf
end if
end if 
end function
%>