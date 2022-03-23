<!--#include file="inc/Config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>模板列表</title>
 

<script type="text/javascript" src="admin/js/jquery.js"></script>
 <link rel="stylesheet" href="admin/layuiadmin/layui/css/layui.css" type="text/css"  />
 <style type="text/css">

  <style>

.pic_list{padding: 10px;}

    /*瀑布流层*/

    .waterfall{

        -moz-column-count:4; /* Firefox */

        -webkit-column-count:4; /* Safari 和 Chrome */

        column-count:4;

        -moz-column-gap: 10px;

      -webkit-column-gap:10px;

      column-gap: 10px;

    }

    /*一个内容层*/

    .item{
	padding: 15px;
	-moz-page-break-inside: avoid;
	-webkit-column-break-inside: avoid;
	break-inside: avoid;
	border: 1px solid #eee;
	margin-top: 0;
	margin-right: 0;
	margin-bottom: 10px;
	margin-left: 0;
	background-color: #FFF;
    }

    .item img{

        width: 100%;

        margin-bottom:10px;

    }


 .pic_list {
	max-width: 900px;
	margin-right: auto;
	margin-bottom: 20px;
	margin-left: auto;
}
 .pic_page {
	padding: 30px;
	text-align: center;
}
 .pic_page span {
	line-height: 40px;
	display: inline-block;
	border: 1px solid #eee;
	padding-right: 13px;
	padding-left: 13px;
	
	color: #666;
	background-color: #FFF;
	height: 40px;
}
 .pic_page a {
	 color: #666;
	display: inline-block;
	padding-right: 13px;
	padding-left: 13px;
	background-color: #FFF;
	border: 1px solid #eee;
	line-height: 40px;
	}
 .pic_page .pagecur {
	
	background-color: #FFC824;
	border: 1px solid #FFC824;
	
	color: #FFF;	
}
 .pic_list li p {
	line-height: 25px;
	color: #666;
}
.layui-icon-delete{
	font-size: 20px;
	float: right;
	cursor: pointer;
}
 </style>






</head>

<body style="background-color:#f5f5f5">


	<blockquote class="layui-elem-quote">
		xiyuetaCMS开源网站管理系统
		<a href='http://www.xiyueta.com/xiyuetacms/templates/' target="_blank" class="layui-btn layui-btn-danger">下载更新模板</a>
    </blockquote>

<% 
dim fpath,objFSO,objfolder,picArr,picbegin,pageSize,page,objfile,picnum,i,m,thispageend,img_html,pageCount,usezt,isuse,page_html
fpath="web/"
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
set objfolder=objFSO.getfolder(server.mappath(fpath))
dim fc
set fc = objfolder.subFolders

picArr=""
picbegin=""
pageSize=20
page=request("page")
If page="" Then page=1
picbegin=(page-1)*pageSize
dim f1
for each f1 in fc
	if f1.name<>"images" and f1.name<>"testpic" then
		if picArr<>"" then picArr=picArr & "|"
		picArr=picArr&f1.name&"$2021-2-2$22.kb"
	end if
next
set objfolder=nothing 
picArr=Split(picArr,"|")
picnum=UBound(picArr)+1

Dim short
for i=0 To UBound(picArr)
    For m=i To UBound(picArr)
        If CDate(Split(picArr(i),"$")(1))<CDate(Split(picArr(m),"$")(1)) Then
            short=picArr(i)
            picArr(i)=picArr(m)
            picArr(m)=short
        End if
    next
next
 
If picnum<pageSize Then
    pageCount=1
Else
    pageCount=Int(picnum/pageSize)
    If picnum Mod pageSize >0 Then pageCount=pageCount+1
End If
thispageend=picbegin+pageSize -1
If thispageend>=picnum Then thispageend=picnum-1
img_html = ""
For i=picbegin To thispageend

if request("act")<>"used" or usezt=0 then
    img_html = img_html + "<li  class=item><a href='"&fpath&Split(picArr(i),"$")(0)&"' target=_blank><img src='"&fpath&"images/"&Split(picArr(i),"$")(0)&".jpg' /></a>"
    ' img_html=img_html & "<span class=""layui-icon layui-icon-delete"" onclick=""del('../UploadFiles/img/"&Split(picArr(i),"$")(0)&"')""></span>"
	img_html = img_html +"<p>"&Split(picArr(i),"$")(0)&"</p>"
	' img_html = img_html +"<p >"&Split(picArr(i),"$")(1)&"<span style=float:right;>"&cint(Split(picArr(i),"$")(2)/1024)&"kb</span></p>"
	img_html = img_html +"<p >"&isuse&"</p></li>"
	end if
Next
page_html = "<span>当前：第"&page&"页</span>  "
For i=1 To pageCount
if cstr(i)=request("page") then
page_html = page_html + " <a href='?page="&i&"' class=pagecur>"&i&"</a> "
else
page_html = page_html + " <a href='?page="&i&"'>"&i&"</a> "

end if
Next
page_html = page_html + "<span>共计"&pageCount&"页</span>"


%>

<div class="pic_list">

<ul class="waterfall">
<%=img_html%>
</ul>
</div>

<div class="pic_page">
<%=page_html%>
</div>
 
 
</body>

</html>
