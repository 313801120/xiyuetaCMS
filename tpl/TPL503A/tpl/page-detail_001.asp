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

cssName="page-detail001" 
resurl="/web/tpl/page-detail/001/"
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
            if navId<>"" or parentId<>"" then
                if parentId=-1 then 
                    addsql=" and parentId=" & navId
                else
                    addsql=" and parentId=" & getRootNavId(parentId)
                end if
            end if
            rs.open "select * from " & db_PREFIX & "WebColumn where isThrough=1 "& addsql &" order by sortRank asc" ,conn,1,1
            if not rs.eof then
                while not rs.eof
            %>

                    <div class="menu_item<%=IIF(rs("columnName")=columnName," on","")%>">
                        <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>"><%=uTitle & rs("columnName")%></a>
                    </div>

                    <%rs.movenext:wend
            else
            %>
                    <div class="menu_item on">
                        <a href="<%=getNavUrl(navId,columnType)%>"><%=uTitle & columnName%></a>
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
                        当前位置：<%=navLocation(navId,"")%>
                    </div>
                    <div class="title_text"><%=uTitle & columnName%></div>
                </div>
                <div class="about_content" id="adminbuy_cn">
                    <div class="new_text" style="margin-bottom: 10px;">
                        <h1><%=uTitle & title%></h1>
                        <span>作者：<%=author%>&#160;|&#160;时间: <%=createTime%>&#160;|&#160;阅读：<%=views%></span>
                    </div>
                
                            <%
                            '大图存在则显示大图，如果大图为#则不显示图片20220519'
                            if IIF(bigimage<>"",bigimage,smallimage)<>"#" then%>
                            <p style="text-align: center;">
                                <img src="<%=IIF(bigimage<>"",bigimage,smallimage)%>" class="img-responsive center-block" /></p>
                            <%end if%>



                    <%=bodycontent%>
            </div>
            <div class="nppage"><% 
    if id<>"" then
    addsql=""
    if parentId<>-1 then addsql=" and parentId="& parentId
    'call echo("addsql",addsql)
    rsx.open"select * from " & db_PREFIX & "ArticleDetail where id<"& id & addsql &" order by id desc"  ,conn,1,1
    if rsx.eof then
        response.Write("上一篇：<a href=""javascript:void(0);"">没有了</a>")
    else
        response.Write("上一篇：<a href="""& getArticleUrl(rsx("id")) &""">"& uTitle & rsx("title") &"</a>")
    end if:rsx.close
    
    rsx.open"select * from " & db_PREFIX & "ArticleDetail where id>"& id & addsql &" order by id asc"  ,conn,1,1
    if rsx.eof then
        response.Write("<span>下一篇：<a href=""javascript:void(0);"">没有了</a></span>")
    else
        response.Write("<span>下一篇：<a href="""& getArticleUrl(rsx("id")) &""">"& uTitle & rsx("title") &"</a></span>")
    end if:rsx.close
    end if
    %>
            </div>
        <!-- 文章评论 -->
        </div> 
        <div class="clear"></div>
    </div>
</div>
