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

cssName="topnav001" 
resurl="/web/tpl/topnav/001/"
 %>

<div class="header<%=cssName%> hidden-sm hidden-xs" cpid="1467" id="smv_Area0" style="width: 1000px; height:213px;  position: relative; margin: 0 auto">
    <script src="<%=resurl%>js/common.min.js" type="text/javascript"></script>
    <div id="smv_tem_10_15" ctype="nav" class="esmartMargin smartAbs " cpid="1467" cstyle="Style3" ccolor="Item0" areaId="Area0" isContainer="False" pvid="" tareaId="Area0" re-direction="all" daxis="All" isdeletable="True" style="height: 106px; width: 1000px; left: 0px; top: 106px;z-index:18;">
        <div class="yibuFrameContent tem_10_15  nav_Style3  " style="overflow:visible;;">
            <div id="nav_tem_10_15" class="nav_pc_t_3">
                <ul class="w-nav" navstyle="style3">
                    <li class="sliding-box" style="left:-0px;top:-0px">
                        <div class="sliding" style="width:20%;"></div>
                    </li>

<%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 and flags like'%top%' order by sortRank asc" ,conn,1,1
while not rs.eof
%>  
<li class="w-nav-inner" style="height:106px;line-height:106px;width:20%;">
<div class="w-nav-item<%=IIF(isFocusNav(rs)," current","")%>">
<a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" class="w-nav-item-link">
<span class="mw-iconfont"></span>
<span class="w-link-txt"><%=rs("columnName")%></span>
</a>
<div class="sliding" style="width:20%;"></div>
</div>
</li>
<%rs.movenext:wend:rs.close%>
                </ul>
            </div>
            <script>$(function () {
        $('#nav_tem_10_15').find('.w-subnav').hide();
        var $this, item, itemAll, index, itemW, goTo;
        $('#nav_tem_10_15').off('mouseenter').on('mouseenter', '.w-nav-inner', function () {
            
            itemAll = $('#nav_tem_10_15').find('.w-subnav');
            $this = $(this);
            item = $this.find('.w-subnav');
            index = $this.index() -1;
            itemW = $this.width();
            goTo = itemW * index;
            item.slideDown();
            $('#nav_tem_10_15').find('.sliding-box .sliding').hide().show().stop().animate({
                left: goTo
            }, 200, "linear");
        }).off('mouseleave').on('mouseleave', '.w-nav-inner', function () {
            item = $(this).find('.w-subnav');
            item.stop().slideUp();
            $('#nav_tem_10_15').find('.sliding-box .sliding').stop().fadeOut(200);
        });
        SetNavSelectedStyle('nav_tem_10_15');//选中当前导航
    });</script>
        </div>
    </div>
    <div id="smv_tem_22_23" ctype="banner" class="esmartMargin smartAbs " cpid="1467" cstyle="Style1" ccolor="Item0" areaId="Area0" isContainer="True" pvid="" tareaId="Area0" re-direction="y" daxis="Y" isdeletable="True" style="height: 108px; width: 100%; left: 0px; top: 125px;z-index:10;">
        <div class="yibuFrameContent tem_22_23  banner_Style1  " style="overflow:visible;;">
            <div class="fullcolumn-inner smAreaC" id="smc_Area0" cid="tem_22_23" style="width:1000px"></div>
            <div id="bannerWrap_tem_22_23" class="fullcolumn-outer" style="position: absolute; top: 0; bottom: 20px;"></div>
            <script type="text/javascript">$(function () {
        var resize = function () {
            $("#smv_tem_22_23 >.yibuFrameContent>.fullcolumn-inner").width($("#smv_tem_22_23").parent().width());
            $('#bannerWrap_tem_22_23').fullScreen(function (t) {
                if (VisitFromMobile()) {
                    t.css("min-width", t.parent().width())
                }
            });
        }
        if (typeof (LayoutConverter) !== "undefined") {
            LayoutConverter.CtrlJsVariableList.push({
                CtrlId: "tem_22_23",
                ResizeFunc: resize,
            });
        } else {
            $(window).resize(function (e) {
                if (e.target == this) {
                    resize();
                }
            });
        }

        resize();
    });</script>
        </div>
    </div>
    <div id="smv_tem_25_57" ctype="banner" class="esmartMargin smartAbs " cpid="1467" cstyle="Style1" ccolor="Item0" areaId="Area0" isContainer="True" pvid="" tareaId="Area0" re-direction="y" daxis="Y" isdeletable="True" style="height: 134px; width: 100%; left: 0px; top: -1px;z-index:0;">
        <div class="yibuFrameContent tem_25_57  banner_Style1  " style="overflow:visible;;">
            <div class="fullcolumn-inner smAreaC" id="smc_Area0" cid="tem_25_57" style="width:1000px">
                <div id="smv_tem_38_34" ctype="image" class="esmartMargin smartAbs " cpid="1467" cstyle="Style1" ccolor="Item0" areaId="Area0" isContainer="False" pvid="tem_25_57" tareaId="Area0" re-direction="all" daxis="All" isdeletable="True" style="height: 186px; width: 372px; left: 11px; top: -22px;z-index:1;">
                    <div class="yibuFrameContent tem_38_34  image_Style1  " style="overflow:visible;;">
                        <div class="w-image-box image-clip-wrap" data-fillType="0" id="div_tem_38_34">
                            <a target="_self" href=""><%=getOnePageBody("顶部logo_topnav001","<img src="""& resurl &"images/29436688.jpg"" alt="""" title="""" id=""img_smv_tem_38_34"" style=""width: 370px; height:184px;"" class="""">")%>
                            </a>
                        </div>
                        <script type="text/javascript">$(function () {
            
                InitImageSmv("tem_38_34", "370", "186", "0");
            
                 });</script>
                    </div>
                </div>
                <div id="smv_tem_46_14" ctype="companyinfo" class="esmartMargin smartAbs " cpid="1467" cstyle="Style2" ccolor="Item0" areaId="Area0" isContainer="False" pvid="tem_25_57" tareaId="Area0" re-direction="all" daxis="All" isdeletable="True" style="height: 31px; width: 208px; left: 680px; top: 82px;z-index:2;">
                    <div class="yibuFrameContent tem_46_14  companyinfo_Style2  " style="overflow:hidden;;">
                        <ul class="w-company-info iconStyle1">
                            <li class="company-info-item">
                                <a href="tel:<%=webphone%>">
                                    <div class="company-info-titleBox">
                                        <span class="company-info-icon ">
                                            <i class="ltd-icon  gs-dianhua"></i>
                                        </span>
                                        <span class="company-info-title "style="white-space:pre"><%=webphone%></span>
                                    </div>
                                    <div class="company-text">
                                        <span class="company-info-text"><%=webphone%></span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="smv_tem_47_17" ctype="text" class="esmartMargin smartAbs " cpid="1467" cstyle="Style1" ccolor="Item3" areaId="Area0" isContainer="False" pvid="tem_25_57" tareaId="Area0" re-direction="all" daxis="All" isdeletable="True" style="height: 50px; width: 163px; left: 701px; top: 32px;z-index:3;">
                    <div class="yibuFrameContent tem_47_17  text_Style1  " style="overflow:hidden;;">
                        <div id='txt_tem_47_17' style="height: 100%;">
                            <div class="editableContent" id="txtc_tem_47_17" style="height: 100%; word-wrap:break-word;">
                                <p> </p>
                                <p> </p>
                                <p>
                                    <span style="color:#ffffff">
                                        <span style="font-family:Source Han Sans,Geneva,sans-serif">
                                            <span style="font-size:14px">扫二维码 了解更多</span>
                                        </span>
                                    </span>
                                </p>
                            </div>
                        </div>
                        <script>var tables = $(' #smv_tem_47_17').find('table')
    for (var i = 0; i < tables.length; i++) {
        var tab = tables[i]
        var borderWidth = $(tab).attr('border')
        if (borderWidth <= 0 || !borderWidth) {
            console.log(tab)
            $(tab).addClass('hidden-border')
            $(tab).children("tbody").children("tr").children("td").addClass('hidden-border')
            $(tab).children("tbody").children("tr").children("th").addClass('hidden-border')
            $(tab).children("thead").children("tr").children("td").addClass('hidden-border')
            $(tab).children("thead").children("tr").children("th").addClass('hidden-border')
            $(tab).children("tfoot").children("tr").children("td").addClass('hidden-border')
            $(tab).children("tfoot").children("tr").children("th").addClass('hidden-border')
        }
    }</script>
                    </div>
                </div>
                <div id="smv_tem_48_50" ctype="image" class="esmartMargin smartAbs " cpid="1467" cstyle="Style1" ccolor="Item0" areaId="Area0" isContainer="False" pvid="tem_25_57" tareaId="Area0" re-direction="all" daxis="All" isdeletable="True" style="height: 85px; width: 86px; left: 844px; top: 21px;z-index:16;">
                    <div class="yibuFrameContent tem_48_50  image_Style1  " style="overflow:visible;;">
                        <div class="w-image-box image-clip-wrap" data-fillType="0" id="div_tem_48_50">
                            <a target="_self" href=""><img src="<%=webqrcode%>" alt="" title="" id="img_smv_tem_48_50" style="width: 84px; height:83px;" class="">
                            </a>
                        </div>
                        <script type="text/javascript">$(function () {
            
                InitImageSmv("tem_48_50", "84", "85", "0");
            
                 });</script>
                    </div>
                </div>
            </div>
            <div id="bannerWrap_tem_25_57" class="fullcolumn-outer" style="position: absolute; top: 0; bottom: 0;"></div>
            <script type="text/javascript">$(function () {
        var resize = function () {
            $("#smv_tem_25_57 >.yibuFrameContent>.fullcolumn-inner").width($("#smv_tem_25_57").parent().width());
            $('#bannerWrap_tem_25_57').fullScreen(function (t) {
                if (VisitFromMobile()) {
                    t.css("min-width", t.parent().width())
                }
            });
        }
        if (typeof (LayoutConverter) !== "undefined") {
            LayoutConverter.CtrlJsVariableList.push({
                CtrlId: "tem_25_57",
                ResizeFunc: resize,
            });
        } else {
            $(window).resize(function (e) {
                if (e.target == this) {
                    resize();
                }
            });
        }

        resize();
    });</script>
        </div>
    </div>
</div>

