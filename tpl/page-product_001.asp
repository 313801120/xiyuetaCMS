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

cssName="page-product001" 
resurl="/web/tpl/page-product/001/"
 %>
<style>
.pub_page_side_main<%=cssName%> a{
     text-decoration: none;
}
.pub_page_side_main<%=cssName%> .imgbox {
   position: relative;
   text-align: center;
 }
.pub_page_side_main<%=cssName%> .imgbox:before {
   content: "";
   display: block;
   padding: 100% 0 0
 }
.pub_page_side_main<%=cssName%> .imgbox img {
   position: absolute;
   top: 50%;
   left: 50%;
   max-width: 100%;
   max-height: 100%;
   transform: translate(-50%, -50%);
   height: 100%;/*75 >> 100*/
 }
.pub_page_side_main<%=cssName%> .cnt {
   max-width: 1201px;
   margin: 0 auto;
   padding: 0 10px
 }
.pub_page_side_main<%=cssName%> .cnt {
   overflow: hidden
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side {
   float: left;
   width: 285px;
   margin: 0px 0
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side {
     float: none;
     width: auto;
     margin: 20px 0
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_title {
   color: #fff;
   text-align: center;
   background: #0d62be;
   border-radius: 3px 3px 0 0;
   overflow: hidden
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_title .title_main {
   margin: 25px 10px 5px;
   text-transform: uppercase;
   font: 700 20px berlin sans fb
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_title .title_main {
     display: none
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_title .title_sub {
   margin: 5px 0 24px;
   font: 20px 方正综艺简体
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_title .title_sub {
     margin: 10px
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list {
   margin: 5px 0 20px;
   text-align: center;
	overflow: hidden;
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list {
     text-align: justify;
     margin: 0;
     font-size: 0
   }}
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list:after {
     content: "";
     display: inline-block;
     width: 100%
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item {
   color: #333;
   font-size: 15px;
   background: #fff;
   border: 1px solid #e5e5e5;
   transition: all ease .3s;
	width: 48%;
    float: left;
    margin-right:11px;
    margin-bottom: 5px;
    line-height: 25px;
    background-color: #eee;
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item:nth-child(2n){
    margin-right: 0;
 }
@media (max-width: 870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item {
     display: inline-block;
     width: 48.5%;
     margin: 3px 0;
     font-size: 14px;
     white-space: nowrap;
     overflow: hidden;
     text-overflow: ellipsis;
     margin-right:10px;
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item a {
   display: block;
   margin: 8px;
   text-overflow: ellipsis;
   overflow: hidden;
   color: #666;
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item a {
     margin: 10px
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item.on,
 .pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item:hover {
   font-weight: 700;
   color: #fff;
   background: #326ec0;
   border-color: #326ec0
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item.on a,
 .pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item:hover a {
   display: block;
   color: #fff
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact {
     display: none
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_title {
   padding: 17px;
   text-align: center;
   font-size: 17px;
   color: #fff;
   background: #0d62be;
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro {
   padding: 1px 0 0;
   border: 1px solid #ccc;
   border-top: 0;
   background: #fff
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content {
   margin: 10px 0;
   padding: 1px 0 0
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_title {
   margin: 9px 24px 15px;
   overflow: hidden
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_title .symbol {
   float: left;
   width: 38px;
   height: 38px;
   text-align: center;
   line-height: 38px;
   border: 1px solid #082e50;
   border-radius: 100%
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_title .symbol .ico.ico_phone {
   display: inline-block;
   width: 16px;
   height: 16px;
   margin-top: 0px;
   vertical-align: middle;
   background: url(<%=resurl%>images/pub_page_side_main_ico_phone.png)
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_title .title_main {
   margin: 6px 0 0 51px;
   font-size: 18px;
   color: #0d62be
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_phone {
   text-align: center;
   margin: 5px 10px;
   font-size: 16px;
   font-weight: 700
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_phone .main_phone {
   color: #326ec0
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_phone .sub_phone {
   color: #0d62be
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_method_list {
    margin: 15px 25px;
    font-size: 14px;
    color: #666;
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_main {
   margin: 0px 0 0px 300px
 }
.pub_page_side_main<%=cssName%> .pagess ul li:hover a {
   color: #fff
 }

 .pub_page_side_main<%=cssName%> .pagess ul li.thisclass {
   display: inline-block;
   border: 1px solid #ccc;
   padding: 2px 9px;
   margin: 0 3px;
   background: #ccc;
   color: #fff
 }

 .pub_page_side_main<%=cssName%> .pagess ul li.thisclass a {
   color: #fff
 }

 .pub_page_side_main<%=cssName%> .pagess ul li a {
   display: block;
   color: #999
 }

 .pub_page_side_main<%=cssName%> .pagess ul li a:hover {
   color: #fff
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_main {
     margin: 10px 0 30px
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title {
   padding: 1px 0;
   color: #fff;
   background: #0d62be;
   border-radius: 3px 3px 0 0
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title .pub_page_bcnav {
   float: right;
   margin: 18px 22px;
   color: #fff;
       font-size: 14px;
 }
@media(max-width:800px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title .pub_page_bcnav {
     display: none;
     float: none;
     text-align: left
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title .pub_page_bcnav a {
   display: inline-block;
   color: #fff;
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title .title_text {
   margin: 15px 19px;
   font-size: 18px
 }
@media(max-width:800px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title .title_text {
     margin: 10px;
     font-size: 16px
   }}
.pub_page_side_main<%=cssName%> .pagess {
   clear: both;
   margin: 20px;
   overflow: hidden;
   margin-left: 0;
   text-align: center;
   font-size: 12px
 }
.pub_page_side_main<%=cssName%> .pagess ul li {
   display: inline-block;
   border: 1px solid #ccc;
   padding: 2px 9px;
   margin: 0 3px;
   line-height: 20px;
   background: #fff;
   color: #999
 }
.pub_page_side_main<%=cssName%> .pagess ul li:hover {
   background: #ccc;
   color: #fff;
   border: 1px solid #ccc
 }
.pub_page_side_main<%=cssName%> .pagess ul li.thisclass {
   display: inline-block;
   border: 1px solid #ccc;
   padding: 2px 9px;
   margin: 0 3px;
   background: #ccc;
   color: #fff
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_main {
}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .page_product_list {
	text-align: justify;
	font-size: 0
}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .page_product_list .page_product_item {
	display: inline-block;
	width: 33.333%;
	margin: 9px 0;
	vertical-align: top;
	font-size: 14px;
	background: #fff;
	transition: all ease .3s;
	float: left;
	    padding: 0 6px;
}
@media(max-width:600px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .page_product_list .page_product_item {
		width: 49%
	}}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .page_product_list .page_product_item .pic.imgbox {
	display: block
}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .page_product_list .page_product_item .pic.imgbox img {
}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .page_product_list .page_product_item .pic.imgbox:before {
	padding: 105.26315% 0 0
}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .page_product_list .page_product_item .title {
	padding: 15px;
	text-align: center;
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .page_product_list .page_product_item:hover {
	color: #fff;
	border-color: #0d62be;
	background: #0d62be
}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .page_product_list .line_holder {
	display: inline-block;
	width: 100%
}
.pub_page_side_main<%=cssName%> .cnt .clear {
}

</style>
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
            <div class="page_product_list">
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
                    <div class="page_product_item">
                        <a class="pic imgbox" href="<%=getArticleUrl(rs("id"))%>">
                            <img src="<%=rs("smallimage")%>" alt="<%=uTitle & rs("title")%>" /></a>
                        <div class="title"><%=uTitle & rs("title")%></div>
                    </div>
<%
rs.movenext:Next:End If:rs.close
%>
                <span class="line_holder"></span>
            </div>
            <div class="pagess">
                <ul>                        <%if page>1 then
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
        <div class="clear"></div>
    </div>
</div>
