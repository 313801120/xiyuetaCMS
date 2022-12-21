<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><%
call openconn()

call echo("提示","<a href='list.asp'>点击返回</a>")

    dim c,filePath,toFilePath,did,sql,parentid,idlist
    did="新闻资讯"
	  parentid=getNavNameToID("",did)	
    idlist=getColumAllID(parentid)
    if idlist<>"" then
    	parentid=parentid & "," & idlist
    end if    
    sql = "select * from ["& db_PREFIX &"articledetail] where parentid in("& parentid &")"
    ' sql = "select * from ["& db_PREFIX &"articledetail]"

    rs.open sql,conn,1,1
    while not rs.eof
        c=c&"【parentid】"& getColumnSubStr(rs("parentid"),"") & vbcrlf
        ' c=c&"【parentid】"&rs("parentid") & vbcrlf
        c=c&"【title】"&rs("title") & vbcrlf
        c=c&"【author】"&rs("author") & vbcrlf
        c=c&"【sortrank】"&rs("sortrank") & vbcrlf
        c=c&"【smallimage】"&rs("smallimage") & vbcrlf 
        c=c&"【createtime】"&rs("createtime") & vbcrlf 
        c=c&"【filename】"&formatTime2022(rs("createtime"))&".html" & vbcrlf 
        c=c&"【isthrough】"&rs("isthrough") & vbcrlf 
        if rs("bodycontent")<>"" then c=c&"【bodycontent】"&rs("bodycontent") & "【/bodycontent】" & vbcrlf 
        c=c&"-------------------------------"&vbcrlf
    rs.MoveNext:wend:rs.close 
    filePath="/install/WebData/articledetail/新闻资讯/list2022.txt" 
    call writetofile(filePath,c,"utf-8")


'获得全部栏目ID列表 20210321  如1,4,5,6,2,6,8,9
function getColumAllID(parentid)
  if parentid="" then getColumAllID="": exit function
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s
  rs.open "select * from ["& db_PREFIX &"webcolumn] where parentid="&parentid,conn,1,1
  while not rs.EOF 
    if c<>"" then c=c & ","
    c=c & rs("id")
    s=getColumAllID(rs("id"))
    if s<>"" then
      c=c & "," & s
    end if
  rs.movenext:wend:rs.close
  getColumAllID=c
end function

'获得子栏目树状20210331  如  ├─栏目名称
function getColumnSubStr(parentid,subStr)
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	dim columnname
	rs.open "select * from ["& db_PREFIX &"webcolumn] where id="&parentid,conn,1,1
	if not rs.eof then
		columnname=rs("columnname")
		if subStr<>"" then columnname=columnname & ">"
		subStr=columnname & subStr
		if rs("parentid")<>-1 then
			call getColumnSubStr(rs("parentid"),subStr)
		end if
	end if:rs.close
	getColumnSubStr=subStr
end function

'获得导航字符转ID'     如   getNavNameToID("","产品中心>2020产品")
function getNavNameToID(parentid,c)
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim sql,columnname,id,newid,addsql
  ' if parentid="" then parentid=-1     '这个不要'
  columnname=c
  if instr(c,">")>0 then
    columnname=mid(c,1,instr(c,">")-1)
    c=mid(c,instr(c,">")+1)
  else
    columnname=c
    c=""
  end if
  if parentid<>"" then addsql=" and parentid="& parentid &""
  sql="select * from " & db_PREFIX & "webcolumn where  columnname='"& columnname &"'"&addsql
  ' call echo("sql",sql):doevents
  rs.open sql ,conn,1,1
  if not rs.eof then 
    id=rs("id") 
  end if:rs.close
  ' call echo(c,"有"):doevents
  if c<>"" and id<>"" then
    newid=getNavNameToID(id,c)
  else
    newid=id
  end if
  getNavNameToID=newid
end function


function formatTime2022(timeStr)
    dim y, m, d, h, mi, s ,c,nWeek
    if isDate(timeStr) = false then exit function 
  
   timeStr = CDate(timeStr)    '转时间类型
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
    formatTime2022= y & m & d & h & mi
end function
%>