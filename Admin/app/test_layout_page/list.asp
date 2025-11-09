<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<!--#Include File = "../../../install/admin_setAccess.asp"--><%

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,totalrec,id,title,idlist
dim fieldType,addsql,startIndex,endIndex,sql2,pageSize,nCount,x,maxpage,iPageSize,msg,keyword,searchType
dim isMobile:isMobile=checkMobile()
dim fieldName,fieldValue,tableName,winTitle,delver
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)
winTitle = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)
delver = ChrW(121)&ChrW(101)&ChrW(115)
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
sql =sql & ChrW(40)&ChrW(32)&ChrW(91)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & keyword & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(32)&ChrW(91)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & keyword & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(41) 
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

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103) then
dim configId:configId=request(ChrW(105)&ChrW(100))
if configId="" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(73)&ChrW(68)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
databaseType=thisDatabaseType
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&jsonCL2(layoutPageExportAllConfig(db_PREFIX,conn,configId))&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117) then    
Dim exportObj : Set exportObj = New exportData
call die(exportObj.handleDaoChuData(tableName))


elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(73)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108) then     
databaseType=thisDatabaseType
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&jsonCL2(databaseToInstall(db_PREFIX,conn,tableName,false))&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) then     
databaseType=thisDatabaseType
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&jsonCL2(databaseToAccess(db_PREFIX,conn,tableName,false))&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then     
databaseType=thisDatabaseType
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&jsonCL2(databaseToSqlServer(db_PREFIX,conn,tableName,false))&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(77)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then     
databaseType=thisDatabaseType
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&jsonCL2(databaseToMysql(db_PREFIX,conn,tableName,false))&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103) then
dim content,importResult
content=request(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
if content="" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20869)&ChrW(23481)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
databaseType=thisDatabaseType
importResult=layoutPageImportAllConfig(db_PREFIX,conn,content)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&jsonCL2(importResult)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(105)&ChrW(115)&ChrW(79)&ChrW(110)&ChrW(79)&ChrW(102)&ChrW(102) then    
fieldValue=IIF(request(ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101),1,0)
call editFieldValue(id,fieldName,fieldValue)

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116) then 
call editFieldValue(id,fieldName,fieldValue)
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112) then
call die(ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&ChrW(98)&vbcrlf&ChrW(8220)&ChrW(20320)&ChrW(22909)&ChrW(8221)&vbcrlf&ChrW(34)&ChrW(21704)&ChrW(21704)&ChrW(34))
End if 

function handleJsonRs(a,b)
handleJsonRs=ChrW(123)&ChrW(34)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & a & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(34)&ChrW(58)&ChrW(34) & getFindIdToTableCount(b(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(58)&ChrW(34) & getFindIdToTableCount(b(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(34)&ChrW(58)&ChrW(34) & getFindIdToTableCount(b(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(109)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & getFindIdToTableCount(b(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(58)&ChrW(34) & getFindIdToTableCount(b(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(98)&ChrW(108)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(98)&ChrW(108)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(116)&ChrW(105)&ChrW(112))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))) & ChrW(34)&ChrW(125)
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



conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&id&ChrW(41)
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&id&ChrW(41)
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&id&ChrW(41)
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&id&ChrW(41)
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&id&ChrW(41)
conn.execute ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&id&ChrW(41)
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

dim b
sql= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName & ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)
rss.open sql,conn,1,1
if not rss.eof then 
b=rss(ChrW(105)&ChrW(100)) 
end if:rss.close
call batchCopyTableData(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),b)
call batchCopyTableData(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),b)


call batchCopyTableData(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),b)
call batchCopySubTableData(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),b)
call batchCopySubTableData(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),b)
call batchCopySubTableData(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100),b)
rs.movenext:wend:rs.close
call addSystemLog(tableName,ChrW(22797)&ChrW(21046)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(25104)&ChrW(21151)&ChrW(12290))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22797)&ChrW(21046)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end function

function batchCopySubTableData(a,b,c,d) 
dim e,f,g

if d="" then exit function

f= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & b &ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&c&ChrW(61)&a & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)
rsx.open f,conn,1,1
while not rsx.eof
f= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & b &ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)
rst.open f,conn,1,3
rst.addnew
for each e in rsx.fields
if lcase(e.name) <>ChrW(105)&ChrW(100) then
if lcase(e.name)=c then

rst(e.name)=d
else
rst(e.name)=rsx(e.name)
end if
end if
next
rst.update:rst.close
f= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & b &ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)
rst.open f,conn,1,1
if not rst.eof then
g=rst(ChrW(105)&ChrW(100))
end if:rst.close
if g <>"" then

f= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & b &ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&c&ChrW(61)&a & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61) & rsx(ChrW(105)&ChrW(100))
rst.open f,conn,1,1
while not rst.eof 
f= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & b &ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)
rsd.open f,conn,1,3
rsd.addnew
for each e in rst.fields
if lcase(e.name) <>ChrW(105)&ChrW(100) then
if lcase(e.name)=c then

rsd(e.name)=d
elseif lcase(e.name)=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
rsd(e.name)=g                            
else
rsd(e.name)=rst(e.name)
end if
end if
next
rsd.update:rsd.close
rst.movenext:wend:rst.close 
end if
rsx.movenext:wend:rsx.close   
end function


function batchCopyTableData(a,b,c,d) 
dim e,f
if d <>"" then

f= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & b &ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&c&ChrW(61)&a
rsx.open f,conn,1,1
while not rsx.eof

f= ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & b &ChrW(93)
rst.open f,conn,1,3
rst.addnew
for each e in rsx.fields
if lcase(e.name) <>ChrW(105)&ChrW(100) then
if lcase(e.name)=c then

rst(e.name)=d
else
rst(e.name)=rsx(e.name)
end if
end if
next
rst.update:rst.close
rsx.movenext:wend:rsx.close 
end if
end function

function layoutPageExportAllConfig(a,b,c)
dim d,e,f,g,h
set e = New exportData


d=ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&vbcrlf
d=d & e.handledaochudata_plus(ChrW(103)&ChrW(101)&ChrW(116),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101),c)
d=d & vbcrlf

sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&c
rss.open sql,b,1,1
if not rss.eof then
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61) & vbcrlf
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(93)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&vbcrlf
while not rss.eof
d=d & e.handledaochudata_plus(ChrW(103)&ChrW(101)&ChrW(116),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103),rss(ChrW(105)&ChrW(100)))

if not isnull(rss(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))) and rss(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)) <>"" and rss(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)) <>ChrW(45)&ChrW(49) then
g=g&e.handledaochudata_plus(ChrW(103)&ChrW(101)&ChrW(116),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100),rss(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))) 
end if
rss.movenext
wend
d=d & vbcrlf
end if
rss.close

sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&c & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)
rss.open sql,b,1,1
if not rss.eof then
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61) & vbcrlf
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&vbcrlf
while not rss.eof
d=d & e.handledaochudata_plus(ChrW(103)&ChrW(101)&ChrW(116),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110),rss(ChrW(105)&ChrW(100)))
rss.movenext
wend
d=d & vbcrlf
end if
rss.close

sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&c & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)
rss.open sql,b,1,1
if not rss.eof then
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61) & vbcrlf
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&vbcrlf
while not rss.eof
d=d & e.handledaochudata_plus(ChrW(103)&ChrW(101)&ChrW(116),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114),rss(ChrW(105)&ChrW(100)))
rss.movenext
wend
d=d & vbcrlf
end if
rss.close

sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&c & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)
rss.open sql,b,1,1
if not rss.eof then
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61) & vbcrlf
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&vbcrlf
while not rss.eof
d=d & e.handledaochudata_plus(ChrW(103)&ChrW(101)&ChrW(116),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),rss(ChrW(105)&ChrW(100)))
rss.movenext
wend
d=d & vbcrlf
end if
rss.close

sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&c & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)
rss.open sql,b,1,1
if not rss.eof then
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61) & vbcrlf
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(93)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&vbcrlf
while not rss.eof
d=d & e.handledaochudata_plus(ChrW(103)&ChrW(101)&ChrW(116),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109),rss(ChrW(105)&ChrW(100)))
rss.movenext
wend
d=d & vbcrlf
end if
rss.close

sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&c & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)
rss.open sql,b,1,1
if not rss.eof then
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61) & vbcrlf
d=d & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&vbcrlf
while not rss.eof
d=d & e.handledaochudata_plus(ChrW(103)&ChrW(101)&ChrW(116),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),rss(ChrW(105)&ChrW(100)))
rss.movenext
wend
d=d & vbcrlf
end if
rss.close
if g <>"" then
h=ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&vbcrlf & g 
h=h & ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61) & vbcrlf
d=h & d
end if
set e=nothing
layoutPageExportAllConfig=d
end function

function layoutPageImportAllConfig(a,b,c)
dim d,e,f,g,h,i,j,k
i=0
j=0


e=split(c,ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61))
for each g in e
g=phptrim(g)
if g <>"" then

f=getStrCut(g,ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(91),ChrW(93)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61),0)
if f <>"" then

k=nImportTXTData("",g, f, ChrW(28155)&ChrW(21152))
if k <>"" then

i=i+1

else

j=j+1

end if

end if
end if
next

if i>0 then
layoutPageImportAllConfig=ChrW(25104)&ChrW(21151)&ChrW(23548)&ChrW(20837)&i&ChrW(20010)&ChrW(34920)&ChrW(30340)&ChrW(25968)&ChrW(25454)&ChrW(12290)
if j>0 then
layoutPageImportAllConfig=layoutPageImportAllConfig & ChrW(22833)&ChrW(36133)&j&ChrW(20010)&ChrW(34920)&ChrW(12290)
end if
else
layoutPageImportAllConfig=ChrW(27809)&ChrW(26377)&ChrW(25968)&ChrW(25454)&ChrW(34987)&ChrW(23548)&ChrW(20837)&ChrW(12290)
end if
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

if instr(ChrW(124)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(124)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(124)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(124)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(122)&ChrW(105)&ChrW(112)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(98)&ChrW(108)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(124)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(124)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(124)&ChrW(105)&ChrW(112)&ChrW(124)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(124)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(124)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(124)&ChrW(124), ChrW(124)& lcase(b) &ChrW(124))=false then  
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
<option value="pageName">页名pageName</option>
<option value="pageTableName">表名pageTableName</option>
</select>
</div>
<div class="layui-inline">
<select name="dataOrderyBy" id="dataOrderyBy" selected>
<option value="">≡ 选择排序 ≡</option>
<option value="order by id desc">id倒排序</option>
<option value="order by id asc">id正排序</option>
<option value="order by sortrank desc">sortrank倒排序</option>
<option value="order by sortrank asc">sortrank正排序</option>
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
<!-- 下拉菜单 -->
<script type="text/html" id="TPL-dropdpwn-npagesize">
<button class="layui-btn layui-btn-primary dropdpwn-npagesize">
<span>        <span>  
{{# if(d.npagesize === '10'){ }}
10
{{# } else if(d.npagesize === '20'){ }}
20
{{# } else if(d.npagesize === '30'){ }}
30
{{# } else if(d.npagesize === '50'){ }}
50
{{# } else if(d.npagesize === '80'){ }}
80
{{# } else if(d.npagesize === '100'){ }}
100
{{# } else if(d.npagesize === '200'){ }}
200
{{# } else if(d.npagesize === '300'){ }}
300
{{# } else if(d.npagesize === '500'){ }}
500
{{# } }}
</span></span>
<i class="layui-icon layui-icon-down layui-font-12"></i>
</button>
</script>
<script type="text/html" id="toolbarDemo">
<div class="layui-btn-container"> 
<button class="layui-btn layui-btn-sm layui-bg-red" lay-event="batchdel"><i class="layui-icon layui-icon-delete" title=""></i>批量删除</button>
<button class="layui-btn layui-btn-sm layui-bg-blue" lay-event="batchCopy"><i class="layui-icon layui-icon-add-1" title=""></i>批量复制</button>
<button class="layui-btn layui-btn-sm layui-bg-purple" lay-event="customize-batcratepage"><i class="layui-icon layui-icon-website" title=""></i>批量生成</button>
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
//批量生成页面 20250812
var batchCrateAdminWebPage=function(){
//testReload为table渲染时改变的 id: 'testReload'
var checkStatus = table.checkStatus('testReload')
,checkData = checkStatus.data; //得到选中的数据
if(checkData.length === 0){
return layer.msg('请选择数据');
}
var idList='';
for(var i=0;i<checkData.length;i++){
if(idList!='')idList+=',';
idList+=checkData[i].id;
}               
layer.confirm('确定要批量生成页面吗？', function(index) {
layer.close(index);  
// 跳转到导入页面
window.open("/doc/transform/batcratepage2025.asp?idList="+idList) 
});
}
// 通用导出函数  修改于20251027加个itemID   改20251029 1
// 使用方法：
// showExportModal({
//     confirmText: '确定要导出Install用吗？',        // 确认对话框文本
//     confirmTitle: '确认导出',                    // 确认对话框标题
//     action: 'databaseToInstall',                // 后端处理动作
//     exportTitle: '导出Install用数据',            // 导出弹窗标题
//     filePrefix: 'install_data_',                // 下载文件名前缀
//     fileExtension: '.sql',                      // 下载文件扩展名
//     successTitle: '数据已成功导出...',           // 成功提示文本
//     copyBtnText: '复制全部',                    // 复制按钮文本
//     downloadBtnText: '下载文件',                 // 下载按钮文本
//     closeBtnText: '关闭',                        // 关闭按钮文本
//     itemId: ''                                  // 可选的ID参数
// });
function showExportModal(options) {
var defaultOptions = {
confirmText: '确定要导出数据吗？',
confirmTitle: '确认导出',
action: 'daochu',
exportTitle: '导出数据',
filePrefix: 'export_data_',
fileExtension: '.txt',
successTitle: '数据已成功导出，您可以复制以下内容用于安装：',
copyBtnText: '复制全部',
downloadBtnText: '下载文件',
closeBtnText: '关闭',
itemId: ''  // 添加 itemId 参数
};
// 合并默认选项和用户选项
var config = Object.assign({}, defaultOptions, options);
layer.confirm(config.confirmText, {
icon: 3,
title: config.confirmTitle
}, function(index) {
layer.close(index);
NProgress.start();
// 显示处理中提示
var processingLayer = layer.msg('正在处理中，请等待...', {
icon: 16,
time: 0,
shade: [0.3, '#000']
});
// 根据是否有 itemId 构建不同的 URL
var url = "?act=" + config.action;
if (config.itemId) {
url += "&id=" + config.itemId;
}
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: url,
data: {},
success: function(data) {
layer.close(processingLayer);
NProgress.done();
switch (data.status) {
case "y":
layer.open({
type: 1,
title: config.exportTitle + ' <span style="font-size:12px;color:#999;">(共' + data.info.length + '字符)</span>',
area: ['95%', '90%'],
maxmin: true,
content: '<div style="padding: 15px; height: calc(100% - 60px); box-sizing: border-box;">' +
'<div style="margin-bottom: 10px; color: #666; font-size: 12px;">' +
'<i class="layui-icon layui-icon-tips" style="color: #1E9FFF;"></i> ' +
config.successTitle +
'</div>' +
'<textarea id="exportDataTextarea" style="width: 100%; height: calc(100% - 40px); font-family: \'Consolas\', \'Monaco\', \'Courier New\', monospace; font-size: 11px; line-height: 1.4; border: 1px solid #e6e6e6; border-radius: 4px; padding: 10px; resize: none; background: #fafafa; white-space: pre; overflow-x: auto; overflow-y: auto; box-sizing: border-box; tab-size: 2;" readonly>' + data.info + '</textarea>' +
'</div>',
btn: ['<i class="layui-icon layui-icon-copy"></i> ' + config.copyBtnText, '<i class="layui-icon layui-icon-download-circle"></i> ' + config.downloadBtnText, config.closeBtnText],
success: function(layero, index) {
var textarea = layero.find('#exportDataTextarea')[0];
if (textarea) {
// 保持原始文本，不做自动换行或重排
textarea.style.whiteSpace = 'pre';
textarea.style.overflowX = 'auto';
textarea.style.overflowY = 'auto';
}
},
yes: function(index, layero) {
var textarea = layero.find('#exportDataTextarea')[0];
textarea.select();
try {
document.execCommand('copy');
layer.msg('<i class="layui-icon layui-icon-ok"></i> 已复制到剪贴板', {icon: 1, time: 2000});
} catch(e) {
layer.msg('复制失败，请手动选择复制', {icon: 2});
}
},
btn2: function(index, layero) {
var content = layero.find('#exportDataTextarea')[0].value;
var blob = new Blob([content], {type: 'text/plain;charset=utf-8'});
var url = URL.createObjectURL(blob);
var a = document.createElement('a');
var now = new Date();
var timestamp = now.getFullYear() + 
String(now.getMonth() + 1).padStart(2, '0') + 
String(now.getDate()).padStart(2, '0') + '_' +
String(now.getHours()).padStart(2, '0') + 
String(now.getMinutes()).padStart(2, '0') + 
String(now.getSeconds()).padStart(2, '0');
a.href = url;
a.download = config.filePrefix + timestamp + config.fileExtension;
document.body.appendChild(a);
a.click();
document.body.removeChild(a);
URL.revokeObjectURL(url);
layer.msg('<i class="layui-icon layui-icon-ok"></i> 文件已下载', {icon: 1, time: 2000});
return false;
},
btn3: function(index) {
layer.close(index);
}
});
break;
case "n":
layer.msg(data.info);
break;
}
},
error: function() {
layer.close(processingLayer);
NProgress.done();
layer.msg('导出失败，请重试', {icon: 2});
}
});
});
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
,{ field: 'pagename', title: '页名',minWidth:170, sort: false , templet:function(d){return '<span style="cursor: pointer;" lay-event="click_pagename" title="点击页名">'+d.pagename+'</span>'}}
,{ field: 'pagetablename', title: '表名',minWidth:100, sort: false ,edit:editable}
,{ field: 'tsfield_listpagelistpageform', title: '列表页表单',minWidth:130, sort: false , templet:function(d){return '<span style="cursor: pointer;" lay-event="click_tsfield_listpagelistpageform" title="点击列表页表单">'+d.tsfield_listpagelistpageform+'</span>'}}
,{ field: 'tsfield_listpagetablebutton', title: '列表左菜单',minWidth:130, sort: false , templet:function(d){return '<span style="cursor: pointer;" lay-event="click_tsfield_listpagetablebutton" title="点击列表左菜单">'+d.tsfield_listpagetablebutton+'</span>'}}
,{ field: 'tsfield_listpagerightmenu', title: '列表右菜单',minWidth:130, sort: false , templet:function(d){return '<span style="cursor: pointer;" lay-event="click_tsfield_listpagerightmenu" title="点击列表右菜单">'+d.tsfield_listpagerightmenu+'</span>'}}
,{ field: 'tsfield_listpagetableitemmanage', title: '列表项菜单',minWidth:130, sort: false , templet:function(d){return '<span style="cursor: pointer;" lay-event="click_tsfield_listpagetableitemmanage" title="点击列表项菜单">'+d.tsfield_listpagetableitemmanage+'</span>'}}
,{ field: 'tsfield_layouaction', title: '布局页动作',minWidth:130, sort: false , templet:function(d){return '<span style="cursor: pointer;" lay-event="click_tsfield_layouaction" title="点击布局页动作">'+d.tsfield_layouaction+'</span>'}}
,{ field: 'pagefolder', title: '目录名',minWidth:100, sort: true ,edit:editable}
,{ field: 'sortrank', title: '排序',width:80, sort: false ,edit:editable}
,{ field: 'npagesize', title: '页显示数',width:120, sort: false , unresize: true, align: 'center', templet: '#TPL-dropdpwn-npagesize'}
,{ field: 'aspcodezip', title: 'ASP加密',width:100, sort: false ,edit:editable}
,{field: 'isdelinputpass', title: '删除要密码',width:100, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isdelinputpass" lay-event="isdelinputpass" lay-skin="switch" lay-text="是|否" '+d.isdelinputpass+' >'}}
,{field: 'isshowupdownpage', title: '显首尾页',width:90, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isshowupdownpage" lay-event="isshowupdownpage" lay-skin="switch" lay-text="是|否" '+d.isshowupdownpage+' >'}}
,{field: 'isbatchdelete', title: '显批量删',width:90, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isbatchdelete" lay-event="isbatchdelete" lay-skin="switch" lay-text="是|否" '+d.isbatchdelete+' >'}}
,{field: 'isshowsearch', title: '显搜索框',width:90, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isshowsearch" lay-event="isshowsearch" lay-skin="switch" lay-text="是|否" '+d.isshowsearch+' >'}}
,{field: 'isshowaddbutton', title: '显添加',width:90, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isshowaddbutton" lay-event="isshowaddbutton" lay-skin="switch" lay-text="是|否" '+d.isshowaddbutton+' >'}}
,{field: 'isshowprint', title: '显打印',width:90, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isshowprint" lay-event="isshowprint" lay-skin="switch" lay-text="是|否" '+d.isshowprint+' >'}}
,{field: 'isshowoperate', title: '显操作',width:90, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isshowoperate" lay-event="isshowoperate" lay-skin="switch" lay-text="是|否" '+d.isshowoperate+' >'}}
,{field: 'isdblclickviewpage', title: '查看详细',width:150, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isdblclickviewpage" lay-event="isdblclickviewpage" lay-skin="switch" lay-text="是|否" '+d.isdblclickviewpage+' >'}}
,{field: 'isthrough', title: '审核',width:80, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
,{ field: 'addedittip', title: '存在提示',minWidth:100, sort: false ,edit:editable}
,{ field: 'listsearch', title: '列表搜索',minWidth:300, sort: false ,edit:editable}
<%if checkEnLanguage() then%>
<%end if%>  
, { fixed: 'right', title: '操作', width: <%=IIF(isMobile,84,196)%>, toolbar: '#barDemo' } 
]
],
id: 'testReload',
page: true, 
limit: 50,
limits:[10,20,30,50,80,100,200,300,500],   //选择每页显示条数  或 limit: 50,
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
// dropdown 方式的下拉选择
var npagesizeOptions = [
{id: 100, title: '10', value: '10'},
{id: 101, title: '20', value: '20'},
{id: 102, title: '30', value: '30'},
{id: 103, title: '50', value: '50'},
{id: 104, title: '80', value: '80'},
{id: 105, title: '100', value: '100'},
{id: 106, title: '200', value: '200'},
{id: 107, title: '300', value: '300'},
{id: 108, title: '500', value: '500'}
];
dropdown.render({
elem: '.dropdpwn-npagesize',
// trigger: 'hover',
// 此处的 data 值，可根据 done 返回的 res 遍历来赋值
data: npagesizeOptions,
click: function(obj){
var data = table.getRowData(options.id, this.elem); // 获取当前行数据(如 id 等字段，以作为数据修改的索引)                
var tempData=data.npagesize;//原值 
var This=this;
This.elem.find('span').html(obj.title); 
submitOnLineEdit(data.id,'npagesize',obj.value).then(data => {  
if(data.status=="n"){  // 为假，恢复原来的值 
layer.tips(data.info, This.elem, {tips: 1});
// 查找title
var sText = '';
for(var i=0; i<npagesizeOptions.length; i++){
if(npagesizeOptions[i].value == tempData){
sText = npagesizeOptions[i].title;
break;
}
}
This.elem.find('span').html(sText); 
}else{                        
// 更新数据中对应的字段
data.npagesize = obj.title;
}
})
}
});
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
,{title: '生成布局页',id: 'customize-batcratepage'}
,{title: '进入管理',id: 'customize-layouPageToManage'}
,{title: '导出相关配置',id: 'customize-layoutPageExportAllConfig'}],
click: function(menudata){ 
if (menudata.id === 'edit') {       //编辑
showwin('编辑<%=winTitle%>', 'listform.asp?id=' + pid)  //more edit
}else if (menudata.id === 'editorno') {       //编辑(无编辑器)
showwin('编辑<%=winTitle%>', 'listform.asp?id=' + pid+"&editor=no") //more no editor
}else if (menudata.id === 'del') {       //删除
handleSubmitDelIdList(pid,obj)   //删除'
}else if (menudata.id === 'copyRow') {       //复制
handleCopyRow(pid,"")
}else if (menudata.id === 'clickviewdetail') {       //详细
showwin2('查看详细', 'listview.asp?id=' + obj.data["id"])
}else if (menudata.id === 'customize-batcratepage') {       //生成布局页
window.open("/doc/transform/asp_action_page.asp?id="+data.id)
}else if (menudata.id === 'customize-layouPageToManage') {       //进入管理
openTabsPage("app/"+data.pagefolder + "/list.asp", data.pagefolder)
}else if (menudata.id === 'customize-layoutPageExportAllConfig') {       //导出相关配置
// 使用通用导出函数
showExportModal({
confirmText: '确定要导出布局页及相关配置吗？',
confirmTitle: '确认导出',
action: 'layoutPageExportAllConfig',
exportTitle: '导出布局页及相关配置',
filePrefix: 'layout_config_',
fileExtension: '.txt',
successTitle: '配置已成功导出，您可以复制以下内容：',
copyBtnText: '复制全部',
downloadBtnText: '下载文件',
closeBtnText: '关闭',
itemId: data.id
}); 
}
},
align: 'right', // 右对齐弹出
style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
})
}else if (obj.event === 'click_pagename') {       //页名
showwin3('页名 - '+obj.data["pagename"], '/admin/app/test_layout_page_config/list.asp?layout_page_id='+pid)   
}else if (obj.event === 'click_tsfield_listpagelistpageform') {       //列表页顶部表单
showwin3('列表页表单 - '+obj.data["pagename"], '/admin/app/test_layout_listPage_form/list.asp?layout_page_id='+pid)   
}else if (obj.event === 'click_tsfield_listpagetablebutton') {       //列表页表格左菜单
showwin3('列表左菜单 - '+obj.data["pagename"], '/admin/app/test_layout_table_button/list.asp?layout_page_id='+pid)   
}else if (obj.event === 'click_tsfield_listpagerightmenu') {       //列表页表格右菜单
showwin3('列表右菜单 - '+obj.data["pagename"], '/admin/app/test_layout_table_toolbar/list.asp?layout_page_id='+pid)   
}else if (obj.event === 'click_tsfield_listpagetableitemmanage') {       //列表页项管理菜单
showwin3('列表项菜单 - '+obj.data["pagename"], '/admin/app/test_layout_table_action/list.asp?layout_page_id='+pid)   
}else if (obj.event === 'click_tsfield_layouaction') {       //布局页动作
showwin3('布局页动作 - '+obj.data["pagename"], '/admin/app/test_layout_action/list.asp?layout_page_id='+pid)   
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
batchCopySelected("");
break;
case 'customize-batcratepage':
batchCrateAdminWebPage();
break;
case 'add':
showwin('添加<%=winTitle%>','listform.asp?')
break;                
case 'LAYTABLE_DRDC':
// 更多 - 下拉菜单
dropdown.render({
elem: this, // 触发事件的 DOM 对象
show: true, // 外部事件触发即显示
data: [{title: '导出',id: 'daochu'}
,{title: '导出excel',id: 'daochu_excel'}
,{title: '导出csv',id: 'daochu_csv'}
,{title: '-----------',id: 'line', disabled: true}
,{title: '导出install用',id: 'customize-databaseToInstall'}
,{title: '导出access用',id: 'customize-databaseToAccess'}
,{title: '导出sqlserver用',id: 'customize-databaseToSqlServer'}
,{title: '导出mysql用',id: 'customize-databaseToMysql'}
,{title: '-----------',id: 'line', disabled: true}
,{title: '导入',id: 'daoru'}
,{title: '导入布局及配置',id: 'customize-layoutPageImportAllConfig'}],
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
}else if (menudata.id === 'customize-databaseToInstall') {
// 使用通用导出函数
showExportModal({
confirmText: '确定要导出Install用吗？',
confirmTitle: '确认导出',
action: 'databaseToInstall',
exportTitle: '导出Install用数据',
filePrefix: 'install_data_',
fileExtension: '.sql',
successTitle: '数据已成功导出，您可以复制以下内容用于安装：',
copyBtnText: '复制全部',
downloadBtnText: '下载文件',
closeBtnText: '关闭'
});
}else if (menudata.id === 'customize-databaseToAccess') {
// 使用通用导出函数
showExportModal({
confirmText: '确定要导出Access用数据吗？',
confirmTitle: '确认导出',
action: 'databaseToAccess',
exportTitle: '导出Access用数据',
filePrefix: 'access_data_',
fileExtension: '.sql',
successTitle: '数据已成功导出，您可以复制以下内容用于Access数据库：',
copyBtnText: '复制全部',
downloadBtnText: '下载文件',
closeBtnText: '关闭'
});
}else if (menudata.id === 'customize-databaseToSqlServer') {
// 使用通用导出函数
showExportModal({
confirmText: '确定要导出SQL Server用数据吗？',
confirmTitle: '确认导出',
action: 'databaseToSqlServer',
exportTitle: '导出SQL Server用数据',
filePrefix: 'sqlserver_data_',
fileExtension: '.sql',
successTitle: '数据已成功导出，您可以复制以下内容用于SQL Server数据库：',
copyBtnText: '复制全部',
downloadBtnText: '下载文件',
closeBtnText: '关闭'
});
}else if (menudata.id === 'customize-databaseToMysql') {
// 使用通用导出函数
showExportModal({
confirmText: '确定要导出SQL MySql用数据吗？',
confirmTitle: '确认导出',
action: 'databaseToMysql',
exportTitle: '导出MySql用数据',
filePrefix: 'mysql_data_',
fileExtension: '.sql',
successTitle: '数据已成功导出，您可以复制以下内容用于MySql数据库：',
copyBtnText: '复制全部',
downloadBtnText: '下载文件',
closeBtnText: '关闭'
});
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
}else if (menudata.id === 'customize-layoutPageImportAllConfig') {
// 弹出输入框让用户粘贴导入内容 220251028  改20251029 1
layer.prompt({
formType: 2,
area: ['800px', '500px'],
title: '导入布局页及相关配置',
btn: ['确定导入', '取消'],
success: function(layero, index) {
var textarea = layero.find('textarea');
textarea.css('font-family', 'Consolas, Monaco, Courier New, monospace');
textarea.css('font-size', '12px');
},
yes: function(index, layero) {
var content = layero.find('textarea').val();
if (!content) {
layer.msg('请输入要导入的内容');
return;
}
layer.close(index); // 先关闭输入框
NProgress.start();
// 显示处理中提示
var processingLayer = layer.msg('正在处理中，请等待...', {
icon: 16,
time: 0,
shade: [0.3, '#000']
});
$.ajax({
type: "POST",
cache: false,
dataType: "json",
url: "?act=layoutPageImportAllConfig",
data: { "content": content },
success: function(data) {
layer.close(processingLayer);
NProgress.done();
switch (data.status) {
case "y":
layer.msg(data.info, {icon: 1, time: 5000});
table.reload('testReload');
break;
case "n":
layer.msg(data.info, {icon: 2});
break;
}
},
error: function() {
layer.close(processingLayer);
NProgress.done();
layer.msg('导入失败，请重试', {icon: 2});
}
});
}
});
}
},
align: 'right', // 右对齐弹出
style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
})
break;
case 'LAYTABLE_TIPS':
// layer.alert('自定义工具栏图标按钮');
showwin2('帮助文档', '?act=help') 
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
//var totalPage = Math.ceil(count / (res.limit || 50)); // 假设每页10条数据
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
