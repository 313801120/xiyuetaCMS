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
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)
winTitle = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)
delver = ChrW(110)&ChrW(111)
excludeAdminIDLIst=ChrW(45)&ChrW(57)&ChrW(57)&ChrW(57)
fieldName=phptrim(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
fieldValue=request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
id=hanldeSccessIdArrayList(request(ChrW(105)&ChrW(100)))
keyword=replace(phptrim(request(ChrW(107)&ChrW(101)&ChrW(121))),ChrW(39),"")
dim dataOrderyBy
dataOrderyBy=replace(request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(79)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(66)&ChrW(121)),ChrW(39),"")
if dataOrderyBy="" then dataOrderyBy=ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)

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
If Request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))
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
sql =sql & ChrW(40)&ChrW(32)&ChrW(91)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & keyword & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(41) 
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

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(82)&ChrW(111)&ChrW(119) then
call copyRow()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(82)&ChrW(111)&ChrW(119) then
call editRow()

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) then    
call die(layoutDatabaseTableLoadField())

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101) then    
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&importTableToLayouPage()&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117) then    
Dim exportObj : Set exportObj = New exportData
call die(exportObj.handleDaoChuData(tableName))


elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(105)&ChrW(115)&ChrW(79)&ChrW(110)&ChrW(79)&ChrW(102)&ChrW(102) then    
fieldValue=IIF(request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101),1,0)
call editFieldValue(id,fieldName,fieldValue)

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116) then 
call editFieldValue(id,fieldName,fieldValue)
End if 

function handleJsonRs(a,b)
handleJsonRs=ChrW(123)&ChrW(34)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & a & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & get_layout_database_oneClassColumnName(b(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & getFindIdToTableCount(b(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(125)
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

conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&id&ChrW(41) 
call addSystemLog(tableName,ChrW(21024)&ChrW(38500)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)) 
end function

function copyRow()
if checkAdminRule(ChrW(28155)&ChrW(21152) & winTitle)=false then 
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(28155)&ChrW(21152)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
dim  a
if id="" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(73)&ChrW(68)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if 
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&id&ChrW(41)
rs.open sql, conn, 1, 1
if rs.eof then
rs.close:set rs=nothing
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(26410)&ChrW(25214)&ChrW(21040)&ChrW(35201)&ChrW(22797)&ChrW(21046)&ChrW(30340)&ChrW(25968)&ChrW(25454)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if 
while not rs.eof
for each a in rs.fields
if lcase(a.name) <>ChrW(105)&ChrW(100) then
fieldValue=rs(a.name)
if request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=lcase(a.name) then
if phptrim(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))) <>"" then
fieldValue=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
end if
end if    
if typeName(fieldValue)=ChrW(78)&ChrW(117)&ChrW(108)&ChrW(108) then
fieldValue=ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108) 
end if
call rsData(a.name,fieldValue)
end if
next


if rsAddnew_conn(tableName,conn,db_PREFIX,thisDatabaseType)=false then 
call addSystemLog(tableName,ChrW(22797)&ChrW(21046)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(38169)&ChrW(35823)&ChrW(83)&ChrW(81)&ChrW(76)&ChrW(65306) & insertOrUpdateSql)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22797)&ChrW(21046)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(38169)&ChrW(35823)&ChrW(83)&ChrW(81)&ChrW(65306)&jsonCL(insertOrUpdateSql)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125)) 
end if

rs.movenext:wend:rs.close
call addSystemLog(tableName,ChrW(22797)&ChrW(21046)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(25104)&ChrW(21151)&ChrW(12290))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22797)&ChrW(21046)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end function

function editRow()
if checkAdminRule(ChrW(32534)&ChrW(36753) & winTitle)=false then 
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
dim  a
if id="" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(73)&ChrW(68)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if 
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&id&ChrW(41)
rs.open sql, conn, 1, 1
if rs.eof then
rs.close:set rs=nothing
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(26410)&ChrW(25214)&ChrW(21040)&ChrW(35201)&ChrW(22797)&ChrW(21046)&ChrW(30340)&ChrW(25968)&ChrW(25454)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if 
while not rs.eof
if phptrim(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))) <>"" and phptrim(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))) <>"" then
fieldValue=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
call rsData(phptrim(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))),fieldValue)

if rsUpdate_conn(tableName,ChrW(32)&ChrW(119)&ChrW(101)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100)),conn,db_PREFIX,thisDatabaseType)=false then
call addSystemLog(tableName,ChrW(20462)&ChrW(25913)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(38169)&ChrW(35823)&ChrW(83)&ChrW(81)&ChrW(76)&ChrW(65306) & insertOrUpdateSql)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(38169)&ChrW(35823)&ChrW(83)&ChrW(81)&ChrW(65306)&jsonCL(insertOrUpdateSql)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125)) 
end if
end if
rs.movenext:wend:rs.close
call addSystemLog(tableName,ChrW(32534)&ChrW(36753)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(25104)&ChrW(21151)&ChrW(12290))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(32534)&ChrW(36753)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end function

function layoutDatabaseTableLoadField()
dim a:Set a = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
dim b,c,d,e,f,g,h,i,j
g=db_PREFIX
f=0
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id
rs.open b,conn,1,3
if not rs.eof then
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))
rsx.open b,conn,1,1
if not rsx.eof then
g=db_PREFIX 
if rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) or rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
db_PREFIX=""
databaseType = rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))
sqlServerHostIP = rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))
sqlServerDatabaseName = rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
sqlServerUsername = rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114))
sqlServerPassword = rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115))
else
db_PREFIX=""
databaseType = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)
MDBPath = phpTrim(rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)))
accessPass = rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)) 
if MDBPath="" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
elseif checkFile(MDBPath)=false then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(12290)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
elseif checkMdbPositionSafe(MDBPath)=false then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23548)&ChrW(20837)&ChrW(34920)&ChrW(21040)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(20301)&ChrW(32622)&ChrW(19981)&ChrW(22312)&ChrW(47)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(109)&ChrW(100)&ChrW(98)&ChrW(47)&ChrW(37324)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
end if
call selectOpenConn(a)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
c=getMysqlFieldList_conn(rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),a)
else
c=getFieldList_conn(rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),a)
end if
d=split(c,ChrW(44))

f=0
h=0
for each e in d
if e <>"" then
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
i=getMysqlFieldAltNumb_conn(rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)), e,a) 
else
i=getFieldAltNumb_conn(rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)), e,a) 
end if
if i=3 and j="" then j=e
h=h+10
b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& g &  ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&e&ChrW(39)
rss.open b,conn,1,3
if rss.eof then
rss.addnew
rss(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))=rs(ChrW(105)&ChrW(100))
rss(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))=find_layout_field_id(g,e)
rss(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=e
rss(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1
rss(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=h
rss(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))=i
rss.update
f=f+1
else
if rss(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))=-1 then
rss(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))=find_layout_field_id(g,e)
rss.update
end if
end if:rss.close
end if
next 
end if:rsx.close
if j <>"" then
rs(ChrW(105)&ChrW(100)&ChrW(73)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=j
rs.update
end if
end if:rs.close
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23548)&ChrW(20837)&f&ChrW(23383)&ChrW(27573)&ChrW(21040)&ChrW(34920)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))  
end function

function find_layout_field_id(a,b)
dim c,d
d=-1
c = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& a &  ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&b&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)

rst.open c,conn,1,1

while not rst.eof
if d=-1 then
d=rst(ChrW(105)&ChrW(100))
elseif rst(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116) then
d=rst(ChrW(105)&ChrW(100))
end if 
rst.movenext:wend:rst.close
find_layout_field_id=d
end function

function checkMdbPositionSafe(a)
dim b
checkMdbPositionSafe=true
if userrs(ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108))=1 then
exit function
end if    
b=phptrim(lcase(handlePath(a)))
if instr(b,ChrW(92)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(92)&ChrW(109)&ChrW(100)&ChrW(98)&ChrW(92))=false then

checkMdbPositionSafe=false
end if
end function

function importTableToLayouPage() 
dim a,b,c,d,e,f,g,h,i
Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
a=ChrW(91)
b=ChrW(93)
dim j,k
j=readfile(ChrW(92)&ChrW(100)&ChrW(111)&ChrW(99)&ChrW(92)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(115)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(92)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(47)&ChrW(23383)&ChrW(27573)&ChrW(21517)&ChrW(21644)&ChrW(26631)&ChrW(39064)&ChrW(21015)&ChrW(34920)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
j=vbcrlf & j & vbcrlf
dim l:Set l = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
dim m,n,o,p,q,r,s,t,u,v,w,x
q=0
r=0   
m=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id
rs.open m,conn,1,1
if not rs.eof then
if phptrim(rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))) <>"" then
h=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(40)&ChrW(39)&ChrW(28155)&ChrW(21152)&ChrW(123)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(125)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&phptrim(rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))&ChrW(61)&ChrW(39)&ChrW(43)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(91)&ChrW(39)&ChrW(105)&ChrW(100)&ChrW(39)&ChrW(93)&ChrW(41)
end if

if phptrim(rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))) <>"" then
j=vbcrlf & phptrim(rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))) & vbcrlf
g=ChrW(32)&ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)&ChrW(37197)&ChrW(32622)&ChrW(20026)&ChrW(33258)&ChrW(23450)&ChrW(20041)
end if
u=rs(ChrW(105)&ChrW(100)&ChrW(73)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
if u="" then u=ChrW(105)&ChrW(100)  
m=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))
rsx.open m,conn,1,1
if not rsx.eof then  
if rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) or rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
c=ChrW(26381)&ChrW(21153)&ChrW(22120)&ChrW(73)&ChrW(80)&ChrW(65306) & rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)
c=c&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(31867)&ChrW(22411)&ChrW(65306) & rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)) & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)
c=c&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(21517)&ChrW(65306) & rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)
end if  
m=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61)&ChrW(39)& rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) &ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(39)
rss.open m,conn,1,3
if rss.eof then
rss.addnew
rss(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))=rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))
rss(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))=rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))
rss(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
rss(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114))=rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114))
rss(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115))=rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115))
rss(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
rss(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
rss(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))=ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(50)&ChrW(48)&ChrW(50)&ChrW(53)&ChrW(95)&rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
rss(ChrW(105)&ChrW(100)&ChrW(73)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=u
rss(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(85)&ChrW(112)&ChrW(68)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101))=1
rss(ChrW(105)&ChrW(115)&ChrW(66)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101))=1
rss(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(83)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))=1
rss(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(66)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110))=1
rss(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116))=1
rss(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(80)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101))=1
rss(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1
rss(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(116)&ChrW(105)&ChrW(112))=ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)&ChrW(33)
rss(ChrW(105)&ChrW(115)&ChrW(68)&ChrW(98)&ChrW(108)&ChrW(67)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101))=3
rss(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101))=10
rss(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(77)&ChrW(97)&ChrW(111)&ChrW(72)&ChrW(97)&ChrW(111))=ChrW(65306)
rss(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(79)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(66)&ChrW(121))=ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&u&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(115)&ChrW(99)
rss(ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=c
rss.update
q=1
elseif rss(ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))="" and c <>"" then
rss(ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=c
rss.update
end if:rss.close  
rss.open m,conn,1,1
if rss(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
a=ChrW(96)
b=ChrW(96)
end if
m=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rst.open m,conn,1,1
for s=1 to rst.recordcount  
d=""
m=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rst(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))
e.open m,conn,1,1
if not e.eof then
d=e(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))

m=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&rss(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61) & rst(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))
rsd.open m,conn,1,3
if rsd.eof then
rsd.addnew
rsd(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))=rss(ChrW(105)&ChrW(100))
rsd(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))=rst(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))
rsd(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1
rsd(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=1

if lcase(u) <>lcase(rst(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) then
rsd(ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))=1
rsd(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))=1
else
rsd(ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))=0
rsd(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))=0
end if
rsd(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))=1
rsd(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=rst(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
rsd(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=rst(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
rsd(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=rst(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))

k=getStrCut(j, vbcrlf & lcase(e(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))&ChrW(61), vbcrlf,3)&ChrW(44)
f=getStrCut(k, ChrW(44)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(61), ChrW(44),0)

if f <>"" then
rsd(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))=f
elseif d <>"" then 
f=strLength(d)*15+10
if f<70 then f=70
rsd(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))=ChrW(109)&ChrW(105)&ChrW(110)&f
end if
i=getStrCut(k, ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(61), ChrW(44),0)
if i <>"" then rsd(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=i
p=getStrCut(k, ChrW(44)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(61), ChrW(44),0)
if p="" then p=i
if p <>"" then rsd(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=p
p=getStrCut(k, ChrW(44)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(61), ChrW(44),0)
if p="" then p=i
if p <>"" then rsd(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(119)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(119)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(100)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(100))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116))=p
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101))=p
p=getStrCut(k, ChrW(44)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(111))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(102)&ChrW(101))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))=decDHJH(p)
p=getStrCut(k, ChrW(44)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(61), ChrW(44),0)
if p <>"" then rsd(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))=decDHJH(p)
rsd.update

end if:rsd.close

if rst(ChrW(105)&ChrW(115)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(99)&ChrW(116))=1 then  
r=r+10 
t=ChrW(8801)&ChrW(32)&ChrW(36873)&ChrW(25321)&ChrW(25628)&ChrW(32034)&ChrW(23383)&ChrW(27573)&ChrW(32)&ChrW(8801)&ChrW(65288)&rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(65289)&ChrW(62)&ChrW(62)&rst(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
call subAddLayout_listPage_form(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104),rss(ChrW(105)&ChrW(100)),t,r)
call subAddLayout_listPage_form(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116),rss(ChrW(105)&ChrW(100)),ChrW(25628)&ChrW(32034)&ChrW(20851)&ChrW(38190)&ChrW(35789),200)
call subAddLayout_listPage_form(ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116),rss(ChrW(105)&ChrW(100)),ChrW(25628)&ChrW(32034),300)
end if 

if rst(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(99)&ChrW(116))=1 then 
r=r+10 
t=ChrW(8801)&ChrW(32)&ChrW(36873)&ChrW(25321)&ChrW(25490)&ChrW(24207)&ChrW(32)&ChrW(8801)&ChrW(65288)&rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(65289)&ChrW(62)&ChrW(62)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&a&rst(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&b
call subAddLayout_listPage_form(ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114),rss(ChrW(105)&ChrW(100)),t,r)
r=r+10 
t=ChrW(8801)&ChrW(32)&ChrW(36873)&ChrW(25321)&ChrW(25490)&ChrW(24207)&ChrW(32)&ChrW(8801)&ChrW(65288)&rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(65289)&ChrW(62)&ChrW(62)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&a&rst(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&b& ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)
call subAddLayout_listPage_form(ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114),rss(ChrW(105)&ChrW(100)),t,r) 
end if

if rst(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))=1 and w="" then  
w=rst(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
t=ChrW(24320)&ChrW(22987)&ChrW(26102)&ChrW(38388)&ChrW(91)&ChrW(44)&ChrW(93)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(124)&rst(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(124)&ChrW(62)&ChrW(61)
call subAddLayout_listPage_form(ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),rss(ChrW(105)&ChrW(100)),t,1) 
end if

if rst(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))=1 and x="" then  
if w <>"" then
t=ChrW(45)
call subAddLayout_listPage_form(ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101),rss(ChrW(105)&ChrW(100)),t,2) 
end if
x=rst(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
t=ChrW(32467)&ChrW(26463)&ChrW(26102)&ChrW(38388)&ChrW(91)&ChrW(44)&ChrW(93)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120)&ChrW(124)&rst(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(124)&ChrW(60)&ChrW(61)
call subAddLayout_listPage_form(ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),rss(ChrW(105)&ChrW(100)),t,3) 
end if
end if:e.close
rst.movenext:next:rst.close
end if:rsx.close
call add_layout_table_button(ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108),rss(ChrW(105)&ChrW(100)),ChrW(25209)&ChrW(37327)&ChrW(21024)&ChrW(38500),ChrW(114)&ChrW(101)&ChrW(100),ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101),10)
call add_layout_table_button(ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121),rss(ChrW(105)&ChrW(100)),ChrW(25209)&ChrW(37327)&ChrW(22797)&ChrW(21046),ChrW(98)&ChrW(108)&ChrW(117)&ChrW(101),ChrW(97)&ChrW(100)&ChrW(100)&ChrW(45)&ChrW(49),20)
call add_layout_table_button(ChrW(97)&ChrW(100)&ChrW(100),rss(ChrW(105)&ChrW(100)),ChrW(28155)&ChrW(21152)&ChrW(26032)&ChrW(30340),ChrW(110)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(108),ChrW(97)&ChrW(100)&ChrW(100)&ChrW(45)&ChrW(99)&ChrW(105)&ChrW(114)&ChrW(99)&ChrW(108)&ChrW(101),30) 

call add_layout_table_toolbar(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114),rss(ChrW(105)&ChrW(100)),-1,ChrW(36807)&ChrW(28388)&ChrW(22120),"",10)
call add_layout_table_toolbar(ChrW(76)&ChrW(65)&ChrW(89)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(95)&ChrW(68)&ChrW(82)&ChrW(68)&ChrW(67),rss(ChrW(105)&ChrW(100)),-1,ChrW(23548)&ChrW(20837)&ChrW(23548)&ChrW(20986)&ChrW(65288)&rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(65289),ChrW(101)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116),20)  
m=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&rss(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(23548)&ChrW(20837)&ChrW(23548)&ChrW(20986)&ChrW(65288)&rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(65289)&ChrW(39)
rsx.open m,conn,1,1
if not rsx.eof then
v=rsx(ChrW(105)&ChrW(100)) 
call add_layout_table_toolbar(ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117),rss(ChrW(105)&ChrW(100)),v,ChrW(23548)&ChrW(20986),"",10) 
call add_layout_table_toolbar(ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117)&ChrW(95)&ChrW(101)&ChrW(120)&ChrW(99)&ChrW(101)&ChrW(108),rss(ChrW(105)&ChrW(100)),v,ChrW(23548)&ChrW(20986)&ChrW(101)&ChrW(120)&ChrW(99)&ChrW(101)&ChrW(108),"",20) 
call add_layout_table_toolbar(ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117)&ChrW(95)&ChrW(99)&ChrW(115)&ChrW(118),rss(ChrW(105)&ChrW(100)),v,ChrW(23548)&ChrW(20986)&ChrW(99)&ChrW(115)&ChrW(118),"",30) 
call add_layout_table_toolbar(ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101),rss(ChrW(105)&ChrW(100)),v,ChrW(45),"",40) 
call add_layout_table_toolbar(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(62)&ChrW(62)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(73)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108),rss(ChrW(105)&ChrW(100)),v,ChrW(23548)&ChrW(20986)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(29992),"",50) 
call add_layout_table_toolbar(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(62)&ChrW(62)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115),rss(ChrW(105)&ChrW(100)),v,ChrW(23548)&ChrW(20986)&ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(29992),"",60) 
call add_layout_table_toolbar(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(62)&ChrW(62)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114),rss(ChrW(105)&ChrW(100)),v,ChrW(23548)&ChrW(20986)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(29992),"",70) 
call add_layout_table_toolbar(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(62)&ChrW(62)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(77)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108),rss(ChrW(105)&ChrW(100)),v,ChrW(23548)&ChrW(20986)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(29992),"",80) 
call add_layout_table_toolbar(ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101),rss(ChrW(105)&ChrW(100)),v,ChrW(45)&ChrW(45),"",90) 
call add_layout_table_toolbar(ChrW(100)&ChrW(97)&ChrW(111)&ChrW(114)&ChrW(117),rss(ChrW(105)&ChrW(100)),v,ChrW(23548)&ChrW(20837),"",100) 
end if:rsx.close
call add_layout_table_toolbar(ChrW(76)&ChrW(65)&ChrW(89)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(95)&ChrW(84)&ChrW(73)&ChrW(80)&ChrW(83),rss(ChrW(105)&ChrW(100)),-1,ChrW(25552)&ChrW(31034)&ChrW(24110)&ChrW(21161),ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112),110)

call add_layout_table_action(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116),rss(ChrW(105)&ChrW(100)),-1,ChrW(32534)&ChrW(36753),ChrW(98)&ChrW(108)&ChrW(117)&ChrW(101),ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116),10,"")
call add_layout_table_action(ChrW(100)&ChrW(101)&ChrW(108),rss(ChrW(105)&ChrW(100)),-1,ChrW(21024)&ChrW(38500),ChrW(114)&ChrW(101)&ChrW(100),ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101),20,"")
call add_layout_table_action(ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101),rss(ChrW(105)&ChrW(100)),-1,ChrW(26356)&ChrW(22810)&ChrW(65288)&rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(65289),ChrW(110)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(108),"",30,"")
m=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&rss(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(26356)&ChrW(22810)&ChrW(65288)&rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(65289)&ChrW(39)
rsx.open m,conn,1,1  
if not rsx.eof then
v=rsx(ChrW(105)&ChrW(100)) 
if h <>"" then
call add_layout_table_action(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101),rss(ChrW(105)&ChrW(100)),v,ChrW(28155)&ChrW(21152),ChrW(110)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(108),"",1,h)
end if 
call add_layout_table_action(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116),rss(ChrW(105)&ChrW(100)),v,ChrW(32534)&ChrW(36753),ChrW(110)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(108),"",10,"")
call add_layout_table_action(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(110)&ChrW(111),rss(ChrW(105)&ChrW(100)),v,ChrW(32534)&ChrW(36753)&ChrW(40)&ChrW(26080)&ChrW(32534)&ChrW(36753)&ChrW(22120)&ChrW(41),ChrW(110)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(108),ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112),20,"")
call add_layout_table_action(ChrW(100)&ChrW(101)&ChrW(108),rss(ChrW(105)&ChrW(100)),v,ChrW(21024)&ChrW(38500),ChrW(110)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(108),"",30,"")
call add_layout_table_action(ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(82)&ChrW(111)&ChrW(119),rss(ChrW(105)&ChrW(100)),v,ChrW(22797)&ChrW(21046),ChrW(110)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(108),"",40,"")
call add_layout_table_action(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108),rss(ChrW(105)&ChrW(100)),v,ChrW(35814)&ChrW(32454),ChrW(110)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(108),"",50,"")
end if:rsx.close
end if:rs.close
importTableToLayouPage=IIF(q=1,ChrW(23548)&ChrW(20837)&ChrW(25104)&ChrW(21151)&ChrW(33)&g,ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)&ChrW(33))
end function

function decDHJH(a)
decDHJH=replace(replace(a,ChrW(91)&ChrW(91)&ChrW(123)&ChrW(31561)&ChrW(20110)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93),ChrW(61)) ,ChrW(91)&ChrW(91)&ChrW(123)&ChrW(36887)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93), ChrW(44))
end function 

function add_layout_table_action(a,b,c,d,e,f,g,h)
dim i,j,k
dim l:Set l = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
i=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&c&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&b&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&d&ChrW(39)
l.open i,conn,1,3
if l.eof then
l.addnew
l(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=c
l(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))=b
l(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=d
j=split(d&ChrW(65288),ChrW(65288))
k=j(0)
l(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=k
l(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=a
l(ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))=e  
l(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111))=f  
l(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=g 
l(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=h
l(ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))=52 
l(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1   
l.update
end if:l.close
end function

function add_layout_table_toolbar(a,b,c,d,e,f)
dim g,h,i,j,k
h=false
dim l:Set l = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
if h then call echo(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),b) 
g=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&c&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&b&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&d&ChrW(39)
l.open g,conn,1,3
k=split(a&ChrW(62)&ChrW(62),ChrW(62)&ChrW(62))
if l.eof then
l.addnew
l(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=c
l(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))=b
l(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=d
i=split(d&ChrW(65288),ChrW(65288))
j=i(0)
l(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=j
l(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=k(0)
l(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=k(1)
l(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111))=e  
l(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=f 
l(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1   
l.update
end if:l.close
end function

function add_layout_table_button(a,b,c,d,e,f)
dim g,h
h=false
dim i:Set i = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
if h then call echo(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),b) 
g=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&b&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&c&ChrW(39)
i.open g,conn,1,3
if i.eof then
i.addnew
i(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))=b
i(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=c
i(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=c
i(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=a
i(ChrW(98)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))=d 
i(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111))=e 
i(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=f 
i(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1   
i.update
end if:i.close
end function


function subAddLayout_listPage_form(a,b,c,d)   
dim e,f,g,h,i,j,k,l,m,n
j=false
dim o:Set o = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
if j then call echo(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),b)
i=0
n=split(c,ChrW(62)&ChrW(62))
for each h in n
h=phptrim(h)
if h <>"" then
k=split(h&ChrW(91)&ChrW(44)&ChrW(93),ChrW(91)&ChrW(44)&ChrW(93))
h=k(0)
m=split(k(1)&ChrW(124)&ChrW(124),ChrW(124))
if f="" then

e=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&b&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&h&ChrW(39)
o.open e,conn,1,3
if o.eof then
o.addnew
o(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))=b
o(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=-1
o(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=h
g=split(h&ChrW(65288),ChrW(65288))
l=g(0)
o(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=l
o(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1  
o(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=d 
if a=ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104) then
o(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)
o(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101) 
elseif a=ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114) then
o(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)
o(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(79)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(66)&ChrW(121) 
elseif a=ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116) then
o(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)
o(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=ChrW(107)&ChrW(101)&ChrW(121)
o(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=ChrW(107)&ChrW(101)&ChrW(121)
elseif a=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) then
o(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)
o(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) 
elseif a=ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101) then
o(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)
o(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=m(0)
o(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=m(1)
o(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(98)&ChrW(106)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=m(2)
elseif a=ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101) then
o(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)
o(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=m(0) 
end if
o.update:o.close
i=i+1
o.open e,conn,1,1
if not o.eof then
f=o(ChrW(105)&ChrW(100))
end if
else
f=o(ChrW(105)&ChrW(100))
end if:o.close
if j then call echo(ChrW(115),h):doevents
else
e=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&f&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&h&ChrW(39)
o.open e,conn,1,3
if o.eof then
o.addnew
o(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))=b
o(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=f
o(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=h
o(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=h
o(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1
if a=ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104) then
o(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=h
o(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)
elseif a=ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114) then
o(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=h 

h=mid(h,10)
if right(h,5)=ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99) then
h=mid(h,1,len(h)-5) &ChrW(20498)&ChrW(25490)&ChrW(24207)
elseif right(h,4)=ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99) then
h=mid(h,1,len(h)-4) &ChrW(27491)&ChrW(25490)&ChrW(24207)
else
h=h&ChrW(27491)&ChrW(25490)&ChrW(24207)
end if 

o(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=h
o(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)
end if
o(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=d  
o.update
i=i+1
end if:o.close
if j then call echo(ChrW(115),h):doevents
end if
end if
next
subAddLayout_listPage_form=i
if j then call echoRedB(c,i)
end function

function get_layout_database_treeName(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(160)&ChrW(160) & b
else
b=b & ChrW(160)&ChrW(160)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
call get_layout_database_treeName(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),b)
end if
end if:c.close
get_layout_database_treeName=b
end function

function get_layout_database_oneClassColumnName(a) 
if a="" then exit function
dim b
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))  
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
b=c(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))& ChrW(40)&c(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))&ChrW(41)
end if:c.close 
get_layout_database_oneClassColumnName=b
end function

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

if instr(ChrW(124)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(124)&ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(124)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(124)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(124), ChrW(124)& lcase(b) &ChrW(124))=false then  
call addSystemLog(tableName,ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(40)&ChrW(23545)&ChrW(24212)&ChrW(23383)&ChrW(27573)&ChrW(19981)&ChrW(21487)&ChrW(32534)&ChrW(36753)&ChrW(41)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40)& b &ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&a&ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(23545)&ChrW(24212)&ChrW(23383)&ChrW(27573)&ChrW(19981)&ChrW(21487)&ChrW(32534)&ChrW(36753)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
fieldType=getMysqlFieldAlt_conn(db_PREFIX & tableName & "", b,conn)
else
fieldType=getFieldAlt_conn(db_PREFIX & tableName & "", b,conn)
end if
if fieldType=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or fieldType=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) or fieldType=ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) then
addsql=getTableFieldFuHao(b)&ChrW(61)&ChrW(39)& replace(c,ChrW(39),ChrW(39)&ChrW(39)) &ChrW(39)
else
addsql=getTableFieldFuHao(b)&ChrW(61)& c &""
end if

if fieldType="" then                
call addSystemLog(tableName,ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(40)&ChrW(23383)&ChrW(27573)&ChrW(31867)&ChrW(22411)&ChrW(20026)&ChrW(31354)&ChrW(41)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40)& b &ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&a&ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(23383)&ChrW(27573)&ChrW(31867)&ChrW(22411)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if 
conn.execute ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(32)& addsql &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a
call addSystemLog(tableName,ChrW(32534)&ChrW(36753)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40)& b &ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&a&ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(32534)&ChrW(36753)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end function
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
<option value="tableName">表名称(tableName)</option>
</select>
</div>
<div class="layui-inline">
<select name="dataOrderyBy" id="dataOrderyBy" selected>
<option value="">≡ 选择排序 ≡</option>
<option value="order by id desc">id倒排序</option>
<option value="order by id asc">id正排序</option>
<option value="order by sortrank desc">sortrank倒排序</option>
<option value="order by sortrank asc">sortrank正排序</option>
<option value="order by tableRecordcount desc">tableRecordcount倒排序</option>
<option value="order by tableRecordcount asc">tableRecordcount正排序</option>
</select>
</div>
<div class="layui-inline">  
<input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="搜索关键词" onkeypress="if (event.keyCode === 13) {$('button[data-type=reload]').click(); }">
</div>
<button class="layui-btn layui-bg-normal" data-type="reload"><i class="layui-icon layui-icon-search" title=""></i>搜索</button>
</div>
<script type="text/html" id="barDemo"> 
<a class="layui-btn layui-btn-xs layui-bg-blue" lay-event="edit"><i class="layui-icon layui-icon-edit" title=""></i>编辑</a> 
<a class="layui-btn layui-btn-xs layui-bg-red" lay-event="del"><i class="layui-icon layui-icon-delete" title=""></i>删除</a> 
<a class="layui-btn layui-btn-xs layui-bg-normal" lay-event="more">更多<i class="layui-icon layui-icon-down"></i></a> 
</script>
<script type="text/html" id="toolbarDemo">
<div class="layui-btn-container"> 
<button class="layui-btn layui-btn-sm layui-bg-red" lay-event="batchdel"><i class="layui-icon layui-icon-delete" title=""></i>批量删除</button>
<button class="layui-btn layui-btn-sm layui-bg-blue" lay-event="batchCopy"><i class="layui-icon layui-icon-add-1" title=""></i>批量复制</button>
<button class="layui-btn layui-btn-sm layui-bg-orange" lay-event="batchEdit"><i class="layui-icon layui-icon-edit" title=""></i>批量修改</button>
<button class="layui-btn layui-btn-sm layui-bg-normal" lay-event="add"><i class="layui-icon layui-icon-add-circle" title=""></i>添加新的</button>
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
url: '?act=list&layout_database_id=<%=request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))%>', 
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
//批量复制
var batchCopySelected=function(fieldName){
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
handleCopyRow(idlist,fieldName)   //删除'
}
//处理复制行
var handleCopyRow=function(pid,fieldName){
if(fieldName==undefined || fieldName==""){
// 直接复制，不需要用户输入
layer.confirm('是否要复制该行数据？', {
icon: 3,
title: '确认复制'
}, function(index) {
layer.close(index); // 关闭确认弹窗
NProgress.start(); // 显示进度条
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=copyRow",
data: { 
"id": pid
}, 
success: function(res) {
NProgress.done();
if (res.status === "y") {
layer.msg('复制成功！');                 
layer.msg(res.info,{icon: 1});
table.reload('testReload'); // 复制成功后刷新表格
} else {
layer.msg(res.info,{icon: 2});
}
},
error: function() {
NProgress.done();
layer.msg('请求失败，请重试');
}
});
});
}else{
// 让用户输入值
layer.prompt({
formType: 0,
title: '请输入替换'+fieldName+'值',
area: ['300px', '150px'],
value: ''
}, function(value, index) {
layer.close(index); // 关闭输入弹窗
NProgress.start(); // 显示进度条
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=copyRow",
data: { 
"id": pid,
"fieldName": fieldName,
"fieldValue": value // 传递用户输入的值
},
success: function(res) {
NProgress.done();
if (res.status === "y") {        
layer.msg(res.info,{icon: 1});
table.reload('testReload'); // 复制成功后刷新表格
} else {        
layer.msg(res.info,{icon: 2});
}
},
error: function() {
NProgress.done();
layer.msg('请求失败，请重试');
}
});
});
}
}
//批量修改
var batchEditSelected=function(fieldName){
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
handleEditRow(idlist,fieldName)   //修改'
}
//处理修改行
var handleEditRow=function(pid,fieldName){
if(fieldName!=undefined && fieldName!=""){           
// 让用户输入值
layer.prompt({
formType: 0,
title: '请输入替换'+fieldName+'值',
area: ['300px', '150px'],
value: ''
}, function(value, index) {
layer.close(index); // 关闭输入弹窗
NProgress.start(); // 显示进度条
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=editRow",
data: { 
"id": pid,
"fieldName": fieldName,
"fieldValue": value // 传递用户输入的值
},
success: function(res) {
NProgress.done();
if (res.status === "y") {
layer.msg('修改成功！');
table.reload('testReload'); // 修改成功后刷新表格
} else {
layer.msg('修改失败：' + res.info);
}
},
error: function() {
NProgress.done();
layer.msg('请求失败，请重试');
}
});
});
}
}
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
//方法级渲染
table.render({
elem: '#table',
url: '?act=list&layout_database_id=<%=request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))%>', 
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
{ field: 'id', title: 'ID',width:80, sort: false }
,{ field: 'layout_database_id', title: '选择数据库',width:150, sort: false , templet:function(d){return '<span style="cursor: pointer;" lay-event="click_layout_database_id" title="点击选择数据库">'+d.layout_database_id+'</span>'}}
,{ field: 'tablename', title: '表名称',minWidth:130, sort: false ,edit:editable}
,{ field: 'tablerecordcount', title: '表记录数',width:110, sort: true ,edit:editable}
,{ field: 'sortrank', title: '排序',width:80, sort: false ,edit:editable}
,{ field: 'idindexname', title: 'ID索引名',width:120, sort: false ,edit:editable}
,{field: 'isthrough', title: '审核',width:80, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
,{ field: 'parentfieldname', title: '父级字段名',width:120, sort: false ,edit:editable}
,{ field: 'tsfield_layoutdatabasetablefieldcount', title: '字段数量',width:110, sort: false , templet:function(d){return '<span style="cursor: pointer;" lay-event="click_tsfield_layoutdatabasetablefieldcount" title="点击字段数量">'+d.tsfield_layoutdatabasetablefieldcount+'</span>'}}
<%if checkEnLanguage() then%>
<%end if%>  
, { fixed: 'right', title: '操作', width: <%=IIF(isMobile,84,196)%>, toolbar: '#barDemo' } 
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
// 双击表格中的某一行-触发行双击事件  20220604         
table.on('rowDouble(demo)',function (obj) {
showwin2('查看信息', 'listview.asp?id=' + obj.data["id"])
})  
//监听单元格编辑
table.on('edit(demo)', function(obj){
var value = obj.value //得到修改后的值
,data = obj.data //得到所在行所有键值
,field = obj.field; //得到字段 
var This=this;
submitOnLineEdit(obj.data["id"],field,value).then(data => {   
if(data.status=="n"){  // 为假，恢复原来的值
layer.tips(data.info, This, {tips: 1});
obj.reedit(); 
}
})
}); 
table.on('tool(demo)', function(obj) { //工具
var data = obj.data;
var pid = obj.data["id"]
if (obj.event === 'edit') {       //编辑
showwin('编辑<%=winTitle%>', 'listform.asp?id=' + pid)  //22333
}else if (obj.event === 'del') {       //删除
handleSubmitDelIdList(pid,obj)   //删除'
}else if (obj.event === 'more') {       //更多
// 更多 - 下拉菜单
dropdown.render({
elem: this, // 触发事件的 DOM 对象
show: true, // 外部事件触发即显示
data: [{title: '编辑',id: 'edit'}
,{title: '编辑(无编辑器)',id: 'editorno'}
,{title: '删除',id: 'del'}
,{title: '复制',id: 'copyRow'}
,{title: '详细',id: 'clickviewdetail'}
,{title: '加载字段',id: 'customize-layoutDatabaseTableLoadField'}
,{title: '导入到布局',id: 'customize-importTableToLayouPage'}],
click: function(menudata){ 
if (menudata.id === 'edit') {       //编辑
showwin('编辑<%=winTitle%>', 'listform.asp?id=' + pid)  //more edit
}else if (menudata.id === 'editorno') {       //编辑(无编辑器)
showwin('编辑<%=winTitle%>', 'listform.asp?id=' + pid+"&editor=no") //more no editor
}else if (menudata.id === 'del') {       //删除
handleSubmitDelIdList(pid,obj)   //删除'
}else if (menudata.id === 'copyRow') {       //复制
handleCopyRow(pid,"layout_database_id")
}else if (menudata.id === 'clickviewdetail') {       //详细
showwin2('查看详细', 'listview.asp?id=' + obj.data["id"])
}else if (menudata.id === 'customize-layoutDatabaseTableLoadField') {       //加载字段
layer.confirm('是否要导入表里字段？', {
icon: 3,
title: '确认导入'
}, function(index) {
layer.close(index); // 关闭确认弹窗
NProgress.start(); // 显示进度条
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=layoutDatabaseTableLoadField",
data: { "id": data.id }, // 传递当前行id
success: function(res) {
NProgress.done();
if(res.status === "y"){
layer.msg(res.info,{icon: 1});
table.reload('testReload'); // 导入成功后刷新表格
}else{
layer.msg('导入失败：' + res.info,{icon: 2});
}
},
error: function(){
NProgress.done();
layer.msg('请求失败，请重试',{icon: 2});
}
});
}); 
}else if (menudata.id === 'customize-importTableToLayouPage') {       //导入到布局
layer.confirm('是否要导入到布局？', {
icon: 3,
title: '确认导入'
}, function(index) {
layer.close(index); // 关闭确认弹窗
NProgress.start(); // 显示进度条
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=importTableToLayouPage",
data: { "id": data.id }, // 传递当前行id
success: function(res) {
NProgress.done();
if(res.status === "y"){
layer.msg(res.info,{icon: 1});
table.reload('testReload'); // 导入成功后刷新表格
}else{
layer.msg('导入失败：' + res.info,{icon: 2});
}
},
error: function(){
NProgress.done();
layer.msg('请求失败，请重试',{icon: 2});
}
});
}); 
}
},
align: 'right', // 右对齐弹出
style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
})
}else if (obj.event === 'click_layout_database_id') {       //选择数据库
showwin('选择数据库', '/admin/app/test_layout_database/listform.asp?id='+data.tsfield_layout_database_id)   
}else if (obj.event === 'click_tsfield_layoutdatabasetablefieldcount') {       //字段数量
showwin3('字段数量', '/admin/app/test_layout_database_field/list.asp?layout_database_table_id='+pid)   
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
case 'batchCopy':
batchCopySelected("layout_database_id");
break;
case 'batchEdit':
batchEditSelected("layout_database_id");
break;
case 'add':
showwin('添加<%=winTitle%>','listform.asp?layout_database_id=<%=request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))%>')
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
//是否置顶  不能放到表格加载完成后，点搜索，这个switch会重要加载一次，不好
form.on('switch', function(data){
// 保存原始状态  
var originalChecked = !data.elem.checked;   
// var pid=data.elem.value 
var This=$(data.elem).parent();//父级对象
// 找到最近的tr
var $tr = $(data.elem).closest('tr');
var index = $tr.data('index'); // layui会给tr加data-index
var rowData = layui.table.cache['testReload'][index]; // testReload是你的table id
var id = rowData.id; 
NProgress.start(); // 开始显示进度条  
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=isOnOff",
data: { "id": id,"value":data.elem.checked,fieldname:data.elem.name }, 
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
