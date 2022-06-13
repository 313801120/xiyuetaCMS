<% 
'ASP PHP数据操作通用文件

'判断追加Sql是加Where 还是And   sql = getWhereAnd(sql,addSql)        修改于20141007 加强版
function getWhereAnd(byVal sql, byVal addSql)
    dim LCaseAddSql, addType, s 
    '追加SQl为空则退出
    if trim(addSql) = "" then getWhereAnd = sql : exit function 
    if inStr(LCase(sql), " where ") > 0 then
        addType = " And " 
    else
        addType = " Where " 
    end if 
    if addSql <> "" then
        addSql = trim(addSql) 
        LCaseAddSql = LCase(addSql) 
        if left(LCaseAddSql, 6) = "order " or left(LCaseAddSql, 6) = "group " then
            getWhereAnd = sql & " " & addSql : exit function '改进必需加空格，因为前面已经删除了20160115
        elseIf left(LCaseAddSql, 6) = "where " then
            addSql = mid(addSql, 7) 
        elseIf left(LCaseAddSql, 4) = "and " then
            addSql = mid(addSql, 5) 
        end if 
        '对where 改进   20160623
        s = lcase(addSql) 
        if s <> "and" and s <> "or" and s <> "where" then
            sql = sql & addType & addSql 
        end if 
    end if 
    getWhereAnd = sql 
end function 
'多个查询 Or 与 And        二次修改于20140703
function orAndSearch(addSql, seectField, searchValue)
    dim splStr, s, c 
    searchValue = regExp_Replace(searchValue, " or ", " Or ") 
    searchValue = regExp_Replace(searchValue, " and ", " And ") 
    if inStr(searchValue, " Or ") > 0 then
        splStr = split(searchValue, " Or ") 
        for each s in splStr
            if s <> "" then
                if c <> "" then c = c & " Or " 
                c = c & " " & seectField & " Like '%" & s & "%'" 
            end if 
        next 
    elseIf inStr(searchValue, " And ") > 0 then
        splStr = split(searchValue, " And ") 
        for each s in splStr
            if s <> "" then
                if c <> "" then c = c & " And " 
                c = c & " " & seectField & " Like '%" & s & "%'" 
            end if 
        next 
    elseIf searchValue <> "" then
        splStr = split(searchValue, " And ") 
        for each s in splStr
            if s <> "" then
                if c <> "" then c = c & " And " 
                c = c & " " & seectField & " Like '%" & s & "%'" 
            end if 
        next 
    end if 
    if c <> "" then
        if inStr(LCase(addSql), " where ") = 0 then
            c = " Where " & c 
        else
            c = " And " & c 
        end if 
        addSql = addSql & c 
    end if 
    orAndSearch = addSql 
end function 



'获得当前id当前页数 默认每页显示10条 20160716
function getThisIdPage(tableName, id, nPageSize)
    dim nCount 
    '在php会出错，所以加上这个
    getThisIdPage = "1" 
    if id = "" then
        exit function 
    end if
'    if nPageSize = "" then        nPageSize = 10     end if 		'为了严谨，不要这个，以后要在.netc下运行通过，所以不用怕
    nCount = nGetRecordCount( tableName ," where id<=" & id) 
    getThisIdPage = cstr(getCountPage(cint(nCount), nPageSize)) 
'call echo("tableName=" & tableName & "id=" & id &",ncount=" & ncount,npagesize & "               ," & getThisIdPage)
end function
'获得总记录
function nGetRecordCount(tableName,addsql)
	nGetRecordCount=0
	'【@是jsp显示@】try{
	rsx.open"select * from " & tableName & " " & addsql,conn,1,1
	if not rsx.eof then
		nGetRecordCount=cint(rsx.recordcount)
	end if:rsx.close
	'【@是jsp显示@】}catch(Exception e){} 
end function


'处理SqlServer创建语法(Access转SqlServer)
'SqlServer表的创建要求比较高，空格只能为''而不能用""还有就是数值与字符类型区别
function handleSqlServer(byVal content)
    dim i, s, tempS, tempS2, c, splStr 
	
	if EDITORTYPE="jsp" then
		handleSqlServer=handleMySql(content)
		exit function
	end if
	
	
    splStr = split(content, ",") 
    for each content in splStr

        content = replace(content, """""", "''")
        content = replace(content, """", "'")				'追加于20171003
        content = replace(content, "''''", "''") 
        content = replace(content, "Date()", "GetDate()") 
        content = replace(content, "Now()", "GetDate()") 
        'Content = Replace(Content,"YesNo Default Yes"," Int Default 1")
        'Content = Replace(Content,"YesNo Default No"," Int Default 0")
        'Content = Replace(Content,"YesNo,"""," Int Default 1,""")

        content = replace(content, "YesNo Default Yes", " Bit Default 'true'") 
        content = replace(content, "YesNo Default No", " Bit Default 'false'") 
        content = replace(content, " YesNo", "  Bit Default 'true'") 
        if inStr(content, "YesNo") > 0 then
            call eerr("Content", content) 
        end if 
        for i = 1 to len(content)
            s = mid(content, i, 1) 
            if s = " " then
                tempS = LCase(mid(content, i + 1, 7)) 
                tempS2 = LCase(mid(content, i + 1, 8)) 
                if tempS = "varchar" and tempS2 <> "varchar(" then
                    c = c & " nvarchar(255)" 'nvarchar这种可以存储特殊字符'
                    i = i + 7 
                else
                    c = c & s 
                end if 
            else
                c = c & s 
            end if 
        next 
        c = c & ","   
    next 
    if c <> "" then c = left(c, len(c) - 1) 
	'call rwend(c)
    handleSqlServer = c 
end function 
'处理mysql生成sql
function handleMySql(byval content)
	
	content=replace(replace(replace(content,"""首页""",""""""),"""内页""","""""") ,"""详细页""","""""") 
	content= replace(content,"""男""","""""") 
	content= replace(replace(content,"""\Templates""","""""") ,"""\Skins\Default\""","""""") 
	content= replace(replace(content,"""\Skins\Default\Images\""","""""") ,"""\Skins\Default\Css\""","""""")  
	content= replace( replace(content,"""\Skins\Default\Js\""","""""") ,"""test3""","""""") 
	 
	 
	
	 
	content=replace(content," Text Default """""," mediumtext ") 
	content=replace(content,"Identity(0,1)","auto_increment,")
	content=replace(content,"Key,","Key(Id),")
	content=replace(content," VarChar "," varchar(255) ")  
	content=replace(content," """""," ''")
	content=replace(content," YesNo "," tinyint(1) ") 
	content=replace(content," Int "," int(8) ") 
	content=replace(content," Now()"," ''") 
	content=replace(content," Date()"," ''") 
	content=replace(content," DateTime"," varchar(255)")  
	content=replace(content," Yes"," 1")
	content=replace(content," No"," 0") 
	
	content=content & "ENGINE=MyISAM DEFAULT CHARSET=utf8;"
	
	handleMySql=content
end function
%> 
