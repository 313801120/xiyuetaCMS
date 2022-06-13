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

cssName="overall001" 
resurl="/web/tpl/overall/001/" %>
    <div class="overall001">
        <section class="section_inner section_nnews">
            <div class="wrap index_">
                <div class="g-bd1 f-cb">
                    <div class="g-sd1">
                        <div class="prod-slide">
                            <div class="cate-box">
                                <!-- SubCatList begin -->
                                <h3><%=nav%></h3>
                                <ul>

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
 
                                    <li><a href="<%=getNavUrl(rs("id"),rs("columntype"))%>"<%=IIF(rs("columnname")=columnname," style='background-color:#0d62be;color:#fff'","")%>><%=rs("columnname")%></a></li>

                    <%rs.movenext:wend
            else
            %> 
<li><a href="<%=getNavUrl(navid,columntype)%>" style="background-color:#0d62be;color:#fff"><%=columnname%></a></li>
            <%end if:rs.close%>


                                </ul>
                                <!-- SubPageList end -->
                                <!-- Latest Products begin -->
                            </div>
                            <div class="tel-box">
                                <img src="https://www.zhongshuiyuan.com/wp-content/themes/Topqiye001/images/contact.jpg">
                                <p class="big">
                                    <i class="iconfont icon-dianhua1"></i>快速咨询热线
                                </p>
                                <p class="">
                                    <strong><%=webphone%></strong>
                                </p>
                                <p><%=webcompany%></p> 
                                <p>电话：<%=webphone%></p> 
                                <p>QQ: <%=webqq%></p> 
                                <p>E-mail:<%=webemail%></p>
                                <p>地址：<%=webaddress%></p>
                            </div>
                        </div>
                    </div>
                    <div class="g-mn1">
                        <div class="g-mn1c">
                            <div class="box">
                                <h2 class="box-title f-cb">
                                    <strong><%=columnName%></strong>
                                    <div class="pagecrumblist">
                                        当前位置：<%=navLocation(navid,"")%></div>
                                </h2>
                    
                                <div class="box-cont" style="padding:13px;padding-right:0px;">
<%
dim sql,x,page,maxpage,iPageSize,iCount,searchK
searchK=replace(request("k"),"'","")
if navId<>"" then 
    idList=getColumAllID(navId)
    if idList<>"" then idList=idList+","
    idList=idList & navId
    addsql=" where parentId in("& idList &")"
    if searchK<>"" then addsql=addsql & " and title like'%"& searchK &"%'"
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
                                    <div class="news-box">
                                        <div class="row">
                                            <div class="span-9 midd-9 smal-12">
                                                <h3 class="f-toe" style="line-height:22px;"><a href="<%=getArticleUrl(rs("id"))%>" title="<%=rs("title")%>"><%=rs("title")%></a></h3>
                                            </div>
                                            <div class="span-3 midd-3 smal-hide f-tar">
                                                <span>【<%=format_Time(rs("createTime"),2)%>】</span>
                                            </div>
                                        </div>
                                        <p class="f-toe">
                                            <%=cutStr(delhtml(rs("bodyContent")),150,"...")%></p>
                                    </div>
<%
rs.movenext:Next:End If:rs.close
%>
                                    
                                <div class="wpagenavi">


<%if page>1 then
                response.Write("<a href="""& pageUrl &""" class='page-numbers'>首页</a>")
            end if
            
            
            for i=page-1 to page+1
                if i>0 and i<=maxpage then
                    if i=page then
                        response.Write("<a href='javascript:;' class='page-numbers current'>"& i &"</a>")
                    else
                        response.Write("<a href="""& getUpDownPageUrl(pageUrl,i) &""" class='page-numbers'>"& i &"</a>")
                    end if
                end if
            next
                        
            if page<maxpage then
                response.Write("<a href="""& getUpDownPageUrl(pageUrl,maxpage) &""">末页</a>")
            end if%>
<a class="page-numbers" href="javascript:void(0);"><%=page%> / <%=maxpage%> </a> 


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
        $(function() {

            // 手机二级导航
            $(".prod-slide .cate-box h3").click(function() {
                if ($(this).siblings('ul').is(':hidden')) {
                    $(".m-ins-blackbg").show();
                    $(".prod-slide .cate-box ul").slideUp();
                    $(this).siblings('ul').slideDown();
                } else {
                    $(".m-ins-blackbg").hide();
                    $(this).siblings('ul').slideUp();
                }
            });
        })
        </script>
    </div>
