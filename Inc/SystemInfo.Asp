<% 
'系统信息  (2014,05,27)

Function getObjectArrayCofnig()
    Dim Sot(53, 2) 
    Sot(0, 0) = "Scripting.FileSystemObject" 
    Sot(0, 2) = "文件操作组件" 
    Sot(1, 0) = "wscript.shell" 
    Sot(1, 2) = "命令行执行组件" 
    Sot(2, 0) = "ADOX.Catalog" 
    Sot(2, 2) = "ACCESS建库组件" 
    Sot(3, 0) = "JRO.JetEngine" 
    Sot(3, 2) = "ACCESS压缩组件" 
    Sot(4, 0) = "Scripting.Dictionary" 
    Sot(4, 2) = "数据流上传辅助组件" 
    Sot(5, 0) = "Adodb.connection" 
    Sot(5, 2) = "数据库连接组件" 
    Sot(6, 0) = "Adodb.Stream" 
    Sot(6, 2) = "数据流上传组件" 
    Sot(7, 0) = "SoftArtisans.FileUp" 
    Sot(7, 2) = "SA-FileUp 文件上传组件" 
    Sot(8, 0) = "LyfUpload.UploadFile" 
    Sot(8, 2) = "刘云峰文件上传组件" 
    Sot(9, 0) = "Persits.Upload.1" 
    Sot(9, 2) = "ASPUpload 文件上传组件" 
    Sot(10, 0) = "JMail.SmtpMail" 
    Sot(10, 2) = "JMail 邮件收发组件" 
    Sot(11, 0) = "CDONTS.NewMail" 
    Sot(11, 2) = "虚拟SMTP发信组件" 
    Sot(12, 0) = "SmtpMail.SmtpMail.1" 
    Sot(12, 2) = "SmtpMail发信组件" 
    Sot(13, 0) = "JMail.Message" 
    Sot(13, 2) = "JMail.Message发信组件" 

    Sot(14, 0) = "Microsoft.XMLHTTP" 
    Sot(14, 2) = "数据传输组件" 
    Sot(15, 0) = "NetBox.HttpServer" 
    Sot(15, 2) = "NetBox.HttpServer哈哈" 
    Sot(16, 0) = "ADODB.Stream.6.0" 
    Sot(16, 2) = "ADODB.Stream.6.0" 

    Sot(20, 0) = "MSXML2.DOMDocument" 
    Sot(20, 2) = "xml处理" 





    Sot(31, 0) = "yunsun.AspCode" 
    Sot(31, 2) = "云祥孙ASP代码格式化" 

    Sot(32, 0) = "yunsun.AspToPhpClass" 
    Sot(32, 2) = "云祥孙ASP转PHP" 

    Sot(33, 0) = "yunsun.calldll" 
    Sot(33, 2) = "云祥孙回调" 

    Sot(34, 0) = "yunsun.clsAccessPass" 
    Sot(34, 2) = "云祥孙Access密码破解" 

    Sot(35, 0) = "yunsun.dllCommand" 
    Sot(35, 2) = "云祥孙公共" 

    Sot(36, 0) = "yunsun.dllSafe" 
    Sot(36, 2) = "云祥孙安全" 

    Sot(37, 0) = "yunsun.GPS" 
    Sot(37, 2) = "云祥孙图片处理" 

    Sot(38, 0) = "yunsun.dllFZ" 
    Sot(38, 2) = "云祥孙仿站类" 

    Sot(40, 0) = "WScript.Shell.1" 
    Sot(40, 2) = "WScript.Shell.1" 




    Sot(50, 0) = "yunsun.calldll_NONO" 
    Sot(50, 2) = "不存在的组件（只为测试）" 
    getObjectArrayCofnig = Sot 
End Function
 

'显示对象  =showObject()
Function showObject()
    Dim i, t, s, isObj, okC, errC, en, cn, sot 

    sot = getObjectArrayCofnig() 

    For i = 0 To UBound(sot)
        en = sot(i, 0) 
        cn = sot(i, 2) 
        If en <> "" Then
            If checkObject(en) = True Then
                s = " √" 
                okC = okC & en & "  " & s & "   " & cn & vbCrLf 
            Else
                s = " ×" 
                errC = errC & en & "  " & s & "   " & cn & vbCrLf 
            End If 
        End If 
    Next 
    showObject = okC & errC 
End Function
 
'显示组件第二种
Function showObject2()
    Dim sot, s, c, i, en, cn, okC, errC 
    sot = getObjectArrayCofnig() 
    c = "<br><table width='80%' bgcolor='menu' border='0' cellspacing='1' cellpadding='0' align='center'>" 
    c = c & "<tr><td height='20' colspan='3' align='center' bgcolor='menu'>服务器组件信息</td></tr>" 
    c = c & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器名</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>" & Request.ServerVariables("SERVER_NAME") & "</td></tr>" 
    c = c & "<form method=post action='http://www.ip138.com/index.asp' name='ipform' target='_blank'><tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器IP</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>" 
    c = c & "<input type='text' name='ip' size='15' value='" & Request.ServerVariables("LOCAL_ADDR") & "'> <input type='submit' value='查询'><input type='hidden' name='action' value='2'></td></tr></form>" 
    c = c & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器时间</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>" & Now & "&nbsp;</td></tr>" 
    c = c & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器CPU数量</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>" & Request.ServerVariables("NUMBER_OF_PROCESSORS") & "</td></tr>" 
    c = c & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>服务器操作系统</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>" & Request.ServerVariables("OS") & "</td></tr>" 
    c = c & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>WEB服务器版本</td><td bgcolor='#FFFFFF'>&nbsp;</td><td bgcolor='#FFFFFF'>" & Request.ServerVariables("SERVER_SOFTWARE") & "</td></tr>" 

    For i = 0 To UBound(sot)
        en = sot(i, 0) 
        cn = sot(i, 2) 
        If en <> "" Then
            If checkObject(en) = True Then
                s = " √" 
                okC = okC & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>" & en & "</td><td bgcolor='#FFFFFF'>" & s & "</td><td bgcolor='#FFFFFF' align=left>" & cn & "</td></tr>" 
            Else
                s = " ×" 
                errC = errC & "<tr align='center'><td height='20' width='200' bgcolor='#FFFFFF'>" & en & "</td><td bgcolor='#FFFFFF'>" & s & "</td><td bgcolor='#FFFFFF' align=left>" & cn & "</td></tr>" 
            End If 
        End If 
    Next 

    showObject2 = c & okC & errC 
End Function
 

'检测对象
Function checkObject(objecName)
    Dim t 
    On Error Resume Next 
    Set t = CreateObject(objecName)
        If - 2147221005 <> Err And 429 <> Err Then
            checkObject = True 
        Else
            checkObject = False 
            Err.Clear 
        End If 
    Set t = Nothing 
End Function
 


'操作系统版本
Function operationSystem()
    Dim httpAgent, systemVer 
    httpAgent = Request.ServerVariables("HTTP_USER_AGENT") 
    If InStr(httpAgent, "NT 5.2") > 0 Then
        systemVer = "Windows Server 2003" 
    ElseIf InStr(httpAgent, "NT 5.1") > 0 Then
        systemVer = "Windows XP" 
    ElseIf InStr(httpAgent, "NT 5") > 0 Then
        systemVer = "Windows 2000" 
    ElseIf InStr(httpAgent, "NT 4") > 0 Then
        systemVer = "Windows NT4" 
    ElseIf InStr(httpAgent, "4.9") > 0 Then
        systemVer = "Windows ME" 
    ElseIf InStr(httpAgent, "98") > 0 Then
        systemVer = "Windows 98" 
    ElseIf InStr(httpAgent, "95") > 0 Then
        systemVer = "Windows 95" 
    Else
        systemVer = httpAgent 
    End If 
    operationSystem = httpAgent 
End Function

'检测是否为手机浏览  '用这种20190420通用 
Function checkMobile()
	dim splstr,s,sagent
    checkMobile = False 
	sagent = lcase(Request.ServerVariables("HTTP_USER_AGENT")) & "" 
	splstr=split("mini 9.5|vx1000|lge |m800|e860|u940|ux840|compal|wireless| mobi|ahong|lg380|lgku|lgu900|lg210|lg47|lg920|lg840|lg370|sam-r|mg50|s55|g83|t66|vx400|mk99|d615|d763|el370|sl900|mp500|samu3|samu4|vx10|xda_|samu5|samu6|samu7|samu9|a615|b832|m881|s920|n210|s700|c-810|_h797|mob-x|sk16d|848b|mowser|s580|r800|471x|v120|rim8|c500foma:|160x|x160|480x|x640|t503|w839|i250|sprint|w398samr810|m5252|c7100|mt126|x225|s5330|s820|htil-g1|fly v71|s302|-x113|novarra|k610i|-three|8325rc|8352rc|sanyo|vx54|c888|nx250|n120|mtk |c5588|s710|t880|c5005|i;458x|p404i|s210|c5100|teleca|s940|c500|s590|foma|samsu|vx8|vx9|a1000|_mms|myx|a700|gu1100|bc831|e300|ems100|me701|me702m-three|sd588|s800|8325rc|ac831|mw200|brew |d88|htc/|htc_touch|355x|m50|km100|d736|p-9521|telco|sl74|ktouch|m4u/|me702|8325rc|kddi|phone|lg |sonyericsson|samsung|240x|x320vx10|nokia|sony cmd|motorola|up.browser|up.link|mmp|symbian|smartphone|midp|wap|vodafone|o2|pocket|kindle|mobile|psp|treo|iris|3g_t|windows ce|opera mobi|windows ce; smartphone;|windows ce; iemobile|ipod|iphone|android|opera mini|blackberry|palm os|palm|hiptop|avantgo|fennec|plucker|xiino|blazer|elaine|iris|3g_t|windows ce|opera mobi|windows ce; smartphone;|windows ce; iemobile","|")
	for each s in splstr
		if s<>"" then
			if instr(sagent,s)>0 then
				checkMobile = true 
				exit function
			end if
		end if
	next 
	If Request.ServerVariables("HTTP_X_WAP_PROFILE") <> "" Then		'这是旧版的
		checkMobile = True 
	End If 
End Function
 

'获得IIS版本号
Function getIISVersion()
    getIISVersion = Request.ServerVariables("SERVER_SOFTWARE") 
End Function
 

%> 