<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../inc/Config.asp"-->
<!--#Include File = "../admin_function.asp"-->
<!--#Include File = "../admin_safe.Asp"--><% 
call openconn()
dim sql,i,d,num,page,stemp,mysql,currentPage,perpage,page_count,totalrec,n,sS,useragent,curl,sHr

If Request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116) Then
num = Request(ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116))
page = Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))
stemp = ChrW(123)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(34)&ChrW(58)&ChrW(91)  
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(60)&ChrW(62)&ChrW(39)&ChrW(39) 
If Request(ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)) <> "" Then
sql = sql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(40)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(44) & Request(ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)) & ChrW(41)&ChrW(62)&ChrW(48) 
End if 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110)) <> "" Then
sql=sql & IIF(instr(sql,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & getAccessDatediffTime(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(105)&ChrW(110))) & ChrW(60)&ChrW(61)&ChrW(48)  
End if 
If Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120)) <> "" Then
sql=sql & IIF(instr(sql,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql = sql & getAccessDatediffTime(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),Request(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(109)&ChrW(97)&ChrW(120))) & ChrW(62)&ChrW(61)&ChrW(48) 
End if 
If Request(ChrW(107)&ChrW(101)&ChrW(121)) <> "" Then
sql=sql & IIF(instr(sql,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32))=false,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32),ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32))
sql =sql & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37) & Request(ChrW(107)&ChrW(101)&ChrW(121)) & ChrW(37)&ChrW(39)&ChrW(32) 
End if    
mysql = sql & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99) 

rs.Open mysql, conn, 1, 1 
If Not rs.EOF Then
If Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)) = "" Then
currentPage = 1 
Else
currentPage = CInt(Request(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))) 
End if 
perpage = num 
rs.PageSize = perpage 
rs.AbsolutePage = currentPage 
page_count = 0 
i =(page - 1) * num 
totalrec = rs.RecordCount 
While (Not rs.EOF) And(Not page_count = rs.PageSize)
i = i + 1 
page_count = page_count + 1 
If totalrec Mod perpage = 0 Then
n = totalrec \ perpage 
Else
n = totalrec \ perpage + 1 
End if 
If CInt(page) = n Then
sS = totalrec 
Else
sS = page * num 
End if 
If Trim(rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116))) = "" Or IsNull(rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116))) Then
useragent = "" 
Else
useragent = Replace(Replace(rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116)), ChrW(32), ""), ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32), "") 
End if 
curl = Replace(Replace(Replace(rs(ChrW(117)&ChrW(114)&ChrW(108)), ChrW(32), ""), ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32), ""), ChrW(92), "") 
If i = sS Then
sHr = "" 
Else
sHr = ChrW(44) 
End if 
stemp = stemp & ChrW(123)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(100)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(112)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(112)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & useragent & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(112)&ChrW(118)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(112)&ChrW(118)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(119)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(119)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(104)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(104)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)) & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(34)&ChrW(58)&ChrW(34) & curl & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34) & rs(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) & ChrW(34)&ChrW(125) &sHr & "" 
rs.MoveNext 
Wend 
End if 
stemp = stemp & ChrW(93)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(34)&ChrW(58)&ChrW(34) & rs.RecordCount & ChrW(34)&ChrW(44)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(48)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(125) 
Response.Write stemp 
rs.Close 
response.End()
End if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>访客统计</title> 
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" type="text/css"/>
<script src="../js/echarts.min.js?v1"></script>
<script type="text/javascript" src="../layuiadmin/layui/layui.js"></script>
<script src="../js/macarons.js?v1"></script>
</head>
<style>
.chart_ip{
width: 900px;
height: 400px;
}
</style>
<body style="padding: 0 10px 10px 10px; background: #FFF"> 
<div class="layui-tab" lay-filter="test">
<ul class="layui-tab-title">
<li class="layui-this" lay-id="11">访客统计</li>
<li lay-id="22">访客图表统计</li>
<li lay-id="33">来源排行</li>
<li lay-id="44">访客列表</li>
</ul>
<div class="layui-tab-content" style="padding:0px;">
<div class="layui-tab-item layui-show">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layui-table">
<thead>
<tr>
<td colspan="7" align="center"><strong>访客访问量统计</strong></td>
</tr>
<tr>
<td>统计类型</td>
<td>昨日</td>
<td>今天</td>
<td>本周</td>
<td>本月</td>
<td>本年</td>
<td>全部</td>
</tr>
</thead>
<tr>
<td>IP</td>  
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediff(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(49)&ChrW(32)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(112)
rs.open sql,conn,1,1
response.Write rs.recordcount&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)
rs.close
%></td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediff(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&ChrW(32)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(112)
rs.open sql,conn,1,1
response.Write rs.recordcount&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)
rs.close
%></td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediffWeek(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&ChrW(32)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(112)
rs.open sql,conn,1,1
response.Write rs.recordcount&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)
rs.close  
%></td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediffMonth(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&ChrW(32)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(112)
rs.open sql,conn,1,1
response.Write rs.recordcount&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)
rs.close
%></td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediffYear(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&ChrW(32)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(112)
rs.open sql,conn,1,1
response.Write rs.recordcount&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)
rs.close
%></td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(32)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(112)
rs.open sql,conn,1,1
response.Write rs.recordcount&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)
rs.close
%></td>
</tr>
<tr>
<td>PV</td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(118)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediff(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(49)&ChrW(32)
rs.open sql,conn,1,1
if isnull(rs(ChrW(116)&ChrW(112)&ChrW(118)))=true then
response.Write(ChrW(48))
else
response.Write rs(ChrW(116)&ChrW(112)&ChrW(118))
end if
rs.close
%></td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(118)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediff(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&ChrW(32)
rs.open sql,conn,1,1
if isnull(rs(ChrW(116)&ChrW(112)&ChrW(118)))=true then
response.Write(ChrW(48))
else
response.Write rs(ChrW(116)&ChrW(112)&ChrW(118))
end if
rs.close
%></td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(118)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediffWeek(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&ChrW(32)
rs.open sql,conn,1,1
if isnull(rs(ChrW(116)&ChrW(112)&ChrW(118)))=true then
response.Write(ChrW(48))
else
response.Write rs(ChrW(116)&ChrW(112)&ChrW(118))
end if
rs.close
%></td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(118)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediffMonth(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&ChrW(32)
rs.open sql,conn,1,1
if isnull(rs(ChrW(116)&ChrW(112)&ChrW(118)))=true then
response.Write(ChrW(48))
else
response.Write rs(ChrW(116)&ChrW(112)&ChrW(118))
end if
rs.close
%></td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(118)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediffYear(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)) &ChrW(61)&ChrW(48)&ChrW(32)
rs.open sql,conn,1,1
if isnull(rs(ChrW(116)&ChrW(112)&ChrW(118)))=true then
response.Write(ChrW(48))
else
response.Write rs(ChrW(116)&ChrW(112)&ChrW(118))
end if
rs.close
%></td>
<td><%sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(118)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)
rs.open sql,conn,1,1
if isnull(rs(ChrW(116)&ChrW(112)&ChrW(118)))=true then
response.Write(ChrW(48))
else
response.Write rs(ChrW(116)&ChrW(112)&ChrW(118))
end if
rs.close
%></td>
</tr>
</table>
</div>
<div class="layui-tab-item" >
<div id="chart_ip" class="chart_ip"></div></div>  
<div class="layui-tab-item">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layui-table">
<thead>
<tr>
<td colspan="2" align="center"><strong>来源排行</strong></td>
</tr>
<tr>
<td>来源</td>
<td>次数</td>
</tr>
</thead><%
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(32)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(32)
rs.open sql,conn,1,1
do while not rs.eof
%>
<tr>
<td><%=rs(ChrW(117)&ChrW(114)&ChrW(108))%></td>
<td><%=rs(ChrW(116)&ChrW(110)&ChrW(117)&ChrW(109))%></td>
</tr><%rs.movenext
loop
rs.close%>
</table> 
</div>
<div class="layui-tab-item"> 
<div class="layui-form" style="padding-top: 10px;">
<div class="layui-inline">
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_min" placeholder="开始日期" autocomplete="off" class="layui-input date">
</div>
<div class="layui-input-inline">-</div>
<div class="layui-input-inline" style="width: 100px;">
<input type="text" name="date_max" placeholder="结束日期" autocomplete="off" class="layui-input date">
</div>
</div>
<div class="layui-inline">
<input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的ip">
</div>
<button class="layui-btn" data-type="reload">搜索</button>
</div>
<table class="layui-hide" id="table" lay-filter="demo"></table>
</div> 
</div>
</div>
<script>
$(function(){
var myChart = echarts.init(document.getElementById("chart_ip"),'macarons');
myChart.setOption({
title: {
left: 'center',
text: '最近10日访客统计'
},
tooltip: {
trigger: 'axis'
},
legend: {
bottom:0,
textStyle:{
color:'#123'
},
//orient:'vertical',
},
grid: {
left: '0%',
right: '0%',
bottom: '10%',
top:'10%',
containLabel: true
},
xAxis: {
type: 'category',
boundaryGap: true,
axisTick:{show:false},
axisLabel:{
textStyle:{
color:"#666", //刻度颜色
fontSize:12  //刻度大小
}
},
axisLine:{
show:true,
lineStyle:{
color: '#5FB878',
width: 2,
type: 'solid'
}
},
splitLine:{
show:true,
lineStyle:{
color: '#eee',
width: 1,
type: 'solid'
}
},
data:[ <%
for i=0 to 9
D=9-i
response.Write ChrW(39)&month(DateAdd(ChrW(100), -D, date()))&ChrW(45)&day(DateAdd(ChrW(100), -d, date()))&ChrW(39)&ChrW(44)
next%> ]
},
yAxis: {
type: 'value',
axisTick:{show:false},
axisLabel:{
textStyle:{
color:"#666", //刻度颜色
fontSize:12  //刻度大小
}
},
axisLine:{
show:true,
lineStyle:{
color: '#5FB878',
width: 2,
type: 'solid'
}
},
splitLine:{
show:true
}
},
series: [
{
name:'PV',
type:'line',
itemStyle : {  
normal : {  
color:'#006AD4'
},
lineStyle:{
normal:{
color:'#F3891B',
opacity:1
}
}
},
data:[
<%
for i=0 to 9
D=9-i
// call die(getAccessDatediffTime(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),DateAdd(ChrW(100), -D, date())))
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(118)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediffTime(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),DateAdd(ChrW(100), -D, date())) &ChrW(61)&ChrW(48)&ChrW(32)
rs.open sql,conn,1,1
if isnull(rs(ChrW(116)&ChrW(112)&ChrW(118))) then
response.Write ChrW(48)&ChrW(44)
else
response.Write rs(ChrW(116)&ChrW(112)&ChrW(118))&ChrW(44)
end if
rs.close
next%>
]
},
{
name:'IP',
type:'line',
itemStyle : {  
normal : {  
color:'#009895'
},
lineStyle:{
normal:{
color:'#009895',
opacity:1
}
}
},
data:[<%
for i=0 to 9
D=9-i
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(112)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)+db_PREFIX+ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediffTime(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),DateAdd(ChrW(100), -D, date())) &ChrW(61)&ChrW(48)&ChrW(32)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(112)
rs.open sql,conn,1,1
response.Write rs.recordcount&ChrW(44)
rs.close
next%>]
}
]
}  
);
})
</script>
<script>
layui.use('table', function() {
var table = layui.table;
//方法级渲染
table.render({
elem: '#table',
url: '?act=list',
toolbar: '#toolbarDemo',
title: '用户数据表',
cellMinWidth: 100 ,
cols: [
[
{ field: 'id', title: 'ID', width: 50, sort: false }
, { field: 'ip', title: 'ip', sort: true }
, { field: 'addr', title: '地址', sort: true }
, { field: 'pv', title: 'pv', sort: true }
, { field: 'w', title: '屏幕宽', sort: true }
, { field: 'h', title: '屏幕高', sort: true }
, { field: 'url', title: '来源', sort: true }
, { field: 'useragent', title: 'useragent', sort: false }
, { field: 'intime', title: '发布时间', width: 150, sort: true }
]
],
id: 'testReload',
page: true,
limit: 20
});
var $ = layui.$,
active = {
reload: function() {
var demoReload = $('#demoReload');
//执行重载
table.reload('testReload', {
page: {
curr: 1 //重新从第 1 页开始
},
where: {
date_min: $('input[name=date_min]').val(),
date_max: $('input[name=date_max]').val(),
key: $('input[name=key]').val()
}
});
}
};
$('.layui-form .layui-btn').on('click', function() {
var type = $(this).data('type');
active[type] ? active[type].call(this) : '';
});
});
</script>
<script type="text/javascript" src="../js/pc.js"></script>  
</body>
</html>
