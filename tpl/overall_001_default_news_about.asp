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
        <section class="section_news">
            <div class="wrap index_">
                <article class="article">
                    <div class="row">
                        <div class="span-6 midd-6 smal-12">
                            <h2 class="box-t"><strong></strong>
                                <div class="iconmore">
                                    <a href="<%=getNavNameToUrl("","新闻资讯")%>"><i>+</i></a>
                                </div>
                            </h2>
                            <ul class="new-box">


<%
rs.open "select * from " & db_PREFIX & "ArticleDetail where isthrough=1 AND parentId in("& getNameToAllId("新闻资讯") &") order by sortRank asc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%> 

                                <li class="f-cb">
                                    <div class="icondetail">
                                    </div>
                                    <a href="<%=getArticleUrl(rs("id"))%>"><%=uTitle&rs("title")%></a>
                                </li>
                                <div class="licont"><%=cutStr(delHtml(rs("bodyContent")),200,"")%></div>
    <%rs.movenext:next:rs.close%>


                            </ul>
                        </div>
                        <div class="span-6 midd-6 smal-12">
                            <h2 class="box-t"><strong>公司简介 </strong>
                                <div class="iconmore">
                                    <a href="<%=getNavNameToUrl("","关于我们")%>"><i>+</i></a>
                                </div>
                            </h2>
                            <div class="about-box">
                                <img src="<%=resurl%>images/about.jpg">
                                <p><%=cutStr(getOnePageBody("关于我们","xiyuetaCMS开源网站管理系统 v1.1.0，是基于Asp+Access/SQL Server架构的智能系统，集电脑版、手机版、平板版于一体，无缝切换。周期短："& vbCrlf &"系统使用非常复合网站习惯，上手快，网站制作轻而易举，仿站神器！功能全：系统功能齐全，可以根据做网站需要添加组合插件，可扩展性强。易优化：系统具有非常完善的复合各搜索引擎的优化体系，做网站添加方便。"& vbCrlf &""& vbCrlf &"admin 后台管理目录 账号密码admin admin"& vbCrlf &"api 上传程序等目录"& vbCrlf &"data 数据库目录"& vbCrlf &"fz 仿站目录"& vbCrlf &"inc 程序和类目录"& vbCrlf &"UploadFiles 上传文件存放目录"& vbCrlf &"web 网站模板目录"& vbCrlf &""& vbCrlf &""& vbCrlf &"common.asp 公共程序文件"& vbCrlf &"default.asp 首页文件"& vbCrlf &"web.config 网站配置文件"& vbCrlf &""& vbCrlf &"技术支持:QQ313801120，学习交流群：35915100。官网：www.xiyueta.com"),130,"...")%>
                                </p>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
<script>
$(function(){
    //新闻打开
    $(".icondetail").click(function(){
        $(this).parent().toggleClass("on").siblings("li").removeClass("on")
        $(this).parent().toggleClass("open").siblings("li").removeClass("open")
        // 修改数字控制速度， slideUp(500)控制卷起速度
        $(this).parent().next(".licont").slideToggle(500).siblings(".licont").slideUp(500);
    })
    // $(".new-box li.open").next(".licont").slideToggle(500).siblings(".licont").slideUp(500);
    $(".icondetail:eq(0)").click();


})
</script>
        </section>
    </div>
