<% 
'Access (2013,10,22)   需要整理下，太多太乱(20151117)


'===================================== SQl操作部分 =====================================

'插入
sub connInsertInto(sql)
	conn.Execute(sql)
end sub
'更新
sub connUpdate(sql)
	'call echo("sql",sql) 
	conn.Execute(sql)
end sub

'处理成Access数据库值 (20151116)  用法 conn.execute("update product set content='"& AD(c) &"'")
function handleAccessData(byVal valueStr)
    handleAccessData = replace(valueStr, "'", "''") 
end function 

'判断数据库密码
function checkAccessPass(MDBPath, accessPass)
    on error resume next 
    dim conn 
    checkAccessPass = true 
    set conn = createObject("Adodb.Connection")
        conn.open "Provider = Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database PassWord = '" & accessPass & "';Data Source = " & MDBPath 
        conn.close 
        if err <> 0 then
            err.clsoe 
            checkAccessPass = false 
        end if 
end function 
'判断SQl是否正确
function checkSql(sql)
    on error resume next 
    conn.execute(sql) 
    checkSql = IIF(err = 0, true, false) 
end function 
'创建表
function createTable(tableName)
    dim sql 
    if checkSql(tableName) = false then
        sql = "Create Table " & tableName & " (Id int Identity(0,1) Primary Key)" 
        conn.execute(sql) 
        createTable = true 
    else
        createTable = false 
    end if 
end function 
'判断表是否显示 并输出回显
function showIsTable(tableName)
    showIsTable = existsTable(tableName) 
    if showIsTable = false then
        call rw("创建表[" & tableName & "]成功√<br>") 
    else
        call rw("表[" & tableName & "]已经存在<br>") 
    end if 
end function 
'记录总数 总记录，可判断是否有记录
function getRecordCount(tableName, addSql)
    'Call Eerr("","Select Count(*) From [" & Table & "]" & AddSql)
    call OpenConn() 
    getRecordCount = conn.execute("Select Count(*) From [" & tableName & "] " & addSql)(0) 
end function
function tableCount(table, addSql)
    tableCount = getRecordCount(table, addSql) 
end function  

'打开表RsOpenTable
function openTable(tableName, addSql)
    rs.open "Select * From [" & tableName & "] " & addSql, conn, 1, 1 
end function 
'插入大类
function insertTable(tableName, tableFields, values)
    conn.execute("Insert Into[" & tableName & "](" & tableFields & ") Values('" & values & "')") 
end function 
'显示表字段内容
function getTableText(tableName, fieldName, addSql)
    on error resume next 
    getTableText = conn.execute("Select " & fieldName & " From [" & tableName & "]" & addSql)(0) 
    if err.number <> 0 then call eerr("出错了", tableName & "-" & fieldName & "-" & addSql) 
end function 
'创建Mdb
function createMdb(accessPath)
    dim conn 
    accessPath = handlePath(accessPath) 
    set conn = createObject("ADOX.Catalog")
        conn.create("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & accessPath) 
        createMdb = "创建数据库[" & accessPath & "]成功√<br>" & vbCrLf 
    set conn = nothing 
end function 
'删除表
function deleteTable(tableName)
    tableName = trim(tableName) 
    deleteTable = false 
    if tableName = "" then
        exit function 
    end if 
    if checkTable(tableName) then
        deleteTable = true 
		Conn.Execute("Drop Table [" & tableName & "]")
    end if 
    
'End If
end function 
'删除全部表
function deleteAllTable(tableList)
    dim splStr, tableName, c 
    splStr = split(tableList, vbCrLf) 
    for each tableName in splStr
        if c <> "" then c = c & vbCrLf 
        c = c & "删除表【" & tableName & "】" & deleteTable(tableName) 
    next 
    deleteAllTable = c 
end function 

'判断表
function checkTable(tableName)
    on error resume next 
    conn.execute("Select * From [" & tableName & "]") 
    if not err.number = 0 then
        err.clear                                                                       '清除该错误
        checkTable = false 
    else
        checkTable = true 
    end if 
end function
'判断表，并显示是否存在否
function checkTable_show(tableName)
	checkTable_show=checkTable(tableName)
	if checkTable_show=true then
        call rw("表[" & tableName & "]已经存在<br>")		
	else
        call rw("创建表[" & tableName & "]成功√<br>")
	end if
end function

'调用上面 (辅助)
function existsTable(table)
    existsTable = checkTable(table) 
end function 
'修改表名
function editTable(db, tableName, newTable)
    dim connStr, oCat, oTbl 
    editTable = false 
    if checkTable(tableName) and checkTable(newTable) = false then
        connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & db 
        set oCat = createObject("ADOX.Catalog")
            oCat.activeConnection = connStr 
            set oTbl = createObject("ADOX.Table")
                set oTbl = oCat.tables(tableName)                                               '要重命名的表名：OldTable
                    oTbl.name = newTable                                                            '新表名
                set oCat = nothing 
            set oTbl = nothing 
            editTable = true 
        set oCat = nothing 
    end if 
end function 
'判断字段
function checkField(tableName, fieldName)
    checkField = false 
    if checkTable(tableName) then
        on error resume next 
        conn.execute("Select " & fieldName & " From [" & tableName & "]") 
        if not err.number = 0 then
            err.clear                                                                       '清除该错误
            checkField = false 
        else
            checkField = true 
        end if 
        err.clear 
    end if 
end function 
'调用上面 (辅助)
function existsField(table, fieldName)
    existsField = checkField(table, fieldName) 
end function 
'修改字段,
function editField(tableName, fieldName, toFieldName)
    'On Error Resume Next
    dim fieldType 
    editField = false 
    if checkTable(tableName) then
        if checkField(tableName, toFieldName) = false and checkField(tableName, fieldName) then
            fieldType = getFieldAlt(tableName, fieldName) 
            if fieldType <> "" then
                'MsgBox (tableName & vbCrLf & FieldName & vbCrLf & ToFieldName & "类型" & FieldType)
                conn.execute("Alter Table [" & tableName & "] Add [" & toFieldName & "] " & fieldType & "") '添加字段
                conn.execute("Update [" & tableName & "] Set " & toFieldName & "=[" & fieldName & "]") '把A字段数据复制到B字段数据中
                conn.execute("Alter Table [" & tableName & "] Drop [" & fieldName & "]") '删除字段
            end if 
            if err.number <> 0 then msgBox(tableName & vbCrLf & fieldName & vbCrLf & toFieldName & "类型" & fieldType) 
        end if 
    end if  
end function
'追加字段
function addField(tableName,fieldName,fieldType)
	if fieldType="" then
		fieldType="VarChar"
	end if
	if checkField(tableName,fieldName) = false then
		conn.execute("Alter Table [" & tableName & "] Add [" & fieldName & "] " & fieldType & "") '添加字段
        addField=true
        exit function
	end if 
    addField=false
end function
'删除字段 20220906
function delField(tableName,fieldName)
    if checkField(tableName,fieldName) = true then
        conn.execute("Alter Table [" & tableName & "] Drop [" & fieldName & "]") '删除字段
        delField=true
        exit function
    end if 
    delField=false
end function
'修改字段类型和默认值 20220906
'如  call editFieldTypeDefault("table","field"," DateTime NULL")
function editFieldTypeDefault(tableName,fieldName,configValue)
    if checkField(tableName,fieldName) = true then
        conn.execute("Alter Table [" & tableName & "] Alter COLUMN [" & fieldName & "] " & configValue) '删除字段
        editFieldTypeDefault=true
        exit function
    end if 
    editFieldTypeDefault=false
end function
'获得字段属性
function getFieldAlt(tableName, fieldName)
	getFieldAlt=getFieldAlt_conn(tableName, fieldName,conn)
end function
function getFieldAlt_conn(tableName, fieldName,customConn)
    dim n, fn, fld, rs 
	getFieldAlt_conn=""
    set rs = createObject("Adodb.RecordSet")
        rs.open "Select * From [" & tableName & "]", customConn, 1, 1 
        fn = rs.fields.count 
        for n = 0 to fn - 1
            set fld = rs.fields.item(n)
                if lcase(fieldName) = lcase(fld.name) then
                    ' MsgBox (FieldName & vbCrLf & Rs.Fields(N).Type)
                    ' MsgBox (FieldName & vbCrLf & Rs.Fields(N).Type)
                    select case rs.fields(n).type
                        case "202"
                            getFieldAlt_conn = "VarChar" 
                        case "203"
                            getFieldAlt_conn = "Text" 
                        case "201"  '在sqlserver里有201'
                            getFieldAlt_conn = "Text" 
                        case "7"
                            getFieldAlt_conn = "DateTime" 
                        case "135"  'sqlserver里135也是时间类型'
                            getFieldAlt_conn = "DateTime" 
                        case "3"
                            getFieldAlt_conn = "Int"  
                        case "11"
                            getFieldAlt_conn = "YesNo" 
                        case "5"
                            getFieldAlt_conn = "Float" 
                        case else
                            msgBox(rs.fields(n).type & vbCrLf & fieldName & "没有类型 表为" & tableName) 
                            getFieldAlt_conn = "没类型" & rs.fields(n).type 
                    end select
                    exit for 
                end if 
            set fld = nothing 
        next : rs.close 
end function
'获得字段默认值20230509'
function getFieldDefaltValue(tableName,fieldName)  
    Dim rs 
    Set rs = conn.OpenSchema(4, Array(Empty, Empty, tableName, fieldName))
    getFieldDefaltValue = rs("COLUMN_DEFAULT")  
end function
'获得指定数据库 里表列表
function getTableList_Conn(conn) 
    dim s, c, rs 
    set rs = conn.openSchema(20)
        rs.moveFirst 
        do until rs.EOF
            if rs("TABLE_TYPE") = "TABLE" then
                s = rs("TABLE_NAME") 
                if c <> "" then c = c & vbCrLf 
                c = c & s 
            end if 
            rs.moveNext 
        loop 
        getTableList_Conn = c 
end function
'获得数据库表列表
function getTableList()
    getTableList = getTableList_Conn(conn) 
end function 
'获得表字段列表
function getFieldList(tableName)
    getFieldList = getFieldList_conn(tableName,conn)
end function 
'获得自定义表字段列表20171208
function getFieldList_conn(tableName,customConn)
    dim fn, c, fld, n,tempRs
	Set tempRs = CreateObject("Adodb.RecordSet")
    ' call echo("tableName",tableName):doevents
    'on error resume next 
    '字段
    tempRs.open "Select * From [" & tableName & "]", customConn, 1, 1 
    if tempRs.fields.count = 0 then exit function                                   '为零退出
    fn = tempRs.fields.count 
    'if err <> 0 then call eerr("字段2", tempRs.fields.count) 
    c = "," 
    for n = 0 to fn - 1
        set fld = tempRs.fields.item(n)
            c = c & fld.name & "," 
        set fld = nothing 
    next : tempRs.close 
    getFieldList_conn = c 
end function
'获得表字段配置列表20160226
function getFieldConfigList(tableName)
    dim fn, c, fld, n, s 
   ' on error resume next 
    '字段
    tempRs.open "Select * From [" & tableName & "]", conn, 1, 1 
    if tempRs.fields.count = 0 then exit function                                   '为零退出
    fn = tempRs.fields.count 
    'if err <> 0 then call eerr("字段3", tempRs.fields.count) 
    c = "," 
    for n = 1 to fn - 1
        set fld = tempRs.fields.item(n)
            'call echo(fld.name,Fld.Type)
            '5为Float
            if fld.type = 3 or fld.type = 5 or fld.type = 11 then                           '201为sqlserver
                s = "|numb|0" 
            elseif fld.type = 7 or fld.type = 135 then                                      '135为sqlserver
                s = "|time|" 
            elseif fld.type = 203 or fld.type = 201 then                                    '201为sqlserver
                s = "|textarea|" 
            else
                s = "||" 
            end if 
            c = c & fld.name & s & "," 

        set fld = nothing 
    next : tempRs.close 
    getFieldConfigList = c 
end function 

'获得表字段列表 20170221
function getFirstField(tableName)
    dim fn, c, fld, n ,tempRs
		Set tempRs = CreateObject("Adodb.RecordSet")
    'on error resume next 
    '字段
    tempRs.open "Select * From [" & tableName & "]", conn, 1, 1 
    if tempRs.fields.count = 0 then exit function                                   '为零退出
    fn = tempRs.fields.count 
    'if err <> 0 then call eerr("字段4", tempRs.fields.count) 
    
    getFirstField =tempRs.fields.item(0).name
end function 

'获得插入数据表字段列表
function getInstallFieldList(tableName)
    dim fn, c, fld, n,tempRs 
		Set tempRs = CreateObject("Adodb.RecordSet")
    'on error resume next 
    '字段
    tempRs.open "Select * From [" & tableName & "]", conn, 1, 1 
    if tempRs.fields.count = 0 then exit function                                   '为零退出
    fn = tempRs.fields.count 
    'if err <> 0 then call eerr("字段2", tempRs.fields.count) 
    for n =1 to fn - 1
        set fld = tempRs.fields.item(n)
			if c<>"" then
				c=c & ","
			end if
            c = c & fld.name
        set fld = nothing 
    next : tempRs.close 
    getInstallFieldList = c 
end function 

'获得不同数据库表字段列表 (.mdb Or .xls)
function getDifferentTableFieldList(connObj, table)
    dim fn, c, fld, n ,rs,conn
		Set rs = CreateObject("Adodb.RecordSet")
    '重复打开这个数据库
    if typeName(connObj) = "Connection" then
        set conn = createObject("Adodb.Connection")
            conn.open(connObj) 
    end if
    '字段
    rs.open "Select * From [" & table & "]", conn, 1, 1 
    fn = rs.fields.count 
    c = "," 
    for n = 1 to fn - 1
        set fld = rs.fields.item(n)
            c = c & fld.name & "," 
        set fld = nothing 
    next : rs.close 
    getDifferentTableFieldList = c 
end function 
'Call Echo("压缩数据库", compactDB("D:\个人制作\html1\Admin\Data\Data.mdb", False))
'=====================压缩参数========================= boolIs97 这个好像没有什么用
'压缩数据库
function compactDB(dBPath, boolIs97)
    dim fso, engine, strDBPath, JET_3X 
    dBPath = handlePath(dBPath) 
    strDBPath = left(dBPath, inStrRev(dBPath, "\")) 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(dBPath) then
            fso.copyFile dBPath, strDBPath & "temp.mdb" 
            set engine = createObject("JRO.JetEngine")
                if boolIs97 = true then
                    engine.compactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb;" & "Jet OLEDB:Engine Type=" & JET_3X 
                else
                    engine.compactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb", "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb" 
                end if 
                fso.copyFile strDBPath & "temp1.mdb", dBPath 
                fso.deleteFile(strDBPath & "temp.mdb") 
                fso.deleteFile(strDBPath & "temp1.mdb") 
            set engine = nothing 
            compactDB = "<font color=#FF0000><b>你的数据库, " & dBPath & ", 已经压缩成功!</b></font>" & vbCrLf 
        else
            compactDB = "<font color=#FF0000><b>数据库名称或路径不正确. 请重试!</b></font>" & vbCrLf 
        end if 
    set fso = nothing 
end function 
'修改数据库数据密码
function editAccessPassWord(dBPath, oldPass, newPass)
    dim path, miJRO 
    set miJRO = createObject("JRO.JetEngine")
        call handlePath(dBPath)                                                         '获得完整路径
        path = "Test_News.Mdb" 
        call handlePath(path)                                                           '获得完整路径
        call deleteFile(path) 
        on error resume next 
        miJRO.compactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dBPath & ";Jet OLEDB:Database Password=" & oldPass, "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & path & ";Jet OLEDB:Database Password=" & newPass 
        if err.number <> 0 then editAccessPassWord = "密码错误" : err.clear : exit function 
        call deleteFile(dBPath)                                                         '删除数据库
        call MoveFile(path, dBPath)                                                     '移动新数据库
        editAccessPassWord = "修改成功，新密码为[" & newPass & "]" 
    set miJRO = nothing 
end function 

'====================================================================
'数据库 导入导出操作 call ExportToExcel(GetDataTableList("Product","")) 把表导出xls组合方法


'Excel导出函数 Call ExportToExcel("内容列表")
sub exportToExcel(tableContent)
    response.contentType = "application/vnd.ms-Excel" 
    response.addHeader "Content-Disposition", "attachment;Filename=Results.xls" 
    response.write("<body>" & vbCrLf) 
    response.write(tableContent & vbCrLf) 
    response.write("</body>" & vbCrLf) 
    response.write("</html>" & vbCrLf) 
end sub 
'导入到数据库里 待完善
sub importToDatabase()
    '打开XML
    dim xlsFile, xmlConn, xmlRs 
    xlsFile = server.mapPath("1.xls") 
    set xmlConn = createObject("Adodb.Connection")
        xmlConn.open "Provider=Microsoft.Jet.OLEDB.4.0;Extended Properties=Excel 8.0;Data Source=" & xlsFile 
        set xmlRs = createObject("Adodb.RecordSet")
            '打开MDB
            dim mdbFile, mdbConn, mdbRs 
            mdbFile = server.mapPath("" & adminDir & "Data/Data.mdb") 
            set mdbConn = createObject("Adodb.Connection")
                mdbConn.open "Provider = Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database PassWord = '';Data Source = " & mdbFile 
                set mdbRs = createObject("Adodb.RecordSet")

                    '获得xls全部字段
                    dim fn, n, fld, xlsFieldList 
                    xmlRs.open "Select * From [Excel$]", xmlConn, 1, 1 
                    fn = xmlRs.fields.count 
                    for n = 1 to fn - 1
                        set fld = xmlRs.fields.item(n)
                            xlsFieldList = xlsFieldList & fld.name & "," 
                        set fld = nothing 
                    next : xmlRs.close 
                    call echo("xlsFieldList", xlsFieldList) 
                    '把xls数据导入mdb
                    dim splStr, fieldName 
                    splStr = split(xlsFieldList, ",") 
                    xmlRs.open "Select * From [Excel$]", xmlConn, 1, 1 
                    call echo("xls里数据有", xmlRs.recordCount) 
                    'On Error Resume Next
                    while not xmlRs.EOF
                        mdbRs.open "Select * From [Product]", mdbConn, 1, 3 
                        mdbRs.addNew 
                        for each fieldName in splStr
                            fieldName = trim(fieldName) 
                            if fieldName <> "" then
                                call echo("显示字段", fieldName) 
                                doevents 
                                mdbRs(fieldName) = xmlRs(fieldName) 
                            end if 
                        next 
                        call echo("添加记录", "") 
                        'Call Rw("<hr>")
                        mdbRs.update : mdbRs.close 
                    xmlRs.moveNext : wend : xmlRs.close 
end sub
'获得数据表列表 GetDataTableList("Product")
function getDataTableList(tableName, addSql)
    dim dataFieldList, splStr, i, c, fieldName 
    c = c & "<table width=""100%"" border=""1"" cellspacing=""0"" cellpadding=""0"">" & vbCrLf 
    'Call OpenConn()         '打开数据库
    dataFieldList = getFieldList(tableName) 
    'Call Echo(TableName & "字符列表",DataFieldList)
    splStr = split(dataFieldList, ",") 
    c = c & "  <tr>" & vbCrLf 
    for i = 1 to uBound(splStr) - 1
        c = c & "    <td>" & splStr(i) & "</td>" & vbCrLf 
    next 
    c = c & "  </tr>" & vbCrLf 

    rs.open "Select * From [" & tableName & "] " & addSql, conn, 1, 1 
    while not rs.EOF
        c = c & "  <tr>" & vbCrLf 
        for each fieldName in splStr
            if fieldName <> "" then
                c = c & "    <td>" & rs(fieldName) & "</td>" & vbCrLf 
            end if 
        next 
        c = c & "  </tr>" & vbCrLf 
    rs.moveNext : wend : rs.close 
    c = c & "</table>" & vbCrLf 
    getDataTableList = c 
end function 
'给表追加字段   如 Call Echo("追加字段",SetTableField("Admin,aa,Int Default 1|Admin,bb,VarChar(255) Default 'str'|"))
function setTableField(conn, content)
    dim splStr, splxx, i, s, c, tableName, fieldName, sql 
    splStr = split(content, "|") 
    for i = 0 to uBound(splStr)
        s = splStr(i) 
        if s <> "" then
            splxx = split(s, ",") 
            tableName = splxx(0) 
            fieldName = splxx(1) 
            on error resume next 
            sql = "alter table " & tableName & " add column " & fieldName & " " & splxx(2) & "" 
            conn.execute sql 
            if err.number = 0 then
                c = c & "[表" & tableName & "]【字段" & fieldName & "】添加新字段成功<hr>" & vbCrLf 
            else
                err.close 
                c = c & "[表" & tableName & "]【字段" & fieldName & "】添加失败<hr>" & vbCrLf 
            end if 
        end if 
    next 
    setTableField = c 
end function 

'此函数会将 recordset 栏位类型代码转换为易读的英文识别字 别人引用过来，待应用
function getTypeString(typeId)
    select case typeId
        case 0 : getTypeString = "Empty"
        case 16 : getTypeString = "TinyInt"
        case 2 : getTypeString = "SmallInt"
        case 3 : getTypeString = "Int"
        case 20 : getTypeString = "BigInt"
        case 17 : getTypeString = "UnsignedTinyInt"
        case 18 : getTypeString = "UnsignedSmallInt"
        case 19 : getTypeString = "UnsignedInt"
        case 21 : getTypeString = "UnsignedBigInt"
        case 4 : getTypeString = "Single"
        case 5 : getTypeString = "Double"
        case 6 : getTypeString = "Currency"
        case 14 : getTypeString = "Decimal"
        case 131 : getTypeString = "Numeric"
        case 11 : getTypeString = "Bit"
        case 10 : getTypeString = "Error"
        case 132 : getTypeString = "UserDefined"
        case 12 : getTypeString = "Variant"
        case 9 : getTypeString = "IDispatch"
        case 13 : getTypeString = "IUnknown"
        case 72 : getTypeString = "GUID"
        case 7 : getTypeString = "Date"
        case 133 : getTypeString = "DBDate"
        case 134 : getTypeString = "DBTime"
        case 135 : getTypeString = "Datetime"
        case 8 : getTypeString = "BSTR"
        case 129 : getTypeString = "Char"
        case 200 : getTypeString = "VarChar"
        case 201 : getTypeString = "LongVarChar"
        case 130 : getTypeString = "WChar"
        case 202 : getTypeString = "Text"
        case 203 : getTypeString = "Memo"
        case 128 : getTypeString = "Binary"
        case 204 : getTypeString = "VarBinary"
        case 205 : getTypeString = "LongVarBinary"
        case else : getTypeString = "Unknown Type"
    end select
end function 
'获得产品指定条数随机ID列表
function getProductRndIdList(rs, nItem)
    dim nCount, i, j, rndIdList, pidList, nOK, id, splxx 
    '执行检索
    nCount = rs.recordCount 
    nItem = CInt(nItem)                                                             '转成数据类型
    nOK = 0 
    randomize timer                                                                 '初始化随机数生成器
    '循环二次
    for j = 1 to 3
        for i = 1 to nCount
            id = int(rnd * nCount + 1) 
            if inStr("," & rndIdList & ",", "," & id & ",") = false then
                rndIdList = rndIdList & id & "," 
                nOK = nOK + 1 
                if nOK >= nItem then
                    'Call Eerr(RndIdList &"nOK=" & nOK,"nItem=" & nItem)
                    exit for 
                end if 
            end if 
        next 
        if nOK >= nItem then exit for 
    next 
    '获得产品ID
    splxx = split(rndIdList, ",") 
    for i = 1 to nCount
        if inStr("," & rndIdList & ",", "," & i & ",") > 0 then
            pidList = pidList & rs(0) & "," 
        end if 
    rs.moveNext : next 
    if pidList <> "" then pidList = left(pidList, len(pidList) - 1) 
    getProductRndIdList = pidList 
'Call Eerr(RndIdList,PidList)
end function 
'获得某字段内容 20150129  例：getFieldValue("WebSite","WebTitle","")     '获得网站标题
function getFieldValue(tableName, fieldName, addSql)
    dim rs 
    call OpenConn() 
    set rs = createObject("Adodb.RecordSet")
        rs.open "Select * From [" & tableName & "] " & addSql, conn, 1, 1 
        if not rs.EOF then
            getFieldValue = rs(fieldName) 
        end if : rs.close 
end function
'获得某字段全部循环内容 20150129  例：getFieldValue("WebSite","WebTitle","")     '获得网站标题
function getFieldValueList(sql, fieldName)
    dim rs,s,c
    call OpenConn() 
    set rs = createObject("Adodb.RecordSet")
    rs.open sql, conn, 1, 1 
    while not rs.eof
		if c<>"" then
			c=c & vbcrlf
		end if
		c=c & rs(fieldName) 
	rs.movenext:wend:rs.close
	getFieldValueList=c
end function


'获得指定数据库句柄字段内容　指定Conn对象
function getConnFieldValue(objConn, tableName, fieldName, addSql)
    on error resume next 
    dim rs 
    set rs = createObject("Adodb.RecordSet")
        rs.open "Select * From [" & tableName & "] " & addSql, objConn, 1, 1 
        if not rs.EOF then
            'Call Echo(TableName, FieldName):Doevents
            getConnFieldValue = rs(fieldName) 
        end if : rs.close 
        if err <> 0 then call eerr(tableName, fieldName) 
end function
'给某字段写内容 20150129  例：Call setFieldValue("WebSite","WebTitle","中国人","")     '设置网站标题
function setFieldValue(tableName, fieldName, writeValue, addSql)
    dim rs 
    call OpenConn() 
    setFieldValue = false 
    set rs = createObject("Adodb.RecordSet")
        rs.open "Select * From [" & tableName & "] " & addSql, conn, 1, 3 
        if not rs.EOF then
            rs(fieldName) = writeValue 
            rs.update 
            setFieldValue = true 
        end if : rs.close 
end function

'文件二进制写入数据库20150312 Call FileBinaryAddAccess(Conn,"Admin","test1","","","UploadFiles\testimages2015_source.jpg")
function fileBinaryAddAccess(conn, tableName, fieldName, id, addSql, filePath)
    dim sql, rs 
    set rs = createObject("Adodb.RecordSet")
        sql = "Select " & fieldName & " From [" & tableName & "]" 
        sql = getWhereAnd(sql, addSql) 
        if id <> "" then
            sql = getWhereAnd(sql, "Where Id=" & id) 
        end if 
        rs.open sql, conn, 1, 3 
        if not rs.EOF then
            rs(fieldName).appendChunk getFileBinaryContent(filePath) 
            'Call eerr(sql,filepath):Doevents
            rs.update 
        end if : rs.close 
end function
'显示数据库指定字段数据流内容20150312 Call ShowAccessStream(Conn,"Admin","test1","","")
function showAccessStream(conn, tableName, fieldName, id, addSql)
    dim sql, rs 
    set rs = createObject("Adodb.RecordSet")
        sql = "Select " & fieldName & " From [" & tableName & "]" 
        sql = getWhereAnd(sql, addSql) 
        if id <> "" then
            sql = getWhereAnd(sql, "Where Id=" & id) 
        end if 
        rs.open sql, conn, 1, 3 
        if not rs.EOF then
            'Response.ContentType = "img/*"
            response.binaryWrite rs(fieldName).getChunk(7500000) 
        end if : rs.close 
end function
'Access数据库转成Mysql生成SQL,再放到php里生成就可以20220425' 
function accessToMySql(findTableList)
   dim content,splstr,i,tableName,fieldList,isDXX,splxx,fieldName,c,fieldAlt,cleanTableName,focusId
   content=getTableList_Conn(conn)
   splstr=split(content,vbcrlf)
   call echo("content",content)
   for i=0 to ubound(splstr)
      tableName=splstr(i):cleanTableName=tableName
      if i>129 then exit for'只提取几个
      if db_PREFIX<>"" then cleanTableName=mid(tableName,len(db_PREFIX)+1)
      
      call echo(findTableList,cleanTableName)

      if instr("|"& findTableList &"|","|"& cleanTableName &"|") or findTableList="*" then
          c=c&"""{$db_PREFIX}"& cleanTableName &""" => ""CREATE TABLE `{$db_PREFIX}"& cleanTableName &"` (" & vbcrlf
          
          fieldList=getFieldList(tableName)
          call echo("tableName",tableName)
          isDXX=IIF(fieldList<>lcase(fieldList),"<b style='color:red'>有大写</b>","")
          call echo(copystr("&nbsp;",4) & "fieldList" & isDXX,fieldList)
          splxx=split(fieldList,",")
          for each fieldName in splxx
             if fieldName<>"" then
                fieldAlt=getFieldAlt(tableName,fieldName)
                call echo(copystr("&nbsp;",8) & "fieldName",fieldName &"  ("& fieldAlt &")")            
                if fieldAlt="VarChar" then
                   c=c & "`"& fieldName &"` varchar(255) NOT NULL default '', " & vbcrlf
                elseif fieldAlt="Int" then
                   if instr("|age|","|"&fieldName&"|")>0 then
                      c=c & "`"& fieldName &"` int(2) NOT NULL default '0',"&vbcrlf
                   elseif instr("|level|score|w|h|passingscore|totalscore|timelimit|fenshu|grouping|","|"&fieldName&"|")>0 then
                      c=c & "`"& fieldName &"` int(3) NOT NULL default '0',"&vbcrlf
                   elseif instr("|lottery|npagesize|","|"&fieldName&"|")>0 then
                      c=c & "`"& fieldName &"` int(4) NOT NULL default '0',"&vbcrlf
                   elseif instr("|views|sortrank|pv|frequency|maxfrequency|days|logincount|errcount|difficulty|education|socialsecurity|registrationtype|continuingeducation|performance|payment|personalpayment|auditadminid|outadminid|securityexam|certificatestatus|companyaddress|contractperiod|selectcontractperiod|servicecharge|companysocialsecurity|jobtitle|certificatereminderday|signingdatereminderday|personnea|personneb|enterprisea|enterpriseb|loginstatus|port|statuscode|bottomstatuscode|win32statuscode|handletime|workyear|workmonth|no1|no2|no3|no4|no5|no6|no7|no8|no9|no10|no11|no12|no13|no14|no15|no16|no17|no18|no19|no20|no21|no22|no23|no24|no25|no26|no27|no28|no29|no30|no31||||||||","|"&fieldName&"|")>0 then
                      c=c & "`"& fieldName &"` int(5) NOT NULL default '0',"&vbcrlf
                   elseif instr("|parentid|exid|userid|timoid|money|hanziid|adminid|toadminid|websize|ntype|articleid|memberid|touserid|ipcount|inadminid|||||||||","|"&fieldName&"|")>0 then
                      c=c & "`"& fieldName &"` int(6) NOT NULL default '0',"&vbcrlf 

                   elseif instr("|count|fabulous|good|bad|articlemessageid|viewcount|urlcount|||||","|"&fieldName&"|")>0 then
                      c=c & "`"& fieldName &"` int(9) NOT NULL default '0',"&vbcrlf 


                   elseif instr("|isthrough|isdel|onregistered|sex|nstate|isiplimit|nbuy|istop|ishot|sustain|oppose|nofollow|boyorgirl|asporhtml|||||","|"&fieldName&"|")>0 then
                      c=c & "`"& fieldName &"` tinyint(1) NOT NULL default '1',  "&vbcrlf 


                  elseif instr("|id|","|"&fieldName&"|")>0 then
                      c=c&"`"& fieldName &"` int(6) unsigned NOT NULL auto_increment," & vbcrlf
                      focusId=fieldName'ID


                   else
                      call eerr("提示" & fieldName,"Int数字类型没有判断")   
                   end if

                elseif fieldAlt="Float" then 
                    if instr("|fenshu|gotowork|askforleave|compensatoryleave|belate|salary|netsalary|||","|"&fieldName&"|")>0 then
                      c=c & "`"& fieldName &"` float(3) NOT NULL default '0',"&vbcrlf
                    elseif instr("|referralfee|","|"&fieldName&"|")>0 then
                      c=c & "`"& fieldName &"` float(5) NOT NULL default '0',"&vbcrlf

                    elseif instr("|price|","|"&fieldName&"|")>0 then
                      c=c & "`"& fieldName &"` float(9) NOT NULL default '0',"&vbcrlf
                  else
                      call eerr("提示","Float浮点类型没有判断")   
                   end if
                elseif fieldAlt="DateTime" then
                   c=c & "`"& fieldName &"` datetime DEFAULT NULL,"&vbcrlf
                elseif fieldAlt="Text" then
                   c=c & "`"& fieldName &"` mediumtext,"&vbcrlf
               elseif fieldAlt="" then
                  c=c&"`"& fieldName &"` int(6) unsigned NOT NULL auto_increment," & vbcrlf
                  focusId=fieldName'ID
                else
                   call eerr("提示","字符类型没有判断")
                end if
             end if
          next
          doevents
          c=c & "PRIMARY KEY  (`"& focusId &"`)" & vbcrlf
          c=c & "){$char};""," & vbcrlf
    end if
   next
   accessToMySql=c
end function


'Access数据库转成SQLServer生成SQL,再放到php里生成就可以20220425'
'例子：   accessToSQLServer("","admin")
function accessToSQLServer(clear_db_PREFIX,findTableList)
   dim content,splstr,i,tableName,fieldList,isDXX,splxx,fieldName,c,fieldAlt,cleanTableName,focusId
   dim fieldDefaultVal,j,sqlTableName
   content=getTableList_Conn(conn)
   content=lcase(content)   '表全部转小写 20230311'
   findTableList=lcase(findTableList)   '查找表列表转小写'
   splstr=split(content,vbcrlf)
   call echo("content",content)
   for i=0 to ubound(splstr)
      tableName=splstr(i):cleanTableName=tableName
      if i>129 then exit for'只提取几个
      if db_PREFIX<>"" then cleanTableName=mid(tableName,len(db_PREFIX)+1)
      
      call echo(findTableList,cleanTableName)



        sqlTableName=cleanTableName
        if clear_db_PREFIX<>"" then
            sqlTableName=mid(cleanTableName,len(clear_db_PREFIX)+1)
        end if

      if instr("|"& findTableList &"|","|"& cleanTableName &"|") or findTableList="*" then
          c=c & "    tableName = db_PREFIX & """& sqlTableName &""" " & vbcrlf
          c=c & "    if checkCreateTable(tableName) = false then" & vbcrlf
          
          fieldList=getFieldList(tableName)
          call echo("tableName",tableName)
          isDXX=IIF(fieldList<>lcase(fieldList),"<b style='color:red'>有大写</b>","")
          call echo(copystr("&nbsp;",4) & "fieldList" & isDXX,fieldList)
          splxx=split(fieldList,",")
          j=0

' c=c & "        sql = ""Create Table "" & tableName & "" (mytestid Int Identity(0,1) Primary Key,"" " & vbcrlf 
c=c & "        sql = ""Create Table "" & tableName & "" ("" " & vbcrlf 
          for each fieldName in splxx
             j=j+1
             if fieldName<>"" then
                fieldAlt=getFieldAlt(tableName,fieldName)
                fieldDefaultVal=getFieldDefaultVal(tableName,fieldName)
                if fieldDefaultVal<>"" then
                    if fieldAlt="VarChar" or fieldAlt="Text" then
                        fieldDefaultVal=replace(fieldDefaultVal,"""","")
                        fieldDefaultVal=""""""& fieldDefaultVal &""""""
                    end if
                end if
                if fieldDefaultVal<>"" then
                    fieldDefaultVal = " Default "& fieldDefaultVal
                end if

                call echo("fieldDefaultVal",fieldDefaultVal)
                call echo(copystr("&nbsp;",8) & "fieldName",fieldName &"  ("& fieldAlt &")")    

                if fieldAlt="Int"  and j<3 and 1=1 then
' c=c & "        sql = sql & ""["&fieldName &"] Int  Primary Key,"" " & vbcrlf
c=c & "        sql = sql & ""["&fieldName &"] Int Identity(1,1) Primary Key,"" " & vbcrlf

                else
c=c&"        sql = sql & ""["&fieldName&"] "& fieldAlt & fieldDefaultVal &""& IIF(j<>ubound(splxx),",",")") &"""  '" & getFieldNote(tableName,fieldName) & vbcrlf
                end if
             end if

          next
          doevents
c=c & "        if MDBPath = """" then sql = handleSqlServer(sql) '把Access数据库类型转成SqlServer数据库类型" & vbcrlf
c=c & "        conn.execute(sql)" & vbcrlf
c=c & "    end if" & vbcrlf
 
    end if
   next
   accessToSQLServer=c
end function

'获得字段默认值20221025'
function getFieldDefaultVal(tableName,findFieldName)
    dim objColumnRS,fieldName
    findFieldName=lcase(findFieldName)  '小写'
    Set objColumnRS = Conn.OpenSchema(4,Array(Empty, Empty, tableName))
    do while not objColumnRS.EOF
    ' objColumnRS("Column_Default") '返回该字段默认值
    ' objColumnRS("Column_Name") '返回字段名
        fieldName=lcase(objColumnRS("Column_Name"))
        if fieldName=findFieldName then
            getFieldDefaultVal=objColumnRS("Column_Default")
            if getFieldDefaultVal="""""" then getFieldDefaultVal=""
             

    Set objColumnRS = Nothing
    Set objColumnRS = Nothing
            exit function
        end if 
    objColumnRS.MoveNext
    Loop
    Set objColumnRS = Nothing
    Set objColumnRS = Nothing
    getFieldDefaultVal=""
end function 

'获得字段的注释20221025'  用法：  call rw( getFieldNote("admin","username") )
function getFieldNote(tableName,fieldName)
    dim sql,cnnState,i
    dim rs 

    Dim MyTableName
    Dim MyFieldName
    Dim MyDB
    set mydb=server.createobject("adox.catalog")
    Dim MyTable
    set mytable=server.createobject("adox.table")
    Dim MyField
    set myfield =server.createobject("adox.column")
    Dim pro

    tableName=lcase(tableName)
    ' On Error resume next
    MyDB.ActiveConnection =conn
    For Each MyTable In MyDB.Tables
        if lcase(MyTable.name)=tableName then
            For Each MyField In MyTable.Columns 
                if lcase(MyField.name)=fieldName then
                    For Each pro In MyField.Properties
                        if pro.name="Description" then
                            getFieldNote=pro.Value
                            exit function
                        end if
                    Next
                end if
            Next
        end if
    Next 
    getFieldNote=""
end function

'获得表里数据转成sql 20221025'   nRow每个表要显示的条数
function getTableListToSql(clear_db_PREFIX,tableName,nRow)
    dim list,c,splField,fieldName,i,j,s,nCount,fieldAlt,sqlTableName
    list=getFieldList(tableName)
    splField=split(list,",")
    rs.open"select * from " & tableName,conn,1,1 
    for j=1 to nRow'rs.RecordCount
        if rs.eof then exit for   '在最后退出'


        sqlTableName=tableName
        if clear_db_PREFIX<>"" then
            sqlTableName=mid(tableName,len(clear_db_PREFIX)+1)
        end if

        c=c & "    rs.open""select * from ""& db_PREFIX &"""& sqlTableName &""",conn,1,3" & vbcrlf
        c=c & "    rs.addnew"&vbcrlf
        for i=1 to ubound(splField)-1
            fieldName=splField(i)
            fieldAlt=getFieldAlt(tableName,fieldName)
            
            s=rs(fieldName)
            if isNull(s) then s=""
            s=replace(replace(s,"""",""""""),vbcrlf,"""&vbcrlf&""")
            '为时间类型 并且为空'
            if s="" and fieldAlt="DateTime" then
                s="NULL"
            elseif s<>"" then
                s="""" & s & """"
            end if
            if s<>"" then
                ' call echo(i,fieldName & "=" & rs(fieldName))
                c=c & "        rs("""& fieldName &""")=" & s & vbcrlf
            end if
            
        next
        c=c & "    rs.update:rs.close" & vbcrlf & vbcrlf
    rs.movenext:next:rs.close


    getTableListToSql=c
end function


'获得表里数据转成sql 20221031'   nRow每个表要显示的条数
function getTableListToSqlLanguage(clear_db_PREFIX,tableName,nRow,parentTableName)
    dim list,c,splField,fieldName,i,j,s,nCount,fieldAlt,sqlTableName
    dim addFieldList,addFieldValueList
    list=getFieldList(tableName)
    splField=split(list,",")
    rs.open"select * from " & tableName,conn,1,1 

    '先关闭后开启'
    if parentTableName<>"" then
        c=c & "set identity_insert "& parentTableName &" off"&vbcrlf 
    end if

    c=c & "set identity_insert "& tableName &" on"&vbcrlf
    for j=1 to nRow'rs.RecordCount
        if rs.eof then exit for   '在最后退出' 

        sqlTableName=tableName
        if clear_db_PREFIX<>"" then
            sqlTableName=mid(tableName,len(clear_db_PREFIX)+1)
        end if

        addFieldList="":addFieldValueList=""
        for i=1 to ubound(splField)-1
            fieldName=splField(i)
            fieldAlt=getFieldAlt(tableName,fieldName)
            
            if addFieldList<>"" then addFieldList=addFieldList & ", "
            addFieldList=addFieldList & "[" & fieldName & "]"
            s=rs(fieldName)
            if isNull(s) then s="NULL"
            s=replace(s,"'","''")  '处理字符内容'
            if addFieldValueList<>"" then addFieldValueList=addFieldValueList&","
            addFieldValueList=addFieldValueList & "N'"& s &"'"
        next
        c=c & "INSERT INTO ["& tableName &"] ("& addFieldList &") VALUES("& addFieldValueList &")" & vbcrlf & vbcrlf
    rs.movenext:next:rs.close


    getTableListToSqlLanguage=c
end function



'获得表里数据保存到本地 20221026'   nRow每个表要显示的条数
function handleTableListToFile(clear_db_PREFIX,tableName,nRow)
    dim list,c,splField,fieldName,i,j,s,nCount,fieldAlt,dirPath,filePath
    list=getFieldList(tableName)
    splField=split(list,",")

    dirPath="install\webdata\" & tableName
    if clear_db_PREFIX<>"" then
        dirPath="install\webdata\" & mid(tableName,len(clear_db_PREFIX)+1)
    end if

    
    call createFolder(dirPath)      '创建目录'

    rs.open"select * from " & tableName,conn,1,1 
    for j=1 to nRow'rs.RecordCount
        if rs.eof then exit for   '在最后退出' 
        filePath=dirPath & "/" & j & ".txt"        
        if checkFile(filePath)=false then
            c=""
            for i=1 to ubound(splField)-1
                fieldName=splField(i)
                fieldAlt=getFieldAlt(tableName,fieldName)
                
                s=rs(fieldName)
                if isNull(s) then s=""
                 
                ' call echo(i,fieldName & "=" & rs(fieldName))
                c=c & "【"& fieldName &"】"& s &"【/"& fieldName &"】" & vbcrlf
                
            next
            call writeToFile(filePath,c,"utf-8")
            call echo("保存文件",filePath)
            doevents
        end if
        
    rs.movenext:next:rs.close


    handleTableListToFile=j
end function 



'获得表里数据转成sql 20221031'   nRow每个表要显示的条数
function getTableListToSqlAspRun(clear_db_PREFIX,tableName,nRow,parentTableName)
    dim list,c,splField,fieldName,i,j,s,nCount,fieldAlt,sqlTableName
    dim addFieldList,addFieldValueList,clear_TableName,clear_parentTableName
    list=getFieldList(tableName)
    splField=split(list,",")
    rs.open"select * from " & tableName,conn,1,1 

    clear_TableName=tableName
    clear_parentTableName=parentTableName
    if clear_db_PREFIX<>"" then
        clear_TableName=mid(clear_TableName,len(clear_db_PREFIX)+1)
        clear_parentTableName=mid(clear_parentTableName,len(clear_db_PREFIX)+1)
    end if

    '先关闭后开启'
    if parentTableName<>"" then
        c=c & "conn.execute(""set identity_insert ""& db_PREFIX &"""& clear_parentTableName &" off"")"&vbcrlf 
    end if
    c=c & "conn.execute(""set identity_insert ""& db_PREFIX &"""& clear_TableName &" on"")"&vbcrlf
    for j=1 to nRow'rs.RecordCount
        if rs.eof then exit for   '在最后退出' 

        sqlTableName=tableName
        if clear_db_PREFIX<>"" then
            sqlTableName=mid(tableName,len(clear_db_PREFIX)+1)
        end if

        addFieldList="":addFieldValueList=""
        for i=1 to ubound(splField)-1
            fieldName=splField(i)
            fieldAlt=getFieldAlt(tableName,fieldName)
            
            if addFieldList<>"" then addFieldList=addFieldList & ", "
            addFieldList=addFieldList & "[" & fieldName & "]"
            s=rs(fieldName)
            if isNull(s) then 
                s="NULL"
                if addFieldValueList<>"" then addFieldValueList=addFieldValueList&","
                addFieldValueList=addFieldValueList & s
            else
                s=replace(s,"'","''")  '处理字符内容'
                s=replace(s,"""", """""")  '双引号 
                s=replace(s,"%"&">", "%""&"">")  '
                s=replace(s,"<"&"%", "<""&""%")  '
                s=replace(s,vbcrlf," ""& vbcrlf &"" ")  '换行'   
                if addFieldValueList<>"" then addFieldValueList=addFieldValueList&","
                addFieldValueList=addFieldValueList & "N'"& s &"'"
            end if
        next
        c=c & "conn.execute("" INSERT INTO ""& db_PREFIX &"""&sqlTableName&"("& addFieldList &") VALUES("& addFieldValueList &")"")" & vbcrlf & vbcrlf
    rs.movenext:next:rs.close



    getTableListToSqlAspRun=c
end function


' call die(accessDataToSqlServerData())  调用方法
'access数据转换成sqlServer数据，可运行添加的文件'20230113  showRow 为每个表提取多少条数组
function accessDataToSqlServerData(showRow)
    dim cTableList,splTable,parentTableName,tableName,c,content,filePath,tempContent
    if showRow="" then showRow=3
    call openconn()
    cTableList=getTableList()
    call echo("cTableList",cTableList)
    splTable=split(cTableList,vbcrlf)
    for each tableName in splTable
        call echo("tableName",tableName)
        c=c & getTableListToSqlAspRun(db_PREFIX,tableName,showRow,parentTableName)
        parentTableName=tableName
        doevents
    next
    ' c=getTableListToSqlAspRun("xy_","xy_admin",3,"")
    ' call rw(c)
    tempContent=readfile("/install/sql.tpl","utf-8")
    content=replace(tempContent,"'内容'",c)
    call writetofile("/install/sql.asp",content,"utf-8")
    accessDataToSqlServerData=c
end function
%>      

