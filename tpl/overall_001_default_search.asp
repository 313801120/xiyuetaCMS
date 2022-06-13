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
        <!-- 搜索 -->
        <section class="section_find">
            <div class="widget-search-hot">
                <p>
                    热门搜索
                </p>
                <%rs.open "select * from " & db_PREFIX & "webcolumn where  isthrough=1 AND parentid in("& getNameToAllId( "产品中心") &") order by sortRank desc,id desc" ,conn,1,1
for i=1 to 4
if rs.eof then exit for
%>
<a href="<%=getNavUrl(rs("id"),rs("columnType"))%>"><%=uTitle & rs("columnName")%></a>
<%rs.movenext:next:rs.close%> 
            </div>
            <div class="widget-search-form">
                <form method="get" class="f-cb" id="overall_server" action="?" onsubmit="return productSearch001()">
                    <label><i class="iconfont icon-search"></i></label>
                    <input type="text" name="k" class="form-control" placeholder="输入关键词">
                    <input type="hidden" name="nav" value="产品中心">
                    <input type="submit" class="search_btn" id="searchsubmit" value="搜索">
                </form>
            </div>
        </section> 
    </span>
<script>
function productSearch001(){
    var s=$("#overall_server input[name='k']").val();
    s=(s+"").trim();
    if(s==""){
        // $("#overall_server div[class='invalid-feedback']").show().text("请输入搜索关键词");
        alert("请输入搜索关键词")
        return false;
    }else{
        $("#overall_server").submit(); 
    }
}
</script>
