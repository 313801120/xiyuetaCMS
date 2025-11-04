<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><%

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,totalrec,id,title,idlist
dim fieldType,addsql,startIndex,endIndex,sql2,pageSize,nCount,x,maxpage,iPageSize,msg,keyword,searchType
dim isMobile:isMobile=checkMobile()
dim fieldName,fieldValue,tableName,winTitle,delver
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(108)&ChrW(111)&ChrW(103)
winTitle = ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)
delver = ChrW(110)&ChrW(111)
excludeAdminIDLIst=ChrW(51)
fieldName=phptrim(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
fieldValue=request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
id=hanldeSccessIdArrayList(request(ChrW(105)&ChrW(100)))
keyword=replace(phptrim(request(ChrW(107)&ChrW(101)&ChrW(121))),ChrW(39),"")
dim dataOrderyBy
dataOrderyBy=replace(request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(79)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(66)&ChrW(121)),ChrW(39),"")
if dataOrderyBy="" then dataOrderyBy=ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)

nCount=request(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))
if nCount <>"" then  nCount=clng(nCount)


If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then
if checkAdminRule(winTitle & ChrW(21015)&ChrW(34920))=false then
call die(ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91)&ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(48)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(52)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(60)&ChrW(98)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(39)&ChrW(62)&ChrW(27809)&ChrW(26377)&ChrW(12304)& winTitle & ChrW(21015)&ChrW(34920) &ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(65281)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(62)&ChrW(34)&ChrW(125))
end if
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)) 
stemp = ""
sql1 = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)

pageSize=cLng(num)
If Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)) = "" Then
currentPage = 1 
Else
currentPage = cLng(Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))) 
End if
startIndex = (currentPage - 1) * pageSize + 1
endIndex = startIndex + pageSize - 1 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)&getTimeFuHao()&Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110))&getTimeFuHao()
End if 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)&getTimeFuHao()&Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120))&getTimeFuHao()
End if 
If keyword <> ""  Then      
searchType=replace(phptrim(request(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))),ChrW(39),"")
if searchType <>"" then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
searchType=ChrW(96)&searchType&ChrW(96)
else
searchType=ChrW(91)&searchType&ChrW(93)
end if
sql =sql & ChrW(32)&ChrW(40)&searchType&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & keyword & ChrW(37)&ChrW(39)&ChrW(41) 
else
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql =sql & ChrW(40)&ChrW(32)&ChrW(91)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & keyword & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(41) 
end if
End if
if thisDatabaseType = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)  then
if nCount=""    then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX& tableName & ChrW(93) & sql ,conn,1,1
nCount=IIF(isnull(rs(ChrW(99)&ChrW(116)))=true,0,rs(ChrW(99)&ChrW(116))):rs.close
msg=ChrW(26377)&ChrW(32479)&ChrW(35745)&ChrW(24635)&ChrW(35760)&ChrW(24405)&ChrW(65292)
end if
if sqlServerVersion=ChrW(50)&ChrW(48)&ChrW(49)&ChrW(50) or sqlServerVersion=ChrW(50)&ChrW(48)&ChrW(49)&ChrW(52) then            
mysql= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32) & sql & ChrW(32)&ChrW(32)&ChrW(32)&dataOrderyBy&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(79)&ChrW(70)&ChrW(70)&ChrW(83)&ChrW(69)&ChrW(84)&ChrW(32)& (pageSize*(currentPage-1)) &ChrW(32)&ChrW(82)&ChrW(79)&ChrW(87)&ChrW(83)&ChrW(32)&ChrW(70)&ChrW(69)&ChrW(84)&ChrW(67)&ChrW(72)&ChrW(32)&ChrW(78)&ChrW(69)&ChrW(88)&ChrW(84)&ChrW(32)& pageSize &ChrW(32)&ChrW(82)&ChrW(79)&ChrW(87)&ChrW(83)&ChrW(32)&ChrW(79)&ChrW(78)&ChrW(76)&ChrW(89)





elseif sqlServerVersion=ChrW(50)&ChrW(48)&ChrW(48)&ChrW(56) then
if left(sql,8)=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32) then sql=ChrW(32) & mid(sql,8)
mysql=ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)&ChrW(84)&ChrW(79)&ChrW(80)&ChrW(32)&ChrW(40) & num & ChrW(41)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(82)&ChrW(79)&ChrW(77)&ChrW(32)&ChrW(40)&ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)&ChrW(82)&ChrW(79)&ChrW(87)&ChrW(95)&ChrW(78)&ChrW(85)&ChrW(77)&ChrW(66)&ChrW(69)&ChrW(82)&ChrW(40)&ChrW(41)&ChrW(32)&ChrW(79)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(40)&ChrW(32)&ChrW(32)&dataOrderyBy&ChrW(32)&ChrW(32)&ChrW(41)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(44)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(70)&ChrW(82)&ChrW(79)&ChrW(77)&ChrW(32)& db_PREFIX & tableName & ChrW(41)&ChrW(32)&ChrW(65)&ChrW(83)&ChrW(32)&ChrW(83)&ChrW(117)&ChrW(98)&ChrW(81)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(87)&ChrW(72)&ChrW(69)&ChrW(82)&ChrW(69)&ChrW(32)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(32)&ChrW(66)&ChrW(69)&ChrW(84)&ChrW(87)&ChrW(69)&ChrW(69)&ChrW(78)&ChrW(32) & startIndex & ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32) & endIndex & sql


end if
else

mysql = sql1 & sql & ChrW(32) & dataOrderyBy
end if
if thisDatabaseType = ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)  then
if nCount=""    then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & thisAddPrefix(tableName) & sql ,conn,1,1
nCount=IIF(isnull(rs(ChrW(99)&ChrW(116)))=true,0,rs(ChrW(99)&ChrW(116))):rs.close
msg=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(26377)&ChrW(32479)&ChrW(35745)&ChrW(24635)&ChrW(35760)&ChrW(24405)&ChrW(65292)
end if 
mysql=mysql & ChrW(32)&ChrW(76)&ChrW(73)&ChrW(77)&ChrW(73)&ChrW(84)&ChrW(32)&((page-1)*num)&ChrW(44)&ChrW(32)&num
end if

rs.Open mysql, conn, 1, 1 
If Not rs.EOF Then

if thisDatabaseType = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)  then
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

stemp = stemp & handleJsonRs(i,rs) 

rs.MoveNext 
next 
End if 
stemp =ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) & stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & nCount & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(34)&ChrW(58)&page&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)& msg & vbEchoTimer() &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34)& jsonCL(mysql) &ChrW(34)&ChrW(125) 
rs.close
stemp=replace(stemp,ChrW(92),ChrW(92)&ChrW(92))
stemp=replace(stemp,vbcrlf,ChrW(92)&ChrW(110))
call die(stemp)

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(101)&ChrW(108) then 
call batchDel() 

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(99)&ChrW(108)&ChrW(115) then 
if checkAdminRule(ChrW(21024)&ChrW(38500) & winTitle)=false then 
call addSystemLog(tableName,ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(21024)&ChrW(38500)&ChrW(26435)&ChrW(38480))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(21024)&ChrW(38500)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))    
end if

if delver=ChrW(121)&ChrW(101)&ChrW(115) and session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) <>-999 then
if userrs(ChrW(112)&ChrW(119)&ChrW(100)) <>mymd5(request(ChrW(112)&ChrW(119)&ChrW(100))) then
call addSystemLog(tableName,ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))        
end if
end if
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)
call addSystemLog(tableName,ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(25104)&ChrW(21151))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(28165)&ChrW(31354)&ChrW(21518)&ChrW(21488)&ChrW(26085)&ChrW(24535)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117) then    
Dim exportObj : Set exportObj = New exportData
call die(exportObj.handleDaoChuData(tableName))

End if 

function handleJsonRs(a,b)
handleJsonRs=ChrW(123)&ChrW(34)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & a & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & getAdminIdToInfo(b,b(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(109)&ChrW(115)&ChrW(103)&ChrW(115)&ChrW(116)&ChrW(114))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(112)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(105)&ChrW(112))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34) & ipToAddr2022(b(ChrW(105)&ChrW(112)),ChrW(97)&ChrW(108)&ChrW(108)) & ChrW(34)&ChrW(125)
end function 

function thisAddPrefix(a)  
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
thisAddPrefix=ChrW(96)&db_PREFIX&a&ChrW(96)
else
thisAddPrefix=ChrW(91)&db_PREFIX&a&ChrW(93)
end if
end function

function getTimeFuHao()
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
getTimeFuHao=ChrW(39)
else
getTimeFuHao=ChrW(35)
end if
end function

function getTableFieldFuHao(a)
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
getTableFieldFuHao=ChrW(96)&a&ChrW(96)
else
getTableFieldFuHao=ChrW(91)&a&ChrW(93)
end if
end function

function batchDel()
if checkAdminRule(ChrW(21024)&ChrW(38500) & winTitle)=false then 
call addSystemLog(tableName,ChrW(21024)&ChrW(38500)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(21024)&ChrW(38500)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(21024)&ChrW(38500)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))    
end if

if delver=ChrW(121)&ChrW(101)&ChrW(115) and session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) <>-999 then
if userrs(ChrW(112)&ChrW(119)&ChrW(100)) <>mymd5(request(ChrW(112)&ChrW(119)&ChrW(100))) then
call addSystemLog(tableName,ChrW(21024)&ChrW(38500)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(39564)&ChrW(35777)&ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))        
end if
end if
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&id&ChrW(41)

call addSystemLog(tableName,ChrW(21024)&ChrW(38500)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)) 
end function

Function getAdminIdToInfo(a,b)
dim c,d,e
Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
e=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&b
c.open e ,conn,1,1
if not c.eof then
d=c(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(40)&b&ChrW(41)
end if:c.close 
getAdminIdToInfo = d 
End function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=winTitle%>列表</title>
<script type="text/javascript" src="<%=adminDir%>js/jquery.js"></script>
<link rel="stylesheet" href="<%=adminDir%>layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="<%=adminDir%>layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=adminDir%>js/pc.js?v8"></script>
<link href="<%=adminDir%>css/nprogress.min.css" rel="stylesheet"/>  
<script src="<%=adminDir%>js/nprogress.min.js"></script>
<style>
.layui-table, .layui-table-view {margin: 10px 0;}
.layui-table thead tr {background-color: #f2f2f2}/*表格头背景颜色*/
body{padding:10px 6px 30px 6px;background: #FFF}
</style>
</head>
<body>   
<div class="layui-form">
<div class="layui-inline">      
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_min" placeholder="开始时间" autocomplete="off" class="layui-input date">
</div>
</div> 
<div class="layui-inline">-</div>
<div class="layui-inline">      
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_max" placeholder="结束时间" autocomplete="off" class="layui-input date">
</div>
</div> 
<div class="layui-inline">
<select name="searchType" id="searchType" selected>
<option value="">≡ 选择搜索字段 ≡</option>
<option value="adminid">管理员(adminid)</option>
<option value="item">项目(item)</option>
<option value="msgstr">信息(msgstr)</option>
</select>
</div>
<div class="layui-inline">
<select name="dataOrderyBy" id="dataOrderyBy" selected>
<option value="">≡ 选择排序 ≡</option>
<option value="order by id desc">id倒排序</option>
<option value="order by id asc">id正排序</option>
</select>
</div>
<div class="layui-inline">  
<input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="搜索关键词" onkeypress="if (event.keyCode === 13) {$('button[data-type=reload]').click(); }">
</div>
<button class="layui-btn layui-bg-normal" data-type="reload"><i class="layui-icon layui-icon-search" title=""></i>搜索</button>
</div>
<script type="text/html" id="barDemo"> 
<a class="layui-btn layui-btn-xs layui-bg-red" lay-event="del"><i class="layui-icon layui-icon-delete" title=""></i>删除</a> 
<a class="layui-btn layui-btn-xs layui-bg-normal" lay-event="clickviewdetail">详细</a> 
</script>
<script type="text/html" id="TPL-laydate-createtime">
<input class="layui-input laydate-createtime time" placeholder="选择日期" value="{{= d.createtime || '' }}">
</script>
<script type="text/html" id="toolbarDemo">
<div class="layui-btn-container"> 
<button class="layui-btn layui-btn-sm layui-bg-orange" lay-event="batchdel"><i class="layui-icon layui-icon-delete" title=""></i>批量删除</button>
<button class="layui-btn layui-btn-sm layui-bg-red" lay-event="customize-cls"><i class="layui-icon layui-icon-delete" title=""></i>清空日志</button>
</div>
</script>
<script type="text/html" id="ID-table-demo-page-pagebar">
<div class="layui-btn-container">
<%if isMobile=false then%>
<button class="layui-btn layui-btn-sm" lay-event="tostartpage">首页</button> 
<button class="layui-btn layui-btn-sm" lay-event="toendpage">尾页</button>  
<%end if%>
<button class="layui-btn layui-btn-sm" lay-event="refreshtable" style="display: none;">刷新</button>  
</div>
</script>
<table class="layui-hide" id="table" lay-filter="demo"></table>
<script type="text/javascript" src="../../js/excel.min.js"></script>
<script>  
//重新加载表格 修复于20250721
function reloadTable(){
// 简化版本：直接刷新表格
if(typeof layui !== 'undefined' && layui.table){
layui.table.reload('testReload');
// console.log("方法1")
} else {
// 备用方案：触发搜索按钮
$('button[data-type=reload]').click();
layer.closeAll();
// console.log("方法2")
}
// 关闭所有弹窗
if(typeof layer !== 'undefined'){
layer.closeAll();
}
}
layui.use(['form','table','dropdown','laydate','colorpicker','upload'],function(){
var form = layui.form
var table = layui.table
var laydate = layui.laydate;
var dropdown = layui.dropdown;
var colorpicker = layui.colorpicker; 
var tableRes="";// 表加载的res 20270429 
//表格重新加载 + 跳转页面
var tableReload=function(pageNum){ 
NProgress.start(); // 开始显示进度条  
//执行重载
table.reload('testReload', {
page: {
curr: pageNum //重新从第 1 页开始
},
url: '?act=list', 
where: {
date_min: $('input[name=date_min]').val(),
date_max: $('input[name=date_max]').val(),
searchType: $('select[name=searchType]').val(),
dataOrderyBy: $('select[name=dataOrderyBy]').val(),
key: $('input[name=key]').val()
}
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
layer.msg(data.info,{icon: 1});
break;
case "n":                                    
layer.msg(data.info,{icon: 2});
break;
}
}
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
var cls=function(){
if('<%=delver%>'=='yes'){
layer.prompt({
formType: 1,
title: '敏感操作，请验证密码'
}, function(value, index) {
layer.close(index); 
submitCls(value)   //删除'
});
}else{
layer.confirm('确定要删除吗？', function(index) {
layer.close(index); 
submitCls(null)   //删除'
});
}
}
var submitCls = function(pwd){
NProgress.start(); // 开始显示进度条  
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=cls",
data: { "pwd":pwd }, 
success: function(data) {  
NProgress.done(); // 进度条完成  
switch (data.status) {
case "y":                        
table.reload('testReload');                                                 
layer.msg(data.info,{icon: 1});
break;
case "n":                                    
layer.msg(data.info,{icon: 2});
break;
}
}
});
}
//方法级渲染
table.render({
elem: '#table',
url: '?act=list', 
toolbar: '#toolbarDemo',
defaultToolbar: ['filter',
{title:'导入导出',layEvent:'LAYTABLE_DRDC',icon:'layui-icon-export'},
{title:'提示帮助',layEvent:'LAYTABLE_TIPS',icon:'layui-icon-help'}],
pagebar: '#ID-table-demo-page-pagebar', // 分页栏模板
css: [ // 设置单元格样式
// 取消默认的溢出隐藏，并设置适当高度
'.layui-table-cell{height: 50px; line-height: 40px;}',               //表格高度
'.layui-table-cell .layui-colorpicker{width: 38px; height: 38px;}',  //选择颜色在中间
'.layui-table-cell select{height: 36px; padding: 0 5px;}',  //选择表单在中间
'.layui-table-cell .layui-form-checkbox{top: 14px;}',  // checkbox中间
'.layui-table-cell .layui-form-switch{top: 10px;}',    // swite单选在中间
'.layui-table-cell .layui-btn-xs{vertical-align: middle; margin: 5px 0;}',  // 操作列中的小按钮垂直居中
].join(''),
cols: [
[  
// ,edit:editable  显示编辑器  不需要的时候可以把下面的这个删除掉
{type: 'checkbox', fixed: 'left'},
{ field: 'id', title: 'ID',width:70, sort: false }
,{ field: 'item', title: '项目',width:130, sort: false }
,{ field: 'adminid', title: '管理员',width:100, sort: false }
,{ field: 'msgstr', title: '信息',minWidth:120, sort: false }
,{ field: 'createtime', title: '添加时间',width:160, sort: false }
,{ field: 'ip', title: 'IP',width:140, sort: false }
,{ field: 'tsfield_addr', title: 'IP地址',width:160, sort: false }
<%if checkEnLanguage() then%>
<%end if%>  
, { fixed: 'right', title: '操作', width: <%=IIF(isMobile,84,139)%>, toolbar: '#barDemo' } 
]
],
id: 'testReload',
page: true, 
limit: 20,
limits:[10,20,30,50,80,100,200,300,500],   //选择每页显示条数  或 limit: 20,
done: function(res, curr, count){ 
var currentLimit = $(this)[0].limit; //记录当前表每页显示数
// console.log("res",res)
//翻页时追加加上总记录数   
if(this.url.indexOf('&count=')==-1){
this.url+= "&count="+count;
}
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
// 选择日期
laydate.render({
elem: '.laydate-createtime',
format: 'yyyy/MM/dd HH:mm:ss',
done: function(value, date, endDate){
var data = table.getRowData(options.id, this.elem); // 获取当前行数据(如 id 等字段，以作为数据修改的索引)
var tempData=data.createtime;//原值
var This=this;
if(value==''){
layer.msg('不能为空');
return false;
} 
// 更新数据中对应的字段
data.createtime = value; 
submitOnLineEdit(data.id,'createtime',value).then(res => {   
if(res.status=="n"){  // 为假，恢复原来的值 
layer.tips(res.info, This.elem, {tips: 1});
$(This.elem).val(tempData);                        
data.createtime = tempData;
}
}) 
}
});
// 双击表格中的某一行-触发行双击事件  20220604         
table.on('rowDouble(demo)',function (obj) {
showwin2('查看信息', 'listview.asp?id=' + obj.data["id"])
})  
table.on('tool(demo)', function(obj) { //工具
var data = obj.data;
var pid = obj.data["id"]
if (obj.event === 'del') {       //删除
handleSubmitDelIdList(pid,obj)   //删除'
}else if (obj.event === 'clickviewdetail') {       //详细
showwin2('查看详细', 'listview.asp?id=' + obj.data["id"])
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
case 'batchdel':
batchDelSelected();
break;                
case 'customize-cls':
cls();
break;                
case 'LAYTABLE_DRDC':
// 更多 - 下拉菜单
dropdown.render({
elem: this, // 触发事件的 DOM 对象
show: true, // 外部事件触发即显示
data: [{title: '导出',id: 'daochu'}
,{title: '导出excel',id: 'daochu_excel'}
,{title: '导出csv',id: 'daochu_csv'}
,{title: '导入',id: 'daoru'}],
click: function(menudata){ 
if (menudata.id === 'daochu') {
// 添加确认弹窗
layer.confirm('确定要导出数据吗？', {
icon: 3,
title: '确认导出'
}, function(index) {
layer.close(index); // 关闭确认弹窗
console.log("obj.cols",obj.cols) 
NProgress.start(); // 开始显示进度条  
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=daochu",
data: {  }, 
success: function(data) {  
NProgress.done(); // 进度条完成  
switch (data.status) {
case "y":                                              
layer.msg(data.info);
break;
case "n":                                    
layer.msg(data.info);
break;
}
}
});
}); 
}else if (menudata.id === 'daochu_excel') {
var excel = layui.excel;
NProgress.start();
var out = [];
try{
var tableId = obj.config.id;
var tableData = (typeof table.getData === 'function' ? table.getData(tableId) : null) || table.cache[tableId] || [];
var cols = (obj.config && obj.config.cols) ? obj.config.cols : [];
var headerRow = [];
var fieldKeys = [];
if(cols.length > 0){
layui.each(cols[0], function(idx, col){
if(col.type === 'checkbox') return;
if(col.fixed === 'right') return;
if(col.hide === true) return; // 只导出可见列
if(!col.field) return;
fieldKeys.push(col.field);
headerRow.push(col.title || col.field);
});
}else{
if(tableData.length){
for(var k in tableData[0]){
if(k === 'LAY_CHECKED') continue;
fieldKeys.push(k);
headerRow.push(k);
}
}
}
out.push(headerRow);
layui.each(tableData, function(i, row){
var arr = [];
for(var j=0;j<fieldKeys.length;j++){
var v = row[fieldKeys[j]];
if(typeof v === 'string'){
v = v.replace(/<[^>]*>/g, '');
}
arr.push(v);
}
out.push(arr);
});
var ts = (function(d){
var pad = function(n){return n<10?('0'+n):n};
return d.getFullYear()+"-"+pad(d.getMonth()+1)+"-"+pad(d.getDate())+"_"+pad(d.getHours())+"-"+pad(d.getMinutes())+"-"+pad(d.getSeconds());
})(new Date());
var fileName = '<%=tableName%>_'+ ts + '.xlsx';
if(excel && typeof excel.exportExcel === 'function'){
excel.exportExcel({ 'sheet1': out }, fileName, 'xlsx');
layer.msg('已导出当前页数据');
}else{
throw new Error('excel 模块未加载');
}
}catch(e){
layer.msg('Excel 导出失败，请检查 excel 模块是否已加载');
}finally{
NProgress.done();
}
}else if (menudata.id === 'daochu_csv') {
NProgress.start();
try{
var tableId2 = obj.config.id;
var tableData2 = (typeof table.getData === 'function' ? table.getData(tableId2) : null) || table.cache[tableId2] || [];
var cols2 = (obj.config && obj.config.cols) ? obj.config.cols : [];
var headerRow2 = [];
var fieldKeys2 = [];
if(cols2.length > 0){
layui.each(cols2[0], function(idx, col){
if(col.type === 'checkbox') return;
if(col.fixed === 'right') return;
if(col.hide === true) return; // 只导出可见列
if(!col.field) return;
fieldKeys2.push(col.field);
headerRow2.push(col.title || col.field);
});
}else{
if(tableData2.length){
for(var k2 in tableData2[0]){
if(k2 === 'LAY_CHECKED') continue;
fieldKeys2.push(k2);
headerRow2.push(k2);
}
}
}
var out2 = [];
out2.push(headerRow2);
layui.each(tableData2, function(i2, row2){
var arr2 = [];
for(var j2=0;j2<fieldKeys2.length;j2++){
var v2 = row2[fieldKeys2[j2]];
if(typeof v2 === 'string'){
v2 = v2.replace(/<[^>]*>/g, '');
}
arr2.push(v2);
}
out2.push(arr2);
});
var csv = '';
for(var i=0;i<out2.length;i++){
var row = out2[i].map(function(x){
var s = (x==null?'':String(x)).replace(/\"/g,'""');
if(/[",\n]/.test(s)) s = '"'+ s +'"';
return s;
}).join(',');
csv += row + '\r\n';
}
var blob = new Blob([csv], {type: 'text/csv;charset=utf-8;'});
var url = URL.createObjectURL(blob);
var a = document.createElement('a');
var ts2 = (function(d){
var pad2 = function(n){return n<10?('0'+n):n};
return d.getFullYear()+"-"+pad2(d.getMonth()+1)+"-"+pad2(d.getDate())+"_"+pad2(d.getHours())+"-"+pad2(d.getMinutes())+"-"+pad2(d.getSeconds());
})(new Date());
a.href = url;
a.download = ('<%=tableName%>_'+ ts2 + '.csv');
document.body.appendChild(a);
a.click();
document.body.removeChild(a);
URL.revokeObjectURL(url);
layer.msg('已导出为 CSV');
}catch(e){
layer.msg('CSV 导出失败');
}finally{
NProgress.done();
}
}else if (menudata.id === 'daoru') {
// 添加确认弹窗
layer.confirm('确定要导入数据吗？', {
icon: 3,
title: '确认导入'
}, function(index) {
layer.close(index); // 关闭确认弹窗
// 跳转到导入页面
window.open('/install/addData.asp?act=importData&tablename=<%=tableName%>');
})   
}
},
align: 'right', // 右对齐弹出
style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
})
break;
case 'LAYTABLE_TIPS':
// layer.alert('自定义工具栏图标按钮');
xiyuetaCMSHelp('<%=tableName%>')
break;
};
});
//底部分页栏事件
table.on('pagebar(demo)', function(obj){
var eventValue = obj.event; // 获得按钮 lay-event 值
if(eventValue=='tostartpage'){
tableReload(1);
}else if(eventValue=='toendpage'){
// 获取总页数
//var totalPage = Math.ceil(count / (res.limit || 20)); // 假设每页10条数据
var totalPage = Math.ceil(count / currentLimit); // 使用这种方法
tableReload(totalPage);   //count  加载完成第三个参数自带的
}else if(eventValue=='refreshtable'){//刷新  
tableReload(res.page);  //刷新当前页
}
}); 
}
});
var $ = layui.$,active = {
reload: function() {
//执行重载
tableReload(1); 
}
}; 
$('.layui-form .layui-btn').on('click', function() {
var type = $(this).data('type');
active[type] ? active[type].call(this) : '';
});
});  
//script end 
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
