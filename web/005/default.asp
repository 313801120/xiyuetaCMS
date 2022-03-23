<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->

    <!--banner-->
    <div class="banner-fluid">
        <div class="banner">
            <div id="banner" class="owl-carousel owl-theme">
            	<%
            	id=getNavNameToID("","banner")
            	rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId="& id &" order by sortRank desc" ,conn,1,1
            	for i=1 to 4
				if rs.eof then exit for
            	%>
                <div class="item">
                    <a href="javascript:;">
                        <img src="<%=rs("smallImage")%>" /></a>
                </div>
                <%rs.movenext:next:rs.close%>
            </div>
        </div>
    </div>
    <div class="product-fluid">
        <div class="main-title">
            <h2>产品中心</h2>
            <p>PRODUCT CENTER</p>
        </div>
        <div class="product">
            <div class="product-titlist">
                <div class="container">
                    <ul>
<%
id=getNavNameToID("","产品中心")
if id<>"" then
rs.open "select * from " & db_PREFIX & "WebColumn where parentid="& id &" order by sortrank desc" ,conn,1,1
for i=1 to 9
if rs.eof then exit for
%>
    <li<%=IIF(i=1," class='active'","")%>>
	<span><%=rs("columnName")%></span>
	</li>
	<%rs.movenext:next:rs.close
end if%>



                    </ul>
                </div>
            </div>
            <div class="container">
                <div class="productBox">

<%
id=getNavNameToID("","产品中心")
if id<>"" then
rsx.open "select * from " & db_PREFIX & "WebColumn where parentid="& id &" order by sortrank desc" ,conn,1,1
for j=1 to 9
if rsx.eof then exit for
%>
                    <div class="product-box<%=IIF(j=1," active","")%>">
                        <div id="product-box<%=j%>" class="owl-carousel owl-theme"><%rs.open "select * from " & db_PREFIX & "ArticleDetail  where parentid="& rsx("id")&" order by sortRank desc" ,conn,1,1
			for i=1 to 20
			if rs.eof then exit for
			%>
			<div class="item">
		        <a href="detail.asp?id=<%=rs("id")%>" class="pro-item">
		            <div class="pro-img">
		                <img src="<%=rs("smallimage")%>" alt="<%=rs("title")%>"></div>
		            <div class="pro-info">
		                <div class="pro-text">
		                    <div class="pro-t"><%=rs("title")%></div>
		                </div>
		            </div>
		        </a>
		    </div>
    <%rs.movenext:next:rs.close%>
                        </div>
                    </div>
<%rsx.movenext:next:rsx.close
end if%>




                </div>
            </div>
        </div>
    </div>
    <style>.product-fluid{
            padding-bottom: 0px;
        }
        .pro-item {
            padding: 10px 10px 0px 10px;
            border: 10px solid #fff;
        }

        .pro-item:hover {
            box-shadow: 0 0 0px #666;
            transform: translateY(0px);
            background: #e97609;
        }

        .pro-item:hover .pro-info .pro-t {
            color: #fff;
        }

        .pro-item:hover .pro-info .pro-w {
            color: #fff;
        }

        .pro-item:hover .pro-span {
            background: #fff;
            color: #e97609;
            border-color: #fff;
        }
        @media (max-width: 768px){
            .pro-item {
                border-width: 4px;
            }
        }</style>
    <div class="case-fluid">
        <div class="main-title">
            <h2>客户案例</h2>
            <p>Customer case</p>
        </div>
        <div class="case">
            <a href="<%=getNavNameToUrl("","产品中心")%>">
                <img src="templates/jinlaser/images/caseBig.jpg" alt=""></a>
        </div>
    </div>
    
    <!--五大优势 Five advantages-->
    <div class="advantages-fluid">
        <div class="advantages-title">
            <div class="adv-t">
                <span>五</span>大核心优势 让我们成为您优质的
                <span>优秀供应商</span>
            </div>
            <div class="adv-e">WHY CHOOSE US</div>
            <div class="adv-bg">做优质产品·成百年品牌</div>
        </div>
        <div class="advantages container">
            <div class="advantages-box">
                <div class="advantages-item1 clearfix">
                    <div class="advantages-img">
                        <img src="templates/jinlaser/images/ys1.png" alt="" /></div>
                    <div class="advantages-info">
                        <div class="advantages-text">
                            <div class="advantages-num">01</div>
                            <div class="advantages-w">
                                <div class="advantages-w-title">自主创新、研发</div>
                                <div class="advantages-w-word">自主创新是我们的生存之本，拥有庞大的技术研发团队，常年申请发明创造专利，为客户提供更加优质技术奠定了坚实基础。</div>
                            </div>
                        </div>
                        <div class="advantages-text">
                            <div class="advantages-num">02</div>
                            <div class="advantages-w">
                                <div class="advantages-w-title">标准生产工艺</div>
                                <div class="advantages-w-word">生产实时数据监控管理流程，现场资源追踪。高效精细的加工流程, 均达到国际标准生产工艺要求。</div>
                            </div>
                        </div>
                        <div class="advantages-text">
                            <div class="advantages-num">03</div>
                            <div class="advantages-w">
                                <div class="advantages-w-title">完善的客户服务</div>
                                <div class="advantages-w-word">为客户提供24小时值班制的售前，售中及售后服务体系，工程师点对点的培训、保养、及设备故障维修、工艺调试支持。建立完整的用户档案，定期专人回访，客户满意度调查。</div>
                            </div>
                        </div>
                        <div class="advantages-text">
                            <div class="advantages-num">04</div>
                            <div class="advantages-w">
                                <div class="advantages-w-title">高效解决方案</div>
                                <div class="advantages-w-word">提供高效又节约的技术解决方案，先后为多家高等院校、军工厂家、科研院所提供激光技术和非标自动化解决方案。</div>
                            </div>
                        </div>
                        <div class="advantages-text">
                            <div class="advantages-num">05</div>
                            <div class="advantages-w">
                                <div class="advantages-w-title">优异的技术、丰富的研发团队</div>
                                <div class="advantages-w-word">优异技术全部采用德国原装进口。拥有自动化核心团队，为客户量身定制非标设备。</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--关于我们-->
    <div class="fg-fluid">
        <div class="container">
            <div class="ab-tit">
                <h3>公司简介</h3>
                <p>about us</p>
            </div>


<%rs.open "select * from " & db_PREFIX & "WebColumn where columnName='公司简介'" ,conn,1,1
if not rs.eof then%>                
                <p><%=cutStr(rs("bodyContent"),260,"...")%></p>
<%end if:rs.close%>
            


            <div class="partBox">
                <div class="part-box">
                    <ul class="clearfix">
                        <li class="wow rollIn" data-wow-delay="0.4s">
                            <p class="part-w">
                                <span class="num">
                                    5
                                    <b>大</b>
                                </span>
                            </p>
                            <p class="part-text">我们的优势</p>
                        </li>
                        <li class="wow rollIn" data-wow-delay="0.2s">
                            <p class="part-w">
                                <span class="num">
                                    30+
                                    <b>种</b>
                                </span>
                            </p>
                            <p class="part-text">产品种类</p>
                        </li>
                        <li class="wow lightSpeedIn" data-wow-delay="0.2s">
                            <p class="part-w">
                                <span class="num">
                                    20
                                    <b>处</b>
                                </span>
                            </p>
                            <p class="part-text">区域覆盖</p>
                        </li>
                        <li class="wow lightSpeedIn" data-wow-delay="0.4s">
                            <p class="part-w">
                                <span class="num">
                                    200
                                    <b>家</b>
                                </span>
                            </p>
                            <p class="part-text">合作伙伴</p>
                        </li>
                    </ul>
                </div>
            </div>
            <a href="<%=getNavNameToUrl("","公司简介")%>" class="fg-more">查看更多</a>
        </div>
    </div>
    <!--新闻中心-->
    <div class="news-fluid">
        <div class="news container clearfix">
            <div class="news-box1">
                <div class="news-box-title clearfix">
                    <h2>行业新闻</h2>
                    <a href="<%=getNavNameToUrl("","新闻资讯>行业新闻")%>">MORE</a>
                </div>
                <div class="news-box1-list">

<%
id=getNavNameToID("","新闻资讯>行业新闻")
rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId="& id &" and smallImage<>'' order by sortRank desc" ,conn,1,1
if not rs.eof then
%>
                    <div class="news-box1-item clearfix">
                        <div class="news-box1-item-img">
                            <a href="detail.asp?id=<%=rs("id")%>">
                                <img src="<%=rs("smallImage")%>" /></a>
                        </div>

                        <div class="news-box1-item-info">
                            <h3>
                                <a href="detail.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
                            </h3>
                            <p class="t"><%=cutStr(rs("bodyContent"),100,"...")%></p>
                            <a href="detail.asp?id=<%=rs("id")%>" class="news-more">[查看详情]</a>
                        </div>
                    </div>
<%end if:rs.close%>

                    <ul><%
rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId="& id &" and smallImage='' order by sortRank desc" ,conn,1,1
for i=1 to 5
if rs.eof then exit for
%>
<li class="clearfix">
                            <a href="detail.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
                            <span><%=format_Time(rs("createTime"),2)%></span>
                        </li><%rs.movenext:next:rs.close%>
                    </ul>
                </div>
            </div>
            <div class="news-box1">
                <div class="news-box-title clearfix">
                    <h2>公司新闻</h2>
                    <a href="<%=getNavNameToUrl("","新闻资讯>公司新闻")%>">MORE</a>
                </div>
                <div class="news-box1-list">
<%
id=getNavNameToID("","新闻资讯>公司新闻")
rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId="& id &" and smallImage<>'' order by sortRank desc" ,conn,1,1
if not rs.eof then
%>
                    <div class="news-box1-item clearfix">
                        <div class="news-box1-item-img">
                            <a href="detail.asp?id=<%=rs("id")%>">
                                <img src="<%=rs("smallImage")%>" /></a>
                        </div>
                        <div class="news-box1-item-info">
                            <h3>
                                <a href="detail.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
                            </h3>
                            <p class="t"><%=cutStr(rs("bodyContent"),100,"...")%></p>
                            <a href="detail.asp?id=<%=rs("id")%>" class="news-more">[查看详情]</a>
                        </div>
                    </div>
<%end if:rs.close%>


                    <ul><%
                    rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId="& id &" and smallImage='' order by sortRank desc" ,conn,1,1
for i=1 to 5
if rs.eof then exit for
%>
<li class="clearfix">
                            <a href="detail.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
                            <span><%=format_Time(rs("createTime"),2)%></span>
                        </li><%rs.movenext:next:rs.close%>
                    </ul>
                </div>
            </div>
            <div class="news-box2">
                <div class="news-box-title clearfix">
                    <h2>常见问题</h2>
                    <a href="<%=getNavNameToUrl("","常见问题")%>">MORE</a>
                </div>
                <div class="news-box2-list">
<%
id=getNavNameToID("","常见问题")
rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId="& id &" order by sortRank desc" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>
                    <dl>
                        <dt>
                            <em>Q</em>
							<a href="detail.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
                        </dt>
                        <dd>
                            <em>A</em>
                            <p><%=rs("bodyContent")%></p>
                        </dd>
                    </dl>
<%rs.movenext:next:rs.close%>
                </div>
            </div>
        </div>
    </div>
    <!--#Include file = "footer.Asp"-->
    
    <script src="templates/jinlaser/js/jquery-1.8.3.min.js"></script>
    <script src="templates/jinlaser/js/owl.carousel.js"></script>
    <script>$(function () {
            //banner
            $('#banner').owlCarousel({
                autoPlay: true,
                autoplayTimeout: 1000,
                autoplayHoverPause: true,
                singleItem: true,
                navigation: true,
                navigationText: ["", ""]
            });
            $("#product-box1").owlCarousel({
                items: 4,
                autoPlay: true,
                autoplayTimeout: 1000,
                autoplayHoverPause: true,
                pagination: false,
                navigation: true,
                navigationText: ["", ""],
            });
            $("#product-box2").owlCarousel({
                items: 4,
                autoPlay: true,
                autoplayTimeout: 1000,
                autoplayHoverPause: true,
                pagination: false,
                navigation: true,
                navigationText: ["", ""],
            });
            $("#product-box3").owlCarousel({
                items: 4,
                autoPlay: true,
                autoplayTimeout: 1000,
                autoplayHoverPause: true,
                pagination: false,
                navigation: true,
                navigationText: ["", ""],
            });
            $("#product-box4").owlCarousel({
                items: 4,
                autoPlay: true,
                autoplayTimeout: 1000,
                autoplayHoverPause: true,
                pagination: false,
                navigation: true,
                navigationText: ["", ""],
            });

            $(".product-titlist ul li").mouseover(function () {
                $(this).addClass("active").siblings().removeClass("active");

                $(".product-box").eq($(this).index()).addClass("active").siblings().removeClass("active");
            })
            //2.返回顶部

            $('.gotop').click(function () {

                $('body,html').animate({
                    scrollTop: 0
                }, 300);
                return false;

            });
            $('#gotop').click(function () {

                $('body,html').animate({
                    scrollTop: 0
                }, 300);
                return false;

            });
            //导航
            $(".daohang").click(function () {
                if ($(".nav").css("display") == "none") {
                    $(".nav").css("display", "block");
                } else if ($(".nav").css("display") == "block") {
                    $(".nav").css("display", "none");
                }
            });
            //产品图片尺寸控制
            img($(".pro-item .pro-img img"), 1);

            function img(obj, t) {
                obj.height((obj.width() * t).toFixed(2));
            }
            //解决方案图片尺寸控制
            // img($(".solutions-img img"), 0.66);
        });</script>
</body>
<!--修改样式-->
<style type="text/css">.solutions-fluid {
        background: #fff;
    }

    .solutions-box {
        border: 5px solid #fff;
    }

    .solutions-item {
        width: 50%;
        margin-right: 0px;
        border: 5px solid #fff;
        position: relative;
        margin-bottom: 0px;
    }

    .solutions-info {
        position: absolute;
        top: 50%;
        left: 0px;
        background: transparent;
        width: 100%;
        margin-top: -25px;
    }

    .solutions-info .solutions-t {
        text-align: center;
        font-size: 26px;
        width: 100%;
        margin-top: 0px;
        opacity: 0;
        color: #fff;
        width: 350px;
        margin: 0px auto;
        background: rgb(233, 118, 9, 0.8);
        line-height: 50px;
        height: 50px;
        border-radius: 10px;
        transition: all .3s;
    }

    .solutions-item:hover .solutions-info .solutions-t {
        opacity: 1;
        color: #fff;
    }

    .solutions-item .solutions-img img {
        transition: all .3s;
    }

    .solutions-item:hover .solutions-img img {
        transform: scale(1.1);
    }

    .fg-more:hover {
        background: #e97609;
    }

    /*banner图下面分割*/

    .advantages-fluid {
        padding-top: 0px;
    }

    .part-box ul {
        padding-top: 30px;
        padding-bottom: 20px;
    }

    .part-box ul li {
        float: left;
        width: 25%;
        display: inline-block;
        text-align: center;
        /*border-right: 1px solid #e4e4e4;*/
    }

    .part-box ul li:last-child {
        border-right: 0px;
    }

    .part-box ul li .part-w {
        text-align: center;
    }

    .part-box ul li .part-w .num {
        position: relative;
        color: #fff;
        font-size: 50px;
        display: inline-block;
        font-family: Arial;
    }

    .part-box ul li .part-w .num b {
        position: absolute;
        top: 0;
        right: -20px;
        color: #949494;
        font-size: 12px;
        font-style: normal;
    }

    .part-box ul li .part-text {
        text-align: center;
        color: #949494;
    }

    @media (max-width: 640px) {
        .part-box ul li .part-w .num {
            font-size: 28px;
        }

        .solutions-info .solutions-t {
            width: 90%;
            font-size: 14px;
            line-height: 50px;
        }

        .fg-fluid p {
            text-indent: 0px;
        }
    }</style>
</html>