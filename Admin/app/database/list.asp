<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><%













call openconn() 

dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,totalrec,id,title,idlist
dim fieldType,addsql,startIndex,endIndex,sql2,pageSize,nCount,x,maxpage,iPageSize,newTableName,oldTableName,renameSql
dim content,splstr,tableName,fieldName,rows,sMsg,fieldDefault,fieldComment,fieldNullable,fieldAutoIncr
dim winTitle:winTitle=ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(32467)&ChrW(26500)&ChrW(32500)&ChrW(25252)

call showCheckAdminRule(winTitle&ChrW(21015)&ChrW(34920))



Select case LCase(Request(ChrW(97)&ChrW(99)&ChrW(116)))
Case ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)                : call handleList()
Case ChrW(100)&ChrW(105)&ChrW(99)&ChrW(116)                : call handleDict()
Case ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(108)&ChrW(116)        : call handleEditTableAlt()
Case ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(97)&ChrW(108)&ChrW(116)        : call handleEditFieldAlt()
Case ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(121)   : call handleEditFieldProperty()
Case ChrW(100)&ChrW(101)&ChrW(108)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)            : call handleDelTable()
Case ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)       : call handleEditTableName()
Case ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)       : call handleDatabaseTable()
Case ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(106)&ChrW(105)&ChrW(101)&ChrW(103)&ChrW(111)&ChrW(117) : call handleDatabaseTableJieGou()
Case ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)        : call handleDatabaseTest()
End select



sub handleList()
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ""
i = 0
content = lcase(getTableList())
splstr = split(content, vbcrlf)
for each tableName in splstr
if tableName <> "" then
i = i + 1
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & getTableFieldFuHao(tableName), conn, 1, 1
rows = IIF(isnull(rs(ChrW(116)&ChrW(112)&ChrW(118)))=true,0,rs(ChrW(116)&ChrW(112)&ChrW(118))):rs.close 
dim a
a = getTableComment(tableName)
tableName = replace(replace(replace(replace(tableName,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
a = replace(replace(replace(replace(a,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
if stemp <> "" then stemp = stemp & ChrW(44)
stemp = stemp & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & tableName & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(34) & rows & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & a & ChrW(34)&ChrW(125)
end if
next
stemp = ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) & stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34) & vbEchoTimer() & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(mysql) & ChrW(34)&ChrW(125)
call die(stemp)
end sub

function getTableFieldFuHao(a)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
getTableFieldFuHao=ChrW(96)&a&ChrW(96)
else
getTableFieldFuHao=ChrW(91)&a&ChrW(93)
end if
end function



sub handleDict()
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ""
i = 0
tableName = request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101))
content = lcase(getFieldList(tableName))
splstr = split(content, ChrW(44))
for each fieldName in splstr
if fieldName <> "" then
i = i + 1
fieldType    = getFieldAlt(tableName, fieldName)
fieldDefault = getFieldDefaltValue(tableName, fieldName)
fieldComment = getTableFieldComment(tableName, fieldName)
fieldNullable = getFieldNullable(tableName, fieldName)
fieldAutoIncr = getFieldAutoIncrement(tableName, fieldName)
fieldName    = IIF(isNul(fieldName),"",fieldName)
fieldType    = IIF(isNul(fieldType),"",fieldType)
fieldDefault = IIF(isNul(fieldDefault),"",fieldDefault)
fieldComment = IIF(isNul(fieldComment),"",fieldComment)
fieldNullable = IIF(isNul(fieldNullable),ChrW(78)&ChrW(79),fieldNullable)
fieldAutoIncr = IIF(isNul(fieldAutoIncr),"",fieldAutoIncr)
fieldName    = replace(replace(replace(replace(fieldName,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
fieldType    = replace(replace(replace(replace(fieldType,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
fieldDefault = replace(replace(replace(replace(fieldDefault,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
fieldComment = replace(replace(replace(replace(fieldComment,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
fieldNullable = replace(replace(replace(replace(fieldNullable,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
fieldAutoIncr = replace(replace(replace(replace(fieldAutoIncr,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
if stemp <> "" then stemp = stemp & ChrW(44)
stemp = stemp & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & fieldName & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & fieldType & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & fieldDefault & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34) & fieldNullable & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(34) & fieldAutoIncr & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & fieldComment & ChrW(34)&ChrW(125)
end if
next
stemp = ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91) & stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & i & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34) & vbEchoTimer() & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34) & jsonCL(mysql) & ChrW(34)&ChrW(125)
call die(stemp)
end sub



sub handleEditTableAlt()
dim a,b
a = trim(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)))
b = request(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))
if a = "" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(34920)&ChrW(21517)&ChrW(19981)&ChrW(33021)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
if checkAdminRule(ChrW(32534)&ChrW(36753) & winTitle)=false then 
call addSystemLog(a,ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(40)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(41)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40)&ChrW(34920)&ChrW(27880)&ChrW(37322)&ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40) & a & ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
call editTableComment(a, b)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(34920)&ChrW(27880)&ChrW(37322)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end sub



sub handleEditFieldAlt()
dim a,b,c
a = trim(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)))
b = trim(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)))
c = request(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))
if a = "" or b = "" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(34920)&ChrW(21517)&ChrW(21644)&ChrW(23383)&ChrW(27573)&ChrW(21517)&ChrW(19981)&ChrW(33021)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
if checkAdminRule(ChrW(32534)&ChrW(36753) & winTitle)=false then 
call addSystemLog(a,ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(40)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(41)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40) & b & ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40) & a & ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
call editTableFieldComment(a, b, c)
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(34920)&ChrW(23383)&ChrW(27573)&ChrW(27880)&ChrW(37322)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end sub



sub handleEditFieldProperty()
dim a, b, c, d, e, f
dim g, h, i
a = trim(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)))
b = trim(request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)))
c = trim(request(ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)))
d = trim(request(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)))
e = trim(request(ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108)))
f = trim(request(ChrW(101)&ChrW(120)&ChrW(116)&ChrW(114)&ChrW(97)))
if a = "" or b = "" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(34920)&ChrW(21517)&ChrW(21644)&ChrW(23383)&ChrW(27573)&ChrW(21517)&ChrW(19981)&ChrW(33021)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
if checkAdminRule(ChrW(32534)&ChrW(36753) & winTitle)=false then 
call addSystemLog(a,ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(40)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(41)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40) & b & ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40) & a & ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
on error resume next
i = false

if databaseType = ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then

h = ChrW(65)&ChrW(76)&ChrW(84)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32)&ChrW(96) & a & ChrW(96)&ChrW(32)&ChrW(77)&ChrW(79)&ChrW(68)&ChrW(73)&ChrW(70)&ChrW(89)&ChrW(32)&ChrW(67)&ChrW(79)&ChrW(76)&ChrW(85)&ChrW(77)&ChrW(78)&ChrW(32)&ChrW(96) & b & ChrW(96)&ChrW(32)
if c <> "" then
h = h & c
else

h = h & getFieldAlt(a, b)
end if

if e = ChrW(89)&ChrW(69)&ChrW(83) then
h = h & ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)
else
h = h & ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)
end if

if d <> "" then
if lcase(d) = ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108) then
h = h & ChrW(32)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(65)&ChrW(85)&ChrW(76)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)
elseif isnumeric(d) or left(d,1) = ChrW(39) then
h = h & ChrW(32)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(65)&ChrW(85)&ChrW(76)&ChrW(84)&ChrW(32) & d
else
h = h & ChrW(32)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(65)&ChrW(85)&ChrW(76)&ChrW(84)&ChrW(32)&ChrW(39) & replace(d,ChrW(39),ChrW(39)&ChrW(39)) & ChrW(39)
end if
end if

if f = ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116) then
h = h & ChrW(32)&ChrW(65)&ChrW(85)&ChrW(84)&ChrW(79)&ChrW(95)&ChrW(73)&ChrW(78)&ChrW(67)&ChrW(82)&ChrW(69)&ChrW(77)&ChrW(69)&ChrW(78)&ChrW(84)
end if
elseif databaseType = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then

h = ChrW(65)&ChrW(76)&ChrW(84)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32)&ChrW(65)&ChrW(76)&ChrW(84)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(67)&ChrW(79)&ChrW(76)&ChrW(85)&ChrW(77)&ChrW(78)&ChrW(32)&ChrW(91) & b & ChrW(93)&ChrW(32)
if c <> "" then
h = h & c
else
h = h & getFieldAlt(a, b)
end if

if e = ChrW(89)&ChrW(69)&ChrW(83) then
h = h & ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)
else
h = h & ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)
end if

if d <> "" then
dim j
j = ChrW(68)&ChrW(70)&ChrW(95) & a & ChrW(95) & b

conn.execute ChrW(65)&ChrW(76)&ChrW(84)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32)&ChrW(68)&ChrW(82)&ChrW(79)&ChrW(80)&ChrW(32)&ChrW(67)&ChrW(79)&ChrW(78)&ChrW(83)&ChrW(84)&ChrW(82)&ChrW(65)&ChrW(73)&ChrW(78)&ChrW(84)&ChrW(32) & j

if lcase(d) = ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108) then

elseif isnumeric(d) then
conn.execute ChrW(65)&ChrW(76)&ChrW(84)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32)&ChrW(65)&ChrW(68)&ChrW(68)&ChrW(32)&ChrW(67)&ChrW(79)&ChrW(78)&ChrW(83)&ChrW(84)&ChrW(82)&ChrW(65)&ChrW(73)&ChrW(78)&ChrW(84)&ChrW(32) & j & ChrW(32)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(65)&ChrW(85)&ChrW(76)&ChrW(84)&ChrW(32) & d & ChrW(32)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(32)&ChrW(91) & b & ChrW(93)
else
conn.execute ChrW(65)&ChrW(76)&ChrW(84)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32)&ChrW(91) & a & ChrW(93)&ChrW(32)&ChrW(65)&ChrW(68)&ChrW(68)&ChrW(32)&ChrW(67)&ChrW(79)&ChrW(78)&ChrW(83)&ChrW(84)&ChrW(82)&ChrW(65)&ChrW(73)&ChrW(78)&ChrW(84)&ChrW(32) & j & ChrW(32)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(65)&ChrW(85)&ChrW(76)&ChrW(84)&ChrW(32)&ChrW(39) & replace(d,ChrW(39),ChrW(39)&ChrW(39)) & ChrW(39)&ChrW(32)&ChrW(70)&ChrW(79)&ChrW(82)&ChrW(32)&ChrW(91) & b & ChrW(93)
end if
end if
elseif databaseType = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) then


if c <> "" then
dim k
k = c
if e = ChrW(89)&ChrW(69)&ChrW(83) then
k = k & ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)
else
k = k & ChrW(32)&ChrW(78)&ChrW(79)&ChrW(84)&ChrW(32)&ChrW(78)&ChrW(85)&ChrW(76)&ChrW(76)
end if
if d <> "" and lcase(d) <> ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108) then
if isnumeric(d) then
k = k & ChrW(32)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(65)&ChrW(85)&ChrW(76)&ChrW(84)&ChrW(32) & d
else
k = k & ChrW(32)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(65)&ChrW(85)&ChrW(76)&ChrW(84)&ChrW(32)&ChrW(39) & replace(d,ChrW(39),ChrW(39)&ChrW(39)) & ChrW(39)
end if
end if
i = editFieldTypeDefault(a, b, k)
end if
end if

if h <> "" then
conn.execute h
if Err.Number = 0 then
i = true
end if
end if
if i or Err.Number = 0 then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(23383)&ChrW(27573)&ChrW(23646)&ChrW(24615)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
else
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(23383)&ChrW(27573)&ChrW(23646)&ChrW(24615)&ChrW(22833)&ChrW(36133)&ChrW(65306) & jsonCL(err.description) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
end sub



sub handleDelTable()
dim a,b
a = trim(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)))
if a = "" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(34920)&ChrW(21517)&ChrW(19981)&ChrW(33021)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
if checkAdminRule(ChrW(21024)&ChrW(38500) & winTitle)=false then 
call addSystemLog(a,ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133)&ChrW(40)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(21024)&ChrW(38500)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(41)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40)&ChrW(45)&ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40) & a & ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(21024)&ChrW(38500)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
on error resume next
if lcase(databaseType) = ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
b = ChrW(68)&ChrW(82)&ChrW(79)&ChrW(80)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32)&ChrW(96) & a & ChrW(96)
else
b = ChrW(68)&ChrW(82)&ChrW(79)&ChrW(80)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32)&ChrW(91) & a & ChrW(93)
end if
conn.execute b
if err.number <> 0 then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(34920)&ChrW(22833)&ChrW(36133)&ChrW(65306) & jsonCL(err.description) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(21024)&ChrW(38500)&ChrW(34920)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end sub



sub handleEditTableName()
oldTableName = trim(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)))
newTableName = trim(request(ChrW(110)&ChrW(101)&ChrW(119)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)))
if oldTableName = "" or newTableName = "" then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(34920)&ChrW(21517)&ChrW(19981)&ChrW(33021)&ChrW(20026)&ChrW(31354)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
if lcase(oldTableName) = lcase(newTableName) then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(26032)&ChrW(34920)&ChrW(21517)&ChrW(19981)&ChrW(33021)&ChrW(19982)&ChrW(21407)&ChrW(34920)&ChrW(21517)&ChrW(30456)&ChrW(21516)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
if checkAdminRule(ChrW(32534)&ChrW(36753) & winTitle)=false then 
call addSystemLog(oldTableName,ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(40)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(41)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(40)&ChrW(34920)&ChrW(21517)&ChrW(41)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40) & oldTableName & ChrW(45)&ChrW(62) & newTableName & ChrW(41))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(32534)&ChrW(36753)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(27809)&ChrW(26377)&ChrW(12304)&ChrW(32534)&ChrW(36753)&winTitle&ChrW(12305)&ChrW(26435)&ChrW(38480)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
on error resume next
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
renameSql = ChrW(82)&ChrW(69)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69)&ChrW(32)&ChrW(84)&ChrW(65)&ChrW(66)&ChrW(76)&ChrW(69)&ChrW(32)&ChrW(96) & oldTableName & ChrW(96)&ChrW(32)&ChrW(84)&ChrW(79)&ChrW(32)&ChrW(96) & newTableName & ChrW(96)
conn.execute renameSql
elseif databaseType=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then
renameSql = ChrW(69)&ChrW(88)&ChrW(69)&ChrW(67)&ChrW(32)&ChrW(115)&ChrW(112)&ChrW(95)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(39) & oldTableName & ChrW(39)&ChrW(44)&ChrW(39) & newTableName & ChrW(39)
conn.execute renameSql
elseif databaseType=ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) then
call renameAccessTable(oldTableName,newTableName)
end if
if err.number <> 0 then
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(34920)&ChrW(21517)&ChrW(22833)&ChrW(36133)&ChrW(65306) & jsonCL(err.description) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125))
end if
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(34920)&ChrW(21517)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end sub



sub handleDatabaseTable()
dim a
a = saveTableAndFieldAlt(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)))
call die(a)
end sub



sub handleDatabaseTableJieGou()
dim a
a = saveCrateDataBaseTable(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)))
call die(a)
end sub



sub handleDatabaseTest()
sMsg = saveDatabaseTest(request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)))
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22791)&ChrW(27880)&ChrW(27979)&ChrW(35797)&ChrW(25104)&ChrW(21151)&ChrW(65292) & sMsg & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end sub






function saveTableAndFieldAlt(a)
dim b,c,d,e,f,g,h,i,j
dim k,l,m,n,o,p
dim q,r,s,t

if checkFolder(ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)) then
h=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)
elseif checkFolder(ChrW(47)&ChrW(100)&ChrW(111)&ChrW(99)) then
h=ChrW(47)&ChrW(100)&ChrW(111)&ChrW(99)
end if
h = h & ChrW(47)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
i=ChrW(20445)&ChrW(23384)&ChrW(36335)&ChrW(24452)&ChrW(65306) & h

b=split(a,ChrW(44))

k = ""
n = 0
o = 0
p = ""

e=ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(35)&ChrW(73)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(118)&ChrW(105)&ChrW(114)&ChrW(116)&ChrW(117)&ChrW(97)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(47)&ChrW(73)&ChrW(110)&ChrW(99)&ChrW(47)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(34)&ChrW(45)&ChrW(45)&ChrW(62) & vbcrlf
e=e & ChrW(60)&ChrW(37) & vbcrlf & ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(40)&ChrW(41) & vbcrlf

for each d in b

d = trim(d)
if d <>"" then

q=getTableComment(d)
s = (q <>"")
if s then
t=""

j=d

if db_PREFIX <>"" and len(j) > len(db_PREFIX) then
if left(lcase(j),len(db_PREFIX)) = lcase(db_PREFIX) then
j=mid(j,len(db_PREFIX)+1)
t=ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(32)
end if
end if

if j="" then j=d

e=e & ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(40)&t& ChrW(34)&j &ChrW(34)&ChrW(44)&ChrW(34)& q &ChrW(34)&ChrW(41) & vbcrlf

g=lcase(getFieldList(d) )
c=split(g,ChrW(44))

m = 0

for each r in c
if r <>"" then
f=getTableFieldComment(d,r)
if f <>"" then
e=e & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)& j &ChrW(34)&ChrW(44)&ChrW(34)& r &ChrW(34)&ChrW(44)&ChrW(34)& f &ChrW(34)&ChrW(41) & vbcrlf
m = m + 1
o = o + 1
end if
end if
next

n = n + 1
if p <>"" then p = p & ChrW(44)

dim u,v
u = replace(replace(replace(replace(d,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
v = replace(replace(replace(replace(q,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
p = p & ChrW(123)&ChrW(34)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & u & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & v & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(34) & m & ChrW(34)&ChrW(125)
if k <>"" then k = k & ChrW(12289)
k = k & d & ChrW(40) & m & ChrW(20010)&ChrW(23383)&ChrW(27573)&ChrW(41)
end if
end if
next

e=e&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(101)&ChrW(99)&ChrW(104)&ChrW(111)&ChrW(40)&ChrW(34)&ChrW(25552)&ChrW(31034)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(20462)&ChrW(25913)&ChrW(34920)&ChrW(40)&ChrW(23383)&ChrW(27573)&ChrW(41)&ChrW(30340)&ChrW(27880)&ChrW(37322)&ChrW(23436)&ChrW(25104)&ChrW(65281)&ChrW(34)&ChrW(41)&vbcrlf
e=e & ChrW(39)&ChrW(39029)&ChrW(38754)&ChrW(25191)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(65306) & getTimerSet() & ChrW(32)&ChrW(31186)  & vbcrlf
e=e&ChrW(37)&ChrW(62)

call writetofile(h,e,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))

dim w,x,y

x = replace(replace(h,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34))
y = replace(replace(replace(replace(k,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
w = ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22791)&ChrW(20221)&ChrW(34920)&ChrW(21450)&ChrW(23383)&ChrW(27573)&ChrW(27880)&ChrW(37322)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(44)
w = w & ChrW(34)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34) & x & ChrW(34)&ChrW(44) 
w = w & ChrW(34)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34) & n & ChrW(34)&ChrW(44)
w = w & ChrW(34)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34) & o & ChrW(34)&ChrW(44)
w = w & ChrW(34)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(91) & p & ChrW(93)&ChrW(44)
w = w & ChrW(34)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34) & y & ChrW(34)&ChrW(125)
saveTableAndFieldAlt=w
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
dim r,s,t,u,v,w,x,y

if checkFolder(ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)) then
h=ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)
elseif checkFolder(ChrW(47)&ChrW(100)&ChrW(111)&ChrW(99)) then
h=ChrW(47)&ChrW(100)&ChrW(111)&ChrW(99)
end if
h = h & ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(97)&ChrW(116)&ChrW(108)&ChrW(108)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
i=ChrW(20445)&ChrW(23384)&ChrW(36335)&ChrW(24452)&ChrW(65306) & h
b=split(a,ChrW(44))

r = 0
s = 0
t = ""

e=ChrW(60) & ChrW(37) & vbcrlf

for each d in b

d = trim(d)
if d <>"" then

f=getTableComment(d)

j=d

if db_PREFIX <>"" and len(j) > len(db_PREFIX) then
if left(lcase(j),len(db_PREFIX)) = lcase(db_PREFIX) then
j=mid(j,len(db_PREFIX)+1)
end if
end if

if j="" then j=d

e=e & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39)& f &ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(32)&vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)& j &ChrW(34)&ChrW(32)&vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(40)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&vbcrlf

p=0
u = 0
c=split(getFieldList(d),ChrW(44))

for each k in c
p=p+1
if k <>"" then
u = u + 1
s = s + 1

m=getTableFieldComment(d,k) 
n=getFieldAlt(d,k)
o=getFieldDefaltValue(d,k)
if isNul(o)=false then
o=replace(o,ChrW(34),ChrW(34)&ChrW(34))
end if

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

r = r + 1
if t <>"" then t = t & ChrW(44)
v = replace(replace(replace(replace(d,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
w = replace(replace(replace(replace(f,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34)),vbcrlf,ChrW(92)&ChrW(110)),vbcr,ChrW(92)&ChrW(110))
t = t & ChrW(123)&ChrW(34)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & v & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & w & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(34) & u & ChrW(34)&ChrW(125)
end if
next 

e=e & ChrW(39)&ChrW(39029)&ChrW(38754)&ChrW(25191)&ChrW(34892)&ChrW(26102)&ChrW(38388)&ChrW(65306) & getTimerSet() & ChrW(32)&ChrW(31186)  & vbcrlf
e=e&ChrW(37)&ChrW(62)

call writetofile(h,e,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))

x = replace(replace(h,ChrW(92),ChrW(92)&ChrW(92)),ChrW(34),ChrW(92)&ChrW(34))
y = ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(22791)&ChrW(20221)&ChrW(34920)&ChrW(32467)&ChrW(26500)&ChrW(25104)&ChrW(21151)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(44)
y = y & ChrW(34)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34) & x & ChrW(34)&ChrW(44)
y = y & ChrW(34)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34) & r & ChrW(34)&ChrW(44)
y = y & ChrW(34)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34) & s & ChrW(34)&ChrW(44)
y = y & ChrW(34)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(91) & t & ChrW(93)&ChrW(125)
saveCrateDataBaseTable=y
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
<!-- 字段类型下拉模板 -->
<script type="text/html" id="TPL-dict-type">
<button class="layui-btn layui-btn-primary layui-btn-xs dict-type-dropdown" data-field="{{d.field}}">
<span>{{d.type || 'Int'}}</span>
<i class="layui-icon layui-icon-down layui-font-12"></i>
</button>
</script>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
<script>
//==========================================
// 前端JavaScript代码
// 功能：数据库表管理的前端交互逻辑
//==========================================
/**
* 重新加载表格
* 功能：刷新表格数据并关闭所有弹窗
* 日期：20240524
* 更新：20241120 如果Layui表格已初始化则直接重载
*/
function reloadTable(){
if (window.layui && layui.table){
layui.table.reload('testReload');
}else{
$('button[data-type=reload]').click();
}
layer.closeAll(); // 关闭所有弹窗，无论类型
}
// 初始化Layui模块
layui.use(['form','table','upload','dropdown'],function(){
var form = layui.form
table = layui.table
dropdown = layui.dropdown; 
var tableName="";  // 当前选中的表名
//==========================================
// 初始化数据表格
// 功能：渲染数据库表列表，支持在线编辑注释
//==========================================
table.render({
elem: '#demo',
url: '?act=list',
even: true,
cols: [
[
{type:"checkbox",fixed:"left"},                    // 复选框列
{field:"name",title: "数据表"},                    // 表名列
{field:"comment",edit:'text',title:"数据表注释"},  // 表注释列（可编辑）
// 以下字段已注释，可根据需要启用
// {field:"engine",align:'center',width:100,title:"存储引擎"},
// {field:"data_length",align:'center',width:110,title:"数据(Mb)",sort:true},
// {field:"index_length",align:'center',width:110,title:"索引(Mb)",sort:true},
// {field:"data_total",align:'center',width:110,title:"合计(Mb)",sort:true},
{field:"rows",align:'center',width:100,title:"记录数",sort:true},  // 记录数列（可排序）
{fixed:'right',width:210,align:'center',toolbar:'<div><a class="layui-btn layui-btn-xs" lay-event="zidian">查看字典</a><a class="layui-btn layui-btn-xs layui-bg-blue" lay-event="editTable">修改表</a><a class="layui-btn layui-btn-xs layui-bg-red" lay-event="delTable">删除表</a></div>',title:'操作'}  // 操作列（查看字典/修改表/删除表）
]
],
id: 'testReload',  // 表格ID（用于重载）
page: false,        // 关闭分页
limit: 10           // 每页显示数量（虽然关闭了分页）
});
//==========================================
// 处理批量操作（备份注释、备份结构、测试）
// 参数：httpurl - 后端接口地址
// 功能：获取选中的表，发送AJAX请求执行相应操作
//==========================================
function handleAction(httpurl){
// 获取选中的表格数据
var checkData = table.checkStatus('testReload').data;
console.log("checkData",checkData)
// 检查是否选择了表
if (checkData.length === 0){
return layer.msg('请选择需备份的数据表');
}
// 构建表列表
var tables = {}, sizes = {};
var tableList='';
for (var i=0;i<checkData.length;i++){
tables[i]=checkData[i].name;
sizes[checkData[i].name]=checkData[i].data_total;
tableList+=checkData[i].name+',';
}
console.log("tables",tables,sizes)
// 根据操作类型确定确认提示文本
var confirmTitle = '备份数据';
var confirmMsg = '确定备份所选数据表吗？';
var processTitle = '数据备份中请勿关闭...';
var detailTitle = '操作详情';
var operationType = '';
if (httpurl.indexOf('act=databaseTable') !== -1) {
confirmTitle = '备份注释';
confirmMsg = '你确认要备份注释吗？';
processTitle = '正在备份注释，请稍候...';
detailTitle = '备份注释操作详情';
operationType = 'backupComment';
} else if (httpurl.indexOf('act=databaseTableJieGou') !== -1) {
confirmTitle = '备份结构';
confirmMsg = '你确认要备份结构吗？';
processTitle = '正在备份结构，请稍候...';
detailTitle = '备份结构操作详情';
operationType = 'backupStructure';
}
// 确认对话框
layer.confirm(confirmMsg, {title: confirmTitle, icon: 3}, function(index){
// 关闭确认弹窗
layer.close(index);
// 显示处理中提示
var str = '<div style="padding:30px 20px;text-align:center;width:350px">' + 
'<div style="font-size:16px;color:#1E9FFF;margin-bottom:15px;"><i class="layui-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop" style="font-size:20px;"></i> 正在处理中...</div>' +
'<div class="layui-progress layui-progress-big" lay-showpercent="true" style="margin-top:20px;">' +
'<div class="layui-progress-bar layui-bg-green" lay-percent="0%">' +
'<span class="layui-progress-text">0%</span>'+
'</div></div><p class="ts" style="text-align:center;padding:10px 0;color:#999;font-size:12px;">请稍候，正在处理数据...</p></div>';
var layid = layer.open({
type: 1, 
title: processTitle, 
content: str,
closeBtn: 0,
shadeClose: false
});
// 发送AJAX请求
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: httpurl,
data: { tableList:tableList  },
success: function(res) {  
// 关闭处理中弹窗
layer.close(layid);
// HTML转义函数
function escapeHtml(text) {
if (!text) return '';
var map = {
'&': '&amp;',
'<': '&lt;',
'>': '&gt;',
'"': '&quot;',
"'": '&#039;'
};
return String(text).replace(/[&<>"']/g, function(m) { return map[m]; });
}
// 如果是备份注释或备份结构操作，显示详细弹窗
if ((operationType === 'backupComment' || operationType === 'backupStructure') && res.tables) {
// 构建详细信息的HTML
var detailHtml = '<div style="padding: 20px; line-height: 28px;">';
detailHtml += '<div style="margin-bottom: 15px;"><strong style="color: #1E9FFF;font-size:16px;">操作完成！</strong></div>';
detailHtml += '<div style="margin-bottom: 10px;"><strong>保存路径：</strong><span style="color: #5FB878;word-break:break-all;">' + escapeHtml(res.savePath) + '</span></div>';
if (operationType === 'backupComment') {
detailHtml += '<div style="margin-bottom: 10px;"><strong>处理统计：</strong>共处理 <span style="color: #FF5722;">' + res.totalTables + '</span> 张表，<span style="color: #FF5722;">' + res.totalFields + '</span> 个字段注释</div>';
} else {
detailHtml += '<div style="margin-bottom: 10px;"><strong>处理统计：</strong>共处理 <span style="color: #FF5722;">' + res.totalTables + '</span> 张表，<span style="color: #FF5722;">' + res.totalFields + '</span> 个字段</div>';
}
detailHtml += '<div style="margin-bottom: 15px;"><strong>操作的表：</strong></div>';
detailHtml += '<div style="max-height: 300px; overflow-y: auto; border: 1px solid #e6e6e6; padding: 10px; background: #f8f8f8;">';
// 遍历显示每个表的详细信息
if (res.tables && res.tables.length > 0) {
detailHtml += '<table style="width: 100%; border-collapse: collapse;">';
detailHtml += '<tr style="background: #f0f0f0;"><th style="padding: 8px; text-align: left; border-bottom: 1px solid #ddd;">表名</th><th style="padding: 8px; text-align: left; border-bottom: 1px solid #ddd;">表注释</th><th style="padding: 8px; text-align: center; border-bottom: 1px solid #ddd;">字段数</th></tr>';
for (var i = 0; i < res.tables.length; i++) {
var table = res.tables[i];
detailHtml += '<tr>';
detailHtml += '<td style="padding: 8px; border-bottom: 1px solid #eee;"><strong>' + escapeHtml(table.name) + '</strong></td>';
detailHtml += '<td style="padding: 8px; border-bottom: 1px solid #eee;">' + escapeHtml(table.comment || '无注释') + '</td>';
detailHtml += '<td style="padding: 8px; text-align: center; border-bottom: 1px solid #eee;"><span style="color: #5FB878;">' + escapeHtml(table.fields) + '</span></td>';
detailHtml += '</tr>';
}
detailHtml += '</table>';
} else {
detailHtml += '<div style="color: #999; text-align: center; padding: 20px;">暂无数据</div>';
}
detailHtml += '</div>';
detailHtml += '</div>';
// 显示详细弹窗
layer.open({
type: 1,
title: detailTitle,
area: ['700px', '500px'],
content: detailHtml,
btn: ['确定'],
yes: function(index) {
layer.close(index);
}
});
} else {
// 其他操作保持原来的简单提示
layer.msg(res.info,{shade:[0.4,'#000'],time:3000});
}
},
error: function(jqXHR, textStatus, errorThrown) { 
// 请求失败时的回调函数
layer.close(layid);
layer.msg('操作失败：' + textStatus + ' - ' + errorThrown, {icon: 2});
}  
});
});
}
//==========================================
// 按钮操作映射
// 功能：将按钮点击事件映射到对应的处理函数
//==========================================
var $ = layui.$,
active = {
// 备份注释按钮
databaseTable: function() { 
handleAction("?act=databaseTable")
},
// 备份结构按钮
databaseTableJieGou:function(){
handleAction("?act=databaseTableJieGou")
},
// 测试按钮
databasetest:function(){
handleAction("?act=databasetest")
}
};
// 绑定按钮点击事件
$('.layui-form .layui-btn').on('click', function() {
var type = $(this).data('type');
active[type] ? active[type].call(this) : '';
});
//==========================================
// 监听行工具事件
// 功能：处理表格行的操作按钮点击事件
//==========================================
table.on('tool(demo)', function(obj) {
var data = obj.data;
var pid = obj.data["id"]
tableName=data.name;  // 保存当前表名，供后续使用
// 查看字典操作
if (obj.event === 'zidian') {
// 打开弹窗显示表字段字典
layer.open({
type: 1,
title: '数据表字典 - ' + data.name + ' - ' + data.comment,
area: ['800px', '600px'],
content: '<div class="layui-form" lay-filter="database_open_dict_info" id="database_open_dict_info" style="padding:10px 20px;"><table lay-filter="database_dict" id="database_dict"></table></div>',
success: function(){
// 在弹窗中渲染字段列表表格
var dictTableOptions = {
elem: '#database_dict',
url: '?act=dict&table=' + data.name,  // 获取字段列表的接口
size: 'sm',
cols: [[
{field:"field",title:"字段名",width:120},
{field:"type",title:"字段类型",width:150,
templet: '#TPL-dict-type'
},
{field:"default",align:'center',title:"默认值",edit:'text',width:120},
{field:"null",align:'center',title:"允许非空",width:100,
templet:function(d){
if(!d || d === null || d === undefined) return '<span class="dict-null-toggle layui-badge layui-bg-gray" data-field="' + (d.field || '') + '" data-value="NO">否</span>';
try {
var nullVal = null;
if (d.hasOwnProperty && d.hasOwnProperty('null')) {
nullVal = d['null'];
} else if ('null' in d) {
nullVal = d['null'];
} else {
nullVal = 'NO';
}
var isYes = (nullVal == 'YES' || nullVal === 'YES');
var badgeClass = isYes ? 'layui-bg-green' : 'layui-bg-gray';
var text = isYes ? '是' : '否';
var value = isYes ? 'YES' : 'NO';
return '<span class="dict-null-toggle layui-badge ' + badgeClass + '" data-field="' + (d.field || '') + '" data-value="' + value + '" style="cursor:pointer;">' + text + '</span>';
} catch(e) {
return '<span class="dict-null-toggle layui-badge layui-bg-gray" data-field="' + (d.field || '') + '" data-value="NO">否</span>';
}
}
},
{field:"extra",align:'center',title:"自动递增",width:100,
templet:function(d){
if(!d) return '';
if (d.extra == 'auto_increment') {
return '<span class="layui-badge layui-bg-blue">是</span>';
}
return '';
}
},
{field:"comment",title:"备注",edit:'text'}  // 字段注释（可编辑）
]],
done: function(res, curr, count){
// 初始化字段类型下拉菜单
var typeOptions = [
{id: 1, title: 'Int', value: 'Int'},
{id: 2, title: 'VarChar', value: 'VarChar'},
{id: 3, title: 'Text', value: 'Text'},
{id: 4, title: 'DateTime', value: 'DateTime'},
{id: 5, title: 'Float', value: 'Float'},
{id: 6, title: 'Money', value: 'Money'},
{id: 7, title: 'YesNo', value: 'YesNo'}
];
// 获取当前行数据的辅助函数
var getRowData = function(elem){
var index = $(elem).closest('tr').data('index');
return table.cache['database_dict'][index] || {};
};
// 初始化字段类型下拉
dropdown.render({
elem: '.dict-type-dropdown',
data: typeOptions,
click: function(obj){
var rowData = getRowData(this.elem);
var fieldName = rowData.field;
var newType = obj.value;
var $btn = $(this.elem);
// 更新按钮显示
$btn.find('span').html(obj.title);
// 调用编辑接口
var postData = {
table: tableName,
field: fieldName,
type: newType,
default: rowData.default || '',
null: rowData['null'] || 'NO',
extra: rowData.extra || ''
};
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=editFieldProperty",
data: postData,
success: function(res) {
if(res.status === "y") {
layer.msg(res.info,{shade:[0.4,'#000'],time:1500});
// 更新表格数据
table.reload('database_dict');
} else {
layer.msg(res.info, {icon: 2});
// 恢复原值
$btn.find('span').html(rowData.type || 'Int');
}
}
});
}
});
}
};
table.render(dictTableOptions);
// 监听允许非空点击切换
$(document).off('click', '.dict-null-toggle').on('click', '.dict-null-toggle', function(){
var $badge = $(this);
var fieldName = $badge.data('field');
var currentValue = $badge.data('value');
var newValue = (currentValue === 'YES') ? 'NO' : 'YES';
var tableData = table.cache['database_dict'];
var rowData = null;
for(var i = 0; i < tableData.length; i++){
if(tableData[i].field === fieldName){
rowData = tableData[i];
break;
}
}
if(rowData){
// 调用编辑接口
var postData = {
table: tableName,
field: fieldName,
type: rowData.type || '',
default: rowData.default || '',
null: newValue,
extra: rowData.extra || ''
};
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=editFieldProperty",
data: postData,
success: function(res) {
if(res.status === "y") {
layer.msg(res.info,{shade:[0.4,'#000'],time:1500});
// 更新表格数据
table.reload('database_dict');
} else {
layer.msg(res.info, {icon: 2});
}
}
});
}
});
}
});
}
// 删除表
else if (obj.event === 'delTable') {
layer.confirm('确定要删除数据表【' + data.name + '】吗？此操作不可恢复！',{icon:3, title:'删除数据表'}, function(index) {
layer.close(index);
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=delTable",
data: { table: data.name },
success: function(res) {
if(res.status === "y"){
layer.msg(res.info,{icon:1,time:2000},function(){
reloadTable();
});
}else{
layer.msg(res.info || '删除失败',{icon:2});
}
}
});
});
}
// 修改表名
else if (obj.event === 'editTable') {
layer.prompt({
title: '修改数据表名称 - 当前：' + data.name,
formType: 0,
value: data.name
}, function(value, index){
var newName = $.trim(value);
if(!newName){
layer.msg('新表名不能为空',{icon:2});
return;
}
if(newName === data.name){
layer.msg('新表名不能与原表名相同',{icon:2});
return;
}
layer.close(index);
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=editTableName",
data: { table: data.name, newTable: newName },
success: function(res) {
if(res.status === "y"){
obj.update({name:newName});// 更新表修改后名称，下面的更新可暂时不需要
// layer.msg(res.info,{icon:1,time:2000},function(){
//     reloadTable();
// });
}else{
layer.msg(res.info || '修改表名失败',{icon:2});
}
}
});
});
}
});
//==========================================
// 监听表格单元格编辑事件（表注释编辑）
// 功能：当用户编辑表注释时，保存到数据库
//==========================================
table.on('edit(demo)', function(obj){ 
var This=this;
// 发送AJAX请求保存表注释
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=editTableAlt",
data: { table:obj.data.name,note:obj.value  },
success: function(data) {
switch (data.status) {
case "y": 
// 保存成功，显示提示信息
layer.msg(data.info,{shade:[0.4,'#000'],time:1500});
break;
case "n": 
// 保存失败，显示错误信息并重新编辑
layer.msg(data.info, {icon: 2}); 
obj.reedit();  // 重新进入编辑状态
break;
}
}
}); 
});
//==========================================
// 监听字段字典表格单元格编辑事件（字段属性编辑）
// 功能：当用户编辑字段属性时，保存到数据库
//==========================================
table.on('edit(database_dict)', function(obj){   
var This=this;
var field = obj.field;  // 获取编辑的字段名
var value = obj.value;  // 获取编辑的值
var data = obj.data;    // 获取当前行数据
// 安全检查：确保 data 对象存在
if (!data || !data.field) {
layer.msg('数据加载中，请稍候...', {icon: 0});
obj.reedit();
return;
}
// 如果是备注字段，调用备注编辑接口
if (field === 'comment') {
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=editFieldAlt",
data: { table:tableName, field:data.field, fieldtype:data.type || '', note:value  },
success: function(res) {
if(res.status === "y") {
layer.msg(res.info,{shade:[0.4,'#000'],time:1500});
} else {
layer.msg(res.info, {icon: 2}); 
obj.reedit();
}
}
});
} else {
// 其他字段属性（type、default、null、extra）调用字段属性编辑接口
// 注意：使用 data['null'] 而不是 data.null，因为 null 是 JavaScript 保留字
var nullValue = 'NO';
try {
nullValue = data['null'] || (typeof data.null !== 'undefined' ? data.null : 'NO') || 'NO';
} catch(e) {
nullValue = 'NO';
}
var postData = {
table: tableName,
field: data.field,
type: data.type || '',
default: data.default || '',
null: nullValue,
extra: data.extra || ''
};
// 更新当前编辑的字段值
if (field === 'type') {
postData.type = value;
} else if (field === 'default') {
postData.default = value;
} else if (field === 'null') {
// 将"是"/"否"转换为"YES"/"NO"
postData.null = (value === '是' || value === 'YES' || value === 'yes') ? 'YES' : 'NO';
} else if (field === 'extra') {
// 将"是"/"否"转换为"auto_increment"/""
postData.extra = (value === '是' || value === 'auto_increment') ? 'auto_increment' : '';
}
$.ajax({
type: "POST",
cache: true,
dataType: "json",
url: "?act=editFieldProperty",
data: postData,
success: function(res) {
if(res.status === "y") {
// 更新表格数据
var updateData = {};
if (field === 'type') {
updateData.type = value;
} else if (field === 'default') {
updateData.default = value;
} else if (field === 'null') {
updateData['null'] = postData.null;
} else if (field === 'extra') {
updateData.extra = postData.extra;
}
obj.update(updateData);
layer.msg(res.info,{shade:[0.4,'#000'],time:1500});
} else {
layer.msg(res.info, {icon: 2}); 
obj.reedit();
}
}
});
}
});
});
</script>
<script type="text/javascript" src="../../js/pc.js?v20240430"></script>  
</body>
</html>
