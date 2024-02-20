<% 
'#禁止自动更新当前文件'  #号去掉代表此文件不被程序自动更新替换掉

                 '''
'               (0 0)
'   +-----oOO----(_)------------+
'   |                           |
'   |    author:XIYUETA         |
'   |    QQ:313801120           |
'   |    www.xiyueta.com        |
'   |                           |
'   +------------------oOO------+
'              |__|__|
'               || ||
'              ooO Ooo

cssName="footer010" 
resurl="/web/tpl/footer/010/"
 %>
 
<span class="footerwrap<%=cssName%>">
    <div class="footer">
        <!--底部导航-->
        <div class="footer-link">
            <div class="container">
                <%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 and flags like'%foot%' order by sortRank asc" ,conn,1,1
for i=1 to rs.recordcount
if rs.eof then exit for
%>
                <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") & rs("columnname")%></a>
                <%if i<rs.recordcount then%>
                <span>|</span>
                <%end if%>
<%rs.movenext:next:rs.close%> 
                
            </div>
        </div>
        <!--底部版权-->
        <div class="container clearfix">
            <div class="footer-logo img-center"><img src="<%=weblogo%>">
            </div>
            <div class="footer-info">
                <%=webfoot%>
            </div>
            <div class="footer-ewm">
                <div class="img-center"><img src="<%=webqrcode%>">
                </div>微信扫一扫
            </div>
        </div>
    </div>

    <div class="footer_showblock"></div>
    <!--手机端底部悬浮导航-->
    <div class="yunu-footer-fix">
        <ul class="clearfix">
            <li>
                <a href="tel:<%=webphone%>">
                    <i class="i1"></i>电话咨询
                </a>
            </li>
            <li>
                <a href="<%=getNavNameToUrl("","产品中心")%>">
                    <i class="i2"></i>产品中心
                </a>
            </li>
            <li>
                <a href="<%=getNavNameToUrl("","新闻资讯")%>">
                    <i class="i3"></i>新闻中心
                </a>
            </li>
            <li>
                <a href="./">
                    <i class="i4"></i>网站首页
                </a>
            </li>
        </ul>
    </div>
</span>
