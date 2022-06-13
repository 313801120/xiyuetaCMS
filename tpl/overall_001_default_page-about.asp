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
        <section class="section_inner">
            <div class="wrap index_">
                <div class="g-bd1 f-cb">
                    <div class="g-sd1">
                        <div class="prod-slide">
                            <div class="cate-box">
                                <!-- SubPageList begin -->
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
                                    <strong><%=columnName%> </strong>
                                    <div class="pagecrumblist">        
                    当前位置：<%=navLocation(navid,"")%>
                                    </div>
                                </h2>
                                <div class="box-cont">
                                    <p> <%=bodyContent%></p>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<script>
$(function(){

    // 手机二级导航
    $(".prod-slide .cate-box h3").click(function() {
        if ($(this).siblings('ul').is(':hidden')) {
            $(".m-ins-blackbg").show();
            $(".prod-slide .cate-box ul").slideUp();
            $(this).siblings('ul').slideDown();
        }else{
            $(".m-ins-blackbg").hide();
            $(this).siblings('ul').slideUp();
        }
    });
})
</script>
    </div>
