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

cssName="news003" 
resurl="/web/tpl/news/003/"
 %>
<style>

.content-wrap<%=cssName%> *{
  font-family: "微软雅黑";
}
.content-wrap<%=cssName%> .container-fluid{
  max-width: 1200px !important;
  margin: 0 auto;
  padding: 0;
}
.content-wrap<%=cssName%> .row{
  margin: 0;
}
.content-wrap<%=cssName%> .col-lg-1,.content-wrap<%=cssName%> .col-lg-10,.content-wrap<%=cssName%> .col-lg-11,.content-wrap<%=cssName%> .col-lg-12,.content-wrap<%=cssName%> .col-lg-2,.content-wrap<%=cssName%> .col-lg-3,.content-wrap<%=cssName%> .col-lg-4,.content-wrap<%=cssName%> .col-lg-5,.content-wrap<%=cssName%> .col-lg-6,.content-wrap<%=cssName%> .col-lg-7,.content-wrap<%=cssName%> .col-lg-8,.content-wrap<%=cssName%> .col-lg-9,.content-wrap<%=cssName%> .col-md-1,.content-wrap<%=cssName%> .col-md-10,.content-wrap<%=cssName%> .col-md-11,.content-wrap<%=cssName%> .col-md-12,.content-wrap<%=cssName%> .col-md-2,.content-wrap<%=cssName%> .col-md-3,.content-wrap<%=cssName%> .col-md-4,.content-wrap<%=cssName%> .col-md-5,.content-wrap<%=cssName%> .col-md-6,.content-wrap<%=cssName%> .col-md-7,.content-wrap<%=cssName%> .col-md-8,.content-wrap<%=cssName%> .col-md-9,.content-wrap<%=cssName%> .col-sm-1,.content-wrap<%=cssName%> .col-sm-10,.content-wrap<%=cssName%> .col-sm-11,.content-wrap<%=cssName%> .col-sm-12,.content-wrap<%=cssName%> .col-sm-2,.content-wrap<%=cssName%> .col-sm-3,.content-wrap<%=cssName%> .col-sm-4,.content-wrap<%=cssName%> .col-sm-5,.content-wrap<%=cssName%> .col-sm-6,.content-wrap<%=cssName%> .col-sm-7,.content-wrap<%=cssName%> .col-sm-8,.content-wrap<%=cssName%> .col-sm-9,.content-wrap<%=cssName%> .col-xs-1,.content-wrap<%=cssName%> .col-xs-10,.content-wrap<%=cssName%> .col-xs-11,.content-wrap<%=cssName%> .col-xs-12,.content-wrap<%=cssName%> .col-xs-2,.content-wrap<%=cssName%> .col-xs-3,.content-wrap<%=cssName%> .col-xs-4,.content-wrap<%=cssName%> .col-xs-5,.content-wrap<%=cssName%> .col-xs-6,.content-wrap<%=cssName%> .col-xs-7,.content-wrap<%=cssName%> .col-xs-8,.content-wrap<%=cssName%> .col-xs-9{
  padding: 0;
  margin: 0;
}
.content-wrap<%=cssName%> .lt{
  float: left;
}
.content-wrap<%=cssName%> .rt{
  float: right;
}
.content-wrap<%=cssName%> a{
  text-decoration: none;
}
.content-wrap<%=cssName%> .news-wrap{
  /*padding: 55px 0;*/
  padding: 0;
  padding-top: 55px;
}
.content-wrap<%=cssName%> .news-wrap .title-line{
  text-align: center;
}
.content-wrap<%=cssName%> .news-wrap .title-line .chtit{
  font-size: 3rem;
  color: #383838;
  font-weight: bold;
  background: url(<%=resurl%>images/index-titline1.png) no-repeat center center;
  letter-spacing: 3px;
}
.content-wrap<%=cssName%> .news-wrap .title-line .stit{
  margin-top: 10px;
  display: inline-block;
  border: 1px solid #ddd;
  font-size: 1.2rem;
  font-family: "宋体";
  color: #afafaf;
  line-height: 20px;
  padding: 0 10px;
}
.content-wrap<%=cssName%> .news-wrap .news-con{
  margin-top: 45px;
}
.content-wrap<%=cssName%> .news-wrap .news-con .bnlist{
  margin-bottom: 20px;
}
.content-wrap<%=cssName%> .news-wrap .news-con .bnlist a{
  text-decoration: none;
  display: block;
  background: #fff;
  border: 1px solid #ddd;
}
.content-wrap<%=cssName%> .news-wrap .news-con .bnlist a:hover .conbox .mbtn .add{
  background: #0d62be;
}
.content-wrap<%=cssName%> .news-wrap .news-con .bnlist a .conbox{
  padding: 25px 20px;
}
.content-wrap<%=cssName%> .news-wrap .news-con .bnlist a .conbox .tit{
  font-size: 1.8rem;
  color: #292929;
  font-weight: bold;
  line-height: 25px;
  height: 25px;
  overflow: hidden;
}
.content-wrap<%=cssName%> .news-wrap .news-con .bnlist a .conbox .con{
  margin-top: 10px;
  font-size: 1.4rem;
  color: #696969;
  line-height: 22px;
  height: 44px;
  overflow: hidden;
}
.content-wrap<%=cssName%> .news-wrap .news-con .bnlist a .conbox .mbtn{
  margin-top: 10px;
}
.content-wrap<%=cssName%> .news-wrap .news-con .bnlist a .conbox .mbtn .m1{
  height: 30px;
  line-height: 30px;
  padding: 0 10px;
  border: 1px solid #ccc;
  color: #999;
  font-size: 1.4rem;
}
.content-wrap<%=cssName%> .news-wrap .news-con .bnlist a .conbox .mbtn .m2{
  height: 30px;
  line-height: 30px;
  padding: 0 10px;
  border: 1px solid #ccc;
  color: #999;
  font-size: 1.4rem;
}
.content-wrap<%=cssName%> .news-wrap .news-con .bnlist a .conbox .mbtn .add{
  margin-top: 5px;
  width: 20px;
  height: 20px;
  line-height: 18px;
  font-size: 1.2rem;
  text-align: center;
  background: #0d62be;
  color: #fff;
}
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist{
  margin-bottom: 20px;
}
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a{
  text-decoration: none;
  display: block;
  background: #fff;
  padding: 15px 25px;
  border: 1px solid #ddd;
}
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a:hover .add{
  background: #0d62be;
}
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a .timebox{
  float: left;
  width: 10%;
  font-size: 1.4rem;
  color: #696969;
  text-align: center;
}
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a .timebox span{
  font-size: 3.6rem;
  font-weight: bold;
  display: block;
}
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a .line{
  margin-top: 15px;
  float: left;
  width: 3%;
  height: 2px;
  background: #0d62be;
}
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a .conbox{
  float: left;
  width: 80%;
  padding-left: 10px;
}
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a .conbox .tit{
  margin-top: 5px;
  font-size: 1.8rem;
  color: #212121;
  line-height: 20px;
  height: 20px;
  overflow: hidden;
  font-weight: bold;
}
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a .conbox .con{
  margin-top: 5px;
  color: #696969;
  font-size: 1.4rem;
  line-height: 20px;
  height: 40px;
  overflow: hidden;
}
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a .add{
  margin-top: 25px;
  float: right;
  width: 20px;
  height: 20px;
  background: #0d62be;
  line-height: 20px;
  color: #fff;
  font-size: 1.4rem;
  text-align: center;
}
@media (min-width: 992px){
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox{
    padding-left: 20px;
  }}
@media (max-width: 990px){
.content-wrap<%=cssName%> .container-fluid{
    padding-left: .5em;
    padding-right: .5em;
  }}
@media (max-width: 480px){
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a .timebox{
    width: 18%;
  }
.content-wrap<%=cssName%> .news-wrap .news-con .nlistbox .nlist a .conbox{
    width: 82%;
  }}

</style>
<div class="content-wrap<%=cssName%> clearfix">
    <div class="news-wrap">
        <div class="title-line">
<%=getOnePageBody("news003-标题新闻中心",""& vbCrlf &"            <div class=""chtit"">新闻中心</div>"& vbCrlf &"            <div class=""stit"">以服务至上,品质第一为目标,致力于客户的需求与满足</div>"& vbCrlf &"        ")%>
        </div>
        <div class="news-con">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-5 col-sm-12 col-xs-12">
                        <div class="bnlist clearfix">
<%
rs.open "select * from " & db_PREFIX & "ArticleDetail where isthrough=1 AND parentId in("& getNameToAllId("新闻资讯") &")order by sortRank asc" ,conn,1,1
for i=1 to 1
if rs.eof then exit for
%> 
                            <a href="<%=getNavNameToUrl("","新闻资讯")%>">
                                <div class="picbox">
                                    <div class="pic" style="background: url('<%=rs("smallimage")%>') center center / cover no-repeat; height: 296px;"></div>
                                </div>
                                <div class="conbox">
                                    <div class="tit"><%=uTitle & rs("title")%></div>
                                    <div class="con"><%=cutstr(delhtml(rs("bodycontent")),60,"...")%></div>
                                    <div class="mbtn clearfix">
                                        <div class="m1 lt">发布：<%=format_Time(rs("createTime"),30)%></div>
                                        <div class="hidden-sm hidden-xs m2 lt">更多新闻</div>
                                        <div class="add rt">+</div>
                                    </div>
                                </div>
                            </a>
<%rs.movenext:next:rs.close%>
                        </div>
                    </div>

                    <div class="col-md-7 col-sm-12 col-xs-12">
                        <div class="nlistbox clearfix">


            <%
            rs.open "select * from " & db_PREFIX & "ArticleDetail where isthrough=1 AND parentId in("& getNameToAllId("新闻资讯") &")order by sortRank asc" ,conn,1,1
            for i=2 to 5
            if rs.eof then exit for
            %>
                            <div class="nlist clearfix">
                                <a href="<%=getArticleUrl(rs("id"))%>" class="clearfix">
                                    <div class="timebox">
                                        <span><%=day(CDate(rs("createtime")))%></span><%=month(CDate(rs("createtime")))%>月
                                    </div>
                                    <div class="hidden-sm hidden-xs line"></div>
                                    <div class="conbox">
                                        <div class="tit"><%=uTitle & rs("title")%></div>
                                        <div class="con"><%=cutstr(delhtml(rs("bodycontent")),60,"...")%></div>
                                    </div>
                                    <div class="hidden-sm hidden-xs add">+</div>
                                </a>
                            </div>
<%rs.movenext:next:rs.close%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
