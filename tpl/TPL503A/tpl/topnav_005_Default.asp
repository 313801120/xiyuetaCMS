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

cssName="topnav005" 
resurl="/web/tpl/topnav/005/"
 %>


    <!--页面头部-->
    <div class="header_showblock"></div> 
    <div class="header<%=cssName%>">
        <div class="topbar">
            <div class="container">
                <ul>
                    <li>
                        <a href="javascript:;">中文版</a>
                    </li>
                    <li class="pipe">|</li>
                    <li>
                        <a href="javascript:;">English</a>
                    </li>
                </ul>
                <span>欢迎访问<%=webcompany%></span>
            </div>
        </div>
        <div class="container clearfix">
            <a href="javascript:;" class="menu-btn">
                <span></span>
            </a>
            <div class="logo img-center">
                <a href="./" title="<%=webcompany%> "><img src="<%=weblogo%>" alt="<%=webcompany%> ">
                </a>
            </div>
            <div class="text">
                <strong><%=webcompany%></strong><%=getOnePageBody("topnav005_标语","专注网站制作10年！为企业打造专业的互联网营销解决方案")%>
            </div>

            <div class="tel">全国咨询热线：
                <strong><%=webphone%></strong>
            </div>
        </div>
        <div class="nav">
            <div class="container">
                <ul>


<%rs.open "select * from " & db_PREFIX & "webcolumn where parentid=-1 and isthrough=1 and flags like'%top%' order by sortrank asc" ,conn,1,1
for i=1 to rs.recordcount
if rs.eof then exit for
%>
 

<li class="dropdown<%=IIF(isFocusNav(rs)," active","")%>">
                    <a href="<%=getNavUrl(rs("id"),rs("columntype"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") & rs("columnname")%></a>
    <%rsx.open "select * from " & db_PREFIX & "webcolumn where parentId="& rs("id") &" and isThrough=1 order by sortrank asc" ,conn,1,1
    if not rsx.eof then        
    %>
        <div class="dropdown-box">
        <%while not rsx.eof%>
         <a href="<%=getNavUrl(rsx("id"),rsx("columnType"))%>"><%=IIF(rs("columnType")<>"home",uTitle,"") &rsx("columnname")%></a>
        <%rsx.movenext:wend%>
                </div>
                <%
                end if:rsx.close%>
                </li>
  
 
<%rs.movenext:next:rs.close%>
 

 
                </ul>
            </div>
        </div>
    </div>
<script>
$(function () { 
    $('.menu-btn').on('click', function () {
        $('.header<%=cssName%>').find('.nav').toggle();
    });

    $('.sc-btn').on('click', function () {
        $('.header<%=cssName%>').find('.sc-form').toggle();
    }); 
    if ($(window).width() > 991) {
        $('.dropdown').hover(function () {
            $(this).addClass('open');
        }, function () {
            $(this).removeClass('open');
        });
    } else {
        $('.dropdown').find('.arr').on('click', function () {
            $(this).parent().toggleClass('open');
        });
    }

    $('.lanmu').find('.arr').on('click', function () {
        $(this).parent().toggleClass('open');
    });

    $('.yunu-sou').find('form').submit(function () {
        var val = $(this).find('input').val();
        if (!val) {
            alert('请输入关键词');
            return false
        }
    });
})
</script>
