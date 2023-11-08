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

cssName="topnav006" 
resurl="/web/tpl/topnav/006/"
 %>
<style>
.topnav005<%=cssName%> body{
    overflow-x: hidden;
    font-family: "Microsoft YaHei";
}
.topnav005<%=cssName%> ul{
    padding: 0;
    margin: 0;
}
.topnav005<%=cssName%> ul li{
    list-style: none;
}
.topnav005<%=cssName%> a{
    color: #337ab7;
    text-decoration: none;
}
.topnav005<%=cssName%> h1,.topnav005<%=cssName%> h2,.topnav005<%=cssName%> h3,.topnav005<%=cssName%> h4,.topnav005<%=cssName%> h5{
    margin: 0;
}
.topnav005<%=cssName%> a:focus,.topnav005<%=cssName%> a:hover{
    color: #23527c;
    text-decoration: none;
}
.topnav005<%=cssName%> a:focus{
    outline: none;
    outline-offset: -2px;
}
.topnav005<%=cssName%> .x-header-right .x-login .username,.topnav005<%=cssName%> .x-product-list li h3,.topnav005<%=cssName%> .x-case-item .wz h3,.topnav005<%=cssName%> .x-news-top h3,.topnav005<%=cssName%> .x-news-list li a,.topnav005<%=cssName%> .latest-news li a,.topnav005<%=cssName%> .hot-keys li a,.topnav005<%=cssName%> .xypg-left-nav>li>a,.topnav005<%=cssName%> .xypg-left-nav .xypg-left-subnav>li>a,.topnav005<%=cssName%> .xypg-left-nav .xypg-left-threenav>li>a,.topnav005<%=cssName%> .xypg-product-list li h3 a,.topnav005<%=cssName%> .xypg-case-list li h3 a,.topnav005<%=cssName%> .xypg-news-list li .tit h3,.topnav005<%=cssName%> .xypg-album-cate li .album-title,.topnav005<%=cssName%> .xypg-album-list li h3,.topnav005<%=cssName%> .xypg-download-list .download-item .download-item-span.download-item-first,.topnav005<%=cssName%> .xypg-download-list .download-item .download-item-span .download-item-con,.topnav005<%=cssName%> .xypg-job-list .job-item .job-item-span .job-item-con,.topnav005<%=cssName%> .xypg-detail-info-bar .xypg-file-down .file-down-list li .list-con p,.topnav005<%=cssName%> .xypg-detail-pn div a,.topnav005<%=cssName%> .relate-product-slick .owl-item p,.topnav005<%=cssName%> .relate-news-list li a,.topnav005<%=cssName%> .xypg-jod-detail .job-detail-title,.topnav005<%=cssName%> .cover-item .item-first .wz h3,.topnav005<%=cssName%> .cover-item .item-list h4,.topnav005<%=cssName%> .tag-list-product .tag-wz h1,.topnav005<%=cssName%> .tag-list-product .tag-wz .tab-fenli p{
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
.topnav005<%=cssName%> .x-banner .owl-carousel .banner-item a,.topnav005<%=cssName%> .x-product-list li .img,.topnav005<%=cssName%> .x-case-item .img,.topnav005<%=cssName%> .x-news-img,.topnav005<%=cssName%> .page-banner,.topnav005<%=cssName%> .xypg-product-list li .img,.topnav005<%=cssName%> .xypg-case-list li .img,.topnav005<%=cssName%> .relate-product-slick .owl-item .img,.topnav005<%=cssName%> .x-logo a,.topnav005<%=cssName%> .x-layout-logo,.topnav005<%=cssName%> .x-layout-ewm img,.topnav005<%=cssName%> .page-message-img{
    font-size: 0;
}
.topnav005<%=cssName%> .x-logo a img,.topnav005<%=cssName%> .x-layout-logo img,.topnav005<%=cssName%> .x-layout-ewm img img,.topnav005<%=cssName%> .page-message-img img{
    max-width: 100%;
}
.topnav005<%=cssName%> .container-fluid{
    padding: 0 8.33333333%;
}
@media (max-width: 768px){
.topnav005<%=cssName%> body{
        padding-top: 60px;
    }}
.topnav005<%=cssName%> .icon-font{
    position: relative;
}
.topnav005<%=cssName%> .icon-font:after{
    content: "";
    width: 30px;
    height: 30px;
    background-image: url(<%=resUrl%>images/icon_spirit.png);
    background-repeat: no-repeat;
    position: absolute;
    left: calc(50% - 15px);
    top: calc(50% - 15px);
}
.topnav005<%=cssName%> .xymob-head{
    position: fixed;
    top: 0;
    z-index: 999999;
    left: 0;
    right: 0;
    background: #0d62be;
}
.topnav005<%=cssName%> .xymob-head-box{
    position: relative;
    height: 60px;
}
.topnav005<%=cssName%> .xymob-head-box .xymob-logo{
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    top: 0;
    margin: auto;
    width: 70%;
    height: 30px;
    text-align: center;
}
.topnav005<%=cssName%> .xymob-head-box .xymob-logo h1,.topnav005<%=cssName%> .xymob-head-box .xymob-logo a{
    display: inline;
    font-size: 0;
}
.topnav005<%=cssName%> .xymob-head-box .xymob-logo img{
    height: 25px;
}
.topnav005<%=cssName%> .xymob-navbtn{
    position: absolute;
    z-index: 9;
    top: 0;
    bottom: 0;
    right: 0;
    left: 0;
    margin: auto 0 auto 27px;
    width: 30px;
    height: 20px;
}
.topnav005<%=cssName%> .xymob-navbtn span,.topnav005<%=cssName%> .xymob-navbtn:after,.topnav005<%=cssName%> .xymob-navbtn:before{
    display: block;
    height: 2px;
    width: 100%;
    background: #fff;
    -webkit-transition: all .5s;
    transition: all .5s;
}
.topnav005<%=cssName%> .xymob-navbtn span{
    margin: 7px 0;
}
.topnav005<%=cssName%> .xymob-navbtn:after,.topnav005<%=cssName%> .xymob-navbtn:before{
    content: '';
    -webkit-transform-origin: 7.5%;
    transform-origin: 7.5%;
}
.topnav005<%=cssName%> .xymob-navbtn.clicked span{
    -webkit-transform: translateX(-100%);
    transform: translateX(-100%);
    opacity: 0;
}
.topnav005<%=cssName%> .xymob-navbtn.clicked:after{
    -webkit-transform: rotate(-45deg);
    transform: rotate(-45deg);
}
.topnav005<%=cssName%> .xymob-navbtn.clicked:before{
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
}
.topnav005<%=cssName%> .xymob-search-btn{
    position: absolute;
    z-index: 9;
    right: 0;
    top: 0;
    bottom: 0;
    width: 14%;
    text-align: center;
    line-height: 60px;
}
.topnav005<%=cssName%> .xymob-search-btn .icon-font{
    display: block;
    width: 100%;
    height: 100%;
}
.topnav005<%=cssName%> .xymob-search-btn .icon-font:after{
    background-position: -30px -210px;
}

.topnav005<%=cssName%> .xymob-menu{
    display: none;
    position: absolute;
    z-index: 9999;
    left: 0;
    right: 0;
    height: 100vh;
    background: #0d62be;
    padding: 0 10%;
}
.topnav005<%=cssName%> .xymob-menu .xymob-menu-box{
    height: 100vh;
    overflow: auto;
    padding-bottom: 80px;
}
.topnav005<%=cssName%> .xymob-nav>li{
    border-bottom: 1px solid #326ec0;
    position: relative;
}
.topnav005<%=cssName%> .xymob-nav>li>a{
    display: block;
    line-height: 50px;
    font-size: 16px;
    color: #ffffff;
}
.topnav005<%=cssName%> .xymob-nav .xymob-menu-jt{
    position: absolute;
    width: 20%;
    height: 50px;
    line-height: 50px;
    right: 0;
    top: 0;
    text-align: center;
    z-index: 9;
}
.topnav005<%=cssName%> .xymob-nav .xymob-menu-jt .icon-font{
    display: block;
    width: 100%;
    height: 100%;
}
.topnav005<%=cssName%> .xymob-nav .xymob-menu-jt .icon-font:after{
    background-position: -30px -240px;
}
.topnav005<%=cssName%> .xymob-nav .xymob-sub-menu{
    background: #326ec0,str4:;
    display: none;
}
.topnav005<%=cssName%> .xymob-nav .xymob-sub-menu>li{
    border-top: 1px dashed #326ec0;
}
.topnav005<%=cssName%> .xymob-nav .xymob-sub-menu>li>a{
    display: block;
    font-size: 14px;
    color: rgba(255, 255, 255, 0.8);
    line-height: 40px;
    text-indent: 2em;
}
.topnav005<%=cssName%> .xymob-dlbtn{
    margin-top: 40px;
}
.topnav005<%=cssName%> .xymob-dlbtn a{
    text-align: center;
    display: block;
    width: 100%;
    height: 40px;
    line-height: 40px;
    background: #1a7ee0;
    color: #fff;
    font-size: 16px;
    border-radius: 5px;
}
.topnav005<%=cssName%> .xymob-dlbtn a i{
    display: inline-block;
    vertical-align: middle;
    width: 30px;
    height: 30px;
    margin-right: 5px;
}
.topnav005<%=cssName%> .xymob-dlbtn a .icon-pn:after{
    background-position: -30px -600px;
}
.topnav005<%=cssName%> .xymob-dlbtn a .icon-tc:after{
    background-position: -30px -570px;
}
.topnav005<%=cssName%> .xymob-dlbtn .zx-btn{
    margin-top: 10px;
    background: none;
    border: 1px solid #fff;
}
.topnav005<%=cssName%> .xymob-search{
    position: fixed;
    z-index: 99999;
    left: 100%;
    bottom: 0;
    top: 0;
    width: 100%;
    background: #0d62be;
    padding: 15px 15% 0 15%;
    -webkit-transition: all .5s;
    transition: all .5s;
}
.topnav005<%=cssName%> .xymob-search .xymob-search-close-btn{
    position: absolute;
    top: 27px;
    left: 30px;
    width: 30px;
    height: 30px;
    text-align: center;
    line-height: 30px;
}
.topnav005<%=cssName%> .xymob-search.clicked{
    left: 0;
}
@media (max-width: 420px){
.topnav005<%=cssName%> .xymob-search .xymob-search-close-btn{
        left: 15px;
    }}
.topnav005<%=cssName%> .xymob-search .xymob-search-close-btn i{
    width: 100%;
    height: 100%;
    display: block;
}
.topnav005<%=cssName%> .xymob-search .xymob-search-close-btn i:after{
    background-position: -30px -300px;
}
.topnav005<%=cssName%> .xymob-search .xymob-search-box{
    height: 50px;
    border-bottom: 2px solid #326ec0;
}
.topnav005<%=cssName%> .xymob-search .xymob-search-box input[type="text"]{
    width: 80%;
    float: left;
    background: none;
    border: none;
    outline: none;
    color: rgba(255, 255, 255, 0.3);
    font-family: "Microsoft YaHei";
    font-size: 16px;
    height: 50px;
}
.topnav005<%=cssName%> .xymob-search .xymob-search-box #s_btn{
    width: 20%;
    height: 50px;
    outline: none;
    border: none;
    cursor: pointer;
    font-size: 0;
    background: none;
    border: none;
}
.topnav005<%=cssName%> .xymob-search .xymob-search-box #s_btn .icon-font{
    display: block;
    width: 100%;
    height: 100%;
}
.topnav005<%=cssName%> .xymob-search .xymob-search-box #s_btn .icon-font:after{
    background-position: -30px -210px;
}
.topnav005<%=cssName%> .xymob-search .xymob-seaerch-wz span,.topnav005<%=cssName%> .xymob-search .xymob-seaerch-wz a{
    display: block;
    font-size: 14px;
    color: rgba(255, 255, 255, 0.9);
    line-height: 45px;
    border-bottom: 1px solid #326ec0;
}
.topnav005<%=cssName%> .x-header{
    background: #ffffff;
    padding: 1.30208333% 0;
}
.topnav005<%=cssName%> .x-logo{
    float: left;
    width: 15.3125%;
}
.topnav005<%=cssName%> .x-logo a{
    display: block;
}
.topnav005<%=cssName%> .x-header-right{
    float: right;
    width: 25%;
    text-align: right;
}
.topnav005<%=cssName%> .x-header-right #formsearch,.topnav005<%=cssName%> .x-header-right .x-login{
    display: inline-block;
    vertical-align: middle;
}
.topnav005<%=cssName%> .x-header-right #formsearch{
    width: calc(100% - 100px);
    position: relative;
}
.topnav005<%=cssName%> .x-header-right #formsearch:before{
    content: '|';
    position: absolute;
    left: 36px;
    top: 5px;
}
.topnav005<%=cssName%> .x-header-right #formsearch #s_btn{
    float: left;
    outline: none;
    border: none;
    width: 35px;
    height: 30px;
    font-size: 0;
    background-image: url(<%=resUrl%>images/icon_spirit.png);
    background-color: transparent;
    background-repeat: no-repeat;
    background-position: 0 -210px;
}
.topnav005<%=cssName%> .x-header-right #formsearch #keyword{
    float: left;
    background: none;
    outline: none;
    border: none;
    width: calc(100% - 35px);
    color: rgba(0, 0, 0, 0.8);
    margin-top: 5px;
    height: 20px;
    padding-left: 10px;
}
.topnav005<%=cssName%> .x-header-right .x-login{
    font-size: 14px;
    color: #000000;
    line-height: 1.6;
    line-height: 30px;
}
.topnav005<%=cssName%> .x-header-right .x-login .username{
    max-width: 75px;
    vertical-align: -10px;
    display: inline-block;
}
.topnav005<%=cssName%> .x-header-right .x-login a{
    color: #000;
}
.topnav005<%=cssName%> .x-header-right .x-login a:hover{
    color: #1a7ee0;
}
.topnav005<%=cssName%> .xa-login{
    position: absolute;
    width: 50%;
    text-align: right;
    top: 0;
    right: 8.33333333%;
}
.topnav005<%=cssName%> .x-menu{
    /* width: 58.75%; */
    /* float: left; */
}
.topnav005<%=cssName%> .x-menu>li{
    float: left;
    position: relative;
    text-align: center;
    width: 12.5%;
    background: url(<%=resUrl%>images/76f694a8ea36b9a4f14091e78fe43f5e7f4d4ac2.png) no-repeat 100% 50%;
}

.topnav005<%=cssName%> .x-menu .active{
    background:#326ec0;
}

.topnav005<%=cssName%> .x-menu>li>a{
    display: block;
    font-size: 16px;
    color: #FFFFFF;
    line-height: 55px;
}
.topnav005<%=cssName%> .x-menu>li>a:hover{
    background-color: #326ec0;
    color: #fff;
}
.topnav005<%=cssName%> .x-menu>li.active>a{}
.topnav005<%=cssName%> .x-menu>li:hover .x-sub-menu{
    opacity: 1;
    visibility: visible;
    -webkit-transform: translateY(0);
    transform: translateY(0);
}
.topnav005<%=cssName%> .x-sub-menu{
    overflow-x: hidden;
    position: absolute;
    z-index: 99;
    width: 100%;
    left: 0%;
    top: 55px;
    background: #fff;
    /*     border-radius: 5px;
        padding: 10px 0; */
    opacity: 0;
    visibility: hidden;
    -webkit-transform: translateY(20px);
    transform: translateY(20px);
    -webkit-transition: all .5s ease;
    transition: all .5s ease;
    overflow-y: auto;
    max-height: 360px;
}
.topnav005<%=cssName%> .x-sub-menu>li>a{
    display: block;
    text-align: center;
    line-height: 2;
    font-size: 14px;
    color: #333;
    line-height: 1.5;
    padding: .5em;
}
.topnav005<%=cssName%> .x-sub-menu>li>a:hover{
    background: #326ec0;
    color: #FFF;
}
.topnav005<%=cssName%> img{
    image-rendering: -moz-crisp-edges; /* Firefox */
    image-rendering: -o-crisp-edges; /* Opera */
    image-rendering: -webkit-optimize-contrast; /* Webkit (non-standard naming) */
    image-rendering: crisp-edges;
    -ms-interpolation-mode: nearest-neighbor; /* IE (non-standard property) */
}
.topnav005<%=cssName%> .tong{
  max-width: 1200px;/*1632*/
  margin-left: auto;
  margin-right: auto;
  padding: 0 15px; }
.topnav005<%=cssName%> .flex{
  display: flex;
  justify-content: space-between; }
.topnav005<%=cssName%> p{
  margin: 0; }
.topnav005<%=cssName%> .tou{
  height: 124px;
  border-top: 6px solid #0d62be;
 }
.topnav005<%=cssName%> .tou .con{
    align-items: center; }
.topnav005<%=cssName%> .tou .logo{
    line-height: 118px; }
.topnav005<%=cssName%> .tou .dh{
    padding-left: 57px;
    /*background: url(<%=resUrl%>images/13c2b3995adb0a9ce98ae6e6977148e26149c0dc.png) no-repeat 0 50%; */
}
.topnav005<%=cssName%> .tou .dh p{
      font-size: 18px;
      font-weight: 200;
      line-height: 1;
      color: #333333; }
.topnav005<%=cssName%> .tou .dh p:nth-child(2){
        font-size: 28px;
        font-weight: 600;
        margin-top: 4px; }
.topnav005<%=cssName%> .dao{
  height: 55px;
  background-color: #0d62be;
  width: 100%; }


.header006_showblock{height: 60px;display:none;} 
@media screen and (max-width: 767px){
    .header006_showblock{display: block;}
}
</style>

    <div class="header006_showblock"></div>
<span class="topnav005<%=cssName%>">
    <div class="xymob-head visible-sm visible-xs">
        <div class="xymob-head-box">
            <div class="xymob-logo">
                <h1>
                    <a href="default.html"><img src="<%=weblogo%>">
                    </a>
                </h1>
            </div>
            <div class="xymob-navbtn">
                <span></span>
            </div>
            <div class="xymob-search-btn">
                <i class="icon-font icon-search"></i>
            </div>
        </div>
        <div class="xymob-menu" style="display:none;">
            <div class="xymob-menu-box">
                <ul class="xymob-nav">


<%rs.open "select * from " & db_PREFIX & "webcolumn where parentid=-1 and isthrough=1 and flags like'%top%' order by sortrank asc" ,conn,1,1
for i=1 to rs.recordcount
if rs.eof then exit for
%> 
<li class="<%=IIF(isFocusNav(rs)," active","")%>">
                    <a href="<%=getNavUrl(rs("id"),rs("columntype"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") & rs("columnname")%></a>
    <%rsx.open "select * from " & db_PREFIX & "webcolumn where parentId="& rs("id") &" and isThrough=1 order by sortrank asc" ,conn,1,1
    if not rsx.eof then        
    %>
        <div class="xymob-menu-jt">
                            <i class="icon-font icon-down"></i>
                        </div>
                        <ul class="xymob-sub-menu">
        <%while not rsx.eof%>
        <li>
         <a href="<%=getNavUrl(rsx("id"),rsx("columnType"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") &rsx("columnname")%></a>
         </li>
        <%rsx.movenext:wend%>
                </ul>
                <%
                end if:rsx.close%>
                </li> 
<%rs.movenext:next:rs.close%>
 
                </ul>
                <%
                    '会员部分，不需要'
                    if 1=2 then%>
                <div class="xymob-dlbtn">
                    <a href="person.html">
                        <i class="icon-font icon-pn"></i>个人中心
                    </a>
                    <a class="zx-btn" href="login.html">
                        <i class="icon-font icon-tc"></i>注 销
                    </a>
                </div>
                <%end if%>

            </div>
        </div>
        <div class="xymob-search">
            <div class="xymob-search-close-btn">
                <i class="icon-font icon-close"></i>
            </div>
            <div class="xymob-search-box">
                <form method="get" name="formsearch" id="formsearch" action="?nav=产品中心">
                    <input type="text" name="k" id="keyword" placeholder="请输入关键词搜索">
                    <button type="submit" id="s_btn">
                        <i class="icon-font"></i>
                    </button>
                </form>
            </div>
            <div class="xymob-seaerch-wz">
                <span>全站搜索</span> 

<%rs.open "select * from " & db_PREFIX & "webcolumn where  isthrough=1 AND parentid in("& getNameToAllId( "产品中心") &") order by sortRank asc,id asc" ,conn,1,1
for i=1 to 6
if rs.eof then exit for 
%> 
<a href="<%=getNavUrl(rs("id"),rs("columntype"))%>">
                                                    <%=rs("columnname")%>
                                                </a>
<%rs.movenext:next:rs.close%>
            </div>
        </div>
    </div>
    <%
        '被隐藏了，它是一个 top样式'
    if 1=2 then%>
    <div class="x-header hidden-xs hidden">
        <div class="container-fluid">
            <h1 class="x-logo">
                <a href="default.html"><img alt="电磁阀" src="<%=weblogo%>">
                </a>
            </h1>
            <div class="x-header-right">
                <form method="get" name="formsearch" class="clearfix" id="formsearch" action="./"><input type="submit" id="s_btn"><input type="text" name="wd" id="keyword" placeholder="请输入关键词">
                </form>
                <div class="x-login xa-login">欢迎您：
                    <span class="username text-danger">a123456</span>
                    <a class="btn-personal" href="#">会员中心</a>|
                    <a href="#">[退出]</a>
                </div>
            </div>
        </div>
    </div>
    <%end if%>
    <div class="tou hidden-sm hidden-xs">
        <div class="tong con flex">
            <div class="logo">
                <a href="default.html">

                    <img alt="<%=webcompany%>" src="<%=webbiglogo%>">





                </a>
            </div>
            <div class="dh" style="background:url();">
                <div style="float:left;margin-right:10px;">
                    <svg t="1624616194312" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1806" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"><defs><style type="text/css"></style></defs><path d="M892.4 726.6c0 139.4-65 139.2-379.2 139.2s-379.1 0.2-379.1-139.2c0-152.3 169.8-456 379.4-456s378.9 303.6 378.9 456zM514.2 335.7c-89 0-161.3 71.4-161.3 159.3 0 88.1 72.3 159.3 161.3 159.3S675.3 582.9 675.3 495s-72.1-159.3-161.1-159.3zM176.4 453.1c66.2-104.6 180.3-216 335.8-216s277.3 120.7 332.2 215.1c28.5 47 83 41.8 107 0 15.2-31.3 63.1-294-439.2-294-508 0.5-455.5 271.4-437.7 293.9 31.6 47.4 91.1 23.2 101.9 1z" p-id="1807" fill="#0d62be"></path></svg>

                </div>
                <div style="float:left;">
                <p>服务热线：</p>
                <p style="color:#0d62be;"><%=webphone%></p></div>
            </div>
        </div>
    </div>
    <div class="dao hidden-sm hidden-xs">
        <ul class="tong x-menu clearfix">






<%rs.open "select * from " & db_PREFIX & "webcolumn where parentid=-1 and isthrough=1 and flags like'%top%' order by sortrank asc" ,conn,1,1
for i=1 to rs.recordcount
if rs.eof then exit for
%> 
<li class="<%=IIF(isFocusNav(rs)," active","")%>">
                    <a href="<%=getNavUrl(rs("id"),rs("columntype"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") & rs("columnname")%></a>
    <%rsx.open "select * from " & db_PREFIX & "webcolumn where parentId="& rs("id") &" and isThrough=1 order by sortrank asc" ,conn,1,1
    if not rsx.eof then        
    %>
        <ul class="x-sub-menu">
        <%while not rsx.eof%>
        <li>
         <a href="<%=getNavUrl(rsx("id"),rsx("columnType"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") &rsx("columnname")%></a>
         </li>
        <%rsx.movenext:wend%>
                </ul>
                <%
                end if:rsx.close%>
                </li> 
<%rs.movenext:next:rs.close%>
 

 
        </ul>
    </div>
</span>
<script type="text/javascript" src="<%=resUrl%>js/app.js"></script>
<script type="text/javascript" src="<%=resUrl%>js/main.js?v1"></script>
