<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)
winTitle = ChrW(35760)&ChrW(36134)&ChrW(23458)&ChrW(25143)
excludeAdminIDLIst=ChrW(45)&ChrW(57)&ChrW(57)&ChrW(57)
dim msg,isTrue,sql,addSql,id,username,nickname,tsfield_id,tsfield_id_zs,tsfield_id_pj,tsfield_id_jinlianze,tsfield_id_qunianze,tsfield_id_qianlianze,tsfield_id_daqianlianze,tel,email,isthrough,bodycontent
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
username=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
nickname=request(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
tsfield_id=request(ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))
tsfield_id_zs=request(ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(95)&ChrW(122)&ChrW(115))
tsfield_id_pj=request(ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(95)&ChrW(112)&ChrW(106))
tsfield_id_jinlianze=request(ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(95)&ChrW(106)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(122)&ChrW(101))
tsfield_id_qunianze=request(ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(95)&ChrW(113)&ChrW(117)&ChrW(110)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(122)&ChrW(101))
tsfield_id_qianlianze=request(ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(95)&ChrW(113)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(122)&ChrW(101))
tsfield_id_daqianlianze=request(ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(113)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(122)&ChrW(101))
tel=request(ChrW(116)&ChrW(101)&ChrW(108))
email=request(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
if id <>"" then
call showCheckAdminRule(ChrW(26597)&ChrW(30475) & winTitle) 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
id=rs(ChrW(105)&ChrW(100))
username=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
nickname=rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
tsfield_id=getMemberTotalMoney(rs)
tsfield_id_zs=getMemberTotalCount(rs)
tsfield_id_pj=getMemberTotalAverage(rs)
tsfield_id_jinlianze=getMemberThisYearMoney(rs)
tsfield_id_qunianze=getMemberLastYearMoney(rs)
tsfield_id_qianlianze=getMemberBeforeLastYearMoney(rs)
tsfield_id_daqianlianze=getMemberThreeYearsAgoMoney(rs)
tel=rs(ChrW(116)&ChrW(101)&ChrW(108))
email=rs(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
end if
else
isthrough=1
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if

function thisAddPrefix(a)  
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
thisAddPrefix=ChrW(96)&db_PREFIX&a&ChrW(96)
else
thisAddPrefix=ChrW(91)&db_PREFIX&a&ChrW(93)
end if
end function 

function getTimeFuHao()
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) or thisDatabaseType=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then
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

function getMemberTotalMoney(a)
dim b,c
Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) 
c.open b,conn,1,1

getMemberTotalMoney=IIF(isnull(c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)))=true,0,c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121))):c.close
end function

function getMemberTotalCount(a)
dim b,c
Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) 
c.open b,conn,1,1

getMemberTotalCount=IIF(isnull(c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)))=true,0,c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))):c.close
end function

function getMemberTotalAverage(a)        
dim b,c,d,e,f
Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100))  
c.open b,conn,1,1

d=IIF(isnull(c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)))=true,0,c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121))):c.close
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) 
c.open b,conn,1,1

e=IIF(isnull(c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)))=true,0,c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))):c.close

if e > 0 then
f = d / e

if f = Int(f) then

getMemberTotalAverage = CStr(Int(f))
else

getMemberTotalAverage = FormatNumber(f, 2, -1, 0, 0)
end if
else
getMemberTotalAverage = ChrW(48)
end if
end function

function getMemberThisYearMoney(a)
dim b,c,d
Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(61)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&sqlAorS(ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41))&ChrW(41)
c.open b,conn,1,1
d=IIF(isnull(c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)))=true,0,c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121))):c.close
getMemberThisYearMoney=d
end function

function getMemberLastYearMoney(a)
dim b,c,d
Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(61)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&sqlAorS(ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41))&ChrW(41)&ChrW(45)&ChrW(49)
c.open b,conn,1,1
d=IIF(isnull(c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)))=true,0,c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121))):c.close
getMemberLastYearMoney=d
end function

function getMemberBeforeLastYearMoney(a)
dim b,c,d
Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(61)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&sqlAorS(ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41))&ChrW(41)&ChrW(45)&ChrW(50)
c.open b,conn,1,1
d=IIF(isnull(c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)))=true,0,c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121))):c.close
getMemberBeforeLastYearMoney=d
end function

function getMemberThreeYearsAgoMoney(a)
dim b,c,d
Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)) &ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(65)&ChrW(78)&ChrW(68)&ChrW(32)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(61)&ChrW(89)&ChrW(69)&ChrW(65)&ChrW(82)&ChrW(40)&sqlAorS(ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41))&ChrW(41)&ChrW(45)&ChrW(51)
c.open b,conn,1,1
d=IIF(isnull(c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)))=true,0,c(ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121))):c.close
getMemberThreeYearsAgoMoney=d
end function
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=winTitle%>添加修改</title> 
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
<script type="text/javascript" src="../../js/jquery.js"></script>
<link href="../../css/nprogress.min.css" rel="stylesheet"/>  
<script src="../../js/nprogress.min.js"></script>
<style>.layui-input-inline,.layui-input-block{line-height:40px;color:#999;}</style></head>
<body>   
<%if msg <>"" then  call rw(ChrW(60)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62)& msg &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(62))%>
<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 0px 0 0 0;">
<div class="layui-tab" lay-filter="test-hash">
<%%>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>账号：</label>
<div class='layui-input-block layui-input-wrap'>
<%=username%>
</div><!--username-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>昵称：</label>
<div class='layui-input-block layui-input-wrap'>
<%=nickname%>
</div><!--nickname-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>总金额：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_id%>
</div><!--tsfield_id-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>总数：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_id_zs%>
</div><!--tsfield_id_zs-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>平均/次：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_id_pj%>
</div><!--tsfield_id_pj-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>今年总额：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_id_jinlianze%>
</div><!--tsfield_id_jinlianze-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>去年总额：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_id_qunianze%>
</div><!--tsfield_id_qunianze-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>前年总额：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_id_qianlianze%>
</div><!--tsfield_id_qianlianze-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>大前年总额：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_id_daqianlianze%>
</div><!--tsfield_id_daqianlianze-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>电话：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tel%>
</div><!--tel-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>邮箱：</label>
<div class='layui-input-block layui-input-wrap'>
<%=email%>
</div><!--email-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isthrough=0,ChrW(21542),ChrW(26159))%>
</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>备注：</label>
<div class='layui-input-block layui-input-wrap'>
<%=bodycontent%>
</div><!--bodycontent-->
</div>
</div>
</div>
</div>
</div>
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../../js/pc.js?v20250716_1"></script>
<!-- 编辑页加载更多js文件 -->
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce','colorpicker','rate','transfer','croppers'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate,
colorpicker = layui.colorpicker; 
//{编辑页上传图片JS块}
//{编辑器JS代码}
//{编辑页颜色选择器JS块}
//{编辑页时间选择器JS块} 
//{编辑页字段左边图标注释JS块}
})
// pasteImage("pic");
// 粘贴上传图片
// 配置 nprogress 的基本选项（可选）  
NProgress.configure({ showSpinner: true }); // 显示/隐藏加载时的旋转器  
// 监听页面加载事件  
document.addEventListener('DOMContentLoaded', startProgress); // DOM 结构加载完成（不含样式、图片、子框架）  
window.addEventListener('load', stopProgress); // 页面所有资源加载完成（含样式、图片、子框架）  
function startProgress() {  
NProgress.start(); // 开始显示进度条  
}  
function stopProgress() {  
NProgress.done(); // 完成进度条  
}  
</script>
<!-- 标签显示代码块 --> 
</body>
</html>
