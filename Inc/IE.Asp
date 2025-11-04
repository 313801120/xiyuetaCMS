<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


function getBrType(a)
dim b, c, d 
d = ChrW(79)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(85)&ChrW(110)&ChrW(107)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(110) 
if a = "" then
a = uCase(request.serverVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(85)&ChrW(83)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(65)&ChrW(71)&ChrW(69)&ChrW(78)&ChrW(84))) 
else
a=uCase(a)
end if 
if inStr(a, uCase(ChrW(109)&ChrW(111)&ChrW(122)&ChrW(105)&ChrW(108)&ChrW(108)&ChrW(97))) > 0 then d = ChrW(77)&ChrW(111)&ChrW(122)&ChrW(105)&ChrW(108)&ChrW(108)&ChrW(97) 
if inStr(a, uCase(ChrW(105)&ChrW(99)&ChrW(97)&ChrW(98))) > 0 then d = ChrW(105)&ChrW(67)&ChrW(97)&ChrW(98) 
if inStr(a, uCase(ChrW(108)&ChrW(121)&ChrW(110)&ChrW(120))) > 0 then d = ChrW(76)&ChrW(121)&ChrW(110)&ChrW(120) 
if inStr(a, uCase(ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(115))) > 0 then d = ChrW(76)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(115) 
if inStr(a, uCase(ChrW(101)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(115))) > 0 then d = ChrW(69)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(107)&ChrW(115) 
if inStr(a, uCase(ChrW(106)&ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114))) > 0 then d = ChrW(74)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114) 
if inStr(a, uCase(ChrW(107)&ChrW(111)&ChrW(110)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(111)&ChrW(114))) > 0 then d = ChrW(107)&ChrW(111)&ChrW(110)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(111)&ChrW(114) 
if inStr(a, uCase(ChrW(119)&ChrW(103)&ChrW(101)&ChrW(116))) > 0 then d = ChrW(119)&ChrW(103)&ChrW(101)&ChrW(116) 
if inStr(a, uCase(ChrW(97)&ChrW(115)&ChrW(107)&ChrW(32)&ChrW(106)&ChrW(101)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(115))) > 0 or inStr(a, uCase(ChrW(116)&ChrW(101)&ChrW(111)&ChrW(109)&ChrW(97))) > 0 then d = ChrW(65)&ChrW(115)&ChrW(107)&ChrW(32)&ChrW(74)&ChrW(101)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(84)&ChrW(101)&ChrW(111)&ChrW(109)&ChrW(97) 
if inStr(a, uCase(ChrW(119)&ChrW(103)&ChrW(101)&ChrW(116))) > 0 then d = ChrW(119)&ChrW(103)&ChrW(101)&ChrW(116) 
if inStr(a, uCase(ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97))) > 0 then d = ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97) 
if inStr(a, uCase(ChrW(78)&ChrW(79)&ChrW(75)&ChrW(73)&ChrW(65)&ChrW(78))) > 0 then d = ChrW(78)&ChrW(79)&ChrW(75)&ChrW(73)&ChrW(65)&ChrW(78)&ChrW(40)&ChrW(35834)&ChrW(22522)&ChrW(20122)&ChrW(25163)&ChrW(26426)&ChrW(41) 
if inStr(a, uCase(ChrW(83)&ChrW(80)&ChrW(86))) > 0 then d = ChrW(83)&ChrW(80)&ChrW(86)&ChrW(40)&ChrW(22810)&ChrW(26222)&ChrW(36798)&ChrW(25163)&ChrW(26426)&ChrW(41) 
if inStr(a, uCase(ChrW(74)&ChrW(97)&ChrW(107)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(115))) > 0 then d = ChrW(74)&ChrW(97)&ChrW(107)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(45)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(67)&ChrW(108)&ChrW(105)&ChrW(101)&ChrW(110)&ChrW(116) 
if inStr(a, uCase(ChrW(71)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(111))) > 0 then
b = ChrW(91)&ChrW(71)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(111)&ChrW(93)&ChrW(32) 
d = ChrW(77)&ChrW(111)&ChrW(122)&ChrW(105)&ChrW(108)&ChrW(108)&ChrW(97)&ChrW(32)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(101)&ChrW(115) 
if inStr(a, uCase(ChrW(97)&ChrW(111)&ChrW(108))) > 0 then d = ChrW(65)&ChrW(79)&ChrW(76) 
if inStr(a, uCase(ChrW(110)&ChrW(101)&ChrW(116)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(101))) > 0 then d = ChrW(78)&ChrW(101)&ChrW(116)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(101) 
if inStr(a, uCase(ChrW(102)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(120))) > 0 then d = ChrW(70)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(70)&ChrW(111)&ChrW(120) 
if inStr(a, uCase(ChrW(99)&ChrW(104)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(114)&ChrW(97))) > 0 then d = ChrW(67)&ChrW(104)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(114)&ChrW(97) 
if inStr(a, uCase(ChrW(99)&ChrW(97)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(111))) > 0 then d = ChrW(67)&ChrW(97)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(111) 
if inStr(a, uCase(ChrW(103)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(111)&ChrW(110))) > 0 then d = ChrW(71)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(111)&ChrW(110) 
if inStr(a, uCase(ChrW(107)&ChrW(45)&ChrW(109)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(111)&ChrW(110))) > 0 then d = ChrW(75)&ChrW(45)&ChrW(77)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(111)&ChrW(110) 
d = b & d 
end if 
if inStr(a, uCase(ChrW(98)&ChrW(111)&ChrW(116))) > 0 or inStr(a, uCase(ChrW(99)&ChrW(114)&ChrW(97)&ChrW(119)&ChrW(108))) > 0 then
b = ChrW(91)&ChrW(66)&ChrW(111)&ChrW(116)&ChrW(47)&ChrW(67)&ChrW(114)&ChrW(97)&ChrW(119)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(93) 
if inStr(a, uCase(ChrW(103)&ChrW(114)&ChrW(117)&ChrW(98))) > 0 then d = ChrW(71)&ChrW(114)&ChrW(117)&ChrW(98) 
if inStr(a, uCase(ChrW(103)&ChrW(111)&ChrW(111)&ChrW(103)&ChrW(108)&ChrW(101)&ChrW(98)&ChrW(111)&ChrW(116))) > 0 then d = ChrW(71)&ChrW(111)&ChrW(111)&ChrW(103)&ChrW(108)&ChrW(101)&ChrW(66)&ChrW(111)&ChrW(116) 
if inStr(a, uCase(ChrW(109)&ChrW(115)&ChrW(110)&ChrW(98)&ChrW(111)&ChrW(116))) > 0 then d = ChrW(77)&ChrW(83)&ChrW(78)&ChrW(32)&ChrW(66)&ChrW(111)&ChrW(116) 
if inStr(a, uCase(ChrW(115)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(112))) > 0 then d = ChrW(89)&ChrW(97)&ChrW(104)&ChrW(111)&ChrW(111)&ChrW(33)&ChrW(32)&ChrW(83)&ChrW(108)&ChrW(117)&ChrW(114)&ChrW(112) 
d = b & d 
end if 
if inStr(a, uCase(ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(105)&ChrW(116))) > 0 then
b = ChrW(91)&ChrW(65)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(75)&ChrW(105)&ChrW(116)&ChrW(93) 
d = "" 
if inStr(a, uCase(ChrW(111)&ChrW(109)&ChrW(110)&ChrW(105)&ChrW(119)&ChrW(101)&ChrW(98))) > 0 then d = ChrW(79)&ChrW(109)&ChrW(110)&ChrW(105)&ChrW(87)&ChrW(101)&ChrW(98) 
if inStr(a, uCase(ChrW(115)&ChrW(97)&ChrW(102)&ChrW(97)&ChrW(114)&ChrW(105))) > 0 then d = ChrW(83)&ChrW(97)&ChrW(102)&ChrW(97)&ChrW(114)&ChrW(105) 
d = b & d 
end if 
if inStr(a, uCase(ChrW(109)&ChrW(115)&ChrW(105)&ChrW(101))) > 0 then
b = ChrW(91)&ChrW(77)&ChrW(83)&ChrW(73)&ChrW(69) 
c = mid(a,(inStr(a, uCase(ChrW(77)&ChrW(83)&ChrW(73)&ChrW(69))) + 4), 6) 
c = left(c, inStr(c, ChrW(59)) - 1) 
b = b & c & ChrW(93) 
d = ChrW(73)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(114)  
d = b & d 
end if 
if inStr(a, uCase(ChrW(109)&ChrW(115)&ChrW(110))) > 0 then d = ChrW(77)&ChrW(83)&ChrW(78) 
if inStr(a, uCase(ChrW(97)&ChrW(111)&ChrW(108))) > 0 then d = ChrW(65)&ChrW(79)&ChrW(76) 
if inStr(a, uCase(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(118))) > 0 then d = ChrW(87)&ChrW(101)&ChrW(98)&ChrW(84)&ChrW(86) 
if inStr(a, uCase(ChrW(109)&ChrW(121)&ChrW(105)&ChrW(101)&ChrW(50))) > 0 then d = ChrW(77)&ChrW(121)&ChrW(73)&ChrW(69)&ChrW(50) 
if inStr(a, uCase(ChrW(109)&ChrW(97)&ChrW(120)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(110))) > 0 then d = ChrW(77)&ChrW(97)&ChrW(120)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(20658)&ChrW(28216)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(41) 
if inStr(a, uCase(ChrW(103)&ChrW(111)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(102))) > 0 then d = ChrW(71)&ChrW(111)&ChrW(83)&ChrW(117)&ChrW(114)&ChrW(102)&ChrW(40)&ChrW(20914)&ChrW(28010)&ChrW(39640)&ChrW(25163)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(41) 
if inStr(a, uCase(ChrW(110)&ChrW(101)&ChrW(116)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(116)&ChrW(111)&ChrW(114))) > 0 then d = ChrW(78)&ChrW(101)&ChrW(116)&ChrW(67)&ChrW(97)&ChrW(112)&ChrW(116)&ChrW(111)&ChrW(114) 
if inStr(a, uCase(ChrW(115)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(110)&ChrW(105)&ChrW(114))) > 0 then d = ChrW(83)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(110)&ChrW(105)&ChrW(114) 
if inStr(a, uCase(ChrW(97)&ChrW(118)&ChrW(97)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114))) > 0 then d = ChrW(65)&ChrW(118)&ChrW(97)&ChrW(110)&ChrW(116)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114) 
if inStr(a, uCase(ChrW(103)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114))) > 0 then d = ChrW(71)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114) 
if inStr(a, uCase(ChrW(115)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114))) > 0 then d = ChrW(83)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(66)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(114) 
if inStr(a, uCase(ChrW(51)&ChrW(54)&ChrW(48)&ChrW(83)&ChrW(69))) > 0 then d = d & ChrW(45)&ChrW(51)&ChrW(54)&ChrW(48)&ChrW(83)&ChrW(69)&ChrW(40)&ChrW(51)&ChrW(54)&ChrW(48)&ChrW(23433)&ChrW(20840)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(41) 
if inStr(a, uCase(ChrW(81)&ChrW(81)&ChrW(68)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100))) > 0 then d = d & ChrW(45)&ChrW(81)&ChrW(81)&ChrW(68)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(40)&ChrW(81)&ChrW(81)&ChrW(19979)&ChrW(36733)&ChrW(22120)&ChrW(41) 
if inStr(a, uCase(ChrW(84)&ChrW(104)&ChrW(101)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(108)&ChrW(100))) > 0 then d = d & ChrW(45)&ChrW(84)&ChrW(104)&ChrW(101)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(108)&ChrW(100)&ChrW(40)&ChrW(19990)&ChrW(30028)&ChrW(20043)&ChrW(31383)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(41) 
if inStr(a, uCase(ChrW(105)&ChrW(99)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(56))) > 0 then d = d & ChrW(45)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(56)&ChrW(40)&ChrW(32593)&ChrW(32500)&ChrW(22823)&ChrW(24072)&ChrW(32593)&ChrW(21543)&ChrW(31649)&ChrW(29702)&ChrW(25554)&ChrW(20214)&ChrW(41) 
if inStr(a, uCase(ChrW(84)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(84)&ChrW(114)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(114))) > 0 then d = d & ChrW(45)&ChrW(84)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(84)&ChrW(114)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(33150)&ChrW(35759)&ChrW(84)&ChrW(84)&ChrW(27983)&ChrW(35272)&ChrW(22120)&ChrW(41) 
if inStr(a, uCase(ChrW(98)&ChrW(97)&ChrW(105)&ChrW(100)&ChrW(117)&ChrW(105)&ChrW(101)&ChrW(56))) > 0 then d = d & ChrW(45)&ChrW(98)&ChrW(97)&ChrW(105)&ChrW(100)&ChrW(117)&ChrW(105)&ChrW(101)&ChrW(56)&ChrW(40)&ChrW(30334)&ChrW(24230)&ChrW(73)&ChrW(69)&ChrW(56)&ChrW(46)&ChrW(48)&ChrW(41) 
if inStr(a, uCase(ChrW(105)&ChrW(67)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(77)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(97))) > 0 then d = d & ChrW(45)&ChrW(105)&ChrW(67)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(77)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(97)&ChrW(40)&ChrW(32593)&ChrW(21543)&ChrW(32593)&ChrW(23186)&ChrW(36235)&ChrW(21183)&ChrW(25554)&ChrW(20214)&ChrW(41) 
if inStr(a, uCase(ChrW(68)&ChrW(105)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(116))) > 0 then d = d & ChrW(45)&ChrW(68)&ChrW(105)&ChrW(103)&ChrW(69)&ChrW(120)&ChrW(116)&ChrW(40)&ChrW(73)&ChrW(69)&ChrW(53)&ChrW(20801)&ChrW(35768)&ChrW(33073)&ChrW(26426)&ChrW(38405)&ChrW(35835)&ChrW(27169)&ChrW(24335)&ChrW(29305)&ChrW(27530)&ChrW(26631)&ChrW(35760)&ChrW(41) 
if inStr(a, uCase(ChrW(98)&ChrW(97)&ChrW(105)&ChrW(100)&ChrW(117)&ChrW(100)&ChrW(115))) > 0 then d = d & ChrW(45)&ChrW(98)&ChrW(97)&ChrW(105)&ChrW(100)&ChrW(117)&ChrW(100)&ChrW(115)&ChrW(40)&ChrW(30334)&ChrW(24230)&ChrW(30828)&ChrW(30424)&ChrW(25628)&ChrW(32034)&ChrW(41) 
if inStr(a, uCase(ChrW(67)&ChrW(78)&ChrW(67)&ChrW(68)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114))) > 0 then d = d & ChrW(45)&ChrW(67)&ChrW(78)&ChrW(67)&ChrW(68)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(25968)&ChrW(25511)&ChrW(25320)&ChrW(21495)&ChrW(41) 
if inStr(a, uCase(ChrW(78)&ChrW(79)&ChrW(75)&ChrW(73)&ChrW(65)&ChrW(78)&ChrW(56)&ChrW(53))) > 0 then d = d & ChrW(45)&ChrW(78)&ChrW(79)&ChrW(75)&ChrW(73)&ChrW(65)&ChrW(78)&ChrW(56)&ChrW(53)&ChrW(40)&ChrW(35834)&ChrW(22522)&ChrW(20122)&ChrW(25163)&ChrW(26426)&ChrW(41) 
if inStr(a, uCase(ChrW(83)&ChrW(80)&ChrW(86)&ChrW(95)&ChrW(67)&ChrW(54)&ChrW(48)&ChrW(48))) > 0 then d = d & ChrW(45)&ChrW(83)&ChrW(80)&ChrW(86)&ChrW(95)&ChrW(67)&ChrW(54)&ChrW(48)&ChrW(48)&ChrW(40)&ChrW(22810)&ChrW(26222)&ChrW(36798)&ChrW(67)&ChrW(54)&ChrW(48)&ChrW(48)&ChrW(41) 
if inStr(a, uCase(ChrW(83)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101))) > 0 then d = d & ChrW(45)&ChrW(83)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(40)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(32)&ChrW(77)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(83)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(25805)&ChrW(20316)&ChrW(31995)&ChrW(32479)&ChrW(30340)&ChrW(26234)&ChrW(33021)&ChrW(25163)&ChrW(26426)&ChrW(41) 
getBrType = d 
end function 
%>  
