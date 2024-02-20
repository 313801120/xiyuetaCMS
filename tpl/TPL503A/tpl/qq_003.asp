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

cssName="qq003" 
 %>

<div id="smv_tem_42_19<%=cssName%>" ctype="qqservice" class="smartAbs<%=cssName%> smartFixed<%=cssName%>   " cpid="1467" cstyle="Style3" ccolor="Item0" areaId="Area0" isContainer="False" pvid="" tareaId="Area0" re-direction="x" daxis="All" isdeletable="True" style="height: 252px; width: 195px; right: 0px; top: 0px;bottom:0px;margin:auto;z-index:15;">
    <div class="yibuFrameContent tem_42_19  qqservice_Style3  " style="overflow:hidden;;">
        <div class="tem_42_19_c w-cs" id="qqservice_tem_42_19">
            <ul class="w-cs-btn">
                <li class="w-cs-list w-cs-upBtn " onclick="gotoTop();return false;">
                    <div class="w-cs-list-warp">
                        <span class=" w-cs-icon">
                            <i class="mw-iconfont">ꁸ</i>
                        </span>
                        <span class="w-cs-text">回到顶部</span>
                    </div>
                </li>
                <li class="w-cs-list w-cs-phoneBtn ">
                    <div class="w-cs-list-warp">
                        <span class="w-cs-icon">
                            <i class="mw-iconfont icon-phone">ꂅ</i>
                        </span>
                        <span class="w-cs-text"><%=webphone%></span>
                    </div>
                </li>
                <li class="w-cs-list w-cs-qqBtn ">
                    <div class="w-cs-list-warp">
                        <span class="w-cs-icon">
                            <i class="mw-iconfont">ꁗ</i>
                        </span>
                        <a class="w-cs-text" href="//wpa.qq.com/msgrd?v=3&uin=<%=webqq%>&site=qq&menu=yes" target="_blank">QQ客服</a>
                    </div>
                </li>
                <li class="w-cs-list w-cs-qrcodeBtn ">
                    <div class="w-cs-list-warp">
                        <span class="w-cs-icon">
                            <i class="mw-iconfont icon-qrcode">ꀥ</i>
                        </span>
                        <span class="w-cs-text">微信二维码</span>
                        <div class="w-cs-code"><img src="<%=webqrcode%>" alt="">
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <script>$(function () {
        var sv = $("#qqservice_tem_42_19");
        var sumWidth = sv.outerWidth();

        sv.css("width", 60 + "px");
        //  二维码区域高度
        var imgHeight = sv.find(".w-cs-qrcodeBtn").height();
        var sumtImgHeight = imgHeight + 180 + "px";
        var smv = $("#smv_tem_42_19<%=cssName%>");
        sv.hover(function () {
            sumWidth = sv.outerWidth();
            var svmWidth = smv.outerWidth();
            var maxWidth = Math.max(sumWidth, svmWidth);
            $(this).stop().animate({ width: maxWidth + "px" }, 200);
            sv.find(".w-cs-qrcodeBtn").stop().animate({ height: sumtImgHeight }, 200);
        }, function () {
            $(this).stop().animate({ width: 60 +"px" }, 200);
            sv.find(".w-cs-qrcodeBtn").stop().animate({ height: imgHeight }, 200);
        });

             
                 $("#smv_tem_42_19<%=cssName%>").addClass('exist').appendTo($('body'));
             
    });
    function gotoTop(acceleration, stime) {
        acceleration = acceleration || 0.1;
        stime = stime || 10;
        var x1 = 0;
        var y1 = 0;
        var x2 = 0;
        var y2 = 0;
        if (document.documentElement) {
            x1 = document.documentElement.scrollLeft || 0;
            y1 = document.documentElement.scrollTop || 0;
        }
        if (document.body) {
            x2 = document.body.scrollLeft || 0;
            y2 = document.body.scrollTop || 0;
        }
        var x3 = window.scrollX || 0;
        var y3 = window.scrollY || 0;

        // 滚动条到页面顶部的水平距离
        var x = Math.max(x1, Math.max(x2, x3));
        // 滚动条到页面顶部的垂直距离
        var y = Math.max(y1, Math.max(y2, y3));

        // 滚动距离 = 目前距离 / 速度, 因为距离原来越小, 速度是大于 1 的数, 所以滚动距离会越来越小
        var speeding = 1 + acceleration;
        window.scrollTo(Math.floor(x / speeding), Math.floor(y / speeding));

        // 如果距离不为零, 继续调用函数
        if (x > 0 || y > 0) {
            var run = "gotoTop(" + acceleration + ", " + stime + ")";
            window.setTimeout(run, stime);
        }
        if (typeof (LayoutConverter) !== "undefined" && typeof (CtrlAdjuster) !== "undefined" && CtrlAdjuster.IsMobile)
        {
            $("#qqservice_tem_42_19").trigger("mouseout");
        }
    }</script>
    </div>
</div>
