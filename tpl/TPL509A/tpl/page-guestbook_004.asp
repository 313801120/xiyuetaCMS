﻿<% 
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

cssName="page-guestbook004" 
 %>
<style>


.sub-content-fluid<%=cssName%> article,.sub-content-fluid<%=cssName%> aside,.sub-content-fluid<%=cssName%> blockquote,.sub-content-fluid<%=cssName%> body,.sub-content-fluid<%=cssName%> button,.sub-content-fluid<%=cssName%> code,.sub-content-fluid<%=cssName%> dd,.sub-content-fluid<%=cssName%> details,.sub-content-fluid<%=cssName%> div,.sub-content-fluid<%=cssName%> dl,.sub-content-fluid<%=cssName%> dt,.sub-content-fluid<%=cssName%> fieldset,.sub-content-fluid<%=cssName%> figcaption,.sub-content-fluid<%=cssName%> figure,.sub-content-fluid<%=cssName%> footer,.sub-content-fluid<%=cssName%> form,.sub-content-fluid<%=cssName%> h1,.sub-content-fluid<%=cssName%> h2,.sub-content-fluid<%=cssName%> h3,.sub-content-fluid<%=cssName%> h4,.sub-content-fluid<%=cssName%> h5,.sub-content-fluid<%=cssName%> h6,.sub-content-fluid<%=cssName%> header,.sub-content-fluid<%=cssName%> hgroup,.sub-content-fluid<%=cssName%> hr,.sub-content-fluid<%=cssName%> input,.sub-content-fluid<%=cssName%> legend,.sub-content-fluid<%=cssName%> li,.sub-content-fluid<%=cssName%> menu,.sub-content-fluid<%=cssName%> nav,.sub-content-fluid<%=cssName%> ol,.sub-content-fluid<%=cssName%> p,.sub-content-fluid<%=cssName%> pre,.sub-content-fluid<%=cssName%> section,.sub-content-fluid<%=cssName%> td,.sub-content-fluid<%=cssName%> textarea,.sub-content-fluid<%=cssName%> th,.sub-content-fluid<%=cssName%> ul{
    margin: 0;
    padding: 0;
}
.sub-content-fluid<%=cssName%> body{
    /*font-family: Microsoft Yahei, arial, Hiragino Sans GB, \\5B8B\4F53, sans-serif;*/
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background:#fff;
    font-family: "Microsoft Yahei", "Hiragino Sans GB", "WenQuanYi Micro Hei", sans-serif, arial;
    font-size: 16px;
    font-weight: 300;
    outline: 0;
    font-feature-settings: normal;
    font-variant: normal;
    text-transform: none;
    -webkit-font-smoothing: antialiased;
}
.sub-content-fluid<%=cssName%> html *{
    outline: 0;
    -webkit-text-size-adjust: none;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}
.sub-content-fluid<%=cssName%> *,.sub-content-fluid<%=cssName%> :after,.sub-content-fluid<%=cssName%> :before{
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    
}
.sub-content-fluid<%=cssName%> *{
    /*滑动时候警告：Unable to preventDefault inside passive event listener,解决方法*/
    touch-action: pan-y;
}
.sub-content-fluid<%=cssName%> *{
    -webkit-transition: all 0.5s;
    -moz-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -o-transition: all 0.5s;
    transition: all 0.5s;
}
.sub-content-fluid<%=cssName%> .clearfix:after{
    content: ".";
    display: block;
    height: 0;
    clear: both;
    overflow: hidden;
    visibility: hidden;
}
.sub-content-fluid<%=cssName%> .clearfix{
    zoom: 1
}
.sub-content-fluid<%=cssName%> ul,.sub-content-fluid<%=cssName%> li{
    list-style: none;
}
.sub-content-fluid<%=cssName%> a{
    color: #333;
    text-decoration: none;
}
.sub-content-fluid<%=cssName%> a:hover{
    text-decoration: none;
}
.sub-content-fluid<%=cssName%> a:focus,.sub-content-fluid<%=cssName%> a:hover,.sub-content-fluid<%=cssName%> a:visited,.sub-content-fluid<%=cssName%> input,.sub-content-fluid<%=cssName%> input:hover,.sub-content-fluid<%=cssName%> input:focus,.sub-content-fluid<%=cssName%> input:active,.sub-content-fluid<%=cssName%> select{
  text-decoration: none;
  outline: none !important;
  border-radius: 0px;
  -webkit-border-radius: 0px;
  /*去掉iOS系统input标签默认样式*/
  -webkit-appearance: none;
   }
.sub-content-fluid<%=cssName%> .left{
    float:left;
}
.sub-content-fluid<%=cssName%> ::-webkit-input-placeholder{
    color: #dedede;
}
.sub-content-fluid<%=cssName%> ::-moz-placeholder{
    color: #dedede;
}
.sub-content-fluid<%=cssName%> :-ms-input-placeholder{
    color: #dedede;
}
.sub-content-fluid<%=cssName%> .iconfont{
  font-family: "iconfont" !important;
  font-size: 16px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.sub-content-fluid<%=cssName%> .icon-jiantou_xiangyouliangci:before{
  content: "\eb09";
}
.sub-content-fluid<%=cssName%> .container{
    width: 1200px;
    margin: 0px auto;
}
.sub-content-fluid<%=cssName%>{
    padding: 50px 0px;
    padding-top: 20px;
}
.sub-content-fluid<%=cssName%> .sub-sidebar{
    float: left;
    width: 300px
}
.sub-content-fluid<%=cssName%> .sub-sidebar-title{
    background:  #0d62be;
    width: 100%;
    text-align: center;
    line-height: 60px;
    color: #fff;
    font-size: 22px;
    font-weight: 600;
    letter-spacing: 1px;
}
.sub-content-fluid<%=cssName%> .sub-sidebar-list ul li{
    line-height: 40px;
    border: 1px solid #ddd;
    border-top: 0px;
}
.sub-content-fluid<%=cssName%> .sub-sidebar-list ul li a{
    display: block;
    width: 100%;
    font-size: 15px;
    padding: 5px 15px;
}
.sub-content-fluid<%=cssName%> .sub-sidebar-list ul li a i.iconfont{
    margin-right: 5px;
}
.sub-content-fluid<%=cssName%> .sub-sidebar-list ul li a:hover,.sub-content-fluid<%=cssName%> .sub-sidebar-list ul li.active a{
    color:  #0d62be;
    background:  #edefff;
    padding-left: 20px;
}
.sub-content-fluid<%=cssName%> .sub-sidebar-list ul li a i.iconfont{
    font-size: 20px;
}


.sub-content-fluid<%=cssName%> .sub-content-right{
    float: right;
    width: 900px;
    padding-left: 20px;
}
.sub-content-fluid<%=cssName%> .sub-cont-top{
    background:  #0d62be;
    color: #fff;
    line-height: 40px;
    margin-bottom: 20px;
}
.sub-content-fluid<%=cssName%> .sub-cont-top .left{
    font-size: 18px;
    padding-left: 10px;
}
.sub-content-fluid<%=cssName%> .sub-sidebar-contact{
    margin-top: 10px;
}
.sub-content-fluid<%=cssName%> .sub-sidebar-contact-list{
    border: 1px solid #ddd;
    padding: 10px;
}
.sub-content-fluid<%=cssName%> .sub-sidebar-contact-list p{
    line-height: 30px;
    font-size: 14px;
}
.sub-content-fluid<%=cssName%> .sub-contact-info{
    line-height: 40px;
    font-size: 16px;
}
.sub-content-fluid<%=cssName%> .sub-sidebar-btn{
    line-height: 40px;
    border: 1px solid #ddd;
    border-top: 0px;
    width: 100%;
    text-align: center;
    font-size: 16px;
    cursor: pointer;
    display: none;
}
.sub-content-fluid<%=cssName%> .sub-sidebar-btn i.iconfont{
    font-size: 20px;
}
@media (max-width:640px ){
.sub-content-fluid<%=cssName%> .container{
        width:96%;
    }
.sub-content-fluid<%=cssName%> .sub-sidebar{
        width:100%;
    }
.sub-content-fluid<%=cssName%> .sub-sidebar-btn{
        display: block;
    }
.sub-content-fluid<%=cssName%> .sub-sidebar-list{
        display: none;
    }
.sub-content-fluid<%=cssName%> .sub-sidebar-contact{
        display: none;
    }
.sub-content-fluid<%=cssName%> .sub-content-right{
        width:100%;
        padding-left:0px;
        margin-top:20px;
    }
.sub-content-fluid<%=cssName%>{
        padding:30px 0px;
    }
.sub-content-fluid<%=cssName%> .sub-cont-top{
        display: none;
    }}

</style>

    <div class="sub-content-fluid<%=cssName%>">
        <div class="sub-content container clearfix">
            <div class="sub-sidebar">
                <div class="sub-sidebar-title"><%=nav%></div>
                <div class="sub-sidebar-list">
                    <ul class="clearfix">
    <% 
              if navid<>"" or parentid<>"" then
                  if parentid=-1 then 
                      addsql=" and parentid=" & navid
                  else
                      addsql=" and parentid=" & getRootNavId(parentid)
                  end if
              end if
              rs.open "select * from " & db_PREFIX & "webcolumn where isthrough=1 "& addsql &" order by sortrank asc" ,conn,1,1
              if not rs.eof then
                  while not rs.eof
              %>
               <li<%=IIF(rs("columnname")=columnname," class='active'","")%>><a href="<%=getNavUrl(rs("id"),rs("columntype"))%>"><span><%=uTitle&rs("columnname")%></span></a></li>



                  
              <%rs.movenext:wend
              else
              %>
              <li class="active">
                  <a href="<%=getNavUrl(navId,columntype)%>">
                     <span><%=uTitle & columnname%></span>
                  </a>
              </li>
              <%end if:rs.close%>

                    </ul>
                </div>
                <div class="sub-sidebar-contact">
                    <div class="sub-sidebar-title">联系我们</div>
                    <div class="sub-sidebar-contact-list">
                        <p>座机：<%=webtel%></p>
                        <p>传真：<%=webfax%></p>
                        <p>手机：<%=webphone%></p>
                        <p>邮箱：<%=webemail%></p>
                        <p>地址：<%=webaddress%></p>
                    </div>
                </div>
                <div class="sub-sidebar-btn">
                    <span>展开栏目</span>
                    <i class="iconfont icon-arrow2-bottom"></i>
                </div>
            </div>
            <div class="sub-content-right">
                <div class="sub-cont-top clearfix">
                    <div class="left"><%=uTitle & columnname%></div>
                </div>
                <div class="sub-contact">
                    <div class="sub-contact-info"> <!--#include file="page-guestbook_900.asp"-->
                    </div>
                </div>
            </div>
        </div>
<script>
$(function(){
    $(".sub-sidebar-btn").on("click",function(){
        if($(".sub-sidebar-list").css("display")=="none"){
            $(".sub-sidebar-list").css("display","block");
            $(this).find("span").text("收起栏目");
            $(this).find("i.iconfont").addClass("icon-up_arrow").removeClass("icon-arrow2-bottom");
        }else{
            $(".sub-sidebar-list").css("display","none");
            $(this).find("span").text("展开栏目");
            $(this).find("i.iconfont").addClass("icon-arrow2-bottom").removeClass("icon-up_arrow");
        }
    })
})
</script>
    </div>
