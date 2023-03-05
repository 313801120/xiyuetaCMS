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
<style>

.yunu-sou<%=cssName%> html{-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;line-height:1.15;-webkit-tap-highlight-color: rgba(0,0,0,0);}
.yunu-sou<%=cssName%> body{margin:0;font-family: "Microsoft Yahei",PingFangSC-Regular,"Helvetica Neue",Helvetica,Arial,"Hiragino Sans GB","Heiti SC","WenQuanYi Micro Hei",sans-serif;line-height: 1.42857143;font-size: 14px;min-width: 1230px;background: #fff;color: #333;}
.yunu-sou<%=cssName%> a{-webkit-text-decoration-skip:objects;background-color:transparent;}
.yunu-sou<%=cssName%> b,.yunu-sou<%=cssName%> strong{font-weight:bolder;}
.yunu-sou<%=cssName%> button,.yunu-sou<%=cssName%> input,.yunu-sou<%=cssName%> optgroup,.yunu-sou<%=cssName%> select,.yunu-sou<%=cssName%> textarea{line-height:1.42857143;margin:0;outline: none;}
.yunu-sou<%=cssName%> body,.yunu-sou<%=cssName%> button,.yunu-sou<%=cssName%> input,.yunu-sou<%=cssName%> select,.yunu-sou<%=cssName%> textarea{text-rendering: optimizeLegibility;-webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;-moz-font-feature-settings: "liga","kern";}
.yunu-sou<%=cssName%> button,.yunu-sou<%=cssName%> input{overflow:visible;border: 1px solid #ddd;}
.yunu-sou<%=cssName%> button,.yunu-sou<%=cssName%> select{text-transform:none;}
.yunu-sou<%=cssName%> [type=reset],.yunu-sou<%=cssName%> [type=submit]{-webkit-appearance:button;}
.yunu-sou<%=cssName%> button::-moz-focus-inner,.yunu-sou<%=cssName%> [type=button]::-moz-focus-inner,.yunu-sou<%=cssName%> [type=reset]::-moz-focus-inner,.yunu-sou<%=cssName%> [type=submit]::-moz-focus-inner{border-style:none;padding:0;}
.yunu-sou<%=cssName%> button:-moz-focusring,.yunu-sou<%=cssName%> [type=button]:-moz-focusring,.yunu-sou<%=cssName%> [type=reset]:-moz-focusring,.yunu-sou<%=cssName%> [type=submit]:-moz-focusring{outline:1px dotted ButtonText;}
.yunu-sou<%=cssName%> ::-webkit-file-upload-button{-webkit-appearance:button;font:inherit;}
.yunu-sou<%=cssName%> .clearfix{zoom:1;}
.yunu-sou<%=cssName%> .clearfix:before,.yunu-sou<%=cssName%> .clearfix:after{display:table;line-height:0;content:"";}
.yunu-sou<%=cssName%> .clearfix:after{clear:both;}
.yunu-sou<%=cssName%> a{color: #333;text-decoration: none;}
.yunu-sou<%=cssName%> a:hover{color: #0d62be;text-decoration: none;}
.yunu-sou<%=cssName%> .container{padding: 0 15px;width: 1200px;margin: 0 auto;}
.yunu-sou<%=cssName%>{padding: 10px 0;border-bottom: 1px solid #eee;box-shadow: 0 0 10px #eee;margin-bottom:20px;}
.yunu-sou<%=cssName%> .hot{float: left;padding: 5px 0;}
.yunu-sou<%=cssName%> .hot a{margin-right: 10px;}
.yunu-sou<%=cssName%> .hot strong{color: #0d62be;}
.yunu-sou<%=cssName%> .hform{float: right;}
.yunu-sou<%=cssName%> .hform input{float: left;font-size: 12px;border: 1px solid #eee;padding: 6px 12px;line-height: 16px;width: 210px;}
.yunu-sou<%=cssName%> .hform button{border: 0;border-bottom: 1px solid transparent;padding: 0;float: left;cursor: pointer;outline: none;width: 49px;height: 30px;background: #0d62be;color: #fff;}
@media screen and (max-width: 767px){
.yunu-sou<%=cssName%> body{min-width: 320px;padding-top: 50px;}
.yunu-sou<%=cssName%> .container{width: auto;}
.yunu-sou<%=cssName%>{padding: 0;}
.yunu-sou<%=cssName%> .container{padding: 0;}
.yunu-sou<%=cssName%> .hot{display: none;}
.yunu-sou<%=cssName%> .hform{float: none;position: relative;}
.yunu-sou<%=cssName%> .hform input{font-size: 14px;border-color: transparent;width: 100%;box-sizing: border-box;line-height: 20px;padding: 9px 60px 9px 15px;border-radius: 0;}
.yunu-sou<%=cssName%> .hform button{position: absolute;right: 0;top: 0;width: 50px;height: 40px;font-size: 14px;}
.yunu-sou<%=cssName%>{display: none;}}

</style>

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
