<!--页脚begin-->
    <div class="footer-fluid">
        <div class="footer container clearfix">
            <div class="foote-left">
                <div class="footer-l-list clearfix">
                    


<%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 and (columntype='新闻' or columntype='产品' or columntype='文本') order by sortRank asc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>

<dl>
    <dt><%=rs("columnName")%></dt>

    <%rsx.open "select * from " & db_PREFIX & "WebColumn where parentId="& rs("id") &" and isThrough=1 order by sortRank asc" ,conn,1,1    
    while not rsx.eof
    %>
    <dd>
        <a href="<%=getNavUrl(rsx("id"),rsx("columnType"))%>"><%=rsx("columnName")%></a>
    </dd>
    <%rsx.movenext:wend:rsx.close%>

</dl>
<%rs.movenext:next:rs.close%> 




                </div>
            </div>
            <div class="footer-right">
                <div class="footer-r-info">
                    <div class="footer-r-tel">18166668888</div>
                    <div class="footer-r-tel">000-6666888</div>
                    <p class="footer-r-p">全国服务热线</p>
                    <a href="tencent://message/?uin=313801120&Site=xiyueta&Menu=yes" target="_blank" class="footer-a">咨询客服</a>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-fluid">
        <div class="footer-bottom container">
            <p>
                <%=copyright%>
            </p>
        </div>
    </div>
    <!--页脚end-->    
    
    <!--侧边悬浮-->
    <div class="cbxf">
        <div class="cbxf1">
            <a href="tencent://message/?uin=313801120&Site=xiyuta&Menu=yes" target="_blank">
                <i class="iconfont icon-kefu"></i>
                <span>在线客服</span>
            </a>
        </div>
        <div class="cbxf2">
            <a href="javascript:;">
                <i class="iconfont icon-liuyan"></i>
                <span>在线留言</span>
            </a>
            <div class="cbxf2-div">
                <div class="cbxf2-form">
                    <div class="cbxf2-form-title">
                        <h2>在线留言</h2>
                    </div>
                    <form method="post" action="/api/GuestBook" name="myform" id="myform">
                        <dl class="cbxf2-form-dl2 clearfix">
                            <dt>姓名：</dt>
                            <dd>
                                <input type="text" name="info[uname]" id="uname"/></dd>
                        </dl>
                        <dl class="cbxf2-form-dl2 clearfix">
                            <dt>电话：</dt>
                            <dd>
                                <input type="text" name="info[tel]" id="tel"/></dd>
                        </dl>
                        <dl class="cbxf2-form-textarea clearfix">
                            <dt>留言：</dt>
                            <dd>
                                <textarea name='info[content]' id='content' rows="" cols=""></textarea>
                            </dd>
                        </dl>
                        <div class="cbxf2-form-btn">
                            <input type="submit" name="dosubmit" id="dosubmit" value="提交"></div>
                    </form>
                </div>
            </div>
        </div>
        <div class="cbxf2">
            <a href="javascript:;">
                <i class="iconfont icon-erweima"></i>
                <span>微信</span>
            </a>
            <div class="cbxf2-ewm">
                <img src="<%=webQrcode%>" alt="" />
                <p>微信扫一扫</p>
            </div>
        </div>
        <div class="cbxf2" id="gotop">
            <a href="javascript:;">
                <i class="iconfont icon-control101"></i>
                <span>返回顶部</span>
            </a>
        </div>
    </div>
    <!--底部浮窗-->
    <div class="bottom-fluid">
        <ul class="clearfix">
            <li>
                <a href="./">
                    <i class="iconfont icon-daohangshouye"></i>
                    <p>首页</p>
                </a>
            </li>
            <li>
                <a href="tel:1816666888">
                    <i class="iconfont icon-dianhua"></i>
                    <p>拨号</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont icon-liuyan"></i>
                    <p>留言</p>
                </a>
            </li>
            <li>
                <a href="javascript:;" class="gotop">
                    <i class="iconfont icon-control101"></i>
                    <p>返回顶部</p>
                </a>
            </li>
        </ul>
    </div>