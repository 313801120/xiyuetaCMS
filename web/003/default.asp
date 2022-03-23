<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->

        <div id="wrapper" style="border-top:1px solid #eee">
            <div class="fullwidthbanner-container">
                <div class="fullwidthbanner">
                    <ul>
                        <li data-transition="3dcurtain-horizontal" data-slotamount="15" data-masterspeed="300">
                            <img src="templates/hjmq/images/20170616114513-0.png" alt="ban1" /></li>
                        <li data-transition="3dcurtain-horizontal" data-slotamount="15" data-masterspeed="300">
                            <img src="templates/hjmq/images/20170616114542-0.png" alt="ban2" /></li>
                    </ul>
                </div>
            </div>
        </div>




        <!--banner end-->
        <div class="Iabout_bg padding">
            <div class="IabBg2">
                <div class="width Iab_cont clearfix">
                    <img src="templates/hjmq/images/com.jpg" class="fleft">
                    <div class="fleft Iabc_right">
                        <div class="Icom_tit">
                            <span class="It1">
                                公司简介
                                <i>&nbsp;&nbsp;●&nbsp;&nbsp;COMPANY</i>
                            </span>
                            <span class="It2"></span>
                        </div>


<%rs.open "select * from " & db_PREFIX & "WebColumn where columnName='公司简介'" ,conn,1,1
if not rs.eof then%>                
                        <p><%=cutStr(rs("bodyContent"),260,"...")%></p>
                        <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" class="com_more">查看更多 >></a>
<%end if:rs.close%>





                    </div>
                </div>
            </div>
        </div>
        <style type="text/css"></style>
        <div class="pro_bg padding">
            <div class="Ilicheng width">
                <div class="tit">
                    核心产品
                    <i>● PRODUCT</i>
                    <span>专业 铸就品质</span>
                </div>
                <ul class="Ipro_tit clearfix"><%
                    n=getColumnId("产品中心")
                    addsql=""
                    if n<>"" then addSql=" where parentId="&n
                    rs.open "select * from " & db_PREFIX & "WebColumn "&addsql ,conn,1,1
for i=1 to 6
if rs.eof then exit for
%>
<li>
                        <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>"><%=rs("columnName")%></a>
                    </li><%rs.movenext:next:rs.close%>
                </ul>
                <ul class="Ipro clearfix"><%
                    idList=getColumAllID(n)
                    rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& idList &")" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>
<li>
                        <a href="detail.asp?id=<%=rs("id")%>">
                            <img src="<%=rs("smallImage")%>">
                            <span><%=rs("title")%></span>
                        </a>
                    </li><%rs.movenext:next:rs.close%>
                </ul>
                <div class="more">
                    <a href="<%=getNavNameToUrl("","产品中心>2020产品")%>">查看更多>></a>
                </div>
            </div>
        </div>
        <div class="Iteam_bg clearfix padding">
            <div class="tit">
                我们的团队
                <i>● OUR TEAM</i>
                <span>专业 铸就品质</span>
            </div>
            <div class="activeCon clearfix"><%                
                    idList=getNavNameToID("","产品中心>2021产品")
                    rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& idList &")" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>
<a href="detail.asp?id=<%=rs("id")%>" class="activeS">
                    <em class="show-bg show-bg1" style="background-image:url(<%=rs("smallImage")%>)"></em>
                    <em class="font1"></em>
                    <em class="font2"></em>
                    <span><%=rs("title")%></span>
                </a><%rs.movenext:next:rs.close%>
            </div>
            <div class="more">
                <a href="<%=getNavNameToUrl("","产品中心>2021产品")%>">查看更多>></a>
            </div>
        </div>
        <style type="text/css"></style>
        <div class="Nl_bg padding">
            <div class="width Inews clearfix">
                <div class="tit">
                    新闻资讯 ● NEWS
                    <span>专业 铸就品质</span>
                </div>
                <div class="new_list">
                    <div class="new_left fleft"> 
                        <div class="in-ku"><%
                            id=getNavNameToID("","新闻资讯")
                            idList=getColumAllID(id)
                            if idList<>"" then idList=id & "," & idList 

                    rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& idList &") and smallImage<>''" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>
<a href="detail.asp?id=<%=rs("id")%>" class="kuimg">
                                <img src="<%=rs("smallImage")%>" alt="<%=rs("title")%>">                                
                                <p class="c"><%=rs("title")%></p>
                                <s class="bg"></s>
                                <i class="l"></i>
                            </a><%rs.movenext:next:rs.close%>
                        </div>
                        <div class="innewlist">
                            <ul><%                                
                    rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& idList &") and smallImage=''" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>
<li>
                                    <a href="detail.asp?id=<%=rs("id")%>">
                                        <span class="t">
                                            资讯
                                            <s></s>
                                        </span>
                                        <span class="c"><%=rs("title")%></span>
                                    </a>
                                </li><%rs.movenext:next:rs.close%>
                            </ul>
                        </div>
                    </div>
                    <div class="new_right fleft">
                        <ul class="nr_list"><%rs.open "select * from " & db_PREFIX & "ArticleDetail order by id desc" ,conn,1,1
for i=1 to 8
if rs.eof then exit for
%>
<li>
                                <a href="detail.asp?id=<%=rs("id")%>" title="<%=rs("title")%>"><%=rs("title")%></a>
                                <span><%=format_Time(rs("createTime"),2)%></span>
                            </li><%rs.movenext:next:rs.close%>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="last_bg">
                <p>
                    信誉是企业的灵魂，质量是企业的生命
                    <br />树立”信誉公司、服务公司、和谐公司”</p>
            </div>
        </div>
        <!--#Include file = "footer.Asp"-->