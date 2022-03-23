<!--#include file="../../inc/Config.asp"--><!--#Include File = "../admin_function.asp"--><!--#Include File = "../admin_safe.Asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台日志</title>
<script type="text/javascript" src="../js/jquery.js"></script>
 <link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../layuiadmin/layui/layui.js"></script>
</head>
<body style="padding:20px 0px 30px 0px;">  
 

<div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">
                          更新日志
                        </div>
                        <div class="layui-card-body ">
                          <ul class="layui-timeline">
                            <li class="layui-timeline-item">
                              <i class="layui-icon layui-timeline-axis"></i>
                              <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2019-03-30</h3>
                                <p>
                                  http://x.xuebingsi.com/   查看
                                </p>
                              </div>
                            </li>
                            <li class="layui-timeline-item">
                              <i class="layui-icon layui-timeline-axis"></i>
                              <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2019-03-19</h3>
                                <p>增加非菜单打开tab函数 x_admin_add_to_tab(title,url,is_refresh) titel为tab标题,url为打开页面地址,is_refresh 可选参数，重复点击是否刷新，默认为false不刷新,true为重复点击刷新页面<br>
用法:<br>
index.html 中直接 x_admin_add_to_tab('在tab打开','http://www.baidu.com',true)<br>
iframe页面中  用 parent.x_admin_add_to_tab('在tab打开','http://www.163.com',true)</p>
                              </div>
                            </li>
                            <li class="layui-timeline-item">
                              <i class="layui-icon layui-timeline-axis"></i>
                              <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2019-03-07</h3>
                                <p>
                                  是否开启刷新记忆tab功能, 通过index 页面增加 var is_remember = false;不增加默认开启
                                </p>
                              </div>
                            </li>
                            <li class="layui-timeline-item">
                              <i class="layui-icon layui-timeline-axis"></i>
                              <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2019-03-07</h3>
                                <p>
                                  增加tab双击关闭当前tab<br>
增加tab右键菜单，可实现 关闭当前/关闭其它/关闭全部
                                </p>
                              </div>
                            </li>
                            <li class="layui-timeline-item">
                              <i class="layui-icon layui-timeline-axis"></i>
                              <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2019-03-07</h3>
                                <p>
                                  开发升级为2.1, 引入layui 2.4.5<br>
增加 html 根标签增加 class="x-admin-sm" 可以实现整体方格字体的细化 原字体14px 变成12px<br>16px变为14px，对于有些需要显示更多信息的页面比较友好 去除x-admin-sm 恢复原来样式<br>
增加动态表格事例<br>
增加左侧点击刷新tab 可根据实际需要选择 在 sub-menu li 标签中加上属性 date-refresh="1" ,该链接点击会进行刷新<br>
增加弹出层函数 x_admin_father_reload() 该函数可以实现对父窗口的刷新<br>
刷新保留左侧展开 （利用cookie 保存点击过的 索引，刷新读取cookie对应的索引 进行展开左侧）<br>
增加404错误页面<br>
tab记忆功能，刷新保留之前打开的tab （利用cookie 保存点击过的 索引，刷新读取cookie对应的索引 进行打开)
                                </p>
                              </div>
                            </li>
                          </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>



 
  <script>
  layui.config({
    base: '../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index'], function() { 
    
  })
  </script>



</body>
</html>  