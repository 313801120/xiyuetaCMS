<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../inc/Config.asp"-->
<!--#Include File = "../admin_function.asp"-->
<!--#Include File = "../admin_safe.Asp"--><%

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,totalrec,id,title,idlist
dim fieldType,addsql,startIndex,endIndex,sql2,pageSize,nCount,x,maxpage,iPageSize
dim adminname
dim fieldName,fieldValue,tableName,winTitle,delver
tableName=ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(108)&ChrW(111)&ChrW(103)
winTitle=ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)
delver=ChrW(121)&ChrW(101)&ChrW(115)
fieldName=phptrim(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
fieldValue=request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
id=hanldeSccessIdArrayList(request(ChrW(105)&ChrW(100)))

If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then
if checkAdminRule(winTitle & ChrW(21015)&ChrW(34920))=false then
call die(ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91)&ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(48)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(52)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(60)&ChrW(98)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(39)&ChrW(62)&ChrW(27809)&ChrW(26377)&ChrW(12304)& winTitle & ChrW(21015)&ChrW(34920) &ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(65281)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(34)&ChrW(125))
end if
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ""
sql1 = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &  tableName & ChrW(93) 

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
sql = sql & getAccessDatediffTime(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110))) & ChrW(60)&ChrW(61)&ChrW(48)
End if 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & getAccessDatediffTime(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120))) & ChrW(62)&ChrW(61)&ChrW(48) 
End if  
If Request(ChrW(105)&ChrW(100)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(105)&ChrW(100))
End if  
If Request(ChrW(107)&ChrW(101)&ChrW(121)) <> ""  Then
if request(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)) <>"" then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql =sql & ChrW(32)&ChrW(40)&ChrW(91)&request(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)) &ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & Request(ChrW(107)&ChrW(101)&ChrW(121)) & ChrW(37)&ChrW(39)&ChrW(41) 

else
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql =sql & ChrW(40)&ChrW(32)&ChrW(91)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & Request(ChrW(107)&ChrW(101)&ChrW(121)) & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(91)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & Request(ChrW(107)&ChrW(101)&ChrW(121)) & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(41) 

end if
End if
if databaseType = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)  then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& tableName & ChrW(93) & sql ,conn,1,1
nCount=IIF(isnull(rs(ChrW(99)&ChrW(116)))=true,0,rs(ChrW(99)&ChrW(116))):rs.close
if sqlServerVersion=ChrW(50)&ChrW(48)&ChrW(49)&ChrW(50) or sqlServerVersion=ChrW(50)&ChrW(48)&ChrW(49)&ChrW(52) then            
mysql= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32) & sql & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(79)&ChrW(70)&ChrW(70)&ChrW(83)&ChrW(69)&ChrW(84)&ChrW(32)& (pageSize*(currentPage-1)) &ChrW(32)&ChrW(82)&ChrW(79)&ChrW(87)&ChrW(83)&ChrW(32)&ChrW(70)&ChrW(69)&ChrW(84)&ChrW(67)&ChrW(72)&ChrW(32)&ChrW(78)&ChrW(69)&ChrW(88)&ChrW(84)&ChrW(32)& pageSize &ChrW(32)&ChrW(82)&ChrW(79)&ChrW(87)&ChrW(83)&ChrW(32)&ChrW(79)&ChrW(78)&ChrW(76)&ChrW(89)





elseif sqlServerVersion=ChrW(50)&ChrW(48)&ChrW(48)&ChrW(56) then
if left(sql,8)=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) then sql=ChrW(32) & mid(sql,8)
mysql=ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)&ChrW(84)&ChrW(79)&ChrW(80)&ChrW(32)&ChrW(40) & num & ChrW(41)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(82)&ChrW(79)&ChrW(77)&ChrW(32)&ChrW(40)&ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)&ChrW(82)&ChrW(79)&ChrW(87)&ChrW(95)&ChrW(78)&ChrW(85)&ChrW(77)&ChrW(66)&ChrW(69)&ChrW(82)&ChrW(40)&ChrW(41)&ChrW(32)&ChrW(79)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(40)&ChrW(32)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(32)&ChrW(32)&ChrW(41)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(44)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(82)&ChrW(79)&ChrW(77)&ChrW(32)& db_PREFIX & tableName & ChrW(41)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(83)&ChrW(117)&ChrW(98)&ChrW(81)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(32)&ChrW(66)&ChrW(69)&ChrW(84)&ChrW(87)&ChrW(69)&ChrW(69)&ChrW(78)&ChrW(32) & startIndex & ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32) & endIndex & sql


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
adminname=""
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)),conn,1,1
if not rsx.eof then
adminname=rsx(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(40)& rsx(ChrW(105)&ChrW(100)) &ChrW(41)
end if:rsx.close
For i=1 To x 
if rs.eof then exit for
if stemp <>"" then stemp=stemp & ChrW(44)
stemp = stemp & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & adminname & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(109)&ChrW(115)&ChrW(103)&ChrW(115)&ChrW(116)&ChrW(114)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(112)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(112)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34) & look_ip(rs(ChrW(105)&ChrW(112))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(125) 
rs.MoveNext 
next 
End if 
stemp =ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) & stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & nCount & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)& vbEchoTimer() &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34)& jsonCL(mysql) &ChrW(34)&ChrW(125) 
rs.close
stemp=replace(stemp,ChrW(92),ChrW(92)&ChrW(92))
stemp=replace(stemp,vbcrlf,ChrW(92)&ChrW(110))
call die(stemp)

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(101)&ChrW(108) then 
if checkAdminRule(ChrW(21024)&ChrW(38500) & winTitle)=false then 
call addSystemLog(tableName,ChrW(21024)&ChrW(38500)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(21024)&ChrW(38500)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(21024)&ChrW(38500)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))    
end if

if delver=ChrW(121)&ChrW(101)&ChrW(115) then
if userrs(ChrW(112)&ChrW(119)&ChrW(100)) <>mymd5(request(ChrW(112)&ChrW(119)&ChrW(100))) then
call addSystemLog(tableName,ChrW(21024)&ChrW(38500)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))        
end if
end if
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)& id &ChrW(41)
call addSystemLog(tableName,ChrW(21024)&ChrW(38500)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(99)&ChrW(108)&ChrW(115) then 
if checkAdminRule(ChrW(21024)&ChrW(38500) & winTitle)=false then 
call addSystemLog(tableName,ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(21024)&ChrW(38500)&ChrW(26435)&ChrW(38480))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(21024)&ChrW(38500)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))    
end if

if delver=ChrW(121)&ChrW(101)&ChrW(115) then
if userrs(ChrW(112)&ChrW(119)&ChrW(100)) <>mymd5(request(ChrW(112)&ChrW(119)&ChrW(100))) then
call addSystemLog(tableName,ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))        
end if
end if
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)
call addSystemLog(tableName,ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(25104)&ChrW(21151))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116) then 
call editFieldValue(id,fieldName,fieldValue)

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(105)&ChrW(115)&ChrW(79)&ChrW(110)&ChrW(79)&ChrW(102)&ChrW(102) then    
fieldValue=IIF(request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101),1,0)
call editFieldValue(id,fieldName,fieldValue)

End if 

function editFieldValue(a,b,c) 
if checkAdminRule(ChrW(32534)&ChrW(36753) & winTitle)=false then 
call addSystemLog(tableName,ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(40)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(41)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40)& b &ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&a&ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
if b="" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23383)&ChrW(27573)&ChrW(21517)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if

if a="" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(73)&ChrW(68)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if

if instr(ChrW(124)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(124)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(124)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(105)&ChrW(100)&ChrW(99)&ChrW(97)&ChrW(114)&ChrW(100)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(124)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(124), ChrW(124)& lcase(b) &ChrW(124))=false then  
call addSystemLog(tableName,ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(40)&ChrW(23545)&ChrW(24212)&ChrW(23383)&ChrW(27573)&ChrW(19981)&ChrW(21487)&ChrW(32534)&ChrW(36753)&ChrW(41)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40)& b &ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&a&ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(23545)&ChrW(24212)&ChrW(23383)&ChrW(27573)&ChrW(19981)&ChrW(21487)&ChrW(32534)&ChrW(36753)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
fieldType=getFieldAlt(db_PREFIX & tableName & "", b)
if fieldType=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or fieldType=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) then
addsql=ChrW(91)& b &ChrW(93)&ChrW(61)&ChrW(39)& c &ChrW(39)
else
addsql=ChrW(91)& b &ChrW(93)&ChrW(61)& c &""
end if

if fieldType="" then                
call addSystemLog(tableName,ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(40)&ChrW(23383)&ChrW(27573)&ChrW(31867)&ChrW(22411)&ChrW(20026)&ChrW(31354)&ChrW(41)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40)& b &ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&a&ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23383)&ChrW(27573)&ChrW(31867)&ChrW(22411)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if 
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(32)& addsql &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a
call addSystemLog(tableName,ChrW(32534)&ChrW(36753)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40)& b &ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&a&ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(32534)&ChrW(36753)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=winTitle%>列表</title>
<script type="text/javascript" src="<%=adminDir%>/js/jquery.js"></script>
<link rel="stylesheet" href="<%=adminDir%>/layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="<%=adminDir%>/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=adminDir%>//js/pc.js?v6"></script>
<link href="<%=adminDir%>/css/nprogress.min.css" rel="stylesheet"/>  
<script src="<%=adminDir%>/js/nprogress.min.js"></script>
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
<input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要搜索内容" onkeypress="if (event.keyCode === 13) {$('button[data-type=reload]').click(); }">
</div>
<button class="layui-btn" data-type="reload">搜索</button>
<!-- <button class="layui-btn" onclick="showwin('添加会员','listform.asp?')">添加</button>
<button class="layui-btn" data-type="batchdel">删除</button> 
<i class="layui-icon layui-icon-help" style="cursor:pointer;" onclick="xiyuetaCMSHelp('<%=tableName%>')"></i> -->
</div>
<script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>  
<a class="layui-btn layui-btn-xs" lay-event="more">更多<i class="layui-icon layui-icon-down"></i></a>
</script>
<script type="text/html" id="ID-table-demo-templet-other">
<span class="layui-badge-rim" style="margin-right: 10px;">登录：{{d.logincount }}</span>
<span class="layui-badge-rim">金币：{{d.money }}</span> 
</script>
<!-- 推荐 -->
<script type="text/html" id="TPL-dropdpwn-demo">
<button class="layui-btn layui-btn-primary dropdpwn-demo">
<span>{{= d.sex || '保密' }}</span>
<i class="layui-icon layui-icon-down layui-font-12"></i>
</button>
</script>
<!-- laydate -->
<script type="text/html" id="TPL-laydate-demo">
<input class="layui-input laydate-demo time" placeholder="选择日期" value="{{= d.expiredatetime || '' }}">
</script>
<!-- colorpicker -->
<script type="text/html" id="TPL-colorpicker-demo">
{{#  var color = d.color || ['#16baaa','#16b777','#1E9FFF','#FF5722','#FFB800','#393D49'][Math.round(Math.random()*5)]; }}
<div class="colorpicker-demo" lay-options="{color: '{{= d.idcard }}'}"></div>
</script>
<script type="text/html" id="toolbarDemo">
<div class="layui-btn-container">
<button class="layui-btn layui-btn-sm layui-bg-red" lay-event="cls">清空日志</button>
<button class="layui-btn layui-btn-sm layui-bg-orange" lay-event="batchdel">批量删除</button>
</div>
</script>
<script type="text/html" id="ID-table-demo-page-pagebar">
<div class="layui-btn-container">
<button class="layui-btn layui-btn-sm" lay-event="tostartpage">首页</button> 
<button class="layui-btn layui-btn-sm" lay-event="toendpage">尾页</button>  
</div>
</script>
<table class="layui-hide" id="table" lay-filter="demo"></table>
<script> 
//重新加载表格20240524
function reloadTable(){
$('button[data-type=reload]').click();
layer.closeAll(); // 关闭所有弹窗，无论类型
}
layui.use(['form','table','dropdown','laydate','colorpicker'],function(){
var form = layui.form
var table = layui.table
var laydate = layui.laydate;
var dropdown = layui.dropdown;
var colorpicker = layui.colorpicker;
// 根据返回数据中某个字段来判断开启该行的编辑
var editable = function(d){
// console.log('d',d)
if(d.editable) return 'text'; // 这里假设以 editable 字段为判断依据
};
//提交在线修改 id，字段，值
var submitOnLineEdit = function(id,field,value){ 
NProgress.start(); // 开始显示进度条  
return new Promise((resolve) => {     //异步操作
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=onlineedit&id="+id,
data: { "fieldname":  field,"value":  value  },
success: function(data) {
switch (data.status) {
case "y": 
layer.msg(data.info, {icon: 1});
break;
case "n": 
layer.msg(data.info, {icon: 2}); 
break;
}
NProgress.done(); // 进度条完成  
resolve(data);  //返回状态 y或n
}
}); 
});  
}
// 处理提交删除，提示，一种是输入密码，一种为确认
var handleSubmitDelIdList=function(idList,obj){
if('<%=delver%>'=='yes'){
layer.prompt({
formType: 1,
title: '敏感操作，请验证密码'
}, function(value, index) {
layer.close(index); 
submitDelIdList(idList, obj, value)   //删除'
});
}else{
layer.confirm('确定要删除吗？', function(index) {
layer.close(index); 
submitDelIdList(idList,null)   //删除'
});
}
}
//提交删除  submitDelIdList(id,obj,pwd)   '删除'
var submitDelIdList = function(idList,obj,pwd){
NProgress.start(); // 开始显示进度条  
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=del",
data: { "id": idList,"pwd":pwd }, 
success: function(data) {  
NProgress.done(); // 进度条完成  
switch (data.status) {
case "y":
if(obj){
obj.del();   
}else{
table.reload('testReload');
}                                                
layer.msg(data.info);
break;
case "n":                                    
layer.msg(data.info);
break;
}
}
});
}
var cls=function(pwd){  //清空数据
layer.prompt({
formType: 1,
title: '敏感操作，请验证密码'
}, function(value, index) {
layer.close(index);  
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=cls",
data: {"pwd":value }, 
success: function(data) {  
switch (data.status) {
case "y":
table.reload('testReload');                                             
layer.msg(data.info);
break;
case "n":                                    
layer.msg(data.info);
break;
}
}
});
}); 
}
//批量删除
var batchDelSelected=function(){
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
handleSubmitDelIdList(idlist,null)   //删除'
}
//表格重新加载 + 跳转页面
var tableReload=function(pageNum){
NProgress.start(); // 开始显示进度条  
//执行重载
table.reload('testReload', {
page: {
curr: pageNum //重新从第 1 页开始
},
where: {
date_min: $('input[name=date_min]').val(),
date_max: $('input[name=date_max]').val(),
key: $('input[name=key]').val()
}
});
}
//方法级渲染
table.render({
elem: '#table',
url: '?act=list',
toolbar: '#toolbarDemo',
defaultToolbar: ['filter', 'exports', 'print', {
title: '提示',
layEvent: 'LAYTABLE_TIPS',
icon: 'layui-icon-help'  //layui-icon-tips layui-icon-question
}],
pagebar: '#ID-table-demo-page-pagebar', // 分页栏模板
css: [ // 设置单元格样式
// 取消默认的溢出隐藏，并设置适当高度
'.layui-table-cell{height: 40px; line-height: 30px;}',               //表格高度
'.layui-table-cell .layui-colorpicker{width: 38px; height: 38px;}',  //选择颜色在中间
'.layui-table-cell select{height: 36px; padding: 0 5px;}',  //选择表单在中间
'.layui-table-cell .layui-form-checkbox{top: 6px;}',  // checkbox中间
'.layui-table-cell .layui-form-switch{top: 10px;}',    // swite单选在中间
].join(''),
cols: [
[  
{type: 'checkbox', fixed: 'left'},
{field: 'id', title: 'ID', width: 70, sort: true }
, { field: 'item', title: '项目', width: 110, sort: false }
, { field: 'adminname', title: '管理员', width: 100, sort: false }
, { field: 'msg', title: '信息',minWidth: 200, sort: false }
, { field: 'ip', title: 'IP', width: 130, sort: false }
, { field: 'addr', title: '地址', width: 200, sort: false }
, { field: 'createtime', title: '时间', width: 160, sort: true }
]
],
id: 'testReload',
page: true,
limit: 10,
done: function(res, curr, count){ 
NProgress.done(); // 进度条完成  
var options = this;
// console.log("res",res)
// console.log("curr",curr)
// console.log("count",count)
// 获取当前行数据
table.getRowData = function(tableId, elem){
var index = $(elem).closest('tr').data('index');
return table.cache[tableId][index] || {};
}; 
// dropdown 方式的下拉选择
dropdown.render({
elem: '.dropdpwn-demo',
// trigger: 'hover',
// 此处的 data 值，可根据 done 返回的 res 遍历来赋值
data: [{
title: '男',
id: 100
},{
title: '女',
id: 101
},{
title: '保密',
id: 102
}],
click: function(obj){
var data = table.getRowData(options.id, this.elem); // 获取当前行数据(如 id 等字段，以作为数据修改的索引)                
var tempData=data.sex;//原值 
var This=this;
This.elem.find('span').html(obj.title);
if(tempData==""){  //为空则选中默认最后那个值，看上面
tempData="保密"   
}
// 显示 - 仅用于演示
// layer.msg('选中值: '+ obj.title +',data.id='+data.id ); 
submitOnLineEdit(data.id,'sex',obj.title).then(data => {  
if(data.status=="n"){  // 为假，恢复原来的值 
layer.tips(data.info, This.elem, {tips: 1});
This.elem.find('span').html(tempData); 
// data.sex = tempData;
}else{                        
// 更新数据中对应的字段
data.sex = obj.title;
}
})
}
});
// laydate
laydate.render({
elem: '.laydate-demo',
format: 'yyyy/MM/dd HH:mm:ss',
done: function(value, date, endDate){
var data = table.getRowData(options.id, this.elem); // 获取当前行数据(如 id 等字段，以作为数据修改的索引)
var tempData=data.expiredatetime;//原值
var This=this;
if(value==''){
layer.msg('不能为空');
return false;
} 
// 更新数据中对应的字段
data.expiredatetime = value;
// console.log("data",data)
// console.log("value",value)
// console.log("date",date)
// console.log("endDate",endDate)
submitOnLineEdit(data.id,'expiredatetime',value).then(res => {   
if(res.status=="n"){  // 为假，恢复原来的值 
layer.tips(res.info, This.elem, {tips: 1});
$(This.elem).val(tempData);                        
data.expiredatetime = tempData;
}
})
}
});
// colorpicker
colorpicker.render({
elem: '.colorpicker-demo',
done: function(value){
var data = table.getRowData(options.id, this.elem); // 获取当前行数据(如 id 等字段，以作为数据修改的索引)
var tempData=data.idcard;//原值
var This=this;
// 更新数据中对应的字段
data.idcard = value;
// 显示 - 仅用于演示
// layer.msg('选中值: '+ value +'<br>当前行数据：'+ JSON.stringify(data));
submitOnLineEdit(data.id,'idcard',value).then(res => {   
if(res.status=="n"){  // 为假，恢复原来的值 
layer.tips(res.info, This.elem, {tips: 1});
// console.log("This.elem",This.elem)
$(This.elem).find(".layui-colorpicker-trigger-span").css("background",tempData); 
data.idcard = tempData;
}
})
}
});
//监听单元格编辑
table.on('edit(demo)', function(obj){
var value = obj.value //得到修改后的值
,data = obj.data //得到所在行所有键值
,field = obj.field; //得到字段 
var This=this;
submitOnLineEdit(data.id,field,value).then(data => {   
if(data.status=="n"){  // 为假，恢复原来的值
layer.tips(data.info, This, {tips: 1});
obj.reedit(); 
}
})
});
//监听行工具事件
table.on('tool(demo)', function(obj) {
var data = obj.data;
var pid = obj.data["id"]
if (obj.event === 'del') {
handleSubmitDelIdList(pid,obj)   //删除'
} else if (obj.event === 'edit') {
showwin('编辑会员', 'listform.asp?id=' + pid)
} else if (obj.event === 'more') {
// 更多 - 下拉菜单
dropdown.render({
elem: this, // 触发事件的 DOM 对象
show: true, // 外部事件触发即显示
data: [{
title: '编辑',
id: 'edit'
},{
title: '删除',
id: 'del'
}],
click: function(menudata){
if(menudata.id === 'edit'){
// layer.msg('查看操作，当前行 ID:'+ data.id);
showwin('编辑会员', 'listform.asp?id=' + data.id)
} else if(menudata.id === 'del'){                         
handleSubmitDelIdList(data.id,obj)   //删除'
} 
},
align: 'right', // 右对齐弹出
style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
})
} else if (obj.event === 'jizhang') {
showwin('添加账务信息','/static/admin/app/finance/listform.asp?userid=' + pid)   
}
});
// 工具栏事件
table.on('toolbar(demo)', function(obj){
var id = obj.config.id;
var checkStatus = table.checkStatus(id);
var othis = lay(this);
switch(obj.event){
case 'getCheckData':
var data = checkStatus.data;
layer.alert(layui.util.escape(JSON.stringify(data)));
break;
case 'getData':
var getData = table.getData(id);
console.log(getData);
layer.alert(layui.util.escape(JSON.stringify(getData)));
break;
case 'LAYTABLE_TIPS':
// layer.alert('自定义工具栏图标按钮');
xiyuetaCMSHelp('<%=tableName%>')
break;
case 'add':
showwin('添加会员','listform.asp?')
break;
case 'batchdel':
batchDelSelected();
break;
case 'cls':
cls();
break;
};
});
// 底部分页栏事件
table.on('pagebar(demo)', function(obj){
var eventValue = obj.event; // 获得按钮 lay-event 值
if(eventValue=='tostartpage'){
tableReload(1);
}else if(eventValue=='toendpage'){
// 获取总页数
var totalPage = Math.ceil(count / (res.limit || 10)); // 假设每页10条数据
tableReload(totalPage);   //count  加载完成第三个参数自带的
}
});
// 更多编辑方式……
}
});
//是否置顶  不能放到表格加载完成后，点搜索，这个switch会重要加载一次，不好
form.on('switch', function(data){
// 保存原始状态  
var originalChecked = !data.elem.checked;  
// console.log("data",data)
var pid=data.elem.value
var This=$(data.elem).parent();//父级对象
NProgress.start(); // 开始显示进度条  
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=isOnOff",
data: { "id": pid,"value":data.elem.checked,fieldname:data.elem.name }, 
success: function(res) { 
NProgress.done(); // 进度条完成  
switch (res.status) {
case "y": 
layer.msg(res.info, {icon: 1});
break;
case "n":   
layer.tips(res.info, This, {tips: 1});
layer.msg(res.info, {icon: 2});  
data.elem.checked = originalChecked;  
form.render(); // 渲染
break;
}
}
}); 
})
var $ = layui.$,
active = {
reload: function() {
//执行重载
tableReload(1);
},batchdel: function(){ 
batchDelSelected();
}
};
$('.layui-form .layui-btn').on('click', function() {
var type = $(this).data('type');
active[type] ? active[type].call(this) : '';
});
}); 
// 配置nprogress的一些基本选项（可选）  
NProgress.configure({ showSpinner: true }); // 隐藏加载时的旋转器  
// 监听页面加载事件  
document.addEventListener('DOMContentLoaded', startProgress); // DOM 完全加载并解析完成，不包括样式表、图片和子框架的加载  
window.addEventListener('load', stopProgress); // 页面完全加载完成，包括样式表、图片和子框架  
function startProgress() {  
NProgress.start(); // 开始显示进度条  
}  
function stopProgress() {  
NProgress.done(); // 进度条完成  
}  
</script>
</body>
</html>
