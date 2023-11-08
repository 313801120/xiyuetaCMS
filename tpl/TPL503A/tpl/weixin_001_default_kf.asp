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

cssName="weixin001" 
resurl="/web/tpl/weixin/001/"
 %>
<style>
@font-face {
    font-family: "iconweixinicon";
    src: url('data:application/x-font-woff2;charset=utf-8;base64,d09GMgABAAAAAAO8AAsAAAAAB0gAAANuAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHEIGVgCCcAqCUIIxATYCJAMICwYABCAFhG0HNBtbBiMRVnsw2Z9xoGTc73OrBQADJlHHEsiBq5xxrClsmrUIJeKm3aWO85q6C3RpPH1A2EmoHuiqN35/w2NmA/ZTOljex8P/7/dtn3fvV02jlmZNHMeaaCLjiZBUUyNEQoHQJIpF8p8Yl08qmaOvb0ltq4A6mJaX/v76oFDAxTmPoO8i1EjOHlChb7d0wGkGF0a8B74K//UD4Cs4xgGLdZcnADJBwif/ctuLKbM/FDdPFds8TOQIWnbK/EOX+9/0tvEbm9o2N/2BFZYtm2ABhf/eBNp0y7PA64CrRXhddSUDNQ0uQPqAYgeUAdfUT/E8oHfMRYRFU+PjAMcDGmiXjVp4AxoYjzdML195MI4TqJuxJU6eHu9eVabHBeJuFIheNeOXG+pDVShXLM338x5UtXjRT7wLPh9/tmNGoZTopvPXj37v8DszgvtXY3psdLoo2CoStpCJy5Xxs1JU3JLUeTFbYFv1wXf/e8pmf3gEUaZrm2AKKtekOtqlfrMAGWXcwttB21JuNaYaq5ny2ZTHHrtGeQZM2u6/Yv1KunMEzB2qU84xu3uzfOmDVycRAiEXJLCct3o4uc+YOZB2LLqoaC/mzBn6W2X3Kps9ptQcjCPfln8Swe/PjOl56gyVOZCy/sCxbD8XGTst6EICP7jL5PCtXPehPAFqChOxUYDvQgXSwRKNjD5gyTWzWw0WCvZuOSPrLbGt+XT7s2UEvbe7gJIgZHDuG1MsfzTubvbqwEA39etNwFTNj5hb/HGv0aO2Javif+uTZvlTjAKY7H+0JD3+Decprv2X3f/VRgZf6sDolgSonmwieOnePGkg/g2h60KRgRRULdxSvhlbXaRM6HTft6Hu0R1WQ9XoPpMV0wmSqiUys1soadhBWdUB6jadWd0wcE8SuYYNTwBC1wcU2j4i6fpMZvYrSsb+oawbQ9RdjcGWDSsRLU78EApGH+QPIq/IlQ3xIqx/YlCngtJ6wH2RdJQB27DylTPmSFPM0E3gMCtQVGRwAqdhmhZQUhGjx0bIXLqmqaquZHhF1lv09oSC0Qf5g8grcuV150Xh/U8M6lRQgymXf5F01D/YhtWBPNvzTqZbuUQ3gcOsQFGRwQlEMTXFAsrqQTF6bIQD8qVrok6qq91Y3pm93R56vUVPewZ9054sWoy6KL94X68HAAA=') format('woff2');
}



.m-loki-row-container<%=cssName%> .m-loki-module {
    overflow: hidden;
}

 

.m-loki-row-container<%=cssName%> .m-loki-row .m-loki-module {
    min-height: auto;
}

.m-loki-row-container<%=cssName%> .loki-body-common-style {
    -webkit-text-size-adjust: 100% !important;
    text-size-adjust: 100% !important;
}

.m-loki-row-container<%=cssName%> .iconweixinicon {
    font-family: "iconweixinicon" !important;
    font-size: var(--groot-ui-font-size-l);
    font-style: normal;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.m-loki-row-container<%=cssName%> .iconweixinicon::before {
    content: "\e609";
}

.m-loki-row-container<%=cssName%> .mip-sjh-wechat {
    font-size: 16px;
    color: #222;
}

.m-loki-row-container<%=cssName%> .mip-sjh-wechat .icon {
    margin-right: 0;
}

.m-loki-row-container<%=cssName%> .mip-sjh-wechat-wrap-btn-icon {
    z-index: 2;
    position: absolute;
    display: block;
    top: 0;
    left: -2.5rem;
    height: 3rem;
    width: 2.5rem;
    background-image: url('<%=resurl%>images/weixinbg.png');
    background-repeat: no-repeat;
    background-size: 100% 100%;
    animation: move 3s both infinite;
}

.m-loki-row-container<%=cssName%> .mip-sjh-wechat-wrap-float-one {
    position: relative;
    box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.1);
}

.m-loki-row-container<%=cssName%> .mip-sjh-wechat-wrap-float-one-icon {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 3rem;
    height: 3rem;
    border-radius: 1.5rem;
    background: #1aad17;
}

.m-loki-row-container<%=cssName%> .mip-sjh-wechat-wrap-float-one i {
    font-size: 20px;
}

.m-loki-row-container<%=cssName%> .mip-sjh-wechat-wrap-float-one.new-icon-btn {
    position: relative;
}

.m-loki-row-container<%=cssName%> .mip-sjh-wechat-wrap-float-one.new-icon-btn .mip-sjh-wechat-wrap-float-one-icon {
    box-shadow: 0 0.125rem 20px 0 rgba(0, 0, 0, 0.3);
    width: 46px;
    height: 46px;
    border-radius: 1.5rem;
}

@keyframes move {
    0% {
        left: -40px;
        opacity: 0.6;
    }

    25% {
        left: 100%;
        opacity: 0.2;
    }

    50% {
        left: 100%;
        opacity: 0.2;
    }

    75% {
        left: -40px;
        opacity: 0.6;
    }

    100% {
        left: -40px;
        opacity: 0.6;
    }
}
</style>
    <div class="m-loki-row-container<%=cssName%>"  style="bottom: 175px; width: 16px; right: 46px; height: 46px; overflow: visible; background-color: transparent; transform: translateZ(0px); position: fixed; z-index: 10000 !important;" fixed-type="right">
        <div  class="m-loki-row groot-ui-grid-row" columns="1" style="width: 100%;">
            <!---->
            <div  class="m-loki-module groot-ui-grid-col groot-ui-grid-col-24 groot-ui-grid-col-offset-0"   style="height: 46px; font-size: 1rem;">
                <div data-fixed="right" class="m-loki-widget" style="width: 46px; top: 0px; position: absolute; left: 0px; height: 46px;">
                    <div class="child-widget-container">
                        <div class="mip-sjh-wechat">
                            <div class="gt-jmy-h5-wechat-caller-root-container">
                                <!---->
                                <div class="wechat-modal">
                                    <div class="gt-jmy-h5-layer-shell-container"></div>
                                    <!---->
                                </div>
                                <!---->
                                <div class="wechat-click-btn">
                                    <span class="wechat-copy-dom"></span>
                                </div>
                                <!---->
                            </div>
                            <div class="mip-sjh-wechat-wrap"  >
                                <div class="mip-sjh-wechat-wrap-float-one new-icon-btn sjh-wechat-theme-4b534c47-01c1-431e-998c-165373703113" onclick="window.open('/kf/?act=loginTourist')" style="transform: scale(1.08); overflow: hidden; transform-origin: right top; border-radius: 9px; cursor:pointer; ">
                                    <span class="mip-sjh-wechat-wrap-btn-icon"></span>
                                    <div class="mip-sjh-wechat-wrap-float-one-icon" style="background-color: rgb(26, 173, 23); color: rgb(255, 255, 255); border-radius: 9px;">
                                        <i class="icon iconfont iconweixinicon "></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
