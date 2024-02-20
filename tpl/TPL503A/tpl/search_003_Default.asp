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

cssName="search003" 
 %>


    <div class="yunu-sou<%=cssName%>">
        <div class="container clearfix">
            <!--热门关键词-->
            <div class="hot">
                <strong>热门关键词：</strong>
                <%rs.open "select * from " & db_PREFIX & "webcolumn where  isthrough=1 AND parentid in("& getNameToAllId( "产品中心") &") order by sortRank asc,id asc" ,conn,1,1
for i=1 to 5
if rs.eof then exit for
%>
<a href="<%=getNavUrl(rs("id"),rs("columnType"))%>"><%=uTitle & rs("columnName")%></a>
<%rs.movenext:next:rs.close%> 
            </div>
            <!--搜索-->
            <div class="hform">
                <form method="post" action="?nav=产品中心" name="formsearch" onsubmit="return productSearch003()"><input type="hidden" name="show" value="title">
                    <input type="text" name="k" placeholder="请输入关键字...">
                    <button type="submit">搜索</button>
                </form>
            </div>
        </div>
    </div><script>
function productSearch003(){
    var s=$(".yunu-sou<%=cssName%> input[name='k']").val();
    s=(s+"").trim();
    if(s==""){
        // $("#formsearch001 div[class='invalid-feedback']").show().text("请输入搜索关键词");
        alert("请输入搜索关键词")
        $(".yunu-sou<%=cssName%> input[name='k']").focus();
        return false;
    }else{
        // $("#formsearch001").submit(); 
        return true;
    }
}
</script>
