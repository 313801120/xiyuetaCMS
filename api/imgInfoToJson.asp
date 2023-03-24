<!--#Include file = "../inc/config.asp"-->
<%
'测试  api/imginfotojson.asp?act=img&src=/test/230320/1.bmp'
'返回  {"info": "获得图片信息成功","width": "40","height": "10","type": "bmp","size": "1254","status": "y"}  '

'获得图片信息
if request("act")="img" then
	call getImgInfoToJson(request("src"))
end if

'获得图片信息以json方式输出'
sub getImgInfoToJson(sType)
	dim objGPS,width,height,imgType,imgObj,data,base64,src
	Set objGPS = new GPS
	if sType="test1" then
		src="/test/230320/1.bmp"
	elseif sType="test2" then
		src="/test/230320/2.bmp" 
	else
		src="/test/230320/0.bmp" 
		call saveRemoteFile("http://xiyueta/aspYZM/"& sType &"?n="&getrnd(6),src)
	end if
	' call saveRemoteFile("http://xiyueta/aspYZM/Code_16.Asp?n="&getrnd(6),"1.bmp")

	src=handlePath(src)
	if checkfile(src)=false then
		data="""info"": ""获得图片信息失败"""
		data="""src"": """& src &""""
		data=data&",""status"": ""n"""
    	call die("{"& data &"}")
	end if

	imgObj=objGPS.getImageSize(src)

	base64=imagesToBase64(src)
	base64=replace(replace(base64,chr(10),""),chr(13),"")


	data="""info"": ""获得图片信息成功"""
	data=data&",""width"": """& imgObj(1) &""""
	data=data&",""height"": """& imgObj(2) &""""
	data=data&",""type"": """& objGPS.getImageType(src) &""""
	data=data&",""size"": """& getFSize(src) &""""
	data=data&",""base64"": """& base64 &""""
	' data=data&",""GetCode"": """& session("GetCode") &""""
	data=data&",""status"": ""y"""


    call die("{"& data &"}")

	call die(objGPS.getImageSize(handlePath("1.bmp"))(1))
end sub
%>