<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->

    <!-- banner -->
    <div class="banner-fluid">
        <div class="banner owl-carousel owl-theme" id="banner"><%
id=getNavNameToID("","banner")
addSql=""
if id<>"" then addSql=" where parentId=" & id
rs.open "select * from " & db_PREFIX & "ArticleDetail"& addSql &" order by sortrank desc" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>
<div class="item">
                <a href="javascript:;">
                    <img src="<%=rs("smallImage")%>" alt=""></a>
            </div><%rs.movenext:next:rs.close%>
        </div>
    </div>
    <section class="product-fluid">
        <div class="container clearfix">
            <div class="product-sidebar">
                <div class="title">产品分类</div>
                <div class="list">
                    <ul><%
                        id=getNavNameToID("","产品中心")
                        if id<>"" then
                        rs.open "select * from " & db_PREFIX & "WebColumn where parentid="& id &" order by sortrank desc" ,conn,1,1
for i=1 to 9
if rs.eof then exit for
%>
<li>
                            <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>">
                                <i class="iconfont icon-jiantou_xiangyouliangci"></i>
                                <%=rs("columnName")%>
                            </a>
                        </li><%rs.movenext:next:rs.close
                        end if%>
                    </ul>
                </div>
                <!-- 服务咨询电话 -->
                <div class="fwzx-box">
                    <p>服务咨询热线</p>
                    <p class="fwzx-tel">18166668888</p>
                    <a href="tencent://message/?uin=313801120&Site=xiyueta.com&Menu=yes" class='fwzx-more' target="_blank">在线咨询</a>
                </div>
            </div>
            <div class="product-right">
                <div class="product-r-title clearfix">
                    <div class="left">
                        <div class="title">
                            <span>产品中心</span>
                            <em>product center</em>
                        </div>
                    </div>
                    <div class="right">
                        <a href="<%=getNavNameToUrl("","产品中心>2021产品")%>">查看更多+</a>
                    </div>
                </div>
                <div class="main-title">
                    <div class="title">产品中心</div>
                    <div class="english">product center</div>
                </div>
                <div class="product-list clearfix"><%
                    id=getNavNameToID("","产品中心")
                    idList=getColumAllID(id)
                    if idList<>"" then idList=id & "," & idList 

                    rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& idList &")" ,conn,1,1
for i=1 to 36
if rs.eof then exit for
%>
<div class="product-item">
                        <a href="detail.asp?id=<%=rs("id")%>">
                            <div class="product-img">
                                <img src="<%=rs("smallImage")%>"></div>
                            <div class="product-info"><%=rs("title")%></div>
                        </a>
                    </div><%rs.movenext:next:rs.close%>
                </div>
                <div class="product-more">
                    <a href="<%=getNavNameToUrl("","产品中心>2021产品")%>">查看更多</a>
                </div>
            </div>
        </div>
    </section>
    <!-- 选择我们的理由 -->
    <section class="reson-fluid">
        <div class="container">
            <div class="main-title">
                <div class="title">
                    选我们的
                    <span>5</span>
                    大理由
                </div>
                <div class="english">Five Reasons for Choosing Wanfu Curtains</div>
            </div>

            <div class="reson clearfix">
                <div class="reson-item">
                    <div class="reson-img">
                        <img src="templates/xwfcl/images/reson-img1.png" alt=""></div>
                    <div class="reson-info">
                        <div class="tit">生产经验丰富</div>
                        <div class="des">拥有多年窗饰生产经验，保证高品质的产品销售体系</div>
                    </div>
                </div>
                <div class="reson-item">
                    <div class="reson-img">
                        <img src="templates/xwfcl/images/reson-img2.png" alt=""></div>
                    <div class="reson-info">
                        <div class="tit">量身定做</div>
                        <div class="des">针对性为您量身设计最合适、最高性价比的窗饰</div>
                    </div>
                </div>
                <div class="reson-item">
                    <div class="reson-img">
                        <img src="templates/xwfcl/images/reson-img3.png" alt=""></div>
                    <div class="reson-info">
                        <div class="tit">专业迅速</div>
                        <div class="des">全市各区服务点都有业务员迅速上门服务</div>
                    </div>
                </div>
                <div class="reson-item">
                    <div class="reson-img">
                        <img src="templates/xwfcl/images/reson-img4.png" alt=""></div>
                    <div class="reson-info">
                        <div class="tit">厂价直销</div>
                        <div class="des">自有生产工厂，一线直销，除去了中间商的暴利，价格最实惠</div>
                    </div>
                </div>
                <div class="reson-item">
                    <div class="reson-img">
                        <img src="templates/xwfcl/images/reson-img5.png" alt=""></div>
                    <div class="reson-info">
                        <div class="tit">优质的售后</div>
                        <div class="des">专业售后24小时在线，快速响应机制，随时帮您解决问题</div>
                    </div>
                </div>
            </div>


        </div>
    </section>
    <!-- 合作案例 -->
    <section>
        <div class="container">
            <div class="main-title">
                <div class="title">合作案例</div>
                <div class="english">Cooperation cases</div>
            </div>
            <div class="case owl-carousel owl-theme" id="case">
                <%

                    id=getNavNameToID("","产品中心")
                    idList=getColumAllID(id)
                    if idList<>"" then idList=id & "," & idList 

                    rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& idList &")" ,conn,1,1
for i=1 to 10
if rs.eof then exit for
%>
<div class="item">
        <div class="case-item">
            <a href="detail.asp?id=<%=rs("id")%>">
                <div class="case-img">
                    <img src="<%=rs("smallimage")%>" alt="<%=rs("title")%>"></div>
                <div class="case-info">
                    <p><%=rs("title")%></p>
                </div>
            </a>
        </div>
    </div><%rs.movenext:next:rs.close%>
            </div>
        </div>
    </section>
    <!-- 公司简介 -->
    <section class="about-fluid">
        <div class="container">
            <div class="main-title">
                <div class="title">公司简介</div>
                <div class="english">about us</div>
            </div>
            <div class="about clearfix">





                <div class="about-img">
                    <a href="http://www.xwfcl.com/about/">
                        <img src="templates/xwfcl/images/about.jpg" alt=""></a>
                </div>




<%rs.open "select * from " & db_PREFIX & "WebColumn where columnName='公司简介'" ,conn,1,1
if not rs.eof then%>                
                <div class="about-info">
                    <div class="about-info-des"><%=cutStr(rs("bodyContent"),260,"...")%></div>
                    <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" class="about-more">查看详情</a>
                </div>
<%end if:rs.close%>




            </div>
        </div>
    </section>
    <!-- 新闻列表 -->
    <section class="news-fluid">
        <div class="container">
            <div class="main-title">
                <div class="title">新闻动态</div>
                <div class="english">news center</div>
            </div>
            <div class="news clearfix"><%
                id=getNavNameToID("","新闻资讯")
                rs.open "select * from " & db_PREFIX & "WebColumn where parentId="& id &" order by sortRank desc" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>

<div class="news-box">
                    <div class="news-box-img">
                        <img src="templates/xwfcl/images/news-img<%=i%>.jpg" alt="">
                        <div class="news-box-title">
                            <div class="title"><%=rs("columnName")%></div>
                            <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>">更多+</a>
                        </div>
                    </div>
                    <div class="news-box-list">
                        <ul>
              <%                
                    rsx.open "select * from " & db_PREFIX & "ArticleDetail where parentId="&rs("id") ,conn,1,1
for j=1 to 8
if rsx.eof then exit for
%>
                            <li class="clearfix">
                                <a href="detail.asp?id=<%=rsx("id")%>"><%=rsx("title")%></a>
                                <span><%=format_Time(rsx("createTime"),2)%></span>
                            </li>
                            <%rsx.movenext:next:rsx.close%>
                        </ul>
                    </div>
                </div><%rs.movenext:next:rs.close%>
            </div>
        </div>
    </section>
    <!--#Include file = "footer.Asp"-->