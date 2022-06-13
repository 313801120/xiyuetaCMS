<% 
'#禁止自动更新当前文件'  #号去掉代表此文件不被程序自动更新替换掉

                 '''
'               (0 0)
'   +-----oOO----(_)------------+
'   |                           |
'   |    author:XIYUETA         |
'   |    QQ:313801120           |
'   |    www.xiyueta.com        |
'   |                           |
'   +------------------oOO------+
'              |__|__|
'               || ||
'              ooO Ooo

cssName="overall001" 
resurl="/web/tpl/overall/001/" %>
    <div class="overall001">
        <!-- footer -->
        <footer class="footer">
            <div class="footer_link">
                <div class="wrap">
                    <li>友情链接：</li>
                                <%rs.open "select * from " & db_PREFIX & "friendlink where isthrough=1 order by sortrank asc" ,conn,1,1
while not rs.eof
    %>
<li><a href="<%=rs("httpurl")%>"<%=IIF(rs("nofollow")=1," rel=""nofollow""","")%><%=IIF(rs("target")<>""," target="""& rs("target") &"""","")%>><%=rs("title")%></a></li>

<%rs.movenext:wend:rs.close%>
                </div>
            </div>
            <div class="footer_info">
                <div class="wrap index_">
                    <div class="row">
                        <div class="span-2 midd-2 smal-hide">
                            <img src="<%=weblogo%>">
                        </div>
                        <div class="span-7 midd-10 smal-12">
                            <div class="footer_nav smal-hide">


<%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 and flags like'%foot%' order by sortrank asc" ,conn,1,1
while not rs.eof
%>

                <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>"><%=rs("columnName")%></a>

<%rs.movenext:wend:rs.close%> 


                            </div>
                            <div class="footer_detail">
                                <p><%=webfoot%></p>
                            </div>
                        </div>
                        <div class="span-3 midd-hide">
                            <img src="<%=webqrcode%>">
                        </div>
                    </div>
                </div>
            </div>
        </footer>  

    </div>
