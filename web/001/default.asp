<!--#Include virtual = "/common.Asp"--><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8" />
    <meta name="baidu-site-verification" content="AErf5AtMLE" />
    <meta name="viewport" content="width=device-width,user-scalable=no" />
    <title><%=webTitle%></title>
    <meta name="keywords" content="<%=webKeywords%>" />
    <meta name="description" content="<%=webDescription%>" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="applicable-device" content="pc,mobile">
    <link rel="stylesheet" href="templates/minyiclean/css/style.css" />
    <link rel="stylesheet" href="templates/minyiclean/css/index.css" />
    <link rel="stylesheet" href="templates/minyiclean/css/animate.min.css">
    <script type="text/javascript" src="templates/minyiclean/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="templates/minyiclean/js/touchslide.js"></script>
    <script type="text/javascript" src="templates/minyiclean/js/jquery.SuperSlide.2.1.3.js"></script>
    <script type="text/javascript" src="templates/minyiclean/js/wow.js"></script>
</head>

<body>
    <!--#Include file = "header.Asp"-->


    <div class="index_sec_banner sec_banner_pc" id="pc_index_sec_banner">
        <div class="gallery">

<%
rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("banner") & ") order by sortrank desc" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>

                <a href="javascript:;" class="pic">
                    <img src="<%=rs("smallImage")%>" alt=""></a>
            <%rs.movenext:next:rs.close%>


        </div>
        <div class="clear"></div>
        <script type="text/javascript">TouchSlide({
                "slideCell": "#pc_index_sec_banner",
                "mainCell": ".gallery",
                "autoPlay": true,
                "interTime": 5000,
            });</script>
    </div>
    <div class="index_sec_banner sec_banner_mobile" id="mobile_index_sec_banner">
        <div class="gallery">
<%
rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("banner") & ") order by sortrank desc" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>

                <a href="javascript:;" class="pic">
                    <img src="<%=rs("smallImage")%>" alt=""></a>
            <%rs.movenext:next:rs.close%>
        </div>
        <div class="clear"></div>
        <script type="text/javascript">TouchSlide({
                "slideCell": "#mobile_index_sec_banner",
                "mainCell": ".gallery",
            });</script>
    </div>
    <div class="index_sec_product">
        <h1 class="sec_title_main wow fadeInUp">服务范围</h1>
        <div class="sec_title_sub wow fadeInUp">SERVICE AREA</div>
        <div class="sec_brief wow fadeInUp">
            <div class="line line_1"></div>
            <div class="line line_2"></div>
            <div class="text">
                <div class="circle circle_1"></div>
                <div class="circle circle_2"></div>
                <a href="/xwdt/gsxw/394.html">十年网站制作经验 · 电脑端+手机端网页</a>
            </div>
        </div>
        <div class="index-ser">
            <ul class="clearfix"><%

 

rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("产品中心") &") and smallImage<>'' order by sortRank desc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
<li>
        <div class="item wow fadeInUp" data-wow-delay="0.2s">
            <a href="detail.asp?id=<%=rs("id")%>">
                <i style="background-image:url(<%=rs("smallimage")%>);" class="co"></i>
                <h3><%=rs("title")%></h3>
                <span>
                    <span><%=cutStr(rs("bodyContent"),50,"...")%></span>
                </span>
            </a>
        </div>
    </li><%rs.movenext:next:rs.close%>
            </ul>
        </div>
    </div>
    <div class="index_sec_about">
        <div class="cnt">
            <h2 class="sec_title_sub wow fadeInUp">
                <span class="line line_1 wow fadeInUp"></span>上公司简介
                <span class="line line_2 wow fadeInUp"></span>
            </h2>
            <div class="sec_title_main wow fadeInUp">ABOUT US</div>
            <div class="illus_scale_cliper">
                <div class="illus">
                    <div class="video">
                        <div class="preview">
                            <div id="slideBox" class="slideBox">
                                <div class="bd">
                                    <video src="http://vod.yousouyun.com/sv/37d45540-176f95862e3/37d45540-176f95862e3.mp4" controls autoplay muted></video>
                                    <!-- <ul>
                                  
                                     <li><img src="/skins/picture/1.jpg" /></li>
                                     <li><img src="/skins/picture/2.jpg" /></li>
                                     <li><img src="/skins/picture/3.jpg" /></li>
                                        <li><img src="/skins/picture/4.jpg" /></li>
                                  </ul>-->
                                </div>
                            </div>
                            <script type="text/javascript">jQuery(".slideBox").slide({mainCell:".bd ul",autoPlay:true,effect:"left",delayTime:1000,pnLoop:false});</script>
                            <!-- <a class="imgbox pic"><img src="/skins/picture/s_32e312f27b.jpg" /></a> -->
                        </div>
                        <!--<a class="mask"><span class="symbol"><em class="ico ico_link"></em></span></a>-->
                    </div>
                </div>
                <script type="text/javascript">(function() {
                        var cliper = $(".illus_scale_cliper");
                        var illus = $(".illus");
                        var oW = illus.outerWidth();
                        var oH = illus.outerHeight();
                        update();
                        $(window).resize(update);

                        function update() {
                            var cliperW = cliper.width();
                            var rate = 0;
                            if (cliperW < oW) {
                                rate = cliperW / oW;
                                illus.css({
                                    "transform": "scale(" + rate + ")"
                                });
                                cliper.css("height", oH * rate);
                            } else {
                                rate = 1;
                                illus.css({
                                    "transform": ""
                                });
                                cliper.css({
                                    "height": ""
                                });
                            }
                        }
                    })();</script>
            </div>
            <div class="intro wow fadeInUp">
                <%=getColumBody("公司简介",400)%>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="index_sec_certificate">
        <div class="cnt">
            <div class="background background_1">
                <div class="background background_2">
                    <div class="cnt">
                        <div class="cnt_inside_border">
                            <h2 class="sec_title_sub wow fadeInUp">
                                <span class="line line_1 wow fadeInUp"></span>专项
                                <b>服务</b>
                                <span class="line line_2 wow fadeInUp"></span>
                            </h2>
                            <div class="sec_title_main wow fadeInUp">SPECIAL SERVICE</div>
                            <div class="certificate_list"><%rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("产品中心>2020产品") &") order by sortRank desc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
<li class="certificate_item wow fadeInUp" data-wow-delay="0.2s">
        <a href="detail.asp?id=<%=rs("id")%>" title="<%=rs("title")%>" class="imgbox pic">
            <img src="<%=rs("smallimage")%>" />
            <p><%=rs("title")%></p>
        </a>
    </li><%rs.movenext:next:rs.close%>
                            </div>
                            <p>
                                <a href="<%=getNavNameToUrl("","产品中心>2020产品")%>">更多服务</a>
                            </p>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="index_sec_certificate">
        <div class="cnt">
            <div class="background background_1">
                <div class="background background_2">
                    <div class="cnt">
                        <div class="cnt_inside_border">
                            <h2 class="sec_title_sub wow fadeInUp">
                                <span class="line line_1 wow fadeInUp"></span>产品
                                <b>案例</b>
                                <span class="line line_2 wow fadeInUp"></span>
                            </h2>
                            <div class="sec_title_main wow fadeInUp">SPECIAL SERVICE</div>
                            <div class="certificate_list"><%rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("产品中心>2021产品") &") order by sortRank desc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
<li class="certificate_item wow fadeInUp" data-wow-delay="0.2s">
        <a href="detail.asp?id=<%=rs("id")%>" title="<%=rs("title")%>" class="imgbox pic">
            <img src="<%=rs("smallimage")%>" />
            <p><%=rs("title")%></p>
        </a>
    </li><%rs.movenext:next:rs.close%>
                            </div>
                            <p>
                                <a href="<%=getNavNameToUrl("","产品中心>2021产品")%>">更多产品</a>
                            </p>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="index_sec_partner_and_advantage">
        <div class="index_sec_partner">
            <div class="cnt">
                <div class="sec_title_sub wow fadeInUp">
                    <div class="line line_1 wow fadeInUp"></div>服务
                    <b>案例</b>
                    <div class="line line_2"></div>
                </div>
                <div class="sec_title_main wow fadeInUp">service case</div>


<%rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("产品中心") &") order by sortRank desc" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>


<%if i mod 2=0 then%>
<div class="in_caselistb">
     <div class="left_box">
        <h2><a href="detail.asp?id=<%=rs("id")%>" title="<%=rs("title")%>"><%=rs("title")%></a></h2>
        <p><%=cutStr(rs("bodyContent"),300,"...")%></p>
       <h3><a href="detail.asp?id=<%=rs("id")%>" target="_blank" title="查看详情">查看详情&gt;&gt;</a></h3>
    </div>
    <div class="r_box"><img src="<%=rs("smallImage")%>"></div>

</div>
<%else%>
                <div class="in_caselista">
                    <div class="left_box">
                        <img src="<%=rs("smallImage")%>"></div>
                    <div class="r_box">
                        <h2>
                            <a href="detail.asp?id=<%=rs("id")%>" title="<%=rs("title")%>"><%=rs("title")%></a>
                        </h2>
                        <p><%=cutStr(rs("bodyContent"),300,"...")%></p>
                        <h3>
                            <a href="detail.asp?id=<%=rs("id")%>" title="查看详情">查看详情>></a>
                        </h3>
                    </div>
                </div>
<%end if%>
<%rs.movenext:next:rs.close%>


                <div class="clear"></div>
                <span class="sec_border"></span>
            </div>
        </div>
        <div class="index_sec_advantage">
            <div class="cnt">
                <div class="sec_title_main wow fadeInUp">ADVANTAGE</div>
                <h3 class="sec_title_sub wow fadeInUp">
                    <span class="line line_1 wow fadeInUp"></span>xiyuetaCMS
                    <em class="ico ico_thunder"></em>四大
                    <b>优势</b>
                    <span class="line line_2 wow fadeInUp"></span>
                </h3>
                <div class="list wow fadeInUp" id="index_sec_advantage_intro_list">
                    <div class="title_list"><%rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("优势") &") order by sortRank desc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
<div class="title_item on">
                            <div class="title_num">
                                <span class="title_symbol"><</span>
                                0<%=i%>.
                            </div>
                            <div class="title_text"><%=rs("title")%></div>
                        </div><%rs.movenext:next:rs.close%>



                        <span class="line_holder"></span>
                    </div>
                    <div class="photo_list"><%rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("优势") &") order by sortRank desc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
<a class="photo_item imgbox">
                            <img src="<%=rs("smallImage")%>" /></a><%rs.movenext:next:rs.close%>
                    </div>
                    <div class="intro_list">
                        <div class="slider">
<%rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("优势") &") order by sortRank desc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
                            <div class="intro_item on">
                                <div class="intro_content">
                                    <div class="intro_num">0<%=i%>.</div>
                                    <h3 class="intro_title"><%=rs("title")%></h3>
                                    <hr class="intro_split" />
                                    <div class="intro_description">
                                        <ul>
                                            <li>
                                                <span style="font-size:14px">
                                                    <%=rs("bodyContent")%>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
<%rs.movenext:next:rs.close%>

                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
            <script type="text/javascript">(function() {
                    var sliderID = "index_sec_advantage_intro_list";
                    var photoItems = $("#" + sliderID + " .photo_list .photo_item")
                    TouchSlide({
                        "slideCell": "#" + sliderID,
                        "titCell": ".title_list .title_item",
                        "mainCell": ".slider",
                        "endFun": function(index, navObjSize) {
                            photoItems.fadeOut().eq(index).fadeIn();
                        }
                    });
                })();</script>
        </div>
    </div>
    <div class="index_sec_news">
        <div class="cnt">
            <h3 class="sec_title_sub wow fadeInUp">
                <span class="line line_1 wow fadeInUp"></span>新闻
                <b>资讯</b>
                <span class="line line_2 wow fadeInUp"></span>
            </h3>
            <div class="sec_title_main wow fadeInUp">CLEANING NEWS</div>
            <div class="news_list"><%rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("新闻资讯") &") and smallimage<>'' order by sortRank desc" ,conn,1,1
for i=1 to 8
if rs.eof then exit for
%>
<span class="news_item wow fadeInUp" data-wow-delay="0.2s">
                    <a class="imgbox pic" href="detail.asp?id=<%=rs("id")%>">
                        <img src="<%=rs("smallImage")%>" /></a>
                    <span class="news_intro">
                        <a href="detail.asp?id=<%=rs("id")%>" class="news_title block"><%=rs("title")%></a>
                        <div class="news_brief"><%=cutStr(rs("bodyContent"),50,"...")%></div>
                        <div class="news_status_list">
                            <div class="news_status_time">
                                <em class="ico ico_clock"></em>
                                <%=format_Time(rs("createTime"),2)%>
                            </div>
                        </div>
                    </span>
                </span><%rs.movenext:next:rs.close%>

                <span class="line_holder"></span>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <!--#Include file = "footer.Asp"-->