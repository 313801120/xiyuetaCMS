<!--#Include virtual = "/common.Asp"--><%
' response.addheader "Content-Type", "application/xml; charset=utf-8"
dim thisWebDomain,url
thisWebDomain=getwebsite(getthisurl())  '当前网站的域名'


%><?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
	<%rs.open "select * from " & db_PREFIX & "webcolumn where parentid=-1 and isthrough=1 and flags like'%top%' order by sortrank asc" ,conn,1,1
	for i=1 to 99
	if rs.eof then exit for
		url=getNavUrl(rs("id"),rs("columntype"))
		if rs("columntype")="home" then url=""
		url=thisWebDomain & url
	%><url>
        <loc><%=url%></loc>
        <changefreq>daily</changefreq>
        <priority>1.0</priority>
    </url>
	<%rs.movenext:next:rs.close%>	




	<%rs.open"select * from " & db_PREFIX & "ArticleDetail order by createTime desc",conn,1,1
	for i=1 to 399
	if rs.eof then exit for
	%><url>
        <loc><%=thisWebDomain & getArticleUrl(rs("id"))%></loc>
        <changefreq>monthly</changefreq>
        <priority>1.0</priority>
    </url>
	<%rs.movenext:next:rs.close%>
</urlset>