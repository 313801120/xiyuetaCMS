<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->
    <div class="sub-banner">
        <img src="templates/xwfcl/images/sub-productbanner.jpg" /></div>
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
                <div class="sub-about">
                    <div class="sub-title">
                        <h2><%=title%></h2>
                        <p>
                            <span>
                                <i class="iconfont icon-time1"></i>
                                发布时间：<%=createTime%>
                            </span>                            
                            <i class="iconfont icon-yanjing"></i>浏览次数：
                            <span id="hits"><%=views%></span>次
                        </span>
                    </p>
                </div>

                <div class="sub-info">
                    <%if smallImage<>"" then%>
                    <p style="text-align: center;">
                        <img src="<%=smallImage%>" alt="<%=title%>"></p>
                    <%end if%>
                    <p><%=bodyContent%></p>
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
<!--#Include file = "footer.Asp"-->