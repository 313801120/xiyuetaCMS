<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->
    <!--*****************************************************************************-->
    <link rel="stylesheet" type="text/css" href="templates/cqmrgroup/css/jquery.bxslider.css" />
    <script type="text/javascript" src="templates/cqmrgroup/js/jquery.bxslider.js"></script>
    <div class="slider1">




<%
id=getNavNameToID("","banner")
rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId="& id &" order by sortRank desc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
    <div>
        <a href="javascript:void(0);"><img src="<%=rs("smallImage")%>"></a>
    </div>
<%rs.movenext:next:rs.close%>
        


    </div>
    <script type="text/javascript">$(function(){
        $('.slider1').bxSlider({
                auto: true,
                adaptiveHeight: true,
                startSlides: 0, 
                slideMargin: 10
        });
});</script>
    <div class="main">
        <div class="m1">
            <div class="m1a">
                <div class="m1a1">
                    公司简介
                    <span></span>
                </div>

<%rs.open "select * from " & db_PREFIX & "WebColumn where columnName='公司简介'" ,conn,1,1
if not rs.eof then%>
                <div class="m1a2"><%=cutStr(rs("bodyContent"),210,"...")%></div>
                <div class="m1a3">
                    <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>">了解更多</a>
                </div>
<%end if:rs.close%>

                <div class="m1a4">
                    <ul>
                        <li>
                            <a href="<%=getNavNameToUrl("","关于我们>公司风采")%>">
                                <img src="templates/cqmrgroup/images/m1.jpg">
                                <h1>公司风采</h1>
                            </a>
                        </li>
                        <li>
                            <a href="<%=getNavNameToUrl("","关于我们>公司致辞")%>">
                                <img src="templates/cqmrgroup/images/m2.jpg">
                                <h1>公司致辞</h1>
                            </a>
                        </li>
                        <li>
                            <a href="<%=getNavNameToUrl("","关于我们>公司荣誉")%>">
                                <img src="templates/cqmrgroup/images/m3.jpg">
                                <h1>公司荣誉</h1>
                            </a>
                        </li>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="m1b">
                <img src="templates/cqmrgroup/images/m4.jpg"></div>
            <div class="clear"></div>
        </div>
        <div class="tit">
            <div class="titc">
                <h1>新闻中心</h1>
                <p>NEW CENTER</p>
            </div>
        </div>
        <div class="m2">
            <ul>

<%rs.open "select * from " & db_PREFIX & "ArticleDetail order by id desc" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>
<li>
                <li>
                    <div class="m2a">
                        <p>
                            <%=format_Time(rs("createTime"),89)%>-
                            <span><%=format_Time(rs("createTime"),88)%></span>
                        </p>
                        <em></em>
                    </div>
                    <h1><%=rs("title")%></h1>
                    <h2><%=cutStr(delHtml(rs("bodyContent")),50,"...")%></h2>
                    <a href="detail.asp?id=<%=rs("id")%>">查看更多 ></a>
                </li>
<%rs.movenext:next:rs.close%>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="tit">
            <div class="titc">
                <h1>产品中心</h1>
                <p>PRODUCTS</p>
            </div>
        </div>
        <div class="m3">
            <span id="xm9" class="m3cur">2020产品</span>
            <em>/</em>
            <span id="xm10" >2021产品</span>
        </div>
        <div class="m4" id="xm9_con" >
            <ul><%
                parentId=getNavNameToID("","产品中心>2020产品")
                rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId="&parentId ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
<li>
                    <a href="detail.asp?id=<%=rs("id")%>">
                        <label>
                            <img src="<%=rs("smallimage")%>"></label>
                        <h1><%=rs("title")%></h1>
                        <p><%=cutStr(delHtml(rs("bodyContent")),50,"...")%></p>
                        <span>+</span>
                    </a>
                </li><%rs.movenext:next:rs.close%>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="m4" id="xm10_con" style="display:none;">
            <ul><%
                parentId=getNavNameToID("","产品中心>2021产品")
                rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId="&parentId ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
<li>
                    <a href="detail.asp?id=<%=rs("id")%>">
                        <label>
                            <img src="<%=rs("smallimage")%>"></label>
                        <h1><%=rs("title")%></h1>
                        <p><%=cutStr(delHtml(rs("bodyContent")),50,"...")%></p>
                        <span>+</span>
                    </a>
                </li><%rs.movenext:next:rs.close%>
            </ul>
            <div class="clear"></div>
        </div>        
        <div class="clear"></div>
    </div>
    <script type="text/javascript">$(function(){
    $(".m3 span").click(function(){
        xid = $(this).attr("id")+"_con";
        $(".m3 span").removeClass("m3cur");
        $(this).addClass("m3cur");
        $(".m4").hide();
        $("#"+xid).show();
    });
});</script>
<!--#Include file = "footer.Asp"-->