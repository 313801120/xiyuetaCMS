
    <div class="di">
        <div class="dic">
            <div class="dic1">
                <ul>
                    <li>
                        <h1>关于我们</h1>
                        <%
                        parentId=getNavNameToID("","关于我们")
                        rs.open "select * from " & db_PREFIX & "WebColumn where parentId="&parentId ,conn,1,1
for i=1 to 5
if rs.eof then exit for
%>
<a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
<%rs.movenext:next:rs.close%>
                    </li>
                    <li>
                        <h1>公司产业</h1><%
                        parentId=getNavNameToID("","产品中心")
                        rs.open "select * from " & db_PREFIX & "WebColumn where parentId="&parentId ,conn,1,1
for i=1 to 5
if rs.eof then exit for
%>
<a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
<%rs.movenext:next:rs.close%>
                    </li>
                    <li>
                        <h1>产品中心</h1><%
                        parentId=getNavNameToID("","产品中心")
                        rs.open "select * from " & db_PREFIX & "WebColumn where parentId="&parentId ,conn,1,1
for i=1 to 5
if rs.eof then exit for
%>
<a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
<%rs.movenext:next:rs.close%>
                    </li>
                    <li>
                        <h1>新闻中心</h1><%
                        parentId=getNavNameToID("","新闻资讯")
                        rs.open "select * from " & db_PREFIX & "WebColumn where parentId="&parentId ,conn,1,1
for i=1 to 5
if rs.eof then exit for
%>
<a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
<%rs.movenext:next:rs.close%>
                    </li>
                </ul>
                <div class="clear"></div>
            </div>
            <div class="dic2">
                <dl>
                    <dt>
                        <img src="<%=webQrcode%>"></dt>
                    <dd><%=websitebottom%>
                    </dd>
                </dl>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="foot">
        <%=copyright%>
    </div>
</body>
</html>