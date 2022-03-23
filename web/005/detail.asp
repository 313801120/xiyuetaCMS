<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->
    <!--banner-->
    <div class="sub-banner">
        <div class="sub-banner-info">
            <p class="sub-china"><%=columnName%></p>
            <p class="sub-eng"><%=columnEnName%></p>
        </div>
    </div>
    <!--内容-->
    <div class="sub-content">
        <div class="container clearfix">
            <!--#Include file = "left.Asp"-->
            <div class="sub-right">
                <div class="sub-r-content">                    
                    <div class="crumb">当前位置：<%=navLocation(navId,"")%>
                    </div>
                    <div class="sub-r-cont">
                        <div class="sub-title">
                            <h1><%=title%></h1>
                            <p>
                                发布时间：<%=createTime%>&nbsp;&nbsp;&nbsp;浏览次数：
                                <span id="hits"><%=views%></span>
                                次
                            </p>
                        </div>
                        <div class="sub-r-info">

                            <%if smallimage<>"" then%>
                            <p style="text-align: center;">
                                <img src="<%=smallimage%>" /></p>
                            <%end if%>

                            <p style="text-indent: 2em;">
                            <%=bodyContent%>
                            </p>
                        </div>
                        <div class="sub-link">
                            <% 
    addsql=""
    if parentId<>-1 then addsql=" and parentId="& parentId
    'call echo("addsql",addsql)
    rsx.open"select * from " & db_PREFIX & "ArticleDetail where id>"& id & addsql &" order by id asc"  ,conn,1,1
    if rsx.eof then
        response.Write("<p>上一篇：<a href=""javascript:void(0);"">没有了</a></p>")
    else
        response.Write("<p>上一篇：<a href=""detail.asp?id="& rsx("id") &""">"& rsx("title") &"</a></p>")
    end if:rsx.close
    
    rsx.open"select * from " & db_PREFIX & "ArticleDetail where id<"& id & addsql &" order by id desc"  ,conn,1,1
    if rsx.eof then
        response.Write("<p>下一篇：<a href=""javascript:void(0);"">没有了</a></p>")
    else
        response.Write("<p>下一篇：<a href=""detail.asp?id="& rsx("id") &""">"& rsx("title") &"</a></p>")
    end if:rsx.close
     
    %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--页脚begin-->
    <!--#Include file = "footer.Asp"-->
    <script language="JavaScript" src="templates/jinlaser/js/api.php"></script>
    <script src="templates/jinlaser/js/jquery-1.8.3.min.js"></script>
    <script src="templates/jinlaser/js/owl.carousel.js"></script>
    <script src="templates/jinlaser/js/conmon.js"></script>
</body>
</html>