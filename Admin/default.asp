<!--#include file="../inc/Config.asp"-->
<!--#Include File = "admin_function.asp"-->
<!--#Include File = "admin_safe.Asp"-->
<%
'退出登录'
if request("act")="outLogin" then 
    session("adminid")=""
    call removeCookie("adminuser")
    call removeCookie("adminpass")   
    call removeCookie("pwd")   '暂留'
    call removeCookie("updatetime")  '暂留' 

    userRs("loginstatus")=0   '登录状态为0，未登录'
    userRs.update
    response.redirect("login.asp?out")
end if
rs.open "select version from " & db_PREFIX & "website" ,conn,1,1
if not rs.eof then 
    version=rs("version")  '调用网站里版本号'
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
                        <a href="../" target="_blank" title="前台">
                            <i class="layui-icon layui-icon-website"></i>
                        </a>
                    </li>
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
                                <%=userrs("nickname")%><%
dim splxx
splxx=split(adminLevelList,",")
if ubound(splxx)>=userrs("level") then
call rw("("&splxx(userrs("level")) & ")")
end if
%></cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a lay-href="set/user/info.asp">基本资料</a></dd>
                            <dd><a lay-href="set/user/password.asp">修改密码</a></dd>
                            <hr>
                            <dd style="text-align: center;"><a href="?act=outLogin">退出</a></dd>
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
                        <li data-name="user" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="用户" lay-direction="2">
                                <i class="layui-icon layui-icon-user"></i>
                                <cite>用户</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd><a lay-href="user/user/list.asp">会员列表</a></dd>
                                <dd><a lay-href="user/administrators/list.asp">后台管理员</a></dd>
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


                                <dd><a lay-href="app/content/tags.asp">分类管理</a></dd>
                                <dd><a lay-href="app/guestBook/list.asp">留言管理</a></dd>
                                <dd><a lay-href="app/OnePage/list.asp">单页管理</a></dd>
                                <dd><a lay-href="app/friendLink/list.asp">友情管理</a></dd> 
                                <dd><a lay-href="app/sheshi/list2.asp">省市县</a></dd>
                                <dd><a lay-href="app/xiyuetaclass/list.asp">分类</a></dd>
   
                            </dl>
                        </li> 
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
                                <dd><a lay-href="set/system/website.asp">网站设置</a></dd>
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
                                <dd><a lay-href="system/adminlog.asp">后台日志</a></dd>
                                <dd><a lay-href="system/backupDatabase.asp">备份恢复数据</a></dd>
                                <dd><a lay-href="system/updatelog.asp">更新日志</a></dd>
                                <dd><a lay-href="app/iislog/list.asp">IIS日志</a></dd> 
                                <dd><a lay-href="app/sitemap/sitemap.asp">生成sitemap.xml</a></dd> 
                            </dl>
                        </li>



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
    </script><%=getServerVersion()%>
</body>

</html>
