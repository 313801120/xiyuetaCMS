<% 
dim adminLevelList:adminLevelList=",网站管理员,管理人员,入库人员,审核人员,出库人员" 'admin管理员的权限列表' 
'管理员的权限列表''
dim adminPermissionLits
adminPermissionLits="文章管理,文章添加,文章修改,文章审核,文章删除"
dim isAddSystemLog:isAddSystemLog=true	'是否自动添加信息日志'

 
'获得目录树
function getSubTree(parentid)
    dim c,s
    dim rs:Set rs = CreateObject("Adodb.RecordSet")
    rs.open"select * from ["& db_PREFIX &"webcolumn] where id="&parentid,conn,1,1
    if not rs.eof then
	    c=rs("columnname")
	    if rs("parentid")<>-1 then
	        s=getSubTree(rs("parentid"))
	        if s<>"" then c=s&">>" & c
	    end if
	end if:rs.close

    getSubTree=c
end function

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
	rs.open "select * from ["& db_PREFIX &"webcolumn] where parentid="&parentid & " order by sortrank asc",conn,1,1
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
	rs.open "select * from ["& db_PREFIX &"webcolumn] where id="&parentid,conn,1,1
	if not rs.eof then
		if subStr<>"" then
			subStr="&nbsp;&nbsp;" & subStr
		else
			subStr=subStr & "&nbsp;&nbsp;├─" 
		end if
		if rs("parentid")<>-1 then
			call getSubColumSort(rs("parentid"),subStr)
		end if
	end if:rs.close
	getSubColumSort=subStr
end function
'显示栏目列表成input方式 20210331 如 <option> ├─栏目名称</opton>
function columnSubInput(parentid,focusid,focusParentid)
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s,sel,addsql
  if focusid<>"" then addSql=" and id<>"& focusid
  rs.open "select * from ["& db_PREFIX &"webcolumn] where parentid="&parentid & addsql &" order by sortrank asc",conn,1,1
  while not rs.EOF  
  	sel=""
  	if focusParentid<>"" then
  		if focusParentid=rs("id") then sel=" selected"
  	end if

    c=c & "<option value="""& rs("id") &""""& sel &">"& getSubColumSort(rs("parentid"),"")  & rs("columnName")&"</option>"    
    c=c & columnSubInput(rs("id"),IIF(focusid=-2,-3,focusid),focusParentid)  
  rs.movenext:wend:rs.close
  columnSubInput=c
end function

function getAdminIdToName(id)
	dim rs:Set rs = CreateObject("Adodb.RecordSet")   
  rs.open "select * from ["& db_PREFIX &"admin] where id="&id,conn,1,1
  if not rs.eof then
  	dim splxx
  	splxx=split(adminLevelList,",")
  	getAdminIdToName=rs("username") & "("& splxx(rs("level"))&")"
  	' getAdminIdToName=rs("username") & "("& rs("nickname")&")"
  end if:rs.close 
end function







'显示栏目列表成input方式 xiyuetaclass 20220517 如 <option> ├─栏目名称</opton>
function xiyuetaColumnSubInput(parentid,isShowTab,focusParentid)
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s,sel,addsql,sTab
  ' if focusid<>"" then addSql=" and id<>"& focusid
  rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentid="&parentid & addsql &" order by sortrank asc",conn,1,1
  while not rs.EOF  
  	sel=""
  	if focusParentid<>"" then
  		if focusParentid=rs("id") then sel=" selected"
  	end if
  	'给getxiyuetaColumnSubInputList用的，指定一个大类，让大类的第一级子类前面不要显示等级提示符20220515'
  	sTab=""
  	if isShowTab=true then
  		sTab=getXiyuetaSubColumSort(rs("parentid"),"")   '显示退格符'
  	end if
    c=c & "<option value="""& rs("id") &""""& sel &">"& sTab & rs("columnName")&"</option>"    
    c=c & xiyuetaColumnSubInput(rs("id"),true,focusParentid)    '做个判断，是-2，换成-3
  rs.movenext:wend:rs.close
  xiyuetaColumnSubInput=c
end function

'获得子栏目树状20210331  如  ├─栏目名称
function getXiyuetaSubColumSort(parentid,subStr)
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where id="&parentid,conn,1,1
	if not rs.eof then
		if subStr<>"" then
			subStr="&nbsp;&nbsp;" & subStr
		else
			subStr=subStr & "&nbsp;&nbsp;├─" 
		end if
		if rs("parentid")<>-1 then
			call getXiyuetaSubColumSort(rs("parentid"),subStr)
		end if
	end if:rs.close
	getXiyuetaSubColumSort=subStr
end function

'获得列表20220515'
function getXiyuetaColumnSubInputList(columnname,fieldName,focusid)
	dim c
	if focusid="" then focusid=-2
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	c="<select name="""& fieldName &""">"
	rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentid=-1 and columnname='"& columnname &"'",conn,1,1
	if not rs.eof then
		c=c & xiyuetaColumnSubInput(rs("id"),false,focusid)
	end If:rs.close

	c=c & "</select>"
  getXiyuetaColumnSubInputList=c
end function

'获得CheckBox列表20220515'
function getColumnCheckBoxList(columnname,fieldName,sValue)
	dim c,id,sel
	id=-2
	sValue=" "& sValue &","
	dim rs:Set rs = CreateObject("Adodb.RecordSet") 
	rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentid=-1 and columnname='"& columnname &"'",conn,1
	if not rs.eof then
		id=rs("id")
	end if:rs.close
	' call echo(columnname,id)
	rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentid="&id,conn,1,1
	while not rs.eof
		sel=""
		if instr(sValue," " & rs("columnname") & ",")>0 then sel=" checked"
			' call echo(sValue,rs("columnname"))
		c=c & "<input type=""checkbox"" name="""&fieldName&""" value='"& rs("columnName") &"' title="""& rs("columnName") &""""& sel &">"
	rs.movenext:wend:rs.close
 
  getColumnCheckBoxList=c
end function

'获得CheckBox列表20220603'
function getColumnRadioList(columnname,fieldName,sValue)
	dim c,parentid,sel
	parentid=-2
	dim rs:Set rs = CreateObject("Adodb.RecordSet") 
	rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentid=-1 and columnname='"& columnname &"'",conn,1
	if not rs.eof then
		parentid=rs("id")
	end if:rs.close

	rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentid="&parentid,conn,1,1
	while not rs.eof
		sel=""
		if cstr(sValue) = cstr(rs("id"))  then sel=" checked"
			' call echo(sValue,rs("columnname"))
		c=c & "<input type=""radio"" name="""&fieldName&""" value='"& rs("id") &"' title="""& rs("columnName") &""""& sel &">"
	rs.movenext:wend:rs.close
 
  getColumnRadioList=c
end function
'获得栏目ID对应的名称列表20220515'
function getXiyuetaColumnIdToName(id) 
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	id=id &""
	if id="" then getXiyuetaColumnIdToName="": exit function
		' call echo("id",id):doevents
	rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where id="&id,conn,1,1
	if not rs.eof then
		getXiyuetaColumnIdToName=rs("columnname")
	else
			getXiyuetaColumnIdToName=""
	end if
end function
'获得参数栏目搜索到id列表20220604   如1,2,3,4
function getXiyuetaColumnSearchIdList(keyword)
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim idlist
  rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where columnname like'%"& keyword &"%'",conn,1,1
  while not rs.eof
    if idlist<>"" then idlist=idlist&","
    idlist=idlist & rs("id")
  rs.movenext:wend:rs.close
  getXiyuetaColumnSearchIdList=idlist
end function





'html转换成js
function getHtmlToJsInput(byVal c)
    c = replace("" & c, "\", "\\") 
    c = replace(c, "/", "\/") 
    c = replace(c, "'", "\'") 
    c = replace(c, """", "\""") 
    getHtmlToJsInput=c
end function
'获得服务器上版本'
function getServerVersion()
	doevents
	dim n
	call openconn()
	rs.open "select * from ["& db_PREFIX &"website]",conn,1,3
	if not rs.eof then
		n=dateDiff("d", rs("versiontime"), now()) 
		if n<>0 then
			getServerVersion=getHttpUrl("http://xiyueta.com/server/?url="&getUrl(),"")
			rs("versiontime")=now()
			rs.update
		else
			getServerVersion="<!--" & n & "-->"
		end if
	end if:rs.close

	 
end function
%>