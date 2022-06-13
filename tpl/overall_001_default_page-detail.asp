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
    <span class="overall001">
       
<section class="section_inner">
<div class="wrap index_">
    <div class="box">
        <h2 class="box-title f-cb">
        <strong><%=columnName%></strong>
        <div class="pagecrumblist">                
                当前位置：<%=navLocation(navId,"")%>
        </div>
        </h2>
        <article class="newsdetail">
        <article class="content_bak">
        <header class="newstit">
        <h2><%=title%></h2>
        <p class="smal-hide">
            <span>发布时间：<%=createTime%></span><span class="smal-hide">来源：<a href="javascript:;" target="_blank"><%=author%></a></span>
        </p>
        </header>
                    
<p>

<%
                            '大图存在则显示大图，如果大图为#则不显示图片20220519'
                            if IIF(bigimage<>"",bigimage,smallimage)<>"#" then%>
                            <p style="text-align: center;">
                                <img src="<%=IIF(bigimage<>"",bigimage,smallimage)%>" class="img-responsive center-block" /></p>
                            <%end if%>



                    <%=bodycontent%>

</p>
                </article>
        
        <section class="newsdetailcur f-cb">
        <ul>
                

<% 
    if id<>"" then
    addsql=""
    if parentId<>-1 then addsql=" and parentId="& parentId
    'call echo("addsql",addsql)
    rsx.open"select * from " & db_PREFIX & "ArticleDetail where id>"& id & addsql &" order by id asc"  ,conn,1,1
    if rsx.eof then
        ' response.Write("<li class='l'><a href=""javascript:void(0);"">上一篇：没有了</a></li>")
    else
        response.Write("<li class='l'><a href="""& getArticleUrl(rsx("id")) &""">上一篇："& rsx("title") &"</a></li>")
    end if:rsx.close
    
    rsx.open"select * from " & db_PREFIX & "ArticleDetail where id<"& id & addsql &" order by id desc"  ,conn,1,1
    if rsx.eof then
        ' response.Write("<li class='r'><a href=""javascript:void(0);"">下一篇：没有了</a></li>")
    else
        response.Write("<li class='r'><a href="""& getArticleUrl(rsx("id")) &""">下一篇："& rsx("title") &"</a></li>")
    end if:rsx.close
    end if
    %>


                </ul>
        </section>
        </article>
    </div>
</div>
</section>

    </span>
