<!--#Include virtual = "/common.Asp"--><%

if request("act")="submit" then
    call getSiteMapXML()
    call die("生成 <a href='/sitemap.xml' target='_blank'>sitemap.xml</a> 成功！时间：" & now())
else
    call echo("生成sitemap","<a href='?act=submit'>点击生成</a>")
end if

function handleWebUrl(url)
	if url="/default.asp" then url="/"
	if left(url,1)<>"/" then url="/" & url
	handleWebUrl=webDoMain() & url
end function

function getSiteMapXML()
    dim httpurl,c
    httpurl=webDoMain() & "/sitemap.asp"
    call echo("httpurl",httpurl)
    c=gethttpurl(httpurl,"utf-8") 
    call writetofile("/sitemap.xml",c,"utf-8") 
end function
%>