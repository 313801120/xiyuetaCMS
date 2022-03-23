<div class="pub_page_side wow fadeInLeft">
                <div class="pub_page_side_title">
                    <div class="title_main"></div>
                    <div class="title_sub"><%=nav%></div>
                </div>
                <div class="pub_page_side_menu_list">

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

                    <div class="menu_item<%=IIF(rs("columnName")=columnName," on","")%>">
                        <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>"><%=rs("columnName")%></a>
                    </div>

                    <%rs.movenext:wend
            else
            %>
                    <div class="menu_item on">
                        <a href="<%=getNavUrl(navId,columnType)%>"><%=columnName%></a>
                    </div>

            <%end if:rs.close%>
                   
                </div>
                
                
                <div class="pub_page_side_contact">
                    <div class="contact_title">联系我们</div>
                    <div class="contact_intro">
                        <div class="contact_content">
                            <div class="content_title">
                                <div class="symbol">
                                    <em class="ico ico_phone"></em>
                                </div>
                                <div class="title_main">咨询热线：</div>
                            </div>
                            <div class="content_phone">
                                <span class="main_phone">021-123456</span>
                                <span class="sub_phone">18131380112</span>
                            </div>
                        </div>
                        <div class="contact_method_list">
                            传真：
                            <span style="font-family:微软雅黑,arial,helvetica,sans-serif; line-height:30px">021-1234567</span>
                            <br />E-mail：
                            <span style="font-family:微软雅黑,arial,helvetica,sans-serif; line-height:30px">313801120@qq.com</span>
                            <br />公司地址：
                            <span style="font-family:微软雅黑,arial,helvetica,sans-serif; line-height:30px">某某市某某区某某公路666弄66号</span>
                        </div>
                    </div>
                </div>
            </div>