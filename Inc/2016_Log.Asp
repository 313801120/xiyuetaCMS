<% 
'日志文件

'错误日志
Function errorLog(content)
    If openErrorLog = True Then
        Call rw(content) 
    End If 
End Function 

'写入系统操作日志
Function writeSystemLog(tableName, msgStr)
    dim openWriteSystemLog
    openWriteSystemLog="|txt|database|"
    Dim logFile, s, url, ip, createTime,logDir
	logDir= adminDir & "/data/systemLog/" 
	call createDirFolder(logDir)		'创建文件夹
    logFile =logDir & "/" & format_Time(Now(), 2) & ".txt" 
    url = ADSql(getThisUrlFileParam())
    createTime = format_Time(Now(), 1) 
    ip = getIP() 
    If InStr(openWriteSystemLog, "|txt|") > 0 Then
        s = s & "姓名：" & getSession("adminusername") & vbCrLf 
        s = s & "表：" & tableName & vbCrLf 
        s = s & "信息：" & msgStr & vbCrLf 
        s = s & "网址：" & url & vbCrLf 
        s = s & "时间：" & createTime & vbCrLf 
        s = s & "IP：" & ip & vbCrLf 
        s = s & "------------------------" & vbCrLf 
        Call createAddFile(logFile, s) 
    'call echo(logfile,"log")
    End If 

    If InStr(openWriteSystemLog, "|database|") > 0 Then
        Call OpenConn()
		'判断表存在 
		conn.Execute("insert into " & db_PREFIX & "SystemLog (tablename,msgstr,url,adminname,ip,createTime) values('" & tableName & "','" & msgStr & "','" & url & "','" & getSession("adminusername") & "','" & ip & "','" & createTime & "')") 
    End If 

End Function 


'Js版网站统计202204
Function jsWebStat()
    Dim s
    s = "<script>document.writeln(""<script src=\'/api/webstat.asp?act=webstat&tourl=""" 
    s = s & "+escape(document.referrer)+""&url=""+escape(window.location.href)+""&w=""+escape(window.screen.width)+""&h=""+escape(window.screen.height)" 
    s = s & "+""&useragent=""+escape(navigator.userAgent)"                                 '收集cookie 不需要则屏蔽掉
    s = s & "+"" \'><\/script>"");</"&"script>" 
    jsWebStat = s 
End Function 

%>