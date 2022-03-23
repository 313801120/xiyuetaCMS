<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,minimal-ui,maximum-scale=1.0,user-scalable=no">
    <meta name="baidu-site-verification" content="3eK9s4cJti" />
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title><%=webTitle%></title>
    <meta name="keywords" content="<%=webKeywords%>">
    <meta name="description" content="<%=webDescription%>">
    <link rel="stylesheet" href="templates/jinlaser/css/owl.carousel.css" />
    <link rel="stylesheet" href="templates/jinlaser/css/owl.theme.css" />
    <link rel="stylesheet" href="templates/jinlaser/css/iconfont.css" />
    <link rel="stylesheet" href="templates/jinlaser/css/reset1.css" />
    <link rel="stylesheet" href="templates/jinlaser/css/style.css" />
    <link rel="stylesheet" href="templates/jinlaser/css/media.css" />
</head>

<body>
    <!--头部-->
    <div class="header-fluid">
        <div class="header container clearfix">
            <div class="logo">
                <a href="/">
                    <img src="/web/testpic/logo.png" /></a>
            </div>
            <div class="daohang">
                <i class="iconfont icon-daohang"></i>
            </div>
            <div class="tel">
                <img src="templates/jinlaser/images/tel.png" /></div>
            <div class="nav">
                <div class="nav-list">
                    <ul class="clearfix"><%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 order by sortRank asc" ,conn,1,1
while not rs.eof
%>
<%if isFocusNav(rs) then%>
<li class="active">
                            <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
                        </li>
<%else%>
<li class="">
                            <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
                        </li>
<%end if%>
<%rs.movenext:wend:rs.close%>
                    </ul>
                </div>
            </div>
        </div>
    </div>