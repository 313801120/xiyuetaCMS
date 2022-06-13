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
        <!-- header -->
        <header class="header">
            <div class="bar midd-hide">
                <div class="wrap">
                    <div class="row">
                        <div class="span-6 midd-hide">
                            <%=webcompany%> </div>
                        <div class="span-6 midd-12">
                            <ul class="f-fr smal-12">
                                <li><a href="./?nav=联系我们">联系我们</a><i class="split"></i></li>
<li><a href="./?nav=新闻资讯">新闻资讯</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrap f-pr f-cb">
                <div class="row">
                    <div class="span-9 midd-12 smal-12">
                        <h1 class="logo" style="width:10%">
                            <a href="./" title="<%=webcompany%>"><span></span><img src="<%=weblogo%>"></a>
                        </h1>
                        <h2 class="slogan" style="width:80%;"> 
                            <p><%=getOnePageBody("overall001_topnav","<i>10年</i>WEB前后端开发实战经验"& vbCrlf &"                                <br>"& vbCrlf &"                                <small>独立开发出一套网站内容管理系统</small>")%></p>
                        </h2>
                    </div>
                    <div class="span-3 midd-12 smal-hide">
                        <div class="head_tel">
                            <p>
                                <i class="iconfont icon-dianhua"></i>全国咨询热线<a href="tel:<%=webphone%>"><%=webphone%></a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="navbox">
                <div class="wrap">
                    <nav class="nav_transform1 skin-blue">
                        <div class="navtop">
                        </div>
                        <div class="bg bg1">
                        </div>
                        <div class="bg bg2">
                        </div>
                        <div class="bg bg3">
                        </div>
                        <div class="bg bg4">
                        </div>
                        <ul class="navcont f-cb">

                          

              


<%rs.open "select * from " & db_PREFIX & "webcolumn where parentid=-1 and isthrough=1 and flags like'%top%' order by sortrank asc" ,conn,1,1
for i=1 to rs.recordcount
if rs.eof then exit for
%>
 

<li class="menu-item menu-item-has-children"> 
                    <a href="<%=getNavUrl(rs("id"),rs("columntype"))%>" title="<%=rs("columnname")%>"<%=IIF(isFocusNav(rs)," style='background-color:#326ec0'","")%>><%=IIF(rs("columnType")<>"home",uTitle,"") & rs("columnname")%></a>
    <%rsx.open "select * from " & db_PREFIX & "webcolumn where parentId="& rs("id") &" and isThrough=1 order by sortrank asc" ,conn,1,1
    if not rsx.eof then        
    %>
        <ul class="sub-menu">
        <%while not rsx.eof%>
         <li class="menu-item"><a href="<%=getNavUrl(rsx("id"),rsx("columnType"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") &rsx("columnname")%></a></li>
        <%rsx.movenext:wend%>
                </ul>
                <%
                end if:rsx.close%>
                </li>
  
 
<%rs.movenext:next:rs.close%>



                        </ul>
                    </nav>
                </div>
            </div>
            <i class="wapnavbtn iconfont icon-caidan3"></i>
        </header>
<script>
  
    // 导航
    $(".nav_transform1 li").hover(function(){
        $(this).children(".sub-menu").stop().show().animate({height: 350},400); 
    },function(){
        $(this).children(".sub-menu").stop().hide().animate({height: 0},400);   
    });

    // 手机导航
    var navBool=false,navTimeout;
    $(".wapnavbtn").unbind("click").bind("click",function(){ 
        if(!navBool){
            $(".nav_transform1").show().removeClass("out").addClass("in");
            setTimeout(function(){$(".wapnavbtn").addClass("on")},200);
            clearTimeout(navTimeout);
            navBool=true;
        }else{
            $(".nav_transform1").removeClass("in").addClass("out");
            setTimeout(function(){$(".wapnavbtn").removeClass("on")},70);
            navTimeout = setTimeout(function(){$(".nav_transform1").hide();},100);
            navBool=false;
        }
    });

</script>
    </span> 
