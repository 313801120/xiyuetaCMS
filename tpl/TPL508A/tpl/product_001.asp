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

cssName="product001" 
resurl="/web/tpl/product/001/"
 %>
  
<script src='/web/js/jquery.imgauto.js'></script>
<style>

.main<%=cssName%> .fl{
  float: left;
}
.main<%=cssName%> .fr{
  float: right;
}
.main<%=cssName%> .clearfix,.main<%=cssName%> .container:after,.main<%=cssName%> .row:after,.main<%=cssName%> ul{
  *zoom: 1;
}
.main<%=cssName%> .clearfix:after,.main<%=cssName%> .container:after,.main<%=cssName%> .row:after,.main<%=cssName%> ul:after{
  content: " ";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}

.main<%=cssName%> a{
  background-color: transparent;
  /* 1 */
  -webkit-text-decoration-skip: objects;
  /* 2 */
}
.main<%=cssName%> img{
  border-style: none;
}
.main<%=cssName%> button,.main<%=cssName%> html [type="button"],.main<%=cssName%> [type="reset"],.main<%=cssName%> [type="submit"]{
  -webkit-appearance: button;
  /* 2 */
}
.main<%=cssName%> ::-webkit-file-upload-button{
  -webkit-appearance: button;
  /* 1 */
  font: inherit;
  /* 2 */
}
.main<%=cssName%> *{
  box-sizing: border-box;
}
.main<%=cssName%> *:before,.main<%=cssName%> *:after{
  box-sizing: border-box;
}
.main<%=cssName%> blockquote,.main<%=cssName%> body,.main<%=cssName%> button,.main<%=cssName%> dd,.main<%=cssName%> dl,.main<%=cssName%> dt,.main<%=cssName%> fieldset,.main<%=cssName%> form,.main<%=cssName%> h1,.main<%=cssName%> h2,.main<%=cssName%> h3,.main<%=cssName%> h4,.main<%=cssName%> h5,.main<%=cssName%> h6,.main<%=cssName%> hr,.main<%=cssName%> input,.main<%=cssName%> legend,.main<%=cssName%> li,.main<%=cssName%> ol,.main<%=cssName%> p,.main<%=cssName%> pre,.main<%=cssName%> td,.main<%=cssName%> textarea,.main<%=cssName%> th,.main<%=cssName%> ul{
  margin: 0;
  padding: 0;
}
.main<%=cssName%> fieldset,.main<%=cssName%> img{
  border: 0;
}
.main<%=cssName%> body,.main<%=cssName%> button,.main<%=cssName%> input,.main<%=cssName%> select,.main<%=cssName%> textarea{
  font: 14px/1.5 "\5FAE\8F6F\96C5\9ED1", "arial";
  color: #333;
  font-size: 14px;
}
.main<%=cssName%> ul,.main<%=cssName%> ol{
  list-style: none;
}
.main<%=cssName%> a,.main<%=cssName%> button,.main<%=cssName%> input[type="submit"],.main<%=cssName%> input[type="button"],.main<%=cssName%> input[type="reset"],.main<%=cssName%> input[type="file"]{
  cursor: pointer;
}
.main<%=cssName%> a{
  color: inherit;
  color: expression(this.parentNode.currentStyle.color);
  text-decoration: none;
}
.main<%=cssName%> a:focus{
  outline: thin dotted;
}
.main<%=cssName%> a:active,.main<%=cssName%> a:hover{
  outline: 0;
}
.main<%=cssName%> h3{
  font-size: 28px;
}
.main<%=cssName%> body,.main<%=cssName%> button,.main<%=cssName%> input,.main<%=cssName%> select,.main<%=cssName%> textarea{
  font: 12px/1.4 "\5FAE\8F6F\96C5\9ED1", "arial";
  color: #5a5a5a;
  font-size: 12px;
}
.main<%=cssName%> body{
  max-width: 1920px;
  margin: 0 auto;
}
.main<%=cssName%> .center{
  width: 1200px;
  margin: 0 auto;
}
.main<%=cssName%>{
  width: 100%;
}
.main<%=cssName%> .i_box1{
  width: 100%;
  padding-bottom: 40px;
}
.main<%=cssName%> .i_box1 .i_box1_content{
  width: 100%;
}
.main<%=cssName%> .main_l{
  width: 20%;
  position: relative;
  z-index: 89;
  margin-top: -105px;
}
.main<%=cssName%> .main_l p{
  width: 100%;
  height: 105px;
  background: #0d62be;
  padding-top: 22px;
}
.main<%=cssName%> .main_l p span{
  font-size: 27px;
  text-align: center;
  display: block;
  color: #fff;
}
.main<%=cssName%> .main_l p i{
  font-size: 12px;
  font-style: normal;
  text-align: center;
  display: block;
  color: #fff;
}
.main<%=cssName%> .main_l ul li{
  width: 100%;
  background: url(<%=resurl%>images/li1.png) no-repeat 95% center #fff;
  height: 48px;
  line-height: 48px;
  margin-bottom: 3px;
  border: 1px solid #ddd;
}
.main<%=cssName%> .main_l ul li:hover{
  background: url(<%=resurl%>images/li2.png) no-repeat 95% center #0d62be;
}
.main<%=cssName%> .main_l ul li:hover span{
  color: #fff;
}
.main<%=cssName%> .main_l ul li a{
  width: 100%;
  height: 48px;
  display: block;
}
.main<%=cssName%> .main_l ul li a span{
  font-size: 16px;
  color: #0d62be;
  float: left;
  margin-left: 10px;
}
.main<%=cssName%> .main_l .contact{
  width: 100%;
  height: 153px;
  background: #0d62be;
  padding-top: 20px;
}
.main<%=cssName%> .main_l .contact a img{
  width: 65px;
  display: block;
  margin: 0 auto;
}
.main<%=cssName%> .main_l .contact a h3{
  font-size: 19px;
  text-align: center;
  color: #fff;
}
.main<%=cssName%> .main_l .contact a span{
  font-size: 14px;
  text-align: center;
  display: block;
  color: #fff;
}
.main<%=cssName%> .main_r{
  width: 80%;
  float: right;
  padding-left: 3%;
}
.main<%=cssName%> .pro_list{
  width: 100%;
  overflow: hidden;
  margin-top: 32px;
}
.main<%=cssName%> .pro_list ul li{
  width: 23%;
  padding: 10px 15px;
  margin-right: 2.66%;
  margin-bottom: 28px;
  float: left;
  border: 1px solid #eee;
}
.main<%=cssName%> .pro_list ul li a .imgauto{
  width: 100%;
  height: 203px;
}
.main<%=cssName%> .pro_list ul li a span{
  display: block;
  margin-top: 6px;
  text-align: center;
  font-size: 14px;

  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.main<%=cssName%> .pro_list ul li:nth-child(4n){
  margin-right: 0;
}
.main<%=cssName%> .pro_list ul li:hover{
  border: 1px solid #0d62be;
}
.main<%=cssName%> .pro_list ul li:hover img{
  opacity: .6;
}
.main<%=cssName%> .pro_list ul li:hover span{
  color: #0d62be;
}
@media screen and (max-width: 1200px){
.main<%=cssName%> .center{
    width: 100%;
  }}
@media screen and (max-width: 768px){
.main<%=cssName%>{
    overflow: hidden;
  }
.main<%=cssName%> .i_box1{
    padding: 0 2%;
  }
.main<%=cssName%> .main_l{
    width: 100%;
    padding-left: 0;
    margin-top: 20px;
  }
.main<%=cssName%> .main_r{
    width: 100%;
    padding-left: 0;
  }
.main<%=cssName%> .i_box1 .main_l .contact{
    display: none;
  }
.main<%=cssName%> .i_box1 .pro_list{
    margin-top: 10px;
  }
.main<%=cssName%> .pro_list ul li{
    width: 49%;
    margin-right: 2%;
    padding: 5px;
    margin-bottom: 2%;
  }
.main<%=cssName%> .pro_list ul li:nth-child(2n){
    margin-right: 0;
  }}
@media screen and (max-width: 450px){
.main<%=cssName%> .main_l p{
    height: auto;
    padding: 10px;
  }
.main<%=cssName%> .main_l p span{
    font-size: 22px;
  }
.main<%=cssName%> .main_l p i{
    font-size: .09rem;
    margin-top: 6px;
  }
.main<%=cssName%> .main_l ul li{
    width: 49%;
    float: left;
    margin-right: 2%;
    margin-top: 3px;
    line-height: 36px;
    height: 36px;
    margin-bottom: 0;
    margin-top: 3px;
  }
.main<%=cssName%> .main_l ul li:nth-child(2n){
    margin-right: 0;
  }
.main<%=cssName%> .main_l ul li a{
    height: 36px;
  }
.main<%=cssName%> .main_l ul li a span{
    font-size: 14px;
  }
.main<%=cssName%> .pro_list ul li a .imgauto{
    height: 100px;
  }}


</style>
<div class="main<%=cssName%>">
    <div class="i_box1 clearfix">
        <div class="center">
            <div class="i_box1_content clearfix">
                <div class="main_l fl">
                    <p>
                        <span>产品展示</span>
                        <i>PRODUCT DISPLAY</i>
                    </p>
                    <ul>
<%rs.open "select * from " & db_PREFIX & "webcolumn where  isthrough=1 AND parentid in("& getNameToAllId( "产品中心") &") order by sortRank asc,id asc" ,conn,1,1
for i=1 to 12
if rs.eof then exit for
%>
<li><a href="<%=getNavUrl(rs("id"),rs("columnType"))%>"><span><%=uTitle & rs("columnName")%></span></a></li>
<%rs.movenext:next:rs.close%>
                    </ul>
                    <div class="contact">
                        <a href="?nav=在线留言"><img src="<%=resurl%>images/88.png">
                            <h3>在线留言</h3>
                            <span>留下您的宝贵意见</span>
                        </a>
                    </div>
                </div>
                <div class="main_r fr">
                    <div class="pro_list clearfix">
                        <ul>
<%rs.open "select * from " & db_PREFIX & "ArticleDetail where isthrough=1 AND parentId in("& getNameToAllId( "产品中心") &") order by sortRank asc,id asc" ,conn,1,1
for i=1 to 8
if rs.eof then exit for
%>
<li>
                                        <a href="<%=getArticleUrl(rs("id"))%>">
                                            <div class="imgauto"><img src="<%=rs("smallimage")%>" alt="<%=rs("title")%>"></div>
                                            <span><%=uTitle&rs("title")%></span>
                                        </a>
                                    </li>
<%rs.movenext:next:rs.close%>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">$(function () {
            $('.imgauto img').imgAuto();
        })</script>
</div>
