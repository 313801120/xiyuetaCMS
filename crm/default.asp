<!--#include file="../inc/Config.asp"-->
<!--#Include File = "../admin/admin_function.asp"-->
<!--#Include File = "../admin/admin_safe.Asp"--><%
dim divDataId:divDataId=750
function getNewDataId()  '获得新的data id'
  divDataId=divDataId+1
  getNewDataId=divDataId
end function
%><!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit"/>
<meta name="force-rendering" content="webkit"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="shortcut icon" href="./theme/favicon.ico" />
<title>CRM管理系统</title>
<img id="loading" src="./theme/jinkecrm/images/loading.gif" style="position:absolute;top:50%;left:50%;margin-top:-47px;margin-left:-73px;">
<link rel="stylesheet" type="text/css" href="./theme/windows/css/main.css?v=17.0-231011" />
<link rel='stylesheet' type="text/css" href="./theme/jinkecrm/css/font-awesome.min.css?v=17.0-231011">
<link rel="stylesheet" type="text/css" href="./theme/layui/css/layui.css?v=17.0-231011">
<link rel="stylesheet" type="text/css" href="./theme/windows/css/desktop.css?v=17.0-231011">
<script type="text/javascript" src="./theme/jinkecrm/js/jquery-1.11.2.min.js?v=17.0-231011"></script>
<script type="text/javascript" src="./theme/jinkecrm/js/jquery.artDialog.js?skin=chrome"></script>
<script type="text/javascript" src="./theme/layui/layer/layer.js?v=17.0-231011"></script>

<style>
body { background:#1982BF url(./theme/windows/bg/bg2.jpg) no-repeat; background-size:cover; }
</style>
<script>
var desk_bianqian=1; //桌面便签
var desk_xitong=1;  //桌面提醒
var user_ziliao=1;  //显示个人资料

 
</script>
</head><body>
<link rel="stylesheet" type="text/css" href="./theme/jinkecrm/css/llq.css" />
<div style="display: none" id="browser_ie">
  <div class=brower_info>
    <div class=notice_info>
      <p>你的浏览器版本过低，可能导致页面不能正常访问！<br>
        为了你能正常使用系统功能，请升级您的浏览器。</p>
    </div>
    <div class=browser_list> <span> <a href="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&tn=02049043_69_pg&wd=%E6%90%9C%E7%8B%97%E6%B5%8F%E8%A7%88%E5%99%A8&oq=%2526lt%253B60%25E6%25B5%258F%25E8%25A7%2588%25E5%2599%25A8&rsv_pq=e4bd1e01000995ca&rsv_t=1400tQHsp75aW1vXMTDlqjswNFdaWBy104nRGlLIuuxjZi68Z392U%2F9zdXBJzPglycbOAk0&rqlang=cn&rsv_enter=1&inputT=1510&rsv_sug3=4&rsv_sug1=4&rsv_sug7=100&rsv_sug2=0&rsv_sug4=1511" target=_blank> <img src="./theme/jinkecrm/images/llq/01.png"><br>
      搜狗 </a> </span> <span><a href="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&tn=02049043_69_pg&wd=360%E6%B5%8F%E8%A7%88%E5%99%A8&oq=chrome%2520%25E6%25B5%258F%25E8%25A7%2588%25E5%2599%25A8&rsv_pq=ab1aef5f000a1139&rsv_t=3ca1BKN7Lvd49bt1glan%2F2tuvA1ZTTCtbFpbNre0M%2Fkf%2B5S4NHsc8YsjQ2xd0%2BQY%2B4E4AGI&rqlang=cn&rsv_enter=1&rsv_sug3=2&rsv_sug1=2&rsv_sug7=100&bs=chrome%20%E6%B5%8F%E8%A7%88%E5%99%A8" target=_blank><img
            src="./theme/jinkecrm/images/llq/02.png"><br>
      360 </a></span> <span><a href="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&tn=02049043_69_pg&wd=chrome%E6%B5%8F%E8%A7%88%E5%99%A8&oq=chrome%2520%25E6%25B5%258F%25E8%25A7%2588%25E5%2599%25A8&rsv_pq=c45d0a2100096dc1&rsv_t=5ecdy5aEl6aEQglzXH%2FRcNY%2F2CFz1GMT2FBGFxUOSX48GIm5n%2Fw4yFwV6Zkq0RlMIkn6fsU&rqlang=cn&rsv_enter=1&inputT=310&rsv_sug3=6&rsv_sug1=6&rsv_sug7=100&rsv_sug2=0&rsv_sug4=1084" target=_blank><img
            src="./theme/jinkecrm/images/llq/04.png"><br>
      chrome </a></span> <span><a href="https://support.microsoft.com/zh-cn/help/17621/internet-explorer-downloads" target=_blank><img
            src="./theme/jinkecrm/images/llq/03.png"><br>
      ie9及以上 </a></span> </div>
    <div class="clearxx"></div>
    <div class="tipxx">请注意使用浏览器极速模式：</div>
    <img src="./theme/jinkecrm/images/llq/jisu.jpg" width="700px;" style="border:1px solid #ddd;"> </div>
</div>
<SCRIPT>
$(function(){
if (!$.support.leadingWhitespace) {
 $("#browser_ie").show();
 $(".logo_box").hide();
}
})
</SCRIPT>

<div id="desktop" style="position: static;">
  <div class="applist layui-anim layui-anim-upbit">
    <ul>
      
      <li class="desk_app desk-app" href="/admin/user/user/list.asp" data-id="<%=getNewDataId()%>" data-title="会员管理" data-icon="iconfont icon-fcstubiao17 icon-fcstubiao17-bg" data-width="" data-height="">
        <div class="appicon icon-fcstubiao17-bg"><i class="iconfont icon-fcstubiao17" style="color:#fff"></i></div>
        <div class="appname"> 会员管理 </div>
      </li>
      
      <!-- <li class="desk_app desk-app" href="gendanlist.asp" data-id="102" data-title="跟单管理" data-icon="iconfont icon-iconfontguanli icon-iconfontguanli-bg" data-width="" data-height="">
        <div class="appicon icon-iconfontguanli-bg"><i class="iconfont icon-iconfontguanli icon-iconfontguanli-bg" style="color:#fff"></i></div>
        <div class="appname"> 跟单管理 </div>
      </li> -->
      
      <!-- <li class="desk_app desk-app" href="orderlist.asp" data-id="103" data-title="订单管理" data-icon="iconfont icon-tubiao30 icon-tubiao30-bg" data-width="" data-height="">
        <div class="appicon icon-tubiao30-bg"><i class="iconfont icon-tubiao30 icon-tubiao30-bg" style="color:#fff"></i></div>
        <div class="appname"> 订单管理 </div>
      </li> -->
      
      <li class="desk_app desk-app" href="/admin/app/articlesearch/list.asp" data-id="<%=getNewDataId()%>" data-title="文章搜索" data-icon="iconfont icon-hetongguanli icon-hetongguanli-bg" data-width="" data-height="">
        <div class="appicon icon-hetongguanli-bg"><i class="iconfont icon-hetongguanli icon-hetongguanli-bg" style="color:#fff"></i></div>
        <div class="appname"> 文章搜索 </div>
      </li>
      
     <!--  <li class="desk_app desk-app" href="shouhoulist.asp" data-id="105" data-title="售后管理" data-icon="iconfont icon-fuwu4 icon-fuwu4-bg" data-width="" data-height="">
        <div class="appicon icon-fuwu4-bg"><i class="iconfont icon-fuwu4 icon-fuwu4-bg" style="color:#fff"></i></div>
        <div class="appname"> 售后管理 </div>
      </li>
      --> 
      <li class="desk_app desk-app" href="/admin/app/content/list.asp" data-id="<%=getNewDataId()%>" data-title="文章管理" data-icon="iconfont icon-gongdan icon-gongdan-bg" data-width="" data-height="">
        <div class="appicon icon-gongdan-bg"><i class="iconfont icon-gongdan icon-gongdan-bg" style="color:#fff"></i></div>
        <div class="appname"> 文章管理 </div>
      </li>
      
      <li class="desk_app desk-app" href="/admin/app/webcolumnparam/list.asp" data-id="<%=getNewDataId()%>" data-title="网站制作参数" data-icon="iconfont icon-caiwuguanli icon-caiwuguanli-bg" data-width="" data-height="">
        <div class="appicon icon-caiwuguanli-bg"><i class="iconfont icon-caiwuguanli icon-caiwuguanli-bg" style="color:#fff"></i></div>
        <div class="appname"> 网站制作参数 </div>
      </li>
      
      <li class="desk_app desk-app" href="/admin/app/tags/list.asp" data-id="<%=getNewDataId()%>" data-title="文章标签" data-icon="iconfont icon-ziyuanku icon-ziyuanku-bg" data-width="" data-height="">
        <div class="appicon icon-ziyuanku-bg"><i class="iconfont icon-ziyuanku icon-ziyuanku-bg" style="color:#fff"></i></div>
        <div class="appname"> 文章标签 </div>
      </li>
      
<!--       <li class="desk_app desk-app" href="huishouzhan.asp" data-id="109" data-title="回 收 站" data-icon="iconfont icon-icon15 icon-icon15-bg" data-width="" data-height="">
        <div class="appicon icon-icon15-bg"><i class="iconfont icon-icon15 icon-icon15-bg" style="color:#fff"></i></div>
        <div class="appname"> 回 收 站 </div>
      </li> -->
      
      <li class="desk_app desk-app" href="/admin/app/sheshi/list2.asp" data-id="<%=getNewDataId()%>" data-title="省市县2" data-icon="iconfont icon-chanpin icon-chanpin-bg" data-width="" data-height="">
        <div class="appicon icon-chanpin-bg"><i class="iconfont icon-chanpin icon-chanpin-bg" style="color:#fff"></i></div>
        <div class="appname"> 省市县2 </div>
      </li>
      
      <li class="desk_app desk-app" href="/admin/app/articlecount/list.asp" data-id="<%=getNewDataId()%>" data-title="文章统计" data-icon="iconfont icon-shujutongji icon-shujutongji-bg" data-width="" data-height="">
        <div class="appicon icon-shujutongji-bg"><i class="iconfont icon-shujutongji icon-shujutongji-bg" style="color:#fff"></i></div>
        <div class="appname"> 文章统计 </div>
      </li>
      
      <li class="desk_app desk-app" href="/admin/app/friendLink/list.asp" data-id="<%=getNewDataId()%>" data-title="友情列表" data-icon="iconfont icon-tongxunlu icon-tongxunlu-bg" data-width="" data-height="">
        <div class="appicon icon-tongxunlu-bg"><i class="iconfont icon-tongxunlu icon-tongxunlu-bg" style="color:#fff"></i></div>
        <div class="appname"> 友情列表 </div>
      </li>
      
<!--       <li class="desk_app desk-app" href="gonggao.asp" data-id="112" data-title="内部公告" data-icon="iconfont icon-id-321 icon-id-321-bg" data-width="" data-height="">
        <div class="appicon icon-id-321-bg"><i class="iconfont icon-id-321 icon-id-321-bg" style="color:#fff"></i></div>
        <div class="appname"> 内部公告 </div>
      </li> -->
      
      <li class="desk_app desk-app" href="/admin/app/OnePage/list.asp" data-id="<%=getNewDataId()%>" data-title="单页列表" data-icon="iconfont icon-zhichi icon-zhichi-bg" data-width="" data-height="">
        <div class="appicon icon-zhichi-bg"><i class="iconfont icon-zhichi icon-zhichi-bg" style="color:#fff"></i></div>
        <div class="appname"> 单页列表 </div>
      </li>
      
      <li class="desk_app desk-app" href="/admin/app/articlemessage/list.asp" data-id="<%=getNewDataId()%>" data-title="文章留言" data-icon="iconfont icon-baogaoxuanze icon-baogaoxuanze-bg" data-width="" data-height="">
        <div class="appicon icon-baogaoxuanze-bg"><i class="iconfont icon-baogaoxuanze icon-baogaoxuanze-bg" style="color:#fff"></i></div>
        <div class="appname"> 文章留言 </div>
      </li>
      
      <li class="desk_app desk-app" href="/admin/app/content/tags.asp" data-id="<%=getNewDataId()%>" data-title="分类管理" data-icon="iconfont icon-wenjianjiadakai icon-wenjianjiadakai-bg" data-width="" data-height="">
        <div class="appicon icon-wenjianjiadakai-bg"><i class="iconfont icon-wenjianjiadakai icon-wenjianjiadakai-bg" style="color:#fff"></i></div>
        <div class="appname"> 分类管理 </div>
      </li>
      
      <li class="desk_app desk-app" href="/admin/user/administrators/list.asp" data-id="<%=getNewDataId()%>" data-title="员工管理" data-icon="iconfont icon-role icon-role-bg" data-width="" data-height="">
        <div class="appicon icon-role-bg"><i class="iconfont icon-role icon-role-bg" style="color:#fff"></i></div>
        <div class="appname"> 员工管理 </div>
      </li>
      
    </ul>
  </div>
  <div class="bottombar">
    <div id="taskcontainer" class="taskcontainer"> </div>
  </div>
  <div class="bottomtask_right">
    <div class="taskbar-time"> <span id="time-hs"></span><br>
      <span id="time-ymd"></span> </div>
    
    <div class="taskbar-chat" title="内部聊天" id="layui-layim-no"> <i class="fa fa-comment-o icon-task-i fa-commenting-o on-new-msg"></i> </div>
    
    <div class="taskbar-msg desk-app" href="/admin/app/guestBook/list.asp" data-id="<%=getNewDataId()%>" data-title="留言信息" data-icon="fa-envelope-o" data-width="1000" data-height="550"> <i class="fa fa-envelope-o icon-task-i on-new-msg"></i> </div>

  </div>
  <div class="tackbar-showdesk" onClick="show_desktop()"></div>
  <div class="bottombarBgTask"></div>
</div>

<div id="startmenu" class="desk_page" style="z-index: 10;display: none;">
  <ul id="programs">
    <div class="programs_menu">
      
<!--       <li class="start_menu_app desk-app" href="daoru.asp" data-id="210" data-title="数据导入" data-icon="iconfont icon-daoru icon-daoru-bg" data-width="1000" data-height="500">
        <div class="menu_left"><i class="iconfont icon-daoru icon-daoru-bg" style="color:#fff"></i>数据导入</div>
      </li>
      
      <li class="start_menu_app desk-app" href="daochu.asp" data-id="211" data-title="数据导出" data-icon="iconfont icon-daochu icon-daochu-bg" data-width="1000" data-height="500">
        <div class="menu_left"><i class="iconfont icon-daochu icon-daochu-bg" style="color:#fff"></i>数据导出</div>
      </li>
      
      <li class="start_menu_app desk-app" href="mingpian.asp" data-id="201" data-title="客户名片夹" data-icon="iconfont icon-mingpianjia icon-mingpianjia-bg" data-width="1100" data-height="550">
        <div class="menu_left"><i class="iconfont icon-mingpianjia icon-mingpianjia-bg" style="color:#fff"></i>客户名片夹</div>
      </li>
      
      <li class="start_menu_app desk-app" href="shengri.asp" data-id="203" data-title="客户生日提醒" data-icon="iconfont icon-tixing icon-tixing-bg" data-width="1000" data-height="500">
        <div class="menu_left"><i class="iconfont icon-tixing icon-tixing-bg" style="color:#fff"></i>客户生日提醒</div>
      </li>
      
      <li class="start_menu_app desk-app" href="/crm/sms/send1.asp" data-id="204" data-title="短信管理" data-icon="iconfont icon-ht_notice icon-ht_notice-bg" data-width="1000" data-height="500">
        <div class="menu_left"><i class="iconfont icon-ht_notice icon-ht_notice-bg" style="color:#fff"></i>短信管理</div>
      </li>
      
      <li class="start_menu_app desk-app" href="/crm/mail/sendemail.asp" data-id="205" data-title="邮件管理" data-icon="iconfont icon-mingpianjia icon-email-bg" data-width="1000" data-height="500">
        <div class="menu_left"><i class="iconfont icon-email icon-email-bg" style="color:#fff"></i>邮件管理</div>
      </li>
      


      
      <li class="start_menu_app desk-app" href="backup.asp" data-id="210" data-title="数据备份设置" data-icon="fa fa-database icon-bak-bg" data-width="1000" data-height="500">
        <div class="menu_left"><i class="fa fa-database icon-bak-bg" style="color:#fff"></i>数据备份设置</div>
      </li>
      
      <li class="start_menu_app desk-app" href="log_zhuanyi.asp" data-id="2010" data-title="客户转移记录" data-icon="iconfont icon-zyjl icon-zyjl-bg" data-width="1250" data-height="600">
        <div class="menu_left"><i class="fa fa-random icon-zyjl-bg" style="color:#fff"></i>客户转移记录</div>
      </li> -->

      <li class="start_menu_app desk-app" href="/admin/app/iislog/list.asp" data-id="<%=getNewDataId()%>" data-title="IIS日志" data-icon="iconfont icon-czrz icon-czrz-bg" data-width="1100" data-height="550">
        <div class="menu_left"><i class="iconfont icon-czrz icon-czrz-bg" style="color:#fff"></i>IIS日志</div>
      </li>
      
      <li class="start_menu_app desk-app" href="/admin/app/iislog/iisURLstat_list.asp" data-id="<%=getNewDataId()%>" data-title="IIS统计URL" data-icon="iconfont icon-czrz icon-czrz-bg" data-width="1100" data-height="550">
        <div class="menu_left"><i class="iconfont icon-czrz icon-zyjl-bg" style="color:#fff"></i>IIS统计URL</div>
      </li>
      
      <li class="start_menu_app desk-app" href="/admin/app/iislog/iisipstat_list.asp" data-id="<%=getNewDataId()%>" data-title="IIS统计IP" data-icon="iconfont icon-dlrz icon-dlrz-bg" data-width="1100" data-height="550">
        <div class="menu_left"><i class="iconfont icon-dlrz icon-dlrz-bg" style="color:#fff"></i>IIS统计IP</div>
      </li>      

      <li class="start_menu_app desk-app" href="/admin/app/sitemap/sitemap.asp" data-id="<%=getNewDataId()%>" data-title="生成sitemap.xml" data-icon="fa fa-database icon-bak-bg" data-width="1000" data-height="500">
        <div class="menu_left"><i class="fa fa-sitemap icon-bak-bg" style="color:#fff"></i>生成sitemap.xml</div>
      </li>

      <li class="start_menu_app desk-app" href="/admin/set/user/password.asp" data-id="<%=getNewDataId()%>" data-title="修改密码" data-icon="fa fa-compass icon-tiaopei-bg" data-width="1000" data-height="500">
        <div class="menu_left"><i class="fa fa-compass icon-tiaopei-bg" style="color:#fff"></i>修改密码</div>
      </li>

      <li class="start_menu_app desk-app" href="/admin/set/system/Admin_Login_Allow_IP.asp" data-id="<%=getNewDataId()%>" data-title="设置IP限制" data-icon="fa fa-pencil icon-cheliang-bg">
        <div class="menu_left"><i class="fa fa-pencil icon-cheliang-bg" style="color:#fff"></i>设置IP限制</div>
      </li>
      
      
    </div>
  </ul>
  <ul id="links">
    <div class="menu_tip">系统应用<i class="fa fa-navicon"></i></div>
    <div class="rightlist">
      
      <li style="background:#33BD85;"> <a class="start_menu_app desk-app" href="/admin/set/system/website.asp" data-id="<%=getNewDataId()%>" data-title="系统设置" data-icon="fa-gear" data-width="1020" data-height="560"><i class="fa fa-gear"></i><br>
        系统设置</a></li>
      
      <li style="background:#00b6de;"><a class="start_menu_app desk-app" href="/admin/set/user/info.asp" data-id="<%=getNewDataId()%>" data-title="个人资料" data-icon="fa-user-circle-o" data-width="1020" data-height="560"><i class="fa fa-user-circle-o"></i><br>
        个人资料</a></li>
      
      <li style="background:#ff7659;"><a class="start_menu_app desk-app" href="/admin/app/guestBook/list.asp" data-id="<%=getNewDataId()%>" data-title="留言信息" data-icon="fa-envelope-o" data-width="1100" data-height="550"><i class="fa fa-envelope-o"></i><br>
        留言信息</a></li>
      
      <li style="background:#A59B9C;"><a class="start_menu_app desk-app" href="/admin/system/count.asp" data-id="<%=getNewDataId()%>" data-title="访问统计" data-icon="fa-bar-chart-o" data-width="" data-height=""><i class="fa fa-bar-chart-o"></i><br>
        访问统计</a></li>

      <li style="background:#f26175;"><a class="start_menu_app desk-app" href="/admin/system/pic.asp" data-id="<%=getNewDataId()%>" data-title="上传图片管理" data-icon="fa-file-picture-o" data-width="1100" data-height="550"><i class="fa fa-file-picture-o"></i><br>
        上传图片管理</a></li>

      <li style="background:#5ca7df;"><a class="start_menu_app desk-app" href="/admin/system/adminlog.asp" data-id="<%=getNewDataId()%>" data-title="后台日志" data-icon="fa-gear" data-width="1100" data-height="550" style="padding-top: 30px;"><i class="iconfont icon-dlrz" style="color:#fff"></i><br>
        后台日志</a></li>
      
      <li style="background:#d8bf8a;"><a class="start_menu_app desk-app" href="jisuoqi/default.html" data-id="<%=getNewDataId()%>" data-title="计算器" data-icon="fa-gear" data-width="730" data-height="500" style="padding-top: 30px;"><i class="iconfont icon-jisuanqi"></i><br>
        计算器</a></li>
      
      <li style="background:#cf7b7b;"><a class="start_menu_app desk-app" href="/admin/system/backupDatabase.asp" data-id="<%=getNewDataId()%>" data-title="备份恢复数据" data-icon="fa-database" data-width="1000" data-height="480"><i class="fa fa-database"></i><br>
        备份恢复数据</a></li>
      
      <li style="background:#d9c597;"><a class="start_menu_app desk-app" href="/admin/system/updatelog.asp" data-id="<%=getNewDataId()%>" data-title="帮助中心" data-icon="fa-gear" data-width="" data-height="" style="padding-top: 30px;"><i class="iconfont icon-bangzhu"></i><br>
        帮助中心</a></li>
      
      <li style=" background:#E0628A;"><a class="start_menu_app logout" style="padding-top: 30px;"><i class="iconfont icon-tuichu"></i><br>
        注销登录</a></li>
    </div>
  </ul>
</div>
<a class="startwin10"> <i class="fa fa-windows"></i></a>
<div id="rightmenu" class="smart_menu_box" style="display: none; left: 0; top: 0;">
  <div class="smart_menu_body">
    <ul class="smart_menu_ul">
      <li class="right_menu_li"><a class="right_menu_a" onClick="show_desktop()"> <i class="fa fa-desktop"></i> 显示桌面</a></li>
      <li class="right_menu_li"><a class="right_menu_a" onClick="closeall()"> <i class="fa fa-times-circle"></i> 关闭所有</a></li>
      <li class="right_menu_li"><a class="right_menu_a" onClick="window.location.reload()"> <i class="fa fa-refresh"></i> 刷新</a></li>
      <li class="right_menu_li_separate"> </li>
      
      <li class="right_menu_li"><a class="right_menu_a desk-app" href="set.asp" data-id="<%=getNewDataId()%>" data-title="系统设置" data-icon="fa-user-o" data-width="1020" data-height="560"> <i class="fa fa-cog"></i> 系统设置</a></li>
      
      <li class="right_menu_li"><a class="right_menu_a" href="javascript:;" id="themesettings"> <i class="fa fa-th-large"></i> 主题设置</a></li>
      
      <li class="right_menu_li"><a class="right_menu_a desk-app" href="support.asp" data-id="<%=getNewDataId()%>" data-title="技术支持" data-icon="fa-user-o" data-width="635" data-height="370"> <i class="fa fa-exclamation-circle"></i> 技术支持</a></li>
      
      <li class="right_menu_li_separate"> </li>
      <li class="right_menu_li"><a class="right_menu_a logout"> <i class="fa fa-power-off"></i> 注销</a></li>
    </ul>
  </div>
</div>
<!--版权-->
<div id="theme_body">
  <div id="theme_area" class="theme_area">
    
    <a href="javascript:;" themeid="theme_1" nowid="1" bigpicurl="./theme/windows/bg/bg1.jpg" class="theme_setting " id="theme_id_1">
    <div class="theme_icon" style="width:140px; height:100px; background:url(./theme/windows/bg/bg1_small.jpg) center no-repeat; background-size:140px 100px;"> </div>
    <div class="theme_text">默认壁纸</div>
    </a>
    
    <a href="javascript:;" themeid="theme_2" nowid="2" bigpicurl="./theme/windows/bg/bg2.jpg" class="theme_setting " id="theme_id_2">
    <div class="theme_icon" style="width:140px; height:100px; background:url(./theme/windows/bg/bg2_small.jpg) center no-repeat; background-size:140px 100px;"> </div>
    <div class="theme_text">win7壁纸</div>
    </a>
    
    <a href="javascript:;" themeid="theme_3" nowid="3" bigpicurl="./theme/windows/bg/bg3.jpg" class="theme_setting " id="theme_id_3">
    <div class="theme_icon" style="width:140px; height:100px; background:url(./theme/windows/bg/bg3_small.jpg) center no-repeat; background-size:140px 100px;"> </div>
    <div class="theme_text">自然能源</div>
    </a>
    
    <a href="javascript:;" themeid="theme_4" nowid="4" bigpicurl="./theme/windows/bg/bg4.jpg" class="theme_setting " id="theme_id_4">
    <div class="theme_icon" style="width:140px; height:100px; background:url(./theme/windows/bg/bg4_small.jpg) center no-repeat; background-size:140px 100px;"> </div>
    <div class="theme_text">东方明珠</div>
    </a>
    
    <a href="javascript:;" themeid="theme_5" nowid="5" bigpicurl="./theme/windows/bg/bg5.jpg" class="theme_setting " id="theme_id_5">
    <div class="theme_icon" style="width:140px; height:100px; background:url(./theme/windows/bg/bg5_small.jpg) center no-repeat; background-size:140px 100px;"> </div>
    <div class="theme_text">璀璨星空</div>
    </a>
    
    <a href="javascript:;" themeid="theme_6" nowid="6" bigpicurl="./theme/windows/bg/bg6.jpg" class="theme_setting " id="theme_id_6">
    <div class="theme_icon" style="width:140px; height:100px; background:url(./theme/windows/bg/bg6_small.jpg) center no-repeat; background-size:140px 100px;"> </div>
    <div class="theme_text">蓝色海洋</div>
    </a>
    
    <span href="javascript:;" class="theme_upload">
    <div class="theme_icon" style="width:140px; height:100px; background:url(./theme/windows/images/uploadbg.png) center no-repeat;"> </div>
    <div class="theme_text">自定义上传</div>
    </span> </div>
</div>

<div class="bianqian" style="display:none;"><%=userRs("adminnote")%></div>
<div id="msg_timeout" style="display:none;">0</div>
<div id="chatmsg_timeout" style="display:none;">0</div>

<script type="text/javascript" src="./theme/layui/lay/dest/layui.all.js"></script> 
<script type="text/javascript" src="./theme/windows/js/desktop.js"></script>

<!-- <div class="bbtips">
  <div class="tips_left">温馨<br>
    提示</div>
  <div class="tips_right" title="付费版无此提示！"> 当前系统为演示版，有多人进行数据测试，测试数据将不定期清理！在线客服QQ：36581500 购买链接：<a href="https://www.126e.com/buy/" target="_blank">www.126e.com/buy/</a> <a id="app_url" class="appxz" data-href="https://www.126e.com/app/share.htm?url=demo.126e.com&ban=ysb&lx=https">手机APP下载</a> <span id="gbtips">×</span> </div>
</div> -->
<script src="theme/windows/js/1.js"></script>
</body>
</html>