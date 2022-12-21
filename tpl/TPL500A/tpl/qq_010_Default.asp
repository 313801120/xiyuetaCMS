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

resurl="/web/tpl/qq/010/"
 %>
<style>


.kefu html{-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;line-height:1.15;-webkit-tap-highlight-color: rgba(0,0,0,0);}
.kefu body{margin:0;font-family: "Microsoft Yahei",PingFangSC-Regular,"Helvetica Neue",Helvetica,Arial,"Hiragino Sans GB","Heiti SC","WenQuanYi Micro Hei",sans-serif;line-height: 1.42857143;font-size: 14px;min-width: 1230px;background: #fff;color: #333;}
.kefu a{-webkit-text-decoration-skip:objects;background-color:transparent;}
.kefu img{border-style:none;}
.kefu body,.kefu button,.kefu input,.kefu select,.kefu textarea{text-rendering: optimizeLegibility;-webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;-moz-font-feature-settings: "liga","kern";}
.kefu ::-webkit-file-upload-button{-webkit-appearance:button;font:inherit;}
.kefu a{color: #333;text-decoration: none;}
.kefu a:hover{color: #0d62be;}
.kefu ul{margin: 0;list-style: none;padding: 0;}
.kefu{position:fixed;right:-170px;top:50%;z-index:900;}
.kefu li a{text-decoration:none;}
.kefu li{margin-top:1px;clear:both;height:71px;position:relative;}
.kefu li i{background:url(<%=resUrl%>images/fx.png) no-repeat;display:block;width:30px;height:27px;margin:0 auto;text-align:center;}
.kefu li p{height:20px;font-size:14px;line-height:20px;overflow:hidden;text-align:center;color:#fff;margin: 0;}
.kefu .kefu-qq i{background-position:4px 5px;}
.kefu .kefu-tel i{background-position:0 -21px;}
.kefu .kefu-liuyan i{background-position:4px -53px;}
.kefu .kefu-weixin i{background-position:-34px 4px;}
.kefu .kefu-ftop{display:none;}
.kefu .kefu-ftop i{width:33px;height:35px;background-position:-27px -51px;}
.kefu .kefu-left{float:left;width:77px;height:47px;position:relative;}
.kefu .kefu-tel-right{font-size:16px;color:#fff;float:left;height:24px;line-height:22px;padding:0 15px;border-left:1px solid #fff;margin-top:14px;}
.kefu .kefu-right{width:20px;}
.kefu .kefu-tel-main{background:#0d62be;color:#fff;height:71px;width:247px;padding:9px 0 6px;float:left;}
.kefu .kefu-main{background:#0d62be;width:97px;height:71px;position:relative;padding:9px 0 6px;float:left;}
.kefu .kefu-weixin-pic{position:absolute;left:-130px;top:-24px;display:none;z-index:333;}
.kefu .kefu-weixin-pic img{width:115px;height:115px;}
@media screen and (max-width: 767px){
.kefu body{min-width: 320px;padding-top: 50px;}
.kefu{display: none;}}


</style>

    <!--右侧悬浮客服-->
    <div class="kefu" style="margin-top: -144px;">
        <ul id="kefu">
            <li class="kefu-qq" style="left: 0px;">
                <div class="kefu-main">
                    <div class="kefu-left">
                        <a class="online-contact-btn" href="http://wpa.qq.com/msgrd?v=3&uin=<%=webqq%>&site=qq&menu=yes" target="_blank">
                            <i></i>
                            <p>QQ咨询</p>
                        </a>
                    </div>
                    <div class="kefu-right"></div>
                </div>
            </li>
            <li class="kefu-tel">
                <div class="kefu-tel-main">
                    <div class="kefu-left">
                        <i></i>
                        <p>联系电话</p>
                    </div>
                    <div class="kefu-tel-right"><%=webphone%></div>
                </div>
            </li>
            <li class="kefu-liuyan">
                <div class="kefu-main">
                    <div class="kefu-left">
                        <a href="./?nav=在线留言" title="在线留言">
                            <i></i>
                            <p>在线留言</p>
                        </a>
                    </div>
                    <div class="kefu-right"></div>
                </div>
            </li>
            <li class="kefu-weixin">
                <div class="kefu-main">
                    <div class="kefu-left">
                        <i></i>
                        <p>微信扫一扫</p>
                    </div>
                    <div class="kefu-right"></div>
                    <div class="kefu-weixin-pic"><img src="<%=webqrcode%>">
                    </div>
                </div>
            </li>
            <li class="kefu-ftop" style="display: none;">
                <div class="kefu-main">
                    <div class="kefu-left">
                        <a href="javascript:;">
                            <i></i>
                            <p>返回顶部</p>
                        </a>
                    </div>
                    <div class="kefu-right"></div>
                </div>
            </li>
        </ul>
    </div> 
<script>
$(function(){
  // 右侧滑动返回顶部
    var time;
    var $kefu = $('.kefu');
    var $c = $kefu.find('#kefu');
    $kefu.css({
        'marginTop': -($kefu.height() / 2)
    });
    $c.find('li').on({
        'mouseenter': function () {
            var scope = this;
            time = setTimeout(function () {
                var divDom = $(scope).children('div');
                var maxWidth = divDom.width();
                $(scope).stop().animate({
                    left: 77 - maxWidth
                }, 'normal', function () {
                    var pic = $(scope).find('.kefu-weixin-pic');
                    if (pic.length > 0) {
                        pic.show();
                    }
                });
            }, 100);
        },
        'mouseleave': function () {
            var pic = $(this).find('.kefu-weixin-pic');
            if (pic.length > 0) {
                pic.hide();
            }
            clearTimeout(time);
            $(this).stop().animate({
                left: 0
            }, 'normal', function () {
            });
        }
    });
    $(window).scroll(function () {
        var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
        var eltop = $c.find('.kefu-ftop');
        if (scrollTop > 0) {
            eltop.show();
        } else {
            eltop.hide();
        }
    });
    $c.find('.kefu-ftop').click(function () {
        var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
        if (scrollTop > 0) {
            $('html,body').animate({
                scrollTop: 0
            }, 'slow');
        }
    });
})
</script>
