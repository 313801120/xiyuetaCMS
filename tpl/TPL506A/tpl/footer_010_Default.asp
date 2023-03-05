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

cssName="footer010" 
resurl="/web/tpl/footer/010/"
 %>
<style>
.footerwrap<%=cssName%> html{-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;line-height:1.15;-webkit-tap-highlight-color: rgba(0,0,0,0);}
.footerwrap<%=cssName%> body{margin:0;font-family: "Microsoft Yahei",PingFangSC-Regular,"Helvetica Neue",Helvetica,Arial,"Hiragino Sans GB","Heiti SC","WenQuanYi Micro Hei",sans-serif;line-height: 1.42857143;font-size: 14px;min-width: 1230px;background: #fff;color: #333;}
.footerwrap<%=cssName%> a{-webkit-text-decoration-skip:objects;background-color:transparent;}
.footerwrap<%=cssName%> img{border-style:none;}
.footerwrap<%=cssName%> body,.footerwrap<%=cssName%> button,.footerwrap<%=cssName%> input,.footerwrap<%=cssName%> select,.footerwrap<%=cssName%> textarea{text-rendering: optimizeLegibility;-webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;-moz-font-feature-settings: "liga","kern";}
.footerwrap<%=cssName%> ::-webkit-file-upload-button{-webkit-appearance:button;font:inherit;}
.footerwrap<%=cssName%> .clearfix{zoom:1;}
.footerwrap<%=cssName%> .clearfix:before,.footerwrap<%=cssName%> .clearfix:after{display:table;line-height:0;content:"";}
.footerwrap<%=cssName%> .clearfix:after{clear:both;}
.footerwrap<%=cssName%> a{color: #333;text-decoration: none;}
.footerwrap<%=cssName%> a:hover{color: #0d62be;}
.footerwrap<%=cssName%> ul{margin: 0;list-style: none;padding: 0;}
.footerwrap<%=cssName%> .yunu-footer-fix{position: fixed;bottom: 0;left: 0;width: 100%;background-color: #0d62be;z-index: 500;display: none;}
.footerwrap<%=cssName%> .yunu-footer-fix li{float: left;width: 25%;}
.footerwrap<%=cssName%> .yunu-footer-fix li a{display: block;text-align: center;color: #fff;padding: 7px 0;font-size: 12px;line-height: 1;}
.footerwrap<%=cssName%> .yunu-footer-fix li i{display: block;height: 20px;background: no-repeat center;background-size: contain;margin-bottom: 4px;}
.footerwrap<%=cssName%> .yunu-footer-fix li i.i1{background-image: url(<%=resurl%>images/f_01.png);}
.footerwrap<%=cssName%> .yunu-footer-fix li i.i2{background-image: url(<%=resurl%>images/f_02.png);}
.footerwrap<%=cssName%> .yunu-footer-fix li i.i3{background-image: url(<%=resurl%>images/f_03.png);}
.footerwrap<%=cssName%> .yunu-footer-fix li i.i4{background-image: url(<%=resurl%>images/f_04.png);}
.footerwrap<%=cssName%> .img-center{text-align: center;font-size: 0;}
.footerwrap<%=cssName%> .img-center img{display: inline-block;width: auto;height: auto;max-width: 100%;max-height: 100%;vertical-align: middle;}
.footerwrap<%=cssName%> .container{padding: 0 15px;width: 1200px;margin: 0 auto;}
.footerwrap<%=cssName%> .footer{padding-bottom: 30px;}
.footerwrap<%=cssName%> .footer-link{text-align: center;font-size: 0;background-color: #0d62be;line-height: 50px;margin-bottom: 30px;}
.footerwrap<%=cssName%> .footer-link a,.footerwrap<%=cssName%> .footer-link span{display: inline-block;vertical-align: middle;font-size: 14px;color: #fff;}
.footerwrap<%=cssName%> .footer-link span{padding: 0 18px;}
.footerwrap<%=cssName%> .footer-link a:hover{}
.footerwrap<%=cssName%> .footer-logo{float: left;line-height: 100px;height: 150px;width: 220px;}
.footerwrap<%=cssName%> .footer-info{float: left;border-left: 1px solid #eee;padding-left: 30px;margin-left: 30px;}
.footerwrap<%=cssName%> .footer-info p{margin: 0;padding: 5px 0;}
.footerwrap<%=cssName%> .footer-ewm{float: right;text-align: center;}
.footerwrap<%=cssName%> .footer-ewm .img-center{border: 1px dotted #d7d7d7;padding: 4px;width: 110px;height: 110px;line-height: 110px;margin-bottom: 5px;}

.footer_showblock{height: 50px;display:none;}

@media screen and (max-width: 767px){
.footerwrap<%=cssName%> body{min-width: 320px;padding-top: 50px;}
.footerwrap<%=cssName%> .container{width: auto;}
.footerwrap<%=cssName%> .yunu-footer-fix{display: block;}
.footerwrap<%=cssName%> .footer{padding: 20px 0;background-color:#326ec0;color: #fff;text-align: center;}
.footerwrap<%=cssName%> .footer a{color: #fff;}
.footerwrap<%=cssName%> .footer-link,.footerwrap<%=cssName%> .footer-logo,.footerwrap<%=cssName%> .footer-ewm{display: none;}
.footerwrap<%=cssName%> .footer-info{padding-left: 0;margin-left: 0;border-left: 0;font-size: 12px;float: none;}

.footer_showblock{display: block;}
}
</style> 
<span class="footerwrap<%=cssName%>">
    <div class="footer">
        <!--底部导航-->
        <div class="footer-link">
            <div class="container">
                <%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 and flags like'%foot%' order by sortRank asc" ,conn,1,1
for i=1 to rs.recordcount
if rs.eof then exit for
%>
                <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") & rs("columnname")%></a>
                <%if i<rs.recordcount then%>
                <span>|</span>
                <%end if%>
<%rs.movenext:next:rs.close%> 
                
            </div>
        </div>
        <!--底部版权-->
        <div class="container clearfix">
            <div class="footer-logo img-center"><img src="<%=weblogo%>">
            </div>
            <div class="footer-info">
                <%=webfoot%>
            </div>
            <div class="footer-ewm">
                <div class="img-center"><img src="<%=webqrcode%>">
                </div>微信扫一扫
            </div>
        </div>
    </div>

    <div class="footer_showblock"></div>
    <!--手机端底部悬浮导航-->
    <div class="yunu-footer-fix">
        <ul class="clearfix">
            <li>
                <a href="tel:<%=webphone%>">
                    <i class="i1"></i>电话咨询
                </a>
            </li>
            <li>
                <a href="<%=getNavNameToUrl("","产品中心")%>">
                    <i class="i2"></i>产品中心
                </a>
            </li>
            <li>
                <a href="<%=getNavNameToUrl("","新闻资讯")%>">
                    <i class="i3"></i>新闻中心
                </a>
            </li>
            <li>
                <a href="./">
                    <i class="i4"></i>网站首页
                </a>
            </li>
        </ul>
    </div>
</span>
