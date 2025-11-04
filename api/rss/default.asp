<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include virtual = "/common.Asp"--><%
response.addheader ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101), ChrW(97)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(120)&ChrW(109)&ChrW(108)&ChrW(59)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)
dim thisWebDomain
thisWebDomain=getwebsite(getthisurl())
if navId <>"" then 
idList=getColumAllID(navId)
if idList <>"" then idList=idList+ChrW(44)
idList=idList & navId
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(73)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40)& idList &ChrW(41)
end if
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(32)& addsql &ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1

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
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),conn,1,1
if not rsx.eof then
itemColunmName=rsx(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
end if:rsx.close
%>
<item>
<title><![CDATA[<%=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))%>]]></title>
<description><![CDATA[<%=cutStr(delhtml(rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))),150,ChrW(46)&ChrW(46)&ChrW(46))%>]]></description>
<link><%=thisWebDomain & getArticleUrl(rs(ChrW(105)&ChrW(100)))%></link>
<guid><%=thisWebDomain & getArticleUrl(rs(ChrW(105)&ChrW(100)))%></guid>
<category><%=itemColunmName%></category>
<author><![CDATA[<%=rs(ChrW(97)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(114))%>]]></author>
<pubDate><%=now()%></pubDate>
</item>
<%rs.movenext:next:rs.close%>
</channel>
</rss>