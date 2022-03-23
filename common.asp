<!--#Include file = "inc/config.asp"-->
<%

'不同IP显示不同内容'
' if getIP()<>"127.0.0.1" then
' 	MDBPath = "/data/data_" & getIP() &".mdb" 
' 	if checkFile(MDBPath)=false then
' 		call copyFile("/data/data.mdb",MDBPath)
' 	end if
' end if

call openconn()
dim nav,i,j,webTitle,webKeywords,webDescription,webLogo,webQrcode,id,bodyContent,parentId,copyright,webSiteBottom,pageUrl,columnType,thisUrlFileName,navId,title,createTime,author,n,idList,columnName,columnEnName,smallImage,views
dim addSql,bannerimage
id=request("id")

rs.open "select * from " & db_PREFIX & "WebSite" ,conn,1,1
if not rs.eof then
	webTitle=rs("webTitle")					'网页标签'
	webKeywords=rs("webKeywords")			'网页关键词'
	webDescription=rs("webDescription")		'网页描述'
	webSiteBottom=rs("webSiteBottom")		'网页底部'
	copyright=rs("copyright")				'网站版权'
	webLogo=rs("logo")						'网站logo'
	webQrcode=rs("qrcode")					'网站二维码'
end if:rs.close


thisUrlFileName=lcase(request.serverVariables("script_name"))
if instr(thisUrlFileName,"/")>0 then
	thisUrlFileName=mid(thisUrlFileName,instrrev(thisUrlFileName,"/")+1)
end if
'为文章详细内容页'
if thisUrlFileName="detail.asp" then
    rs.open "select * from " & db_PREFIX & "ArticleDetail where id=" & id ,conn,1,3
    if not rs.eof then
        rs("views")=rs("views")+1	'浏览次数'
        rs.update
    	parentId=rs("parentId")
        title=rs("title")
        bodyContent=rs("bodyContent")
        createTime=rs("createTime")
        smallImage=rs("smallImage")
        author=rs("author")
        views=rs("views")
        rsx.open "select * from " & db_PREFIX & "WebColumn where id=" & rs("parentId") ,conn,1,1
        if not rsx.eof then
        	navId=rsx("id")
        	nav=getRootNavName(rsx("id"))
	        columnName=rsx("columnName")
	        columnEnName=rsx("columnEnName")
	        columnType=rsx("columnType")
        end if:rsx.close
    end if:rs.close	

elseif id<>"" then
    rs.open "select * from " & db_PREFIX & "WebColumn where id=" & id ,conn,1,1
    if not rs.eof then
    	parentId=rs("parentId")
    	navId=rs("id")
        nav=getRootNavName(rs("id"))
        columnName=rs("columnName")
        columnEnName=rs("columnEnName")
        columnType=rs("columnType")
        bodyContent=rs("bodyContent")
    end if:rs.close
end if
'导航ID不为空'
if navId<>"" then
	bannerimage=getNavBannerImage(navId)
	if bannerimage="" then bannerimage="/UploadFiles/testpic/ad.jpg"		'默认banner'
end if
'获得导航URL'
if columnType<>"" then
	pageUrl=getNavUrl(navId,columnType)
end if

'获得导航banner图片'  从后往前拿banner
function getNavBannerImage(id)
	if id="" then getNavBannerImage="": exit function
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	rs.open "select * from ["& db_PREFIX &"WebColumn] where id="&id,conn,1,1
	if not rs.eof then
		if rs("bannerimage")<>"" then
			getNavBannerImage=rs("bannerimage")
			exit function
		elseif rs("parentId")<>-1 then
			getNavBannerImage=getNavBannerImage(rs("parentId"))
		end if
	end if:rs.close
end function

'获得导航URL'
function getNavUrl(navId,navType)
	dim url
	if navId<>"" then
		dim rs:Set rs = CreateObject("Adodb.RecordSet")
		rs.open "select * from ["& db_PREFIX &"WebColumn] where id="&navId,conn,1,1
		if not rs.eof then
			if rs("httpurl")<>"" then
				getNavUrl=rs("httpurl")
				exit function
			end if
		end if:rs.close
	end if

	if navType="首页" then
		url="./"
	elseif navType="文本" then
		url="about.asp?id="&navId
	elseif navType="新闻" then
		url="news.asp?id="&navId
	elseif navType="产品" then
		url="products.asp?id="&navId
	end if
	getNavUrl=url
end function
'是否为选择导航foucs'
function isFocusNav(rs)
	if rs("columnType")="首页" and nav="" then
		isFocusNav=true
	elseif nav=rs("columnName") then	
		isFocusNav=true
	end if
end function
'网站当前位置'
function navLocation(navId,c)
	dim parentId,s:parentId=-1
	if navId="" then navLocation="": exit function
	rs.open "select * from " & db_PREFIX & "WebColumn where id=" & navId ,conn,1,1
	if not rs.eof then
		parentId=rs("parentId")
		s=rs("columnName")
		if c<>"" then s="<a href='"& getNavUrl(rs("id"),rs("columnType")) &"'>"& s &"</a>"
		c=s & " > " & c
	end if:rs.close
	if parentId<>-1 then
		call navLocation(parentId,c)
	else
		c="<a href='./'>首页</a> > "+c
	end if
	navLocation=c
end function
'获得导航字符转URL'   getNavNameToUrl("","产品中心>2020产品")
function getNavNameToUrl(parentId,c)
	dim sql,columnName,id,columnType,url
	if parentId="" then parentId=-1
	columnName=c
	if instr(c,">")>0 then
		columnName=mid(c,1,instr(c,">")-1)
		c=mid(c,instr(c,">")+1)
	else
		columnName=c
		c=""
	end if

		sql="select * from " & db_PREFIX & "WebColumn where parentId="& parentId &" and columnName='"& columnName &"'"

		' call echo("sql",sql):doevents
		rs.open sql ,conn,1,1
		if not rs.eof then
			parentId=rs("id")
			id=rs("id")
			columnType=rs("columnType")
		end if:rs.close
		' call echo(c,"有"):doevents
		if c<>"" then
			url=getNavNameToUrl(parentId,c)
		else
			url=getNavUrl(id,columnType) 
		end if
		getNavNameToUrl=url
end function
'获得导航字符转ID'     如   getNavNameToID("","产品中心>2020产品")
function getNavNameToID(parentId,c)
	dim sql,columnName,id,columnType,newID
	if parentId="" then parentId=-1
	columnName=c
	if instr(c,">")>0 then
		columnName=mid(c,1,instr(c,">")-1)
		c=mid(c,instr(c,">")+1)
	else
		columnName=c
		c=""
	end if
		sql="select * from " & db_PREFIX & "WebColumn where parentId="& parentId &" and columnName='"& columnName &"'"
		' call echo("sql",sql):doevents
		rs.open sql ,conn,1,1
		if not rs.eof then
			parentId=rs("id")
			id=rs("id")
			columnType=rs("columnType")
		end if:rs.close
		' call echo(c,"有"):doevents
		if c<>"" then
			newID=getNavNameToID(parentId,c)
		else
			newID=id
		end if
		getNavNameToID=newID
end function

'获得全部栏目ID列表 20210321  如1,4,5,6,2,6,8,9
function getColumAllID(parentid)
	if parentid="" then getColumAllID="": exit function
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	dim c,s
	rs.open "select * from ["& db_PREFIX &"WebColumn] where parentId="&parentid,conn,1,1
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
'根据栏目名称获得全部子类id'   20210531
function getNameToAllId(name)
	dim id
	id=getNavNameToID("",name)
	if id<>"" then
		idList=getColumAllID(id)
		if idList<>"" then
			getNameToAllId=id & "," & idList
		else
			getNameToAllId=id
		end if
	end if
end function

'获得主导航名称
function getRootNavName(id)
	if id="" then getRootNavName="": exit function
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	dim c,s
	rs.open "select * from ["& db_PREFIX &"WebColumn] where id="&id,conn,1,1
	while not rs.EOF
		if rs("parentId")=-1 then
			getRootNavName=rs("columnName")
			exit function
		else
			getRootNavName=getRootNavName(rs("parentId"))
		end if
	rs.movenext:wend:rs.close
end function
'获得主导航ID 20210529
function getRootNavId(id)
	if id="" then getRootNavId="": exit function
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	dim c,s
	rs.open "select * from ["& db_PREFIX &"WebColumn] where id="&id,conn,1,1
	while not rs.EOF
		if rs("parentId")=-1 then
			getRootNavId=rs("id")
			exit function
		else
			getRootNavId=getRootNavId(rs("parentId"))
		end if
	rs.movenext:wend:rs.close
end function
'获得栏目主体内容20210531'
function getColumBody(name,cutNumb)
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	rs.open "select * from ["& db_PREFIX &"WebColumn] where columnName='"& name &"'",conn,1,1
	if not rs.eof then
		getColumBody=cutStr(rs("bodyContent"),cutNumb,"...")
	end if:rs.close
end function

'获得栏目ID'
function getColumnId(name)
	dim id
	id=-1
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	rs.open "select id from ["& db_PREFIX &"WebColumn] where columnName='"& name &"'",conn,1,1
	if not rs.eof then
		id=rs("id")
	end if:rs.close
	getColumnId=id
end function

'保存留言'
function saveGuestBook()
	dim guestName,title,content,tel
	guestName=replace(request("guestName"),"<","&lt;")
	title=replace(request("title"),"<","&lt;")
	tel=replace(request("tel"),"<","&lt;")
	content=replace(request("content"),"<","&lt;")
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	rs.open "select * from ["& db_PREFIX &"GuestBook]",conn,1,3
	rs.addnew
	rs("guestName")=guestName
	rs("title")=title
	rs("bodycontent")=content
	rs("tel")=tel
	rs.update:rs.close
	saveGuestBook="留言成功！" & guestName 
end function

'获得单页内容，可截取字符值'
function getOnePageBody(title,cutNumb)	
	dim rs:Set rs = CreateObject("Adodb.RecordSet")
	rs.open"select * from ["& db_PREFIX &"onePage] where title='"& title &"'",conn,1,1
	if not rs.eof then
		getOnePageBody=rs("bodyContent")
		if cutNumb<>"" then
			getOnePageBody=cutStr(getOnePageBody,cutNumb,"...")
		end if
	end if:rs.close
end function


dim tel
tel=getOnePageBody("联系电话","")
%>