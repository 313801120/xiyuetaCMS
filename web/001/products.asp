<!--#Include virtual = "/common.Asp"--><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,user-scalable=no" />
    <title><%=webTitle%></title>
    <meta name="keywords" content="<%=webKeywords%>" />
    <meta name="description" content="<%=webDescription%>" />
    <link rel="stylesheet" href="templates/minyiclean/css/fonts.css" />
    <link rel="stylesheet" href="templates/minyiclean/css/global.css" />
    <link rel="stylesheet" href="templates/minyiclean/css/animate.min.css" />
    <link rel="stylesheet" href="templates/minyiclean/css/style.css" />
    <script type="text/javascript" src="templates/minyiclean/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="templates/minyiclean/js/wow.min.js"></script>
    <script>new WOW().init();</script>
    <link rel="stylesheet" href="templates/minyiclean/css/products.css" />
</head>

<body>
    <!--#Include file = "header.Asp"-->
    <div class="pub_page_banner">
        <div class="pic">
            <a class="pc_banner">
                <img src="<%=bannerimage%>" /></a>
        </div>
    </div>
    <div class="pub_page_side_main">
        <div class="cnt">
            <!--#Include file = "left.Asp"-->
            <div class="pub_page_main wow fadeInRight">
                <div class="pub_page_title">
                    <div class="pub_page_bcnav">
                        当前位置：<%=navLocation(navId,"")%>
                    </div>
                    <div class="title_text"><%=columnName%></div>
                </div>
                <div class="page_product_list">
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
                    <div class="page_product_item">
                        <a class="pic imgbox" href="detail.asp?id=<%=rs("id")%>">
                            <img src="<%=rs("smallimage")%>" alt="<%=rs("title")%>" /></a>
                        <div class="title"><%=rs("title")%></div>
                    </div>
<%
rs.movenext:Next:End If:rs.close
%>
                    <span class="line_holder"></span>
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
                        response.Write("<li><a href="""& pageUrl &"&page="& i &""">"& i &"</a></li>")
                    end if
                end if
            next
                        
            if page<maxpage then
                response.Write("<li><a href="""& pageUrl &"&page="& maxpage &""">末页</a></li>")
            end if%>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <!--#Include file = "footer.Asp"-->