<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->
<!--*****************************************************************************-->
<div class="ad"><img src="<%=bannerimage%>"></div>
<div class="nei">
    <div class="wei"><%=navLocation(navId,"")%></div>
    <div class="nlist">
        <ul>


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
                <a href="detail.asp?id=<%=rs("id")%>">
                    <h1><%=rs("title")%></h1>
                    <p><%=cutStr(delHtml(rs("bodyContent")),150,"...")%></p>
                    <span><%=format_Time(rs("createTime"),2)%></span>
                </a>
            </li>
<%
rs.movenext:Next:End If:rs.close
%> </ul>
        <div class="clear"></div>
    </div>
    <div id="pages">
        <ul>



            <%if page>1 then
                response.Write("<li><a href="""& pageUrl &""">首页</a></li>")
                'response.Write("<li><a href="""& pageUrl &"&page="& page-1 &""">上一页</a></li>")
            else
                'response.Write("<li><span>首页</span></li><li><span>上一页</span></li>")
            end if
            
            
            for i=page-2 to page+2
                if i>0 and i<=maxpage then
                    if i=page then
                        response.Write("<li class='disabled'><span>"& i &"</span></li>")
                    else
                        response.Write("<li><a href="""& pageUrl &"&page="& i &""">"& i &"</a></li>")
                    end if
                end if
            next
            
            if page<maxpage then
                'response.Write("<li><a href="""& pageUrl &"&page="& page+1 &""">下一页</a></li>")
                response.Write("<li><a href="""& pageUrl &"&page="& maxpage &""">末页</a></li>")
            else
                'response.Write("<li><span>下一页</span></li><li><span>末页</span></li>")
            end if%> 




        </ul>

    </div>
</div>
<!--#Include file = "footer.Asp"-->