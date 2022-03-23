<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->
    <div class="sub-banner">
        <img src="templates/xwfcl/images/sub-productbanner.jpg" /></div>
    <!--面包屑导航-->
    <div class="crumbs-fluid">
        <div class="crumbs container">            
            <i class='iconfont icon-shouye'></i>当前位置：<%=navLocation(navId,"")%>
        </div>
    </div>
    <div class="sub-content-fluid">
        <div class="sub-content container clearfix">
            <!--#Include file = "left.Asp"-->
            <div class="sub-content-right">
                <div class="sub-cont-top clearfix">
                    <div class="left"><%=columnName%></div>         
                </div>
                <div class="product-list clearfix">
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
rs.PageSize =12 '每页记录条数
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
                    <div class="product-item">
                        <a href="detail.asp?id=<%=rs("id")%>">
                            <div class="product-img">
                                <img src="<%=rs("smallimage")%>" alt="<%=rs("title")%>"></div>
                            <div class="product-info"><%=rs("title")%></div>
                        </a>
                    </div>
<%
rs.movenext:Next:End If:rs.close
%>


                </div>
                <div class="pages">
                    <div class="page clearfix">
                        <%if page>1 then
                response.Write("<a href="""& pageUrl &""">首页</a>")
            end if
            
            
            for i=page-2 to page+2
                if i>0 and i<=maxpage then
                    if i=page then
                        response.Write("<span>"& i &"</span>")
                    else
                        response.Write("<a href="""& pageUrl &"&page="& i &""">"& i &"</a>")
                    end if
                end if
            next
                        
            if page<maxpage then
                response.Write("<a href="""& pageUrl &"&page="& maxpage &""">末页</a>")
            end if%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--#Include file = "footer.Asp"-->