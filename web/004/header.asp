<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta name="baidu-site-verification" content="ktO9eimyrZ" />
    <title><%=webTitle%></title>
    <meta name="keywords" content="<%=webKeywords%>">
    <meta name="description" content="<%=webDescription%>">
    <link rel="stylesheet" href="templates/xwfcl/css/reset1.css">
    <link rel="stylesheet" href="templates/xwfcl/css/owl.carousel.css">
    <link rel="stylesheet" href="templates/xwfcl/css/owl.theme.css">
    <link rel="stylesheet" href="templates/xwfcl/css/iconfont.css">
    <link rel="stylesheet" href="templates/xwfcl/css/style.css">
    <link rel="stylesheet" href="templates/xwfcl/css/media.css">
</head>

<body>
    <!-- header -->
    <header class="header-fluid">
        <div class="header container clearfix">
            <div class="logo">
                <a href="/">
                    <img src="/web/testpic/logo.png" alt=""></a>
            </div>
            <div class="header-tel">
                <i class="iconfont icon-dianhua3"></i>
                <div class="p1">咨询电话：</div>
                <div class="p2">18166668888</div>
            </div>
            <div class="header-daohang">
                <i class="iconfont icon-daohang2"></i>
            </div>
        </div>
    </header>
    <!-- nav -->
    <nav class="nav-fluid">
        <div class="nav">
            <ul class="clearfix"><%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 order by sortRank asc" ,conn,1,1
while not rs.eof
%>

<li<%=IIF(isFocusNav(rs)," class='active'","")%>>
                    <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
    <%rsx.open "select * from " & db_PREFIX & "WebColumn where parentId="& rs("id") &" and isThrough=1 order by sortRank asc" ,conn,1,1
    if not rsx.eof then        
    %>
        <div class="submenu">
        <%while not rsx.eof%>
        <a href="<%=getNavUrl(rsx("id"),rsx("columnType"))%>"><%=rsx("columnName")%></a>
        <%rsx.movenext:wend%>
                </div>
                <%
                end if:rsx.close%>
                </li>

<%rs.movenext:wend:rs.close%>
            </ul>
        </div>
    </nav>
