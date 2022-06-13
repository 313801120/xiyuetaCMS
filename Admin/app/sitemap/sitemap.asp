<!--#Include virtual = "/common.Asp"--><%

call getSiteMapXML()
call die("生成 <a href='/sitemap.xml' target='_blank'>sitemap.xml</a> 成功！时间：" & now())

function handleWebUrl(url)
	if url="/default.asp" then url="/"
	if left(url,1)<>"/" then url="/" & url
	handleWebUrl=webDoMain() & url
end function

function getSiteMapXML()
    dim c
    c="<?xml version='1.0' encoding='UTF-8'?>" & vbcrlf
    c=c&"<urlset xmlns=""http://www.sitemaps.org/schemas/sitemap/0.9"">"&vbcrlf
    rs.open "select * from " & db_PREFIX & "WebColumn where isThrough=1 AND (flags='top' or flags='foot' or flags='top|foot') and columnname<>'了解我们' order by sortRank asc" ,conn,1,1
    while not rs.eof
        c=c & vbtab & "<url>"&vbcrlf
        c=c & copystr(vbtab,2) & "<loc><![CDATA[" & handleWebUrl(getNavUrl(rs("id"),rs("columnType")))&"]]></loc>" & vbcrlf
        c=c & copystr(vbtab,2) & "<lastmod>"&format_Time(rs("updatetime"),2)&"</lastmod>" & vbcrlf
        c=c & copystr(vbtab,2) & "<changefreq>weekly</changefreq>" & vbcrlf
        c=c & vbtab & "</url>"&vbcrlf

    rs.movenext:wend:rs.close    
    c=c & "</urlset>"
    call writetofile("/sitemap.xml",c,"utf-8")
    getSiteMapXML=c
end function
%>