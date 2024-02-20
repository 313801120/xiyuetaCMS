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

cssName="page-about001" 
resurl="/web/tpl/page-about/001/"
 %>

<div class="pub_page_side_main<%=cssName%>" style="padding-top:20px;padding-bottom:30px;">
    <div class="cnt">
        <div class="pub_page_side wow fadeInLeft">
            <div class="pub_page_side_title">
                <div class="title_main"></div>
                <div class="title_sub"><%=nav%></div>
            </div> 
            <div class="pub_page_side_menu_list">
<%  
            if navid<>"" or parentid<>"" then
                if parentid=-1 then 
                    addsql=" and parentid=" & navid
                else
                    addsql=" and parentid=" & getRootNavId(parentid)
                end if
            end if
            rs.open "select * from " & db_PREFIX & "webcolumn where isthrough=1 "& addsql &" order by sortRank asc" ,conn,1,1
            if not rs.eof then
                while not rs.eof
            %>

                    <div class="menu_item<%=IIF(rs("columnname")=columnname," on","")%>">
                        <a href="<%=getNavUrl(rs("id"),rs("columntype"))%>"><%=uTitle & rs("columnname")%></a>
                    </div>

                    <%rs.movenext:wend
            else
            %>
                    <div class="menu_item on">
                        <a href="<%=getNavUrl(navid,columntype)%>"><%=uTitle & columnname%></a>
                    </div>

            <%end if:rs.close%>
            </div>
            <div class="pub_page_side_contact">
                <div class="contact_title"><%=nav%></div>
                <div class="contact_intro">
                    <div class="contact_content">
                        <div class="content_title">
                            <div class="symbol">
                                <em class="ico ico_phone"></em>
                            </div>
                            <div class="title_main">咨询热线：</div>
                        </div>
                        <div class="content_phone">
                            <span class="main_phone"><%=webtel%></span>
                            <span class="sub_phone"><%=webphone%></span>
                        </div>
                    </div>
                    <div class="contact_method_list">传真：
                        <span style="font-family:微软雅黑,arial,helvetica,sans-serif; line-height:30px"><%=webtel%></span><br />E-mail：
                        <span style="font-family:微软雅黑,arial,helvetica,sans-serif; line-height:30px"><%=webemail%></span><br />公司地址：
                        <span style="font-family:微软雅黑,arial,helvetica,sans-serif; line-height:30px"><%=webaddress%></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="pub_page_main wow fadeInRight">
            <div class="pub_page_title">
                <div class="pub_page_bcnav">                      
                    当前位置：<%=navLocation(navid,"")%>
                </div>
                <div class="title_text"><%=uTitle & columnName%>&nbsp;</div>
            </div>
            <div class="about_content" id="adminbuy_cn"> <%=bodyContent%></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
