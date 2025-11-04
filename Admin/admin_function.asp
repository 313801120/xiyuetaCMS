<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include File = "class_function/admin_functin2024.asp"-->
<!--#Include File = "class_function/class_export_data.asp"-->
<% 
dim adminLevelList:adminLevelList=ChrW(44)&ChrW(36229)&ChrW(32423)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(44)&ChrW(26222)&ChrW(36890)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(44)&ChrW(20837)&ChrW(24211)&ChrW(20154)&ChrW(21592)&ChrW(44)&ChrW(23457)&ChrW(26680)&ChrW(20154)&ChrW(21592)&ChrW(44)&ChrW(20986)&ChrW(24211)&ChrW(20154)&ChrW(21592)

dim adminPermissionLits
adminPermissionLits=get_adminPermissionLits()
dim isAddSystemLog:isAddSystemLog=true
dim excludeAdminIDLIst
function get_adminPermissionLits()
dim a,b,c
a=a & ChrW(35774)&ChrW(32622)&ChrW(124)&ChrW(30331)&ChrW(24405)&ChrW(38480)&ChrW(21046)&ChrW(73)&ChrW(80)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(30331)&ChrW(24405)&ChrW(38480)&ChrW(21046)&ChrW(73)&ChrW(80)&ChrW(124)&ChrW(35774)&ChrW(32622)&ChrW(73)&ChrW(80)&ChrW(38480)&ChrW(21046)&ChrW(124)&ChrW(19978)&ChrW(20256)&ChrW(22270)&ChrW(29255)&ChrW(31649)&ChrW(29702)&ChrW(124)&ChrW(29983)&ChrW(25104)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(112)&ChrW(46)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(124)&ChrW(25968)&ChrW(25454)&ChrW(32500)&ChrW(25252)&ChrW(44)
a=a & ChrW(20250)&ChrW(21592)&ChrW(124)&ChrW(20250)&ChrW(21592)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(20250)&ChrW(21592)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(20250)&ChrW(21592)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(20250)&ChrW(21592)&ChrW(44)
a=a & ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(124)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(124)&ChrW(22522)&ChrW(26412)&ChrW(36164)&ChrW(26009)&ChrW(124)&ChrW(20462)&ChrW(25913)&ChrW(23494)&ChrW(30721)&ChrW(44)
a=a & ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(35282)&ChrW(33394)&ChrW(124)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(35282)&ChrW(33394)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(35282)&ChrW(33394)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(35282)&ChrW(33394)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(35282)&ChrW(33394)&ChrW(44)
a=a & ChrW(32593)&ChrW(31449)&ChrW(26639)&ChrW(30446)&ChrW(124)&ChrW(32593)&ChrW(31449)&ChrW(26639)&ChrW(30446)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(32593)&ChrW(31449)&ChrW(26639)&ChrW(30446)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(32593)&ChrW(31449)&ChrW(26639)&ChrW(30446)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(32593)&ChrW(31449)&ChrW(26639)&ChrW(30446)&ChrW(44)
a=a & ChrW(25991)&ChrW(31456)&ChrW(124)&ChrW(25991)&ChrW(31456)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(25991)&ChrW(31456)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(25991)&ChrW(31456)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(25991)&ChrW(31456)&ChrW(44)
a=a & ChrW(32593)&ChrW(31449)&ChrW(37197)&ChrW(32622)&ChrW(124)&ChrW(32593)&ChrW(31449)&ChrW(37197)&ChrW(32622)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(32593)&ChrW(31449)&ChrW(37197)&ChrW(32622)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(32593)&ChrW(31449)&ChrW(37197)&ChrW(32622)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(32593)&ChrW(31449)&ChrW(37197)&ChrW(32622)&ChrW(44)
a=a & ChrW(21333)&ChrW(39029)&ChrW(31649)&ChrW(29702)&ChrW(124)&ChrW(21333)&ChrW(39029)&ChrW(31649)&ChrW(29702)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(21333)&ChrW(39029)&ChrW(31649)&ChrW(29702)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(21333)&ChrW(39029)&ChrW(31649)&ChrW(29702)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(21333)&ChrW(39029)&ChrW(31649)&ChrW(29702)&ChrW(44)
a=a & ChrW(21451)&ChrW(24773)&ChrW(38142)&ChrW(25509)&ChrW(124)&ChrW(21451)&ChrW(24773)&ChrW(38142)&ChrW(25509)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(21451)&ChrW(24773)&ChrW(38142)&ChrW(25509)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(21451)&ChrW(24773)&ChrW(38142)&ChrW(25509)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(21451)&ChrW(24773)&ChrW(38142)&ChrW(25509)&ChrW(44)
a=a & ChrW(30465)&ChrW(24066)&ChrW(20998)&ChrW(31867)&ChrW(124)&ChrW(30465)&ChrW(24066)&ChrW(20998)&ChrW(31867)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(30465)&ChrW(24066)&ChrW(20998)&ChrW(31867)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(30465)&ChrW(24066)&ChrW(20998)&ChrW(31867)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(30465)&ChrW(24066)&ChrW(20998)&ChrW(31867)&ChrW(44)
a=a & ChrW(32842)&ChrW(22825)&ChrW(31649)&ChrW(29702)&ChrW(124)&ChrW(32842)&ChrW(22825)&ChrW(31649)&ChrW(29702)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(32842)&ChrW(22825)&ChrW(31649)&ChrW(29702)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(32842)&ChrW(22825)&ChrW(31649)&ChrW(29702)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(32842)&ChrW(22825)&ChrW(31649)&ChrW(29702)&ChrW(44)
a=a & ChrW(35746)&ChrW(21333)&ChrW(124)&ChrW(35746)&ChrW(21333)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(35746)&ChrW(21333)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(35746)&ChrW(21333)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(35746)&ChrW(21333)&ChrW(44)
a=a & ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(124)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(44) 
a=a & ChrW(31649)&ChrW(29702)&ChrW(29983)&ChrW(25104)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(124)&ChrW(31649)&ChrW(29702)&ChrW(29983)&ChrW(25104)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(31649)&ChrW(29702)&ChrW(29983)&ChrW(25104)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(31649)&ChrW(29702)&ChrW(29983)&ChrW(25104)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(31649)&ChrW(29702)&ChrW(29983)&ChrW(25104)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(44)
a=a & ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(39029)&ChrW(124)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(39029)&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(39029)&ChrW(124)&ChrW(32534)&ChrW(36753)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(39029)&ChrW(124)&ChrW(21024)&ChrW(38500)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(39029)&ChrW(44) 
b=split(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),ChrW(44))
for each c in b
if c <>"" then
a=a & ""&c&ChrW(124)&c&ChrW(21015)&ChrW(34920)&ChrW(124)&ChrW(28155)&ChrW(21152)&c&ChrW(124)&ChrW(32534)&ChrW(36753)&c&ChrW(124)&ChrW(21024)&ChrW(38500)&c&ChrW(44) 
end if
next
get_adminPermissionLits=a
end function

function aQX(a,b)
if checkAQX(b) then
aQX=a
end if
end function

function checkAQX(a)
checkAQX=false
if instr(a,ChrW(124)&session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))&ChrW(124))>0 or session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=-999 then
checkAQX=true
end if
end function 

function checkEditAQX(a)
checkEditAQX=checkAQX(a)
end function












sub checkAdminPermission(a)  
if isAdminPermission(a)=false then 
call eerr(ChrW(25552)&ChrW(31034),ChrW(27809)&ChrW(26377)&ChrW(12304)& a &ChrW(12305)&ChrW(26435)&ChrW(38480))
end if
end sub

function isAdminPermission(a) 
dim b,c,d
if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=-999  then
isAdminPermission=true
exit function
end if
c=false
b=split(a,ChrW(44))
for each d in b
if d <>"" then
if instr(ChrW(124)& userRs_permission &ChrW(124), ChrW(124)& d &ChrW(124))>0 then

c=true
exit for
end if
end if
next
if c=false then 
isAdminPermission=false
else
isAdminPermission=true
end if
end function
function checkAdminRule(a)
if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=-999  then
checkAdminRule=true
exit function
end if

if instr(ChrW(44)&excludeAdminIDLIst&ChrW(44), ChrW(44)& session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) &ChrW(44))>0 then
checkAdminRule=true
exit function
end if
checkAdminRule=isAdminPermission(a) 
end function

function showCheckAdminRule(a)
if checkAdminRule(a) = false then
call die(ChrW(27809)&ChrW(26377)&ChrW(12304)& a &ChrW(12305)&ChrW(26435)&ChrW(38480))
end if
end function

function checkAdminLoginIPAllow(a)
dim b,c 
b=readfile(adminDir & ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(95)&ChrW(73)&ChrW(80)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116),"")
c=split(b,chr(10))
checkAdminLoginIPAllow=checkIPMatch(a, c)
end function 

function checkIpLimitList(a)  
dim b
b=split(a,chr(10))
checkIpLimitList=checkIPMatch(getip(), b)
end function 




Function checkIPMatch(a, b)
Dim c, d, e, f, g
Dim h
checkIPMatch = False

If IsArray(b) = False Then
b = Split(b, ChrW(44))
End if

For c = 0 To UBound(b)
d = phpTrim(b(c))

If d <> "" Then

If InStr(d, ChrW(42)) = 0 Then
If d = a Then
checkIPMatch = True
Exit function
End if
Else 

e = Split(d, ChrW(46))
f = Split(a, ChrW(46))

If UBound(e) = 3 And UBound(f) = 3 Then
h = True

For g = 0 To 3

If e(g) = ChrW(42) Then

Else

If e(g) <> f(g) Then
h = False
Exit for
End if
End if
Next

If h = True Then
checkIPMatch = True
Exit function
End if
End if
End if
End if
Next
End function

function getSubTree(a)
dim b,c
dim d:Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
d.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not d.eof then
b=d(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
if d(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
c=getSubTree(d(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
if c <>"" then b=c&ChrW(62)&ChrW(62) & b
end if
end if:d.close
getSubTree=b
end function 

function addSystemLog(a,b)
dim c:c=-1
dim d
if isAddSystemLog=true and session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(114)&ChrW(117)&ChrW(108)&ChrW(101)) <>ChrW(115)&ChrW(101)&ChrW(108)&ChrW(102) then
a=replace(a,ChrW(39),ChrW(39)&ChrW(39))
b=replace(b,ChrW(39),ChrW(39)&ChrW(39))

if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) <>"" then c=session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))

d=ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & db_PREFIX & ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(44)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(44)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(105)&ChrW(112)&ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39) & a & ChrW(39)&ChrW(44)&ChrW(39) & b & ChrW(39)&ChrW(44) & c & ChrW(44)&ChrW(39) & getIP() & ChrW(39)&ChrW(41)


conn.Execute(d) 
end if
end function

function getColumAllID(a)
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not b.eof 
if c <>"" then c=c & ChrW(44)
c=c & b(ChrW(105)&ChrW(100))
d=getColumAllID(b(ChrW(105)&ChrW(100)))
if d <>"" then
c=c & ChrW(44) & d
end if
b.movenext:wend:b.close
getColumAllID=c
end function

function getColumNameToID(a)
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& a &ChrW(39),conn,1,1
if not b.eof then
c=b(ChrW(105)&ChrW(100))
end if:b.close
getColumNameToID=c
end function

function getRootNavName(a)
if a="" then getRootNavName="": exit function
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
while not b.eof
if b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=-1 then
getRootNavName=b(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
exit function
else
getRootNavName=getRootNavName(b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
end if
b.movenext:wend:b.close
end function

function getSubColumSort(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59) & b
else
b=b & ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
call getSubColumSort(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),b)
end if
end if:c.close
getSubColumSort=b
end function


function columnSubInput(a,b,c)
dim d:Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim e,f,g,h
if b <>"" then h=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)& b &ChrW(41)
d.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&a&ChrW(41) & h &ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not d.eof  
g=""
if c <>"" then
if c=d(ChrW(105)&ChrW(100)) then g=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
e=e & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& d(ChrW(105)&ChrW(100)) &ChrW(34)& g &ChrW(62)& getSubColumSort(d(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),"")  & d(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
e=e & columnSubInput(d(ChrW(105)&ChrW(100)),IIF(b=-2,-3,b),c)  
d.movenext:wend:d.close
columnSubInput=e
end function
function getAdminIdToName(a)
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))   
a = a & ""
if a="" then 
getAdminIdToName=ChrW(40)&ChrW(73)&ChrW(68)&ChrW(20026)&ChrW(31354)&ChrW(41)
exit function
end if

b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not b.eof then
dim c
c=split(adminLevelList,ChrW(44))
getAdminIdToName=b(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(40)& c(b(ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108)))&ChrW(41)

end if:b.close 
end function

function xiyuetaColumnSubInput(a,b,c)
xiyuetaColumnSubInput=handleXiyuetaColumnSubInput(a,b,focusValue,ChrW(105)&ChrW(100))
end function

function handleXiyuetaColumnSubInput(a,b,c,d)
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim f,g,h,i,j
c=c&""
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a & i &ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not e.eof  
h=""
if c <>"" then
if d=ChrW(116)&ChrW(120)&ChrW(116) then
if c=cstr(e(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))) then h=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
else
if c=cstr(e(ChrW(105)&ChrW(100))) then h=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)      
end if
end if

j=""
if b=true then
j=getXiyuetaSubColumSort(e(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),"")
end if
f=f & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& iif(d=ChrW(116)&ChrW(120)&ChrW(116),e(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)),e(ChrW(105)&ChrW(100))) &ChrW(34)& h &ChrW(62)& j & e(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
f=f & handleXiyuetaColumnSubInput(e(ChrW(105)&ChrW(100)),true,c,d)
e.movenext:wend:e.close
handleXiyuetaColumnSubInput=f
end function

function getXiyuetaSubColumSort(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59) & b
else
b=b & ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
call getXiyuetaSubColumSort(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),b)
end if
end if:c.close
getXiyuetaSubColumSort=b
end function

function getXiyuetaColumnSubInputList(a,b,c)
getXiyuetaColumnSubInputList=handleGetXiyuetaColumnSubInputList(a,b,c,"",ChrW(105)&ChrW(100))
end function

function getXiyuetaColumnSubInputListTxt(a,b,c)
getXiyuetaColumnSubInputListTxt=handleGetXiyuetaColumnSubInputList(a,b,c,"",ChrW(116)&ChrW(120)&ChrW(116))
end function

function handleGetXiyuetaColumnSubInputList(a,b,c,d,e)
dim f
if c="" then c=-2
dim g:Set g = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
f=ChrW(60)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)& b &ChrW(34)&ChrW(62)
f=f & d
g.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& a &ChrW(39),conn,1,1
if not g.eof then

f=f & handleXiyuetaColumnSubInput(g(ChrW(105)&ChrW(100)),false,c,e) 
end if:g.close
f=f & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(62)
handleGetXiyuetaColumnSubInputList=f
end function

function getColumnCheckBoxList(a,b,c)
dim d,e,f
e=-2
c=ChrW(32)& c &ChrW(44)
dim g:Set g = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116)) 
g.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& a &ChrW(39),conn,1
if not g.eof then
e=g(ChrW(105)&ChrW(100))
end if:g.close

g.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&e,conn,1,1
while not g.eof
f=""
if instr(c,ChrW(32) & g(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(44))>0 then f=ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)

d=d & ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(34)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(34)&b&ChrW(34)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&b&ChrW(34)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(39)& g(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(39)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)& g(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(34)& f &ChrW(62)
g.movenext:wend:g.close
getColumnCheckBoxList=d
end function

function getColumnRadioList(a,b,c) 
getColumnRadioList=handleColumnRadioList(a,b,c,ChrW(105)&ChrW(100))
end function

function getColumnRadioListTxt(a,b,c) 
getColumnRadioListTxt=handleColumnRadioList(a,b,c,ChrW(116)&ChrW(120)&ChrW(116))
end function

function handleColumnRadioList(a,b,c,d)
dim e,f,g,h
c=c&""
f=-2
dim i:Set i = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116)) 
i.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& a &ChrW(39),conn,1
if not i.eof then
f=i(ChrW(105)&ChrW(100))
end if:i.close
i.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&f,conn,1,1
while not i.eof
g=""
h=cstr(IIF(d=ChrW(116)&ChrW(120)&ChrW(116),i(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)),i(ChrW(105)&ChrW(100))) & "")
if cstr(c) = h then g=ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)

e=e & ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(34)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&b&ChrW(34)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(39)& h &ChrW(39)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)& i(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(34)& g &ChrW(62)
i.movenext:wend:i.close
handleColumnRadioList=e
end function

function getXiyuetaColumnIdToName(a) 
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
a=a &""
if a="" then getXiyuetaColumnIdToName="": exit function

b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not b.eof then
getXiyuetaColumnIdToName=b(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
else
getXiyuetaColumnIdToName=""
end if:b.close
end function

function getXiyuetaColumnSearchIdList(a)
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(39)&ChrW(37)& a &ChrW(37)&ChrW(39),conn,1,1
while not b.eof
if c <>"" then c=c&ChrW(44)
c=c & b(ChrW(105)&ChrW(100))
b.movenext:wend:b.close
getXiyuetaColumnSearchIdList=c
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

function getHtmlToJsInput(byVal a)
a = replace("" & a, ChrW(92), ChrW(92)&ChrW(92)) 
a = replace(a, ChrW(47), ChrW(92)&ChrW(47)) 
a = replace(a, ChrW(39), ChrW(92)&ChrW(39)) 
a = replace(a, ChrW(34), ChrW(92)&ChrW(34)) 
getHtmlToJsInput=a
end function

function getServerVersion() 
doevents
dim a
call openconn()
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(93),conn,1,3
if not rs.eof then
a=dateDiff(ChrW(100), rs(ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)), now()) 
if a <>0 then
getServerVersion=getHttpUrl(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(47)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(47)&ChrW(63)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61)&escape(getthisurl()) &ChrW(38)&ChrW(118)&ChrW(61)&version,"")
rs(ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rs.update
else
getServerVersion=ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45) & a & ChrW(45)&ChrW(45)&ChrW(62)
end if
end if:rs.close 
end function 

function handleTelHide(a)
dim b
b=a
if len(b)>4 then
b=mid(b,len(b)-4) & ChrW(42)&ChrW(42)&ChrW(42)&ChrW(42)
end if
handleTelHide=b
end function

function handleExpirydate(a,b)
dim c,d,e,f,g,h,i
a=a & ""
b=ChrW(44) & b & ChrW(124)
c=split(a,ChrW(44)&ChrW(32))
for each f in c
if f <>"" then
i=instr(b,ChrW(44)& f &ChrW(124))
if i>0 then
g=mid(b,i+len(ChrW(44)& f &ChrW(124)))
e=split(g,ChrW(124))
h=h & f & ChrW(40)&e(0)&ChrW(45)& e(1) &ChrW(41)
end if
end if
next
handleExpirydate=h
end function

function handleBcertificatedate(a,b)
dim c,d,e,f,g,h,i
a=a & ""
b=ChrW(44) & b & ChrW(124)
c=split(a,ChrW(44)&ChrW(32))
for each f in c
if f <>"" then
i=instr(b,ChrW(44)& f &ChrW(124))
if i>0 then
g=mid(b,i+len(ChrW(44)& f &ChrW(124)))
e=split(g,ChrW(124))
h=h & f & ChrW(40)&e(2) &ChrW(41)
end if
end if
next
handleBcertificatedate=h
end function

function getTimeList(a,b,c)
dim d,e,f,g,h,i,j
a=a & ""
b=ChrW(44) & b & ChrW(124)
d=split(a,ChrW(44)&ChrW(32))
for each g in d
if g <>"" then
j=instr(b,ChrW(44)& g &ChrW(124))
if j>0 then
h=mid(b,j+len(ChrW(44)& g &ChrW(124)))
f=split(h,ChrW(124))
i=i & g & ChrW(40)&f(c) &ChrW(41)
end if
end if
next
getTimeList=i
end function

function getFieldCnName(byval a,byval b)
dim c,d,e,f 
a=phptrim(lcase(a))
b=phptrim(b)
if b <>"" then  
getFieldAlt=b
exit function
end if
c=ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(29992)&ChrW(25143)&ChrW(73)&ChrW(68)&ChrW(44)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(124)&ChrW(26631)&ChrW(39064)&ChrW(44)&ChrW(105)&ChrW(112)&ChrW(124)&ChrW(73)&ChrW(80)&ChrW(22320)&ChrW(22336)&ChrW(44)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(21019)&ChrW(24314)&ChrW(26102)&ChrW(38388)&ChrW(44)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(20462)&ChrW(25913)&ChrW(26102)&ChrW(38388)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(124)&ChrW(23457)&ChrW(26680)&ChrW(44)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(22791)&ChrW(27880)&ChrW(44)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(73)&ChrW(68)&ChrW(44)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(124)&ChrW(35777)&ChrW(20070)&ChrW(31867)&ChrW(22411)&ChrW(44)&ChrW(101)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(23398)&ChrW(21382)&ChrW(44)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(124)&ChrW(24120)&ChrW(20303)&ChrW(22320)&ChrW(44)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(124)&ChrW(32852)&ChrW(31995)&ChrW(30005)&ChrW(35805)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(99)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(124)&ChrW(31038)&ChrW(20445)&ChrW(44)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(102)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(19987)&ChrW(19994)&ChrW(44)&ChrW(111)&ChrW(110)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(124)&ChrW(38750)&ChrW(27880)&ChrW(20876)&ChrW(31867)&ChrW(35777)&ChrW(20070)&ChrW(44)&ChrW(115)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(124)&ChrW(23433)&ChrW(20840)&ChrW(31867)&ChrW(44)&ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(22995)&ChrW(21517)&ChrW(44)&ChrW(105)&ChrW(100)&ChrW(99)&ChrW(97)&ChrW(114)&ChrW(100)&ChrW(124)&ChrW(36523)&ChrW(20221)&ChrW(35777)&ChrW(21495)&ChrW(44)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(124)&ChrW(24615)&ChrW(21035)&ChrW(44)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(124)&ChrW(27880)&ChrW(20876)&ChrW(31867)&ChrW(22411)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(36164)&ChrW(26684)&ChrW(35777)&ChrW(31614)&ChrW(21457)&ChrW(26102)&ChrW(38388)&ChrW(44)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(105)&ChrW(114)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(35777)&ChrW(20070)&ChrW(26377)&ChrW(25928)&ChrW(25130)&ChrW(27490)&ChrW(26102)&ChrW(38388)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(101)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(27880)&ChrW(20876)&ChrW(19987)&ChrW(19994)&ChrW(36817)&ChrW(19977)&ChrW(24180)&ChrW(20869)&ChrW(32487)&ChrW(32493)&ChrW(25945)&ChrW(32946)&ChrW(24773)&ChrW(20917)&ChrW(44)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(124)&ChrW(25910)&ChrW(35777)&ChrW(20215)&ChrW(26684)&ChrW(44)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(101)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(108)&ChrW(102)&ChrW(101)&ChrW(101)&ChrW(124)&ChrW(20171)&ChrW(32461)&ChrW(36153)&ChrW(40)&ChrW(20803)&ChrW(41)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(111)&ChrW(100)&ChrW(124)&ChrW(25910)&ChrW(35777)&ChrW(20215)&ChrW(26684)&ChrW(44)&ChrW(99)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(124)&ChrW(35777)&ChrW(20070)&ChrW(29992)&ChrW(36884)&ChrW(44)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(124)&ChrW(24405)&ChrW(20837)&ChrW(44)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(28155)&ChrW(21152)&ChrW(32773)&ChrW(44)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(110)&ChrW(99)&ChrW(101)&ChrW(124)&ChrW(19994)&ChrW(32489)&ChrW(44)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(23457)&ChrW(26680)&ChrW(29366)&ChrW(24577)&ChrW(44)&ChrW(97)&ChrW(112)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(105)&ChrW(120)&ChrW(124)&ChrW(38468)&ChrW(20214)&ChrW(44)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(124)&ChrW(19994)&ChrW(21153)&ChrW(21150)&ChrW(29702)&ChrW(36153)&ChrW(44)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(124)&ChrW(26159)&ChrW(21542)&ChrW(24102)&ChrW(32418)&ChrW(22836)&ChrW(25991)&ChrW(20214)&ChrW(44)&ChrW(112)&ChrW(97)&ChrW(121)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(20844)&ChrW(21496)&ChrW(20184)&ChrW(27454)&ChrW(44)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(121)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(20010)&ChrW(20154)&ChrW(20184)&ChrW(27454)&ChrW(44)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(21512)&ChrW(21516)&ChrW(25130)&ChrW(27490)&ChrW(26085)&ChrW(26399)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(20225)&ChrW(19994)&ChrW(21517)&ChrW(31216)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(124)&ChrW(20225)&ChrW(19994)&ChrW(32852)&ChrW(32476)&ChrW(20154)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(124)&ChrW(20225)&ChrW(19994)&ChrW(32852)&ChrW(32476)&ChrW(20154)&ChrW(30005)&ChrW(35805)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(124)&ChrW(20225)&ChrW(19994)&ChrW(27880)&ChrW(20876)&ChrW(22320)&ChrW(44)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(101)&ChrW(120)&ChrW(97)&ChrW(109)&ChrW(124)&ChrW(23433)&ChrW(20840)&ChrW(31867)&ChrW(32771)&ChrW(35797)&ChrW(44)&ChrW(99)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(124)&ChrW(35777)&ChrW(20070)&ChrW(29366)&ChrW(24577)&ChrW(44)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(124)&ChrW(24050)&ChrW(26597)&ChrW(30475)&ChrW(29992)&ChrW(25143)&ChrW(44)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(20998)&ChrW(31867)&ChrW(21517)&ChrW(31216)&ChrW(44)&ChrW(99)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(124)&ChrW(36164)&ChrW(26684)&ChrW(35777)&ChrW(21040)&ChrW(26399)&ChrW(25552)&ChrW(37266)&ChrW(22825)&ChrW(25968)&ChrW(44)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(124)&ChrW(31614)&ChrW(21512)&ChrW(21516)&ChrW(21040)&ChrW(26399)&ChrW(25552)&ChrW(37266)&ChrW(22825)&ChrW(25968)&ChrW(44)&ChrW(98)&ChrW(99)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(23433)&ChrW(20840)&ChrW(66)&ChrW(35777)&ChrW(25130)&ChrW(27490)&ChrW(26102)&ChrW(38388)&ChrW(44)&ChrW(98)&ChrW(99)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(124)&ChrW(23433)&ChrW(20840)&ChrW(66)&ChrW(35777)&ChrW(25130)&ChrW(27490)&ChrW(26102)&ChrW(38388)&ChrW(21040)&ChrW(26399)&ChrW(25552)&ChrW(37266)&ChrW(22825)&ChrW(25968)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(115)&ChrW(111)&ChrW(99)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(124)&ChrW(20844)&ChrW(21496)&ChrW(26159)&ChrW(21542)&ChrW(20132)&ChrW(31038)&ChrW(20445)&ChrW(44)&ChrW(97)&ChrW(117)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(23457)&ChrW(26680)&ChrW(32773)&ChrW(44)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(20986)&ChrW(24211)&ChrW(32773)&ChrW(44)&ChrW(114)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(35780)&ChrW(23457)&ChrW(26102)&ChrW(38388)&ChrW(44)&ChrW(106)&ChrW(111)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(124)&ChrW(32844)&ChrW(31216)&ChrW(44)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(124)&ChrW(22810)&ChrW(20010)&ChrW(26102)&ChrW(38388)&ChrW(32452)&ChrW(21512)&ChrW(44)&ChrW(105)&ChrW(110)&ChrW(118)&ChrW(111)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(124)&ChrW(21457)&ChrW(31080)&ChrW(31867)&ChrW(22411)&ChrW(44)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(24320)&ChrW(31080)&ChrW(38754)&ChrW(39069)&ChrW(44)&ChrW(105)&ChrW(110)&ChrW(118)&ChrW(111)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(24320)&ChrW(31080)&ChrW(24352)&ChrW(25968)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(121)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(26159)&ChrW(21542)&ChrW(20184)&ChrW(27454)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(124)&ChrW(26159)&ChrW(21542)&ChrW(31614)&ChrW(21512)&ChrW(21516)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(124)&ChrW(26159)&ChrW(21542)&ChrW(24320)&ChrW(31080)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(124)&ChrW(20844)&ChrW(21496)&ChrW(21517)&ChrW(31216)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(20844)&ChrW(21496)&ChrW(20449)&ChrW(24687)&ChrW(28155)&ChrW(21152)&ChrW(32773)&ChrW(44)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(24320)&ChrW(31080)&ChrW(38754)&ChrW(39069)&ChrW(44)&ChrW(99)&ChrW(117)&ChrW(109)&ChrW(117)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(97)&ChrW(109)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(21021)&ChrW(22987)&ChrW(32047)&ChrW(35745)&ChrW(37329)&ChrW(39069)&ChrW(44)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(124)&ChrW(24320)&ChrW(31080)&ChrW(20225)&ChrW(19994)&ChrW(44)&ChrW(105)&ChrW(110)&ChrW(118)&ChrW(111)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(97)&ChrW(109)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(24320)&ChrW(31080)&ChrW(37329)&ChrW(39069)&ChrW(44)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(26032)&ChrW(20844)&ChrW(21496)&ChrW(73)&ChrW(68)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(111)&ChrW(100)&ChrW(124)&ChrW(20844)&ChrW(21496)&ChrW(31614)&ChrW(32422)&ChrW(24180)&ChrW(38480)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(111)&ChrW(100)&ChrW(124)&ChrW(31614)&ChrW(32422)&ChrW(24180)&ChrW(38480)&ChrW(36873)&ChrW(25321)&ChrW(44)&ChrW(99)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(120)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(124)&ChrW(20986)&ChrW(35777)&ChrW(20215)&ChrW(26684)&ChrW(88)&ChrW(20540)&ChrW(44)&ChrW(99)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(124)&ChrW(20986)&ChrW(35777)&ChrW(20215)&ChrW(26684)&ChrW(44)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(124)&ChrW(31867)&ChrW(22411)&ChrW(44)&ChrW(110)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(124)&ChrW(35774)&ChrW(32622)&ChrW(20540)&ChrW(44)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(29992)&ChrW(25143)&ChrW(36134)&ChrW(21495)&ChrW(44)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(124)&ChrW(32593)&ChrW(22336)&ChrW(44)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(116)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(116)&ChrW(26102)&ChrW(38388)&ChrW(44)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(124)&ChrW(24180)&ChrW(40836)&ChrW(44)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(21517)&ChrW(31216)&ChrW(44)
d=split(c,ChrW(44))
for each f in d
if instr(f,ChrW(124))>0 then
e=split(f,ChrW(124))
if e(0)=a then
getFieldAlt=phptrim(e(1))
exit function
end if
end if
next
end function

function getTiMoSubColumSort(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(116)&ChrW(105)&ChrW(109)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59) & b
else
b=b & ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
call getTiMoSubColumSort(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),b)
end if
end if:c.close
getTiMoSubColumSort=b
end function

function tiMoColumnSubInput(a,b,c)
dim d:Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim e,f,g,h
if b <>"" then h=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)& b
d.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(116)&ChrW(105)&ChrW(109)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a & h &ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not d.eof  
g=""
if c <>"" then
if c=d(ChrW(105)&ChrW(100)) then g=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
e=e & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& d(ChrW(105)&ChrW(100)) &ChrW(34)& g &ChrW(62)& getTiMoSubColumSort(d(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),"")  & d(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
e=e & tiMoColumnSubInput(d(ChrW(105)&ChrW(100)),IIF(b=-2,-3,b),c)  
d.movenext:wend:d.close
tiMoColumnSubInput=e
end function

function getTiMoSubTree(a)
dim b,c
dim d:Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
d.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(116)&ChrW(105)&ChrW(109)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not d.eof then
b=d(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
if d(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
c=getTiMoSubTree(d(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
if c <>"" then b=c&ChrW(62)&ChrW(62) & b
end if
end if:d.close
getTiMoSubTree=b
end function

function getOnLineSelectValue(a,b)
dim c,d,e,f,g
c=split(a,ChrW(45))
b=b &""
for d=1 to ubound(c)
if c(d) <>"" then
e=c(d) & ChrW(95) & c(d)
f=split(e,ChrW(95)) 

if instr(ChrW(44)&b&ChrW(44), ChrW(44)&f(1)&ChrW(44))>0 then
if g <>"" then g=g &ChrW(32)&ChrW(44)&ChrW(32)
g=g & f(0)


end if
end if
next
getOnLineSelectValue=g
end function

function showOnLineSelectHtml(a,b)
a=handleConfigFuHao(a)
dim c,d,e,f,g,h
c=split(a,ChrW(45))
b=b &""
g=ChrW(60)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)& c(0) &ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)& c(0) &ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(34)& c(0) &ChrW(34)&ChrW(62) 
for d=1 to ubound(c)
if c(d) <>"" then
e=c(d) & ChrW(95) & c(d)
f=split(e,ChrW(95)) 
h=""
if unHandleConfigFuHao(f(1))=b then
h=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
g=g & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& f(1) &ChrW(34)& h &ChrW(62)& f(0) &ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62) & vbcrlf
end if
next
g=g & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(62)
g=unHandleConfigFuHao(g)
showOnLineSelectHtml=g
end function 
function useTpl2022(a,b) 

dim c,d,e,f,g,h,i,j
dim k,l,m
if b="" then
call die( ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(27169)&ChrW(26495)&ChrW(20026)&ChrW(31354)&ChrW(33)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
c=a & ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) & b
d=getDirFileNameList(c,ChrW(97)&ChrW(115)&ChrW(112))
call createfolder(a & ChrW(47)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107))
f=a & ChrW(47)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(47) & format_Time(now(),6)
call createfolder(f)
e=split(d,vbcrlf)
for each g in e
if g <>"" then
h = c & ChrW(47) &g
i=a & ChrW(47) & g
j=f & ChrW(47) & g


call moveFile(i,j)
d=readfile(h,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
d=replace(d,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(35)&ChrW(73)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47),ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(35)&ChrW(73)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) & b & ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47))

call writetofile(i,d,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if 
next

rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(93),conn,1,3
if not rs.eof then
rs(ChrW(116)&ChrW(112)&ChrW(108)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=b
rs.update
end if:rs.close
useTpl2022=ChrW(79)&ChrW(75)&ChrW(61) & handlepath(c) & ChrW(32)&ChrW(45)&ChrW(62)&ChrW(32) & ubound(e)
end function

function handleConfigFuHao(a)
a=replace(a,ChrW(92)&ChrW(44),ChrW(91)&ChrW(29305)&ChrW(21035)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(32)&ChrW(29305)&ChrW(21035)&ChrW(93))
a=replace(a,ChrW(92)&ChrW(95),ChrW(91)&ChrW(29305)&ChrW(21035)&ChrW(32)&ChrW(120)&ChrW(105)&ChrW(97)&ChrW(104)&ChrW(117)&ChrW(97)&ChrW(120)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(29305)&ChrW(21035)&ChrW(93))
a=replace(a,ChrW(92)&ChrW(45),ChrW(91)&ChrW(29305)&ChrW(21035)&ChrW(32)&ChrW(115)&ChrW(104)&ChrW(117)&ChrW(120)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(29305)&ChrW(21035)&ChrW(93))
handleConfigFuHao=a
end function

function unHandleConfigFuHao(a)
a=replace(a,ChrW(91)&ChrW(29305)&ChrW(21035)&ChrW(32)&ChrW(109)&ChrW(97)&ChrW(111)&ChrW(104)&ChrW(97)&ChrW(32)&ChrW(29305)&ChrW(21035)&ChrW(93),ChrW(44))
a=replace(a,ChrW(91)&ChrW(29305)&ChrW(21035)&ChrW(32)&ChrW(120)&ChrW(105)&ChrW(97)&ChrW(104)&ChrW(117)&ChrW(97)&ChrW(120)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(29305)&ChrW(21035)&ChrW(93),ChrW(95))
a=replace(a,ChrW(91)&ChrW(29305)&ChrW(21035)&ChrW(32)&ChrW(115)&ChrW(104)&ChrW(117)&ChrW(120)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(29305)&ChrW(21035)&ChrW(93),ChrW(45))
unHandleConfigFuHao=a
end function

function TS_showTableSelect(a,b,c)
dim d,e,f,g,h,i,j
d=split(b,ChrW(45))
c=c &""
h=ChrW(60)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)& a &ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)& a &ChrW(34)&ChrW(62) 
dim k:Set k = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))   
j=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & d(1) &ChrW(93)
k.open j,conn,1,1
for e=1 to 30
if k.eof then exit for
i=""
if cstr(k(ChrW(105)&ChrW(100)))=c then
i=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
h=h & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& k(ChrW(105)&ChrW(100)) &ChrW(34)& i &ChrW(62)& k(d(2)) &ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62) & vbcrlf
k.movenext:next:k.close
h=h & ChrW(60)&ChrW(47)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(62)
TS_showTableSelect=h
end function 

function getUserInfo(a)
a=a&""
if a="" then 
getUserInfo=""
exit function
end if

dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116)) 
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not b.eof then
getUserInfo=b(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(40)& b(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(41)
end if:b.close
end function

function TS_getTableMemberPicImg(a,b) 
dim c,d
d=80
b=b&"" 
if b="" then 
TS_getTableMemberPicImg=""
exit function
end if  
c=split(a,ChrW(45))
if ubound(c) >=2 then
d=c(2)
end if
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116)) 
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&b,conn,1,1
if not e.eof then
TS_getTableMemberPicImg=ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(39)& e(ChrW(112)&ChrW(105)&ChrW(99)) &ChrW(39)&ChrW(32)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(61)&ChrW(39)& d &ChrW(39)&ChrW(62)
end if:e.close
end function

function TS_srctohtmlimg(a,b)
dim c,d,e
c=split(a&ChrW(45)&ChrW(45),ChrW(45)) 
d=c(1)
e=c(2)
if d="" then d=ChrW(56)&ChrW(48)
if e="" then e=ChrW(56)&ChrW(48)
TS_srctohtmlimg=ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(39)& b &ChrW(39)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(109)&ChrW(97)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58)& d &ChrW(112)&ChrW(120)&ChrW(59)&ChrW(109)&ChrW(97)&ChrW(120)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)& e &ChrW(112)&ChrW(120)&ChrW(39)&ChrW(62)
end function 

function TS_getTableCount(a,b)
dim c,d,e,f,g
b=b&""
c=split(a,ChrW(45)) 
if ubound(c) >=2 then
if b <>"" then 
f=getFieldAlt(db_PREFIX & c(1),c(2))

if f=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or f=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) then 
e=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&c(2) & ChrW(61)&ChrW(39)& b & ChrW(39)
else
e=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&c(2) & ChrW(61)&b
end if
end if
if ubound(c) >=3 then
if c(3)=ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(49) then
if e="" then 
e=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)
else
e=e & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)
end if
e=e & ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)
end if
end if
dim h:Set h = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))   

TS_getTableCount=ChrW(20849)&ChrW(26377) & conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & c(1) & e)(0) &ChrW(26465)
end if
end function

function TS_getTableFieldValue(a,b)
dim c,d
b=b&""
c=split(a,ChrW(45)) 
if ubound(c) >=2 then 
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))   
d=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & c(1) &ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&b
e.open d,conn,1,1

if not e.eof then
TS_getTableFieldValue=e(c(2))  
end if:e.close
end if
end function


function TS_handleAllAction(a,b)
dim c,d,e
dim f:Set f = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))   
c=split(a,ChrW(45)) 
d=c(1)
if d=ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(104)&ChrW(117) then
TS_handleAllAction=b(ChrW(97)&ChrW(100)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(110)&ChrW(117)&ChrW(109)) & ChrW(22823) & b(ChrW(99)&ChrW(104)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(110)&ChrW(117)&ChrW(109)) & ChrW(23567)
elseif d=ChrW(99)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(119)&ChrW(101)&ChrW(105)&ChrW(122)&ChrW(104)&ChrW(105) then
TS_handleAllAction=b(ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(95)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(119)) &ChrW(34892) & b(ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(95)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(108))&ChrW(21015)
elseif d=ChrW(116)&ChrW(117)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114) then
f.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&b(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)),conn,1,1
if not f.eof then
TS_handleAllAction=f(ChrW(119)&ChrW(120)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(105)&ChrW(100))
end if:f.close
elseif d=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(104)&ChrW(117)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101) then
f.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(115)&ChrW(116)&ChrW(117)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&b(ChrW(115)&ChrW(116)&ChrW(117)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(100)),conn,1,1
if not f.eof then
TS_handleAllAction=f(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))   
end if:f.close
elseif d=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111) then
if b(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(105)&ChrW(100)) <>"" then
f.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&b(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(105)&ChrW(100)),conn,1,1
if not f.eof then
TS_handleAllAction=f(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)) & ChrW(40) & f(ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)) & ChrW(41)&ChrW(31215)&ChrW(20998)&ChrW(32) & f(ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121))
end if:f.close
else
TS_handleAllAction=ChrW(119)&ChrW(101)&ChrW(98)&ChrW(105)&ChrW(100)&ChrW(20026)&ChrW(31354)&ChrW(65292)&ChrW(27880)&ChrW(24847)
end if
elseif d=ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111) then
TS_handleAllAction=getUserInfo(b(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)))
elseif d=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) then
f.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&b(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)),conn,1,1
if not f.eof then
TS_handleAllAction=f(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(40) & f(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(41)
end if:f.close 
elseif d=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103) then
f.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&b(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)),conn,1,1
if not f.eof then
TS_handleAllAction=f(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(40) & f(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(41)
end if:f.close 
end if
end function

function TS_getArticleTitle(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))   
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&b,conn,1,1
if not c.eof then
TS_getArticleTitle=c(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))   
end if:c.close
end function

function checkEnLanguage()
checkEnLanguage=false
if instr(languageList,ChrW(101)&ChrW(110))>0 then  
checkEnLanguage=true
end if
end function

function getColumEnToCn(a)
dim b,c,d
b=split(WEBCOLUMNTYPE,ChrW(44))
for each c in b
if instr(c,ChrW(124))>0 then
d=split(c,ChrW(124))
if d(1)=a then
getColumEnToCn=d(0)
exit function
end if    
end if
next
end function
%>