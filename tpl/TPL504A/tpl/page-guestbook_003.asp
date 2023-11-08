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

cssName="page-guestbook003" 
resurl="/web/tpl/page-guestbook/003/"
 %>
<style>

.pub_page_side_main<%=cssName%> html,.pub_page_side_main<%=cssName%> input,.pub_page_side_main<%=cssName%> select,.pub_page_side_main<%=cssName%> textarea{
   font: 400 12px/normal '微软雅黑'
 }
.pub_page_side_main<%=cssName%> a{
   color: #000;
   text-decoration: none
 }
.pub_page_side_main<%=cssName%> body{
   position: relative;
   margin: 0;
   padding: 0
 }
.pub_page_side_main<%=cssName%> .cnt{
   max-width: 1201px;
   margin: 0 auto;
   padding: 0 10px
 }
.pub_page_side_main<%=cssName%> .cnt{
   overflow: hidden
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side{
   float: left;
   width: 285px;
   margin: 0px 0;
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side{
     float: none;
     width: auto;
     margin: 20px 0
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_title{
   color: #fff;
   text-align: center;
   background: #0d62be;
   border-radius: 3px 3px 0 0;
   overflow: hidden
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_title .title_main{
   margin: 25px 10px 5px;
   text-transform: uppercase;
   font: 700 20px berlin sans fb
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_title .title_main{
     display: none
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_title .title_sub{
   margin: 5px 0 24px;
   font: 20px 方正综艺简体
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_title .title_sub{
     margin: 10px
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list{
   margin: 5px 0 20px;
   text-align: center;
    overflow: hidden;
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list{
     text-align: justify;
     margin: 0;
     font-size: 0
   }}
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list:after{
     content: "";
     display: inline-block;
     width: 100%
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item{
   color: #333;
   font-size: 15px;
   background: #fff;
   border: 1px solid #e5e5e5;
   transition: all ease .3s;
    width: 48%;
    float: left;
    margin-right:11px;
    margin-bottom: 5px;
    line-height: 25px;
    background-color: #eee;
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item:nth-child(2n){
    margin-right: 0;
 }
@media (max-width: 870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item{
     display: inline-block;
     width: 48.5%;
     margin: 3px 0;
     font-size: 14px;
     white-space: nowrap;
     overflow: hidden;
     text-overflow: ellipsis;
     margin-right:10px;
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item a{
   display: block;
   margin: 8px;
   text-overflow: ellipsis;
   overflow: hidden;
   color: #666;
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item a{
     margin: 10px
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item.on,.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item:hover{
   font-weight: 700;
   color: #fff;
   background: #326ec0;
   border-color: #326ec0
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item.on a,.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_menu_list .menu_item:hover a{
   display: block;
   color: #fff
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact{
     display: none
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_title{
   padding: 17px;
   text-align: center;
   font-size: 17px;
   color: #fff;
   background: #0d62be;
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro{
   padding: 1px 0 0;
   border: 1px solid #ccc;
   border-top: 0;
   background: #fff
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content{
   margin: 10px 0;
   padding: 1px 0 0
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_title{
   margin: 9px 24px 15px;
   overflow: hidden
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_title .symbol{
   float: left;
   width: 38px;
   height: 38px;
   text-align: center;
   line-height: 38px;
   border: 1px solid #082e50;
   border-radius: 100%
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_title .symbol .ico.ico_phone{
   display: inline-block;
   width: 16px;
   height: 16px;
   margin-top: 0px;
   vertical-align: middle;
   background: url(<%=resurl%>images/pub_page_side_main_ico_phone.png)
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_title .title_main{
   margin: 6px 0 0 51px;
   font-size: 18px;
   color: #0d62be
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_phone{
   text-align: center;
   margin: 5px 10px;
   font-size: 16px;
   font-weight: 700
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_phone .main_phone{
   color: #326ec0
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_intro .contact_content .content_phone .sub_phone{
   color: #0d62be
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_side .pub_page_side_contact .contact_method_list{
    margin: 15px 25px;
    font-size: 14px;
    color: #666;
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_main{
   margin: 0px 0 0px 300px
 }
@media(max-width:870px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_main{
     margin: 10px 0 30px
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title{
   padding: 1px 0;
   color: #fff;
   background: #0d62be;
   border-radius: 3px 3px 0 0
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title .pub_page_bcnav{
   float: right;
   margin: 18px 22px;
   color: #fff;
       font-size: 14px;
 }
@media(max-width:800px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title .pub_page_bcnav{
     display: none;
     float: none;
     text-align: left
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title .pub_page_bcnav a{
   display: inline-block;
   color: #fff;
 }
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title .title_text{
   margin: 15px 19px;
   font-size: 18px
 }
@media(max-width:800px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .pub_page_title .title_text{
     margin: 10px;
     font-size: 16px
   }}
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .about_content{
   /*min-height: 80vh;*/
   padding: 20px 34px;
   font-size: 14px;
   line-height: 1.6;
   border: 1px solid #e5e5e5;
   background: #fff
 }
@media(max-width:600px){
.pub_page_side_main<%=cssName%> .cnt .pub_page_main .about_content{
     padding: 10px
   }}


</style>
<div class="pub_page_side_main<%=cssName%>" style="padding-top:20px;padding-bottom:30px;">
    <div class="cnt">
        <div class="pub_page_side wow fadeInLeft">
            <div class="pub_page_side_title">
                <div class="title_main"></div>
                <div class="title_sub"><%=nav%></div>
            </div> 
            <div class="pub_page_side_menu_list">
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

                    <div class="menu_item<%=IIF(rs("columnname")=columnname," on","")%>">
                        <a href="<%=getNavUrl(rs("id"),rs("columntype"))%>"><%=rs("columnname")%></a>
                    </div>

                    <%rs.movenext:wend
            else
            %>
                    <div class="menu_item on">
                        <a href="<%=getNavUrl(navid,columntype)%>"><%=uTitle & columnname%></a>
                    </div>

            <%end if:rs.close%>
            </div>
            <div class="pub_page_side_contact">
                <div class="contact_title"><%=nav%></div>
                <div class="contact_intro">
                    <div class="contact_content">
                        <div class="content_title">
                            <div class="symbol">
                                <em class="ico ico_phone"></em>
                            </div>
                            <div class="title_main">咨询热线：</div>
                        </div>
                        <div class="content_phone">
                            <span class="main_phone"><%=webtel%></span>
                            <span class="sub_phone"><%=webphone%></span>
                        </div>
                    </div>
                    <div class="contact_method_list">传真：
                        <span style="font-family:微软雅黑,arial,helvetica,sans-serif; line-height:30px"><%=webtel%></span><br />E-mail：
                        <span style="font-family:微软雅黑,arial,helvetica,sans-serif; line-height:30px"><%=webemail%></span><br />公司地址：
                        <span style="font-family:微软雅黑,arial,helvetica,sans-serif; line-height:30px"><%=webaddress%></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="pub_page_main wow fadeInRight">
            <div class="pub_page_title">
                <div class="pub_page_bcnav">                      
                    当前位置：<%=navLocation(navid,"")%>
                </div>
                <div class="title_text"><%=uTitle & columnname%>&nbsp;</div>
            </div>
            <div class="about_content" id="adminbuy_cn"> <!--#include file="page-guestbook_901.asp"--></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
