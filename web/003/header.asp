<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <!--H5页面窗口自动调整到设备宽度，并禁止用户缩放页面-->
    <meta content="yes" name="apple-mobile-web-app-capable">
    <!--当网站添加到主屏幕快速启动方式，可隐藏地址栏，仅针对ios的safari-->
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <!--将网站添加到主屏幕快速启动方式，仅针对ios的safari顶端状态条的样式-->
    <meta content="telephone=no" name="format-detection">
    <!--忽略将页面中的数字识别为电话号码-->
    <meta content="email=no" name="format-detection">
    <!--忽略Android平台中对邮箱地址的识别-->
    <title><%=webTitle%></title>
    <link rel="stylesheet" type="text/css" href="templates/hjmq/css/index.css">
    <link rel="stylesheet" type="text/css" href="templates/hjmq/css/mobile.css">
    <script type="text/javascript" src="templates/hjmq/js/html5shiv.js"></script>
    <script type="text/javascript" src="templates/hjmq/js/jquery-1.8.3.min.js"></script>
    <!--<script type="text/javascript" src="js/koala.min.1.5.js"></script>-->
    <!--手机端导航-->
    <script type="text/javascript" src="templates/hjmq/js/jquery.simplesidebar.js"></script>
    <script type="text/javascript" src="templates/hjmq/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="templates/hjmq/js/com.js"></script>
    <!--ban-->
    <script type="text/javascript" src="templates/hjmq/js/jquery.banner.revolution.min.js"></script>
    <script type="text/javascript" src="templates/hjmq/js/banner.js"></script>
</head>

<body>
    <div class="wrap">
        <div class="pc_nav">
            <div  class="head_topBg">
                <div class="width head_top">
                    <a href="./">返回首页</a>
                    <span>
                        <img src="templates/hjmq/images/tel.png">全国服务热线：000-6666666</span>
                </div>
            </div>
            <div class="width">
                <ul class="nav clearfix cl-effect-1"><%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 order by sortRank asc" ,conn,1,1
while not rs.eof
%>
<%if isFocusNav(rs) then%>
<li>
                        <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" style="color:#E7821A"><%=rs("columnName")%></a>
                    </li>
<%else%>
<li>
                        <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
                    </li>
<%end if%>
<%rs.movenext:wend:rs.close%>
                </ul>
            </div>
        </div>
        <div class="nav_mob">
            <h1 class="fleft logo_mob">
                <a href="index.aspx">
                    <img src="<%=webLogo%>" width="100" height="56"></a>
            </h1>
            <div class="nav_hide fleft" style="height:50px;margin-bottom:10px; position:relative;width: 80px;float: right;">
                <div class="toolbar">
                    <div id="open-sb" class="menu-button menu-left">
                        <img src="templates/hjmq/images/nicon.png" width="26"></div>
                </div>
                <section class="sidebar">
                    <ul class="app_nav"><%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 order by sortRank asc" ,conn,1,1
while not rs.eof
%>
<%if isFocusNav(rs) then%>
<li>
                                    <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
                                </li>
<%else%>
<li>
                            <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
                        </li>
<%end if%>
<%rs.movenext:wend:rs.close%>
                    </ul>
                </section>
            </div>
        </div>