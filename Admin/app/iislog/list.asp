<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,totalrec,columnName,id,title,parentid,isthrough,tags
dim spider,nLen,startIndex,endIndex,sql2,pageSize,nCount,x,maxpage,iPageSize
parentid=request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))

If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then  
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ""
sql1 = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(93) 

pageSize=cint(num)
If Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)) = "" Then
currentPage = 1 
Else
currentPage = CInt(Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))) 
End if
startIndex = (currentPage - 1) * pageSize + 1
endIndex = startIndex + pageSize - 1
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & getAccessDatediffTime(ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110))) & ChrW(60)&ChrW(61)&ChrW(48) 
End if 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & getAccessDatediffTime(ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120))) & ChrW(62)&ChrW(61)&ChrW(48) 
End if 
If parentid <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&parentid
End if 
If request(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(83)&ChrW(81)&ChrW(76)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & request(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(83)&ChrW(81)&ChrW(76))
End if 

If Request(ChrW(115)&ChrW(112)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)) <> ""  Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql =sql & ChrW(91)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & Request(ChrW(115)&ChrW(112)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)) & ChrW(37)&ChrW(39)&ChrW(32) 
End if
If Request(ChrW(107)&ChrW(101)&ChrW(121)) <> "" and request(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)) <>"" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql =sql & ChrW(91)& request(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)) &ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & Request(ChrW(107)&ChrW(101)&ChrW(121)) & ChrW(37)&ChrW(39)&ChrW(32) 
End if
if databaseType = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)  then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(93) & sql ,conn,1,1
nCount=IIF(isnull(rs(ChrW(99)&ChrW(116)))=true,0,rs(ChrW(99)&ChrW(116))):rs.close
if sqlServerVersion=ChrW(50)&ChrW(48)&ChrW(49)&ChrW(50) or sqlServerVersion=ChrW(50)&ChrW(48)&ChrW(49)&ChrW(52) then            
mysql= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(93)&ChrW(32) & sql & ChrW(32)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(32)&ChrW(79)&ChrW(70)&ChrW(70)&ChrW(83)&ChrW(69)&ChrW(84)&ChrW(32)& (pageSize*(currentPage-1)) &ChrW(32)&ChrW(82)&ChrW(79)&ChrW(87)&ChrW(83)&ChrW(32)&ChrW(70)&ChrW(69)&ChrW(84)&ChrW(67)&ChrW(72)&ChrW(32)&ChrW(78)&ChrW(69)&ChrW(88)&ChrW(84)&ChrW(32)& pageSize &ChrW(32)&ChrW(82)&ChrW(79)&ChrW(87)&ChrW(83)&ChrW(32)&ChrW(79)&ChrW(78)&ChrW(76)&ChrW(89)





elseif sqlServerVersion=ChrW(50)&ChrW(48)&ChrW(48)&ChrW(56) then
if left(sql,8)=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) then sql=ChrW(32) & mid(sql,8)
mysql=ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)&ChrW(84)&ChrW(79)&ChrW(80)&ChrW(32)&ChrW(40) & num & ChrW(41)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(82)&ChrW(79)&ChrW(77)&ChrW(32)&ChrW(40)&ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)&ChrW(82)&ChrW(79)&ChrW(87)&ChrW(95)&ChrW(78)&ChrW(85)&ChrW(77)&ChrW(66)&ChrW(69)&ChrW(82)&ChrW(40)&ChrW(41)&ChrW(32)&ChrW(79)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(40)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(41)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(44)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(82)&ChrW(79)&ChrW(77)&ChrW(32)& db_PREFIX &ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(41)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(83)&ChrW(117)&ChrW(98)&ChrW(81)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(32)&ChrW(66)&ChrW(69)&ChrW(84)&ChrW(87)&ChrW(69)&ChrW(69)&ChrW(78)&ChrW(32) & startIndex & ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32) & endIndex & sql


end if
else

mysql = sql1 & sql & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)
end if

rs.Open mysql, conn, 1, 1 
If Not rs.EOF Then

if databaseType = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)  then
iPageSize = num 
rs.PageSize = iPageSize 
rs.AbsolutePage = currentPage 
nCount=rs.recordcount
maxpage=rs.PageCount 
if page=maxpage then
x=nCount-(maxpage-1)*iPageSize
else
x=iPageSize
end if 
else
x=num
end if 
For i=1 To x 
if rs.eof then exit for
if stemp <>"" then stemp=stemp & ChrW(44)
isthrough=""
if rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) <>0 then 
isthrough=ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)
end if 
spider=""
nLen=instr(lcase(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100))),ChrW(115)&ChrW(112)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114))
if nLen>0 then
spider=mid(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),1,nLen+5)
nLen=instrrev(spider,ChrW(43))
if nLen>0 then
spider=mid(spider,nLen+1)
if spider=ChrW(115)&ChrW(112)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114) and instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(115)&ChrW(111)&ChrW(103)&ChrW(111)&ChrW(117)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109))>0 then
spider=ChrW(115)&ChrW(111)&ChrW(103)&ChrW(111)&ChrW(117)
end if
end if
else
if instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(65)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(115)&ChrW(66)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(65)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(115)&ChrW(66)&ChrW(111)&ChrW(116)
elseif instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(71)&ChrW(111)&ChrW(111)&ChrW(103)&ChrW(108)&ChrW(101)&ChrW(98)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(71)&ChrW(111)&ChrW(111)&ChrW(103)&ChrW(108)&ChrW(101)&ChrW(98)&ChrW(111)&ChrW(116)
elseif instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(83)&ChrW(101)&ChrW(122)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(66)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(83)&ChrW(101)&ChrW(122)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(66)&ChrW(111)&ChrW(116)
elseif instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(68)&ChrW(111)&ChrW(116)&ChrW(66)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(68)&ChrW(111)&ChrW(116)&ChrW(66)&ChrW(111)&ChrW(116)
elseif instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(80)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(66)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(80)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(66)&ChrW(111)&ChrW(116)
elseif instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(66)&ChrW(76)&ChrW(69)&ChrW(88)&ChrW(66)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(66)&ChrW(76)&ChrW(69)&ChrW(88)&ChrW(66)&ChrW(111)&ChrW(116)
elseif instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(77)&ChrW(74)&ChrW(49)&ChrW(50)&ChrW(98)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(77)&ChrW(74)&ChrW(49)&ChrW(50)&ChrW(98)&ChrW(111)&ChrW(116)
elseif instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(65)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(98)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(65)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(98)&ChrW(111)&ChrW(116)
elseif instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(98)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(98)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(98)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(98)&ChrW(111)&ChrW(116)
elseif instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(78)&ChrW(101)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(78)&ChrW(101)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(116)
elseif instr(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)),ChrW(83)&ChrW(101)&ChrW(109)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(104)&ChrW(66)&ChrW(111)&ChrW(116))>0 then
spider=ChrW(83)&ChrW(101)&ChrW(109)&ChrW(114)&ChrW(117)&ChrW(115)&ChrW(104)&ChrW(66)&ChrW(111)&ChrW(116)
end if
end if
stemp = stemp & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) &rs(ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(rs(ChrW(117)&ChrW(114)&ChrW(108))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(rs(ChrW(109)&ChrW(101)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(100))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34) &jsonCL(rs(ChrW(117)&ChrW(114)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(114))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) &rs(ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(34)&ChrW(58)&ChrW(34) &rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(112)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34) &ipToAddr2022(rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(112)),ChrW(97)&ChrW(108)&ChrW(108)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(rs(ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) &rs(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) &rs(ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(51)&ChrW(50)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) &rs(ChrW(119)&ChrW(105)&ChrW(110)&ChrW(51)&ChrW(50)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) &rs(ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) &rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(112)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34) & spider & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & ChrW(34)&ChrW(125) 
rs.MoveNext 
next 
End if 
stemp =ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) & stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & nCount & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)& vbEchoTimer() &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34)& jsonCL(mysql) &ChrW(34)&ChrW(125) 
Response.Write stemp 
rs.Close 
Response.end()
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(101)&ChrW(108) then
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&request(ChrW(105)&ChrW(100))&ChrW(41)
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
Response.end()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116) then 
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
id=request(ChrW(105)&ChrW(100))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& title &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62) & id,conn,1,1
if not rs.eof then
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21517)&ChrW(31216)&ChrW(23384)&ChrW(22312)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(34)&ChrW(125)  
else
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&title&ChrW(39)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(25104)&ChrW(21151)&id&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
end if:rs.close
Response.end()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104) then
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&IIF(request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101),1,0) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(105)&ChrW(100))
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(35774)&ChrW(32622)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
Response.end()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(99)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97) then 
dim splstr,s
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(93)   
call die(ChrW(28165)&ChrW(31354)&ChrW(25968)&ChrW(25454)&ChrW(23436)&ChrW(25104))
Response.end()
End if 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IIS日志管理</title>
<script type="text/javascript" src="../../js/jquery.js"></script><link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
<style>
.layui-table-cell .layui-form-checkbox[lay-skin="primary"] {/*让列表选项位置上下居中 20230331*/
top: 4px;
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
<div class="layui-inline"> 
<select name="filetypeSQL">
<option value="">选择文件后缀</option> 
<option value=" (filetype='' or filetype='asp' or filetype='php' or filetype='htm'  or filetype='html') "  >网址</option> 
<option value="filetype='asp'">asp</option>   
<option value="filetype='htm'">htm</option>  
<option value="filetype='html'">html</option>  
<option value="filetype='css'">css</option>  
<option value="filetype='js'">js</option>  
<option value="filetype='txt'">txt</option>  
<option value="filetype='xml'">xml</option>  
<option value="filetype='php'">php</option>  
</select> 
</div>
<div class="layui-inline"> 
<select name="spider">
<option value="">选择搜索蜘蛛</option> 
<option value="Baiduspider">Baiduspider(百度)</option> 
<option value="Googlebot">google蜘蛛</option>   
<option value="YisouSpider">YisouSpider(神马)</option>  
<option value="Sogou+web+spider">Sogou+web+spider(搜狗)</option>  
<option value="SemrushBot">SemrushBot</option>  
<option value="bingbot">bingbot</option>  
</select> 
</div>
<div class="layui-inline"> 
<select name="sqlOrderyBy">
<option value="">选择排序</option> 
<option value=" order by handletime">处理时间正排序</option> 
<option value=" order by handletime desc">处理时间倒排序</option>  
</select> 
</div>
<div class="layui-inline"> 
<select name="searchField">
<option value="incomingroad">选择搜索字段</option> 
<option value="url">URL</option>  
<option value="incomingroad">来路</option> 
<option value="statuscode">状态码</option>  
<option value="userip">用户IP</option>  
</select> 
</div>
<div class="layui-inline"> 
<input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称" onkeypress="if (event.keyCode === 13) {$('button[data-type=reload]').click(); }">
</div>
<button class="layui-btn" data-type="reload">搜索</button>
<!-- <button class="layui-btn" onclick="showwin('添加信息','listform.asp?')">添加</button> -->
<button class="layui-btn" data-type="batchdel">删除</button> 
<button class="layui-btn" id="importXls">导入</button> 
<button class="layui-btn" onclick="cleardata()">清空数据</button> 
</div>
<script type="text/html" id="barDemo">
<!-- <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>  -->
<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
</script>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
<script> 
function cleardata(){
layer.confirm('确定要清空数据吗？', function(index) {   
layer.close(index);
var winObj=layer.open({
title: '清空数据'
,content: '正在清空数据，请等待！'
}); 
$.ajax({
type: "POST",
cache: true,
// dataType: "json",
url: "?act=cleardata", 
success: function(data) {
table.reload('testReload');
layer.msg('清空数据完成！');
}
});
});
}
layui.use(['form','table','upload'],function(){
var form = layui.form
table = layui.table; 
var upload = layui.upload
upload.render({
elem: '#importXls',
url: '/api/upload/uploadIISLog.asp',
exts: 'log', //只允许上传log文件
done: function(res) {
// alert("res.data[0].src="+res.data[0].src)
var winObj=layer.open({
title: '提示'
,content: "正在导入IIS数据，请等待！"
});  
$.get('handleIISLog.asp?act=send', {
logPath:res.data[0].src
}, function (strData) {
layer.msg(strData);
table.reload('testReload');
})
}
});
//方法级渲染
table.render({
elem: '#demo',
url: '?act=list',
cols: [
[
{type: 'checkbox', fixed: 'left'},
{ field: 'id', title: 'ID', width: 70, sort: true }
, { field: 'spider', title: '蜘蛛',width:140, sort: true }
, { field: 'filename', title: '文件名',width:100, sort: true }
, { field: 'filetype', title: '文件类型',width:105, sort: true }
, { field: 'browsetime', title: '日期时间',width:160, sort: true }
, { field: 'method', title: '方法', width:80, sort: true }
, { field: 'url', title: 'URL',minWidth:80, sort: true }
, { field: 'urlparameter', title: 'URL参数',minWidth:110, sort: true }
, { field: 'port', title: '端口', width:80, sort: true }
, { field: 'username', title: '用户名', width:100, sort: true }
, { field: 'userip', title: '用户IP', width:140, sort: true }
, { field: 'useripaddr', title: '用户IP地址', width:240, sort: true }
, { field: 'incomingroad', title: '来路', width:120, sort: true }
, { field: 'statuscode', title: '状态码', width:90, sort: true }
, { field: 'bottomstatuscode', title: '底层状态码', width:130, sort: true }
, { field: 'win32statuscode', title: 'Win32状态', width:120, sort: true }
, { field: 'handletime', title: '处理时间', width:120, sort: true }
// , { field: 'createtime', title: '发布时间', width: 160, sort: true }
, { fixed: 'right', title: '操作', width: 90, toolbar: '#barDemo' }
]
],
id: 'testReload',
page: true,
limit: 20
,limits:[10,20,30,40,50,60,70,80,90,200,500,1000]   //选择每页显示条数
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
layer.msg("显示成功！");
}else{
layer.msg("取消显示成功！");
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
,sqlOrderyBy: $('select[name=sqlOrderyBy]').val()
,searchField: $('select[name=searchField]').val()
,spider: $('select[name=spider]').val()
,filetypeSQL: $('select[name=filetypeSQL]').val()
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
data: { "title":  value  },
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
