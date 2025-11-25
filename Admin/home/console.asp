<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../inc/Config.asp"-->
<!--#Include File = "../admin_function.asp"-->
<!--#Include File = "../admin_safe.Asp"-->
<% 
call openconn() 
dim totalVisits,dayVisits,sql,chatTotalVisits,chatDayVisits,activeUser,totalUser,i,sSel,narticlM,naritcleCount,tplname
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(117)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(112)&ChrW(108) then 

if isAdminPermission(ChrW(32534)&ChrW(36753)&ChrW(27169)&ChrW(26495)&ChrW(24211))=false then
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(27809)&ChrW(26377)&ChrW(26435)&ChrW(38480)&ChrW(65292)&ChrW(19981)&ChrW(21487)&ChrW(20999)&ChrW(25442)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(125)
Response.end()
end if
call useTpl2022(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47),request(ChrW(116)&ChrW(112)&ChrW(108))) 
response.write ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(24212)&ChrW(29992)&ChrW(25104)&ChrW(21151)&ChrW(33)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125)
Response.end()
end if

rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(118)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)),conn,1,1
totalVisits=IIF(isnull(rs(ChrW(116)&ChrW(112)&ChrW(118)))=true,0,rs(ChrW(116)&ChrW(112)&ChrW(118))):rs.close

rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(109)&ChrW(40)&ChrW(112)&ChrW(118)&ChrW(41)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(116)&ChrW(112)&ChrW(118)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediff(ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))&ChrW(61)&ChrW(48),conn,1,1
dayVisits=IIF(isnull(rs(ChrW(116)&ChrW(112)&ChrW(118)))=true,0,rs(ChrW(116)&ChrW(112)&ChrW(118))):rs.close 

chatTotalVisits=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(71)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(66)&ChrW(111)&ChrW(111)&ChrW(107)))(0)

chatDayVisits=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(71)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(66)&ChrW(111)&ChrW(111)&ChrW(107))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediff(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))&ChrW(61)&ChrW(48))(0)


narticlM=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediffMonth(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))&ChrW(61)&ChrW(48))(0)
naritcleCount=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)))(0)


activeUser=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)& getAccessDatediffYear(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))&ChrW(61)&ChrW(48))(0)

totalUser=conn.execute(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(42)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)))(0)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>主页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
<link rel="stylesheet" href="../layuiadmin/style/template.css" media="all">
<style>
.cmdlist-container.active{background:#fbe9e9 !important;}
.quick-nav{margin:-5px;}
.quick-nav .qn-item{display:block;border:1px solid #e6e6e6;border-radius:6px;padding:16px;background:#fff;transition:all .2s;margin:5px;}
.quick-nav .qn-item:hover{box-shadow:0 2px 12px rgba(0,0,0,.08);transform:translateY(-2px)}
.quick-nav .qn-icon{width:44px;height:44px;border-radius:50%;display:flex;align-items:center;justify-content:center;margin-right:12px;color:#fff}
.quick-nav .qn-title{font-size:16px;font-weight:600;}
.quick-nav .qn-desc{color:#888;margin-top:4px;font-size:12px}
.qn-blue{background:#16b777}
.qn-orange{background:#ffb800}
/* Mobile optimizations */
@media screen and (max-width: 768px){
.quick-nav .qn-item{padding:14px}
}
.quick-nav .qn-title{white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.quick-nav .qn-desc{word-break:break-all}
</style>
</style>
</head>
<body>
<div class="layui-fluid">
<div class="layui-row layui-col-space15">
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
访问量
<span class="layui-badge layui-bg-blue layuiadmin-badge">天</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%=dayVisits%>
</p>
<p>
总计访问量
<span class="layuiadmin-span-color">
<%=totalVisits%> <i class="layui-inline layui-icon layui-icon-flag"></i></span>
</p>
</div>
</div>
</div>
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
留言
<span class="layui-badge layui-bg-cyan layuiadmin-badge">周</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%=chatTotalVisits%>
</p>
<p>
新留言
<span class="layuiadmin-span-color">
<%=chatDayVisits%> <i class="layui-inline layui-icon layui-icon-face-smile-b"></i></span>
</p>
</div>
</div>
</div>
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
活跃用户
<span class="layui-badge layui-bg-orange layuiadmin-badge">月</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%=activeUser%>
</p>
<p>
总用户数
<span class="layuiadmin-span-color">
<%=totalUser%> <i class="layui-inline layui-icon layui-icon-user"></i></span>
</p>
</div>
</div>
</div>
<div class="layui-col-sm6 layui-col-md3">
<div class="layui-card">
<div class="layui-card-header">
发布
<span class="layui-badge layui-bg-green layuiadmin-badge">月</span>
</div>
<div class="layui-card-body layuiadmin-card-list">
<p class="layuiadmin-big-font">
<%=narticlM%>
</p>
<p>
总文章
<span class="layuiadmin-span-color">
<%=naritcleCount%><i class="layui-inline layui-icon layui-icon-read"></i></span>
</p>
</div>
</div>
</div>
<!--             <div class="layui-col-sm12">
<div class="layui-card">
<div class="layui-card-header">每日一言
<div class="layui-btn-group layuiadmin-btn-group">
<a href="javascript:;" id="refresh-yiyan" class="layui-btn layui-btn-primary layui-btn-xs">刷新</a>
</div>
</div>
<div class="layui-card-body">
<div id="yiyan-content" style="padding: 20px; text-align: center; font-size: 16px; line-height: 1.8; color: #666;">
<i class="layui-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop"></i> 加载中...
</div>
</div>
</div>
</div> -->
<div class="layui-col-sm12">
<div class="layui-card">
<div class="layui-card-header">快速导航 
<div class="layui-btn-group layuiadmin-btn-group">
</div>
</div>
<div class="layui-card-body">
<div class="layui-row quick-nav">
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_layout_database/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-blue">
<i class="layui-icon layui-icon-engine"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">test_layout_database</div>
<div class="qn-desc">数据库布局示例，快速进入进行查看与调试</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_layout_page/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-orange">
<i class="layui-icon layui-icon-template-1"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">test_layout_page</div>
<div class="qn-desc">页面布局示例，快速进入查看与调试</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_webcolumn/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-blue">
<i class="layui-icon layui-icon-location"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">网站导航管理</div>
<div class="qn-desc">管理网站导航分类，快速进入导航设置</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_articledetail/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-orange">
<i class="layui-icon layui-icon-read"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">文章管理列表</div>
<div class="qn-desc">管理网站文章内容，快速进入文章编辑</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_admin/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-blue">
<i class="layui-icon layui-icon-user"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">管理员管理</div>
<div class="qn-desc">管理系统管理员账户，权限设置</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_admin_role/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-orange">
<i class="layui-icon layui-icon-user"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">管理员角色管理</div>
<div class="qn-desc">管理管理员角色权限，角色配置</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_member/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-orange">
<i class="layui-icon layui-icon-group"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">会员管理</div>
<div class="qn-desc">管理网站会员用户，用户信息维护</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_website/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-blue">
<i class="layui-icon layui-icon-set"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">网站配置管理</div>
<div class="qn-desc">管理网站基本配置，系统参数设置</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_onepage/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-orange">
<i class="layui-icon layui-icon-file"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">单页管理</div>
<div class="qn-desc">管理网站单页面内容，页面编辑维护</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_friendlink/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-blue">
<i class="layui-icon layui-icon-link"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">友情链接管理</div>
<div class="qn-desc">管理网站友情链接，链接审核维护</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_htmlFile/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-orange">
<i class="layui-icon layui-icon-code-circle"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">生成HTML文件</div>
<div class="qn-desc">管理HTML文件生成，静态页面维护</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_sheshi/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-blue">
<i class="layui-icon layui-icon-location"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">省市分类</div>
<div class="qn-desc">管理省市分类数据，地区信息维护</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_guestbook/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-orange">
<i class="layui-icon layui-icon-dialogue"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">在线留言</div>
<div class="qn-desc">管理网站在线留言，留言审核回复</div>
</div>
</div>
</a>
</div>
<div class="layui-col-xs12 layui-col-sm3">
<a lay-href="app/test_systemlog/list.asp" class="qn-item">
<div class="layui-row">
<div class="layui-col-xs2">
<div class="qn-icon qn-blue">
<i class="layui-icon layui-icon-log"></i>
</div>
</div>
<div class="layui-col-xs10">
<div class="qn-title">后台日志</div>
<div class="qn-desc">管理系统后台日志，操作记录查看</div>
</div>
</div>
</a>
</div>
</div>
</div>
</div>
</div>
<%

if isAdminPermission(ChrW(27169)&ChrW(26495)&ChrW(24211))=true then
%>
<div class="layui-col-sm12">
<div class="layui-card">
<div class="layui-card-header">本地模板 
<div class="layui-btn-group layuiadmin-btn-group">
<a lay-href="app/tpl/userlist.asp" class="layui-btn layui-btn-primary layui-btn-xs">更多模板</a>
</div>
</div>
<div class="layui-card-body"> 
<%
dim contnet,splstr,folderName,img

rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)),conn,1,1
if not rs.eof then
tplname=rs(ChrW(116)&ChrW(112)&ChrW(108)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
end if:rs.close
contnet=getDirFolderNameList(ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47))

splstr=split(contnet,vbcrlf)
for each folderName in splstr
if left(folderName,1) <>ChrW(35) then
img=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) & folderName & ChrW(47) &folderName&ChrW(46)&ChrW(106)&ChrW(112)&ChrW(103)
if checkFile(img)=false then
img=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(47) & folderName&ChrW(46)&ChrW(106)&ChrW(112)&ChrW(103)
if checkFile(img)=false then
img=ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(47)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(46)&ChrW(106)&ChrW(112)&ChrW(103)
end if
end if
%>
<div class="layui-col-md2 layui-col-sm4" style="padding:10px;">
<div class="cmdlist-container<%=IIF(folderName=tplname,ChrW(32)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(118)&ChrW(101),"")%>" style="border:1px solid #000;background:#fff;">
<img src="<%=img%>">
<div class="cmdlist-text">
<p class="info">编号：
<%=folderName%>
</p>
<div class="price">
<a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-normal yinyongmb" title="<%=folderName%>">
应用
</a>
<span class="flow">
<a href="<%=ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47) & folderName & ChrW(47)%>" target="_blank" class="layui-btn layui-btn-xs ">
查看
</a>
</span>
</div>
</div>
</a>
</div>
</div>
<%end if:next%>
<div style="clear:both;"></div>
</div>
</div>
</div>
<%
end if
%>
<div class="layui-col-sm12">
<div class="layui-card">
<div class="layui-card-header">
访问量
<div class="layui-btn-group layuiadmin-btn-group">
<a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs">去年</a>
<a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs">今年</a>
</div>
</div>
<div class="layui-card-body">
<div class="layui-row">
<div class="layui-col-sm8">
<div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-pagetwo">
<div carousel-item id="LAY-index-pagetwoA">
<div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
</div>
</div>
</div>
<div class="layui-col-sm4">
<div class="layuiadmin-card-list">
<p class="layuiadmin-normal-font">月访问数</p>
<span>同上期增长</span>
<div class="layui-progress layui-progress-big" lay-showPercent="yes">
<div class="layui-progress-bar" lay-percent="30%"></div>
</div>
</div>
<div class="layuiadmin-card-list">
<p class="layuiadmin-normal-font">月下载数</p>
<span>同上期增长</span>
<div class="layui-progress layui-progress-big" lay-showPercent="yes">
<div class="layui-progress-bar" lay-percent="20%"></div>
</div>
</div>
<div class="layuiadmin-card-list">
<p class="layuiadmin-normal-font">月收入</p>
<span>同上期增长</span>
<div class="layui-progress layui-progress-big" lay-showPercent="yes">
<div class="layui-progress-bar" lay-percent="25%"></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="layui-col-sm4">
<div class="layui-card">
<div class="layui-card-header">用户留言</div>
<div class="layui-card-body">
<ul class="layuiadmin-card-status layuiadmin-home2-usernote">
<%  
dim nickname
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(53)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(71)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(66)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(71)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(66)&ChrW(111)&ChrW(111)&ChrW(107)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(32)&ChrW(32)&ChrW(76)&ChrW(73)&ChrW(77)&ChrW(73)&ChrW(84)&ChrW(32)&ChrW(53)
end if
rs.open sql,conn,1,1
while not rs.eof
%>
<li>
<h3>
<%=rs(ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))%>
</h3>
<p>
<%=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))%>
</p>
<span>
<%=rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101))%></span>
<a href="javascript:;" layadmin-event="replyNote" data-id="7" class="layui-btn layui-btn-xs layuiadmin-reply">回复</a>
</li>
<%rs.movenext:wend:rs.close%>
</ul>
</div>
</div>
</div>
<div class="layui-col-sm8">
<div class="layui-row layui-col-space15">
<div class="layui-col-sm6">
<div class="layui-card">
<div class="layui-card-header">本周活跃用户列表</div>
<div class="layui-card-body">
<table class="layui-table layuiadmin-page-table" lay-skin="line">
<thead>
<tr>
<th>用户名</th>
<th><i class="layui-icon layui-icon-log"></i>最后登录</th>
<th>状态</th>
<th>审核状态</th>
</tr>
</thead>
<tbody>
<%
dim n
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(55)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & addPrefix(ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then 
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & addPrefix(ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(32)&ChrW(32)&ChrW(76)&ChrW(73)&ChrW(77)&ChrW(73)&ChrW(84)&ChrW(32)&ChrW(55)
end if
rs.open sql,conn,1,1
for i=1 to 7
if rs.eof then exit for
sSel=""
if i=1 then
sSel=ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(102)&ChrW(105)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(39)
elseif i=2 then
sSel=ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(115)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(100)&ChrW(39)
elseif i=3 then
sSel=ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(114)&ChrW(100)&ChrW(39)
end if
n=dateDiff(ChrW(110), rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)), now()) 
%>
<tr>
<td>
<span<%=sSel%>>
<%=rs(ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))%></span>
</td>
<td>
<%=getHandleHowLongAgoTime(rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)))%>
</td>
<td>
<%=IIF(n <=10,ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(22312)&ChrW(32447)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62),ChrW(60)&ChrW(105)&ChrW(62)&ChrW(31163)&ChrW(32447)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62))%>
</td>
<td>
<%=IIF(rs(ChrW(105)&ChrW(115)&ChrW(84)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=0,ChrW(21542),ChrW(26159))%>
</td>
</tr>
<%
rs.movenext:next:rs.close
%>
</tbody>
</table>
</div>
</div>
</div>
<div class="layui-col-sm6">
<div class="layui-card">
<div class="layui-card-header">项目进展</div>
<div class="layui-card-body">
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<table id="LAY-index-prograss"></table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<script src="../layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script>
layui.config({
base: '../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'sample', 'yun', 'laypage', 'layer'],function(){
$(".yinyongmb").click(function() {  
var tpl=$(this).attr("title");
var thisObj=this;
layer.confirm('确定要使用模板（'+tpl+'）吗？', { icon: 3, title: '提示信息' }, function(index) {
$.ajax({
type: "POST",
cache: true, 
dataType: "json",
url: "?act=usetpl",
data: { "tpl": tpl },
success: function(data) {
switch (data.status) {
case "y": 
layer.msg(data.info); 
// 移除所有模板的选中状态
$(".cmdlist-container").removeClass("active");
// 给当前选中的模板添加选中状态
$(thisObj).closest(".cmdlist-container").addClass("active");
break;
case "n":
layer.msg(data.info, {icon: 2});
break;
}
}
});
layer.close(index);
});
})
// 一言功能
function loadHitokoto() {
$("#yiyan-content").html('<i class="layui-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop"></i> 加载中...');
$.ajax({
type: "GET",
url: "../../api/yiyan/default.asp",
data: {
_t: new Date().getTime()
},
dataType: "json",
cache: false,
success: function(res) {
var hit = res.hitokoto || "今晚星光真好";
var from = res.from || "一言";
var content = '<div style="font-size: 18px; color: #333; margin-bottom: 10px;">' + hit + '</div>';
content += '<div style="font-size: 14px; color: #999;">—— ' + from + '</div>';
$("#yiyan-content").html(content);
},
error: function() {
$("#yiyan-content").html('<div style="color: #999;">晚上好！去聊吧找友友聊聊？</div>');
}
});
}
// 页面加载时获取一言
loadHitokoto();
// 点击刷新按钮
$(document).on("click", "#refresh-yiyan", function() {
loadHitokoto();
});
});
</script>
</body>
</html>