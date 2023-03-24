<% 
dim adminLevelList:adminLevelList=",网站管理员,管理人员,入库人员,审核人员,出库人员,其它人员" 'admin管理员的权限列表' 
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
  id = id & ""
  if id="" then 
  	getAdminIdToName="(ID为空)"
  	exit function
  end if
  ' call echo("id",id)
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
	xiyuetaColumnSubInput=handleXiyuetaColumnSubInput(parentid,isShowTab,focusValue,"id")
end function
'处理显示栏目列表成input 判断选中的字段为ID或栏目 20220807'
function handleXiyuetaColumnSubInput(parentid,isShowTab,focusValue,sType)
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s,sel,addsql,sTab
  focusValue=focusValue&""
  rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentid="&parentid & addsql &" order by sortrank asc",conn,1,1
  while not rs.EOF  
  	sel=""
  	if focusValue<>"" then
  		if sType="txt" then
  			if focusValue=cstr(rs("columnName")) then sel=" selected"
  		else
  			if focusValue=cstr(rs("id")) then sel=" selected"  		
  		end if
  		
  	end if
  	'给getxiyuetaColumnSubInputList用的，指定一个大类，让大类的第一级子类前面不要显示等级提示符20220515'
  	sTab=""
  	if isShowTab=true then
  		sTab=getXiyuetaSubColumSort(rs("parentid"),"")   '显示退格符'
  	end if
    c=c & "<option value="""& iif(sType="txt",rs("columnName"),rs("id")) &""""& sel &">"& sTab & rs("columnName")&"</option>"    
    c=c & handleXiyuetaColumnSubInput(rs("id"),true,focusValue,sType)    '做个判断，是-2，换成-3
  rs.movenext:wend:rs.close
  handleXiyuetaColumnSubInput=c
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
	getXiyuetaColumnSubInputList=handleGetXiyuetaColumnSubInputList(columnname,fieldName,focusid,"","id")
end function

'获得列表20220807 值为栏目名称'
function getXiyuetaColumnSubInputListTxt(columnname,fieldName,focusid)
	getXiyuetaColumnSubInputListTxt=handleGetXiyuetaColumnSubInputList(columnname,fieldName,focusid,"","txt")
end function
'获得列表 加默认值
function handleGetXiyuetaColumnSubInputList(columnname,fieldName,focusid,defaultOption,sType)
	dim c
	if focusid="" then focusid=-2
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	c="<select name="""& fieldName &""">"
	c=c & defaultOption
	rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentid=-1 and columnname='"& columnname &"'",conn,1,1
	if not rs.eof then
		' c=c & xiyuetaColumnSubInput(rs("id"),false,focusid,sType)
		c=c & handleXiyuetaColumnSubInput(rs("id"),false,focusid,sType) 
 
	end If:rs.close

	c=c & "</select>"
  handleGetXiyuetaColumnSubInputList=c
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
		c=c & "<input type=""checkbox""  lay-filter="""&fieldName&""" name="""&fieldName&""" value='"& rs("columnName") &"' title="""& rs("columnName") &""""& sel &">"
	rs.movenext:wend:rs.close
 
  getColumnCheckBoxList=c
end function

'获得CheckBox列表 值为栏目ID 20220603'
function getColumnRadioList(columnname,fieldName,sValue) 
  getColumnRadioList=handleColumnRadioList(columnname,fieldName,sValue,"id")
end function
'获得CheckBox列表 值为栏目名称 20220807'
function getColumnRadioListTxt(columnname,fieldName,sValue) 
  getColumnRadioListTxt=handleColumnRadioList(columnname,fieldName,sValue,"txt")
end function
'处理单选项20220807
function handleColumnRadioList(columnname,fieldName,sValue,sType)
	dim c,parentid,sel,thisValue
	sValue=sValue&""
	parentid=-2
	dim rs:Set rs = CreateObject("Adodb.RecordSet") 
	rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentid=-1 and columnname='"& columnname &"'",conn,1
	if not rs.eof then
		parentid=rs("id")
	end if:rs.close

	rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentid="&parentid,conn,1,1
	while not rs.eof
		sel=""
		thisValue=cstr(IIF(sType="txt",rs("columnName"),rs("id")) & "")

		if cstr(sValue) = thisValue then sel=" checked"
			' call echo(sValue,rs("columnname"))
		c=c & "<input type=""radio"" name="""&fieldName&""" value='"& thisValue &"' title="""& rs("columnName") &""""& sel &">"
	rs.movenext:wend:rs.close
 
  handleColumnRadioList=c
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
	end if:rs.close
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


'获得栏目id 20220510  大类>小类
function getXiyuetaClassId(columnName)
    dim splstr,s,parentid,sql
    if instr(columnName,">")>0 then
        splstr=split(columnName,">")
        for each s in splstr
            sql="Select * from " & db_PREFIX & "xiyuetaclass where columnName='" & s & "'"
            if parentid<>"" then sql = sql & " AND parentid="&parentid
            rsx.open sql, conn, 1, 1 
            if not rsx.EOF then
                parentid = rsx("id")        
                ' call echo("parentid1",parentid)
            end if : rsx.close 
        next
        ' call echo("parentid",parentid)
        if parentid="" then parentid=-1
        getXiyuetaClassId=parentid
        exit function
    end if

    getXiyuetaClassId = "-1" 
    rsx.open "Select * from " & db_PREFIX & "xiyuetaclass where columnName='" & columnName & "'", conn, 1, 1 
    if not rsx.EOF then
        getXiyuetaClassId = rsx("id")        
    end if : rsx.close 
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
			getServerVersion=getHttpUrl("http://xiyueta.com/server/?url="&escape(getthisurl()) &"&v="&version,"")
			rs("versiontime")=now()
			rs.update
		else
			getServerVersion="<!--" & n & "-->"
		end if
	end if:rs.close 
end function 


'处理电话号码20220808'
function handleTelHide(tel)
	dim tempTel
	tempTel=tel
	if len(tempTel)>4 then
		tempTel=mid(tempTel,len(tempTel)-4) & "****"
	end if
	handleTelHide=tempTel
end function
'显示大类里指定位置的时间 20220905'
function getTimeList(didList,timelist,focus)
	dim splstr,splTime,splxx,did,s,c,nLen
	didList=didList & ""
	timelist="," & timelist & "|"
	splstr=split(didList,", ")
	for each did in splstr
		if did<>"" then
			nLen=instr(timelist,","& did &"|")
			if nLen>0 then
				s=mid(timelist,nLen+len(","& did &"|"))
				splxx=split(s,"|")
				c=c & did & "("&splxx(focus) &")"
			end if
		end if
	next
	getTimeList=c
end function


'获得字段的中文标题20230315'
function getFieldAlt(byval fieldName,byval fieldAlt)
  dim configNameList,splstr,splxx,s 
  fieldName=phptrim(lcase(fieldName))
  fieldAlt=phptrim(fieldAlt)
  if fieldAlt<>"" then  
    getFieldAlt=fieldAlt
    exit function
  end if
  configNameList="userid|用户ID,title|标题,ip|IP地址,createtime|创建时间,updatetime|修改时间,isthrough|审核,bodycontent|备注,id|ID,ntype|证书类型,education|学历,address|常住地,tel|联系电话,socialsecurity|社保,profession|专业,onregistered|非注册类证书,safetyclass|安全类,guestname|姓名,idcard|身份证号,sex|性别,registrationtype|注册类型,issuetime|资格证签发时间,expirydate|证书有效截止时间,continuingeducation|注册专业近三年内继续教育情况,receiptprice|收证价格,referralfee|介绍费(元),contractperiod|收证价格,certificatepurpose|证书用途,inputselect|录入,adminid|添加者,performance|业绩,nstate|审核状态,appendix|附件,servicecharge|业务办理费,redheaderfile|是否带红头文件,payment|公司付款,personalpayment|个人付款,signingdate|合同截止日期,companyname|企业名称,companycontact|企业联络人,companytel|企业联络人电话,companyaddress|企业注册地,securityexam|安全类考试,certificatestatus|证书状态,viewidlist|已查看用户,classname|分类名称,certificatereminderday|资格证到期提醒天数,signingdatereminderday|签合同到期提醒天数,bcertificatedate|安全B证截止时间,bcertificatereminderday|安全B证截止时间到期提醒天数,companysocialsecurity|公司是否交社保,auditadminid|审核者,outadminid|出库者,reviewtime|评审时间,jobtitle|职称,timelist|多个时间组合,invoicetype|发票类型,denomination|开票面额,invoicecount|开票张数,ispayment|是否付款,issigncontract|是否签合同,isbilling|是否开票,company|公司名称,companyadminid|公司信息添加者,selectdenomination|开票面额,cumulativeamount|初始累计金额,billingcompany|开票企业,invoiceamount|开票金额,newcompanyid|新公司ID,companycontractperiod|公司签约年限,companyselectcontractperiod|签约年限选择,certificatepricexval|出证价格X值,certificateprice|出证价格,stype|类型,nvalue|设置值,username|用户账号,weburl|网址,tickettime|ticket时间,age|年龄,name|名称,"
  splstr=split(configNameList,",")
  for each s in splstr
    if instr(s,"|")>0 then
      splxx=split(s,"|")
      if splxx(0)=fieldName then
        getFieldAlt=phptrim(splxx(1))
        exit function
      end if
    end if
  next
end function

%>