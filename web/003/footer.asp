        <div class="f_foot padding">
            <div class="fMain width">
                <div class="f_nav"><%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 order by sortRank asc" ,conn,1,1
        while not rs.eof
        %>
        <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>|<%rs.movenext:wend:rs.close%>
                </div>
                <div class="f_Info clearfix">
                    <div class="f_code fleft">
                        <img src="<%=webQrcode%>" alt="二维码" title="二维码"></div>
                    <div class="f_Txt fleft">
                        <%=webSiteBottom%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--wrap end-->
</body>
</html>