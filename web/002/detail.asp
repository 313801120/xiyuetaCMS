<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->
<!--*****************************************************************************-->
<div class="ad"><img src="<%=bannerimage%>"></div>
<div class="nei">

    <div class="wei"><%=navLocation(navId,"")%></div>
    <div class="ntc">
        <h1><%=title%></h1>
        <p>时间：<%=format_Time(createTime,2)%>&nbsp;&nbsp;&nbsp;&nbsp;来源：<%=author%></p>
    </div>
    <div class="nncon">
        
        <%if smallimage<>"" then%>
        <p style="text-align: center;">
            <img src="<%=smallimage%>" /></p>
        <%end if%>
        <%=bodyContent%>
        <div class="clear"></div>
    </div>
    <div class="pian">
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