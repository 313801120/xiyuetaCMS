<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%






Class aspJSON
Public data
Private p_JSONstring
private aj_in_string, aj_in_escape, aj_i_tmp, aj_char_tmp, aj_s_tmp, aj_line_tmp
private aj_line, aj_lines, aj_currentlevel, aj_currentkey, aj_currentvalue, aj_newlabel, aj_RegExp, aj_colonfound
Private Sub Class_Initialize()
Set data = Collection()
Set aj_RegExp = New RegExp
aj_RegExp.Pattern = ChrW(92)&ChrW(115)&ChrW(123)&ChrW(48)&ChrW(44)&ChrW(125)&ChrW(40)&ChrW(92)&ChrW(83)&ChrW(123)&ChrW(49)&ChrW(125)&ChrW(91)&ChrW(92)&ChrW(115)&ChrW(44)&ChrW(92)&ChrW(83)&ChrW(93)&ChrW(42)&ChrW(92)&ChrW(83)&ChrW(123)&ChrW(49)&ChrW(125)&ChrW(41)&ChrW(92)&ChrW(115)&ChrW(123)&ChrW(48)&ChrW(44)&ChrW(125)
aj_RegExp.Global = False
aj_RegExp.IgnoreCase = True
aj_RegExp.Multiline = True
End sub
Private Sub Class_Terminate()
Set data = Nothing
Set aj_RegExp = Nothing
End sub
Public Sub loadJSON(a)
a = aj_MultilineTrim(a)
If Len(a) = 0 Then Err.Raise 1, ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(74)&ChrW(83)&ChrW(79)&ChrW(78)&ChrW(32)&ChrW(69)&ChrW(114)&ChrW(114)&ChrW(111)&ChrW(114), ChrW(78)&ChrW(111)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(32)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(46)
select case Left(a, 1)
case ChrW(123), ChrW(91)
case else
With (Server.CreateObject(ChrW(77)&ChrW(115)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(50)&ChrW(46)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(88)&ChrW(77)&ChrW(76)&ChrW(72)&ChrW(84)&ChrW(84)&ChrW(80)))
.open ChrW(71)&ChrW(69)&ChrW(84), a, False
.setRequestHeader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)
.setRequestHeader ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(83)&ChrW(101)&ChrW(116), ChrW(85)&ChrW(84)&ChrW(70)&ChrW(45)&ChrW(56)
.Send
a = .ResponseText
End With      
end select
p_JSONstring = CleanUpJSONstring(a)
aj_lines = Split(p_JSONstring, Chr(13) & Chr(10))
Dim level(99)
aj_currentlevel = 1
Set level(aj_currentlevel) = data
For each aj_line In aj_lines
aj_currentkey = ""
aj_currentvalue = ""
If Instr(aj_line, ChrW(58)) > 0 Then
aj_in_string = False
aj_in_escape = False
aj_colonfound = False
For aj_i_tmp = 1 To Len(aj_line)
If aj_in_escape Then
aj_in_escape = False
Else
Select case Mid(aj_line, aj_i_tmp, 1)
Case ChrW(34)
aj_in_string = Not aj_in_string
Case ChrW(58)
If Not aj_in_escape And Not aj_in_string Then
aj_currentkey = Left(aj_line, aj_i_tmp - 1)
aj_currentvalue = Mid(aj_line, aj_i_tmp + 1)
aj_colonfound = True
Exit for
End if
Case ChrW(92)
aj_in_escape = True
End select
End if
Next
if aj_colonfound then
aj_currentkey = aj_Strip(aj_JSONDecode(aj_currentkey), ChrW(34))
If Not level(aj_currentlevel).exists(aj_currentkey) Then level(aj_currentlevel).Add aj_currentkey, ""
end if
End if
If right(aj_line,1) = ChrW(123) Or right(aj_line,1) = ChrW(91) Then
If Len(aj_currentkey) = 0 Then aj_currentkey = level(aj_currentlevel).Count
Set level(aj_currentlevel).Item(aj_currentkey) = Collection()
Set level(aj_currentlevel + 1) = level(aj_currentlevel).Item(aj_currentkey)
aj_currentlevel = aj_currentlevel + 1
aj_currentkey = ""
ElseIf right(aj_line,1) = ChrW(125) Or right(aj_line,1) = ChrW(93) or right(aj_line,2) = ChrW(125)&ChrW(44) Or right(aj_line,2) = ChrW(93)&ChrW(44) Then
aj_currentlevel = aj_currentlevel - 1
ElseIf Len(Trim(aj_line)) > 0 Then
if Len(aj_currentvalue) = 0 Then aj_currentvalue = aj_line
aj_currentvalue = getJSONValue(aj_currentvalue)
If Len(aj_currentkey) = 0 Then aj_currentkey = level(aj_currentlevel).Count
level(aj_currentlevel).Item(aj_currentkey) = aj_currentvalue
End if
Next
End sub
Public Function Collection()
set Collection = Server.CreateObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121))
End function
Public Function AddToCollection(a)
if TypeName(a) <> ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121) then Err.Raise 1, ChrW(65)&ChrW(100)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(69)&ChrW(114)&ChrW(114)&ChrW(111)&ChrW(114), ChrW(78)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(97)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(46)
aj_newlabel = a.count
a.add aj_newlabel, Collection()
set AddToCollection = a.item(aj_newlabel)
end function
Private Function CleanUpJSONstring(a)
a = Replace(a, Chr(13) & Chr(10), "")
a = Mid(a, 2, Len(a) - 2)
aj_in_string = False : aj_in_escape = False : aj_s_tmp = ""
For aj_i_tmp = 1 To Len(a)
aj_char_tmp = Mid(a, aj_i_tmp, 1)
If aj_in_escape Then
aj_in_escape = False
aj_s_tmp = aj_s_tmp & aj_char_tmp
Else
Select case aj_char_tmp
Case ChrW(92) : aj_s_tmp = aj_s_tmp & aj_char_tmp : aj_in_escape = True
Case ChrW(34) : aj_s_tmp = aj_s_tmp & aj_char_tmp : aj_in_string = Not aj_in_string
Case ChrW(123), ChrW(91)
aj_s_tmp = aj_s_tmp & aj_char_tmp & aj_InlineIf(aj_in_string, "", Chr(13) & Chr(10))
Case ChrW(125), ChrW(93)
aj_s_tmp = aj_s_tmp & aj_InlineIf(aj_in_string, "", Chr(13) & Chr(10)) & aj_char_tmp
Case ChrW(44) : aj_s_tmp = aj_s_tmp & aj_char_tmp & aj_InlineIf(aj_in_string, "", Chr(13) & Chr(10))
Case else : aj_s_tmp = aj_s_tmp & aj_char_tmp
End select
End if
Next
CleanUpJSONstring = ""
aj_s_tmp = split(aj_s_tmp, Chr(13) & Chr(10))
For each aj_line_tmp In aj_s_tmp
aj_line_tmp = replace(replace(aj_line_tmp, chr(10), ""), chr(13), "")
CleanUpJSONstring = CleanUpJSONstring & aj_Trim(aj_line_tmp) & Chr(13) & Chr(10)
Next
End function
Private Function getJSONValue(ByVal a)
a = Trim(a)
If Left(a,1) = ChrW(58)  Then a = Mid(a, 2)
If Right(a,1) = ChrW(44) Then a = Left(a, Len(a) - 1)
a = Trim(a)
Select case a
Case ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)  : getJSONValue = True
Case ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101) : getJSONValue = False
Case ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108) : getJSONValue = Null
Case else
If (Instr(a, ChrW(34)) = 0) Then
If IsNumeric(a) Then
getJSONValue = CDbl(a)
Else
getJSONValue = a
End if
Else
If Left(a,1) = ChrW(34) Then a = Mid(a, 2)
If Right(a,1) = ChrW(34) Then a = Left(a, Len(a) - 1)
getJSONValue = aj_JSONDecode(Trim(a))
End if
End select
End function
Private JSONoutput_level
Public Function JSONoutput()
dim a, b
JSONoutput_level = 1
a = ChrW(91)&ChrW(93)
For each b In data
If Not aj_IsInt(b) Then a = ChrW(123)&ChrW(125)
Next
JSONoutput = Left(a, 1) & Chr(13) & Chr(10) & GetDict(data) & Right(a, 1)
End function
Public Function JsonWrite()
dim a, b
JSONoutput_level = 1
a = ChrW(91)&ChrW(93)
For each b In data
If Not aj_IsInt(b) Then a = ChrW(123)&ChrW(125)
Next
val = Left(a, 1) & GetDict(data) & Right(a, 1)
val = Replace(val, Chr(8), "")
val = Replace(val, Chr(12), "")
val = Replace(val, Chr(10), "")
val = Replace(val, Chr(13), "")
val = Replace(val, Chr(9), "")
val = Replace(val, Chr(32), "")


JsonWrite = Trim(val)
End function
Private Function GetDict(a)
dim b, c, d, e
For each b In a
Select case TypeName(a.item(b))
Case ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121)
GetDict = GetDict & Space(JSONoutput_level * 4)          
e = ChrW(91)&ChrW(93)
For each d In a.item(b).Keys
If Not aj_IsInt(d) Then e = ChrW(123)&ChrW(125)
Next
If aj_IsInt(b) Then
GetDict = GetDict & (Left(e,1) & Chr(13) & Chr(10))
Else
GetDict = GetDict & (ChrW(34) & aj_JSONEncode(b) & ChrW(34) & ChrW(58)&ChrW(32) & Left(e,1) & Chr(13) & Chr(10))
End if
JSONoutput_level = JSONoutput_level + 1
c = a.keys
GetDict = GetDict & (GetSubDict(a.item(b)) &_
Space(JSONoutput_level * 4) & Right(e,1) & aj_InlineIf(b = c(a.count - 1),"" , ChrW(44)) & Chr(13) & Chr(10))
Case else
c =  a.keys
GetDict = GetDict & (Space(JSONoutput_level * 4) &_
aj_InlineIf(aj_IsInt(b), "", ChrW(34) & aj_JSONEncode(b) & ChrW(34)&ChrW(58)&ChrW(32)) & WriteValue(a.item(b)) &_
aj_InlineIf(b = c(a.count - 1),"" , ChrW(44)) & Chr(13) & Chr(10))
End select
Next
End function
Private Function aj_IsInt(a)
aj_IsInt = (TypeName(a) = ChrW(73)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(103)&ChrW(101)&ChrW(114) Or TypeName(a) = ChrW(76)&ChrW(111)&ChrW(110)&ChrW(103))
End function
Private Function GetSubDict(a)
GetSubDict = GetDict(a)
JSONoutput_level= JSONoutput_level -1
End function
Private Function WriteValue(ByVal a)
Select case TypeName(a)
Case ChrW(68)&ChrW(111)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(101), ChrW(73)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(103)&ChrW(101)&ChrW(114), ChrW(76)&ChrW(111)&ChrW(110)&ChrW(103): WriteValue = replace(a, ChrW(44), ChrW(46))
Case ChrW(78)&ChrW(117)&ChrW(108)&ChrW(108)            : WriteValue = ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)
Case ChrW(66)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(110)          : WriteValue = aj_InlineIf(a, ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101), ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101))
Case else            : WriteValue = ChrW(34) & aj_JSONEncode(a) & ChrW(34)
End select
End function
Private Function aj_JSONEncode(ByVal a)
a = Replace(a, ChrW(92), ChrW(92)&ChrW(92))
a = Replace(a, ChrW(34), ChrW(92)&ChrW(34))

a = Replace(a, Chr(8), ChrW(92)&ChrW(98))
a = Replace(a, Chr(12), ChrW(92)&ChrW(102))
a = Replace(a, Chr(10), ChrW(92)&ChrW(110))
a = Replace(a, Chr(13), ChrW(92)&ChrW(114))
a = Replace(a, Chr(9), ChrW(92)&ChrW(116))
aj_JSONEncode = Trim(a)
End function
Private Function aj_JSONDecode(ByVal a)
a = Replace(a, ChrW(92)&ChrW(34), ChrW(34))
a = Replace(a, ChrW(92)&ChrW(92), ChrW(92))
a = Replace(a, ChrW(92)&ChrW(47), ChrW(47))
a = Replace(a, ChrW(92)&ChrW(98), Chr(8))
a = Replace(a, ChrW(92)&ChrW(102), Chr(12))
a = Replace(a, ChrW(92)&ChrW(110), Chr(10))
a = Replace(a, ChrW(92)&ChrW(114), Chr(13))
a = Replace(a, ChrW(92)&ChrW(116), Chr(9))
aj_JSONDecode = Trim(a)
End function
Private Function aj_InlineIf(a, b, c)
If a Then aj_InlineIf = b Else aj_InlineIf = c
End function
Private Function aj_Strip(ByVal a, b)
If Left(a, 1) = b Then a = Mid(a, 2)
If Right(a, 1) = b Then a = Left(a, Len(a) - 1)
aj_Strip = a
End function
Private Function aj_MultilineTrim(a)
aj_MultilineTrim = aj_RegExp.Replace(a, ChrW(36)&ChrW(49))
End function
private function aj_Trim(a)
aj_Trim = Trim(a)
Do while Left(aj_Trim, 1) = Chr(9) : aj_Trim = Mid(aj_Trim, 2) : Loop
Do while Right(aj_Trim, 1) = Chr(9) : aj_Trim = Left(aj_Trim, Len(aj_Trim) - 1) : Loop
aj_Trim = Trim(aj_Trim)
end function
End class







Function parseJSON(a)
dim b
If Not IsObject(b) Then
Set b = Server.CreateObject(ChrW(77)&ChrW(83)&ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(46)&ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(111)&ChrW(108))
b.language = ChrW(74)&ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)
b.addcode ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(46)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(46)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(120)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(91)&ChrW(120)&ChrW(93)&ChrW(59)&ChrW(32)&ChrW(125)&ChrW(59)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(59)
End if
b.executestatement ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(32) & a & ChrW(59)
Set parseJSON = b.codeobject.result
End function

function dictionaryToJson(a)
dim b,c,d
For each b In a
d=b
b=a(d)
if c <>"" then
c=c & ChrW(44)
end if
c=c & d & ChrW(58)&ChrW(34)& JsEncode__(b) &ChrW(34)
next
c=ChrW(91)&ChrW(123)& c &ChrW(125)&ChrW(93)
dictionaryToJson=c
end function
%>