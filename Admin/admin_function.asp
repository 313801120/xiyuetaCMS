<% 



dim isAddSystemLog:isAddSystemLog=true
'添加系统日志'
function addSystemLog(item,msg,userName)
	if isAddSystemLog=true then
		conn.Execute("insert into " & db_PREFIX & "SystemLog (item,msgstr,adminname,ip) values('" & item & "','" & msg & "','" & userName & "','" & getIP() & "')")
	end if
end function

'获得全部栏目ID列表 20210321  如1,4,5,6,2,6,8,9
function getColumAllID(parentid)
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	dim c,s
	rs.open "select * from ["& db_PREFIX &"WebColumn] where parentId="&parentid & " order by sortrank asc",conn,1,1
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
function getSubColumSort(parentid,subStr)
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	rs.open "select * from ["& db_PREFIX &"WebColumn] where id="&parentid,conn,1,1
	if not rs.eof then
		if subStr<>"" then
			subStr="&nbsp;&nbsp;" & subStr
		else
			subStr=subStr & "&nbsp;&nbsp;├─" 
		end if
		if rs("parentId")<>-1 then
			call getSubColumSort(rs("parentId"),subStr)
		end if
	end if:rs.close
	getSubColumSort=subStr
end function
'显示栏目列表成input方式 20210331 如 <option> ├─栏目名称</opton>
function columnSubInput(parentid,focusId,focusParentId)
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s,sel,addsql
  if focusId<>"" then addSql=" and id<>"& focusId
  rs.open "select * from ["& db_PREFIX &"WebColumn] where parentId="&parentid & addsql &" order by sortrank asc",conn,1,1
  while not rs.EOF  
  	sel=""
  	if focusParentId<>"" then
  		if focusParentId=rs("id") then sel=" selected"
  	end if
    c=c & "<option value="""& rs("id") &""""& sel &">"& getSubColumSort(rs("parentid"),"")  & rs("columnName")&"</option>"    
    c=c & columnSubInput(rs("id"),focusId,focusParentId)    
  rs.movenext:wend:rs.close
  columnSubInput=c
end function


'html转换成js
function getHtmlToJsInput(byVal c)
    c = replace("" & c, "\", "\\") 
    c = replace(c, "/", "\/") 
    c = replace(c, "'", "\'") 
    c = replace(c, """", "\""") 
    getHtmlToJsInput=c
end function
%>