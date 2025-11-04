<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><%

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,id,title,idlist
dim fieldType,addsql
call checkPermissionRw(ChrW(27979)&ChrW(35797)&ChrW(31649)&ChrW(29702))

If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then  
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) 
sql1 = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93) 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & getAccessDatediffTime(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110))) & ChrW(60)&ChrW(61)&ChrW(48)
End if 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & getAccessDatediffTime(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120))) & ChrW(62)&ChrW(61)&ChrW(48) 
End if  
If Request(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & ChrW(32)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100))
End if  

If Request(ChrW(107)&ChrW(101)&ChrW(121)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql =sql & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & Request(ChrW(107)&ChrW(101)&ChrW(121)) & ChrW(37)&ChrW(39)&ChrW(32) 

End if

mysql = sql1 & sql & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)

rs.Open mysql, conn, 1, 1 
If Not rs.EOF Then
If Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)) = "" Then
currentPage = 1 
Else
currentPage = CInt(Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))) 
End if 
perpage = num 
rs.PageSize = perpage 
rs.AbsolutePage = currentPage 
page_count = 0 
i =(page - 1) * num 
totalrec = rs.RecordCount 
While (Not rs.EOF) And(Not page_count = rs.PageSize)
i = i + 1 
page_count = page_count + 1 
If totalrec Mod perpage = 0 Then
n = totalrec \ perpage 
Else
n = totalrec \ perpage + 1 
End if 
If CInt(page) = n Then
sS = totalrec 
Else
sS = page * num 
End if 
If i = sS Then
sHr = "" 
Else
sHr = ChrW(44) 
End if 
stemp = stemp & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & TS_getArticleTitle(ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(45)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100),rs(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(34)&ChrW(58)&ChrW(34) & TS_srctohtmlimg(ChrW(115)&ChrW(114)&ChrW(99)&ChrW(116)&ChrW(111)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(45)&ChrW(56)&ChrW(48)&ChrW(45)&ChrW(56)&ChrW(48),rs(ChrW(112)&ChrW(105)&ChrW(99))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(125) &sHr & ""
rs.MoveNext 
Wend 
End if 
stemp = stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & rs.RecordCount & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(125) 
rs.close
stemp=replace(stemp,ChrW(92),ChrW(92)&ChrW(92))
stemp=replace(stemp,vbcrlf,ChrW(92)&ChrW(110))
call die(stemp)

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(101)&ChrW(108) then
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&request(ChrW(105)&ChrW(100))&ChrW(41)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116) then 
dim field 
field=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))
if field="" then field=title
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
id=request(ChrW(105)&ChrW(100))
fieldType=getFieldAlt(db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(99), field)
if fieldType=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or fieldType=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) then
addsql=""& field &ChrW(61)&ChrW(39)& title &ChrW(39)
else
addsql=""& field &ChrW(61)& title &""
end if 
if fieldType="" then
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23383)&ChrW(27573)&ChrW(23384)&ChrW(22312)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& title &ChrW(34)&ChrW(125)  
else
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(32)& field &ChrW(61)&ChrW(39)&title&ChrW(39)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(25104)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(61)&id&ChrW(41)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
end if
Response.end()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) then
dim fieldvalue
fieldname=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
fieldvalue=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
id=request(ChrW(105)&ChrW(100))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62) & id,conn,1,1
if rs.eof then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)& fieldname &ChrW(34)&ChrW(125))
else
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(32)& fieldname &ChrW(61)&ChrW(39)&fieldvalue&ChrW(39)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end if:rs.close
Response.end()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104) then
dim fieldname
fieldname=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
if fieldname="" then fieldname=ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)
if instr(ChrW(44)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(44),ChrW(44)& fieldname &ChrW(44))>0 then
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)& fieldname &ChrW(61)&IIF(request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101),1,0) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(105)&ChrW(100))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(35774)&ChrW(32622)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end if
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(35774)&ChrW(32622)&ChrW(22833)&ChrW(36133)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
End if 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>列表</title>
<script type="text/javascript" src="../../js/jquery.js"></script>
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
<style>
.layui-table-cell .layui-form-checkbox[lay-skin="primary"] {/*让列表选项位置上下居中 20230331*/
top: 6px;
}
td .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {/*让列表选项位置上下居中 20230331*/
top: 0px;
} 
.layui-table td .layui-table-cell {
height: auto;
line-height:80px;
}
</style>
</head>
<body style="padding:10px 6px 30px 6px;background: #FFF">  
<div class="layui-form ">
<div class="layui-inline">      
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_min" placeholder="开始日期" autocomplete="off" class="layui-input date">
</div>
<div class="layui-input-inline">-</div>
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_max" placeholder="结束日期" autocomplete="off" class="layui-input date">
</div> 
</div>
<!--多个表单搜索参数-->
<div class="layui-inline"> 
<input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称">
</div>
<button class="layui-btn" data-type="reload"><i class="layui-icon layui-icon-search"></i>搜索</button>
<!--菜单start-->
<button class="layui-btn<%=IIF(checkPermission(ChrW(27979)&ChrW(35797)&ChrW(28155)&ChrW(21152))=false,ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(100),"")%>" onclick<%=IIF(checkPermission(ChrW(27979)&ChrW(35797)&ChrW(28155)&ChrW(21152))=false,ChrW(78)&ChrW(79),"")%>="showwin('添加信息','listform.asp?articleid=<%=request(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100))%>')"><i class="layui-icon layui-icon-add-circle"></i>添加</button>
<button class="layui-btn<%=IIF(checkPermission(ChrW(27979)&ChrW(35797)&ChrW(21024)&ChrW(38500))=false,ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(100),"")%>" data-type="batchdel<%=IIF(checkPermission(ChrW(27979)&ChrW(35797)&ChrW(21024)&ChrW(38500))=false,ChrW(78)&ChrW(79),"")%>"><i class="layui-icon layui-icon-delete"></i>删除</button>
<!--菜单end-->
</div>
<script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-xs layui-btn-normal<%=IIF(checkPermission(ChrW(27979)&ChrW(35797)&ChrW(20462)&ChrW(25913))=false,ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(100),"")%>" lay-event="edit<%=IIF(checkPermission(ChrW(27979)&ChrW(35797)&ChrW(20462)&ChrW(25913))=false,ChrW(78)&ChrW(79)&ChrW(96),"")%>"><i class="layui-icon layui-icon-edit"></i>编辑</a> 
<a class="layui-btn layui-btn-xs layui-btn-danger<%=IIF(checkPermission(ChrW(27979)&ChrW(35797)&ChrW(21024)&ChrW(38500))=false,ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(100),"")%>" lay-event="del<%=IIF(checkPermission(ChrW(27979)&ChrW(35797)&ChrW(21024)&ChrW(38500))=false,ChrW(78)&ChrW(79),"")%>"><i class="layui-icon layui-icon-delete"></i>删除</a> 
</script>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
<script>
layui.use(['form','table','upload'],function(){
var form = layui.form
table = layui.table; 
var upload = layui.upload
upload.render({
elem: '#import',
url: '/api/upload/uploadXls.asp',
exts: 'xlsx|xls|txt', //只允许上传excel文件
done: function(res) {
// alert("res.data.src="+res.data.src)
$.get('import.asp', {
act:'import',
xls:res.data.src
}, function (strData) {
layer.msg(strData);
table.reload('testReload');
})
}
});
//方法级渲染
table.render({
elem: '#demo',
url: '?act=list&articleid=<%=request(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100))%>',
cols: [
[
{type: 'checkbox'} //, fixed: 'left'
,{ field: 'id', title: 'ID',width:70, sort: true }
,{ field: 'tsfieldarticletitle', title: '文章标题', sort: true }
,{ field: 'title', title: '标题', sort: true }
,{ field: 'pic', title: '图片',minWidth:120, sort: true }
,{ field: 'sortrank', title: '排序',edit:true, sort: true }
,{ field: 'createtime', title: '创建时间',width:160, sort: true }
,{field: 'isthrough', title: '审核',width:180, sort: true, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' <%=IIF(checkPermission(ChrW(123)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(23457)&ChrW(26680)&ChrW(125))=false,ChrW(32)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(100),"")%>>'}}
, { fixed: 'right', title: '操作', width: 160, toolbar: '#barDemo' }
]
],
id: 'testReload',
page: true,
limit: 20
, done: function (res, curr, count) {
$.each(res.data, function (i, obj) { 
// var div=$('.layui-table tr[data-index="' + i + '"] td[data-field="title"] .layui-table-cell').css('overflow', 'visible');
})//防止select 被遮挡
}
});
//选择项修改20230423
form.on('select', function (data) {  
var ids = data.elem.getAttribute("id");//获取当前列表id 
var dataid = $(data.elem).attr("dataid");//获取当前列表id 
var idsValue=$(data.elem).val() 
// console.log("dataid",dataid) 
// console.log("idsValue",idsValue)  
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=onlineeditfield&id="+dataid,
data: { "fieldname":  ids,
"fieldvalue":  idsValue
},
success: function(data) {
switch (data.status) {
case "y": 
layer.msg(data.info, {icon: 1});
break;
case "n": 
layer.msg(data.info, {icon: 2}); 
break;
}
}
}); 
//发异步把业务员状态进行更改
// layer.confirm('确认要修改订单状态吗？', function (index) {
// });
});
//是否置顶
form.on('switch', function(data){
var index = layer.msg('修改中，请稍候',{icon: 16,time:false,shade:0.8});
setTimeout(function(){
var pid=data.elem.value
layer.close(index);
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=isthrough",
data: { "id": pid,"value":data.elem.checked,fieldname:data.elem.name }, 
success: function(data) { 
switch (data.status) {
case "y": 
break;
case "n":                       
break;
}
}
});
if(data.elem.checked){
layer.msg("设置成功！");
}else{
layer.msg("取消成功！");
}
},500);
})
var $ = layui.$,
active = {
reload: function() {
var demoReload = $('#demoReload');
//执行重载
table.reload('testReload', {
page: {
curr: 1 //重新从第 1 页开始
},
where: {
date_min: $('input[name=date_min]').val()
,date_max: $('input[name=date_max]').val()
,key: $('input[name=key]').val()
,parentid: $('select[name=parentid]').val()
//多个表单搜索参数JS部分//
}
});
},batchdel: function(){
//testReload为table渲染时改变的 id: 'testReload'
var checkStatus = table.checkStatus('testReload')
,checkData = checkStatus.data; //得到选中的数据
if(checkData.length === 0){
return layer.msg('请选择数据');
}
var idlist='';
for(var i=0;i<checkData.length;i++){
if(idlist!='')idlist+=',';
idlist+=checkData[i].id;
}              
layer.confirm('确定删除吗？', function(index) {
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=del",
data: { "id": idlist },
success: function(data) {
switch (data.status) {
case "y":
table.reload('testReload');
layer.msg('已删除');
break;
}
}
});
});
},export: function(){//导出 
//testReload为table渲染时改变的 id: 'testReload'
var checkStatus = table.checkStatus('testReload')
,checkData = checkStatus.data; //得到选中的数据
if(checkData.length === 0){
return layer.msg('请选择数据');
}
var idlist='';
for(var i=0;i<checkData.length;i++){
if(idlist!='')idlist+=',';
idlist+=checkData[i].id;
}              
layer.confirm('确定导出数据吗？', function(index) {
$.ajax({
type: "POST", 
url: "export.asp?act=export",
data: { "id": idlist },
success: function(data) {
// 创建a标签
var elementA = document.createElement('a');
//文件的名称为时间戳加文件名后缀
elementA.download = +new Date() + ".txt";
elementA.style.display = 'none';
//生成一个blob二进制数据，内容为json数据
var blob = new Blob([data]);
console.log(blob)
//生成一个指向blob的URL地址，并赋值给a标签的href属性
elementA.href = URL.createObjectURL(blob);
document.body.appendChild(elementA);
elementA.click();
document.body.removeChild(elementA);
}
});
layer.close(index);
});
}
};
$('.layui-form .layui-btn').on('click', function() {
var type = $(this).data('type');
active[type] ? active[type].call(this) : '';
});
// 双击表格中的某一行-触发行双击事件  20220604 
table.on('rowDouble(demo)',function (obj) {
showwin2('查看信息', 'listview.asp?id=' + obj.data["id"])
})
//监听行工具事件
table.on('tool(demo)', function(obj) {
var data = obj.data;
var pid = obj.data["id"]
if (obj.event === 'del') {
layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'}, function(index) {
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=del",
data: { "id": pid },
success: function(data) {
switch (data.status) {
case "y":
obj.del();
break;
}
}
});
layer.close(index);
});
} else if (obj.event === 'edit') {
showwin('修改信息', 'listform.asp?id=' + pid)
} else if (obj.event === 'edit2') {
showwin('修改信息', 'listform.asp?editor=no&id=' + pid)
}
});
//监听单元格编辑
table.on('edit(demo)', function(obj){
var value = obj.value //得到修改后的值
,data = obj.data //得到所在行所有键值
,field = obj.field; //得到字段
var thisObj=obj
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=onlineedit&id="+data.id,
data: { "title":  value,"field":field  },
success: function(data) {
switch (data.status) {
case "y": 
layer.msg(data.info, {icon: 1});
break;
case "n": 
layer.msg(data.info, {icon: 2}); 
break;
}
}
}); 
});
});
</script>
<script type="text/javascript" src="../../js/pc.js?va"></script>  
</body>
</html>
