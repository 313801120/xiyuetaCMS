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

cssName="banner001" 
resurl="/web/tpl/banner/001/"
 %>
<style>

.pc_banner<%=cssName%> img,.m_banner<%=cssName%> img {
  border-style: none;
  border: 0;
}

 
.pc_banner<%=cssName%> {
  width: 100%;
  overflow: hidden;
  position: relative;
}
.pc_banner<%=cssName%> .pcbanner .swiper-slide img {
  width: 100%;
  display: block;
}
.pc_banner<%=cssName%> .pcbanner .pagination {
  text-align: center;
  position: absolute;
  bottom: 10px;
  width: 100%;
  z-index: 99;
}
.pc_banner<%=cssName%> .pcbanner .next {
  position: absolute;
  right: 5%;
  top: 45%;
  z-index: 99;
  height: 45px;
  width: 45px;
  background: url(<%=resurl%>images/bannerri.png);
  opacity: 0.8;
  background-size: 100%;
  cursor: pointer;
  outline: 0;
}
.pc_banner<%=cssName%> .pcbanner .next:hover {
  opacity: 1;
}
.pc_banner<%=cssName%> .pcbanner .prev {
  position: absolute;
  left: 5%;
  top: 45%;
  z-index: 99;
  height: 45px;
  width: 45px;
  background: url(<%=resurl%>images/bannerle.png);
  opacity: 0.8;
  background-size: 100%;
  cursor: pointer;
  outline: 0;
}
.pc_banner<%=cssName%> .pcbanner .prev:hover {
  opacity: 1;
}
.pc_banner<%=cssName%> .banner_text {
  position: absolute;
  left: 0;
  top: 32%;
  width: 100%;
  z-index: 90;
}
.pc_banner<%=cssName%> .banner_text .banner_text_content {
  width: 585px;
  height: 200px;
  margin: 0 auto;
}
.pc_banner<%=cssName%> .banner_text .banner_text_content .imgleft {
  width: 124px;
  float: left;
  position: relative;
  left: 106%;
}
.pc_banner<%=cssName%> .banner_text .banner_text_content .banner_text_bg {
  height: 177px;
  padding: 20px;
  padding-left: 62px;
  z-index: 99;
  padding-bottom: 20px;
  background: url(<%=resurl%>images/fff.png);
}
.m_banner<%=cssName%> {
  display: none;
  width: 100%;
  overflow: hidden;
}
.m_banner<%=cssName%> .mbanner {
  position: relative;
}
.m_banner<%=cssName%> .mbanner .swiper-slide img {
  width: 100%;
  display: block;
}
.m_banner<%=cssName%> .mbanner .pagination {
  text-align: center;
  position: absolute;
  bottom: 5px;
  width: 100%;
  z-index: 90;
}

.pc_banner<%=cssName%> .pcbanner .pagination span {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  display: inline-block;
  text-indent: -999px;
  overflow: hidden;
  overflow: hidden;
  cursor: pointer;
  background: #eee;
  margin: 0 3px;
  opacity: 1;
}

.pc_banner<%=cssName%> .pcbanner .pagination span.swiper-pagination-bullet-active {
  background: #036aac;
  color: #fff;
}

@media screen and (max-width: 1200px){
.pc_banner<%=cssName%> .banner_text {
    top: 20%;
  }}
@media screen and (max-width: 1020px){
.pc_banner<%=cssName%> {
    display: none;
  }
.m_banner<%=cssName%> {
    display: block;
  }
.mtop<%=cssName%> {
     margin-top:0px;
  }}
.m_banner<%=cssName%> .mbanner .pagination span {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  display: inline-block;
  text-indent: -999px;
  overflow: hidden;
  overflow: hidden;
  cursor: pointer;
  background: #eee;
  margin: 0 4px;
  opacity: 1;
}

.m_banner<%=cssName%> .mbanner .pagination span.swiper-pagination-bullet-active {
  background: #036aac;
  color: #fff;
}

</style> 
    <div class="pc_banner<%=cssName%>">
        <div class="pcbanner">
            <div class="swiper-wrapper">

<%
rs.open "select * from " & db_PREFIX & "articledetail where isthrough=1 and parentId in("& getNameToAllId("banner") & ") order by sortrank asc" ,conn,1,1
for i=1 to 10
if rs.eof then exit for
%>
 
                <div class="swiper-slide"><img src="<%=rs("smallImage")%>"></div>
            <%rs.movenext:next:rs.close%> 
            </div>
            <div class="pagination"></div>
            <div class="next"></div>
            <div class="prev"></div>
        </div>
        <script type="text/javascript">var mySwiper = new Swiper('.pcbanner', {
                preventIntercationOnTransition : true,
                speed: 600,
                autoplay: {
                    delay: 5000,
                    disableOnInteraction: false,
                },
                pagination: {
                    el: '.pcbanner .pagination',
                    type: 'bullets',
                    clickable :true,
                },
                navigation: {
                    nextEl: '.pcbanner .next',
                    prevEl: '.pcbanner .prev',
                    disabledClass: 'my-button-disabled',
                },
            })
            mySwiper.el.onmouseover = function(){
                mySwiper.autoplay.stop();
            }</script>
    </div>
    <div class="m_banner<%=cssName%> mtop<%=cssName%>">
        <div class="mbanner">
            <div class="swiper-wrapper">
 
<%
rs.open "select * from " & db_PREFIX & "ArticleDetail where parentId in("& getNameToAllId("banner") & ") order by sortrank asc" ,conn,1,1
for i=1 to 3
if rs.eof then exit for
%>
 
                <div class="swiper-slide"><img src="<%=rs("smallImage")%>"></div>
            <%rs.movenext:next:rs.close%> 

            </div>
            <div class="pagination"></div>
        </div>
        <script type="text/javascript">var mySwiper = new Swiper('.mbanner', {
                speed: 500,
                autoplay: {
                    delay:5000
                },
                loop : true,
                pagination: {
                    el: '.mbanner .pagination',
                    type: 'bullets',
                },
            })</script>
    </div>
