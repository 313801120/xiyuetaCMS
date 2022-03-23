
    <div class="footer_sec_link wow fadeInUp">
        <div class="cnt">
            <span class="link_title">友情链接：</span>
            <div class="link_list"><%rs.open "select * from " & db_PREFIX & "FriendLink where isThrough=1 order by sortrank asc" ,conn,1,1
while not rs.eof
    %>
<a href="<%=rs("httpurl")%>" rel="nofollow" target="_blank"><%=rs("title")%></a><span class="link_split">|</span>

<%rs.movenext:wend:rs.close%>

            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="footer_sec_navi">
        <div class="cnt">
            <div class="navi_sec_list">
                <span class="navi_sec_item contact_sec wow fadeInUp" data-wow-delay=".6s">
                    <div class="navi_sec_title">联系我们</div>
                    <div class="contact_follow">
                        <div class="border border_1"></div>
                        <div class="border border_2"></div>
                        <div class="follow_list">
                            <div class="follow_item">
                                <a href="http://wpa.qq.com/msgrd?v=3&uin=313801120&site=qq&menu=yes" target="_blank" rel="nofollow">
                                    <em class="ico ico_qq"></em>
                                </a>
                            </div>
                            <div class="follow_item">
                                <em class="ico ico_wechat"></em>
                                <div class="barcode imgbox">
                                    <img src="<%=webQrcode%>" width="160" /></div>
                            </div>
                            <div class="follow_item">
                                <a href="https://weibo.com" target="_blank" rel="nofollow">
                                    <em class="ico ico_weibo"></em>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="contact_phone">
                        <div class="symbol">
                            <em class="ico ico_phone"></em>
                        </div>
                        <div class="intro">
                            <div class="title">24小时服务热线</div>
                            <div class="value">021-6668888</div>
                        </div>
                    </div>
                    <div class="contact_option_list">
                        传 真：021-6668888
                        <br />
                        E-mail：
                        <span style="font-family:微软雅黑,arial,helvetica,sans-serif; line-height:24px">
                            <a class="__cf_email__" data-cfemail="6706030a0e092706030a0e0905121e490409">313801120@qq.com</a>
                        </span>
                        <br />
                        手机：18131380112
                    </div>
                </span>


<%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 and (columntype='新闻' or columntype='产品' or columntype='文本') order by sortRank asc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
<span class="navi_sec_item wow fadeInUp">
    <div class="navi_sec_title"><%=rs("columnName")%></div>
    <div class="navi_sec_option_list">

    <%rsx.open "select * from " & db_PREFIX & "WebColumn where parentId="& rs("id") &" and isThrough=1 order by sortRank asc" ,conn,1,1    
    while not rsx.eof
    %>
        <div class="navi_sec_option_item">
            <a href="<%=getNavUrl(rsx("id"),rsx("columnType"))%>"><%=rsx("columnName")%></a>
        </div>
    <%rsx.movenext:wend:rsx.close%>
</div>
                </span>
<%rs.movenext:next:rs.close%>




                <span class="line_holder"></span>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="footer_sec_copy">
        <div class="cnt">
            <div class="copy_intro">
                <%=copyright%>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="foot_tool_bar">
        <div class="ec_footer_btns">
            <div class="ec_footer_button ec_footer_btn_color">
                <a href="sms:13701715727" class="ec_fclick" data-mt="133" data-ext1="sms" data-ext2="0">
                    <i class="c-icon sms_icon"></i>
                    短信咨询
                </a>
            </div>
            <div class="ec_footer_button ec_footer_btn_color">
                <a href="tel:02154338593" class="ec_fclick" data-mt="133" data-ext1="phone" data-ext2="2">
                    <i class="c-icon makephone_icon"></i>
                    电话咨询
                </a>
            </div>
        </div>
    </div>
    <script type="text/javascript">(function() {
                var page = $("html, body");

                $(".online_func .ico_backtop").click(function(e) {
                    page.on("scroll mousedown wheel DOMMouseScroll mousewheel keyup touchmove", function() {
                        page.stop();
                    });
                    page.animate({
                        scrollTop: $(this).position().top
                    }, "slow", function() {
                        page.off("scroll mousedown wheel DOMMouseScroll mousewheel keyup touchmove");
                    });
                    return false;
                });
            })();</script>
    <div class="online_page_holder"></div>
    <script>new WOW().init();</script>
    <script type="text/javascript">(function() {

            var bodyElem = $(".online_func");
            var holderElem = $(".online_page_holder");
            update();
            $(window).resize(update);

            function update() {
                holderElem.show;
                holderElem.css("height", bodyElem.height());
            }
        })();</script>

    
</body>
</html>