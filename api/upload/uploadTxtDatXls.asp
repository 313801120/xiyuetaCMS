<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Server.ScriptTimeOut=5000
%>
<!--#include file="UpLoadClass.asp"-->

<%

        if session("memberid")="" then
            response.write("{""status"":""200"",""code"":1,""msg"": ""请先登录""}")
            response.end()
        end if

'if request.Cookies("user")("login")<>"true" and request.Cookies("admin")("login")<>"true" then
	'response.Write("{""code"":1,""msg"": ""请登陆再上传图片""}"):response.end()
'end if
dim request2,formPath,formName,intCount,intTemp


'获取IP地址 别人写得好像很专业一样 很全
function getIP()
    on error resume next 
    dim strIPAddr 
    if request.serverVariables("HTTP_X_FORWARDED_FOR") = "" or inStr(request.serverVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 then
        strIPAddr = request.serverVariables("REMOTE_ADDR") 
    elseIf inStr(request.serverVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 then
        strIPAddr = mid(request.serverVariables("HTTP_X_FORWARDED_FOR"), 1, inStr(request.serverVariables("HTTP_X_FORWARDED_FOR"), ",") - 1) 
    elseIf inStr(request.serverVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 then
        strIPAddr = mid(request.serverVariables("HTTP_X_FORWARDED_FOR"), 1, inStr(request.serverVariables("HTTP_X_FORWARDED_FOR"), ";") - 1) 
    else
        strIPAddr = request.serverVariables("HTTP_X_FORWARDED_FOR") 
    end if 
    getIP = trim(mid(strIPAddr, 1, 30)) 
end function 

'创建文件夹
function createFolder(byVal folderPath)
    on error resume next 
    dim fso 
    call handlePath(folderPath)                                                     '获得完整路径
    createFolder = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderPath) = false then
            fso.createFolder(folderPath) 
            createFolder = true 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "createFolder 创建文件夹 函数出错，FolderPath=" & folderPath & ":::" & fso.folderExists(folderPath)) 
end function 
'处理成完成路径 (2013,9,27
function handlePath(fFPath)                                                     'Path前面不加ByVal 重定义，这样是为了让前面函数里可以使用这个路径完整调用
    fFPath = replace(fFPath, "/", "\") 
    fFPath = replace(fFPath, "\\", "\") 
    fFPath = replace(fFPath, "\\", "\") 
    dim isDir                                                                       '为目录
    isDir = false 
    if right(fFPath, 1) = "\" then
        isDir = true 
    end if 
    if inStr(fFPath, ":") = 0 then
        if left(fFPath, 1) = "\" then
            fFPath = server.mapPath("\") & "\" & fFPath 
        else
            fFPath = server.mapPath(".\") & "\" & fFPath 
        end if 
    end if 
    fFPath = replace(fFPath, "/", "\") 
    fFPath = replace(fFPath, "\\", "\") 
    fFPath = replace(fFPath, "\\", "\") 
    fFPath = fullPath(fFPath) 
    if isDir = true then
        fFPath = fFPath & "\" 
    end if 
    handlePath = fFPath 
end function 
'完整路径
function fullPath(byVal fFPath)
    dim splStr, s, c 
    c = "" 
    fFPath = replace(fFPath, "/", "\") 
    splStr = split(fFPath, "\") 
    for each s in splStr
        s = trim(s) 
        if s <> "" and s <> "." then
            if inStr(c, "\") > 0 and s = ".." then
                c = mid(c, 1, inStrRev(c, "\") - 1) 
            else
                if c <> "" and right(c, 1) <> "\" then c = c & "\" 
                c = c & s 
            end if 
        end if 
    next 
    fullPath = c 
end function 

dim sDirName

'建立上传对象
set request2=new UpLoadClass

	'设置文件允许的附件类型为gif/jpg/rar/zip
	request2.FileType="txt/dat/xls/mdb"

	'设置服务器文件保存路径
	sDirName="UploadFiles/txtdatxls/"& getIP() &"/"
	request2.SavePath="../../"& sDirName
	call createFolder("../../" & sDirName)

	'设置字符集
	request2.Charset="UTF-8"

	'打开对象
	request2.Open() 

	

		
			'----列出所有上传了的文件开始----
		
				intCount=0
				for intTemp=1 to Ubound(request2.FileItem)
				'获取表单文件控件名称，注意FileItem下标从1开始
				formName=request2.FileItem(intTemp)
				
				'显示源文件路径与文件名
				file_path=request2.form(formName&"_Path")
				
				file_name=request2.form(formName&"_Name")
		
				'显示文件大小（字节数）
				file_size=request2.form(formName&"_Size")
				
				
				 file_error=request2.form(formName&"_Err")
				
				file_msg=Error2Info(request2.form(formName&"_Err"))
				
		
				'显示目标文件路径与文件名
				file_url=file_url&"{""src"":""/"& sDirName &"/"&formPath&request2.form(formName)&""",""title"":"""& request2.form(formName) &"""}"
		
		
		      
		
				if request2.form(formName&"_Err")=0 then intCount=intCount+1
		
		
				
		
			next
 

	
			
	str="{""status"":"&file_error&",""code"":"&file_error&",""msg"": """&file_msg&""",""data"": "&file_url&"}"
			
	


if request.QueryString("act")="md" then
response.Write mdstr	
else

response.Write str	

end if	


'释放上传对象
set request2=nothing
%>