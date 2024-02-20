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

cssName="top001" 
resurl="/web/tpl/top/001/"
 %>
<div class="header<%=cssName%>">
    <div class="center">
        <div class="head_top_content">
            <div class="head_logo fl">
                <a href="./"><img src="<%=weblogo%>" style="max-height:60px;">
                </a>
                <div class="head_tit fl">
                  <h4><%=webcompany%></h4>                  
                  <h6><%=webcompanyen%></h6>
                    
                </div>
                <div class="head_text fl">
                    <%=getOnePageBody("top001_标语",""& vbCrlf &"                    <p>专注网站制作<i>10</i>年！</p>"& vbCrlf &"                    <span>为企业打造专业的互联网营销解决方案</span>"& vbCrlf &"                ")%>
                </div>
            </div>
            <div class="fr"><img src="<%=resurl%>images/ren.png" alt="图片名">
                <p>
                    <i>全国服务热线：</i>
                    <span><%=webphone%></span>
                </p>
            </div>
        </div>
    </div>
</div>
