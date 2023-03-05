<!--#Include file = "../common.Asp"-->
<%
'上传剪贴板里的图片，复制图片文件或截取图片，都可以上传的 20230227'
if request("act")="submit" then
	call handleUpfileClipboardImg(request("content"))
end if

function handleUpfileClipboardImg(res)
	dim nLen,saveImagePath,fileType,returnUrl
	fileType="jpg"
	if left(res,11)="data:image/" then
		nLen=instr(res,";")
		if nLen>0 then
			fileType=lcase(mid(res,12,nLen-12))
			if instr("|jpg|gif|bmp|png|jpeg|",fileType)=false then
				fileType="jpg"
			end if
		end if
		nLen=instr(res,";base64,")
		if nLen>0 then
			res=mid(res,nLen+8)
			returnUrl=format_Time(now(),6) & "." & fileType
			saveImagePath="/uploadfiles/img/" & returnUrl
			call base64ToImages(saveImagePath,res)
		end if
	end if
	' call echo("saveImagePath",saveImagePath)
	' call eerr("res",res)

    call die("{""info"": ""上传图片成功"",""img"": """& "uploadfiles/img/" & returnUrl &""",""status"": ""y""}")
end function
%>
