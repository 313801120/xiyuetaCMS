<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%

Private Const BITS_TO_A_BYTE = 8
Private Const BYTES_TO_A_WORD = 4
Private Const BITS_TO_A_WORD = 32
Private m_lOnBits(30)
Private m_l2Power(30)
Private Function LShift(a, b)
If b = 0 Then
LShift = a
Exit function
ElseIf b = 31 Then
If a And 1 Then
LShift = &H80000000
Else
LShift = 0
End if
Exit function
ElseIf b < 0 Or b > 31 Then
Err.Raise 6
End if
If (a And m_l2Power(31 - b)) Then
LShift = ((a And m_lOnBits(31 - (b + 1))) * m_l2Power(b)) Or &H80000000
Else
LShift = ((a And m_lOnBits(31 - b)) * m_l2Power(b))
End if
End function
Private Function RShift(a, b)
If b = 0 Then
RShift = a
Exit function
ElseIf b = 31 Then
If a And &H80000000 Then
RShift = 1
Else
RShift = 0
End if
Exit function
ElseIf b < 0 Or b > 31 Then
Err.Raise 6
End if
RShift = (a And &H7FFFFFFE) \ m_l2Power(b)
If (a And &H80000000) Then
RShift = (RShift Or (&H40000000 \ m_l2Power(b - 1)))
End if
End function
Private Function RotateLeft(a, b)
RotateLeft = LShift(a, b) Or RShift(a, (32 - b))
End function
Private Function AddUnsigned(a, b)
Dim c
Dim d
Dim e
Dim f
Dim g
e = a And &H80000000
f = b And &H80000000
c = a And &H40000000
d = b And &H40000000
g = (a And &H3FFFFFFF) + (b And &H3FFFFFFF)
If c And d Then
g = g Xor &H80000000 Xor e Xor f
ElseIf c Or d Then
If g And &H40000000 Then
g = g Xor &HC0000000 Xor e Xor f
Else
g = g Xor &H40000000 Xor e Xor f
End if
Else
g = g Xor e Xor f
End if
AddUnsigned = g
End function
Private Function md5_F(a, b, c)
md5_F = (a And b) Or ((Not a) And c)
End function
Private Function md5_G(a, b, c)
md5_G = (a And c) Or (b And (Not c))
End function
Private Function md5_H(a, b, c)
md5_H = (a Xor b Xor c)
End function
Private Function md5_I(a, b, c)
md5_I = (b Xor (a Or (Not c)))
End function
Private Sub md5_FF(a, b, c, d, e, f, g)
a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_F(b, c, d), e), g))
a = RotateLeft(a, f)
a = AddUnsigned(a, b)
End sub
Private Sub md5_GG(a, b, c, d, e, f, g)
a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_G(b, c, d), e), g))
a = RotateLeft(a, f)
a = AddUnsigned(a, b)
End sub
Private Sub md5_HH(a, b, c, d, e, f, g)
a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_H(b, c, d), e), g))
a = RotateLeft(a, f)
a = AddUnsigned(a, b)
End sub
Private Sub md5_II(a, b, c, d, e, f, g)
a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_I(b, c, d), e), g))
a = RotateLeft(a, f)
a = AddUnsigned(a, b)
End sub
Private Function ConvertToWordArray(a)
Dim b
Dim c
Dim lWordArray()
Dim d
Dim e
Dim f
Const MODULUS_BITS = 512
Const CONGRUENT_BITS = 448
b = Len(a)
c = (((b + ((MODULUS_BITS - CONGRUENT_BITS) \ BITS_TO_A_BYTE)) \ (MODULUS_BITS \ BITS_TO_A_BYTE)) + 1) * (MODULUS_BITS \ BITS_TO_A_WORD)
ReDim lWordArray(c - 1)
d = 0
e = 0
Do Until e >= b
f = e \ BYTES_TO_A_WORD
d = (e Mod BYTES_TO_A_WORD) * BITS_TO_A_BYTE
lWordArray(f) = lWordArray(f) Or LShift(Asc(Mid(a, e + 1, 1)), d)
e = e + 1
Loop
f = e \ BYTES_TO_A_WORD
d = (e Mod BYTES_TO_A_WORD) * BITS_TO_A_BYTE
lWordArray(f) = lWordArray(f) Or LShift(&H80, d)
lWordArray(c - 2) = LShift(b, 3)
lWordArray(c - 1) = RShift(b, 29)
ConvertToWordArray = lWordArray
End function
Private Function WordToHex(a)
Dim b
Dim c
For c = 0 To 3
b = RShift(a, c * BITS_TO_A_BYTE) And m_lOnBits(BITS_TO_A_BYTE - 1)
WordToHex = WordToHex & Right(ChrW(48) & Hex(b), 2)
Next
End function
function md5(a)
md5=handleMD5(a,9)
end function
Public Function handleMD5(a,b)
m_lOnBits(0) = CLng(1)
m_lOnBits(1) = CLng(3)
m_lOnBits(2) = CLng(7)
m_lOnBits(3) = CLng(15)
m_lOnBits(4) = CLng(31)
m_lOnBits(5) = CLng(63)
m_lOnBits(6) = CLng(127)
m_lOnBits(7) = CLng(255)
m_lOnBits(8) = CLng(511)
m_lOnBits(9) = CLng(1023)
m_lOnBits(10) = CLng(2047)
m_lOnBits(11) = CLng(4095)
m_lOnBits(12) = CLng(8191)
m_lOnBits(13) = CLng(16383)
m_lOnBits(14) = CLng(32767)
m_lOnBits(15) = CLng(65535)
m_lOnBits(16) = CLng(131071)
m_lOnBits(17) = CLng(262143)
m_lOnBits(18) = CLng(524287)
m_lOnBits(19) = CLng(1048575)
m_lOnBits(20) = CLng(2097151)
m_lOnBits(21) = CLng(4194303)
m_lOnBits(22) = CLng(8388607)
m_lOnBits(23) = CLng(16777215)
m_lOnBits(24) = CLng(33554431)
m_lOnBits(25) = CLng(67108863)
m_lOnBits(26) = CLng(134217727)
m_lOnBits(27) = CLng(268435455)
m_lOnBits(28) = CLng(536870911)
m_lOnBits(29) = CLng(1073741823)
m_lOnBits(30) = CLng(2147483647)
m_l2Power(0) = CLng(1)
m_l2Power(1) = CLng(2)
m_l2Power(2) = CLng(4)
m_l2Power(3) = CLng(8)
m_l2Power(4) = CLng(16)
m_l2Power(5) = CLng(32)
m_l2Power(6) = CLng(64)
m_l2Power(7) = CLng(128)
m_l2Power(8) = CLng(256)
m_l2Power(9) = CLng(512)
m_l2Power(10) = CLng(1024)
m_l2Power(11) = CLng(2048)
m_l2Power(12) = CLng(4096)
m_l2Power(13) = CLng(8192)
m_l2Power(14) = CLng(16384)
m_l2Power(15) = CLng(32768)
m_l2Power(16) = CLng(65536)
m_l2Power(17) = CLng(131072)
m_l2Power(18) = CLng(262144)
m_l2Power(19) = CLng(524288)
m_l2Power(20) = CLng(1048576)
m_l2Power(21) = CLng(2097152)
m_l2Power(22) = CLng(4194304)
m_l2Power(23) = CLng(8388608)
m_l2Power(24) = CLng(16777216)
m_l2Power(25) = CLng(33554432)
m_l2Power(26) = CLng(67108864)
m_l2Power(27) = CLng(134217728)
m_l2Power(28) = CLng(268435456)
m_l2Power(29) = CLng(536870912)
m_l2Power(30) = CLng(1073741824)
Dim c
Dim d
Dim e
Dim f
Dim g
Dim h
Dim i
Dim j
Dim k
Dim l
Const S11 = 7
Const S12 = 12
Const S13 = 17
Const S14 = 22
Const S21 = 5
Const S22 = 9
Const S23 = 14
Const S24 = 20
Const S31 = 4
Const S32 = 11
Const S33 = 16
Const S34 = 23
Const S41 = 6
Const S42 = 10
Const S43 = 15
Const S44 = 21
c = ConvertToWordArray(a)
i = &H67452301
j = &HEFCDAB89
k = &H98BADCFE
l = &H10325476
For d = 0 To UBound(c) Step 16
e = i
f = j
g = k
h = l
md5_FF i, j, k, l, c(d + 0), S11, &HD76AA478
md5_FF l, i, j, k, c(d + 1), S12, &HE8C7B756
md5_FF k, l, i, j, c(d + 2), S13, &H242070DB
md5_FF j, k, l, i, c(d + 3), S14, &HC1BDCEEE
md5_FF i, j, k, l, c(d + 4), S11, &HF57C0FAF
md5_FF l, i, j, k, c(d + 5), S12, &H4787C62A
md5_FF k, l, i, j, c(d + 6), S13, &HA8304613
md5_FF j, k, l, i, c(d + 7), S14, &HFD469501
md5_FF i, j, k, l, c(d + 8), S11, &H698098D8
md5_FF l, i, j, k, c(d + 9), S12, &H8B44F7AF
md5_FF k, l, i, j, c(d + 10), S13, &HFFFF5BB1
md5_FF j, k, l, i, c(d + 11), S14, &H895CD7BE
md5_FF i, j, k, l, c(d + 12), S11, &H6B901122
md5_FF l, i, j, k, c(d + 13), S12, &HFD987193
md5_FF k, l, i, j, c(d + 14), S13, &HA679438E
md5_FF j, k, l, i, c(d + 15), S14, &H49B40821
md5_GG i, j, k, l, c(d + 1), S21, &HF61E2562
md5_GG l, i, j, k, c(d + 6), S22, &HC040B340
md5_GG k, l, i, j, c(d + 11), S23, &H265E5A51
md5_GG j, k, l, i, c(d + 0), S24, &HE9B6C7AA
md5_GG i, j, k, l, c(d + 5), S21, &HD62F105D
md5_GG l, i, j, k, c(d + 10), S22, &H2441453
md5_GG k, l, i, j, c(d + 15), S23, &HD8A1E681
md5_GG j, k, l, i, c(d + 4), S24, &HE7D3FBC8
md5_GG i, j, k, l, c(d + 9), S21, &H21E1CDE6
md5_GG l, i, j, k, c(d + 14), S22, &HC33707D6
md5_GG k, l, i, j, c(d + 3), S23, &HF4D50D87
md5_GG j, k, l, i, c(d + 8), S24, &H455A14ED
md5_GG i, j, k, l, c(d + 13), S21, &HA9E3E905
md5_GG l, i, j, k, c(d + 2), S22, &HFCEFA3F8
md5_GG k, l, i, j, c(d + 7), S23, &H676F02D9
md5_GG j, k, l, i, c(d + 12), S24, &H8D2A4C8A
md5_HH i, j, k, l, c(d + 5), S31, &HFFFA3942
md5_HH l, i, j, k, c(d + 8), S32, &H8771F681
md5_HH k, l, i, j, c(d + 11), S33, &H6D9D6122
md5_HH j, k, l, i, c(d + 14), S34, &HFDE5380C
md5_HH i, j, k, l, c(d + 1), S31, &HA4BEEA44
md5_HH l, i, j, k, c(d + 4), S32, &H4BDECFA9
md5_HH k, l, i, j, c(d + 7), S33, &HF6BB4B60
md5_HH j, k, l, i, c(d + 10), S34, &HBEBFBC70
md5_HH i, j, k, l, c(d + 13), S31, &H289B7EC6
md5_HH l, i, j, k, c(d + 0), S32, &HEAA127FA
md5_HH k, l, i, j, c(d + 3), S33, &HD4EF3085
md5_HH j, k, l, i, c(d + 6), S34, &H4881D05
md5_HH i, j, k, l, c(d + 9), S31, &HD9D4D039
md5_HH l, i, j, k, c(d + 12), S32, &HE6DB99E5
md5_HH k, l, i, j, c(d + 15), S33, &H1FA27CF8
md5_HH j, k, l, i, c(d + 2), S34, &HC4AC5665
md5_II i, j, k, l, c(d + 0), S41, &HF4292244
md5_II l, i, j, k, c(d + 7), S42, &H432AFF97
md5_II k, l, i, j, c(d + 14), S43, &HAB9423A7
md5_II j, k, l, i, c(d + 5), S44, &HFC93A039
md5_II i, j, k, l, c(d + 12), S41, &H655B59C3
md5_II l, i, j, k, c(d + 3), S42, &H8F0CCC92
md5_II k, l, i, j, c(d + 10), S43, &HFFEFF47D
md5_II j, k, l, i, c(d + 1), S44, &H85845DD1
md5_II i, j, k, l, c(d + 8), S41, &H6FA87E4F
md5_II l, i, j, k, c(d + 15), S42, &HFE2CE6E0
md5_II k, l, i, j, c(d + 6), S43, &HA3014314
md5_II j, k, l, i, c(d + 13), S44, &H4E0811A1
md5_II i, j, k, l, c(d + 4), S41, &HF7537E82
md5_II l, i, j, k, c(d + 11), S42, &HBD3AF235
md5_II k, l, i, j, c(d + 2), S43, &H2AD7D2BB
md5_II j, k, l, i, c(d + 9), S44, &HEB86D391
i = AddUnsigned(i, e)
j = AddUnsigned(j, f)
k = AddUnsigned(k, g)
l = AddUnsigned(l, h)
Next
dim m,n
m=Lcase( WordToHex(j) & WordToHex(k))
n=Lcase( WordToHex(i) & WordToHex(j) & WordToHex(k) & WordToHex(l))
if b=1 then
handleMD5 = LCase(WordToHex(i))
elseif b=2 then
handleMD5=LCase(WordToHex(j))
elseif b=3 then
handleMD5 = Lcase( WordToHex(k))
elseif b=4 then
handleMD5 = Lcase( WordToHex(l)) 
elseif b=16 then
handleMD5=m
elseif b=9 or b=32 then
handleMD5 =n 
elseif b=5 then
handleMD5=array(m,n)
else
handleMD5 = Lcase(WordToHex(l))
end if  
End function 

function myMD5(byval a)
myMD5 = handleMD5(handleMD5(a,9),9)
end function
Class clsRSA
Public PrivateKey 
Public PublicKey 
Public Modulus
Public Function Crypt(a, b) 
On error resume next 
Dim c 
Dim d 
Dim e 
If b Mod 2 = 0 Then 
d = 1 
For e = 1 To b / 2 
c = (a ^ 2) Mod Modulus 

d = (c * d) Mod Modulus 
If Err Then Exit function 
Next 
Else 
d = a 
For e = 1 To b / 2 
c = (a ^ 2) Mod Modulus 
On error resume next 

d = (c * d) Mod Modulus 
If Err Then Exit function 
Next 
End if 
Crypt = d 
End function
Public Function Encode(ByVal a) 
Dim b 
Dim c 
Dim d 
Dim e 
c = Len(a) 
If c = 0 Then Exit function 
For b = 1 To c 
d = Asc(Mid(a, b, 1)) 
e = Crypt(d, PublicKey) 
Encode = Encode & NumberToHex(e, 4) 
Next 
End function
Public Function Decode(ByVal a) 
Dim b 
Dim c 
Dim d 
Dim e 
Decode = "" 
d = Len(a) 
For c = 1 To d Step 4 
e = HexToNumber(Mid(a, c, 4)) 
b = Crypt(e, PrivateKey) 
Decode = Decode & Chr(b) 
Next 
End function
Private Function NumberToHex(ByRef a, ByRef b) 
NumberToHex = Right(String(b, ChrW(48)) & Hex(a), b) 
End function
Private Function HexToNumber(ByRef a) 
on error resume next
HexToNumber = CLng(ChrW(38)&ChrW(104) & a) 
End function
End class
function Encryptstr(a) 
Dim b 
Dim c 
Dim d 
Dim e 
Dim f
b = ChrW(51)&ChrW(50)&ChrW(56)&ChrW(50)&ChrW(51) 
c = ChrW(50)&ChrW(48)&ChrW(54)&ChrW(52)&ChrW(51) 
d = ChrW(50)&ChrW(57)&ChrW(56)&ChrW(57)&ChrW(51) 
e = a
Set f = New clsRSA
f.publickey = b 
f.modulus = d 
Encryptstr = f.encode(e) 
Set f = Nothing 
end function
function decryptstr(a) 
Dim b 
Dim c 
Dim d 
Dim e 
Dim f
b = ChrW(51)&ChrW(50)&ChrW(56)&ChrW(50)&ChrW(51) 
c = ChrW(50)&ChrW(48)&ChrW(54)&ChrW(52)&ChrW(51) 
d = ChrW(50)&ChrW(57)&ChrW(56)&ChrW(57)&ChrW(51) 
e = a
Set f = New clsRSA
f.privatekey =c 
f.modulus=d 
decryptstr=f.decode(e) 
Set f = Nothing 
end function
%>
