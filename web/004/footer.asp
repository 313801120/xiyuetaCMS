
    <!-- 友情链接 -->
    <div class="friend-fluid">
        <div class="container">
            <span>友情链接：</span>

            <%rs.open "select * from " & db_PREFIX & "FriendLink where isThrough=1 order by sortrank asc" ,conn,1,1
            while not rs.eof 
                response.write("<a href='"& rs("httpurl") &"' target='_blank'>"& rs("title") &"</a>")
            rs.movenext:wend:rs.close
            %>

        </div>
    </div>
    <!-- footer -->
    <div class="footer-fluid">
        <div class="footer container clearfix">
            <div class="footer-left">
                <div class="foote-lList">

                    <%=webSiteBottom%>
 

                </div>
            </div>
            <div class="footer-middle">
                <div class="footer-mtitle">
                    <i class="iconfont icon-tubiao_liebiaopailie"></i>
                    产品导航
                </div>
                <ul class="clearfix">


<%
                        id=getNavNameToID("","产品中心")
                        if id<>"" then
                        rs.open "select * from " & db_PREFIX & "WebColumn where parentid="& id &" order by sortrank desc" ,conn,1,1
for i=1 to 9
if rs.eof then exit for
%>
<li>
                        <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>">
                            <i class="iconfont icon-jiantou_yemian_xiangyou"></i>
                            <%=rs("columnName")%>
                        </a>
                    </li><%rs.movenext:next:rs.close
                    end if%>
                </ul>
            </div>
            <div class="footer-ewm">
                <img src="<%=webQrcode%>" alt="">
                <p>微信二维码</p>
            </div>
        </div>
        <div class="footer-bottom container">
            <%=copyright%>
        </div>
    </div>
    <!--底部导航-->
<div class="bottoming">
    <ul class="clearfix">
        <li>
            <a href="./">
                <i class="iconfont icon-daohangshouye1"></i>
                <span>网站首页</span>
            </a>
        </li>
        <li>
            <a href="tel:18166668888">
                <i class="iconfont icon-dianhuaphone35"></i>
                <span>电话咨询</span>
            </a>
        </li>
        <li>
            <a href="tel:18166668888">
                <i class="iconfont icon-dianhua"></i>
                <span>电话咨询</span>
            </a>
        </li>
        <li>
            <a href="javascript:void(0)" id="gotop">
                <i class="iconfont icon-4fanhuidingbubai"></i>
                <span>返回顶部</span>
            </a>
        </li>
    </ul>
</div>

    <script src="templates/xwfcl/js/jquery-1.8.3.min.js"></script>
    <script src="templates/xwfcl/js/owl.carousel.js"></script>
    <script src="templates/xwfcl/js/common.js"></script>
</body>
</html>