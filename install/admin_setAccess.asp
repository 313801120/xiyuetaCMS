<% 
'【#jump#】true为true则为跳过当前
'【#top#】true为true则为停止全部


 
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

'获得栏目id
function getColumnId(columnName)
    dim splstr,s,parentid,sql
    if instr(columnName,">")>0 then
        splstr=split(columnName,">")
        for each s in splstr
            sql="Select * from " & db_PREFIX & "webcolumn where columnName='" & s & "'"
            if parentid<>"" then sql = sql & " AND parentid="&parentid
            rsx.open sql, conn, 1, 1 
            if not rsx.EOF then
                parentid = rsx("id")        
                ' call echo("parentid1",parentid)
            end if : rsx.close 
        next
        ' call echo("parentid",parentid)
        if parentid="" then parentid=-1
        getColumnId=parentid
        exit function
    end if

    getColumnId = "-1" 
    rsx.open "Select * from " & db_PREFIX & "webcolumn where columnName='" & columnName & "'", conn, 1, 1 
    if not rsx.EOF then
        getColumnId = rsx("id")        
    end if : rsx.close 
end function

'获得省市栏目id
function getSheShiId(columnName)
    getSheShiId = "-1" 
    rsx.open "Select * from " & db_PREFIX & "sheshi where columnName='" & columnName & "'", conn, 1, 1 
    if not rsx.EOF then
        getSheShiId = rsx("id") 
    end if : rsx.close 
end function

'调用callfile_setAccess文件函数
function callfile_setAccess()
    dim sType 
    sType = request("stype") 
    if sType = "backupDatabase" then
        call backupDatabase()                                '备份数据库
    elseif sType = "recoveryDatabase" then
        call recoveryDatabase()                              '恢复数据库
    else
        call eerr("setAccess页里没有动作", request("stype")) 
    end if 
end function

'恢复数据库
function recoveryDatabase()
    dim backupDir, backupFilePath 
    dim content, s, splStr, tableName 
    call handlePower("恢复数据库") 
    backupDir = adminDir & "/Data/BackUpDateBases/" 
    backupFilePath = backupDir & "/" & request("databaseName") 
    if checkFile(backupFilePath) = false then
        call eerr("数据库文件不存在", backupFilePath) 
    end if 
    content = readFile(backupFilePath,"utf-8")
    splStr = split(content, "===============================" & vbCrLf) 
    for each s in splStr
        tableName = newGetStrCut(s, "table") 
        if tableName <> "" then
            conn.execute("delete from " & db_PREFIX & tableName) 
            call echo(tableName, nImportTXTData(backupFilePath,s, tableName, "添加")) 
        end if 
    next 
    call echo("恢复数据库完成", "") 
end function 

'备份数据库
function backupDatabase()
    dim isUnifyToFile, tableNameList, databaseTableNameList, fieldConfig, fieldName, fieldType, splField, fieldValue, nLen, isOK 
    dim splStr, splxx, tableName, s, c, backupDir, backupFilePath 
    call handlePower("备份数据库") 
    tableNameList = lcase(request("tableNameList"))                                 '自定义备份数据表列表
    isUnifyToFile = IIF(request("isUnifyToFile") = "1", true, false)                '统一放到一个文件里
    databaseTableNameList = lcase(db_PREFIX & "webcolumn" & vbCrLf & getTableList()) '让db_PREFIX在最前面，因为文章类型要从这里读取
    nLen = len(db_PREFIX) 

    '处理自定义表列表
    if tableNameList <> "" then
        splStr = split(tableNameList, "|") 
        for each tableName in splStr
            if instr(vbCrLf & databaseTableNameList & vbCrLf, vbCrLf & db_PREFIX & tableName & vbCrLf) > 0 then
                if c <> "" then
                    c = c & vbCrLf 
                end if 
                c = c & db_PREFIX & tableName 
            end if 
        next 
        if c = "" then
            call eerr("自定义备份表不正确 <a href=""javascript:history.go(-1)"">点击返回</a>", tableNameList) 
        end if 
        databaseTableNameList = c 
    end if 
    splStr = split(databaseTableNameList, vbCrLf) 
    c = "" 
    for each tableName in splStr
        tableName = trim(tableName) 
        isOK = true 
        '判断前缀是否一样
        if nLen > 0 then
            if mid(tableName, 1, nLen) <> db_PREFIX then
                isOK = false 
            end if 
        end if 
        if isOK = true then
            fieldConfig = lcase(getFieldConfigList(tableName)) 
            call echo(tableName, fieldConfig) 
			'【@是jsp显示@】try{
            rs.open "select * from " & tableName, conn, 1, 1 
            c = c & "【table】" & mid(tableName, len(db_PREFIX) + 1) & vbCrLf 
            while not rs.eof
                splField = split(fieldConfig, ",") 
                for each s in splField
                    if instr(s, "|") > 0 then
                        splxx = split(s & "|", "|") 
                        fieldName = splxx(0) 
                        fieldType = splxx(1) 
                        fieldValue = rs(fieldName) 
                        if fieldType = "numb" then
                            fieldValue = replace(replace(fieldValue, "True", "1"), "False", "0") 
                        end if 
                        '后台菜单
                        if tableName = db_PREFIX & "listmenu" and fieldName = "parentid" then
                            fieldValue = getListMenuName(fieldValue) 
                        '网站栏目
                        elseif tableName = db_PREFIX & "webcolumn" and fieldName = "parentid" then
                            fieldValue = getColumnName(fieldValue) 
                        end if 
                        if fieldValue <> "" then
                            if instr(fieldValue, vbCrLf) > 0 then
                                fieldValue = fieldValue & "【/" & fieldName & "】" 
                            end if 
                            c = c & "【" & fieldName & "】" & fieldValue & vbCrLf 
                        end if 
                    end if 
                next 
                c = c & "-------------------------------" & vbCrLf 
            rs.movenext : wend : rs.close 
			'【@是jsp显示@】}catch(Exception e){} 
            c = c & "===============================" & vbCrLf 
        end if 
    next 
    backupDir = adminDir & "/Data/BackUpDateBases/" 
    backupFilePath = backupDir & "/" & format_Time(now(), 4) & ".txt" 
    call createDirFolder(backupDir) 
    call deleteFile(backupFilePath)                                                 '删除旧备份文件
    call createfile(backupFilePath, c)                                              '创建备份文件
    call hr() 
    call echo("backupDir", backupDir) 
    call echo("backupFilePath", backupFilePath) 
    call eerr("操作完成", "<a href='?act=displayLayout&templateFile=layout_manageDatabases.html&lableTitle=数据库'>点击返回 备份恢复数据</a>") 
end function 

'重置数据库数据
sub resetAccessData()
    call handlePower("恢复模板数据")                                                '管理权限处理
    call OpenConn() 
    dim splStr, i, s, columnname, title, nCount, webdataDir 
    webdataDir = request("webdataDir") 
    if webdataDir <> "" then
        if checkFolder(webdataDir) = false then
            call eerr("网站数据目录不存在，恢复默认数据未成功", webdataDir) 
        end if 
    else
        webdataDir = "/Data/WebData/" 
    end if 
    '修改网站配置
    call nImportTXTData(webdataDir,readFile(webdataDir & "/website.txt","utf-8"), "website", "修改") 
    call batchImportDirTXTData(webdataDir, db_PREFIX & "WebColumn" & vbcrlf & db_PREFIX & "xiyuetaclass" & vbCrLf & getTableList()) '加webcolumn是因为webcolumn必需新导入数据，因为后台文章类型要从里获得20160711

    ' call eerr(getTableList(),webdataDir)
    call echo("提示", "恢复数据完成") 
    call rw("<hr><a href='"& WEB_VIEWURL &"' target='_blank'>进入首页</a> | <a href=""?"" target='_blank'>进入后台</a>") 

    call writeSystemLog("", "恢复默认数据" & db_PREFIX)                             '系统日志
end sub
'导入文章20220422 /install/addData.asp?act=importArticle&webdataDir=/cai/article_营销策略
'/install/addData.asp?act=importArticle&articlePath=/1.txt
function importArticle()
    dim webdataDir,splxx,filePath,content,fileName,tableName,s
    webdataDir = request("webdataDir")
    tableName="articleDetail"

    if request("articlePath")<>"" then
        s=nImportTXTData(webdataDir,readFile(request("articlePath"),"utf-8"), tableName, "添加")             
        call eerr(tableName, filePath & " ==>> " & s) 
    end if

    content = getDirAllFileList(webdataDir, "txt") 
    splxx = split(content, vbCrLf) 
    for each filePath in splxx
        fileName = getFileName(filePath) 
        if filePath <> "" and inStr("_#", left(fileName, 1)) = false then
            s=nImportTXTData(webdataDir,readFile(filePath,"utf-8"), tableName, "添加")             
            call echo(tableName, filePath & " ==>> " & s) 
            doevents 
        end if 
    next 
end function
'导入省市县20220424 /install/addData.asp?act=importSheShi&webdataDir=/txt/
function importSheShi()
    dim webdataDir,splxx,filePath,content,fileName,tableName,s
    webdataDir = request("webdataDir")
    tableName="sheshi"

    conn.execute("delete from xy_sheshi")
call echo("importSheShi",tableName)

    content = getDirAllFileList(webdataDir, "txt") 
    splxx = split(content, vbCrLf) 
    for each filePath in splxx
        fileName = getFileName(filePath) 
        if filePath <> "" and inStr("_#", left(fileName, 1)) = false then
            s=nImportTXTData(webdataDir,readFile(filePath,"utf-8"), tableName, "添加")             
            call echo(tableName, filePath & " ==>> " & s) 
            doevents 
        end if 
    next 
end function

'批量导入相应表信息
function batchImportDirTXTData(webdataDir, tableNameList)
    dim folderPath, tableName, splStr, content, splxx, filePath, fileName, handleTableNameList 
    ' call echo("tableNameList",tableNameList)
    splStr = split(tableNameList, vbCrLf) 
    for each tableName in splStr
        if tableName <> "" then
            if db_PREFIX <> "" then
                tableName = mid(tableName, len(db_PREFIX) + 1) 
            end if 
            tableName = trim(lcase(tableName)) 
            '判断表 不重复操作
            if instr("|" & handleTableNameList & "|", "|" & tableName & "|") = false then
                handleTableNameList = handleTableNameList & tableName & "|" 

                folderPath = handlePath(webdataDir & "/" & tableName) 
                if checkFolder(folderPath) = true then
                    conn.execute("delete from " & db_PREFIX & tableName)                            '删除当前表全部数据
                    call echo("tableName", tableName) 
                    content = getDirAllFileList(folderPath, "txt") 
                    splxx = split(content, vbCrLf) 
                    for each filePath in splxx
                        '排除  d:/#temp'文件夹前面#号的20220712
                        if instr(filePath,"/#")=false and instr(filePath,"\#")=false then
                            ' call echo("dir filePath",filePath)
                            fileName = getFileName(filePath) 
                            if filePath <> "" and inStr("_#", left(fileName, 1)) = false then
                                call echo(tableName, filePath) 
                                call nImportTXTData(folderPath,readFile(filePath,"utf-8"), tableName, "添加") 
                                doevents 
                            end if 
                        end if
                    next 
                end if 
            end if 
        end if 
    next 
end function 

'导入数数
function nImportTXTData(folderPath,content, tableName, sType)
    dim fieldConfigList, splList, listStr, splStr, splxx, s, sql, nOK,isAdd
    dim fieldName, fieldType, fieldValue, addFieldList, addValueList, updateValueList 
    dim fieldStr,isJump,isStop,addSql,isArticleRepeat
    tableName = trim(lcase(tableName))                                              '表
    '这样做是为了从GitHub下载时它把vbcrlf转成 chr(10)  20160409
    if instr(content, vbCrLf) = false then
        content = replace(content, chr(10), vbCrLf) 
		content=replace(content,vbcrlf & vbcrlf, vbcrlf)
    end if 
    fieldConfigList = lcase(getFieldConfigList(db_PREFIX & tableName)) 
    splStr = split(fieldConfigList, ",") 
    splList = split(content, vbCrLf & "-------------------------------") 
    nOK = 0 
    for each listStr in splList
        addFieldList = ""                                                               '添加字段列表清空
        addValueList = ""                                                               '添加字段列表值
        updateValueList = ""                                                            '修改字段列表

        isJump = lcase(trim(newGetStrCut(listStr, "#jump#"))) 
        isStop = lcase(trim(newGetStrCut(listStr, "#stop#")))
        isarticlerepeat = lcase(trim(newGetStrCut(listStr, "#isarticlerepeat#")))
 


		'停止导入
		if isStop = "1" or isStop = "true" then
    		nImportTXTData = nOK 
			exit function
		end if
 
        if lcase(isarticlerepeat)="true" or isarticlerepeat="1" then
            isarticlerepeat=true
        else
            isArticleRepeat=false'文章重复默认为假20220428
        end if 


		'判断不是跳转当前
        if isJump <> "1" and isJump <> "true" then
            addSql=""
            for each fieldStr in splStr
                if fieldStr <> "" then
                    splxx = split(fieldStr & "| ", "|")			'必需加上| 在jsp里必需这样，不知道为什么？ 不过没关系，不影响下面执行结束 
                    fieldName = splxx(0) 
                    fieldType = splxx(1)

                    if instr(listStr, "【" & fieldName & "】") > 0 then
                        listStr = listStr & vbCrLf                                                      '加个换行是为了让最后一个参数能添加进去 20160629
                        if addFieldList <> "" then
                            addFieldList = addFieldList & "," 
                            addValueList = addValueList & "," 
                            updateValueList = updateValueList & "," 
                        end if 
                        addFieldList = addFieldList & fieldName 
'call echo(fieldName,fieldType)
'doevents
                        fieldValue = newGetStrCut(listStr, fieldName) 
                        if fieldType = "textarea" or ( EDITORTYPE="jsp" and fieldType="") then
                            fieldValue = contentTranscoding(fieldValue) 
						'加这个是为了让数子类型不要出现true 或 false 给  sqlserver用  20160803
						elseif fieldType = "yesno" or fieldType = "numb" then
							if lcase(fieldValue)="true" then
								fieldValue="1"
							elseif lcase(fieldValue)="false" then
								fieldValue="0"
							end if	
						 
                        end if 
                        'call echo(tableName,fieldName)
                        

                        '文章大类
                        if (tableName = "articledetail" or tableName = "webcolumn" or tableName = "webcolumnparam") and fieldName = "parentid" then
                            'call echo(tableName,fieldName)
                            'call echo("fieldValue",fieldValue)
                            fieldValue = getColumnId(fieldValue) 
							
							
                        '省市大类202204008
                        elseif (tableName = "sheshi") and fieldName = "parentid" then
                            'call echo(tableName,fieldName)
                            'call echo("fieldValue",fieldValue)
                            fieldValue = getSheShiId(fieldValue) 

                        '分类20220517
                        elseif (tableName = "xiyuetaclass" or tableName = "announcement") and fieldName = "parentid" then
                            'call echo(tableName,fieldName)
                            'call echo("fieldValue",fieldValue)
                            fieldValue = getXiyuetaClassId(fieldValue) 
                            'call echo("fieldValue",fieldValue)


                        '分类20220517
                        elseif (tableName = "tpl" Or tableName = "tplpage") and fieldName = "ntype" then
                            fieldValue=getXiyuetaClassId(fieldValue)
                            ' call echo("xiyuetaclass",fieldValue & "," & getXiyuetaClassId(fieldValue))
							
							
						'BBS大类20171003
						elseif (tableName = "bbsdetail" or tableName = "bbscolumn") and fieldName = "parentid" then	 
                            fieldValue = handleGetColumnID("bbscolumn", fieldValue)  
						'CAI大类20171117
						elseif (tableName = "caidetail" or tableName = "caicolumn") and fieldName = "parentid" then	 
                            fieldValue = handleGetColumnID("caicolumn", fieldValue)  
                        '后台菜单
                        elseif tableName = "listmenu" and fieldName = "parentid" then
                            fieldValue = getListMenuId(fieldValue) 
                        end if 
                        if fieldType = "date" and fieldValue = "" then
                            fieldValue = date() 
                        elseif (fieldType = "time" or fieldType = "now") and fieldValue = "" then
                            fieldValue = cstr(now()) 
                        end if 
                        if fieldType <> "yesno" and fieldType <> "numb" then
                            fieldValue = "'" & fieldValue & "'" 
                        '默认数值类型为0
                        elseif fieldValue = "" then
                            fieldValue = "0" 
                        end if

                        if (tableName = "articledetail") and isArticleRepeat=false then   '文章做处理'
                            ' call echo("isArticleRepeat",isArticleRepeat)
                            if fieldName="parentid" then
                                addSql=addSql & IIF(addSql=""," WHERE "," AND ")
                                addSql=addSql & " parentid="& fieldValue &""
                            elseif fieldName="title" then
                                addSql=addSql & IIF(addSql=""," WHERE "," AND ")
                                addSql=addSql & " title="& fieldValue &""
                            end if
                        end if

'call echo(fieldName,fieldType & "("& replace(left(fieldValue,22),"<","&lt;") &")" ) :doevents
                        addValueList = addValueList & fieldValue                                        '添加值
                        updateValueList = updateValueList & fieldName & "=" & fieldValue                '修改值
                    end if 
                end if 
            next 
            '字段列表不为空
            if addFieldList <> "" then
                isAdd=true
                if addsql<>"" and sType = "添加" then
                    call openconn()
                    sql="select * from " & db_PREFIX & "" & tableName & addsql
                    ' call echo("sql",sql):doevents
                    rs.open sql,conn,1,1
                    ' call echo("addsql count" & sql,rs.recordcount)
                    if not rs.eof then isAdd=false
                    rs.close
                end if
                '为真则可操作'
                if isAdd=true then
                    if sType = "修改" then
                        sql = "update " & db_PREFIX & "" & tableName & " set " & updateValueList 
                    else
                        sql = "insert into " & db_PREFIX & "" & tableName & " (" & handleFieldListToAccess(addFieldList) & ") values(" & addValueList & ")"
                    end if
                    '检测SQL
                    if checksql(sql) = false then
                        call eerr("出错提示1", "<hr>sql=" & sql & "<br>") 
                    end if

                    nOK = nOK + 1 
                end if
            else
                nOK = nBatchImportColumnList(folderPath,content,splStr, listStr, nOK, tableName) 

            end if 
        end if 

    next 
    nImportTXTData = nOK 
end function
'处理字段列表可以插入到数据库中20220627'  完美解决数据库里的字段不可直接使用的问题
function handleFieldListToAccess(fieldList)
    dim temlFieldList
    temlFieldList=fieldList
    if fieldList<>"" then
        fieldList="[" & replace(fieldList,",","],[") & "]"
    end if
    ' call echo(temlFieldList,fieldList)
    handleFieldListToAccess=fieldList
end function
'批量导入栏目列表 20160716
function nBatchImportColumnList(folderPath,content,splField, byval listStr, nOK, tableName)
    dim splStr, splxx, isColumn, columnName, s, c, nLen, id, parentIdArray(99), columntypeArray(99), flagsArray(99), nIndex, fieldStr, fieldName, valueStr, nCount, bodycontent
    dim fileName, templatepath, rowC,addColumnNameData
    isColumn = false 
    nCount = 0 
    listStr = replace(listStr, vbTab, "    ") 
    splStr = split(listStr, vbCrLf) 
    for each s in splStr
        rowC = "" 
        if left(trim(s), 1) = "#" then
        '为#号则不执行
        elseif s = "【#sub#】" then
            isColumn = true 
        elseif isColumn = true then
            columnName = s 
            if instr(columnName, "【|】") > 0 then
                columnName = mid(columnName, 1, instr(columnName, "【|】") - 1) 
            end if 
            columnName = rTrim(columnName) 
            nLen = len(columnName) 
            columnName = ltrim(columnName) 
            nLen = nLen - len(columnName) 
            nIndex = cint(nLen / 4) 
            if columnName <> "" then
                parentIdArray(nIndex) = columnName 
                rowC = rowC & "【columnname】" & columnName & vbCrLf 
                for each fieldStr in splField
                    splxx = split(fieldStr & "|", "|") 
                    fieldName = splxx(0) 
                    if fieldName <> "" and fieldName <> "columnname" and instr(s, fieldName & "='") > 0 then
                        valueStr = getStrCut(s, fieldName & "='", "'", 2) 
                        rowC = rowC & "【" & fieldName & "】" & valueStr & vbCrLf 

                        if fieldName = "columntype" then
                            columntypeArray(nIndex) = valueStr 
                        elseif fieldName = "flags" then
                            flagsArray(nIndex) = valueStr 

                        elseif fieldName = "templatepath" then
                            templatepath = valueStr 
                        elseif fieldName = "filename" then
                            fileName = valueStr 

                        end if 
                    end if 
                next 
                'call echo(filename,templatepath)
                if instr(fileName, "[thistemplate]") > 0 then
                    rowC = vbCrLf & "【filename】" & replace(fileName, "[thistemplate]", templatepath) & vbCrLf & rowC 
                end if 
                if nIndex <> 0 then
                    rowC = rowC & "【parentid】" & parentIdArray(nIndex - 1) & vbCrLf 
                    rowC = rowC & "【columntype】" & columntypeArray(nIndex - 1) & vbCrLf 
                    rowC = rowC & "【flags】" & flagsArray(nIndex - 1) & vbCrLf 
                    if columntypeArray(nIndex) = "" then
                        columntypeArray(nIndex) = columntypeArray(nIndex - 1) 
                    end if 
                    if flagsArray(nIndex) = "" then
                        flagsArray(nIndex) = flagsArray(nIndex - 1) 
                    end if 

                else
                    rowC = rowC & "【parentid】-1" & vbCrLf 
                end if 
                rowC = rowC & "【sortrank】" & nCount & vbCrLf
                ' call echo("folderPath",folderPath  & " - " & columnName)
                '追加数组，以.dat方式存放20220413'
                addColumnNameData=readFile(folderPath & "/" & columnName & ".dat","utf-8")
                'if addColumnNameData<>"" then call eerr("addColumnNameData",addColumnNameData)
				s=getStrCut(content & addColumnNameData,"【"& columnName &"】","【/"& columnName &"】",2)
                rowC = rowC & "【bodycontent】" & s & "【/bodycontent】" & vbCrLf
				if s <>"" then
					'call echo("s",s)				
				end if
				 
                nCount = nCount + 1 
				rowC = rowC & getRowConfigData(content,parentIdArray,nIndex) 
                c = c & rowC & "-------------------------------" & vbCrLf 
            end if 
        end if 
    next 
    'call die(createfile("1.txt",c))
    '继续导入
    if c <> "" then
        call nImportTXTData(folderPath,c, tableName, "添加") 
    end if 
    nBatchImportColumnList = nCount 
end function
'获得当前行配置数据
function getRowConfigData(content,parentIdArray,nIndex)
	dim i,s,c
	for i=0 to nIndex
		s=parentIdArray(i)
		if c<>"" then
			c=c & "/"
		end if
		c=c & s
	next
	s=getStrCut(content,"【###"& c &"###】","【/###"& c &"###】",2)
	getRowConfigData= vbcrlf & s & vbcrlf
end function

'新的截取字符20160216
function newGetStrCut(content, title)
    dim s 
    '这样做是为了从GitHub下载时它把vbcrlf转成 chr(10)  20160409
    if instr(content, vbCrLf) = false then
        content = replace(content, chr(10), vbCrLf) 
    end if 
    if inStr(content, "【/" & title & "】") > 0 then
        s = aDSql(phptrim(getStrCut(content, "【" & title & "】", "【/" & title & "】", 0))) 
    else
        s = aDSql(phptrim(getStrCut(content, "【" & title & "】", vbCrLf, 0))) 
    end if 
    newGetStrCut = s 
end function 

'内容转码
function contentTranscoding(byVal content)
    content = replace(replace(replace(replace(content, "<?", "&lt;?"), "?>", "?&gt;"), "<" & "%", "&lt;%"), "?>", "%&gt;") 
 
    dim splStr, i, s, c, isTranscoding, isBR 
    isTranscoding = false 
    isBR = false 
	
    '这样做是为了从GitHub下载时它把vbcrlf转成 chr(10)  20160409
    if instr(content, vbCrLf) = false then
        content = replace(content, chr(10), vbCrLf) 
    end if 
	
    splStr = split(content, vbCrLf) 
    for each s in splStr
        if inStr(s, "[&html转码&]") > 0 then
            isTranscoding = true 
        end if 
        if inStr(s, "[&html转码end&]") > 0 then
            isTranscoding = false 
        end if 
        if inStr(s, "[&全部换行&]") > 0 then
            isBR = true 
        end if 
        if inStr(s, "[&全部换行end&]") > 0 then
            isBR = false 
        end if 

        if isTranscoding = true then
            s = replace(replace(s, "[&html转码&]", ""), "<", "&lt;") 
        else
            s = replace(s, "[&html转码end&]", "") 
        end if 
        if isBR = true then
            s = replace(s, "[&全部换行&]", "") 
            if right(trim(s), 8) <> "【《】/div>" then
                s = s & "<br>" 
            end if 
        else
            s = replace(s, "[&全部换行end&]", "") 
        end if 
        '标签样式超简单添加 20160628
        if instr(s, "【article_lable】") > 0 then
            s = replace(s, "【article_lable】", "") 
            s = "<div class=""article_lable"">" & s & "</div>" 
        elseif instr(s, "【article_blockquote】") > 0 then
            s = replace(s, "【article_blockquote】", "") 
            s = "<div class=""article_blockquote"">" & s & "</div>" 
        end if 


        if c <> "" then
            c = c & vbCrLf 
        end if 
        c = c & s 
    next 
    c = replace(replace(c, "【b】", "<b>"), "【/b】", "</b>") 
    c = replace(c, "【《】", "<") 

    c = replace(replace(c, "【strong】", "<strong>"), "【/strong】", "</strong>") 
    contentTranscoding = c 
end function 

 
%>