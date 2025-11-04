<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../inc/Config.asp"-->
<!--#Include File = "../admin_function.asp"-->
<!--#Include File = "../admin_safe.Asp"-->
<% 
call openconn() 
dim totalVisits,dayVisits,sql,chatTotalVisits,chatDayVisits,activeUser,totalUser,i,sSel,narticlM,naritcleCount
dim totalMoney,dayMoney,yesterdayMoney,wMoney,mMoney,day30Money,day7Money,yMoney,userid
dim inadminid,sqlWhereinadminid,sqlAndinadminid,addsql,zhouSql

Function convertDaysToYearMonthDay(a)
Dim b, c, d, e

b = Int(a / 365.25)
e = a - (b * 365.25)

c = Int(e / 30.44)
d = Int(e - (c * 30.44))

convertDaysToYearMonthDay = b & ChrW(24180) & c & ChrW(26376) & d & ChrW(22825)
End function

function handleGetThisMonthDay(a)
dim b,c,d
b = Month(date)

for d=0 to a -1
c = DateAdd(ChrW(100), d*-1, date())
if b <> Month(c) then 
a=d 
exit for
end if

next
handleGetThisMonthDay=a
end function
inadminid=request(ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))
if inadminid <>"" then
sqlWhereinadminid=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(61)& inadminid &""
sqlAndinadminid=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(61)& inadminid &""
end if
userid=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100))

if userid="" then
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32),conn,1,1
while not rs.eof
if rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=1 then
if userid <>"" then userid=userid&ChrW(44)
userid=userid & rs(ChrW(105)&ChrW(100))

else

end if
rs.movenext:wend:rs.close
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

dim dayPayment
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediff(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&sqlAndinadminid,conn,1,1
dayPayment=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close

rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediff(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(49)&sqlAndinadminid,conn,1,1
yesterdayMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
dim nThisZhou
nThisZhou=Weekday(Date)-1
if nThisZhou=0 then nThisZhou=7 

nThisZhou=handleGetThisMonthDay(nThisZhou)



zhouSql=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)& sqlAorS(ChrW(35) & format_Time(DateAdd(ChrW(100),-1*nThisZhou, now()),2) & ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35) & format_Time(now(),2) &ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&  ChrW(35)) &ChrW(41)
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32) & zhouSql &sqlAndinadminid

rs.open sql,conn,1,1
wMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close

dim wPayment
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32) & zhouSql &sqlAndinadminid,conn,1,1
wPayment=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
dim nThisMonth:nThisMonth=day(now())
dim monthSql:monthSql=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)& sqlAorS(ChrW(35) & format_Time(DateAdd(ChrW(100),-1*nThisMonth, now()),2) & ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35) & format_Time(now(),2) &ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&  ChrW(35)) &ChrW(41)

sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32) & monthSql &sqlAndinadminid

rs.open sql,conn,1,1
mMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close

dim mPayment
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32) & monthSql &sqlAndinadminid,conn,1,1
mPayment=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close
dim lastYearMoney,qiangYearMoney,yCount,lastYearCount,qiangYearCount

dim nThisYear:nThisYear=getDayOfYear()

dim yearSql:yearSql=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)& sqlAorS(ChrW(35) & format_Time(DateAdd(ChrW(100),-1*nThisYear, now()),2) & ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35) & format_Time(now(),2) &ChrW(32)&ChrW(50)&ChrW(51)&ChrW(58)&ChrW(53)&ChrW(57)&  ChrW(35)) &ChrW(41)
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32) & yearSql &sqlAndinadminid

rs.open sql,conn,1,1

yMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118)))
yCount=IIF(isnull(rs(ChrW(99)&ChrW(116)))=true,0,rs(ChrW(99)&ChrW(116))):rs.close


sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediffYear(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(49)&sqlAndinadminid
rs.open sql,conn,1,1 
lastYearMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))) 
lastYearCount=IIF(isnull(rs(ChrW(99)&ChrW(116)))=true,0,rs(ChrW(99)&ChrW(116))):rs.close

sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediffYear(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(50)&sqlAndinadminid
rs.open sql,conn,1,1 
qiangYearMoney=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118)))
qiangYearCount=IIF(isnull(rs(ChrW(99)&ChrW(116)))=true,0,rs(ChrW(99)&ChrW(116))):rs.close
dim beforeLastYearPrice,beforeLastYearCount

sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediffYear(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(51)&sqlAndinadminid
rs.open sql,conn,1,1 
beforeLastYearPrice=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))) 
beforeLastYearCount=IIF(isnull(rs(ChrW(99)&ChrW(116)))=true,0,rs(ChrW(99)&ChrW(116))):rs.close

dim yPayment
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(109)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)& getAccessDatediffYear(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&sqlAndinadminid,conn,1,1
yPayment=IIF(isnull(rs(ChrW(109)&ChrW(118)))=true,0,rs(ChrW(109)&ChrW(118))):rs.close






if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110) then
dim startM,endM,nCount,c,nMoneryCount,c2,nMemberCount,c3,nian,nPayment,c4
nian=request(ChrW(110)&ChrW(105)&ChrW(97)&ChrW(110))
if nian="" then
nian=year(now()) 
end if

for i=1 to 12
startM =nian & ChrW(47) & i &ChrW(47)&ChrW(49)
endM =nian & ChrW(47) & i &ChrW(47) & getMBigDay(nian,i)
nCount=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& startM &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& endM &ChrW(35))  & sqlAndinadminid)(0)

nMoneryCount=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& startM &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& endM &ChrW(35)) & sqlAndinadminid)(0) 
if nMoneryCount="" or isnull(nMoneryCount) then nMoneryCount=0

nPayment=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(60)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& startM &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& endM &ChrW(35)) & sqlAndinadminid)(0) 
if nPayment="" or isnull(nPayment) then nPayment=0
nPayment=nPayment*-1

sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(62)&ChrW(61)& sqlAorS(ChrW(35)& startM &ChrW(35)) &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(61)& sqlAorS(ChrW(35)& endM &ChrW(35)) & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)& userid &ChrW(41)
nMemberCount=conn.execute(sql)(0)

if nMemberCount="" or isnull(nMemberCount) then nMemberCount=0
if c <>"" then c=c & ChrW(44)
c=c & nCount
if c2 <>"" then c2=c2 & ChrW(44)
c2=c2 & handleFormatNumber(nMoneryCount,2)
if c3 <>"" then c3=c3 & ChrW(44)
c3=c3 & handleFormatNumber(nMemberCount,2)
if c4 <>"" then c4=c4 & ChrW(44)
c4=c4 & nPayment
next
dim stemp
stemp = ChrW(123)&ChrW(34)&ChrW(106)&ChrW(105)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(91) & c & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(117)&ChrW(100)&ChrW(117)&ChrW(97)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(91) & c2 & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(91) & c3 & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(97)&ChrW(121)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(91) & c4 & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(125) 
call die(stemp)
call die(c & vbcrlf & c2& vbcrlf & c3)
end if

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


getMoneryBi=Formatnumber((100/d*c)-100,2)
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
getJieDanBi=Formatnumber((100/e*c)-100,2)

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
getMemberBi=Formatnumber((100/e*c)-100,2)

end function

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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layuiAdmin 主页示例模板二</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
<style>
.layuiadmin-span-color{color:green;font-weight: bold;}
.layuiadmin-span-color>i{color:#666;font-weight: normal;}
</style>
</head>
<body>
<div class="layui-fluid">
<div class="layui-row layui-col-space15">
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
当天收入
<span class="layui-badge layui-bg-blue layuiadmin-badge">天</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%=handleFormatNumber(dayMoney,2)%>
</p>
<p>
当天支出
<span class="layuiadmin-span-color">
<%=handleFormatNumber(dayPayment,2)%> <i class="layui-inline layui-icon layui-icon-rmb"></i></span>
</p>
</div>
</div>
</div>
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
当周收入
<span class="layui-badge layui-bg-cyan layuiadmin-badge">周</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%=handleFormatNumber(wMoney,2)%>
</p>
<p>
当周支出
<span class="layuiadmin-span-color">
<%=handleFormatNumber(wPayment,2)%> <i class="layui-inline layui-icon layui-icon-rmb"></i></span>
</p>
</div>
</div>
</div>
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
当月收入
<span class="layui-badge layui-bg-orange layuiadmin-badge">月</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%=handleFormatNumber(mMoney,2)%>
</p>
<p>
当月支出
<span class="layuiadmin-span-color">
<%=handleFormatNumber(mPayment,2)%> <i class="layui-inline layui-icon layui-icon-rmb"></i></span>
</p>
</div>
</div>
</div>
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
今年收入
<span class="layui-badge layui-bg-green layuiadmin-badge">年</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%=handleFormatNumber(yMoney,2)%>
</p>
<p>
今年支出
<span class="layuiadmin-span-color">
<%=handleFormatNumber(yPayment,2)%><i class="layui-inline layui-icon layui-icon-rmb"></i></span>
</p>
</div>
</div>
</div>
<div class="layui-col-sm12">
<div class="layui-card">
<div class="layui-card-header">
<%
dim thisYearTip,qiangYearMoneyTip,lastYearMoneyTip,beforeLastYearPriceTip
thisYearTip=yMoney & ChrW(65292)&ChrW(24179)&ChrW(22343)&ChrW(27599)&ChrW(26376) & int(yMoney/12) & ChrW(65292)&ChrW(24179)&ChrW(22343)&ChrW(27599)&ChrW(22825) & int(yMoney/366) & ChrW(65292)&ChrW(25910)&ChrW(27454)&yCount&ChrW(26465)
qiangYearMoneyTip=qiangYearMoney & ChrW(65292)&ChrW(24179)&ChrW(22343)&ChrW(27599)&ChrW(26376) & int(qiangYearMoney/12) & ChrW(65292)&ChrW(24179)&ChrW(22343)&ChrW(27599)&ChrW(22825) & int(qiangYearMoney/366) & ChrW(65292)&ChrW(25910)&ChrW(27454)&qiangYearCount&ChrW(26465)
lastYearMoneyTip=lastYearMoney & ChrW(65292)&ChrW(24179)&ChrW(22343)&ChrW(27599)&ChrW(26376) & int(lastYearMoney/12) & ChrW(65292)&ChrW(24179)&ChrW(22343)&ChrW(27599)&ChrW(22825) & int(lastYearMoney/366) & ChrW(65292)&ChrW(25910)&ChrW(27454)&lastYearCount&ChrW(26465)
beforeLastYearPriceTip=beforeLastYearPrice & ChrW(65292)&ChrW(24179)&ChrW(22343)&ChrW(27599)&ChrW(26376) & int(beforeLastYearPrice/12) & ChrW(65292)&ChrW(24179)&ChrW(22343)&ChrW(27599)&ChrW(22825) & int(beforeLastYearPrice/366) & ChrW(65292)&ChrW(25910)&ChrW(27454)&beforeLastYearCount&ChrW(26465)
%>
收支量<span style="color:blue;font-weight:bold;" id="shouzhimsg">今年总收入<%=thisYearTip%></span>
<div class="layui-btn-group layuiadmin-btn-group">
<a href="javascript:clickshouzhimsg('大前年总收入<%=beforeLastYearPriceTip%>');" class="layui-btn layui-btn-primary layui-btn-xs loadlian">大前年</a>
<a href="javascript:clickshouzhimsg('前年总收入<%=qiangYearMoneyTip%>');" class="layui-btn layui-btn-primary layui-btn-xs loadlian">前年</a>
<a href="javascript:clickshouzhimsg('去年总收入<%=lastYearMoneyTip%>');;" class="layui-btn layui-btn-primary layui-btn-xs loadlian">去年</a>
<a href="javascript:clickshouzhimsg('今年总收入<%=thisYearTip%>');;" class="layui-btn layui-btn-primary layui-btn-xs loadlian">今年</a>
</div>
</div>
<div class="layui-card-body">
<div class="layui-row">
<div class="layui-col-sm8">
<div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-pagetwo">
<div carousel-item id="LAY-index-pagetwoA">
<div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
</div>
</div>
</div>
<div class="layui-col-sm4">
<div class="layuiadmin-card-list">
<p class="layuiadmin-normal-font">月项目</p>
<span>同上期增长</span>
<div class="layui-progress layui-progress-big" lay-showPercent="yes">
<div class="layui-progress-bar" lay-percent="<%=getJieDanBi()&ChrW(32)&ChrW(37)%>"></div>
</div>
</div>
<div class="layuiadmin-card-list">
<p class="layuiadmin-normal-font">月收款</p>
<span>同上期增长</span>
<div class="layui-progress layui-progress-big" lay-showPercent="yes">
<div class="layui-progress-bar" lay-percent="<%=getMoneryBi()%>%"></div>
</div>
</div>
<div class="layuiadmin-card-list">
<p class="layuiadmin-normal-font">月用户</p>
<span>同上期增长</span>
<div class="layui-progress layui-progress-big" lay-showPercent="yes">
<div class="layui-progress-bar" lay-percent="<%=getMemberBi()%>%"></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<%





dim nTianAdd
nTianAdd=getMBigDay(2022,3)-16+getMBigDay(2022,4)+getMBigDay(2022,5)+getMBigDay(2022,6)+day(now())



%>
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
这月工作<font color="red"><%=day(now())%></font>天，平均每天
<span class="layui-badge layui-bg-blue layuiadmin-badge">天</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%=handleFormatNumber(mMoney/day(now()),2)%>
</p>
<p> 
有<font color="red"><%=day(now())*24%></font>小时，平均每小时
<span class="layuiadmin-span-color">
<%
call rw( handleFormatNumber( mMoney/day(now())/24,2))
%> 
<i class="layui-inline layui-icon layui-icon-rmb"></i></span>
</p>
</div>
</div>
</div>
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
这周工作<font color="red"><%=nThisZhou%></font>天，平均每天
<span class="layui-badge layui-bg-cyan layuiadmin-badge">周</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%



call rw(handleFormatNumber(wMoney/nThisZhou,2))%>
</p>
<p>
有<font color="red">7</font>天，平均每天
<span class="layuiadmin-span-color">
<%=handleFormatNumber(wMoney/7,2)%> <i class="layui-inline layui-icon layui-icon-rmb"></i></span>
</p>
</div>
</div>
</div>
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
当月有<font color="red"><%=getMBigDay(year(now),month(now()))%></font>天，平均每天
<span class="layui-badge layui-bg-orange layuiadmin-badge">月</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%=handleFormatNumber(mMoney/(getMBigDay(year(now),month(now()))),2)%>
</p>
<p>
<%  
dim workDay:workDay=0
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&db_PREFIX&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)& sqlAndinadminid &ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not rsx.eof then
workDay=datediff(ChrW(100),rsx(ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)),now())
workDay=workDay+1
end if:rsx.close
%>
工作<font color="red"><%=workDay%></font>天（<%=convertDaysToYearMonthDay(workDay)%>），总收入
<span class="layuiadmin-span-color"><%=handleFormatNumber(totalMoney,2)%>
<i class="layui-inline layui-icon layui-icon-rmb"></i></span>
</p>
</div>
</div>
</div>
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
今年过去<font color="red"><%=getDayOfYear()%></font>天，平均每天
<span class="layui-badge layui-bg-green layuiadmin-badge">年</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<% 
call rw(handleFormatNumber(yMoney/getDayOfYear(),2))
%>
</p>
<p>
工作<font color="red"><%=workDay%></font>天，平均每天 
<span class="layuiadmin-span-color">
<%
if workDay=0 then
call rw(0)
else



call rw( handleFormatNumber(totalMoney/workDay,2)) 
end if
%> <i class="layui-inline layui-icon layui-icon-rmb"></i></span>
<!--                             今年<font color="red"><%=getThisYearDasy()%></font>天，平均每天
<span class="layuiadmin-span-color">
<%=Formatnumber(yMoney/getThisYearDasy(),2)%><i class="layui-inline layui-icon layui-icon-rmb"></i></span> -->
</p>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript" src="/admin/js/jquery.js"></script>
<script src="../layuiadmin/layui/layui.js?v1"></script>
<script>
var inadminid='<%=inadminid%>'
var userid='<%=userid%>'
layui.config({
base: '../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'sample', 'yun6']);
///layuiadmin/modules/yun.js   改图表
function clickshouzhimsg(title){ 
$("#shouzhimsg").text(title) 
}
</script>
</body>
</html>