<!--#include file="../../inc/Config.asp"-->
<!--#Include File = "../admin_function.asp"-->
<!--#Include File = "../admin_safe.Asp"-->
<% 
call openconn() 
dim totalVisits,dayVisits,sql,chatTotalVisits,chatDayVisits,activeUser,totalUser,i,sSel,narticlM,naritcleCount
dim totalMoney,dayMoney,yesterdayMoney,wMoney,mMoney,day30Money,day7Money,yMoney
dim inadminid,sqlWhereinadminid,sqlAndinadminid,addsql,zhouSql

'处理获得当前月日'20240204
function handleGetThisMonthDay(nThisZhou)
    dim currentMonth,newDate,i
    currentMonth = Month(date)
    ' call echo("nThisZhou",nThisZhou)
    for i=0 to nThisZhou -1
        newDate = DateAdd("d", i*-1, date())
        if currentMonth<> Month(newDate) then 
            nThisZhou=i 
            exit for
        end if
        ' call echo(i,newDate)
    next
    handleGetThisMonthDay=nThisZhou
end function


inadminid=request("inadminid")
if inadminid<>"" then
    sqlWhereinadminid=" where inadminid="& inadminid &""
    sqlAndinadminid=" and inadminid="& inadminid &""
end if

addsql=""
addsql=IIF(sqlWhereinadminid=""," where "," and ")
addsql = addsql & " isthrough=1 and price>0 "
 
 
'总收price'
rs.open"select sum(price)as mv from ["&db_PREFIX&"money]"&sqlWhereinadminid & addsql,conn,1,1
totalMoney=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close

' call echo(sqlWhereinadminid,totalMoney)


'今天收入'
rs.open"select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price>0 and "& getAccessDatediff("daytime") &"=0"&sqlAndinadminid,conn,1,1
dayMoney=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close
'今天支出'
dim dayPayment
rs.open"select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price<0 and "& getAccessDatediff("daytime") &"=0"&sqlAndinadminid,conn,1,1
dayPayment=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close

'昨天收入'
rs.open"select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and "& getAccessDatediff("daytime") &"=1"&sqlAndinadminid,conn,1,1
yesterdayMoney=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close

 dim nThisZhou
 nThisZhou=Weekday(Date)-1
 if nThisZhou=0 then nThisZhou=7 
 
' call echo("nThisZhou",nThisZhou)
nThisZhou=handleGetThisMonthDay(nThisZhou)
' call echo("nThisZhou",nThisZhou)

'周收入'
' zhouSql="and ("& getAccessDatediff("daytime") &"<="& 7-nThisZhou &" and " & getAccessDatediff("daytime") &">-" & nThisZhou & " ) "
zhouSql=" and (daytime>"& sqlAorS("#" & format_Time(DateAdd("d",-1*nThisZhou, now()),2) & " 23:59#") &" and daytime<="& sqlAorS("#" & format_Time(now(),2) &" 23:59"&  "#") &")" '精准'


sql="select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price>0 " & zhouSql &sqlAndinadminid
' call echo("sql " & nThisZhou, sql)
rs.open sql,conn,1,1
wMoney=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close


'周支出'
dim wPayment
rs.open"select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price<0 " & zhouSql &sqlAndinadminid,conn,1,1
wPayment=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close


dim nThisMonth:nThisMonth=day(now())  '当前月当前过去天数'
dim monthSql:monthSql=" and (daytime>"& sqlAorS("#" & format_Time(DateAdd("d",-1*nThisMonth, now()),2) & " 23:59#") &" and daytime<="& sqlAorS("#" & format_Time(now(),2) &" 23:59"&  "#") &")" '精准'
'月收入'
sql="select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price>0 " & monthSql &sqlAndinadminid
' call echo("sql " & nThisMonth, sql)
rs.open sql,conn,1,1

mMoney=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close
'月支出'
dim mPayment
rs.open"select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price<0 " & monthSql &sqlAndinadminid,conn,1,1
mPayment=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close

dim lastYearMoney,qiangYearMoney

'今年收入'
dim nThisYear:nThisYear=getDayOfYear()
' call echo("nThisYear",nThisYear)
dim yearSql:yearSql=" and (daytime>"& sqlAorS("#" & format_Time(DateAdd("d",-1*nThisYear, now()),2) & " 23:59#") &" and daytime<="& sqlAorS("#" & format_Time(now(),2) &" 23:59"&  "#") &")" '精准'
sql="select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price>0 " & yearSql &sqlAndinadminid
' call echo("sql " & nThisYear, sql)
rs.open sql,conn,1,1
' rs.open"select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price>0 and "& getAccessDatediffYear("daytime") &"=0"&sqlAndinadminid,conn,1,1
yMoney=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close
  
'去年收入'

' rs.open"select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price<0 " & yearSql &sqlAndinadminid,conn,1,1  '和下面效果一样
sql="select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price>0 and "& getAccessDatediffYear("daytime") &"=1"&sqlAndinadminid
rs.open sql,conn,1,1 
lastYearMoney=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close

'前年收入'
sql="select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price>0 and "& getAccessDatediffYear("daytime") &"=2"&sqlAndinadminid
rs.open sql,conn,1,1 
qiangYearMoney=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close




'年支出'
dim yPayment
rs.open"select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and price<0 and "& getAccessDatediffYear("daytime") &"=0"&sqlAndinadminid,conn,1,1
yPayment=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close

' '7天收入'
' rs.open"select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and daytime>=#"& DateAdd("d",now(),-7) &"#"&sqlAndinadminid,conn,1,1
' day7Money=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close
' '30天收入'
' rs.open"select sum(price)as mv from ["&db_PREFIX&"money] where isthrough=1 and daytime>=#"& DateAdd("d",now(),-30) &"#"&sqlAndinadminid,conn,1,1
' day30Money=IIF(isnull(rs("mv"))=true,0,rs("mv")):rs.close
 

if request("act")="json" then
  dim startM,endM,nCount,c,nMoneryCount,c2,nMemberCount,c3,nian,nPayment,c4
  nian=request("nian")
  if nian="" then
    nian=year(now()) 
  end if
  ' call eerr("nian",nian)

  for i=1 to 12
    startM =nian & "/" & i &"/1"
    endM =nian & "/" & i &"/" & getMBigDay(nian,i)
 
    nCount=conn.execute("select count(*) from ["&db_PREFIX&"money] where isthrough=1 and price>0 and daytime>="& sqlAorS("#"& startM &"#") &" and daytime<="& sqlAorS("#"& endM &"#")  & sqlAndinadminid)(0)
    '收入'
    nMoneryCount=conn.execute("select sum(price) from ["&db_PREFIX&"money] where isthrough=1 and price>0 and daytime>="& sqlAorS("#"& startM &"#") &" and daytime<="& sqlAorS("#"& endM &"#") & sqlAndinadminid)(0) 
    if nMoneryCount="" or isnull(nMoneryCount) then nMoneryCount=0
    '支出'
    nPayment=conn.execute("select sum(price) from ["&db_PREFIX&"money] where isthrough=1 and price<0 and daytime>="& sqlAorS("#"& startM &"#") &" and daytime<="& sqlAorS("#"& endM &"#") & sqlAndinadminid)(0) 
    if nPayment="" or isnull(nPayment) then nPayment=0
    nPayment=nPayment*-1'负数转正数
 
    '会员数'  
    nMemberCount=conn.execute("select count(*) from ["&db_PREFIX&"member] where isthrough=1 and regtime>="& sqlAorS("#"& startM &"#") &" and regtime<="& sqlAorS("#"& endM &"#") & sqlAndinadminid)(0)
    if nMemberCount="" or isnull(nMemberCount) then nMemberCount=0
    if c<>"" then c=c & ","
    c=c & nCount
    if c2<>"" then c2=c2 & ","
    c2=c2 & handleFormatNumber(nMoneryCount,2)
    if c3<>"" then c3=c3 & ","
    c3=c3 & handleFormatNumber(nMemberCount,2)
    if c4<>"" then c4=c4 & ","
    c4=c4 & nPayment
  next

dim stemp
 stemp = "{""jiedancount"":[" & c & "],""shouduancount"":[" & c2 & "],""newmemebercount"":[" & c3 & "],""payment"":[" & c4 & "],""code"":""0"",""msg"":""""}" 
call die(stemp)
  call die(c & vbcrlf & c2& vbcrlf & c3)
end if
'新收款比'
function getMoneryBi()
  dim startM,endM,nMoneryCount,nMoneryCountUP,nMonth
  nMonth=month(now())
    startM ="2023/" & nMonth &"/1"
    endM ="2023/" & nMonth &"/" & getMBigDay(2023,nMonth) 
    

    nMoneryCount=conn.execute("select sum(price) from ["&db_PREFIX&"money] where isthrough=1 and daytime>="& sqlAorS("#"& startM &"#") &" and daytime<="& sqlAorS("#"& endM &"#") & sqlAndinadminid)(0) 
    if nMoneryCount="" or isnull(nMoneryCount) then nMoneryCount=0

    if nMonth>1 then
        nMonth=nMonth-1
    end if
    startM ="2023/" & nMonth &"/1"
    endM ="2023/" & nMonth &"/" & getMBigDay(2023,nMonth) 
    ' call eerr(startM,endM)
    nMoneryCountUP=conn.execute("select sum(price)  from ["&db_PREFIX&"money] where isthrough=1 and daytime>="& sqlAorS("#"& startM &"#") &" and daytime<="& sqlAorS("#"& endM &"#") & sqlAndinadminid)(0) 

    if isnull(nMoneryCountUP) then
        getMoneryBi=0
        exit function
    elseif nMoneryCountUP=0 then
        getMoneryBi=0
        exit function
    end if

   getMoneryBi=Formatnumber((100/nMoneryCountUP*nMoneryCount)-100,2)
end function
' call getMoneryBi()
'新接单比'
function getJieDanBi()
  dim startM,endM,nCount,nMonth,nMonthUP
  nMonth=month(now())  
    startM ="2023/" & nMonth &"/1"
    endM ="2023/" & nMonth &"/" & getMBigDay(2023,nMonth) 
    ' call eerr(startM,endM)
    nCount=conn.execute("select count(*) from ["&db_PREFIX&"money] where isthrough=1 and price>0 and daytime>="& sqlAorS("#"& startM &"#") &" and daytime<="& sqlAorS("#"& endM &"#") & sqlAndinadminid)(0)

    if nMonth>1 then
        nMonth=nMonth-1
    end if
    ' call echo("startM",startM)
    ' call echo("endM",endM)

    startM ="2023/" & nMonth &"/1"
    endM ="2023/" & nMonth &"/" & getMBigDay(2023,nMonth) 
    ' call eerr(startM,endM)
    nMonthUP=conn.execute("select count(*) from ["&db_PREFIX&"money] where isthrough=1 and price>0 and daytime>="& sqlAorS("#"& startM &"#") &" and daytime<="& sqlAorS("#"& endM &"#") & sqlAndinadminid)(0) 
    
    ' call echo("startM",startM)
    ' call echo("endM",endM)
    ' call echo("nCount",nCount)
    ' call echo("nMonthUP",nMonthUP)
    ' call die("")
    if nMonthUP=0 then 
        getJieDanBi=0
        exit function
    end if
 
    
   getJieDanBi=Formatnumber((100/nMonthUP*nCount)-100,2)

   ' getJieDanBi=nCount & "," & nMonthUP
end function
'新用户比
function getMemberBi()
  dim startM,endM,nMember,nMonth,nMemberUP,sql
  nMonth=month(now())
    startM ="2023/" & nMonth &"/1"
    endM ="2023/" & nMonth &"/" & getMBigDay(2023,nMonth) 
    sql="select count(*) from ["&db_PREFIX&"member] where isthrough=1 and regtime>="& sqlAorS("#"& startM &"#") &" and regtime<="& sqlAorS("#"& endM &"#")

    nMember=conn.execute(sql)(0)
 


    if nMonth>1 then
        nMonth=nMonth-1
    end if
    startM ="2023/" & nMonth &"/1"
    endM ="2023/" & nMonth &"/" & getMBigDay(2023,nMonth)
    ' call eerr(startM,endM)
    nMemberUP=conn.execute("select count(*) from ["&db_PREFIX&"member] where isthrough=1 and regtime>="& sqlAorS("#"& startM &"#") &" and regtime<="& sqlAorS("#"& endM &"#"))(0) 
    if nMemberUP=0 then nMemberUP=1  '暂时这么留着20230827'
    getMemberBi=Formatnumber((100/nMemberUP*nMember)-100,2)
    
   ' getJieDanBi=nCount & "," & nMonthUP
end function


'获得月中总天数20220607'
Function getMBigDay(iyear,imonth)
    Dim i,idate
    For i=31 to 28 step -1
        idate = iyear & "-" & imonth & "-" & i
        if isdate(idate) then
            getMBigDay = i
            Exit function
        End if
    Next
End function
'今天是今年的第N天 20230822'
function getDayOfYear()
    Dim today, currentDate, dayOfYear
    today = Date
    currentDate = CDate(Month(today) & "/" & Day(today) & "/" & Year(today))
    dayOfYear = DateDiff("d", DateSerial(Year(currentDate), 1, 1), currentDate) + 1
    getDayOfYear = dayOfYear
end function
'获得今年有多少天 20230822'
function getThisYearDasy()
    Dim currentYear, totalDays
    currentYear = Year(Date)
    getThisYearDasy = DateDiff("d", DateSerial(currentYear, 1, 1), DateSerial(currentYear + 1, 1, 1))
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
                        <span class="layui-badge layui-bg-green layuiadmin-badge">月</span>
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
                        收支量<span style="color:blue;font-weight:bold;" id="shouzhimsg">今年总收入<%=yMoney%></span>
                        <div class="layui-btn-group layuiadmin-btn-group">
                            <a href="javascript:clickshouzhimsg('前年总收入<%=qiangYearMoney%>');" class="layui-btn layui-btn-primary layui-btn-xs loadlian">前年</a>
                            <a href="javascript:clickshouzhimsg('去年总收入<%=lastYearMoney%>');;" class="layui-btn layui-btn-primary layui-btn-xs loadlian">去年</a>
                            <a href="javascript:clickshouzhimsg('今年总收入<%=yMoney%>');;" class="layui-btn layui-btn-primary layui-btn-xs loadlian">今年</a>
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
                                        <div class="layui-progress-bar" lay-percent="<%=getJieDanBi()&" %"%>"></div>
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

' call echo("3月",getMBigDay(2022,3))
' call echo("4月",getMBigDay(2022,4))
' call echo("5月",getMBigDay(2022,5))
' call echo("6月",getMBigDay(2022,6))
' call echo("7月",getMBigDay(2022,7))



dim nTianAdd
nTianAdd=getMBigDay(2022,3)-16+getMBigDay(2022,4)+getMBigDay(2022,5)+getMBigDay(2022,6)+day(now())
' call echo("nTianAdd",nTianAdd) 
' call echo("平均每天",totalMoney/nTianAdd)
' call echo("",weekday(date)-1 )
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
 


                                %> <i class="layui-inline layui-icon layui-icon-flag"></i></span>
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
                                ' call echo("wMoney",wMoney)
                                ' call echo("nThisZhou",nThisZhou)
                                ' call echo(wMoney,(weekday(date)-1)):doevents
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
dim workDay:workDay=0'工作天数
rsx.open"select top 1 * from ["&db_PREFIX&"money] where isthrough=1 "& sqlAndinadminid &" order by daytime asc",conn,1,1
if not rsx.eof then
    workDay=datediff("d",rsx("daytime"),now())
    workDay=workDay+1   '加上今天
end if:rsx.close
                            %>
                      工作<font color="red"><%=workDay%></font>天，总收入
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





if workDay=0 then   'isnul(workDay)'
    call rw(0)
else
    ' call echo("totalMoney",totalMoney)
    ' call echo("workDay",workDay)
    ' doevents
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
    layui.config({
        base: '../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'sample', 'yun5']);

    ///layuiadmin/modules/yun.js   改图表
    
    function clickshouzhimsg(title){
        $("#shouzhimsg").text(title) 
    }
    </script>
</body>

</html>