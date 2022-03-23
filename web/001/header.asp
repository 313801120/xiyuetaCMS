<div class="header_sec_logo">
     <div class="cnt"> <a class="navi_btn" href="javascript:;">
            <div class="line line_1"></div>
            <div class="line line_2"></div>
            <div class="line line_3"></div>
        </a>
            <div class="contact wow fadeInRight">
                <span class="symbol">
                    <em class="ico phone"></em>
                </span>
                <div class="intro">
                    <div class="title">24小时电话</div>
                    <div class="num">021-1234567</div>
                </div>
            </div>
            <style>.header_sec_logo .cnt .contact .symbol {
            float: left;
            }
            .header_sec_logo .cnt .contact {
            width: 210px;
            }</style>
            <div class="logo_list wow fadeInLeft">
                <a class="logo_main" href="/">
                    <img class="pc_logo" src="/web/testpic/logo.png" />
                    <img class="m_logo" src="/web/testpic/logo.png" /></a>
                <span class="logo_split"></span>
                <a class="pic_sec">
                    <span style="display: block;">专业网站制作</span>
                    <span>十年工作经验</span>
                </a>
            </div>
            <div class="clear"></div>
        </div>
        <script type="text/javascript">(function() {
                $(".header_sec_logo .navi_btn").click(function(event) {
                    window.open_navi();
                    event.stopPropagation();
                });
            })();</script>
    </div>
    <div class="header_sec_navi wow fadeInUp">
        <div class="cnt"> <a class="navi_btn" href="javascript:;"> <em class="line line_1"></em> <em class="line line_2"></em> <em class="line line_3"></em> </a>

            <div class="navi_list"><%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 order by sortRank asc" ,conn,1,1
while not rs.eof
%>
<span class="navi_item<%=IIF(isFocusNav(rs)," on","")%>">
    <a class="navi_item_title" href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
</span>
<%rs.movenext:wend:rs.close%>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <script type="text/javascript">(function() {
            var navi = $(".header_sec_navi");
            var btn = navi.find(".navi_btn");
            $(document).on("click touchend", function(event) {
                var target = event.target;
                if (isOpen()) {
                    if (btn.find(target).legnth || btn[0] == target) {
                        close();
                    } else if (navi.find(target).length || navi[0] == target) {} else {
                        close();
                    }
                } else {
                    if (btn.find(target).length || btn[0] == target) {
                        open();
                    } else {
                        close();
                    }
                }
            });

            function open() {
                navi.addClass("on");
            }

            function close() {
                navi.removeClass("on");
            }

            function isOpen() {
                return navi.hasClass("on");
            }
            window.open_navi = open;
        })();</script>