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

cssName="page-news001" 
resurl="/web/tpl/page-news/001/"
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
                <div class="title_text"><%=uTitle & columnName%>&nbsp;</div>
            </div>
            <div class="page_news_list">
                <div class="news_list">
                    
<%
dim sql,x,page,maxpage,iPageSize,iCount

if navId<>"" then 
    idList=getColumAllID(navId)
    if idList<>"" then idList=idList+","
    idList=idList & navId
    addsql=" where parentId in("& idList &")"
end if
if sKeyword<>"" then
    if addsql="" then
        addsql=" where "
    else
        addsql=addsql & " and "
    end if
    addsql=addSql & " (title like'%"& sKeyword &"%' or author like'%"& sKeyword &"%')"
end if
sql="select * from " & db_PREFIX & "ArticleDetail "& addsql & " order by id asc"
rs.open sql,conn,1,1
If Rs.Eof Then
Response.Write "此信息正在发布中……"
 Else
rs.PageSize =6 '每页记录条数
iCount=rs.RecordCount '记录总数
iPageSize=rs.PageSize
maxpage=rs.PageCount 
page=request("page")
if Not IsNumeric(page) or page="" then
    page=1
else
    page=cint(page)
end if
if page<1 then
    page=1
elseif  page>maxpage then
    page=maxpage
end if

rs.AbsolutePage=Page

if page=maxpage then
    x=iCount-(maxpage-1)*iPageSize
else
    x=iPageSize
end if 

For i=1 To x
%>
                        <div class="news_item">
                            <a class="imgbox pic" href="<%=getArticleUrl(rs("id"))%>">
                                <img src="<%=rs("smallImage")%>" alt="<%=uTitle & rs("title")%>" onerror="this.src='/uploadfiles/testpic/nopic.png'" /></a>
                            <div class="intro">
                                <div class="news_title">
                                    <a href="<%=getArticleUrl(rs("id"))%>" title="<%=uTitle & rs("title")%>"><%=uTitle & rs("title")%></a>
                                </div>
                                <div class="news_brief"><%=cutStr(delhtml(rs("bodyContent")),150,"...")%></div>
                                <div class="news_status_list">
                                    <div class="news_status_time">
                                        <em class="ico ico_clock"></em>
                                        <%=format_Time(rs("createTime"),2)%>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
<%
rs.movenext:Next:End If:rs.close
%>

                    
                </div>
                <div class="pagess">
                    <ul>
                       <%if page>1 then
                response.Write("<li><a href="""& pageUrl &""">首页</a></li>")
            end if
            
            
            for i=page-2 to page+2
                if i>0 and i<=maxpage then
                    if i=page then
                        response.Write("<li class='thisclass'>"& i &"</li>")
                    else
                        response.Write("<li><a href="""& getUpDownPageUrl(pageUrl,i) &""">"& i &"</a></li>")
                    end if
                end if
            next
                        
            if page<maxpage then
                response.Write("<li><a href="""& getUpDownPageUrl(pageUrl,maxpage) &""">末页</a></li>")
            end if%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
