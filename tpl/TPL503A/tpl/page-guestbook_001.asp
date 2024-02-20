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

cssName="page-guestbook001" 
 %>


    <div class="container<%=cssName%> clearfix<%=cssName%>">
        <!--栏目侧边栏-->
        <div class="ct2-sd ">
            <!--产品分类-->
            <div class="panel-sd">
                <div class="tit"><%=nav%></div>
                <ul class="lanmu">


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

                    <li class="<%=IIF(rs("columnname")=columnname,"active","")%>">
                        <a href="<%=getNavUrl(rs("id"),rs("columntype"))%>"><%=uTitle & rs("columnname")%></a>
                    </li>

                    <%rs.movenext:wend
            else
            %>
                    <li class="active">
                        <a href="<%=getNavUrl(navid,columntype)%>"><%=uTitle & columnname%></a>
                    </li>

            <%end if:rs.close%>

 

                </ul>
            </div>
            <!--热门产品-->
            <div class="panel-sd">
                <div class="tit">热门产品</div>
                <ul class="list-3">


<%
rs.open "select * from " & db_PREFIX & "ArticleDetail where isthrough=1 AND parentId in("& getNameToAllId("产品中心") &")order by views desc" ,conn,1,1
for i=1 to 5
if rs.eof then exit for
%>   
                    <li>
                        <a href="<%=getArticleUrl(rs("id"))%>">
                            <div class="img-center"><img src="<%=rs("smallimage")%>">
                            </div>
                            <div class="text"><%=uTitle & rs("title")%></div>
                        </a>
                    </li>
    <%rs.movenext:next:rs.close%>

 
                </ul>
            </div>
            <!--联系我们-->
            <div class="panel-sd">
                <div class="tit">联系我们</div>
                <div class="contact-sd">
                    <h4><%=webcompany%></h4>
                    <p>地址：<%=webaddress%></p>
                    <p>手机：<%=webphone%></p>
                    <p>电话：<%=webtel%></p>
                    <p>邮箱：<%=webemail%></p>
                </div>
            </div>
        </div>
        <div class="ct2-mn">
            <!--当前位置-->
            <div class="position">当前位置：<%=navLocation(navId,">")%> 
            </div>
            <div class="mn-box">
                <h2 style="text-align: center;margin-bottom: 36px;">在线留言</h2>
                <div class="content-body">
<!--#include file="page-guestbook_900.asp"-->
                </div>
            </div>
            <!--新闻列表-->
            <div class="panel-mn">
                <div class="tit">推荐资讯</div>
                <div class="bd">
                    <ul class="list-5 clearfix<%=cssName%>">
                       <%
rs.open "select * from " & db_PREFIX & "ArticleDetail where isthrough=1 AND parentId in("& getNameToAllId("新闻资讯") &")order by views desc" ,conn,1,1
for i=1 to 10
if rs.eof then exit for
%>  
                        <li>
                            <a href="<%=getArticleUrl(rs("id"))%>">
                                <span><%=format_Time(rs("createTime"),30)%></span><%=uTitle & rs("title")%>
                            </a>
                        </li>
    <%rs.movenext:next:rs.close%>
                    </ul>
                </div>
            </div>
            <!--产品列表-->
            <div class="panel-mn">
                <div class="tit">推荐产品</div>
                <div class="bd">
                    <ul class="list-6 clearfix<%=cssName%>">
                                               <%
rs.open "select * from " & db_PREFIX & "ArticleDetail where isthrough=1 AND parentId in("& getNameToAllId("产品中心") &")order by views desc" ,conn,1,1
for i=1 to 8
if rs.eof then exit for
%>  
                        <li> 
                            <a href="<%=getArticleUrl(rs("id"))%>">
                                <div class="img-cover">
                                    <span style="background-image: url(<%=rs("smallimage")%>);"></span>
                                </div>
                                <div class="text">
                                    <h4><%=uTitle & rs("title")%></h4>
                                </div>
                            </a>
                        </li>
    <%rs.movenext:next:rs.close%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
