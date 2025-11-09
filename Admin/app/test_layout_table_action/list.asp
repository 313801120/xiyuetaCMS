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
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)
winTitle = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)
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
If Request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)) <> "" Then
sql=IIF(sql="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))
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
sql =sql & ChrW(40)&ChrW(32)&ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & keyword & ChrW(37)&ChrW(39)&ChrW(32)&ChrW(41) 
end if
End if
dim splxx:splxx=split(getColumAllID(ChrW(45)&ChrW(49),tableName,ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107),sql),ChrW(44))
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
if ubound(splxx)+1=rs.recordcount then
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX & tableName &ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&splxx(i-1),conn,1,1
if not rsx.eof then
stemp = stemp & handleJsonRs(i,rsx)
end if:rsx.close
else
stemp = stemp & handleJsonRs(i,rs)
end if
rs.MoveNext 
next 
End if 
stemp =ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) & stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & nCount & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(34)&ChrW(58)&page&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)& msg & vbEchoTimer() &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34)& jsonCL(mysql) &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(98)&ChrW(106)&ChrW(121)&ChrW(122)&ChrW(34)&ChrW(58)&ChrW(34)& ubound(splxx)+1 &ChrW(61)&rs.recordcount&ChrW(34)&ChrW(125) 
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
handleJsonRs=ChrW(123)&ChrW(34)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & a & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & get_layout_page_oneClassColumnName(b(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & get_layout_table_action_columnName(b,ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) &  IIF(b(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)) <>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"") & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(98)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(98)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(b(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116))) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & b(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(125)
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

function copyRow()
if checkAdminRule(ChrW(28155)&ChrW(21152) & winTitle)=false then 
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(28155)&ChrW(21152)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
dim  a,b,c,d,e,f,g,h
h=phptrim(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)))
if id="" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(73)&ChrW(68)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
g=phptrim(lcase(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))))
b=0
c=split(id,ChrW(44))
for each f in c
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&f
rs.open sql,conn,1,1
if not rs.eof then
for each a in rs.fields
if lcase(a.name) <>ChrW(105)&ChrW(100) then
fieldValue=rs(a.name)
if g=lcase(a.name) then
if h <>"" then
fieldValue=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
end if
end if          
if typeName(fieldValue)=ChrW(78)&ChrW(117)&ChrW(108)&ChrW(108) then
fieldValue=ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108) 
end if
if lcase(a.name)=ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100) then
if rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
if d=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) then
fieldValue=e
elseif h <>"" then
fieldValue=ChrW(45)&ChrW(49)
end if
end if
end if
call rsData(a.name,fieldValue)
end if
next


if rsAddnew_conn(tableName,conn,db_PREFIX,thisDatabaseType)=false then 
call addSystemLog(tableName,ChrW(22797)&ChrW(21046)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(38169)&ChrW(35823)&ChrW(83)&ChrW(81)&ChrW(76)&ChrW(65306) & insertOrUpdateSql)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22797)&ChrW(21046)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(38169)&ChrW(35823)&ChrW(83)&ChrW(81)&ChrW(65306)&jsonCL(insertOrUpdateSql)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125)) 
end if
b=b+1
if rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=-1 then
d=rs(ChrW(105)&ChrW(100))
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(79)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(32)&ChrW(66)&ChrW(121)&ChrW(32)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(115)&ChrW(99)
rsx.open sql, conn, 1, 1
if not rsx.eof then
e=rsx(ChrW(105)&ChrW(100))
end if:rsx.close
end if

end if:rs.close         
next 
call addSystemLog(tableName,ChrW(22797)&ChrW(21046)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(20849)&b&ChrW(26465))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22810)&ChrW(32423)&ChrW(22797)&ChrW(21046)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(20849)&b&ChrW(26465)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
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

function get_layout_page_treeName(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(160)&ChrW(160) & b
else
b=b & ChrW(160)&ChrW(160)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
call get_layout_page_treeName(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),b)
end if
end if:c.close
get_layout_page_treeName=b
end function

function get_layout_page_oneClassColumnName(a) 
if a="" then exit function
dim b
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))  
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
b=c(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))& ChrW(40)&c(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(41)
end if:c.close 
get_layout_page_oneClassColumnName=b
end function

function get_layout_table_action_treeName(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(160)&ChrW(160) & b
else
b=b & ChrW(160)&ChrW(160)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
call get_layout_table_action_treeName(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),b)
end if
end if:c.close
get_layout_table_action_treeName=b
end function

function getColumAllID(a,b,c,d)
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim f,g,h
h=d & IIF(d <>"",ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32),ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)) & ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &""&b&ChrW(93)&ChrW(32)&h& ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&c&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not e.eof 
if f <>"" then f=f & ChrW(44)
f=f & e(ChrW(105)&ChrW(100))
g=getColumAllID(e(ChrW(105)&ChrW(100)),b,c,d)
if g <>"" then
f=f & ChrW(44) & g
end if
e.movenext:wend:e.close
getColumAllID=f
end function

function get_layout_table_action_columnName(a,b)
dim c,d
d=a(b)
if d <>-1 then
c=get_layout_table_action_treeName(d,"")  & a(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))& ChrW(40)&a(ChrW(105)&ChrW(100))&ChrW(41)
else
c=a(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))& ChrW(40)&a(ChrW(105)&ChrW(100))&ChrW(41)
end if
get_layout_table_action_columnName=jsonCL(c)
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

if instr(ChrW(124)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(124)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(124)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(124)&ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(124)&ChrW(98)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(124)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(124)&ChrW(124), ChrW(124)& lcase(b) &ChrW(124))=false then  
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
<option value="title">标题title</option>
<option value="buttonTitle">按钮显示标题(buttonTitle)</option>
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
<script type="text/html" id="TPL-dropdpwn-saction">
<button class="layui-btn layui-btn-primary dropdpwn-saction">
<span>        <span>  
{{# if(d.saction === 'edit'){ }}
编辑
{{# } else if(d.saction === 'editorno'){ }}
编辑(无编辑器)
{{# } else if(d.saction === 'del'){ }}
删除
{{# } else if(d.saction === 'copyRow'){ }}
复制
{{# } else if(d.saction === 'more'){ }}
更多
{{# } else if(d.saction === 'clickviewdetail'){ }}
详细
{{# } else if(d.saction === 'customize'){ }}
自定义
{{# } }}
</span></span>
<i class="layui-icon layui-icon-down layui-font-12"></i>
</button>
</script>
<!-- 下拉菜单 -->
<script type="text/html" id="TPL-dropdpwn-bgcolor">
<button class="layui-btn layui-btn-primary dropdpwn-bgcolor">
<span>        <span>  
{{# if(d.bgcolor === 'normal'){ }}
normal
{{# } else if(d.bgcolor === 'blue'){ }}
blue
{{# } else if(d.bgcolor === 'orange'){ }}
orange
{{# } else if(d.bgcolor === 'red'){ }}
red
{{# } else if(d.bgcolor === 'purple'){ }}
purple
{{# } }}
</span></span>
<i class="layui-icon layui-icon-down layui-font-12"></i>
</button>
</script>
<!-- 下拉菜单 -->
<script type="text/html" id="TPL-dropdpwn-noteico">
<button class="layui-btn layui-btn-primary dropdpwn-noteico">
<span>        <span>  
{{# if(d.noteico === 'bot'){ }}
机器人
{{# } else if(d.noteico === 'leaf'){ }}
叶子节点
{{# } else if(d.noteico === 'folder'){ }}
文件夹
{{# } else if(d.noteico === 'folder-open'){ }}
文件夹打开
{{# } else if(d.noteico === 'gitee'){ }}
Gitee
{{# } else if(d.noteico === 'github'){ }}
Github
{{# } else if(d.noteico === 'light'){ }}
太阳/明亮
{{# } else if(d.noteico === 'moon'){ }}
月亮
{{# } else if(d.noteico === 'error'){ }}
错误
{{# } else if(d.noteico === 'success'){ }}
成功
{{# } else if(d.noteico === 'question'){ }}
问号
{{# } else if(d.noteico === 'lock'){ }}
锁定
{{# } else if(d.noteico === 'eye'){ }}
显示
{{# } else if(d.noteico === 'eye-invisible'){ }}
隐藏
{{# } else if(d.noteico === 'clear'){ }}
清空/删除
{{# } else if(d.noteico === 'backspace'){ }}
退格
{{# } else if(d.noteico === 'disabled'){ }}
禁用
{{# } else if(d.noteico === 'tips-fill'){ }}
感叹号/提示
{{# } else if(d.noteico === 'test'){ }}
测试/K线图
{{# } else if(d.noteico === 'music'){ }}
音乐/音符
{{# } else if(d.noteico === 'chrome'){ }}
Chrome
{{# } else if(d.noteico === 'firefox'){ }}
Firefox
{{# } else if(d.noteico === 'edge'){ }}
Edge
{{# } else if(d.noteico === 'ie'){ }}
IE
{{# } else if(d.noteico === 'heart-fill'){ }}
实心
{{# } else if(d.noteico === 'heart'){ }}
空心
{{# } else if(d.noteico === 'time'){ }}
时间/历史
{{# } else if(d.noteico === 'at'){ }}
@艾特
{{# } else if(d.noteico === 'email'){ }}
邮箱
{{# } else if(d.noteico === 'rss'){ }}
RSS
{{# } else if(d.noteico === 'sound'){ }}
声音
{{# } else if(d.noteico === 'mute'){ }}
静音
{{# } else if(d.noteico === 'mike'){ }}
录音/麦克风
{{# } else if(d.noteico === 'key'){ }}
密钥/钥匙
{{# } else if(d.noteico === 'gift'){ }}
礼物/活动
{{# } else if(d.noteico === 'bluetooth'){ }}
蓝牙
{{# } else if(d.noteico === 'wifi'){ }}
WiFi
{{# } else if(d.noteico === 'logout'){ }}
退出/注销
{{# } else if(d.noteico === 'android'){ }}
Android 安卓
{{# } else if(d.noteico === 'ios'){ }}
Apple IOS 苹果
{{# } else if(d.noteico === 'windows'){ }}
Windows
{{# } else if(d.noteico === 'transfer'){ }}
穿梭框
{{# } else if(d.noteico === 'service'){ }}
客服
{{# } else if(d.noteico === 'subtraction'){ }}
减
{{# } else if(d.noteico === 'addition'){ }}
加
{{# } else if(d.noteico === 'slider'){ }}
滑块
{{# } else if(d.noteico === 'print'){ }}
打印
{{# } else if(d.noteico === 'export'){ }}
导出
{{# } else if(d.noteico === 'cols'){ }}
列
{{# } else if(d.noteico === 'screen-restore'){ }}
退出全屏
{{# } else if(d.noteico === 'screen-full'){ }}
全屏
{{# } else if(d.noteico === 'rate-half'){ }}
半星
{{# } else if(d.noteico === 'rate'){ }}
星星-空心
{{# } else if(d.noteico === 'rate-solid'){ }}
星星-实心
{{# } else if(d.noteico === 'cellphone'){ }}
手机
{{# } else if(d.noteico === 'vercode'){ }}
验证码
{{# } else if(d.noteico === 'login-wechat'){ }}
微信
{{# } else if(d.noteico === 'login-qq'){ }}
QQ
{{# } else if(d.noteico === 'login-weibo'){ }}
微博
{{# } else if(d.noteico === 'password'){ }}
密码
{{# } else if(d.noteico === 'username'){ }}
用户名
{{# } else if(d.noteico === 'refresh-3'){ }}
刷新-粗
{{# } else if(d.noteico === 'auz'){ }}
授权
{{# } else if(d.noteico === 'spread-left'){ }}
左向右伸缩菜单
{{# } else if(d.noteico === 'shrink-right'){ }}
右向左伸缩菜单
{{# } else if(d.noteico === 'snowflake'){ }}
雪花
{{# } else if(d.noteico === 'tips'){ }}
提示说明
{{# } else if(d.noteico === 'note'){ }}
便签
{{# } else if(d.noteico === 'home'){ }}
主页
{{# } else if(d.noteico === 'senior'){ }}
高级
{{# } else if(d.noteico === 'refresh'){ }}
刷新
{{# } else if(d.noteico === 'refresh-1'){ }}
刷新
{{# } else if(d.noteico === 'flag'){ }}
旗帜
{{# } else if(d.noteico === 'theme'){ }}
主题
{{# } else if(d.noteico === 'notice'){ }}
消息-通知
{{# } else if(d.noteico === 'website'){ }}
网站
{{# } else if(d.noteico === 'console'){ }}
控制台
{{# } else if(d.noteico === 'face-surprised'){ }}
表情-惊讶
{{# } else if(d.noteico === 'set'){ }}
设置-空心
{{# } else if(d.noteico === 'template-1'){ }}
模板
{{# } else if(d.noteico === 'app'){ }}
应用
{{# } else if(d.noteico === 'template'){ }}
模板
{{# } else if(d.noteico === 'praise'){ }}
赞
{{# } else if(d.noteico === 'tread'){ }}
踩
{{# } else if(d.noteico === 'male'){ }}
男
{{# } else if(d.noteico === 'female'){ }}
女
{{# } else if(d.noteico === 'camera'){ }}
相机-空心
{{# } else if(d.noteico === 'camera-fill'){ }}
相机-实心
{{# } else if(d.noteico === 'more'){ }}
菜单-水平
{{# } else if(d.noteico === 'more-vertical'){ }}
菜单-垂直
{{# } else if(d.noteico === 'rmb'){ }}
金额-人民币
{{# } else if(d.noteico === 'dollar'){ }}
金额-美元
{{# } else if(d.noteico === 'diamond'){ }}
钻石-等级
{{# } else if(d.noteico === 'fire'){ }}
火
{{# } else if(d.noteico === 'return'){ }}
返回
{{# } else if(d.noteico === 'location'){ }}
位置-地图
{{# } else if(d.noteico === 'read'){ }}
办公-阅读
{{# } else if(d.noteico === 'survey'){ }}
调查
{{# } else if(d.noteico === 'face-smile'){ }}
表情-微笑
{{# } else if(d.noteico === 'face-cry'){ }}
表情-哭泣
{{# } else if(d.noteico === 'cart-simple'){ }}
购物车
{{# } else if(d.noteico === 'cart'){ }}
购物车
{{# } else if(d.noteico === 'next'){ }}
下一页
{{# } else if(d.noteico === 'prev'){ }}
上一页
{{# } else if(d.noteico === 'upload-drag'){ }}
上传-空心-拖拽
{{# } else if(d.noteico === 'upload'){ }}
上传-实心
{{# } else if(d.noteico === 'download-circle'){ }}
下载-圆圈
{{# } else if(d.noteico === 'component'){ }}
组件
{{# } else if(d.noteico === 'file-b'){ }}
文件-粗
{{# } else if(d.noteico === 'user'){ }}
用户
{{# } else if(d.noteico === 'find-fill'){ }}
发现-实心
{{# } else if(d.noteico === 'loading'){ }}
loading
{{# } else if(d.noteico === 'loading-1'){ }}
loading
{{# } else if(d.noteico === 'add-1'){ }}
添加
{{# } else if(d.noteico === 'play'){ }}
播放
{{# } else if(d.noteico === 'pause'){ }}
暂停
{{# } else if(d.noteico === 'headset'){ }}
音频-耳机
{{# } else if(d.noteico === 'video'){ }}
视频
{{# } else if(d.noteico === 'voice'){ }}
语音-声音
{{# } else if(d.noteico === 'speaker'){ }}
消息-通知-喇叭
{{# } else if(d.noteico === 'fonts-del'){ }}
删除线
{{# } else if(d.noteico === 'fonts-code'){ }}
代码
{{# } else if(d.noteico === 'fonts-html'){ }}
HTML
{{# } else if(d.noteico === 'fonts-strong'){ }}
字体加粗
{{# } else if(d.noteico === 'unlink'){ }}
删除链接
{{# } else if(d.noteico === 'picture'){ }}
图片
{{# } else if(d.noteico === 'link'){ }}
链接
{{# } else if(d.noteico === 'face-smile-b'){ }}
表情-笑-粗
{{# } else if(d.noteico === 'align-left'){ }}
左对齐
{{# } else if(d.noteico === 'align-right'){ }}
右对齐
{{# } else if(d.noteico === 'align-center'){ }}
居中对齐
{{# } else if(d.noteico === 'fonts-u'){ }}
字体-下划线
{{# } else if(d.noteico === 'fonts-i'){ }}
字体-斜体
{{# } else if(d.noteico === 'tabs'){ }}
Tabs 选项卡
{{# } else if(d.noteico === 'radio'){ }}
单选框-选中
{{# } else if(d.noteico === 'circle'){ }}
单选框-候选
{{# } else if(d.noteico === 'edit'){ }}
编辑
{{# } else if(d.noteico === 'share'){ }}
分享
{{# } else if(d.noteico === 'delete'){ }}
删除
{{# } else if(d.noteico === 'form'){ }}
表单
{{# } else if(d.noteico === 'cellphone-fine'){ }}
手机-细体
{{# } else if(d.noteico === 'dialogue'){ }}
聊天 对话 沟通
{{# } else if(d.noteico === 'fonts-clear'){ }}
文字格式化
{{# } else if(d.noteico === 'layer'){ }}
窗口
{{# } else if(d.noteico === 'date'){ }}
日期
{{# } else if(d.noteico === 'water'){ }}
水 下雨
{{# } else if(d.noteico === 'code-circle'){ }}
代码-圆圈
{{# } else if(d.noteico === 'carousel'){ }}
轮播组图
{{# } else if(d.noteico === 'prev-circle'){ }}
翻页
{{# } else if(d.noteico === 'layouts'){ }}
布局
{{# } else if(d.noteico === 'util'){ }}
工具
{{# } else if(d.noteico === 'templeate-1'){ }}
选择模板
{{# } else if(d.noteico === 'upload-circle'){ }}
上传-圆圈
{{# } else if(d.noteico === 'tree'){ }}
树
{{# } else if(d.noteico === 'table'){ }}
表格
{{# } else if(d.noteico === 'chart'){ }}
图表
{{# } else if(d.noteico === 'chart-screen'){ }}
图标 报表 屏幕
{{# } else if(d.noteico === 'engine'){ }}
引擎
{{# } else if(d.noteico === 'triangle-d'){ }}
下三角
{{# } else if(d.noteico === 'triangle-r'){ }}
右三角
{{# } else if(d.noteico === 'file'){ }}
文件
{{# } else if(d.noteico === 'set-sm'){ }}
设置-小型
{{# } else if(d.noteico === 'reduce-circle'){ }}
减少-圆圈
{{# } else if(d.noteico === 'add-circle'){ }}
添加-圆圈
{{# } else if(d.noteico === '404'){ }}
404
{{# } else if(d.noteico === 'about'){ }}
关于
{{# } else if(d.noteico === 'up'){ }}
箭头 向上
{{# } else if(d.noteico === 'down'){ }}
箭头 向下
{{# } else if(d.noteico === 'left'){ }}
箭头 向左
{{# } else if(d.noteico === 'right'){ }}
箭头 向右
{{# } else if(d.noteico === 'circle-dot'){ }}
圆点
{{# } else if(d.noteico === 'search'){ }}
搜索
{{# } else if(d.noteico === 'set-fill'){ }}
设置-实心
{{# } else if(d.noteico === 'group'){ }}
群组
{{# } else if(d.noteico === 'friends'){ }}
好友
{{# } else if(d.noteico === 'reply-fill'){ }}
回复 评论 实心
{{# } else if(d.noteico === 'menu-fill'){ }}
菜单 隐身 实心
{{# } else if(d.noteico === 'log'){ }}
记录
{{# } else if(d.noteico === 'picture-fine'){ }}
图片-细体
{{# } else if(d.noteico === 'face-smile-fine'){ }}
表情-笑-细体
{{# } else if(d.noteico === 'list'){ }}
列表
{{# } else if(d.noteico === 'release'){ }}
发布 纸飞机
{{# } else if(d.noteico === 'ok'){ }}
对 OK
{{# } else if(d.noteico === 'help'){ }}
帮助
{{# } else if(d.noteico === 'chat'){ }}
客服
{{# } else if(d.noteico === 'top'){ }}
top 置顶
{{# } else if(d.noteico === 'star'){ }}
收藏-空心
{{# } else if(d.noteico === 'star-fill'){ }}
收藏-实心
{{# } else if(d.noteico === 'close-fill'){ }}
关闭-实心
{{# } else if(d.noteico === 'close'){ }}
关闭-空心
{{# } else if(d.noteico === 'ok-circle'){ }}
正确
{{# } else if(d.noteico === 'add-circle-fine'){ }}
添加-圆圈-细体
{{# } }}
</span></span>
<i class="layui-icon layui-icon-down layui-font-12"></i>
</button>
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
url: '?act=list&layout_page_id=<%=request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))%>', 
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
url: '?act=list&layout_page_id=<%=request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))%>', 
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
{ field: 'id', title: 'ID',width:80, sort: true ,edit:editable}
,{ field: 'layout_page_id', title: '布局页ID',minWidth:130, sort: false }
,{ field: 'parentid', title: '选择分类',minWidth:180, sort: false }
,{ field: 'title', title: '标题',minWidth:300, sort: false ,edit:editable}
,{ field: 'buttontitle', title: '按钮标题',minWidth:150, sort: false ,edit:editable}
,{ field: 'itemwidth', title: '项目宽度',width:100, sort: false ,edit:editable}
,{ field: 'saction', title: '选择动作',minWidth:200, sort: false , unresize: true, align: 'center', templet: '#TPL-dropdpwn-saction'}
,{ field: 'customizeaction', title: '自定义动作',width:100, sort: false ,edit:editable}
,{ field: 'parentidname', title: '父级ID名',width:100, sort: false ,edit:editable}
,{ field: 'fieldname', title: '字段名称',width:100, sort: false ,edit:editable}
,{ field: 'sortrank', title: '排序',width:80, sort: false ,edit:editable}
,{field: 'isthrough', title: '审核',width:80, sort: false, align:'center', templet:function(d){
return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
,{ field: 'bgcolor', title: '背景颜色',minWidth:150, sort: false , unresize: true, align: 'center', templet: '#TPL-dropdpwn-bgcolor'}
,{ field: 'noteico', title: '注释图标',minWidth:150, sort: false , unresize: true, align: 'center', templet: '#TPL-dropdpwn-noteico'}
,{ field: 'notetext', title: '注释文本',minWidth:100, sort: false ,edit:editable}
<%if checkEnLanguage() then%>
<%end if%>  
, { fixed: 'right', title: '操作', width: <%=IIF(isMobile,84,196)%>, toolbar: '#barDemo' } 
]
],
id: 'testReload',
page: true, 
limit: 200,
limits:[10,20,30,50,80,100,200,300,500],   //选择每页显示条数  或 limit: 200,
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
if(res.bjyz!=undefined){
var splxx=res.bjyz.split("=")
// console.log("splxx 0 1",splxx[0],splxx[1])
if(splxx[0]!=splxx[1]){
layer.msg("注意，栏目排序有问题"+res.bjyz, {icon: 2});  
}
}
// dropdown 方式的下拉选择
var sactionOptions = [
{id: 100, title: '编辑', value: 'edit'},
{id: 101, title: '编辑(无编辑器)', value: 'editorno'},
{id: 102, title: '删除', value: 'del'},
{id: 103, title: '复制', value: 'copyRow'},
{id: 104, title: '更多', value: 'more'},
{id: 105, title: '详细', value: 'clickviewdetail'},
{id: 106, title: '自定义', value: 'customize'}
];
dropdown.render({
elem: '.dropdpwn-saction',
// trigger: 'hover',
// 此处的 data 值，可根据 done 返回的 res 遍历来赋值
data: sactionOptions,
click: function(obj){
var data = table.getRowData(options.id, this.elem); // 获取当前行数据(如 id 等字段，以作为数据修改的索引)                
var tempData=data.saction;//原值 
var This=this;
This.elem.find('span').html(obj.title); 
submitOnLineEdit(data.id,'saction',obj.value).then(data => {  
if(data.status=="n"){  // 为假，恢复原来的值 
layer.tips(data.info, This.elem, {tips: 1});
// 查找title
var sText = '';
for(var i=0; i<sactionOptions.length; i++){
if(sactionOptions[i].value == tempData){
sText = sactionOptions[i].title;
break;
}
}
This.elem.find('span').html(sText); 
}else{                        
// 更新数据中对应的字段
data.saction = obj.title;
}
})
}
});
// dropdown 方式的下拉选择
var bgcolorOptions = [
{id: 100, title: 'normal', value: 'normal'},
{id: 101, title: 'blue', value: 'blue'},
{id: 102, title: 'orange', value: 'orange'},
{id: 103, title: 'red', value: 'red'},
{id: 104, title: 'purple', value: 'purple'}
];
dropdown.render({
elem: '.dropdpwn-bgcolor',
// trigger: 'hover',
// 此处的 data 值，可根据 done 返回的 res 遍历来赋值
data: bgcolorOptions,
click: function(obj){
var data = table.getRowData(options.id, this.elem); // 获取当前行数据(如 id 等字段，以作为数据修改的索引)                
var tempData=data.bgcolor;//原值 
var This=this;
This.elem.find('span').html(obj.title); 
submitOnLineEdit(data.id,'bgcolor',obj.value).then(data => {  
if(data.status=="n"){  // 为假，恢复原来的值 
layer.tips(data.info, This.elem, {tips: 1});
// 查找title
var sText = '';
for(var i=0; i<bgcolorOptions.length; i++){
if(bgcolorOptions[i].value == tempData){
sText = bgcolorOptions[i].title;
break;
}
}
This.elem.find('span').html(sText); 
}else{                        
// 更新数据中对应的字段
data.bgcolor = obj.title;
}
})
}
});
// dropdown 方式的下拉选择
var noteicoOptions = [
{id: 100, title: '机器人', value: 'bot'},
{id: 101, title: '叶子节点', value: 'leaf'},
{id: 102, title: '文件夹', value: 'folder'},
{id: 103, title: '文件夹打开', value: 'folder-open'},
{id: 104, title: 'Gitee', value: 'gitee'},
{id: 105, title: 'Github', value: 'github'},
{id: 106, title: '太阳/明亮', value: 'light'},
{id: 107, title: '月亮', value: 'moon'},
{id: 108, title: '错误', value: 'error'},
{id: 109, title: '成功', value: 'success'},
{id: 110, title: '问号', value: 'question'},
{id: 111, title: '锁定', value: 'lock'},
{id: 112, title: '显示', value: 'eye'},
{id: 113, title: '隐藏', value: 'eye-invisible'},
{id: 114, title: '清空/删除', value: 'clear'},
{id: 115, title: '退格', value: 'backspace'},
{id: 116, title: '禁用', value: 'disabled'},
{id: 117, title: '感叹号/提示', value: 'tips-fill'},
{id: 118, title: '测试/K线图', value: 'test'},
{id: 119, title: '音乐/音符', value: 'music'},
{id: 120, title: 'Chrome', value: 'chrome'},
{id: 121, title: 'Firefox', value: 'firefox'},
{id: 122, title: 'Edge', value: 'edge'},
{id: 123, title: 'IE', value: 'ie'},
{id: 124, title: '实心', value: 'heart-fill'},
{id: 125, title: '空心', value: 'heart'},
{id: 126, title: '时间/历史', value: 'time'},
{id: 127, title: '@艾特', value: 'at'},
{id: 128, title: '邮箱', value: 'email'},
{id: 129, title: 'RSS', value: 'rss'},
{id: 130, title: '声音', value: 'sound'},
{id: 131, title: '静音', value: 'mute'},
{id: 132, title: '录音/麦克风', value: 'mike'},
{id: 133, title: '密钥/钥匙', value: 'key'},
{id: 134, title: '礼物/活动', value: 'gift'},
{id: 135, title: '蓝牙', value: 'bluetooth'},
{id: 136, title: 'WiFi', value: 'wifi'},
{id: 137, title: '退出/注销', value: 'logout'},
{id: 138, title: 'Android 安卓', value: 'android'},
{id: 139, title: 'Apple IOS 苹果', value: 'ios'},
{id: 140, title: 'Windows', value: 'windows'},
{id: 141, title: '穿梭框', value: 'transfer'},
{id: 142, title: '客服', value: 'service'},
{id: 143, title: '减', value: 'subtraction'},
{id: 144, title: '加', value: 'addition'},
{id: 145, title: '滑块', value: 'slider'},
{id: 146, title: '打印', value: 'print'},
{id: 147, title: '导出', value: 'export'},
{id: 148, title: '列', value: 'cols'},
{id: 149, title: '退出全屏', value: 'screen-restore'},
{id: 150, title: '全屏', value: 'screen-full'},
{id: 151, title: '半星', value: 'rate-half'},
{id: 152, title: '星星-空心', value: 'rate'},
{id: 153, title: '星星-实心', value: 'rate-solid'},
{id: 154, title: '手机', value: 'cellphone'},
{id: 155, title: '验证码', value: 'vercode'},
{id: 156, title: '微信', value: 'login-wechat'},
{id: 157, title: 'QQ', value: 'login-qq'},
{id: 158, title: '微博', value: 'login-weibo'},
{id: 159, title: '密码', value: 'password'},
{id: 160, title: '用户名', value: 'username'},
{id: 161, title: '刷新-粗', value: 'refresh-3'},
{id: 162, title: '授权', value: 'auz'},
{id: 163, title: '左向右伸缩菜单', value: 'spread-left'},
{id: 164, title: '右向左伸缩菜单', value: 'shrink-right'},
{id: 165, title: '雪花', value: 'snowflake'},
{id: 166, title: '提示说明', value: 'tips'},
{id: 167, title: '便签', value: 'note'},
{id: 168, title: '主页', value: 'home'},
{id: 169, title: '高级', value: 'senior'},
{id: 170, title: '刷新', value: 'refresh'},
{id: 171, title: '刷新', value: 'refresh-1'},
{id: 172, title: '旗帜', value: 'flag'},
{id: 173, title: '主题', value: 'theme'},
{id: 174, title: '消息-通知', value: 'notice'},
{id: 175, title: '网站', value: 'website'},
{id: 176, title: '控制台', value: 'console'},
{id: 177, title: '表情-惊讶', value: 'face-surprised'},
{id: 178, title: '设置-空心', value: 'set'},
{id: 179, title: '模板', value: 'template-1'},
{id: 180, title: '应用', value: 'app'},
{id: 181, title: '模板', value: 'template'},
{id: 182, title: '赞', value: 'praise'},
{id: 183, title: '踩', value: 'tread'},
{id: 184, title: '男', value: 'male'},
{id: 185, title: '女', value: 'female'},
{id: 186, title: '相机-空心', value: 'camera'},
{id: 187, title: '相机-实心', value: 'camera-fill'},
{id: 188, title: '菜单-水平', value: 'more'},
{id: 189, title: '菜单-垂直', value: 'more-vertical'},
{id: 190, title: '金额-人民币', value: 'rmb'},
{id: 191, title: '金额-美元', value: 'dollar'},
{id: 192, title: '钻石-等级', value: 'diamond'},
{id: 193, title: '火', value: 'fire'},
{id: 194, title: '返回', value: 'return'},
{id: 195, title: '位置-地图', value: 'location'},
{id: 196, title: '办公-阅读', value: 'read'},
{id: 197, title: '调查', value: 'survey'},
{id: 198, title: '表情-微笑', value: 'face-smile'},
{id: 199, title: '表情-哭泣', value: 'face-cry'},
{id: 200, title: '购物车', value: 'cart-simple'},
{id: 201, title: '购物车', value: 'cart'},
{id: 202, title: '下一页', value: 'next'},
{id: 203, title: '上一页', value: 'prev'},
{id: 204, title: '上传-空心-拖拽', value: 'upload-drag'},
{id: 205, title: '上传-实心', value: 'upload'},
{id: 206, title: '下载-圆圈', value: 'download-circle'},
{id: 207, title: '组件', value: 'component'},
{id: 208, title: '文件-粗', value: 'file-b'},
{id: 209, title: '用户', value: 'user'},
{id: 210, title: '发现-实心', value: 'find-fill'},
{id: 211, title: 'loading', value: 'loading'},
{id: 212, title: 'loading', value: 'loading-1'},
{id: 213, title: '添加', value: 'add-1'},
{id: 214, title: '播放', value: 'play'},
{id: 215, title: '暂停', value: 'pause'},
{id: 216, title: '音频-耳机', value: 'headset'},
{id: 217, title: '视频', value: 'video'},
{id: 218, title: '语音-声音', value: 'voice'},
{id: 219, title: '消息-通知-喇叭', value: 'speaker'},
{id: 220, title: '删除线', value: 'fonts-del'},
{id: 221, title: '代码', value: 'fonts-code'},
{id: 222, title: 'HTML', value: 'fonts-html'},
{id: 223, title: '字体加粗', value: 'fonts-strong'},
{id: 224, title: '删除链接', value: 'unlink'},
{id: 225, title: '图片', value: 'picture'},
{id: 226, title: '链接', value: 'link'},
{id: 227, title: '表情-笑-粗', value: 'face-smile-b'},
{id: 228, title: '左对齐', value: 'align-left'},
{id: 229, title: '右对齐', value: 'align-right'},
{id: 230, title: '居中对齐', value: 'align-center'},
{id: 231, title: '字体-下划线', value: 'fonts-u'},
{id: 232, title: '字体-斜体', value: 'fonts-i'},
{id: 233, title: 'Tabs 选项卡', value: 'tabs'},
{id: 234, title: '单选框-选中', value: 'radio'},
{id: 235, title: '单选框-候选', value: 'circle'},
{id: 236, title: '编辑', value: 'edit'},
{id: 237, title: '分享', value: 'share'},
{id: 238, title: '删除', value: 'delete'},
{id: 239, title: '表单', value: 'form'},
{id: 240, title: '手机-细体', value: 'cellphone-fine'},
{id: 241, title: '聊天 对话 沟通', value: 'dialogue'},
{id: 242, title: '文字格式化', value: 'fonts-clear'},
{id: 243, title: '窗口', value: 'layer'},
{id: 244, title: '日期', value: 'date'},
{id: 245, title: '水 下雨', value: 'water'},
{id: 246, title: '代码-圆圈', value: 'code-circle'},
{id: 247, title: '轮播组图', value: 'carousel'},
{id: 248, title: '翻页', value: 'prev-circle'},
{id: 249, title: '布局', value: 'layouts'},
{id: 250, title: '工具', value: 'util'},
{id: 251, title: '选择模板', value: 'templeate-1'},
{id: 252, title: '上传-圆圈', value: 'upload-circle'},
{id: 253, title: '树', value: 'tree'},
{id: 254, title: '表格', value: 'table'},
{id: 255, title: '图表', value: 'chart'},
{id: 256, title: '图标 报表 屏幕', value: 'chart-screen'},
{id: 257, title: '引擎', value: 'engine'},
{id: 258, title: '下三角', value: 'triangle-d'},
{id: 259, title: '右三角', value: 'triangle-r'},
{id: 260, title: '文件', value: 'file'},
{id: 261, title: '设置-小型', value: 'set-sm'},
{id: 262, title: '减少-圆圈', value: 'reduce-circle'},
{id: 263, title: '添加-圆圈', value: 'add-circle'},
{id: 264, title: '404', value: '404'},
{id: 265, title: '关于', value: 'about'},
{id: 266, title: '箭头 向上', value: 'up'},
{id: 267, title: '箭头 向下', value: 'down'},
{id: 268, title: '箭头 向左', value: 'left'},
{id: 269, title: '箭头 向右', value: 'right'},
{id: 270, title: '圆点', value: 'circle-dot'},
{id: 271, title: '搜索', value: 'search'},
{id: 272, title: '设置-实心', value: 'set-fill'},
{id: 273, title: '群组', value: 'group'},
{id: 274, title: '好友', value: 'friends'},
{id: 275, title: '回复 评论 实心', value: 'reply-fill'},
{id: 276, title: '菜单 隐身 实心', value: 'menu-fill'},
{id: 277, title: '记录', value: 'log'},
{id: 278, title: '图片-细体', value: 'picture-fine'},
{id: 279, title: '表情-笑-细体', value: 'face-smile-fine'},
{id: 280, title: '列表', value: 'list'},
{id: 281, title: '发布 纸飞机', value: 'release'},
{id: 282, title: '对 OK', value: 'ok'},
{id: 283, title: '帮助', value: 'help'},
{id: 284, title: '客服', value: 'chat'},
{id: 285, title: 'top 置顶', value: 'top'},
{id: 286, title: '收藏-空心', value: 'star'},
{id: 287, title: '收藏-实心', value: 'star-fill'},
{id: 288, title: '关闭-实心', value: 'close-fill'},
{id: 289, title: '关闭-空心', value: 'close'},
{id: 290, title: '正确', value: 'ok-circle'},
{id: 291, title: '添加-圆圈-细体', value: 'add-circle-fine'}
];
dropdown.render({
elem: '.dropdpwn-noteico',
// trigger: 'hover',
// 此处的 data 值，可根据 done 返回的 res 遍历来赋值
data: noteicoOptions,
click: function(obj){
var data = table.getRowData(options.id, this.elem); // 获取当前行数据(如 id 等字段，以作为数据修改的索引)                
var tempData=data.noteico;//原值 
var This=this;
This.elem.find('span').html(obj.title); 
submitOnLineEdit(data.id,'noteico',obj.value).then(data => {  
if(data.status=="n"){  // 为假，恢复原来的值 
layer.tips(data.info, This.elem, {tips: 1});
// 查找title
var sText = '';
for(var i=0; i<noteicoOptions.length; i++){
if(noteicoOptions[i].value == tempData){
sText = noteicoOptions[i].title;
break;
}
}
This.elem.find('span').html(sText); 
}else{                        
// 更新数据中对应的字段
data.noteico = obj.title;
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
data: [{title: '添加',id: 'customize-9df1b0e18e95a430'}
,{title: '编辑',id: 'edit'}
,{title: '编辑(无编辑器)',id: 'editorno'}
,{title: '删除',id: 'del'}
,{title: '复制',id: 'copyRow'}
,{title: '详细',id: 'clickviewdetail'}],
click: function(menudata){ 
if (menudata.id === 'customize-9df1b0e18e95a430') {       //添加
showwin('添加<%=winTitle%>','listform.asp?layout_page_id='+obj.data['tsfield_layout_page_id']+'&amp;parentid='+obj.data['id'])
}else if (menudata.id === 'edit') {       //编辑
showwin('编辑<%=winTitle%>', 'listform.asp?id=' + pid)  //more edit
}else if (menudata.id === 'editorno') {       //编辑(无编辑器)
showwin('编辑<%=winTitle%>', 'listform.asp?id=' + pid+"&editor=no") //more no editor
}else if (menudata.id === 'del') {       //删除
handleSubmitDelIdList(pid,obj)   //删除'
}else if (menudata.id === 'copyRow') {       //复制
handleCopyRow(pid,"layout_page_id")
}else if (menudata.id === 'clickviewdetail') {       //详细
showwin2('查看详细', 'listview.asp?id=' + obj.data["id"])
}
},
align: 'right', // 右对齐弹出
style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
})
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
batchCopySelected("layout_page_id");
break;
case 'batchEdit':
batchEditSelected("parentid");
break;
case 'add':
showwin('添加<%=winTitle%>','listform.asp?layout_page_id=<%=request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100))%>')
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
//var totalPage = Math.ceil(count / (res.limit || 200)); // 假设每页10条数据
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
