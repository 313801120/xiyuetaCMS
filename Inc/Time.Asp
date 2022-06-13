<% 
'Time 时间操作类 (2013,9,27)

'获得格式化时间
function getFormatYMD(timeStr, sType)
	'q 季   m 月   y 一年的日数   d 日   w 一周的日数   ww 周   h 时   n 分钟   s 秒 
    getFormatYMD = dateDiff(sType, timeStr, now())   
end function
'获得时间处理后多久前，天，时  20171010
function getHandleHowLongAgoTime(timeStr)
	dim nDay,nHour,nMinute,s
	nDay=dateDiff("d", timeStr, now())  
	nHour=dateDiff("h", timeStr, now())  
	nMinute=dateDiff("n", timeStr, now())
	if nDay>0 then
		s=nDay & "天前"
	elseif nHour>0 then
		s=nHour & "小时前"
	else
		s=nMinute & "分钟前"
	end if
	getHandleHowLongAgoTime=s
end function

'时间处理    
function format_Time(timeStr, nType)
    dim y, m, d, h, mi, s ,c,nWeek
    if isDate(timeStr) = false then exit function 
	
	timeStr = CDate(timeStr)		'转时间类型
    y = CStr(year(timeStr)) 
    m = CStr(month(timeStr))  
    if len(m) = 1 then m = "0" & m 
    d = CStr(day(timeStr))                                                          '在vb.net里要这样用  D = CStr(CDate(timeStr).Day)
	'周
	nWeek=fix(day(timeStr)/7)
	if day(timeStr) mod 7>0 then
		nWeek=nWeek+1
	end if
	
    if len(d) = 1 then d = "0" & d 
    h = CStr(hour(timeStr))  
    if len(h) = 1 then h = "0" & h 
    mi = CStr(minute(timeStr)) 
    if len(mi) = 1 then mi = "0" & mi 
    s = CStr(second(timeStr)) 
    if len(s) = 1 then s = "0" & s
    select case nType
        case 1:
            'yyyy-mm-dd hh:mm:ss
            c = y & "-" & m & "-" & d & " " & h & ":" & mi & ":" & s 
        case 2:
            'yyyy-mm-dd
            c = y & "-" & m & "-" & d 
        case 3:
            'hh:mm:ss
            c = h & ":" & mi & ":" & s 
        case 4:
            'yyyy年mm月dd日
            c = y & "年" & m & "月" & d & "日" 
        case 5:
            'yyyymmdd
            c = y & m & d 
        case 6:
            'yyyymmddhhmmss
            c = y & m & d & h & mi & s 
        case 7:
            'mm-dd
            c = m & "-" & d 
        case 8:
            'yyyy年mm月dd日
            c = y & "年" & m & "月" & d & "日" & " " & h & ":" & mi & ":" & s 
        case 9:
            'yyyy年mm月dd日H时mi分S秒 早上
            c = y & "年" & m & "月" & d & "日" & " " & h & "时" & mi & "分" & s & "秒，" & getDayStatus(h, 1) 
        case 10:
            'yyyy年mm月dd日H时
            c = y & "年" & m & "月" & d & "日" & h & "时" 
        case 11:
            'yyyy年mm月dd日H时mi分S秒
            c = y & "年" & m & "月" & d & "日" & " " & h & "时" & mi & "分" & s & "秒" 
        case 12:
            'yyyy年mm月dd日H时mi分
            c = y & "年" & m & "月" & d & "日" & " " & h & "时" & mi & "分" 
        case 13:
            'yyyy年mm月dd日H时mi分 早上
            c = m & "月" & d & "日" & " " & h & ":" & mi & " " & getDayStatus(h, 0) 
        case 14:
            'yyyy年mm月dd日
            c = y & "/" & m & "/" & d 
        case 15:
            'yyyy年mm月 第1周
            c = y & "年" & m & "月 第" & nWeek & "周" 
        case 16:
            'yyyy年mm月dd日
            c =  m & "月" & d & "日" 
        case 17:
            'hh:mm
            c = h & ":" & mi
        case 18:				'07-19 09:50
			 c = m & "-" & d & " " & " " & h & ":" & mi 
        case 19:				'07-19 09:50
			 c =h & "时" & mi & "分" & s & "秒" 
        case 20:
            'yyyy/mm/dd hh:mm:ss
            c = y & "/" & m & "/" & d & " " & h & ":" & mi & ":" & s 
        case 30:
            'yyyy-mm
            c = y & "-" & m
		case 88: 
            c = d
        case 89: 
            c = m		
		case 120:
			select case m
				case "01":c="Janurary"
				case "02":c="February"
				case "03":c="March"
				case "04":c="April"
				case "05":c="May"
				case "06":c="June"
				case "07":c="July"
				case "08":c="August"
				case "09":c="September"
				case "10":c="October"
				case "11":c="November"
				case "12":c="December"
			end select  
    end select
	format_Time=c
end function
'获得星期几 
function getWeekDay(timeStr, sType)
	dim xqj
	sType=cstr(sType)
	xqj=weekday(timeStr)-1
	if sType="1" then
		xqj="星期" & replace(replace(replace(replace(replace(replace(replace(xqj,"1","一"),"2","二"),"3","三"),"4","四"),"5","五"),"6","六"),"0","天")
	end if
	getWeekDay=xqj
end function
'获得当前时期还可以计算  默认为加天数
function getHandleDate(numb)
    'if numb = "" then
    '    numb = 0 
    'end if
    'getHandleDate = format_Time(now() + numb, 2)
	getHandleDate=dateAdd("d",numb,now())
end function 
'获得当前天状态
function getDayStatus(h, nType)
    dim c,nH
    if left(h, 1) = "0" then
        h = right(h, 1) 
    end if 
    nH = CInt(h) 
    if nH >= 0 and nH <= 5 then
        c = "凌晨" 
    elseIf nH >= 6 and nH <= 8 then
        c = "早上" 
    elseIf nH >= 9 and nH <= 12 then
        c = "上午" 
    elseIf nH >= 13 and nH <= 18 then
        c = "下午" 
    elseIf nH >= 19 and nH <= 24 then
        c = "晚上" 
    else
        c = "深夜" 
    end if 
    if nType = 1 then c = "<b>" & c & "</b>" 
    getDayStatus = c 
end function 
'时间计算
function printTimeValue(byval nV) 
    dim nVTemp, c, n 
	nVTemp=nV
    if nV >= 86400 then
        n = nV mod 86400 
        nV = fix(nV / 60 / 60 / 24)        '这里面是除24，不是60，因为一天有24个小时，小云你这个傻X  20150119
        c = c & nV & "天" 
        nV = n 
    end if 
    if nV >= 3600 then
        n = nV mod 3600 
        nV = fix(nV / 60 / 60) 
        c = c & nV & "小时" 
        nV = n 
    end if 

    if nV >= 60 then
        n = nV mod 60 
        nV = fix(nV / 60) 
        c = c & nV & "分" 
        nV = n 
    end if 
    if nV > 0 then
        c = c & nV & "秒" 
    end if
	if c="" then
		c="0秒"
	end if
	
    printTimeValue = c 
end function 
'计算整时  (问答以小时或分钟显示)
function printAskTime(nV)
    on error resume next 
    dim  c, n  
    if nV >= 3600 then 
        n = nV mod 3600 
        nV = fix(nV / 60 / 60) 
        c = c & nV & "小时" 
        nV = n 
        printAskTime = c : exit function
    end if 
    if nV >= 60 then
        n = nV mod 60 
        nV = fix(nV / 60) 
        c = c & nV & "分钟" 
        nV = n 
        printAskTime = c : exit function 
    end if 
    if nV >= 0 then
        c = c & nV & "秒钟"  
        printAskTime = c : exit function 
    end if    
end function  
'获得时间
function getTimerSet()
    getTimerSet = calculationTimer(pubTimer,now)
end function  
'计算时间  
function calculationTimer(startTime,endTime)
    dim n 
    'n = formatNumber((timer() - pubTimer) * 1000, 2, - 1) / 1000 
    'calculationTimer = toNumber(n, 3)   
	calculationTimer=dateDiff("s", startTime,endTime)
end function  

'获得时间
function getTimer()
    getTimer = "<br>------------------------------------<br>页面执行时间：" & getTimerSet() & " 秒" 
end function 
'获得时间
function vbGetTimer()
    VBGetTimer = vbCrLf & "------------------------------------" & vbCrLf & "运行时间：" & calculationTimer(pubTimer,now())
end function 
'获得第三种
function vbEchoTimer()
    VBEchoTimer = "运行时间：" & calculationTimer(pubTimer,now()) & " 秒"
end function 
'获得时间第四种
function vbRunTimer(startTime)
    VBRunTimer = "运行时间：" & calculationTimer(startTime, now()) & " 秒"
end function

'添加时间
function sAddTime(timeObj,sType,nValue)
	dim s
	'秒
	if sType="s" then
		s=timeObj+0.00001*nValue
	'分钟
	elseif sType="n" then
		s=timeObj+0.00060*nValue
	'小时
	elseif sType="h" then
		s=timeObj+0.00001*nValue*60*60
	'日
	elseif sType="d" then
		s=timeObj+0.00001*nValue*60*60*24
	'周
	elseif sType="w" then
		s=timeObj+0.00001*nValue*60*60*24*7
	'月
	elseif sType="m" then
		s=timeObj+0.00001*nValue*60*60*24*30
	'季节
	elseif sType="q" then
		s=timeObj+0.00001*nValue*60*60*24*120
	'年
	elseif sType="y" then
		s=timeObj+0.00001*nValue*60*60*24*366
	end if
	sAddTime=s
end function

'数字转时间 20180228    numberToTime("230") = 04:50
function numberToTime(content)
	dim n,n1,n2,s
	n=getNumberGroup(content)
	if n<>"" then
		n=cint(n)
		n1=cint(n/60)
		if n1<10 then
			n1="0" & n1
		end if
		n2=(n mod 60)
		if n2<10 then
			n2="0" & n2
		end if
		s=n1 & ":" & n2
	end if
	numberToTime=s
end function

'把标准时间转换为UNIX时间戳 response.Write toUnixTime(now(), +8)
Function toUnixTime(strTime, intTimeZone)
    If IsEmpty(strTime) or Not IsDate(strTime) Then strTime = Now
    If IsEmpty(intTimeZone) or Not isNumeric(intTimeZone) Then intTimeZone = 0
    toUnixTime = DateAdd("h",-intTimeZone,strTime)
    toUnixTime = DateDiff("s","1970-01-01 00:00:00", toUnixTime)
End Function
'把UNIX时间戳转换为标准时间 response.Write "<hr>" & fromUnixTime("1513858770", +8)
Function fromUnixTime(nIntTime, nIntTimeZone)
    If IsEmpty(nIntTime) or Not IsNumeric(nIntTime) Then
        fromUnixTime = Now()
        Exit Function
    End If         
    If IsEmpty(nIntTime) or Not IsNumeric(nIntTimeZone) Then nIntTimeZone = 0
    fromUnixTime = DateAdd("s", nIntTime, "1970-01-01 00:00:00")
    fromUnixTime = DateAdd("h", nIntTimeZone, fromUnixTime)
End Function
%>   

