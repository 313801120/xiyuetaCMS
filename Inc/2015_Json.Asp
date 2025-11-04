<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%







function handleStrToJson(byval a)
dim b,c,d,e,f,g,h
set e = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121))
b=replace(a,ChrW(92)&ChrW(34),ChrW(91)&ChrW(124)&ChrW(45)&ChrW(21452)&ChrW(24341)&ChrW(21495)&ChrW(45)&ChrW(124)&ChrW(93))
b=replace(a,ChrW(92)&ChrW(61),ChrW(91)&ChrW(124)&ChrW(45)&ChrW(31561)&ChrW(21495)&ChrW(45)&ChrW(124)&ChrW(93))
b=replace(a,ChrW(92)&ChrW(44),ChrW(91)&ChrW(124)&ChrW(45)&ChrW(36887)&ChrW(21495)&ChrW(45)&ChrW(124)&ChrW(93))
c=split(b,ChrW(44))
for each f in c
if instr(f,ChrW(61))>0 then
d=split(f,ChrW(61))
g=replace(d(0),ChrW(91)&ChrW(124)&ChrW(45)&ChrW(21452)&ChrW(24341)&ChrW(21495)&ChrW(45)&ChrW(124)&ChrW(93),ChrW(34))
g=replace(g,ChrW(91)&ChrW(124)&ChrW(45)&ChrW(31561)&ChrW(21495)&ChrW(45)&ChrW(124)&ChrW(93),ChrW(61))
g=replace(g,ChrW(91)&ChrW(124)&ChrW(45)&ChrW(36887)&ChrW(21495)&ChrW(45)&ChrW(124)&ChrW(93),ChrW(44))
h=replace(d(1),ChrW(91)&ChrW(124)&ChrW(45)&ChrW(21452)&ChrW(24341)&ChrW(21495)&ChrW(45)&ChrW(124)&ChrW(93),ChrW(34))
h=replace(h,ChrW(91)&ChrW(124)&ChrW(45)&ChrW(31561)&ChrW(21495)&ChrW(45)&ChrW(124)&ChrW(93),ChrW(61))
h=replace(h,ChrW(91)&ChrW(124)&ChrW(45)&ChrW(36887)&ChrW(21495)&ChrW(45)&ChrW(124)&ChrW(93),ChrW(44))
e.add g, h
end if
next
handleStrToJson=json_encode(e)
end function

function  json_encode(a)
Dim b : Set b = New Cls_AB_JSON
json_encode=b.tojson(a) 
end function
Class Cls_AB_JSON
Public Collection, Count, QuotedVars, Kind, StrEncode
Private s_charset
Private Sub Class_Initialize

End sub
Private Sub Class_Terminate
Set Collection = Nothing
End sub
Public Property Let CharSet(ByVal s)
s_charset = Ucase(s)
End Property
Public Property Get CharSet()
CharSet = s_charset
End Property







































Public Function [New](ByVal a)
Set [New] = New Cls_AB_JSON
Select case LCase(a)
Case ChrW(48), ChrW(111)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116) [New].Kind = 0
Case ChrW(49), ChrW(97)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)  [New].Kind = 1
End select
End function
Private Property Get Counter
Counter = Count
Count = Count + 1
End Property


















Public Property Let Pair(Byval p, Byval v)
If IsNull(p) Then p = Counter
If vartype(v) = 9 Then
If TypeName(v) = ChrW(67)&ChrW(108)&ChrW(115)&ChrW(95)&ChrW(65)&ChrW(66)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(79)&ChrW(78) Then
Set Collection(p) = v
Else
Collection(p) = v
End if
Else
Collection(p) = v
End if
End Property
Public Default Property Get Pair(Byval p)
If IsNull(p) Then p = Count - 1
If IsObject(Collection(p)) Then
Set Pair = Collection(p)
Else
Pair = Collection(p)
End if
End Property













Public Sub Clean
Collection.RemoveAll
End sub













Public Sub Remove(Byval a)
If Collection.Exists(a) Then Collection.Remove a
End sub






























































Public Function toJSON(Byval a)

Dim b,c,d : c = 0 : d = 0
Dim e, f, g, h, i
Dim j : j = ChrW(47)
Dim k : k = ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(50)&ChrW(46)&ChrW(106)&ChrW(115)
Dim l : l = j&k

Select case VarType(a)
Case 1
toJSON = ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)
Case 7
toJSON = ChrW(34) & JsEncode__(CStr(a)) & ChrW(34)
Case 8
Select case TypeName(a)
Case ChrW(73)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116), ChrW(73)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121)
If a = Request.QueryString Or a = Request.Form Or a = Request.Cookies Then
e = True
toJSON = toJSON & ChrW(123)
For each c In a
If e Then e = False Else toJSON = toJSON & ChrW(44)
toJSON = toJSON & IIF(QuotedVars, ChrW(34) & IIF(StrEncode,JSEncode(c),JSEncode__(c)) & ChrW(34), JsEncode__(c)) & ChrW(58) & toJSON(a(c))
Next
toJSON = toJSON & ChrW(125)
End if
Case ChrW(74)&ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)
If isFile(l) Then
AB.Use ChrW(106)&ChrW(115)&ChrW(76)&ChrW(105)&ChrW(98)
Set h = AB.jsLib.New
h.basepath = j
h.inc(k)
Set i = h.object
toJSON = i.tostring(a)
Set i = Nothing
Set h = Nothing
Else
toJSON = a
End if
Case else
If a="" Then
toJSON = ChrW(34)&ChrW(34)
Else 
toJSON = ChrW(34) & IIF(StrEncode,JSEncode(a),JSEncode__(a)) & ChrW(34)
End if
End select
Case 9
Select case TypeName(a)
Case ChrW(78)&ChrW(111)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(110)&ChrW(103),ChrW(69)&ChrW(109)&ChrW(112)&ChrW(116)&ChrW(121)
toJSON = ChrW(123)&ChrW(125)
Case ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(101)&ChrW(116)
If a.state = 0 Then
toJSON = ChrW(91)&ChrW(93)
Else
If IsNul(a) Then
toJSON = ChrW(91)&ChrW(93)
Else
On error resume next
Set a = a.clone
On error goto 0
If a.recordcount = 1 Then
e = True
toJSON = toJSON & ChrW(91)&ChrW(123)
For d = 0 To a.fields.count-1
If e Then e = False Else toJSON = toJSON & ChrW(44)
If QuotedVars Then
toJSON = toJSON & ChrW(34) & IIF(StrEncode,JSEncode(lcase(a.fields(d).Name)),JSEncode__(lcase(a.fields(d).Name))) & ChrW(34)&ChrW(58) & toJSON(a.fields(d).Value)
Else
toJSON = toJSON & IIF(StrEncode,JSEncode(lcase(a.fields(d).Name)),JSEncode__(lcase(a.fields(d).Name))) & ChrW(58) & toJSON(a.fields(d).Value)
End if
Next
toJSON = toJSON & ChrW(125)&ChrW(93)
Else
f = True
toJSON = toJSON & ChrW(91)
a.movefirst
Do while Not a.eof
If f Then f = False Else toJSON = toJSON & ChrW(44)
e = True
toJSON = toJSON & ChrW(123)
For d = 0 To a.fields.count-1
If e Then e = False Else toJSON = toJSON & ChrW(44)
If QuotedVars Then
toJSON = toJSON & ChrW(34) & IIF(StrEncode,JSEncode(lcase(a.fields(d).Name)),JSEncode__(lcase(a.fields(d).Name))) & ChrW(34)&ChrW(58) & toJSON(a.fields(d).Value)
Else
toJSON = toJSON & IIF(StrEncode,JSEncode(lcase(a.fields(d).Name)),JSEncode__(lcase(a.fields(d).Name))) & ChrW(58) & toJSON(a.fields(d).Value)
End if
Next
toJSON = toJSON & ChrW(125)
c = c + 1
a.movenext
Loop
toJSON = toJSON & ChrW(93)
End if
End if
End if
Case ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121), ChrW(73)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116), ChrW(73)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121), ChrW(73)&ChrW(65)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116), ChrW(73)&ChrW(83)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)
If TypeName(a) = ChrW(73)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116) Then
Dim m : Set m = Server.CreateObject(AB.dictName)
m.add ChrW(99)&ChrW(108)&ChrW(105)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(99)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(102)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(101), a.clientcertificate
m.add ChrW(99)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(105)&ChrW(101)&ChrW(115), a.cookies
m.add ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109), a.form
m.add ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(103), a.querystring
m.add ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(105)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(115), a.servervariables
m.add ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(98)&ChrW(121)&ChrW(116)&ChrW(101)&ChrW(115), a.totalbytes
toJSON = toJSON(m)
ElseIf TypeName(a) = ChrW(73)&ChrW(65)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116) Or TypeName(a) = ChrW(73)&ChrW(83)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116) Then
g = a.contents.count
If g = 0 Then
toJSON = ChrW(123)&ChrW(125)
Else
e = True
toJSON = toJSON & ChrW(123)
For each c In a.contents
If e Then e = False Else toJSON = toJSON & ChrW(44)
toJSON = toJSON & IIF(QuotedVars, ChrW(34) & IIF(StrEncode,JSEncode(c),JSEncode__(c)) & ChrW(34), IIF(StrEncode,JSEncode(c),JSEncode__(c))) & ChrW(58) & toJSON(a(c))
Next
toJSON = toJSON & ChrW(125)
End if
ElseIf TypeName(a) = ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121) Then
g = a.count
If g = 0 Then
toJSON = ChrW(123)&ChrW(125)
Else
e = True
toJSON = toJSON & ChrW(123)
For each c In a
If e Then e = False Else toJSON = toJSON & ChrW(44)
toJSON = toJSON & ChrW(34) & IIF(QuotedVars, ChrW(34) & IIF(StrEncode,JSEncode(c),JSEncode__(c)) & ChrW(34), IIF(StrEncode,JSEncode(c),JSEncode__(c))) & ChrW(34)&ChrW(58) & toJSON(a(c))
Next
toJSON = toJSON & ChrW(125)
End if
Else
e = True
toJSON = toJSON & ChrW(123)
For each c In a
If e Then e = False Else toJSON = toJSON & ChrW(44)
toJSON = toJSON & IIF(QuotedVars, ChrW(34) & IIF(StrEncode,JSEncode(c),JSEncode__(c)) & ChrW(34), IIF(StrEncode,JSEncode(c),JSEncode__(c))) & ChrW(58) & toJSON(a(c))
Next
toJSON = toJSON & ChrW(125)
End if
Case ChrW(67)&ChrW(108)&ChrW(115)&ChrW(95)&ChrW(65)&ChrW(66)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(79)&ChrW(78)
e = True
toJSON = toJSON & IIF(a.kind, ChrW(91), ChrW(123))
For each c In a.collection
If e Then e = False Else toJSON = toJSON & ChrW(44)
toJSON = toJSON & IfThen(a.kind=0, IIF(QuotedVars, ChrW(34) & IIF(StrEncode,JSEncode(c),JSEncode__(c)) & ChrW(34), IIF(StrEncode,JSEncode(c),JSEncode__(c))) & ChrW(58)) & toJSON(a(c))
Next
toJSON = toJSON & IIF(a.kind, ChrW(93), ChrW(125))
Case ChrW(74)&ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)
If isFile(l) Then
AB.Use ChrW(106)&ChrW(115)&ChrW(76)&ChrW(105)&ChrW(98)
Set h = AB.jsLib.New
h.basepath = j
h.inc(k)
Set i = h.object
toJSON = i.tostring(a)
Set i = Nothing
Set h = Nothing
Else
toJSON = ChrW(123)&ChrW(125)
End if
Case ChrW(86)&ChrW(66)&ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)
toJSON = ChrW(123)&ChrW(125)
Case else
toJSON = ChrW(123)&ChrW(125)
End select
Case 11
toJSON = IIF(a, ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101), ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101))
Case 12, 8192, 8204, 8209
toJSON = RenderArray(a, 1, "")
Case 2, 3, 17, 19
toJSON = CLng(a)
Case 4, 5, 6, 14
toJSON = Replace(CDbl(a), ChrW(44), ChrW(46))
Case else
toJSON = ChrW(34) & IIF(StrEncode,JSEncode(Cstr(a)),JSEncode__(Cstr(a))) & ChrW(34)
End select

End function

function fieldToJson(a,byval b)
dim c, d,e,f,g
b = ChrW(124) & LCase(b) & ChrW(124)
c = True
d = d & ChrW(123)
while not a.eof
For g = 0 To a.fields.count-1
e = a.fields(g).Name
f = a.fields(g).Value

if instr(b,ChrW(124)& LCase(e) &ChrW(124))>0 then
If c Then c = False Else d = d & ChrW(44)
If QuotedVars Then
d = d & ChrW(34) & IIF(StrEncode,JSEncode(e),JSEncode__(e)) & ChrW(34)&ChrW(58) & toJSON(f)
Else
d = d & IIF(StrEncode,JSEncode(e),JSEncode__(e)) & ChrW(58) & toJSON(f)
End if
end if
Next
d = d & ChrW(125)
a.movenext:wend:a.close
d= ChrW(91)& d &ChrW(93)    
fieldToJson = d
end function

Private Function RenderArray(Byval a, Byval b, Byval c)

Dim d : d = LBound(a, b)
Dim e : e = UBound(a, b)
Dim f, g
Dim h : h = ChrW(44)
RenderArray = ChrW(91)
For f = d To e
If f = e Then
h = ""
End if
On error resume next
g = RenderArray(a, b + 1, c & f & ChrW(44) )
If Err = 9 Then
On error goto 0
RenderArray = RenderArray & toJSON(Eval(ChrW(97)&ChrW(114)&ChrW(114)&ChrW(40) & c & f & ChrW(41))) & h
Else
RenderArray = RenderArray & g & "" & h
End if
Next
RenderArray = RenderArray & ChrW(93)
End function
Public Function JsEncode(ByVal a)
If isNul(a) Then JsEncode = "" : Exit function
Dim b, c, d, e, f, g, h
b = Array(&h27,&h22,&h5C,&h2F,&h08,&h0C,&h0A,&h0D,&h09)
c = Array(&h27,&h22,&h5C,&h2F,&h62,&h66,&h6E,&h72,&h749)
For d = 1 To Len(a)
g = True
f = Mid(a, d, 1)
For e = 0 To Ubound(b)
If f = Chr(b(e)) Then
h = h & ChrW(92) & Chr(c(e))
g = False
Exit for
End if
Next
If g Then
Dim i
i = AscW(f)
If i > 31 And i < 127 Then
h = h & f
ElseIf i > -1 Or i < 65535 Then
h = h & ChrW(92)&ChrW(117) & String(4 - Len(Hex(i)), ChrW(48)) & Hex(i)
End if
End if
Next
JsEncode = h

End function
Private Function JsEncode__(ByVal a)

If isNul(a) Then JsEncode__ = "" : Exit function
Dim b, c, d, e, f, g, h
b = Array(&h27,&h22,&h5C,&h2F,&h08,&h0C,&h0A,&h0D,&h09)
c = Array(&h27,&h22,&h5C,&h2F,&h62,&h66,&h6E,&h72,&h749)
For d = 1 To Len(a)
g = True
f = Mid(a, d, 1)
For e = 0 To Ubound(b)
If f = Chr(b(e)) Then
h = h & ChrW(92) & Chr(c(e))
g = False
Exit for
End if
Next
If g Then h = h & f
Next
JsEncode__ = h
End function
Public Function Stringify(Byval a)
Stringify = toJSON(a)
End function













Public Property Get jsString
jsString = toJSON(Me)
End Property
























Public Function toObject(Byval a)
On error resume next
If Err Then Err.Clear
Dim b,c : b = 0 : c = 0
Dim d, e, f, g
Dim h : h = AB.BasePath & ChrW(106)&ChrW(115)&ChrW(76)&ChrW(105)&ChrW(98)&ChrW(47)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(47)
Dim i : i = ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(50)&ChrW(46)&ChrW(106)&ChrW(115)
Dim j : j = h&i
Select case VarType(a)
Case 9
Set toObject = a
Case 8
Select case TypeName(a)
Case ChrW(74)&ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)
If isFile(j) Then
AB.Use ChrW(106)&ChrW(115)&ChrW(76)&ChrW(105)&ChrW(98)
Set e = AB.jsLib.New
e.basepath = h
e.inc(i)
Set f = e.object
If IsObject(f.toobject(a)) Then Set toObject = f.toobject(a) Else toObject = f.toobject(a)
Set f = Nothing
Set e = Nothing
Else
toObject = a
End if
Case ChrW(83)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(103)
If LCase(a) = ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108) Then
toObject = Null
ElseIf LCase(a) = ChrW(101)&ChrW(109)&ChrW(112)&ChrW(116)&ChrW(121) Then
toObject = Empty
ElseIf a = "" Or a = ChrW(34)&ChrW(34) Then
toObject = ""
ElseIf LCase(a) = ChrW(110)&ChrW(111)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(110)&ChrW(103) Then
Set toObject = Nothing
ElseIf LCase(a) = ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) Or LCase(a) = ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101) Then
toObject = CBool(a)
ElseIf isInt(a) Then
toObject = CLng(a)
ElseIf Test(a,ChrW(100)&ChrW(111)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(101)) Then
toObject = CDbl(a)
ElseIf Test(a,ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)) Then
toObject = CDate(a)
Else



















AB.Use ChrW(83)&ChrW(99)
Set d = AB.Sc.New
d.lang = ChrW(106)&ChrW(115)
d.add ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(32) & a & ChrW(59)
If IsObject(d.codeobject.jsonobject) Then Set toObject = d.codeobject.jsonobject Else Set toObject = Nothing
End if
Case else

If IsObject(Me.jsEval(a)) Then Set g = Me.jsEval(a) Else g = Me.jsEval(a)
If IsObject(g) Then Set toObject = g Else toObject = g
End select
Case else

If IsObject(Me.jsEval(a)) Then Set g = Me.jsEval(a) Else g = Me.jsEval(a)
If IsObject(g) Then Set toObject = g Else toObject = g
End select
If Err Then : toObject = a : Err.Clear : End if
On error goto 0
End function
Public Function Parse(Byval a)
If IsObject(toObject(a)) Then Set Parse = toObject(a) Else Parse = toObject(a)
End function




















Public Sub setJSArrayItem(ByRef a, ByVal b, ByVal c)
On error resume next
AB.Use ChrW(83)&ChrW(99)
Dim d : Set d = AB.Sc.New
d.lang = ChrW(106)&ChrW(115)
d.add ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(61)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(59)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(74)&ChrW(83)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(40)&ChrW(97)&ChrW(114)&ChrW(114)&ChrW(44)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(41)&ChrW(123)&ChrW(116)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(97)&ChrW(114)&ChrW(114)&ChrW(91)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(93)&ChrW(59)&ChrW(32)&ChrW(125)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(40)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(59)&ChrW(32)&ChrW(125)&ChrW(125)
d.run ChrW(115)&ChrW(101)&ChrW(116)&ChrW(74)&ChrW(83)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121), Array(b, c)
Set a = d.codeobject.itemtemp
If Err.number=0 Then
Exit sub
End if
a = d.codeobject.itemtemp
On error goto 0
End sub
















Public Function getJSArrayItem(ByVal a, ByVal b)
On error resume next
AB.Use ChrW(83)&ChrW(99)
Dim c : Set c = AB.Sc.New
c.lang = ChrW(106)&ChrW(115)
c.add ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(74)&ChrW(83)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(40)&ChrW(97)&ChrW(114)&ChrW(114)&ChrW(44)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(41)&ChrW(123)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(61)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(59)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(97)&ChrW(114)&ChrW(114)&ChrW(91)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(93)&ChrW(59)&ChrW(32)&ChrW(125)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(40)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(125)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(59)&ChrW(125)
If IsObject(c.run(ChrW(103)&ChrW(101)&ChrW(116)&ChrW(74)&ChrW(83)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121), Array(a, b))) Then
Set getJSArrayItem = c.run(ChrW(103)&ChrW(101)&ChrW(116)&ChrW(74)&ChrW(83)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121), Array(a, b))
Else
getJSArrayItem = c.run(ChrW(103)&ChrW(101)&ChrW(116)&ChrW(74)&ChrW(83)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121), Array(a, b))
End if
On error goto 0
End function













Public Function jsEval(Byval a)
On error resume next
If Err Then Err.Clear
Dim b, c, d, e
AB.Use ChrW(83)&ChrW(99)
Set b = AB.Sc.New
b.lang = ChrW(106)&ChrW(115)
b.add ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(69)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(40)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(59)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(40)&ChrW(39)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(40)&ChrW(39)&ChrW(32)&ChrW(43)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(32)&ChrW(43)&ChrW(32)&ChrW(39)&ChrW(41)&ChrW(59)&ChrW(39)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(125)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(40)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(59)&ChrW(32)&ChrW(125)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(40)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(41)&ChrW(59)&ChrW(125)
Set d = b.object
If IsObject(d.toeval(a)) Then Set jsEval = d.toeval(a) Else jsEval = d.toeval(a)
Set d = Nothing
Set b = Nothing
If Err.Number <> 0 Then : Err.Clear : jsEval = a : End if
On error goto 0
End function
Public Function vbEval(Byval a)
On error resume next
If Err Then Err.Clear
If IsObject(Eval(a)) Then Set vbEval = Eval(a) Else vbEval = Eval(a)
If Err.Number <> 0 Then : Err.Clear : vbEval = a : End if
On error goto 0
End function


















Public Function JSArrayToVBArray(ByVal a)
On error resume next
Dim b, c
If TypeName(a) = ChrW(74)&ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111) Then
b = a.join(ChrW(123)&ChrW(64)&ChrW(76)&ChrW(120)&ChrW(46)&ChrW(83)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(116)&ChrW(64)&ChrW(125))
c = Split(b, ChrW(123)&ChrW(64)&ChrW(76)&ChrW(120)&ChrW(46)&ChrW(83)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(116)&ChrW(64)&ChrW(125))
End if
JSArrayToVBArray = c
On error goto 0
End function


















Public Function vbArrayToJSArray(ByVal a)
On error resume next
AB.Use ChrW(83)&ChrW(99)
Dim b : Set b = AB.Sc.New
b.lang = ChrW(106)&ChrW(115)
Dim c : Set c = b.modules.add(ChrW(78)&ChrW(101)&ChrW(119)&ChrW(77)&ChrW(111)&ChrW(100)&ChrW(117)&ChrW(108)&ChrW(101))
c.addcode ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(106)&ChrW(115)&ChrW(86)&ChrW(66)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(84)&ChrW(111)&ChrW(74)&ChrW(83)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(40)&ChrW(118)&ChrW(98)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(41)&ChrW(123)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(32)&ChrW(86)&ChrW(66)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(40)&ChrW(118)&ChrW(98)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(46)&ChrW(116)&ChrW(111)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(40)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(125)
Dim d : Set d = c.codeobject
If IsObject(d.jsvbarraytojsarray(a)) Then
Set VBArrayToJSArray = d.jsvbarraytojsarray(a)
Else
VBArrayToJSArray = d.jsvbarraytojsarray(a)
End if
On error goto 0
End function










Public Sub Flush
Response.Clear()
Response.Charset = s_charset
Response.ContentType = ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)
NoCache()
If TypeName(Response) <> ChrW(69)&ChrW(109)&ChrW(112)&ChrW(116)&ChrW(121) Then
Put jsString
ElseIf WScript <> Empty Then
WScript.Echo(jsString)
End if
End sub















Public Function Clone
Set Clone = ColClone(Me)
End function














Public Function jsObject
Set jsObject = AB.Json.New(0)
End function











Public Function jsArray
Set jsArray = AB.Json.New(1)
End function












Public Function toStr(Byval a)
toStr = AB.Json.toJSON(a)
End function












Public Function QueryToJSON(Byval a, Byval b)
On error resume next
Dim c, d, e, f
Set d = jsArray()
If Not IsObject(a) Or TypeName(a) <>ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) Then:Err.Clear:Set QueryToJSON=d:Exit function:End if
Set c = a.execute(b)
If Err.Number <>0 Then : Err.Clear : Set QueryToJSON = d : Exit function : End if
Dim g : g = 0
Do while Not (c.eof Or c.bof)
Set f = jsObject()
d(g) = f
For each e In c.fields
d(g)(e.name) = e.value
Next
g = g + 1
Set f = Nothing
c.movenext
Loop
c.close : Set c = Nothing
Set QueryToJSON = d
On error goto 0
End function
Private Function ColClone(Byval a)
Dim b, c
Set b = new Cls_AB_JSON
b.kind = a.kind
For each c In a.collection
If IsObject(a(c)) Then
Set b(c) = ColClone(a(c))
Else
b(c) = a(c)
End if
Next
Set ColClone = b
End function
Private Function Escape__(Byval a)
Dim b, c, d
b = &h22
c = &h5C
d = &h2F
Dim e, f, g
For e = 1 To (Len(a))
f = Mid(a, e, 1)
If AscW(f) > &h00 and AscW(f) < &h1F Then
f = EscapeQuence(f)
ElseIf AscW(f) >= &hC280 and AscW(f) <= &hC2BF Then
f = ChrW(92)&ChrW(117)&ChrW(48)&ChrW(48) + Right(padLeft(hex(AscW(f) - &hC200), 2, 0), 2)
ElseIf AscW(f) >= &hC380 and AscW(f) <= &hC3BF Then
f = ChrW(92)&ChrW(117)&ChrW(48)&ChrW(48) + Right(padLeft(hex(AscW(f) - &hC2C0), 2, 0), 2)
Else
Select case AscW(f)
Case b: f = EscapeQuence(f)
Case c: f = EscapeQuence(f)
Case d: f = EscapeQuence(f)
End select
End if
g = g & f
Next
Escape__ = g
End function
Private Function EscapeQuence(Byval a)
EscapeQuence = ChrW(92)&ChrW(117)&ChrW(48)&ChrW(48) + Right(padLeft(hex(AscW(a)), 2, 0), 2)
End function
Private Function padLeft(Byval a, Byval b, Byval c)
padLeft = Right(cloneIt(c, b) & a, b)
End function
private Function cloneIt(Byval a, Byval b)
Dim c:For c = 1 To b : cloneIt = cloneIt & a : Next
End function
End class
%>