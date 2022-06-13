<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Server.ScriptTimeOut=5000
%>
<!--#include file="UpLoadClass.asp"-->

<%
'if request.Cookies("user")("login")<>"true" and request.Cookies("admin")("login")<>"true" then
	'response.Write("{""code"":1,""msg"": ""请登陆再上传图片""}"):response.end()
'end if
dim request2,formPath,formName,intCount,intTemp

'建立上传对象
set request2=new UpLoadClass

	'设置文件允许的附件类型为gif/jpg/rar/zip
	request2.FileType="gif/jpg/png/jpeg/rar/zip"

	'设置服务器文件保存路径
	request2.SavePath="../../UploadFiles/img/"

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
				file_url=file_url&"{""src"":""/UploadFiles/img/"&formPath&request2.form(formName)&""",""title"":"""& request2.form(formName) &"""}"
		
		
		      
		
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