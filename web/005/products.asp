<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->
    <!--banner-->
    <div class="sub-banner">
        <div class="sub-banner-info">
            <p class="sub-china"><%=columnName%></p>
            <p class="sub-eng"><%=columnEnName%></p>
        </div>
    </div>
    <!--内容-->
    <div class="sub-content">
        <div class="container clearfix">
            <!--#Include file = "left.Asp"-->
            <div class="sub-right">
                <div class="sub-r-content">
                    <div class="crumb">当前位置：<%=navLocation(navId,"")%>
                    </div>
                    <div class="sub-r-cont">
                        <div class="sub-product">
                            <div class="sub-product-list">
                                <ul class="clearfix">
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
                                        <a href="detail.asp?id=<%=rs("id")%>" class="pro-item">
                                            <div class="pro-img">
                                                <img src="<%=rs("smallimage")%>" alt="<%=rs("title")%>"></div>
                                            <div class="pro-info">
                                                <div class="pro-text">
                                                    <div class="pro-t"><%=rs("title")%></div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
<%
rs.movenext:Next:End If:rs.close
%>
                                </ul>
                            </div>
                            <!--分页-->
                            <div class="pages">
                                <div class="page">
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
            </div>
        </div>
    </div>
    <!--#Include file = "footer.Asp"-->
    <script src="templates/jinlaser/js/jquery-1.8.3.min.js"></script>
    <script src="templates/jinlaser/js/owl.carousel.js"></script>
    <script src="templates/jinlaser/js/conmon.js"></script>
    <script type="text/javascript">$(function(){
				img($(".pro-item .pro-img img"),1);
				function img(obj, t) {
					obj.height((obj.width() * t).toFixed(2));
				}
			});</script>
</body>
</html>