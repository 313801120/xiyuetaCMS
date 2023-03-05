<!--#Include file = "top.Asp"-->
<%
dim tag,tagUrl
tag=request("tag")
tag=replace(tag,"'","")
tagUrl="/action.asp?act=tagerr"

' call eerr("tag",tag)
if tag="" then
  response.redirect(tagUrl)
  response.end()
end if

rs.open"select * from " & db_PREFIX & "tags where title='"&tag&"'",conn,1,1
if rs.eof then
  response.redirect(tagUrl)
  response.end()
end if:rs.close


%>
<nav class="breadcrumb"> <i class="fa fa-home"></i> <a href="/">首页</a>&nbsp;&gt;&nbsp;标签大全&nbsp;&gt;&nbsp;<%=tag%></nav>
<main class="container">
    <div class="content-wrap">
    <section class="article">
      <div class="archive-head">
        <div class="headline"><i class="fa fa-folder-open"></i> <span>分类：TAG:<%=tag%></span>
          <h1><%=columnName%></h1>
          <a title="RSS 订阅该分类" href="web.html"  target="_blank"><i class="fa fa-rss"></i></a></div>
        <div class="archive-description">
          <p> <%=aboutContent%></p>
        </div>
      </div> 



      <%
dim sql,x,page,maxpage,iPageSize,iCount 
sql="select * from " & db_PREFIX & "ArticleDetail where tags like'%" & tag & "%' order by createTime desc"
rs.open sql,conn,1,1
If Rs.Eof Then
Response.Write "此信息正在发布中……"
 Else
rs.PageSize =2 '每页记录条数
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
      <article class="post" data-id="987">
        <div class="post-img"><a class="pic float-left" target="_blank" href="<%=getArticleUrl(rs("id"))%>" title="<%=rs("title")%>" rel="bookmark"><img src="" data-original="<%=IIF(rs("smallImage")="","/uploadfiles/testpic/nopic.png",rs("smallImage"))%>" alt="<%=rs("title")%>" /></a>
          <div class="mask-tags">
            <%
rsx.open"select * from " & db_PREFIX & "webcolumn where id="&rs("parentid"),conn,1,1
if not rsx.eof then
          %>
            <a href="<%=getNavUrl(rsx("id"),rsx("columntype"))%>" rel="category tag"><%=rsx("columnname")%></a>
<%end if:rsx.close%>
          </div></div>
        <header>
          <h2><a href="<%=getArticleUrl(rs("id"))%>" target="_blank" title="<%=rs("title")%>" rel="bookmark"><%=rs("title")%></a></h2>
        </header>
        <p class="post-text"><%=cutStr(delhtml(rs("bodyContent")),150,"...")%></p>
        <footer><span><i class="fa fa-user fa-fw"></i>admin</span><span class="time"><i class="fa fa-clock-o fa-fw"></i><%=format_Time(rs("createTime"),2)%></span><span><i class="fa fa-eye fa-fw"></i><%=rs("views")%> 浏览</span><span><i class="fa fa-comment-o fa-fw"></i><span><%=conn.execute("select count(*) from " & db_PREFIX & "articlemessage where articleid="&rs("id") & " and isthrough=1 ")(0)%>条评论</span></span><span><i class="fa fa-thumbs-o-up"></i><%=conn.execute("select count(*) from " & db_PREFIX & "articlecount where type='fabulous' and articleid="&rs("id"))(0)%></span></footer>
      </article>
<%
rs.movenext:Next:End If:rs.close

if asporhtml then
  pageUrl="/tags_"&tag
else
  pageUrl="tags.asp?tag="&tag
end if
'获得翻页'
function getThisTurnPage(pageUrl,page)
  if asporhtml then
    getThisTurnPage = pageUrl & "_" & page
  else
    getThisTurnPage = pageUrl  & "&page=" & page
  end if
end function
' call echo(asporhtml,pageUrl)
%>

      <div class="pagination pagination-multi">
        <ul>
         <%if page>1 then
                response.Write("<li><a href="""& pageUrl &".html"">首页</a></li>")
            end if
            
            
            for i=page-2 to page+2
                if i>0 and i<=maxpage then
                    if i=page then
                        response.Write("<li class='active'><span>"& i &"</span></li>")
                    else
                        response.Write("<li><a href="""& getThisTurnPage(pageUrl,i) &".html"">"& i &"</a></li>")
                    end if
                end if
            next
                        
            if page<maxpage then
                response.Write("<li><a href="""& getThisTurnPage(pageUrl,maxpage) &".html"">尾页</a></li>")
            end if%>
        </ul>
      </div>
    </section>
  </div>
    <!--#Include file = "right.Asp"-->
</main>
<!--#Include file = "foot.Asp"-->