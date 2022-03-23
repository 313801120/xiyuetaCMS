<div class="sub-left">
    <div class="mode1">
        <div class="mode-title">
            <span>
                <%=nav%></span>
        </div>
        <div class="mode1-con">
            <ul>
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
    </div>
    <div class="mode2">
        <div class="mode-title">
            <span>联系我们</span>
        </div>
        <div class="mode2-con">
            <img src="templates/jinlaser/images/mode-contact.jpg" alt="" />
            <p>咨询电话：1816666888</p>
            <p>公司座机：000-6666888</p>
            <p>企业邮箱：313801120@qq.com</p>
            <p>公司名称：xiyuetaCMS</p>
            <p>公司地址：某某市某某路某某大道666号</p>
        </div>
    </div>
</div>