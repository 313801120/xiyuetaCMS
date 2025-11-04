<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%








Class UpLoadClass
Private m_TotalSize,m_MaxSize,m_FileType,m_SavePath,m_AutoSave,m_Error,m_Charset
Private m_dicForm,m_binForm,m_binItem,m_strDate,m_lngTime
Public  FormItem,FileItem
Public Property Get Version
Version=ChrW(70)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(32)&ChrW(85)&ChrW(112)&ChrW(76)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(32)&ChrW(86)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(50)&ChrW(46)&ChrW(49)&ChrW(49)
End Property
Public Property Get Error
Error=m_Error
End Property
Public Property Get Charset
Charset=m_Charset
End Property
Public Property Let Charset(strCharset)
m_Charset=strCharset
End Property
Public Property Get TotalSize
TotalSize=m_TotalSize
End Property
Public Property Let TotalSize(lngSize)
if isNumeric(lngSize) then m_TotalSize=Clng(lngSize)
End Property
Public Property Get MaxSize
MaxSize=m_MaxSize
End Property
Public Property Let MaxSize(lngSize)
if isNumeric(lngSize) then m_MaxSize=Clng(lngSize)
End Property
Public Property Get FileType
FileType=m_FileType
End Property
Public Property Let FileType(strType)
m_FileType=strType
End Property
Public Property Get SavePath
SavePath=m_SavePath
End Property
Public Property Let SavePath(strPath)
m_SavePath=Replace(strPath,chr(0),"")
End Property
Public Property Get AutoSave
AutoSave=m_AutoSave
End Property
Public Property Let AutoSave(byVal Flag)
select case Flag
case 0,1,2: m_AutoSave=Flag
end select
End Property
Private Sub Class_Initialize
m_Error     = -1
m_Charset  = ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)
m_TotalSize= 0
m_MaxSize  = 3000000
m_FileType = ""
m_SavePath = ""
m_AutoSave = 0
Dim dtmNow : dtmNow = Date()
m_strDate  = Year(dtmNow)&Right(ChrW(48)&Month(dtmNow),2)&Right(ChrW(48)&Day(dtmNow),2)
m_lngTime  = Clng(Timer()*1000)
Set m_binForm = Server.CreateObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
Set m_binItem = Server.CreateObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
Set m_dicForm = Server.CreateObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121))
m_dicForm.CompareMode = 1
End sub
Private Sub Class_Terminate
m_dicForm.RemoveAll
Set m_dicForm = nothing
Set m_binItem = nothing
m_binForm.Close()
Set m_binForm = nothing
End sub
Public Function Open()
Open = 0
if m_Error=-1 then
m_Error=0
else
Exit function
end if
Dim a : a=Request.TotalBytes
if m_TotalSize>0 and a>m_TotalSize then
m_Error=5
Exit function
elseif a<1 then
m_Error=4
Exit function
end if
Dim b : b = 102400
Dim c : c = 0
m_binForm.Type = 1
m_binForm.Open()
do
m_binForm.Write Request.BinaryRead(b)
c=c+b
if  c >= a then exit do
loop    
m_binForm.Position=0
Dim d : d=m_binForm.Read()
Dim e,f,g
e=ChrB(13)&ChrB(10)
g=InstrB(1,d,e)-1
f=LeftB(d,g)
Dim h,i,j,k,l,m,n
Const strSplit="'"">"
Dim o,p,q,r
Dim s : s=g+2
Dim t
Do
t = InStrB(s,d,e&e)-1
m_binItem.Type=1
m_binItem.Open()
m_binForm.Position=s
m_binForm.CopyTo m_binItem,t-s
m_binItem.Position=0
m_binItem.Type=2
m_binItem.Charset=m_Charset
h = m_binItem.ReadText()
m_binItem.Close()
q=Instr(39,h,ChrW(34))
i=Mid(h,39,q-39)
s = t + 4
t = InStrB(s,d,f)-1
m_binItem.Type=1
m_binItem.Open()
m_binForm.Position=s
n=t-s-2
m_binForm.CopyTo m_binItem,n
if Instr(q,h,ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)) <>0 then
if not m_dicForm.Exists(i&ChrW(95)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)) then
p=p&strSplit&i
if m_binItem.Size <>0 then
q=q+13
j=Mid(h,Instr(q,h,ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(58)&ChrW(32))+14)
k=Mid(h,q,Instr(q,h,ChrW(34))-q)
q=InstrRev(k,ChrW(92))
l=Mid(k,q+1)
m_dicForm.Add i&ChrW(95)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101),j
m_dicForm.Add i&ChrW(95)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),l
m_dicForm.Add i&ChrW(95)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104),Left(k,q)
m_dicForm.Add i&ChrW(95)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101),n
if Instr(l,ChrW(46)) <>0 then
m=Mid(l,InstrRev(l,ChrW(46))+1)
else
m=""
end if
select case j
case ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47)&ChrW(106)&ChrW(112)&ChrW(101)&ChrW(103),ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47)&ChrW(112)&ChrW(106)&ChrW(112)&ChrW(101)&ChrW(103),ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47)&ChrW(106)&ChrW(112)&ChrW(103)
if Lcase(m) <>ChrW(106)&ChrW(112)&ChrW(103) then m=ChrW(106)&ChrW(112)&ChrW(103)
m_binItem.Position=3
do while not m_binItem.EOS
do
q = Ascb(m_binItem.Read(1))
loop while q = 255 and not m_binItem.EOS
if q < 192 or q > 195 then
m_binItem.read(Bin2Val(m_binItem.Read(2))-2)
else
Exit do
end if
do
q = Ascb(m_binItem.Read(1))
loop while q < 255 and not m_binItem.EOS
loop
m_binItem.Read(3)
m_dicForm.Add i&ChrW(95)&ChrW(72)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116),Bin2Val(m_binItem.Read(2))
m_dicForm.Add i&ChrW(95)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104),Bin2Val(m_binItem.Read(2))
case ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47)&ChrW(103)&ChrW(105)&ChrW(102)
if Lcase(m) <>ChrW(103)&ChrW(105)&ChrW(102) then m=ChrW(103)&ChrW(105)&ChrW(102)
m_binItem.Position=6
m_dicForm.Add i&ChrW(95)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104),BinVal2(m_binItem.Read(2))
m_dicForm.Add i&ChrW(95)&ChrW(72)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116),BinVal2(m_binItem.Read(2))
case ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47)&ChrW(112)&ChrW(110)&ChrW(103)
if Lcase(m) <>ChrW(112)&ChrW(110)&ChrW(103) then m=ChrW(112)&ChrW(110)&ChrW(103)
m_binItem.Position=18
m_dicForm.Add i&ChrW(95)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104),Bin2Val(m_binItem.Read(2))
m_binItem.Read(2)
m_dicForm.Add i&ChrW(95)&ChrW(72)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116),Bin2Val(m_binItem.Read(2))
case ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(47)&ChrW(98)&ChrW(109)&ChrW(112)
if Lcase(m) <>ChrW(98)&ChrW(109)&ChrW(112) then m=ChrW(98)&ChrW(109)&ChrW(112)
m_binItem.Position=18
m_dicForm.Add i&ChrW(95)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104),BinVal2(m_binItem.Read(4))
m_dicForm.Add i&ChrW(95)&ChrW(72)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116),BinVal2(m_binItem.Read(4))
case ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(120)&ChrW(45)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(119)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(45)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(104)
if Lcase(m) <>ChrW(115)&ChrW(119)&ChrW(102) then m=ChrW(115)&ChrW(119)&ChrW(102)
m_binItem.Position=0
if Ascb(m_binItem.Read(1))=70 then
m_binItem.Position=8
r = Num2Str(Ascb(m_binItem.Read(1)), 2 ,8)
q = Str2Num(Left(r, 5), 2)
r = Mid(r, 6)
while (Len(r) < q * 4)
r = r & Num2Str(Ascb(m_binItem.Read(1)), 2 ,8)
wend
m_dicForm.Add i&ChrW(95)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104), Int(Abs(Str2Num(Mid(r, q + 1, q), 2) - Str2Num(Mid(r, 1, q), 2)) / 20)
m_dicForm.Add i&ChrW(95)&ChrW(72)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116),Int(Abs(Str2Num(Mid(r, 3 * q + 1, q), 2) - Str2Num(Mid(r, 2 * q + 1, q), 2)) / 20)
end if
end select
m_dicForm.Add i&ChrW(95)&ChrW(69)&ChrW(120)&ChrW(116),m
m_dicForm.Add i&ChrW(95)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109),s
if m_AutoSave <>2 then
q=GetFerr(n,m)
m_dicForm.Add i&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114),q
if q=0 then
if m_AutoSave=0 then
l=GetTimeStr()
if m <>"" then l=l&ChrW(46)&m
end if
m_binItem.SaveToFile Server.MapPath(m_SavePath&l),2
m_dicForm.Add i,l
end if
end if
else
m_dicForm.Add i&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114),-1
end if
end if
else
m_binItem.Position=0
m_binItem.Type=2
m_binItem.Charset=m_Charset
r=m_binItem.ReadText
if m_dicForm.Exists(i) then
m_dicForm(i) = m_dicForm(i)&ChrW(44)&r
else
o=o&strSplit&i
m_dicForm.Add i,r
end if
end if
m_binItem.Close()
s = t+g+2
loop Until s+3>a
FormItem=Split(o,strSplit)
FileItem=Split(p,strSplit)
Open = a
End function
Private Function GetTimeStr()
m_lngTime=m_lngTime+1
GetTimeStr=m_strDate&Right(ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&m_lngTime,8)
End function
Private Function GetFerr(a,b)
dim c
c=0
if a>m_MaxSize and m_MaxSize>0 then
if m_Error=0 or m_Error=2 then m_Error=m_Error+1
c=c+1
end if
if Instr(1,LCase(ChrW(47)&m_FileType&ChrW(47)),LCase(ChrW(47)&b&ChrW(47)))=0 and m_FileType <>"" then
if m_Error<2 then m_Error=m_Error+2
c=c+2
end if
GetFerr=c
End function
Public Function Save(a,b)
Save=false
if m_dicForm.Exists(a&ChrW(95)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)) then
dim c,d
d=m_dicForm(a&ChrW(95)&ChrW(69)&ChrW(120)&ChrW(116))
c=GetFerr(m_dicForm(a&ChrW(95)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)),d)
if m_dicForm.Exists(a&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114)) then
if c=0 then
m_dicForm(a&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114))=0
end if
else
m_dicForm.Add a&ChrW(95)&ChrW(69)&ChrW(114)&ChrW(114),c
end if
if c <>0 then Exit function
if VarType(b)=2 then
select case b
case 0:b=GetTimeStr()
if d <>"" then b=b&ChrW(46)&d
case 1:b=m_dicForm(a&ChrW(95)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
end select
end if
m_binItem.Type = 1
m_binItem.Open
m_binForm.Position = m_dicForm(a&ChrW(95)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109))
m_binForm.CopyTo m_binItem,m_dicForm(a&ChrW(95)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101))
m_binItem.SaveToFile Server.MapPath(m_SavePath&b),2
m_binItem.Close()
if m_dicForm.Exists(a) then
m_dicForm(a)=b
else
m_dicForm.Add a,b
end if
Save=true
end if
End function
Public Function GetData(a)
GetData=""
if m_dicForm.Exists(a&ChrW(95)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109)) then
if GetFerr(m_dicForm(a&ChrW(95)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)),m_dicForm(a&ChrW(95)&ChrW(69)&ChrW(120)&ChrW(116))) <>0 then Exit function
m_binForm.Position = m_dicForm(a&ChrW(95)&ChrW(70)&ChrW(114)&ChrW(111)&ChrW(109))
GetData = m_binForm.Read(m_dicForm(a&ChrW(95)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)))
end if
End function
Public Function Form(a)
if m_dicForm.Exists(a) then
Form=m_dicForm(a)
else
Form=""
end if
End function
Private Function BinVal2(a)
dim b,c
b=0
for c = lenb(a) to 1 step -1
b = b *256 + Ascb(midb(a,c,1))
next
BinVal2=b
End function
Private Function Bin2Val(a)
dim b,c
b=0
for c = 1 to lenb(a)
b = b *256 + Ascb(midb(a,c,1))
next
Bin2Val=b
End function
Private Function Num2Str(a, b, c)
Dim d,e
d = ""
while (a >= b)
e   = a Mod b
d = e & d
a = (a - e) / b
wend
Num2Str = Right(String(c, ChrW(48)) & a & d, c)
End function
Private Function Str2Num(a, b)
Dim c, d
c = 0 
for d = 1 to Len(a)
c = c * b + Cint(Mid(a, d, 1))
next
Str2Num = c 
End function
End class
function Error2Info(a)
select case a
case -1:Error2Info = ChrW(69)&ChrW(82)&ChrW(82)&ChrW(79)&ChrW(82)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(58)&ChrW(32)&ChrW(19978)&ChrW(20256)&ChrW(27809)&ChrW(26377)&ChrW(24320)&ChrW(22987)&ChrW(65292)&ChrW(35831)&ChrW(20808)&ChrW(32)&ChrW(39)&ChrW(79)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(39)&ChrW(32)&ChrW(12290)
case 0: Error2Info = ChrW(19978)&ChrW(20256)&ChrW(25104)&ChrW(21151)&ChrW(12290)
case 1: Error2Info = ChrW(19978)&ChrW(20256)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(25991)&ChrW(20214)&ChrW(36229)&ChrW(36807)&ChrW(38480)&ChrW(21046)&ChrW(22823)&ChrW(23567)
case 2: Error2Info = ChrW(25991)&ChrW(20214)&ChrW(31867)&ChrW(22411)&ChrW(19981)&ChrW(20801)&ChrW(35768)
case 3: Error2Info = ChrW(25991)&ChrW(20214)&ChrW(22823)&ChrW(23567)&ChrW(36229)&ChrW(36807)&ChrW(38480)&ChrW(21046)&ChrW(65292)&ChrW(19988)&ChrW(25991)&ChrW(20214)&ChrW(31867)&ChrW(22411)&ChrW(19981)&ChrW(20801)&ChrW(35768)
case 4: Error2Info = ChrW(25991)&ChrW(20214)&ChrW(20445)&ChrW(23384)&ChrW(22833)&ChrW(36133)
case 5: Error2Info = ChrW(25991)&ChrW(20214)&ChrW(19978)&ChrW(20256)&ChrW(25968)&ChrW(37327)&ChrW(36229)&ChrW(20986)&ChrW(38480)&ChrW(21046)
end select
end function
%>