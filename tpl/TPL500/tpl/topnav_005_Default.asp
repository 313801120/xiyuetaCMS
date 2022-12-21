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

cssName="topnav005" 
resurl="/web/tpl/topnav/005/"
 %>
<style>
.header<%=cssName%> html{-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;line-height:1.15;-webkit-tap-highlight-color: rgba(0,0,0,0);}
.header<%=cssName%> body{margin:0;font-family: "Microsoft Yahei",PingFangSC-Regular,"Helvetica Neue",Helvetica,Arial,"Hiragino Sans GB","Heiti SC","WenQuanYi Micro Hei",sans-serif;line-height: 1.42857143;font-size: 14px;min-width: 1230px;background: #fff;color: #333;}
.header<%=cssName%> a{-webkit-text-decoration-skip:objects;background-color:transparent;}
.header<%=cssName%> b,.header<%=cssName%> strong{font-weight:bolder;}
.header<%=cssName%> img{border-style:none;}
.header<%=cssName%> body,.header<%=cssName%> button,.header<%=cssName%> input,.header<%=cssName%> select,.header<%=cssName%> textarea{text-rendering: optimizeLegibility;-webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;-moz-font-feature-settings: "liga","kern";}
.header<%=cssName%> ::-webkit-file-upload-button{-webkit-appearance:button;font:inherit;}
.header<%=cssName%> .clearfix{zoom:1;}
.header<%=cssName%> .clearfix:before,.header<%=cssName%> .clearfix:after{display:table;line-height:0;content:"";}
.header<%=cssName%> .clearfix:after{clear:both;}
.header<%=cssName%> a{color: #333;text-decoration: none;}
.header<%=cssName%> a:hover{color: #007333;text-decoration: none;}
.header<%=cssName%> ul{margin: 0;list-style: none;padding: 0;}
.header<%=cssName%> .img-center{text-align: center;font-size: 0;}
.header<%=cssName%> .img-center img{display: inline-block;width: auto;height: auto;max-width: 100%;max-height: 100%;vertical-align: middle;}
.header<%=cssName%> .container{padding: 0 15px;width: 1200px;margin: 0 auto;}
.header<%=cssName%>{background-color: #fff;}
.header<%=cssName%> .topbar{line-height: 33px;background-color: #f5f5f5;font-size: 12px;border-bottom: 1px solid #eee;color: #888;}
.header<%=cssName%> .topbar ul{float: right;}
.header<%=cssName%> .topbar li{float: left;color: #ddd;}
.header<%=cssName%> .topbar li.pipe{padding: 0 10px;}
.header<%=cssName%> .logo{float: left;font-size: 0;height: 80px;line-height: 80px;text-align: left;padding: 15px 0;}
.header<%=cssName%> .tel{float: right;background: url(<%=resUrl%>images/icon1.png) no-repeat 0 center;padding-left: 55px;margin-top: 31px;}
.header<%=cssName%> .tel strong{display: block;font-size: 28px;font-family: Impact;line-height: 1;color: #007333;}
.header<%=cssName%> .text{float: left;font-size: 16px;margin: 20px 0 20px 30px;padding: 5px 0 5px 30px;border-left: 1px solid #ddd;}
.header<%=cssName%> .text strong{display: block;font-size: 26px;}
.header<%=cssName%> .nav{font-size: 0;background-color: #007333;color: #fff;}
.header<%=cssName%> .nav li{display: inline-block;vertical-align: middle;}
.header<%=cssName%> .nav li a{display: block;font-size: 16px;line-height: 50px;padding: 0 35px;color: #fff;}
.header<%=cssName%> .nav li.dropdown{position: relative;}
.header<%=cssName%> .nav .dropdown-box{position: absolute;left: 0;min-width: 100%;top: 100%;display: none;z-index:500;text-align: center;}
.header<%=cssName%> .nav .dropdown-box a{white-space: nowrap;overflow: hidden;text-overflow: ellipsis;padding: 0 10px;font-size: 14px;;;line-height: 40px;border-bottom: 1px solid rgba(0, 0, 0, 0.2);}
.header<%=cssName%> .nav .dropdown-box a:hover{background-color: #007333 !important;}
.header<%=cssName%> .nav li.active a,.header<%=cssName%> .nav li.open a,.header<%=cssName%> .nav li a:hover{color: #fff;background-color: #c01f31;}
.header<%=cssName%> .menu-btn{display: none;padding: 6px 0;float: right;margin-left: 15px;}
.header<%=cssName%> .menu-btn:before,.header<%=cssName%> .menu-btn:after,.header<%=cssName%> .menu-btn span{display: block;height: 2px;background-color: #007333;content: '';}
.header<%=cssName%> .menu-btn:before{width: 24px;}
.header<%=cssName%> .menu-btn:after{width: 18px;margin-left: 6px;}
.header<%=cssName%> .menu-btn span{width: 12px;margin: 6px 0 6px 12px;}

.header<%=cssName%> .nav li.active a,.header<%=cssName%> .nav li.open a,.header<%=cssName%> .nav li a:hover{color: #fff;background-color: #c01f31;}
.header<%=cssName%> .nav li.open .dropdown-box{display: block;}


.header_showblock{height: 84px;display:none;} 

@media screen and (max-width: 767px){
.header<%=cssName%> body{min-width: 320px;padding-top: 50px;}
.header<%=cssName%> .container{width: auto;}
.header<%=cssName%>{padding: 10px 0;position: fixed;z-index: 500;width: 100%;top: 0;left: 0;box-shadow: 0 0 10px #ddd;}
.header<%=cssName%> .text,.header<%=cssName%> .tel{display: none;}
.header<%=cssName%> .topbar{
    margin-bottom: 10px;
    margin-top: -10px;
    overflow: hidden;
    height: 33px;
    }
.header<%=cssName%> .logo{height: 30px;line-height: 30px;float: none;padding: 0;}
.header<%=cssName%> .nav{margin: 10px 0 -10px;text-align: left;display: none;background-color: transparent;}
.header<%=cssName%> .nav ul{margin: 0 -15px;
    position: fixed;
    z-index: 99;
    overflow-y: auto;
    width: 100%;
    background-color: #fff;
    bottom: 50px;
    top: 82px;
}
.header<%=cssName%> .nav li{display: block;margin: 0;border-top: 1px solid #eee;}
.header<%=cssName%> .nav li a{line-height: 40px;padding: 0 15px;color: #333;}
.header<%=cssName%> .nav li.active a,.header<%=cssName%> .nav li.open a,.header<%=cssName%> .nav li a:hover{background-color: transparent;color: #007333}
.header<%=cssName%> .nav .dropdown-box{
        position: static;
        background-color: #f5f5f5;
        min-width: auto;
        text-align: left;
        display: block;
    }
.header<%=cssName%> .nav .dropdown-box a{color: #333 !important;border-top: 1px dotted #ddd;padding: 0 15px;line-height: 40px;background-color: transparent !important;border-bottom: 0;}
.header<%=cssName%> .nav .dropdown-box a:active,.header<%=cssName%> .nav .dropdown-box a:hover{
        color: #fff !important;
    }
.header<%=cssName%> .menu-btn{display: block;}
.header_showblock{display: block;}
}

</style>

    <!--页面头部-->
    <div class="header_showblock"></div> 
    <div class="header<%=cssName%>">
        <div class="topbar">
            <div class="container">
                <ul>
                    <li>
                        <a href="javascript:;">中文版</a>
                    </li>
                    <li class="pipe">|</li>
                    <li>
                        <a href="javascript:;">English</a>
                    </li>
                </ul>
                <span>欢迎访问<%=webcompany%></span>
            </div>
        </div>
        <div class="container clearfix">
            <a href="javascript:;" class="menu-btn">
                <span></span>
            </a>
            <div class="logo img-center">
                <a href="./" title="<%=webcompany%> "><img src="<%=weblogo%>" alt="<%=webcompany%> ">
                </a>
            </div>
            <div class="text">
                <strong><%=webcompany%></strong><%=getOnePageBody("topnav005_标语","专注网站制作10年！为企业打造专业的互联网营销解决方案")%>
            </div>

            <div class="tel">全国咨询热线：
                <strong><%=webphone%></strong>
            </div>
        </div>
        <div class="nav">
            <div class="container">
                <ul>


<%rs.open "select * from " & db_PREFIX & "webcolumn where parentid=-1 and isthrough=1 and flags like'%top%' order by sortrank asc" ,conn,1,1
for i=1 to rs.recordcount
if rs.eof then exit for
%>
 

<li class="dropdown<%=IIF(isFocusNav(rs)," active","")%>">
                    <a href="<%=getNavUrl(rs("id"),rs("columntype"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") & rs("columnname")%></a>
    <%rsx.open "select * from " & db_PREFIX & "webcolumn where parentId="& rs("id") &" and isThrough=1 order by sortrank asc" ,conn,1,1
    if not rsx.eof then        
    %>
        <div class="dropdown-box">
        <%while not rsx.eof%>
         <a href="<%=getNavUrl(rsx("id"),rsx("columnType"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") &rsx("columnname")%></a>
        <%rsx.movenext:wend%>
                </div>
                <%
                end if:rsx.close%>
                </li>
  
 
<%rs.movenext:next:rs.close%>
 

 
                </ul>
            </div>
        </div>
    </div>
<script>
$(function () { 
    $('.menu-btn').on('click', function () {
        $('.header<%=cssName%>').find('.nav').toggle();
    });

    $('.sc-btn').on('click', function () {
        $('.header<%=cssName%>').find('.sc-form').toggle();
    }); 
    if ($(window).width() > 991) {
        $('.dropdown').hover(function () {
            $(this).addClass('open');
        }, function () {
            $(this).removeClass('open');
        });
    } else {
        $('.dropdown').find('.arr').on('click', function () {
            $(this).parent().toggleClass('open');
        });
    }

    $('.lanmu').find('.arr').on('click', function () {
        $(this).parent().toggleClass('open');
    });

    $('.yunu-sou').find('form').submit(function () {
        var val = $(this).find('input').val();
        if (!val) {
            alert('请输入关键词');
            return false
        }
    });
})
</script>
