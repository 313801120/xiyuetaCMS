<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../inc/Config.asp"-->
<!--#Include File = "admin_function.asp"-->
<!--#Include File = "admin_safe.Asp"-->
<%
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101) ,conn,1,1
if not rs.eof then 
version=rs(ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110))
end if:rs.close  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>xiyuetaCMS网站管理系统<%=version%></title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="layuiadmin/style/admin.css" media="all">
<script>
/^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
</script>
</head>
<body class="layui-layout-body">
<div id="LAY_app">
<div class="layui-layout layui-layout-admin">
<div class="layui-header">
<!-- 头部区域 -->
<ul class="layui-nav layui-layout-left">
<li class="layui-nav-item layadmin-flexible" lay-unselect>
<a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
<i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
</a>
</li>
<li class="layui-nav-item layui-hide-xs" lay-unselect>
<a href="<%=WEB_VIEWURL%>" target="_blank" title="前台">
<i class="layui-icon layui-icon-website"></i>
</a>
</li>
<%
if isAdminOnCRMShow then
%>
<li class="layui-nav-item layui-hide-xs" lay-unselect>
<a href="../crm" target="_blank" title="CRM页面">
<i class="layui-icon layui-icon-chrome"></i>
</a>
</li>
<%end if%>
<li class="layui-nav-item" lay-unselect>
<a href="javascript:;" layadmin-event="refresh" title="刷新">
<i class="layui-icon layui-icon-refresh-3"></i>
</a>
</li>
<li class="layui-nav-item layui-hide-xs" lay-unselect>
<input type="text" placeholder="搜索..." autocomplete="off" class="layui-input layui-input-search" layadmin-event="serach" lay-action="template/search.html?keywords=">
</li>
</ul>
<ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
<!-- 如果有新消息，则显示小圆点 -->
<!-- <li class="layui-nav-item" lay-unselect>
<a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">
<i class="layui-icon layui-icon-notice"></i>
<span class="layui-badge-dot"></span>
</a>
</li> -->
<!-- <li class="layui-nav-item layui-hide-xs" lay-unselect>
<a href="javascript:;" layadmin-event="theme">
<i class="layui-icon layui-icon-theme"></i>
</a>
</li> -->
<li class="layui-nav-item layui-hide-xs" lay-unselect>
<a href="javascript:;" layadmin-event="note">
<i class="layui-icon layui-icon-note"></i>
</a>
</li>
<li class="layui-nav-item layui-hide-xs" lay-unselect>
<a href="javascript:;" layadmin-event="fullscreen">
<i class="layui-icon layui-icon-screen-full"></i>
</a>
</li>
<li class="layui-nav-item" lay-unselect>
<a href="javascript:;">
<cite>
<%=userRs_nickname%>(<%=userRs_adminRoleTitle%>)</cite>
</a>
<dl class="layui-nav-child">
<dd><a lay-href="set/user/info.asp">基本资料</a></dd>
<dd><a lay-href="set/user/password.asp">修改密码</a></dd>
<dd><a lay-href="<%=WEB_VIEWURL & ChrW(63)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(61)&ChrW(49)%>">在线修改</a></dd> 
<dd><a href="<%=WEB_VIEWURL & ChrW(63)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(61)&ChrW(49)%>" target="_blank">新页在线修改</a></dd>
<hr>
<dd style="text-align: center;"><a href="<%=adminDir & ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)%>">退出</a></dd>
</dl>
</li>
<li class="layui-nav-item layui-hide-xs" lay-unselect>
<a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
</li>
<li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
<a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
</li>
</ul>
</div>
<!-- 侧边菜单 -->
<div class="layui-side layui-side-menu">
<div class="layui-side-scroll">
<div class="layui-logo" lay-href="home/console.asp">
<span>xiyuetaCMS</span>
</div>
<ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
<li data-name="home" class="layui-nav-item layui-nav-itemed">
<a href="javascript:;" lay-tips="主页" lay-direction="2">
<i class="layui-icon layui-icon-home"></i>
<cite>主页</cite>
</a>
<dl class="layui-nav-child">
<dd data-name="console" class="layui-this">
<a lay-href="home/console.asp">控制台</a>
</dd> 
<!-- <dd>
<a lay-href="home/console2.asp">控制台2</a>
</dd>  -->
</dl>
</li> 
<%if getip()=ChrW(49)&ChrW(50)&ChrW(55)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(49) then%>
<li data-name="user" class="layui-nav-item">
<a href="javascript:;" lay-tips="用户" lay-direction="2">
<i class="layui-icon layui-icon-user"></i>
<cite>界面生成</cite>
</a>
<dl class="layui-nav-child">
<!--                            <dd><a lay-href="app/layout_page/list.asp">layout_page</a></dd>
<dd><a lay-href="app/layout_page_config/list.asp">layout_page_config</a></dd>
<dd><a lay-href="app/layout_field/list.asp">layout_field</a></dd>
<dd style="padding:0; background:transparent;">
<hr style="border:none;border-top:1px dashed #444;margin:8px 0 8px 10px;width:85%;opacity:0.5;">
</dd>
-->
<dd><a lay-href="app/test_layout_page/list.asp">test_layout_page</a></dd> 
<dd><a lay-href="app/test_layout_page_config/list.asp">test_layout_page_config</a></dd> 
<!-- <dd><a lay-href="app/test_layout_search_list/list.asp">test_layout_search_list</a></dd>  -->
<!-- <dd><a lay-href="app/test_layout_sortrank_list/list.asp">test_layout_sortrank_list</a></dd>  -->
<dd><a lay-href="app/test_layout_table_button/list.asp">test_layout_table_button</a></dd> 
<dd><a lay-href="app/test_layout_table_action/list.asp">test_layout_table_action</a></dd> 
<dd><a lay-href="app/test_layout_table_toolbar/list.asp">test_layout_table_toolbar</a></dd> 
<dd><a lay-href="app/test_layout_listPage_form/list.asp">test_layout_listPage_form</a></dd> 
<dd><a lay-href="app/test_layout_action/list.asp">test_layout_action</a></dd> 
<dd><a lay-href="app/test_layout_field/list.asp">test_layout_field</a></dd> </dd> 
<dd><a lay-href="app/test_layout_database/list.asp">test_layout_database</a>
<dd><a lay-href="app/test_layout_database_table/list.asp">test_layout_database_table</a>
<dd><a lay-href="app/test_layout_database_field/list.asp">test_layout_database_field</a>
<dd><a lay-href="app/test_layout_cai/list.asp">test_layout_cai</a>
<dd><a lay-href="app/test_layout_cai_action/list.asp">test_layout_cai_action</a>
<dd style="padding:0; background:transparent;">
<hr style="border:none;border-top:1px dashed #444;margin:8px 0 8px 10px;width:85%;opacity:0.5;">
</dd>
<dd><a lay-href="app/test_admin/list.asp">test_admin</a></dd> 
<dd><a lay-href="app/test_xiyuetaclass/list.asp">test_xiyuetaclass</a></dd> 
<dd><a lay-href="app/test_newclass/list.asp">test_newclass</a></dd>
<dd><a lay-href="app/test_testuser/list.asp">test_testuser</a></dd> 
<dd><a lay-href="app/test_20250714/list.asp">test_20250714</a></dd> 
<dd><a lay-href="app/test_20250718/list.asp">test_20250718</a></dd>  
<dd style="padding:0; background:transparent;">
<hr style="border:none;border-top:1px dashed #444;margin:8px 0 8px 10px;width:85%;opacity:0.5;">
</dd>
<dd><a lay-href="app/test_website/list.asp">test_website</a></dd> 
<dd><a lay-href="app/test_webcolumn/list.asp">test_webcolumn</a></dd> 
<dd><a lay-href="app/test_articledetail/list.asp">test_articledetail</a></dd> 
<dd><a lay-href="app/test_articlepic/list.asp">test_articlepic</a></dd> 
<dd><a lay-href="app/test_articlecount/list.asp">test_articlecount</a></dd> 
<dd><a lay-href="app/test_articlemessage/list.asp">test_articlemessage</a></dd> 
<dd><a lay-href="app/test_articlemessagecount/list.asp">test_articlemessagecount</a></dd> 
<dd><a lay-href="app/test_articlesearch/list.asp">test_articlesearch</a></dd> 
<dd><a lay-href="app/test_guestbook/list.asp">test_guestbook</a></dd> 
<dd><a lay-href="app/test_onepage/list.asp">test_onepage</a></dd> 
<dd><a lay-href="app/test_friendlink/list.asp">test_friendlink</a></dd> 
<dd><a lay-href="app/test_sheshi/list.asp">test_sheshi</a></dd> 
<dd><a lay-href="app/test_testOneClass/list.asp">test_testOneClass</a></dd> 
<dd><a lay-href="app/test_testMoreClass/list.asp">test_testMoreClass</a></dd> 
<dd><a lay-href="app/sqlserver_ip_copy1/list.asp">sqlserver_ip_copy1</a></dd> 
<dd><a href="javascript:;" onclick="confirmBackup()">批量备份表</a></dd> 
</dl>
</li> 
<%
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&leftQuote&db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&rightQuote&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
if not rsx.eof then
%>
<li data-name="gllayou" class="layui-nav-item">
<a href="javascript:;" lay-tips="管理界面" lay-direction="2">
<i class="layui-icon layui-icon-template"></i>
<cite>管理界面</cite>
</a>
<dl class="layui-nav-child">
<%while not rsx.eof%>
<dd><a lay-href="app/<%=rsx(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))%>/list.asp"><%=rsx(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))%></a></dd>
<%rsx.movenext:wend%>
</dl>
</li>
<%end if:rsx.close%>
<li data-name="user" class="layui-nav-item">
<a href="javascript:;" lay-tips="用户" lay-direction="2">
<i class="layui-icon layui-icon-user"></i>
<cite>用户</cite>
</a>
<dl class="layui-nav-child">
<!-- <dd><a lay-href="user/user/list.asp">会员列表</a></dd>
<dd><a lay-href="user/administrators/list.asp">后台管理员</a></dd> -->
<dd><a lay-href="app/test_member/list.asp">会员列表</a></dd>
<dd><a lay-href="app/test_admin/list.asp">后台管理员</a></dd>
</dl>
</li> 
<li data-name="app" class="layui-nav-item">
<a href="javascript:;" lay-tips="应用" lay-direction="2">
<i class="layui-icon layui-icon-app"></i>
<cite>应用</cite>
</a>
<dl class="layui-nav-child">    
<dd class="layui-nav-itemed">
<a href="javascript:;">内容系统</a>
<dl class="layui-nav-child">
<dd><a lay-href="app/content/list.asp">文章管理</a></dd>
<!-- <dd><a lay-href="app/articlepic/list.asp">文章图片</a></dd> -->
<dd><a lay-href="app/articlecount/list.asp">文章统计</a></dd> 
<dd><a lay-href="app/articlemessage/list.asp">文章留言</a></dd>
<dd><a lay-href="app/tags/list.asp">文章标签</a></dd>
<dd><a lay-href="app/articlesearch/list.asp">文章搜索</a></dd>
</dl>
</dd>
<dd><a lay-href="app/order/list.asp">订单管理</a></dd>
<dd><a lay-href="app/order_buy_detail/list.asp">订单详细</a></dd>
<dd><a lay-href="app/content/tags.asp">分类管理</a></dd>
<dd><a lay-href="app/guestBook/list.asp">留言管理</a></dd>
<dd><a lay-href="app/OnePage/list.asp">单页管理</a></dd>
<dd><a lay-href="app/friendLink/list.asp">友情管理</a></dd> 
<dd><a lay-href="app/sheshi/list2.asp">省市县</a></dd>
<dd><a lay-href="app/xiyuetaclass/list.asp">分类</a></dd>
<!-- 
<dd><a lay-href="app/xiyueta/list.asp">xiyueta测试表</a></dd> 
<dd><a lay-href="app/test_1/list.asp">test_1</a></dd>  -->
</dl>
</li> 
<%end if%>
<li data-name="chat" class="layui-nav-item">
<a href="javascript:;" lay-tips="聊天管理" lay-direction="2">
<i class="layui-icon layui-icon-dollar"></i>
<cite>聊天管理</cite>
</a>
<dl class="layui-nav-child">                                 
<dd><a lay-href="app/chat/list.asp">聊天列表</a></dd> 
</dl>
</li> 
<li data-name="set" class="layui-nav-item">
<a href="javascript:;" lay-tips="设置" lay-direction="2">
<i class="layui-icon layui-icon-set"></i>
<cite>设置</cite>
</a>
<dl class="layui-nav-child">
<!-- <dd><a lay-href="set/system/website.asp">网站设置</a></dd> -->
<dd><a lay-href="app/test_website/list.asp">网站设置</a></dd>
<dd><a lay-href="set/user/info.asp">基本资料</a></dd>
<dd><a lay-href="set/user/password.asp">修改密码</a></dd>
<dd><a lay-href="set/system/Admin_Login_Allow_IP.asp">设置IP限制</a></dd> 
</dl>
</li>
<li data-name="template" class="layui-nav-item">
<a href="javascript:;" lay-tips="模板" lay-direction="2">
<i class="layui-icon layui-icon-template"></i>
<cite>模板</cite>
</a>
<dl class="layui-nav-child">
<dd><a lay-href="app/tpl/userlist.asp">模板库</a></dd>
<dd><a lay-href="http://res.xiyueta.com/">素材库</a></dd>
</dl>
</li>
<li data-name="system" class="layui-nav-item">
<a href="javascript:;" lay-tips="系统" lay-direction="2">
<i class="layui-icon layui-icon-senior"></i>
<cite>系统</cite>
</a>
<dl class="layui-nav-child">
<dd><a lay-href="system/count.asp">访问统计</a></dd>
<dd><a lay-href="system/pic.asp">上传图片管理</a></dd>
<!-- <dd><a lay-href="system/adminlog.asp">后台日志</a></dd> -->
<dd><a lay-href="app/test_systemlog/list.asp">后台日志</a></dd> 
<%if getip()=ChrW(49)&ChrW(50)&ChrW(55)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(49) then%>
<dd><a lay-href="app/iislog/list.asp">IIS日志</a></dd> 
<dd><a lay-href="app/iislog/iisipstat_list.asp">IIS统计IP</a></dd> 
<dd><a lay-href="app/iislog/iisURLstat_list.asp">IIS统计URL</a></dd> 
<%end if%>
<%if databaseType = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) then%>
<dd><a lay-href="system/backupDatabase.asp">备份恢复数据</a></dd>
<%elseif databaseType = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then%>
<dd><a lay-href="app/database/list.asp">SqlServer维护</a></dd> 
<%end if%>
<dd><a lay-href="app/sitemap/sitemap.asp">生成sitemap</a></dd> 
<dd><a lay-href="system/updatelog.asp">更新日志</a></dd>
</dl>
</li>
<%if getip()=ChrW(49)&ChrW(50)&ChrW(55)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(49) then%>
<li data-name="system" class="layui-nav-item">
<a href="javascript:;" lay-tips="记账" lay-direction="2">
<i class="layui-icon layui-icon-cart"></i>
<cite>记账</cite>
</a>
<dl class="layui-nav-child"> 
<dd><a lay-href="home/console_jz.asp">记账控制台</a></dd>
<dd><a lay-href="home/console_dashboard.asp" style="color:#7ad337">新版控制台</a></dd>
<dd><a lay-href="app/money/list.asp">收入支出</a></dd>
<dd><a lay-href="user/userjz/list.asp">会员统计</a></dd>
<dd><a lay-href="app/diary/list.asp">工作日记</a></dd> 
<%
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&leftQuote&db_PREFIX &ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&rightQuote&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not rs.eof
%>  
<dd class="layui-nav-item">
<a href="javascript:;">用户(<%=rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))%>)</a>
<dl class="layui-nav-child">
<dd><a lay-href="home/console_jz.asp?inadminid=<%=rs(ChrW(105)&ChrW(100))%>">控制台</a></dd>
<dd><a lay-href="home/console_dashboard.asp?inadminid=<%=rs(ChrW(105)&ChrW(100))%>" style="color:#7ad337">新版控制台</a></a></dd>
<dd><a lay-href="app/money/list.asp?inadminid=<%=rs(ChrW(105)&ChrW(100))%>">收入支出</a></dd>  
<dd><a lay-href="user/userjz/list.asp?inadminid=<%=rs(ChrW(105)&ChrW(100))%>">会员统计</a></dd>
</dl>
</dd>
<%rs.movenext:wend:rs.close%>
</dl>
</li>
<%end if%>
</ul>
</div>
</div>
<!-- 页面标签 -->
<div class="layadmin-pagetabs" id="LAY_app_tabs">
<div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
<div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
<div class="layui-icon layadmin-tabs-control layui-icon-down">
<ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
<li class="layui-nav-item" lay-unselect>
<a href="javascript:;"></a>
<dl class="layui-nav-child layui-anim-fadein">
<dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
<dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
<dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
</dl>
</li>
</ul>
</div>
<div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
<ul class="layui-tab-title" id="LAY_app_tabsheader">
<li lay-id="home/console.asp" lay-attr="home/console.asp" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
</ul>
</div>
</div>
<!-- 主体内容 -->
<div class="layui-body" id="LAY_app_body">
<div class="layadmin-tabsbody-item layui-show">
<iframe src="home/console.asp" frameborder="0" class="layadmin-iframe"></iframe>
</div>
</div>
<!-- 辅助元素，一般用于移动设备下遮罩 -->
<div class="layadmin-body-shade" layadmin-event="shade"></div>
</div>
</div>
<script src="layuiadmin/layui/layui.js"></script>
<script>
layui.config({
base: 'layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use('index');
/*只有备份表使用，暂时留着*/
// 批量备份表确认弹窗
function confirmBackup() {
layui.use('layer', function(){
var layer = layui.layer;
layer.confirm('确定要进入批量备份表页面吗？<br><br>此功能将备份系统中所有的数据表，包括表结构和数据。<br>备份操作可能需要较长时间，请确保系统稳定运行。', {
icon: 3,
title: '确认进入备份页面',
btn: ['确定', '取消']
}, function(index){
layer.close(index);
// 跳转到备份页面
openTabsPage('system/batchDatabaseTableData.asp', '批量备份表') 
});
});
} 
function openTabsPage(url, title) {
try {
// 尝试在父窗口中打开标签页
if (window.parent && window.parent.layui) {
window.parent.layui.index.openTabsPage(url, title);
} else if (window.top && window.top.layui) {
window.top.layui.index.openTabsPage(url, title);
} else {
// 如果无法访问父窗口，则直接跳转
window.location.href = url;
}
} catch (e) {
// 如果出错，则直接跳转
window.location.href = url;
}
}
/*只有备份表使用，暂时留着*/
//刷新当前tab的表格并保持当前页码 20251109
function reloadTable(){ 
// 备用方案：触发刷新按钮
var refreshBtn = document.querySelector('a[layadmin-event="refresh"]');
if (refreshBtn) {
refreshBtn.click();
}
}
</script><%=getServerVersion()%>
</body>
</html>
