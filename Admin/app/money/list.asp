<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,columnName,id,title,field,isthrough,httpurl,bodycontent,key,countmonery,sPrice,sInadminid
dim inadminid,sqlWhereinadminid,sqlAndinadminid,userid
inadminid=request(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))
dim shouzhitype:shouzhitype=request(ChrW(115)&ChrW(104)&ChrW(111)&ChrW(117)&ChrW(122)&ChrW(104)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
if inadminid <>"" then
sqlWhereinadminid=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(65)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(61)& inadminid  
sqlAndinadminid=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(65)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(61)& inadminid  
end if
userid=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))
if userid <>"" then
sqlWhereinadminid=sqlWhereinadminid & IIF(sqlWhereinadminid <>"",ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32), ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))
sqlWhereinadminid=sqlWhereinadminid & ChrW(32)&ChrW(65)&ChrW(46)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&userid & ChrW(41)
sqlAndinadminid=sqlAndinadminid & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(65)&ChrW(46)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)& userid &ChrW(41) 

end if

If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then  
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) 
key=request(ChrW(107)&ChrW(101)&ChrW(121))
if key="" then key=request(ChrW(107)&ChrW(101)&ChrW(121)&ChrW(50))
countmonery=0
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(65)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(100)&ChrW(105)&ChrW(114)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(66)&ChrW(46)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(66)&ChrW(46)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(66)&ChrW(46)&ChrW(113)&ChrW(113)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(65)&ChrW(32)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(32)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(106)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(66)&ChrW(32)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(65)&ChrW(46)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(66)&ChrW(46)&ChrW(105)&ChrW(100)
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110)) <> "" Then
sqlWhereinadminid=sqlWhereinadminid & IIF(instr(sqlWhereinadminid,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sqlWhereinadminid = sqlWhereinadminid & getAccessDatediffTime(ChrW(65)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110))) & ChrW(60)&ChrW(61)&ChrW(48) 
End if 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120)) <> "" Then
sqlWhereinadminid=sqlWhereinadminid & IIF(instr(sqlWhereinadminid,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sqlWhereinadminid = sqlWhereinadminid & getAccessDatediffTime(ChrW(65)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120))) & ChrW(62)&ChrW(61)&ChrW(48) 
End if 
If key <> "" Then
sqlWhereinadminid =  sqlWhereinadminid & IIF(instr(sqlWhereinadminid,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)) & ChrW(40)&ChrW(91)&ChrW(66)&ChrW(46)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & key & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(91)&ChrW(66)&ChrW(46)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & key & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(91)&ChrW(66)&ChrW(46)&ChrW(113)&ChrW(113)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & key & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(91)&ChrW(65)&ChrW(46)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & key & ChrW(37)&ChrW(39)&ChrW(41)&ChrW(32) 
End if 
if request(ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(66)&ChrW(121)) <>"" then
sqlWhereinadminid =  sqlWhereinadminid & IIF(instr(sqlWhereinadminid,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)) & request(ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(66)&ChrW(121))
elseif shouzhitype <>"" then
if shouzhitype=ChrW(25910)&ChrW(20837) or shouzhitype=ChrW(25903)&ChrW(20986) then
sqlWhereinadminid =  sqlWhereinadminid & IIF(instr(sqlWhereinadminid,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
end if 
if shouzhitype=ChrW(25910)&ChrW(20837) then
sqlWhereinadminid=sqlWhereinadminid & ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)
elseif shouzhitype=ChrW(25903)&ChrW(20986) then
sqlWhereinadminid=sqlWhereinadminid & ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)
end if
end if
sql=sql & sqlWhereinadminid & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(65)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)

rs.Open sql, conn, 1, 1 
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
isthrough=""
if rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) <>0 then
isthrough=ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)
end if
httpurl=rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))
if httpurl <>"" then httpurl=ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)& httpurl &ChrW(39)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(62)& httpurl &ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)
bodycontent=jsonCL(rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))) 
sPrice=rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))
if rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))>0 then
sPrice=ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(103)&ChrW(114)&ChrW(101)&ChrW(101)&ChrW(110)&ChrW(62)& rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)) &ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)
elseif rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))<0 then
sPrice=ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(62)& rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)) &ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)
end if
countmonery=countmonery+rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))
sInadminid=rs(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)),conn,1,1
if not rsx.eof then
sInadminid=rsx(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(40)& rsx(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) &ChrW(41)
end if:rsx.close 
bodycontent=delhtml(bodycontent)
stemp = stemp & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(113)&ChrW(113)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(113)&ChrW(113)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(100)&ChrW(105)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(rs(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(100)&ChrW(105)&ChrW(114))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(73)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & sInadminid & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(sPrice) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34) & httpurl & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) & isthrough & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & bodycontent & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & format_Time(rs(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),2) & ChrW(34)&ChrW(125) &sHr & "" 
rs.MoveNext 
Wend 
End if 
stemp = stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & rs.RecordCount & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(34)&ChrW(58)&ChrW(34) & countmonery & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34)& sql &ChrW(34)&ChrW(125) 
Response.Write stemp 
rs.Close 
Response.end()
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(101)&ChrW(108) then
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(105)&ChrW(100))
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
Response.end()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116) then 
field=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))
if field="" then field=title
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
id=request(ChrW(105)&ChrW(100))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& field &ChrW(61)&ChrW(39)& title &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62) & id,conn,1,1
if not rs.eof then
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23383)&ChrW(27573)&ChrW(23384)&ChrW(22312)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(34)&ChrW(125)  
else
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(32)& field &ChrW(61)&ChrW(39)&title&ChrW(39)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(25104)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(61)&id&ChrW(41)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
end if:rs.close
Response.end()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104) then
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&IIF(request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101),1,0) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(105)&ChrW(100))
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(35774)&ChrW(32622)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
Response.end()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(97)&ChrW(100)&ChrW(100)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97) then
call addDefaultData()
call die("")
End if 
function addDefaultData()
dim a,b,c,d,e 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93),conn,1,1
if not rs.eof then
e=rs(ChrW(105)&ChrW(100))
end if:rs.close
for d = 1 to 800 

rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93),conn,1,3
rs.addnew
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=e
rs(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=userrs(ChrW(105)&ChrW(100))
rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))=phpRnd(10,300)
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=ChrW(27979)&ChrW(35797)&ChrW(25968)&ChrW(25454)
rs(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=DateAdd(ChrW(100), (d-1)*-1, Now)
rs.update:rs.close

rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93),conn,1,3
rs.addnew
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))=e
rs(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=userrs(ChrW(105)&ChrW(100))
rs(ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101))=phpRnd(2,50)*-1
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=ChrW(27979)&ChrW(35797)&ChrW(25968)&ChrW(25454)
rs(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=DateAdd(ChrW(100), (d-1)*-1, Now)
rs.update:rs.close
call echo(ChrW(105),d)
next
end function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>记账列表</title>
<script type="text/javascript" src="../../js/jquery.js"></script>
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
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
<div class="layui-inline" style="width:110px"> 
<select name="orderBy">
<!--这里随便给个判断，因为里面有个 shouzhitype: 收入 参数在里面有判断 -->
<option value=" price<>0.01">选择类型</option>  
<option value=" price>0" <%=IIF(shouzhitype=ChrW(25910)&ChrW(20837),ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%> >收入</option> 
<option value=" price<0" <%=IIF(shouzhitype=ChrW(25903)&ChrW(20184),ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100),"")%>>支付</option>  
</select> 
</div>
<div class="layui-inline">  
<input class="layui-input" value="<%=request(ChrW(107)&ChrW(101)&ChrW(121))%>" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称" onkeypress="if (event.keyCode === 13) {$('button[data-type=reload]').click(); }">
</div>
<%
dim showUserId
if request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)) <>"" then
showUserId=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))
else
if inadminid=ChrW(50) then showUserId=ChrW(49)&ChrW(50)
end if
%>
<button class="layui-btn" data-type="reload">搜索</button>
<button class="layui-btn" onclick="showwin('添加信息','listform.asp?inadminid=<%=inadminid%>&userid=<%=showUserId%>')">添加</button>
<button class="layui-btn" id="printTJ">统计单价</button>
<!-- <button class="layui-btn" onclick="addDefaultData()">添加默认数据</button>  在这里不要这个 -->
</div>
<script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
</script>
<table class="layui-hide" id="table" lay-filter="demo"></table>
<script>
//重新加载表格20240524
function reloadTable(){
$('button[data-type=reload]').click();
layer.closeAll(); // 关闭所有弹窗，无论类型
}
//添加默认数据
function addDefaultData(){ 
layer.confirm('确定要添加默认数据吗？',{icon:3, title:'提示信息'}, function(index) {
$.ajax({
type: "POST", 
url: "?act=addDefaultData", 
success: function(data) {
alert(data)
$('button[data-type=reload]').click();
}
});
layer.close(index);
}); 
}
//统计价格
function StatPrice(){ 
var countPrice=0;//统计价格
var nCount=0
$("td[data-field='price']").each(function(){
var n=$(this).text();
countPrice+=parseFloat(n)
nCount++;
console.log("n",n)
})
layer.msg("统计总价："+countPrice + "<br>共"+nCount+"天，平均："+parseInt(countPrice/nCount));
}
layui.use(['form','table'],function(){
var form = layui.form
table = layui.table; 
//方法级渲染
table.render({
elem: '#table',
url: '?act=list&userid=<%=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))%>&inadminid=<%=inadminid%>&shouzhitype=<%=shouzhitype%>',
cols: [
[
{ field: 'i', title: '序号', width: 60, sort: false } 
, { field: 'sInadminid', title: '用户',width:120, sort: true }   
, { field: 'nickname', title: '昵称',width:120, sort: true }   
// , { field: 'qq', title: 'QQ',width:200, sort: true } 
, { field: 'price', title: '单价',width:100, sort: true, templet:function(d){return d.price}}
, { field: 'daytime', title: '打款时间', width: 110, sort: true }
// , { field: 'httpurl', title: '网站地址', width: 220, sort: true }
, { field: 'localdir', title: '本地目录',width:130, sort: true } 
, { field: 'bodycontent', title: '说明',sort: true } 
,{field: 'isthrough', title: '是否成交',width:100, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
, { fixed: 'right', title: '操作', width: 150, toolbar: '#barDemo' }
]
],
id: 'testReload',
page: true,
limit: 300
,limits:[10,30,50,80,100,200,300,500,1000]   //选择每页显示条数
,done: function(res, curr, count){
// console.log("res",res)
// console.log("curr",curr)
// console.log("count",count)
$("#printTJ").click(function(){ 
layer.msg("统计总价："+res.countmonery + "<br>共"+res.count+"天，平均："+parseInt(res.countmonery/res.count));
})
}
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
data: { "id": pid,"isthrough":data.elem.checked }, 
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
layer.msg("置顶成功！");
}else{
layer.msg("取消置顶成功！");
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
,orderBy: $('select[name=orderBy]').val()
}
});
}
};
$('.layui-form .layui-btn').on('click', function() {
var type = $(this).data('type');
active[type] ? active[type].call(this) : '';
});
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
data: { "field":  field,"title":  value  },
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
<script type="text/javascript" src="../../js/pc.js"></script>  
</body>
</html>
