<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%





Const JSON_OBJECT  = 0
Const JSON_ARRAY  = 1
Class jsCore
Public Collection
Public Count
Public QuotedVars
Public Kind
Private Sub Class_Initialize
Set Collection = CreateObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121))
QuotedVars = True
Count = 0
End sub
Private Sub Class_Terminate
Set Collection = Nothing
End sub

Private Property Get Counter 
Counter = Count
Count = Count + 1
End Property


Public Property Let Pair(p, v)
If IsNull(p) Then p = Counter
Collection(p) = v
End Property
Public Property Set Pair(p, v)
If IsNull(p) Then p = Counter
If TypeName(v) <> ChrW(106)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(114)&ChrW(101) Then
Err.Raise &hD, ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(58)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115), ChrW(73)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)&ChrW(58)&ChrW(32)&ChrW(39) & TypeName(v) & ChrW(39)
End if
Set Collection(p) = v
End Property
Public Default Property Get Pair(p)
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
Public Sub Remove(a)
Collection.Remove a
End sub


Function jsEncode(a)
Dim charmap(127), haystack()
charmap(8)  = ChrW(92)&ChrW(98)
charmap(9)  = ChrW(92)&ChrW(116)
charmap(10) = ChrW(92)&ChrW(110)
charmap(12) = ChrW(92)&ChrW(102)
charmap(13) = ChrW(92)&ChrW(114)
charmap(34) = ChrW(92)&ChrW(34)
charmap(47) = ChrW(92)&ChrW(47)
charmap(92) = ChrW(92)&ChrW(92)
Dim b : b = Len(a) - 1
ReDim haystack(b)
Dim c, d
For c = 0 To b
haystack(c) = Mid(a, c + 1, 1)
d = AscW(haystack(c)) And 65535
If d < 127 Then
If Not IsEmpty(charmap(d)) Then
haystack(c) = charmap(d)
ElseIf d < 32 Then
haystack(c) = ChrW(92)&ChrW(117) & Right(ChrW(48)&ChrW(48)&ChrW(48) & Hex(d), 4)
End if
Else
haystack(c) = ChrW(92)&ChrW(117) & Right(ChrW(48)&ChrW(48)&ChrW(48) & Hex(d), 4)
End if
Next
jsEncode = Join(haystack, "")
End function

Public Function toJSON(a)
Select case VarType(a)
Case 0
toJSON = ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)
Case 1
toJSON = ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)
Case 7

toJSON = ChrW(34) & CStr(a) & ChrW(34)
Case 8
toJSON = ChrW(34) & jsEncode(a) & ChrW(34)
Case 9
Dim b,c 
b = True
If a.kind Then toJSON = toJSON & ChrW(91) Else toJSON = toJSON & ChrW(123)
For each c In a.collection
If b Then b = False Else toJSON = toJSON & ChrW(44)
If a.kind Then 
toJSON = toJSON & toJSON(a(c))
Else
If QuotedVars Then
toJSON = toJSON & ChrW(34) & c & ChrW(34)&ChrW(58) & toJSON(a(c))
Else
toJSON = toJSON & c & ChrW(58) & toJSON(a(c))
End if
End if
Next
If a.kind Then toJSON = toJSON & ChrW(93) Else toJSON = toJSON & ChrW(125)
Case 11
If a Then toJSON = ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101) Else toJSON = ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)
Case 12, 8192, 8204
toJSON = RenderArray(a, 1, "")
Case else
toJSON = Replace(a, ChrW(44), ChrW(46))
End select
End function
Function RenderArray(a, b, c)
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
Public Property Get jsString
jsString = toJSON(Me)
End Property
Sub Flush
If TypeName(Response) <> ChrW(69)&ChrW(109)&ChrW(112)&ChrW(116)&ChrW(121) Then 
Response.Write(jsString)
ElseIf WScript <> Empty Then 
WScript.Echo(jsString)
End if
End sub
Public Function Clone
Set Clone = ColClone(Me)
End function
Private Function ColClone(a)
Dim b, c
Set b = new jsCore
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
End class
Function jsObject
Set jsObject = new jsCore
jsObject.Kind = JSON_OBJECT
End function
Function jsArray
Set jsArray = new jsCore
jsArray.Kind = JSON_ARRAY
End function
Function toJSON(a)
toJSON = (new jsCore).toJSON(a)
End function
%>