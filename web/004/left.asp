<div class="sub-sidebar">
    <div class="sub-sidebar-title"><%=nav%></div>
    <div class="sub-sidebar-list">
        <ul class="clearfix">
            <%
            if parentId=-1 then 
                addsql=" and parentId=" & navId
            else 
                addsql=" and parentId=" & getRootNavId(parentId)
            end if
            rs.open "select * from " & db_PREFIX & "WebColumn where isThrough=1 "& addsql &" order by sortRank asc" ,conn,1,1
            if not rs.eof then
                while not rs.eof
            %>
                <li<%=IIF(rs("columnName")=columnName," class='active'","")%>>
                <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>">
                    <i class="iconfont icon-jiantou_xiangyouliangci"></i>
                    <%=rs("columnName")%>
                </a>
                </li>
            <%rs.movenext:wend
            else
            %>
            <li>
                <a href="<%=getNavUrl(navId,columnType)%>">
                    <i class="iconfont icon-jiantou_xiangyouliangci"></i>
                    <%=columnName%>
                </a>
            </li>
            <%end if:rs.close%>
        </ul>
    </div>
    <div class="sub-sidebar-contact">
        <div class="sub-sidebar-title">联系我们</div>
        <div class="sub-sidebar-contact-list">
            <p>座机：027-123456</p>
            <p>传真：027-123456</p>
            <p>手机：18166668888</p>
            <p>邮箱：313801120@qq.com</p>
            <p>地址：某某市某某区某某路1号国际1层</p>
        </div>
    </div>
    <div class="sub-sidebar-btn">
        <span>展开栏目</span>
        <i class="iconfont icon-arrow2-bottom"></i>
    </div>
</div>