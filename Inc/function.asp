<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%

Function jcount() 
call openconn()
dim a,b
Set a = Server.CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(61)&ChrW(39) & getip() & ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(102)&ChrW(40)&ChrW(39)&ChrW(100)&ChrW(39)&ChrW(44)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(41)&ChrW(61)&ChrW(48)&ChrW(32)  
a.open b, conn, 3, 3 
If Not a.eof Then
a(ChrW(112)&ChrW(118)) = a(ChrW(112)&ChrW(118)) + 1 
a.update 
Else
a.addnew 
a(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116)) = Request.ServerVariables(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(95)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(95)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116)) 
If Request.ServerVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(82)) = "" Then
a(ChrW(117)&ChrW(114)&ChrW(108)) = ChrW(30452)&ChrW(25509)&ChrW(35775)&ChrW(38382) 
Else
a(ChrW(117)&ChrW(114)&ChrW(108)) = Request.ServerVariables(ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)&ChrW(95)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(82)) 
End if 
a(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)) = look_ip(getip()) 
a(ChrW(112)&ChrW(118)) = 1 
a(ChrW(105)&ChrW(112)) = getip()
a.update 
End if 
a.close  
End function 

function shuffleArray(a)
Dim b,c,d,e

b=UBound(a)
randomize  
for e=0 to b
c=int(rnd()*b)  
d=a(c)  
a(c)=a(e)  
a(e)=d
Next
shuffleArray=a
end function

function hanldeSccessIdArrayList(a)
dim b,c,d
b=split(a,ChrW(44))
for each c in b
c=getStrToNumber(c)
if c <>"" then
if d <>"" then d=d & ChrW(44)
d=d & c
end if
next
hanldeSccessIdArrayList=d
end function
%>