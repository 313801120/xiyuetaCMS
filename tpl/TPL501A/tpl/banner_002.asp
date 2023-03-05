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

cssName="banner002" 
 %>
<style>

 

.page_banner<%=cssName%> img {
  border-style: none;
} 
.page_banner<%=cssName%> {
  width: 100%;
  overflow: hidden;
  line-height: 0;
}
.page_banner<%=cssName%> img {
  width: 100%;
}
@media screen and (max-width: 1020px){
.page_banner<%=cssName%> {
     margin-top:0px;
  }}</style>

    <div class="page_banner<%=cssName%>"><img src="<%=IIF(bannerImage<>"",bannerImage,"/uploadfiles/testpic/ad.jpg")%>">
    </div>
