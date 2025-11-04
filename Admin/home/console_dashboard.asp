<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../inc/Config.asp"-->
<!--#Include File = "../admin_function.asp"-->
<!--#Include File = "../admin_safe.Asp"-->
<% 
call openconn() 


Function convertDaysToYearMonthDay(a)
Dim b, c, d, e
b = Int(a / 365.25)
e = a - (b * 365.25)
c = Int(e / 30.44)
d = Int(e - (c * 30.44))
convertDaysToYearMonthDay = b & ChrW(24180) & c & ChrW(26376) & d & ChrW(22825)
End function

Function getMBigDay(a,b)
Dim c,d
For c=31 to 28 step -1
d = a & ChrW(45) & b & ChrW(45) & c
if isdate(d) then
getMBigDay = c
Exit function
End if
Next
End function

function getDayOfYear()
Dim a, b, c
a = Date
b = CDate(Month(a) & ChrW(47) & Day(a) & ChrW(47) & Year(a))
c = DateDiff(ChrW(100), DateSerial(Year(b), 1, 1), b) + 1
getDayOfYear = c
end function

function getThisYearDasy()
Dim a, b
a = Year(Date)
getThisYearDasy = DateDiff(ChrW(100), DateSerial(a, 1, 1), DateSerial(a + 1, 1, 1))
end function

Function formatNumberForJs(a)
Dim b
If IsNull(a) Or IsEmpty(a) Then
b = ChrW(48)
Else

b = FormatNumber(a, 2, -1, 0, 0)

b = Replace(b, ChrW(44), ChrW(46))
End if
formatNumberForJs = b
End function


dim totalVisits,dayVisits,sql,chatTotalVisits,chatDayVisits,activeUser,totalUser,i,sSel,narticlM,naritcleCount
dim totalMoney,dayMoney,yesterdayMoney,wMoney,mMoney,day30Money,day7Money,yMoney,userid
dim inadminid,sqlWhereinadminid,sqlAndinadminid,addsql,zhouSql
dim dayPayment,wPayment,mPayment,yPayment
dim nThisZhou, nThisMonth, monthSql, nThisYear, yearSql
dim monthIncome(12), monthExpense(12), currentYear
dim incomeDataString, expenseDataString
dim workDay


inadminid=request(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))
userid=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))
if userid="" then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49),conn,1,1
while not rs.eof
if userid <>"" then userid=userid&ChrW(44)
userid=userid & rs(ChrW(105)&ChrW(100))
rs.movenext:wend:rs.close
end if
if inadminid <>"" then
sqlWhereinadminid=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(61)& inadminid &""
sqlAndinadminid=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(61)& inadminid &""
end if
if userid <>"" then
sqlWhereinadminid=sqlWhereinadminid & IIF(sqlWhereinadminid <>"",ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32), ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))
sqlWhereinadminid=sqlWhereinadminid & ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)&userid & ChrW(41)
sqlAndinadminid=sqlAndinadminid & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)& userid &ChrW(41)
end if
addsql=""
addsql=IIF(sqlWhereinadminid="",ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
addsql = addsql & ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&sqlWhereinadminid & addsql
rs.open sql,conn,1,1
totalMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediff(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&sqlAndinadminid,conn,1,1
dayMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediff(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&sqlAndinadminid,conn,1,1
dayPayment=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
nThisZhou=Weekday(Date)-1
if nThisZhou=0 then nThisZhou=7 
zhouSql=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)& sqlAorS(ChrW(35) & format_Time(DateAdd(ChrW(100),-1*nThisZhou, now()),2) & ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35) & format_Time(now(),2) &ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&  ChrW(35)) &ChrW(41)
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32) & zhouSql &sqlAndinadminid
rs.open sql,conn,1,1
wMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32) & zhouSql &sqlAndinadminid,conn,1,1
wPayment=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
nThisMonth=day(now())
monthSql=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)& sqlAorS(ChrW(35) & format_Time(DateAdd(ChrW(100),-1*nThisMonth, now()),2) & ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35) & format_Time(now(),2) &ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&  ChrW(35)) &ChrW(41)
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32) & monthSql &sqlAndinadminid
rs.open sql,conn,1,1
mMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32) & monthSql &sqlAndinadminid,conn,1,1
mPayment=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediffYear(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&sqlAndinadminid,conn,1,1
yPayment=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
nThisYear=getDayOfYear()
yearSql=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)& sqlAorS(ChrW(35) & format_Time(DateAdd(ChrW(100),-1*nThisYear, now()),2) & ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35) & format_Time(now(),2) &ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&  ChrW(35)) &ChrW(41)
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32) & yearSql &sqlAndinadminid
rs.open sql,conn,1,1
yMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close

function getMoneryBi()
dim a,b,c,d,e,f
e=month(now())
f=year(now())
a =f & ChrW(47) & e &ChrW(47)&ChrW(49)
b =f & ChrW(47) & e &ChrW(47) & getMBigDay(f,e) 
c=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& a &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) & sqlAndinadminid)(0) 
if c="" or isnull(c) then c=0
if e>1 then
e=e-1
end if
a =f & ChrW(47) & e &ChrW(47)&ChrW(49)
b =f & ChrW(47) & e &ChrW(47) & getMBigDay(f,e) 
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& a &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) & sqlAndinadminid
d=conn.execute(sql)(0) 
if isnull(d) then
getMoneryBi=0
exit function
elseif d=0 then
getMoneryBi=0
exit function
end if
getMoneryBi=nHleZhe(Formatnumber((100/d*c)-100,2))
end function

function getJieDanBi()
dim a,b,c,d,e,f
d=month(now())  
f=year(now())
a =f & ChrW(47) & d &ChrW(47)&ChrW(49)
b =f & ChrW(47) & d &ChrW(47) & getMBigDay(f,d) 
c=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& a &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) & sqlAndinadminid)(0)
if d>1 then
d=d-1
end if
a =f & ChrW(47) & d &ChrW(47)&ChrW(49)
b =f & ChrW(47) & d &ChrW(47) & getMBigDay(f,d) 
e=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& a &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) & sqlAndinadminid)(0) 
if e=0 then 
getJieDanBi=0
exit function
end if
getJieDanBi=nHleZhe(Formatnumber((100/e*c)-100,2))
end function

function getMemberBi()
dim a,b,c,d,e,f,g
d=month(now())
g=year(now())
a =g & ChrW(47) & d &ChrW(47)&ChrW(49)
b =g & ChrW(47) & d &ChrW(47) & getMBigDay(g,d) 
f=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& a &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35))
c=conn.execute(f)(0)
if d>1 then
d=d-1
end if
a =g & ChrW(47) & d &ChrW(47)&ChrW(49)
b =g & ChrW(47) & d &ChrW(47) & getMBigDay(g,d)
e=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& a &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)))(0) 
if e=0 then 
getMemberBi=0
exit function
end if
getMemberBi=nHleZhe(Formatnumber((100/e*c)-100,2))
end function
workDay=0
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)& sqlAndinadminid &ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not rsx.eof then
workDay=datediff(ChrW(100),rsx(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),now())
workDay=workDay+1
end if:rsx.close
currentYear=year(now())
for i=1 to 12
dim startDate,endDate
startDate = currentYear & ChrW(47) & i & ChrW(47)&ChrW(49)
endDate = currentYear & ChrW(47) & i & ChrW(47) & getMBigDay(currentYear,i)
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& startDate &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& endDate &ChrW(35)) & sqlAndinadminid
rs.open sql,conn,1,1
monthIncome(i-1)=CDbl(IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118)))):rs.close
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& startDate &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& endDate &ChrW(35)) & sqlAndinadminid
rs.open sql,conn,1,1
monthExpense(i-1)=CDbl(IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118)))):rs.close
next
incomeDataString = ChrW(91)
expenseDataString = ChrW(91)
For i = 0 To 11 
If i > 0 Then
incomeDataString = incomeDataString & ChrW(44)
expenseDataString = expenseDataString & ChrW(44)
End if
incomeDataString = incomeDataString & CStr(CDbl(IIF(IsNull(monthIncome(i)), 0, monthIncome(i))))
expenseDataString = expenseDataString & CStr(CDbl(IIF(IsNull(monthExpense(i)), 0, monthExpense(i))) * -1)
Next
incomeDataString = incomeDataString & ChrW(93)
expenseDataString = expenseDataString & ChrW(93)

function getLast7DaysData()
dim a, b, c, d, e
e = ChrW(91)
for a = 6 to 0 step -1
b = DateAdd(ChrW(100), -a, Date())
c = DateAdd(ChrW(100), -a, Date())

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediff(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)& a & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
if a < 6 then e = e & ChrW(44)
e = e & ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & Year(b) & ChrW(45) & Right(ChrW(48) & Month(b), 2) & ChrW(45) & Right(ChrW(48) & Day(b), 2) & ChrW(34)&ChrW(44)
e = e & ChrW(34)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(44)
end if
rs.close

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediff(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)& a & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
e = e & ChrW(34)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(125)
end if
rs.close
next
e = e & ChrW(93)
getLast7DaysData = e
end function

function getLast7WeeksData()
dim a, b, c, d, e
e = ChrW(91)
for a = 6 to 0 step -1

b = DateAdd(ChrW(119)&ChrW(119), -a, Date())
b = DateAdd(ChrW(100), -(Weekday(b, vbMonday)-1), b)
c = DateAdd(ChrW(100), 6, b)

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& c &ChrW(35)) & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
if a < 6 then e = e & ChrW(44)
e = e & ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & Year(b) & ChrW(45) & Right(ChrW(48) & Month(b), 2) & ChrW(45) & Right(ChrW(48) & Day(b), 2) & ChrW(33267) & Year(c) & ChrW(45) & Right(ChrW(48) & Month(c), 2) & ChrW(45) & Right(ChrW(48) & Day(c), 2) & ChrW(34)&ChrW(44)
e = e & ChrW(34)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(44)
end if
rs.close

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& c &ChrW(35)) & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
e = e & ChrW(34)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(125)
end if
rs.close
next
e = e & ChrW(93)
getLast7WeeksData = e
end function

function getLast7MonthsData()
dim a, b, c, d, e
e = ChrW(91)
for a = 6 to 0 step -1

b = DateAdd(ChrW(109), -a, Date())
b = DateSerial(Year(b), Month(b), 1)
c = DateAdd(ChrW(109), 1, b)
c = DateAdd(ChrW(100), -1, c)

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& c &ChrW(35)) & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
if a < 6 then e = e & ChrW(44)
e = e & ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & Year(b) & ChrW(24180) & Month(b) & ChrW(26376)&ChrW(34)&ChrW(44)
e = e & ChrW(34)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(44)
end if
rs.close

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& c &ChrW(35)) & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
e = e & ChrW(34)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(125)
end if
rs.close
next
e = e & ChrW(93)
getLast7MonthsData = e
end function

function getLast7YearsData()
dim a, b, c, d, e
e = ChrW(91)
for a = 6 to 0 step -1

b = DateAdd(ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121), -a, Date())
b = DateSerial(Year(b), 1, 1)
c = DateSerial(Year(b), 12, 31)

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& c &ChrW(35)) & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
if a < 6 then e = e & ChrW(44)
e = e & ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & Year(b) & ChrW(24180)&ChrW(34)&ChrW(44)
e = e & ChrW(34)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(44)
end if
rs.close

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& c &ChrW(35)) & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
e = e & ChrW(34)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(125)
end if
rs.close
next
e = e & ChrW(93)
getLast7YearsData = e
end function

function getLast7MonthsCountData()
dim a, b, c, d, e
e = ChrW(91)
for a = 6 to 0 step -1

b = DateAdd(ChrW(109), -a, Date())
b = DateSerial(Year(b), Month(b), 1)
c = DateAdd(ChrW(109), 1, b)
c = DateAdd(ChrW(100), -1, c)

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& c &ChrW(35)) & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
if a < 6 then e = e & ChrW(44)
e = e & ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & Year(b) & ChrW(24180) & Month(b) & ChrW(26376)&ChrW(34)&ChrW(44)
e = e & ChrW(34)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(44)
end if
rs.close

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& c &ChrW(35)) & sqlAndinadminid
rs.open d,conn,1,1
if not rs.eof then
e = e & ChrW(34)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(109)&ChrW(118))), 0, rs(ChrW(109)&ChrW(118))) & ChrW(125)
end if
rs.close
next
e = e & ChrW(93)
getLast7MonthsCountData = e
end function

function getLast7MonthsUserData()
dim a, b, c, d, e
e = ChrW(91)
for a = 6 to 0 step -1

b = DateAdd(ChrW(109), -a, Date())
b = DateSerial(Year(b), Month(b), 1)
c = DateAdd(ChrW(109), 1, b)
c = DateAdd(ChrW(100), -1, c)

d = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& c &ChrW(35))
rs.open d,conn,1,1
if not rs.eof then
if a < 6 then e = e & ChrW(44)
e = e & ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & Year(b) & ChrW(24180) & Month(b) & ChrW(26376)&ChrW(34)&ChrW(44)
e = e & ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58) & IIF(isnull(rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))), 0, rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))) & ChrW(125)
end if
rs.close
next
e = e & ChrW(93)
getLast7MonthsUserData = e
end function

function getJieDanCount()
dim a,b,c,d,e
d=month(now())  
e=year(now())
a =e & ChrW(47) & d &ChrW(47)&ChrW(49)
b =e & ChrW(47) & d &ChrW(47) & getMBigDay(e,d) 
c=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& a &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) & sqlAndinadminid)(0)
if isnull(c) then c = 0
getJieDanCount = c
end function

function getMoneryCount()
dim a,b,c,d,e
d=month(now())
e=year(now())
a =e & ChrW(47) & d &ChrW(47)&ChrW(49)
b =e & ChrW(47) & d &ChrW(47) & getMBigDay(e,d) 
c=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& a &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)) & sqlAndinadminid)(0)
if isnull(c) then c = 0
getMoneryCount = c
end function

function getMemberCount()
dim a,b,c,d,e
d=month(now())
e=year(now())
a =e & ChrW(47) & d &ChrW(47)&ChrW(49)
b =e & ChrW(47) & d &ChrW(47) & getMBigDay(e,d) 
c=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& a &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& b &ChrW(35)))(0)
if isnull(c) then c = 0
getMemberCount = c
end function
%>
<!-- Debugging incomeDataString: <%=Server.HTMLEncode(incomeDataString)%> -->
<!-- Debugging expenseDataString: <%=Server.HTMLEncode(expenseDataString)%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>数据大屏</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
<link rel="stylesheet" href="themes/general.css?v1233333" media="all">
<link id="theme-style" rel="stylesheet" href="">
</head>
<body>
<div class="dashboard-container">
<select id="themeSelector" class="theme-selector">
<option value="default">默认主题</option>
<option value="dark">深色主题</option>
<option value="light">浅色主题</option>
<option value="gradient">活力渐变主题</option>
<option value="minimal">简约灰度主题</option>
<option value="corporate-blue">企业蓝主题</option>
<option value="black">纯黑主题</option>
<option value="neon">霓虹主题</option>
<option value="tech-blue">科技蓝主题</option>
<option value="green">自然绿主题</option>
<option value="forest">森林主题</option>
<option value="jade">翡翠主题</option>
<option value="ocean">海洋蓝主题</option>
<option value="sunset">日落橙主题</option>
<option value="aurora">极光紫主题</option>
<option value="royal-purple">皇家紫主题</option>
<option value="golden">金色奢华主题</option>
<option value="nordic">北欧极简主题</option>
<option value="cyberpunk">赛博朋克主题</option>
<option value="zen">禅意主题</option>
<option value="diamond">钻石奢华主题</option>
<option value="ruby">红宝石奢华主题</option>
<option value="emerald">翡翠奢华主题</option>
<option value="sapphire">蓝宝石奢华主题</option>
<option value="amethyst">紫水晶奢华主题</option>
</select>
<span id="incomeDataHidden" style="display:none;"><%=incomeDataString%></span>
<span id="expenseDataHidden" style="display:none;"><%=expenseDataString%></span>
<span id="last7DaysData" style="display:none;"><%=getLast7DaysData()%></span>
<span id="last7WeeksData" style="display:none;"><%=getLast7WeeksData()%></span>
<span id="last7MonthsData" style="display:none;"><%=getLast7MonthsData()%></span>
<span id="last7YearsData" style="display:none;"><%=getLast7YearsData()%></span>
<span id="last7MonthsCountData" style="display:none;"><%=getLast7MonthsCountData()%></span>
<span id="last7MonthsUserData" style="display:none;"><%=getLast7MonthsUserData()%></span>
<div class="dashboard-grid top-cards">
<div class="data-card">
<div class="data-title">今日收入</div>
<div class="data-value">¥<%=handleFormatNumber(dayMoney,2)%></div>
<div class="data-trend">
今日支出: ¥<%=handleFormatNumber(dayPayment,2)%>
</div>
</div>
<div class="data-card">
<div class="data-title">本周收入</div>
<div class="data-value">¥<%=handleFormatNumber(wMoney,2)%></div>
<div class="data-trend">
本周支出: ¥<%=handleFormatNumber(wPayment,2)%>
</div>
</div>
<div class="data-card">
<div class="data-title">本月收入</div>
<div class="data-value">¥<%=handleFormatNumber(mMoney,2)%></div>
<div class="data-trend">
本月支出: ¥<%=handleFormatNumber(mPayment,2)%>
</div>
</div>
<div class="data-card">
<div class="data-title">年度收入</div>
<div class="data-value">¥<%=handleFormatNumber(yMoney,2)%></div>
<div class="data-trend">
年度支出: ¥<%=handleFormatNumber(yPayment,2)%>
</div>
</div>
</div>
<div class="dashboard-charts">
<div class="data-card">
<div class="data-title">收入趋势</div>
<div id="incomeChart" class="chart-container"></div>
</div>
<div class="metrics-stack">
<div class="data-card">
<div class="data-title">月项目<%=getJieDanCount()%>条增长</div>
<div class="data-value"><%=getJieDanBi()%>%</div>
</div>
<div class="data-card">
<div class="data-title">月收支<%=getMoneryCount()%>笔增长</div>
<div class="data-value"><%=getMoneryBi()%>%</div>
</div>
<div class="data-card">
<div class="data-title">月用户<%=getMemberCount()%>个增长</div>
<div class="data-value"><%=getMemberBi()%>%</div>
</div>
</div>
</div>
<div class="dashboard-grid bottom-card">
<!-- Card 1: 月工作天数及平均收入 -->
<div class="data-card">
<div class="data-title">这月工作<font color="red"><%=day(now())%></font>天，平均每天</div>
<div class="data-value">
<%=handleFormatNumber(mMoney/day(now()),2)%>
</div>
<div class="data-trend">
有<font color="red"><%=(day(now())*24)%></font>小时，平均每小时<span class="layuiadmin-span-color">¥<%=handleFormatNumber(mMoney/day(now())/24,2)%></span>
</div>
</div>
<!-- Card 2: 周工作天数及平均收入 -->
<div class="data-card">
<div class="data-title">这周工作<font color="red"><%=nThisZhou%></font>天，平均每天</div>
<div class="data-value">
<%=handleFormatNumber(wMoney/nThisZhou,2)%>
</div>
<div class="data-trend">
有<font color="red">7</font>天，平均每天<span class="layuiadmin-span-color">¥<%=handleFormatNumber(wMoney/7,2)%></span>
</div>
</div>
<!-- Card 3: 当月总天数及平均收入, 包含运营天数和总收入 -->
<div class="data-card">
<div class="data-title">当月有<font color="red"><%=getMBigDay(year(now),month(now()))%></font>天，平均每天</div>
<div class="data-value">
<%=handleFormatNumber(mMoney/(getMBigDay(year(now),month(now()))),2)%>
</div>
<div class="data-trend">
工作<font color="red"><%=workDay%></font>天（<%=convertDaysToYearMonthDay(workDay)%>），总收入<span class="layuiadmin-span-color">¥<%=handleFormatNumber(totalMoney,2)%></span>
</div>
</div>
<!-- Card 4: 今年过去天数及平均收入, 包含总平均收入 -->
<div class="data-card">
<div class="data-title">今年过去<font color="red"><%=getDayOfYear()%></font>天，平均每天</div>
<div class="data-value">
<%=handleFormatNumber(yMoney/getDayOfYear(),2)%>
</div>
<div class="data-trend">
工作<font color="red"><%=workDay%></font>天，平均每天<span class="layuiadmin-span-color">¥<%If workDay = 0 Then Response.Write 0 Else Response.Write handleFormatNumber(totalMoney/workDay,2) End if%></span>
</div>
</div>
</div>
</div>
<script src="../layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script src="js/echarts.min.js"></script>
<script>
var incomeChart = null; // Declare incomeChart in the global scope
var incomeData = []; // Declare incomeData in the global scope
var expenseData = []; // Declare expenseData in the global scope
// Function to update chart colors based on theme
function updateChartTheme(theme) {
if (!incomeChart) return; // Ensure chart is initialized
// Handle 'default' theme which should load 'dark.css'
if (theme === 'default') {
theme = 'dark';
}
// 获取颜色值，如果获取失败则使用默认值
function getColorValue(cssVar, defaultValue) {
const color = getComputedStyle(document.documentElement).getPropertyValue(cssVar).trim();
return color || defaultValue;
}
// 更新图表主题
incomeChart.setOption({
backgroundColor: 'transparent',
title: {
textStyle: {
color: getColorValue('--chart-title-color', '#fff')
}
},
legend: {
textStyle: {
color: getColorValue('--chart-legend-color', '#fff')
}
},
xAxis: {
axisLine: {
lineStyle: {
color: getColorValue('--chart-axis-line-color', '#fff')
}
},
axisLabel: {
color: getColorValue('--chart-axis-label-color', '#fff')
}
},
yAxis: {
axisLine: {
lineStyle: {
color: getColorValue('--chart-axis-line-color', '#fff')
}
},
axisLabel: {
color: getColorValue('--chart-axis-label-color', '#fff'),
formatter: function(value) {
return '¥' + value;
}
},
splitLine: {
lineStyle: {
color: getColorValue('--chart-split-line-color', 'rgba(255,255,255,0.1)')
}
}
},
series: [
{
name: '收入',
type: 'bar',
data: incomeData,
itemStyle: {
color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
{offset: 0, color: getColorValue('--chart-income-start-color', '#00c3ff')},
{offset: 1, color: getColorValue('--chart-income-end-color', '#00a3ff')}
])
}
},
{
name: '支出',
type: 'bar',
data: expenseData,
itemStyle: {
color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
{offset: 0, color: getColorValue('--chart-expense-start-color', '#ff4d4f')},
{offset: 1, color: getColorValue('--chart-expense-end-color', '#ff7875')}
])
}
}
]
});
}
layui.use(['layer', 'element'], function(){
var layer = layui.layer;
var element = layui.element;
// 从隐藏元素中获取数据并赋值给全局变量
incomeData = JSON.parse(document.getElementById('incomeDataHidden').innerText);
expenseData = JSON.parse(document.getElementById('expenseDataHidden').innerText);
/**
* 获取CSS变量颜色值
* @param {string} cssVar - CSS变量名
* @param {string} defaultValue - 默认颜色值
* @returns {string} 颜色值
*/
function getColorValue(cssVar, defaultValue) {
const color = getComputedStyle(document.documentElement).getPropertyValue(cssVar).trim();
return color || defaultValue;
}
// 初始化主图表
incomeChart = echarts.init(document.getElementById('incomeChart'));
// 主图表配置选项
var option = {
backgroundColor: 'transparent',
title: {
text: '<%=currentYear%>年收支趋势',
textStyle: {
color: getColorValue('--chart-title-color', '#333')
}
},
tooltip: {
trigger: 'axis',
axisPointer: {
type: 'shadow'
}
},
legend: {
data: ['收入', '支出'],
textStyle: {
color: getColorValue('--chart-legend-color', '#666')
}
},
grid: {
left: '3%',
right: '4%',
bottom: '3%',
containLabel: true
},
xAxis: {
type: 'category',
data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
axisLine: {
lineStyle: {
color: getColorValue('--chart-axis-line-color', '#ccc')
}
},
axisLabel: {
color: getColorValue('--chart-axis-label-color', '#666')
}
},
yAxis: {
type: 'value',
axisLine: {
lineStyle: {
color: getColorValue('--chart-axis-line-color', '#ccc')
}
},
axisLabel: {
color: getColorValue('--chart-axis-label-color', '#666'),
formatter: function(value) {
return '¥' + value;
}
},
splitLine: {
lineStyle: {
color: getColorValue('--chart-split-line-color', '#eee')
}
}
},
series: [
{
name: '收入',
type: 'bar',
data: incomeData,
itemStyle: {
color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
{offset: 0, color: getColorValue('--chart-income-start-color', '#4CAF50')},
{offset: 1, color: getColorValue('--chart-income-end-color', '#81C784')}
])
}
},
{
name: '支出',
type: 'bar',
data: expenseData,
itemStyle: {
color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
{offset: 0, color: getColorValue('--chart-expense-start-color', '#FF5722')},
{offset: 1, color: getColorValue('--chart-expense-end-color', '#FF8A65')}
])
}
}
]
};
// 渲染主图表
incomeChart.setOption(option);
// 监听窗口大小变化，调整图表大小
window.addEventListener('resize', function() {
incomeChart.resize();
});
// 主题切换相关逻辑
var themeSelector = document.getElementById('themeSelector');
var savedTheme = localStorage.getItem('dashboardTheme') || 'default';
// 设置初始主题
if (themeSelector) {
themeSelector.value = savedTheme;
changeTheme(savedTheme);
}
// 监听主题切换事件
themeSelector.addEventListener('change', function() {
var selectedTheme = this.value;
changeTheme(selectedTheme);
});
/**
* 显示图表弹窗
* @param {string} title - 弹窗标题
* @param {Array} data - 图表数据
* @param {string} type - 图表类型（days/weeks/months/years/counts/growth/users）
*/
function showChartDialog(title, data, type) {
var chartHtml = '<div id="chartContainer" style="width: 100%; height: 400px;"></div>';
layer.open({
type: 1,
title: title,
area: ['800px', '500px'],
content: chartHtml,
success: function() {
var chart = echarts.init(document.getElementById('chartContainer'));
var option = getChartOption(type, data, getColorValue);
// 渲染图表
chart.setOption(option);
// 监听窗口大小变化，调整图表大小
window.addEventListener('resize', function() {
chart.resize();
});
}
});
}
/**
* 获取图表配置选项
* @param {string} type - 图表类型
* @param {Array} data - 图表数据
* @param {Function} getColorValue - 获取颜色值的函数
* @returns {Object} 图表配置选项
*/
function getChartOption(type, data, getColorValue) {
// 基础配置选项
var baseOption = {
backgroundColor: 'transparent',
tooltip: {
trigger: 'axis',
axisPointer: {
type: 'shadow'
}
},
grid: {
left: '3%',
right: '4%',
bottom: '3%',
containLabel: true
},
xAxis: {
type: 'category',
data: data.map(item => item.date),
axisLine: {
lineStyle: {
color: getColorValue('--chart-axis-line-color', '#ccc')
}
},
axisLabel: {
color: getColorValue('--chart-axis-label-color', '#666'),
// 对于天和周的数据，标签需要旋转45度以防重叠
rotate: type === 'days' || type === 'weeks' ? 45 : 0
}
},
yAxis: {
type: 'value',
axisLine: {
lineStyle: {
color: getColorValue('--chart-axis-line-color', '#ccc')
}
},
axisLabel: {
color: getColorValue('--chart-axis-label-color', '#666'),
// 根据数据类型设置不同的格式化方式
formatter: function(value) {
return type === 'users' || type === 'counts' ? value + '个' : '¥' + value;
}
},
splitLine: {
lineStyle: {
color: getColorValue('--chart-split-line-color', '#eee')
}
}
}
};
// 根据不同类型设置不同的数据系列
var series = [];
if (type === 'users') {
// 用户增长图表
series.push({
name: '新增用户',
type: 'bar',
data: data.map(item => item.count),
itemStyle: {
color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
{offset: 0, color: getColorValue('--chart-income-start-color', '#4CAF50')},
{offset: 1, color: getColorValue('--chart-income-end-color', '#81C784')}
])
}
});
} else if (type === 'counts') {
// 收支数量图表
series.push(
{
name: '收入数量',
type: 'bar',
data: data.map(item => item.incomeCount),
itemStyle: {
color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
{offset: 0, color: getColorValue('--chart-income-start-color', '#4CAF50')},
{offset: 1, color: getColorValue('--chart-income-end-color', '#81C784')}
])
}
},
{
name: '支出数量',
type: 'bar',
data: data.map(item => Math.abs(item.expenseCount)),
itemStyle: {
color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
{offset: 0, color: getColorValue('--chart-expense-start-color', '#FF5722')},
{offset: 1, color: getColorValue('--chart-expense-end-color', '#FF8A65')}
])
}
}
);
} else {
// 收支金额图表
series.push(
{
name: '收入',
type: 'bar',
data: data.map(item => item.income),
itemStyle: {
color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
{offset: 0, color: getColorValue('--chart-income-start-color', '#4CAF50')},
{offset: 1, color: getColorValue('--chart-income-end-color', '#81C784')}
])
}
},
{
name: '支出',
type: 'bar',
data: data.map(item => Math.abs(item.expense)),
itemStyle: {
color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
{offset: 0, color: getColorValue('--chart-expense-start-color', '#FF5722')},
{offset: 1, color: getColorValue('--chart-expense-end-color', '#FF8A65')}
])
}
}
);
}
// 设置数据系列和图例
baseOption.series = series;
baseOption.legend = {
data: series.map(s => s.name),
textStyle: {
color: getColorValue('--chart-legend-color', '#666')
}
};
return baseOption;
}
// 修改双击事件处理程序，使用AJAX重新加载数据
function loadDataAndShowChart(url, title, type) {
// 添加完整的路径前缀
var fullUrl = '../home/' + url;
// 获取当前用户的inadminid
var inadminid = '<%=inadminid%>';
$.ajax({
url: fullUrl,
type: 'GET',
data: { inadminid: inadminid },
success: function(data) {
showChartDialog(title, JSON.parse(data), type);
},
error: function(xhr, status, error) {
layer.msg('加载数据失败：' + error);
console.error('请求URL:', fullUrl);
console.error('错误详情:', error);
}
});
}
// 绑定双击事件处理程序
// 今日收入
document.querySelector('.data-card').addEventListener('dblclick', function() {
loadDataAndShowChart('getLast7DaysData.asp', '最近7天收支情况', 'days');
});
// 本周收入
document.querySelectorAll('.data-card')[1].addEventListener('dblclick', function() {
loadDataAndShowChart('getLast7WeeksData.asp', '最近7周收支情况', 'weeks');
});
// 本月收入
document.querySelectorAll('.data-card')[2].addEventListener('dblclick', function() {
loadDataAndShowChart('getLast7MonthsData.asp', '最近7个月收支情况', 'months');
});
// 年度收入
document.querySelectorAll('.data-card')[3].addEventListener('dblclick', function() {
loadDataAndShowChart('getLast7YearsData.asp', '最近7年收支情况', 'years');
});
// 月项目增长
document.querySelector('.metrics-stack .data-card:first-child').addEventListener('dblclick', function() {
loadDataAndShowChart('getLast7MonthsCountData.asp', '最近7个月收支数量情况', 'counts');
});
// 月收支增长
document.querySelector('.metrics-stack .data-card:nth-child(2)').addEventListener('dblclick', function() {
loadDataAndShowChart('getLast7MonthsData.asp', '最近7个月收支增长情况', 'growth');
});
// 月用户增长
document.querySelector('.metrics-stack .data-card:nth-child(3)').addEventListener('dblclick', function() {
loadDataAndShowChart('getLast7MonthsUserData.asp', '最近7个月用户增长情况', 'users');
});
});
/**
* 切换主题
* @param {string} theme - 主题名称
*/
function changeTheme(theme) {
var themeStyleLink = document.getElementById('theme-style');
if (!themeStyleLink) {
console.error('主题样式链接未找到！');
return;
}
// 立即保存主题选择
localStorage.setItem('dashboardTheme', theme);
// 根据选择的主题设置样式表链接
if (theme !== 'default') {
themeStyleLink.href = 'themes/' + theme + '.css?v5';
} else {
// 如果选择默认主题或没有保存的主题，加载深色主题
themeStyleLink.href = 'themes/dark.css?v5';
}
// 添加小延迟以确保CSS应用后再更新图表
setTimeout(function() {
updateChartTheme(theme);
if (incomeChart) {
incomeChart.resize(); // 主题更改后强制调整图表大小
}
}, 100);
}
</script>
</body>
</html> 