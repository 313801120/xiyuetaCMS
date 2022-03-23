<!--#Include virtual = "/common.Asp"--><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,user-scalable=no" />
    <title><%=webTitle%></title>
    <meta name="keywords" content="<%=webKeywords%>" />
    <meta name="description" content="<%=webDescription%>" />
    <link rel="stylesheet" href="templates/minyiclean/css/animate.min.css" />
    <link rel="stylesheet" href="templates/minyiclean/css/style.css" />
    <script type="text/javascript" src="templates/minyiclean/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="templates/minyiclean/js/wow.min.js"></script>
    <script>new WOW().init();</script>
    <link rel="stylesheet" href="templates/minyiclean/css/about.css" />
</head>

<body>
    <!--#Include file = "header.Asp"-->

    <div class="pub_page_banner">
        <div class="pic">
            <a class="pc_banner">
                <img src="<%=bannerimage%>" /></a>
        </div>
    </div>
    <div class="pub_page_side_main">
        <div class="cnt">
            <!--#Include file = "left.Asp"-->
            <div class="pub_page_main wow fadeInRight">
                <div class="pub_page_title">
                    <div class="pub_page_bcnav">
                        当前位置：<%=navLocation(navId,"")%>
                    </div>
                    <div class="title_text"><%=columnName%></div>
                </div>
                <div class="about_content" id="adminbuy_cn">

                    <%=bodyContent%>

                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>

    <!--#Include file = "footer.Asp"-->