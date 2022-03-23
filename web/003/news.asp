<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->
        <div>
            <img src="<%=bannerimage%>" width="100%"></div>
        <!--banner end-->
        <style type="text/css"></style>
        <div class="return width padding">
            当前位置：<%=navLocation(navId,"")%>
        </div>
        <div class="width ab_cont padding">
            <div class="intit">
                <span>
                    <%=columnName%>
                    <i>/ <%=columnEnName%></i>
                </span>
            </div>            
            <ul class="news clearfix">
<%
dim sql,x,page,maxpage,iPageSize,iCount
if navId<>"" then 
    idList=getColumAllID(navId)
    if idList<>"" then idList=idList+","
    idList=idList & navId
    addsql=" where parentId in("& idList &")"
end if
sql="select * from " & db_PREFIX & "ArticleDetail "& addsql &" order by createTime desc"
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
                <li>
                    <%if rs("smallimage")<>"" and 1=2 then %>
                    <a href="detail.asp?id=<%=rs("id")%>">
                        <img src="<%=rs("smallimage")%>" class="fleft"></a>
                    <%end if%>
                    <div class="news_font fleft">
                        <strong>
                            <a href="detail.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
                        </strong>
                        <p>
                            <a href="detail.asp?id=<%=rs("id")%>">
                            <%=cutStr(delHtml(rs("bodyContent")),150,"...")%></a>
                        </p>
                    </div>
                </li>
<%
rs.movenext:Next:End If:rs.close
%>
            </ul>
            <div class="page">
                <span id="Labelfy">
            <%if page>1 then
                response.Write("<a href="""& pageUrl &""">首页</a>")
            end if
            
            
            for i=page-2 to page+2
                if i>0 and i<=maxpage then
                    if i=page then
                        response.Write("<a href='javascript:;' style='color:#e3e3e3'>"& i &"</a>")
                    else
                        response.Write("<a href="""& pageUrl &"&page="& i &""">"& i &"</a>")
                    end if
                end if
            next
                        
            if page<maxpage then
                response.Write("<a href="""& pageUrl &"&page="& maxpage &""">末页</a>")
            end if%>
                </span>
            </div>
        </div>
<!--#Include file = "footer.Asp"-->