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
                                <h3 class="layui-timeline-title">2022-02-22</h3>
                                <p>
                                  http://www.xiyueta.com/   <a href='http://www.xiyueta.com/' target="_blank">查看</a>
                                </p>
                              </div>
                            </li>
                            <li class="layui-timeline-item">
                              <i class="layui-icon layui-timeline-axis"></i>
                              <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2022-02-23</h3>
                                <p>后台功能完善<br>
用法:<br>
/app/content/list.asp 文章列表<br>
/app/content/tags.asp 文章分类</p>
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