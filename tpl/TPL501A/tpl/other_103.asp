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

 %>
<style>
#backtoTop{position:fixed;right:-100px;bottom:0;width:45px;height:45px;border-radius:100%;background-color:#333d46;-webkit-transition:.5s;transition:.5s}#backtoTop.button--show{right:0}.per{position:absolute;top:0;width:45px;height:45px;color:#fff;text-align:center;font-size:16px;line-height:45px;cursor:pointer}.per:before{content:attr(data-percent)}.per:hover:before{content:"▲";font-size:22px;line-height:0}

</style>
<script>

//返回顶部
var bigfa_scroll = {
    drawCircle: function(id, percentage, color) {
        var width = jQuery(id).width();
        var height = jQuery(id).height();
        var radius = parseInt(width / 2.20);
        var position = width;
        var positionBy2 = position / 2;
        var bg = jQuery(id)[0];
        id = id.split("#");
        var ctx = bg.getContext("2d");
        var imd = null;
        var circ = Math.PI * 2;
        var quart = Math.PI / 2;
        ctx.clearRect(0, 0, width, height);
        ctx.beginPath();
        ctx.strokeStyle = color;
        ctx.lineCap = "square";
        ctx.closePath();
        ctx.fill();
        ctx.lineWidth = 3;
        imd = ctx.getImageData(0, 0, position, position);
        var draw = function(current, ctxPass) {
            ctxPass.putImageData(imd, 0, 0);
            ctxPass.beginPath();
            ctxPass.arc(positionBy2, positionBy2, radius, -(quart), ((circ) * current) - quart, false);
            ctxPass.stroke();
        }
        draw(percentage / 100, ctx);
    },
    backToTop: function($this) {
        $this.click(function() {
            jQuery("body,html").animate({
                scrollTop: 0
            },
            800);
            return false;
        });
    },
    scrollHook: function($this, color) {
        color = color ? color: "#000000";
        $this.scroll(function() {
            var docHeight = (jQuery(document).height() - jQuery(window).height()),
            $windowObj = $this,
            $per = jQuery(".per"),
            percentage = 0;
            defaultScroll = $windowObj.scrollTop();
            percentage = parseInt((defaultScroll / docHeight) * 100);
            var backToTop = jQuery("#backtoTop");
            if (backToTop.length > 0) {
                if ($windowObj.scrollTop() > 100) {
                    backToTop.addClass("button--show");
                } else {
                    backToTop.removeClass("button--show");
                }
                $per.attr("data-percent", percentage);
                bigfa_scroll.drawCircle("#backtoTopCanvas", percentage, color);
            }
        });
    }
}
jQuery(document).ready(function() {
    jQuery("body").append('<div id="backtoTop" data-action="gototop"><canvas id="backtoTopCanvas" width="45" height="45"></canvas><div class="per"></div></div>');
    var T = bigfa_scroll;
    T.backToTop(jQuery("#backtoTop"));
    T.scrollHook(jQuery(window), "#FF5E52");
});
</script>
