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

cssName="overall001" 
resurl="/web/tpl/overall/001/" %>
    <span class="overall001">
        <section class="section_pro">
            <div class="wrap index_">
                <div class="g-bd1 f-cb">
                    <div class="g-sd1">
                        <div class="prod-slide">
                            <div class="cate-box">
                                <h3>产品中心</h3>
                                <ul> 
<%rs.open "select * from " & db_PREFIX & "webcolumn where  isthrough=1 AND parentid in("& getNameToAllId( "产品中心") &") order by sortRank asc,id asc" ,conn,1,1
for i=1 to 12
if rs.eof then exit for
%>
<li><a href="<%=getNavUrl(rs("id"),rs("columnType"))%>"><span><%=uTitle & rs("columnName")%></span></a></li>
<%rs.movenext:next:rs.close%>

                                </ul>
                            </div>
                            <div class="tel-box">
                                <p class="big">
                                    <i class="iconfont icon-dianhua1"></i>快速咨询热线
                                </p>
                                <p class="">
                                    <strong><%=webphone%></strong>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="g-mn1">
                        <div class="g-mn1c">
                            <div class="prod-cont">
                                <div class="row">

<%rs.open "select * from " & db_PREFIX & "ArticleDetail where isthrough=1 AND parentId in("& getNameToAllId( "产品中心") &") order by sortRank asc,id asc" ,conn,1,1
for i=1 to 6
if rs.eof then exit for
%>

                                    <div class="span-4 midd-4 smal-6">
                                        <div class="media-box i-prorec">
                                            <div class="icon widget-respimg js-respimg" data-ratiow="295" data-ratioh="200">
                                                <img src="<%=rs("smallimage")%>" alt="<%=uTitle&rs("title")%>">
                                                <div class="bg">
                                                </div>
                                                <a href="<%=getArticleUrl(rs("id"))%>" title="<%=uTitle&rs("title")%>" class="bg-text">
                                                    <span class="num">查看详情</span>
                                                </a>
                                            </div>
                                            <p class="f-toe">
                                                <%=uTitle&rs("title")%> </p>
                                        </div>
                                    </div>
<%rs.movenext:next:rs.close%>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
            $(function() {

                // 产品遮罩
                $(".i-prorec").hover(function() {
                    var _this = $(this);
                    _this.find(".bg").stop().animate({ top: 0 }, 600)
                    _this.find(".bg-text").stop().animate({ left: 0 }, 800)
                    // _this.find(".num").stop().animate({left : 0}, 800)
                    // _this.find(".line").stop().animate({left : 0}, 800)
                    // _this.find(".button").stop().animate({left : 70}, 800)
                }, function() {
                    var _this = $(this);
                    _this.find(".bg").stop().animate({ top: 270 }, 800)
                    _this.find(".bg-text").stop().animate({ left: -100 + '%' }, 600)
                    // _this.find(".num").stop().animate({left : -100 + '%'}, 600)
                    // _this.find(".line").stop().animate({left : -100 + '%'}, 600)
                    // _this.find(".button").stop().animate({left : -91}, 600)        
                })

                /*水平垂直居中*/
                $('.js-respimg').each(function(i) {
                    var ratioW = $(this).attr("data-ratioW"),
                        ratioH = $(this).attr("data-ratioH"),
                        fludwth = $(this).parent().width();
                    var ratio = ratioW / ratioH;
                    $(this).width(parseInt(fludwth));
                    $(this).height(parseInt(fludwth / ratio));

                    var isFirefox = navigator.userAgent.toUpperCase().indexOf("FIREFOX") > 0 ? true : false;
                    // if(isFirefox){
                    //     $(this).find('img').width(fludwth*0.8);
                    // }
                });


                // 手机二级导航
                $(".prod-slide .cate-box h3").click(function() {
                    if ($(this).siblings('ul').is(':hidden')) {
                        $(".m-ins-blackbg").show();
                        $(".prod-slide .cate-box ul").slideUp();
                        $(this).siblings('ul').slideDown();
                    } else {
                        $(".m-ins-blackbg").hide();
                        $(this).siblings('ul').slideUp();
                    }
                });

            })
            </script>
        </section>
    </span>
