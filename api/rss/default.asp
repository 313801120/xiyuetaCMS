<!--#Include virtual = "/common.Asp"--><%
response.addheader "Content-Type", "application/xml; charset=utf-8"
dim thisWebDomain
thisWebDomain=getwebsite(getthisurl())  '当前网站的域名'

if navId<>"" then 
    idList=getColumAllID(navId)
    if idList<>"" then idList=idList+","
    idList=idList & navId
    addsql=" where parentId in("& idList &")"
end if
rs.open"select * from " & db_PREFIX & "ArticleDetail "& addsql &" order by createTime desc",conn,1,1

'<lastBuildDate>Tue, 28 Feb 2023 00:57:18 +0000</lastBuildDate>  原版是这样的
%><?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
  <channel>
    <title><%=columnname%></title>
    <link><%=thisWebDomain%><%=pageUrl%></link>
    <description><%=webdescription%></description>
    <copyright>Copyright(C) Empire CMS</copyright>
    <generator>Empire CMS by Empire Studio.</generator>
    <lastBuildDate><%=now()%></lastBuildDate>
    <ttl>60</ttl>
    <image>
      <url><%=thisWebDomain%>images/logo.png</url>
      <title><%=webtitle%></title>
      <link><%=thisWebDomain%></link>
    </image>
    <%
      dim itemColunmName
      for i=1 to rs.recordcount
        if rs.eof then exit for
        itemColunmName=columnname
        rsx.open"select * from " & db_PREFIX & "webcolumn where id="&rs("parentid"),conn,1,1
        if not rsx.eof then
          itemColunmName=rsx("columnname")
        end if:rsx.close

    %>
    <item>
      <title><![CDATA[<%=rs("title")%>]]></title>
      <description><![CDATA[<%=cutStr(delhtml(rs("bodyContent")),150,"...")%>]]></description>
      <link><%=thisWebDomain & getArticleUrl(rs("id"))%></link>
      <guid><%=thisWebDomain & getArticleUrl(rs("id"))%></guid>
      <category><%=itemColunmName%></category>
      <author><![CDATA[<%=rs("author")%>]]></author>
      <pubDate><%=now()%></pubDate>
    </item>
    <%rs.movenext:next:rs.close%>
  </channel>
</rss>