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
       

           <section class="section_case">
        <div class="wrap index_">
            <article class="article">
                <header class="t">
                    <%=getOnePageBody("overall001_case-标题",""& vbCrlf &"                           <h2>工程案例</h2>"& vbCrlf &"                    <h3>优质的产品赢得千万家客户的信赖</h3>"& vbCrlf &"                                ")%>
                </header>
            </article>
            <div class="jcarousel-wrapper">
                <div class="jcarousel" id="jcarousel1">
                    <ul>


<%rs.open "select * from " & db_PREFIX & "ArticleDetail where isthrough=1 AND parentId in("& getNameToAllId( "产品中心") &") order by sortRank asc,id asc" ,conn,1,1
for i=1 to 6
if rs.eof then exit for
%>
                        <li class="case-item">
                            <a href="<%=getArticleUrl(rs("id"))%>">
                                <div class="icon port-box" data-ratiow="258" data-ratioh="176">
                                    <img src="<%=rs("smallimage")%>" alt="<%=uTitle&rs("title")%>">
                                </div>
                            </a>
                            <p class="f-tac f-toe">
                                <a href="306.html"><%=uTitle&rs("title")%></a>
                            </p>
                        </li>
<%rs.movenext:next:rs.close%>

                    </ul>
                </div>
                <p class="jcarousel-pagination hide">
                </p>
                <a href="javascript:;" class="jcarousel-control jcarousel-control-prev" data-jcarouselcontrol="true">‹</a>
                <a href="javascript:;" class="jcarousel-control jcarousel-control-next" data-jcarouselcontrol="true">›</a>
            </div>
        </div> 
        <script type="text/javascript" src="<%=resurl%>js/jquery.jcarousel.min.js"></script>
        <script>
        $(function() {
            jcarousel('#jcarousel1', 4, 3, 1, 2, 3000, 400, 1); //客户案例

            // $("#mycarousel").jcarousel();
        })

        // function getWindowType() {

        //     var Type;
        //     if (window.getComputedStyle) {
        //         var screenType = window.getComputedStyle(document.body, ":after").getPropertyValue("content");
        //         Type = /Pc/.test(screenType) ? 'Pc' : (/Pad/.test(screenType) ? 'Pad' : 'Mobile');
        //     console.log(1,window.getComputedStyle,screenType)
        //     } else {
        //         Type = 'Pc';
        //     }
        //     return Type;
        // }  
 

        function jcarousel(element, numPc, numPad, numMobile, target, interval, duration, autostart) {

            var jcarousel = $(element);
            var jcarouselPrev = jcarousel.parent().find('.jcarousel-control-prev');
            var jcarouselNext = jcarousel.parent().find('.jcarousel-control-next');
            var jcarouselPagination = jcarousel.parent().find('.jcarousel-pagination');

            var numPc = numPc ? numPc : 4;
            var numPad = numPad ? numPad : 3;
            var numMobile = numMobile ? numMobile : 1;
            var target = target ? target : 1;
            var interval = interval ? interval : 3000;
            var duration = duration ? duration : 400;
            var autostart = autostart ? autostart : false;

            jcarousel.on('jcarousel:reload jcarousel:create', function(event, carousel) {
                    var width = jcarousel.innerWidth();
                    // console.log(width,$(window).width())
                    //响应
                    if ($(window).width()>=1024) {//PC
                        width = width / numPc;
                    } else if ($(window).width()>=800) {
                        width = width / numPad;
                    } else {
                        width = width / numMobile;
                    }


                    jcarousel.jcarousel('items').css('width', width + 'px');

                    $('.jcarousel li .icon').each(function(i) {
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
                    $('#jcarousel2').mouseenter(function() {
                        $('#jcarousel2').jcarouselAutoscroll('stop');
                    })
                    $('#jcarousel2').mouseleave(function() {
                        $('#jcarousel2').jcarouselAutoscroll('start');
                    })
                    $('#jcarousel1').mouseenter(function() {
                        $('#jcarousel1').jcarouselAutoscroll('stop');
                    })
                    $('#jcarousel1').mouseleave(function() {
                        $('#jcarousel1').jcarouselAutoscroll('start');
                    })
                })
                .jcarousel({
                    wrap: 'circular',
                    animation: {
                        duration: duration, //default:400
                        easing: 'linear',
                        complete: function() {}
                    },
                    //vertical: true
                })
                .jcarouselAutoscroll({
                    target: '+=1', //default:+=1
                    interval: interval, //default:3000
                    autostart: autostart, //default:true
                });

            jcarouselPrev
                .jcarouselControl({
                    target: '-=1'
                });

            jcarouselNext
                .jcarouselControl({
                    target: '+=1'
                });

            jcarouselPagination
                .on('jcarouselpagination:active', 'a', function() {
                    $(this).addClass('active');
                })
                .on('jcarouselpagination:inactive', 'a', function() {
                    $(this).removeClass('active');
                })
                .on('click', function(e) {
                    e.preventDefault();
                })
                .jcarouselPagination({
                    perPage: 1,
                    item: function(page) {
                        return '<a href="#' + page + '">' + page + '</a>';
                    }
                });

        }
        </script>
    </section>

    </span>
