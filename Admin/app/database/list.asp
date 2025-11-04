<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><%
call showCheckAdminRule(ChrW(25968)&ChrW(25454)&ChrW(32500)&ChrW(25252))

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,totalrec,id,title,idlist
dim fieldType,addsql,startIndex,endIndex,sql2,pageSize,nCount,x,maxpage,iPageSize,newTableName
dim content,splstr,tableName,fieldName,rows,sMsg
call checkPermissionRw(ChrW(27979)&ChrW(35797)&ChrW(31649)&ChrW(29702))

If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then  
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ""
i=0
content=lcase(getTableList() )

splstr=split(content,vbcrlf)
for each tableName in splstr
i=i+1
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&tableName&ChrW(93),conn,1,1
rows=IIF(isnull(rs(ChrW(116)&ChrW(112)&ChrW(118)))=true,0,rs(ChrW(116)&ChrW(112)&ChrW(118))):rs.close 
if stemp <>"" then stemp=stemp & ChrW(44) 
stemp = stemp & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & tableName & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(34) & rows & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34)& getTableComment(tableName) &ChrW(34)&ChrW(125) 
next
stemp =ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) & stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)& vbEchoTimer() &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34)& jsonCL(mysql) &ChrW(34)&ChrW(125) 
stemp=replace(stemp,ChrW(92),ChrW(92)&ChrW(92))
stemp=replace(stemp,vbcrlf,ChrW(92)&ChrW(110))
call die(stemp)

elseIf Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(100)&ChrW(105)&ChrW(99)&ChrW(116) Then  
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ""
i=0
tableName=request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101))
content=lcase(getFieldList(tableName) )

splstr=split(content,ChrW(44))
for each fieldName in splstr
if fieldName <>"" then
i=i+1
if stemp <>"" then stemp=stemp & ChrW(44) 
stemp = stemp & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & fieldName & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & getFieldAlt(tableName,fieldName) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & getFieldDefaltValue(tableName,fieldName) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34)& getTableFieldComment(tableName,fieldName) &ChrW(34)&ChrW(125) 
end if
next
stemp =ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) & stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)& vbEchoTimer() &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34)& jsonCL(mysql) &ChrW(34)&ChrW(125) 
stemp=replace(stemp,ChrW(92),ChrW(92)&ChrW(92))
stemp=replace(stemp,vbcrlf,ChrW(92)&ChrW(110))
call die(stemp) 

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(116) then
call editTableComment(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)),request(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(34920)&ChrW(27880)&ChrW(37322)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))

elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(108)&ChrW(116) then  
call editTableFieldComment(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)),request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)),request(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(34920)&ChrW(23383)&ChrW(27573)&ChrW(27880)&ChrW(37322)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101) then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22791)&ChrW(27880)&ChrW(34920)&ChrW(21450)&ChrW(23383)&ChrW(27573)&ChrW(27880)&ChrW(37322)&ChrW(25104)&ChrW(21151)&ChrW(44)& saveTableAndFieldAlt(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))) &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(74)&ChrW(105)&ChrW(101)&ChrW(71)&ChrW(111)&ChrW(117) then
call saveCrateDataBaseTable(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22791)&ChrW(27880)&ChrW(34920)&ChrW(32467)&ChrW(26500)&ChrW(25104)&ChrW(21151)&ChrW(44)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116) then
sMsg=saveDatabaseTest(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22791)&ChrW(27880)&ChrW(27979)&ChrW(35797)&ChrW(25104)&ChrW(21151)&ChrW(65292) & sMsg &ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
End if 

function saveTableAndFieldAlt(a)
dim b,c,d,e,f,g,h,i,j
if checkFolder(ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)) then
h=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)
elseif checkFolder(ChrW(47)&ChrW(100)&ChrW(111)&ChrW(99)) then
h=ChrW(47)&ChrW(100)&ChrW(111)&ChrW(99)
end if
h = h & ChrW(47)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
i=ChrW(20445)&ChrW(23384)&ChrW(36335)&ChrW(24452)&ChrW(65306) & h
b=split(a,ChrW(44))
e=ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(35)&ChrW(73)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(118)&ChrW(105)&ChrW(114)&ChrW(116)&ChrW(117)&ChrW(97)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(47)&ChrW(73)&ChrW(110)&ChrW(99)&ChrW(47)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(34)&ChrW(45)&ChrW(45)&ChrW(62) & vbcrlf
e=e & ChrW(60)&ChrW(37) & vbcrlf & ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(40)&ChrW(41) & vbcrlf
for each d in b
if d <>"" then

f=getTableComment(d)
if f <>"" then
j=d
if db_PREFIX <>"" then j=mid(j,len(db_PREFIX)+1)
e=e & ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)& j &ChrW(34)&ChrW(44)&ChrW(34)& f &ChrW(34)&ChrW(41) & vbcrlf
g=lcase(getFieldList(d) )

c=split(g,ChrW(44))
for each fieldName in c
if fieldName <>"" then
f=getTableFieldComment(d,fieldName)
if f <>"" then
e=e & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)& j &ChrW(34)&ChrW(44)&ChrW(34)& fieldName &ChrW(34)&ChrW(44)&ChrW(34)& f &ChrW(34)&ChrW(41) & vbcrlf
end if
end if
next
end if
end if
next
e=e&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(101)&ChrW(99)&ChrW(104)&ChrW(111)&ChrW(40)&ChrW(34)&ChrW(25552)&ChrW(31034)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(34920)&ChrW(40)&ChrW(23383)&ChrW(27573)&ChrW(41)&ChrW(30340)&ChrW(27880)&ChrW(37322)&ChrW(23436)&ChrW(25104)&ChrW(65281)&ChrW(34)&ChrW(41)&vbcrlf
e=e & ChrW(39)&ChrW(39029)&ChrW(38754)&ChrW(25191)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(65306) & getTimerSet() & ChrW(32)&ChrW(31186)  & vbcrlf
e=e&ChrW(37)&ChrW(62)
call writetofile(h,e,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
saveTableAndFieldAlt=i
end function
function saveDatabaseTest(a)
dim b,c,d,e,f,g,h,i,j,k
if checkFolder(ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)) then
h=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)
elseif checkFolder(ChrW(47)&ChrW(100)&ChrW(111)&ChrW(99)) then
h=ChrW(47)&ChrW(100)&ChrW(111)&ChrW(99)
end if
h = h & ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
i=ChrW(20445)&ChrW(23384)&ChrW(36335)&ChrW(24452)&ChrW(65306) & h
b=split(a,ChrW(44))
e=ChrW(60) & ChrW(37) & vbcrlf
for each d in b
if d <>"" then
k=true
if left(d,len(db_PREFIX)) = db_PREFIX then
j=d
if db_PREFIX <>"" then j=mid(j,len(db_PREFIX)+1)
g=lcase(getFieldList(d) )
e=e & j & ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) & g &ChrW(34) & vbcrlf & vbcrlf
end if
end if
next
e=e & ChrW(39)&ChrW(39029)&ChrW(38754)&ChrW(25191)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(65306) & getTimerSet() & ChrW(32)&ChrW(31186)  & vbcrlf  & vbcrlf
e=e&ChrW(37)&ChrW(62)
call writetofile(h,e,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
saveDatabaseTest=i
end function

function saveCrateDataBaseTable(a)
dim b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q
if checkFolder(ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)) then
h=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)
elseif checkFolder(ChrW(47)&ChrW(100)&ChrW(111)&ChrW(99)) then
h=ChrW(47)&ChrW(100)&ChrW(111)&ChrW(99)
end if
h = h & ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(97)&ChrW(116)&ChrW(108)&ChrW(108)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
i=ChrW(20445)&ChrW(23384)&ChrW(36335)&ChrW(24452)&ChrW(65306) & h
b=split(a,ChrW(44))
e=ChrW(60) & ChrW(37) & vbcrlf
for each d in b
if d <>"" then

f=getTableComment(d)
j=d
if db_PREFIX <>"" then j=mid(j,len(db_PREFIX)+1)
e=e & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39)& f &ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(32)&vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)& j &ChrW(34)&ChrW(32)&vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(40)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&vbcrlf
p=0
c=split(getFieldList(d),ChrW(44))
for each k in c
p=p+1
if k <>"" then
m=getTableFieldComment(d,k) 
n=getFieldAlt(d,k)
o=getFieldDefaltValue(d,k)
o=handleFieldDefaultVal(o)
if m <>"" then m=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39) & m
q=IIF(p=ubound(c),ChrW(41),ChrW(44))
if lcase(k)=ChrW(105)&ChrW(100) then
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)& q &ChrW(34) & m &vbcrlf
else
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(91)& k &ChrW(93)&ChrW(32)& n &ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)& o &""& q &ChrW(34) & m &vbcrlf
end if

end if
next
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(41)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39)&ChrW(25226)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(31867)&ChrW(22411)&ChrW(36716)&ChrW(25104)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(31867)&ChrW(22411)&vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(46)&ChrW(101)&ChrW(120)&ChrW(101)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(41)&ChrW(32)&vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102)&vbcrlf&vbcrlf
end if
next 
e=e & ChrW(39)&ChrW(39029)&ChrW(38754)&ChrW(25191)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(65306) & getTimerSet() & ChrW(32)&ChrW(31186)  & vbcrlf
e=e&ChrW(37)&ChrW(62)
call writetofile(h,e,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
end function

function handleFieldDefaultVal(a)
if left(a,1)=ChrW(40) and right(a,1)=ChrW(41) then
a=mid(a,2)
a=mid(a,1,len(a)-1)
end if
handleFieldDefaultVal=a
end function
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
top: 4px;
}
td .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {/*让列表选项位置上下居中 20230331*/
top: 4px;
} 
</style>
</head>
<body style="padding:10px 6px 30px 6px;background: #FFF">  
<div class="layui-form ">
</div>
<div class="layui-form ">
<div class="layui-card-header">
<div class="layui-btn-group">
<a class="layui-btn" data-type="databaseTable" ><i class="layui-icon layui-icon-auz"></i>备份注释</a>
<a class="layui-btn" data-type="databaseTableJieGou" ><i class="layui-icon layui-icon-auz"></i>备份结构</a>
<a class="layui-btn" data-type="databasetest"><i class="layui-icon layui-icon-rate"></i>测试</a>
<!-- 
<a class="layui-btn" id="database-imports" v-show="@system.database/imports"><i class="layui-icon layui-icon-refresh"></i> 恢复数据</a>
<a class="layui-btn" id="database-xiufu" v-show="@system.database/xiufu"><i class="layui-icon layui-icon-set"></i> 修复表</a>
<a class="layui-btn" id="database-youhua" v-show="@system.database/youhua"><i class="layui-icon layui-icon-rate"></i> 优化表</a> -->
</div>
<%
content=lcase(getTableList() )

splstr=split(content,vbcrlf)
%>
<div style="float:right;padding:10px 5px 0 0;">共<b> <%=ubound(splstr)%></b> 张表</div>
<!-- / <b>0.146</b> Mb -->
</div> 
</div>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
<script>
//重新加载表格20240524
function reloadTable(){
$('button[data-type=reload]').click();
layer.closeAll(); // 关闭所有弹窗，无论类型
}
layui.use(['form','table','upload'],function(){
var form = layui.form
table = layui.table; 
var tableName="";  //表名
//方法级渲染
table.render({
elem: '#demo',
url: '?act=list',
even: true,
cols: [
[
{type:"checkbox",fixed:"left"},
{field:"name",title: "数据表"},
{field:"comment",edit:'text',title:"数据表注释"},
// {field:"engine",align:'center',width:100,title:"存储引擎"},
// {field:"data_length",align:'center',width:110,title:"数据(Mb)",sort:true},
// {field:"index_length",align:'center',width:110,title:"索引(Mb)",sort:true},
// {field:"data_total",align:'center',width:110,title:"合计(Mb)",sort:true},
{field:"rows",align:'center',width:100,title:"记录数",sort:true},
{fixed:'right',width:90,align:'center',toolbar:'<div><a class="layui-btn layui-btn-xs" lay-event="zidian">查看字典</a></div>',title:'操作'}
]
],
id: 'testReload',
page: false,
limit: 10
});
function handleAction(httpurl){
var checkData = table.checkStatus('testReload').data;
console.log("checkData",checkData)
if (checkData.length === 0){return layer.msg('请选择需备份的数据表');}
var tables = {}, sizes = {};
var tableList='';
for (var i=0;i<checkData.length;i++){
tables[i]=checkData[i].name;
sizes[checkData[i].name]=checkData[i].data_total;
tableList+=checkData[i].name+',';
}
console.log("tables",tables,sizes)
layer.confirm('确定备份所选数据表吗？',{title:'备份数据'}, function(){
var str = '<div style="padding:20px 10px;width:300px">' + 
'<div class="layui-progress layui-progress-big" lay-showpercent="true">' +
'<div class="layui-progress-bar layui-bg-green" style="width:0%;">' +
'<span class="layui-progress-text">0%</span>'+
'</div></div><p class="ts" style="text-align:center;padding:5px 0;"></p></div>';
var layid = layer.open({type:1, title:'数据备份中请勿关闭...', content:str});
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: httpurl,
data: { tableList:tableList  },
success: function(res) {  
var n=3;
$(".ts").html("表 "+ res.count +" 备份成功，自动继续中...");
layer.msg(res.info,{shade:[0.4,'#000'],time:3000},function(){
layer.close(layid);
});
},
error: function(jqXHR, textStatus, errorThrown) { // 请求失败时的回调函数  
alert('Error: ' + textStatus + ' - ' + errorThrown);  
}  
});
})
}
var $ = layui.$,
active = {
databaseTable: function() { 
handleAction("?act=databaseTable")
},
databaseTableJieGou:function(){
handleAction("?act=databaseTableJieGou")
},
databasetest:function(){
handleAction("?act=databasetest")
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
tableName=data.name;//表名
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
console.log('obj',obj)
obj.del();
break;
}
}
});
layer.close(index);
});
} else if (obj.event === 'zidian') {
layer.open({
type: 1,
title: '数据表字典 - ' + data.name + ' - ' + data.comment,
area: ['800px', '600px'],
content: '<div class="layui-form" lay-filter="database_open_dict_info" id="database_open_dict_info" style="padding:10px 20px;"><table lay-filter="database_dict" id="database_dict"></table></div>',
success: function(){
table.render({
elem: '#database_dict',
url: '?act=dict&table=' + data.name,
size: 'sm',
cols: [[
{field:"field",title:"字段名"},
{field:"type",title:"字段类型"},
{field:"default",align:'center',width:80,title:"默认值"},
{field:"null",align:'center',width:80,title:"允许非空"},
{field:"extra",align:'center',width:80,title:"自动递增",templet:function(d){return d.extra=='auto_increment'?'是':''}},
{field:"comment",title:"备注",edit:'text'}
]]
});
}
});
}
});
//监听单元格编辑
table.on('edit(demo)', function(obj){ 
var This=this;
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=editTableAlt",
data: { table:obj.data.name,note:obj.value  },
success: function(data) {
switch (data.status) {
case "y": 
// layer.msg(data.info,{
//     icon:1,
//     time:1500, 
//     shade:[0.4,'#000'],
//     shadeClose: true, // 点击遮罩层关闭  
// });
layer.msg(data.info,{shade:[0.4,'#000'],time:1500});
// layer.tips(data.info, This, {tips: 1});
break;
case "n": 
layer.msg(data.info, {icon: 2}); 
obj.reedit(); 
break;
}
}
}); 
});
//监听单元格编辑
table.on('edit(database_dict)', function(obj){   
var This=this;
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=editFieldAlt",
data: { table:tableName, field:obj.data.field, fieldtype:obj.data.type, note:obj.value  },
success: function(data) {
switch (data.status) {
case "y": 
// layer.msg(data.info,{
//     icon:1,
//     time:1500, 
//     shade:[0.4,'#000'],
//     shadeClose: true, // 点击遮罩层关闭  
// });
layer.msg(data.info,{shade:[0.4,'#000'],time:1500});
// layer.tips(data.info, This, {tips: 1});
break;
case "n": 
layer.msg(data.info, {icon: 2}); 
obj.reedit(); 
break;
}
}
}); 
});
});
</script>
<script type="text/javascript" src="../../js/pc.js?v20240430"></script>  
</body>
</html>
