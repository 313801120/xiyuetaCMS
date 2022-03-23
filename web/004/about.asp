<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->
    <div class="sub-banner">
        <img src="<%=bannerimage%>" /></div>
    <!--面包屑导航-->
    <div class="crumbs-fluid">
        <div class="crumbs container">
            <i class='iconfont icon-shouye'></i>当前位置：<%=navLocation(navId,"")%>
        </div>
    </div>
    <div class="sub-content-fluid">
        <div class="sub-content container clearfix">
            <!--#Include file = "left.Asp"-->
            <div class="sub-content-right">
                <div class="sub-cont-top clearfix">
                    <div class="left"><%=columnName%></div>
                    
                </div>
                <div class="sub-contact">
                    <div class="sub-contact-info">
                        <%=bodyContent%>                    
                    </div>
                    <%if columnName="联系我们" then%>
                    <!-- 留言表单 -->
                    <div class="sub-contact-title">在线留言</div>
                    <div class="sub-contact-form">
                        <%if request("act")="GuestBook" then call rw("<script>alert('" & saveGuestBook() & "')</script>")%>
                        <form method="post" action="?act=GuestBook&id=<%=id%>" name="myform" id="myform">
                            <ul class="clearfix">
                                <li>
                                    <span>您的姓名：</span>
                                    <input type="text" name="guestName"   value="">
                                </li>
                                <li>
                                    <span>联系电话：</span>
                                    <input type="text" name="tel"  value="">
                                </li>
                                <li>
                                    <span>留言内容：</span>
                                    <textarea name='content'   rows="" cols=""></textarea>
                                </li>
                                <li class="form-btn">
                                    <input type="submit" name="dosubmit" id="dosubmit" value="提交"></li>
                            </ul>
                        </form>
                    </div>
                    <%end if%>
                </div>
            </div>
        </div>
    </div>
    <!--#Include file = "footer.Asp"-->