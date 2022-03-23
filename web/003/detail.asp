<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->  


        
        <div>
            <img src="<%=bannerimage%>" width="100%"></div>
        <!--banner end-->
        <style type="text/css"></style>
        <div class="return width padding">
            当前位置：<%=navLocation(navId,"")%>
        </div>
        <div class="width ab_cont padding">
            <div class="intit">
                <span>
                    <%=columnName%>
                    <i>/ <%=columnEnName%></i>
                </span>
            </div>
            <div class="acom clearfix padding">
                <%=bodyContent%>                    
            </div>


<div style="margin-top: 12px;">
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
        <!--#Include file = "footer.Asp"-->