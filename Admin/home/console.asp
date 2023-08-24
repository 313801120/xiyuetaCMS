<!--#include file="../../inc/Config.asp"-->
<!--#Include File = "../admin_function.asp"-->
<!--#Include File = "../admin_safe.Asp"-->
<% 
call openconn() 
dim totalVisits,dayVisits,sql,chatTotalVisits,chatDayVisits,activeUser,totalUser,i,sSel,narticlM,naritcleCount,tplname


if request("act")="usetpl" then

  call useTpl2022("../../",request("tpl"))

  response.write "{""info"": ""应用成功!"",""status"": ""y""}"
  Response.end()

end if

'总访问量PV'
rs.open"select sum(pv)as tpv from ["&db_PREFIX&"count]",conn,1,1
totalVisits=IIF(isnull(rs("tpv"))=true,0,rs("tpv")):rs.close
'当前访问量'
rs.open"select sum(pv)as tpv from ["&db_PREFIX&"count] where "& getAccessDatediff("intime")&"=0",conn,1,1
dayVisits=IIF(isnull(rs("tpv"))=true,0,rs("tpv")):rs.close 

'留言总条数'
chatTotalVisits=conn.execute("select count(*) from["&db_PREFIX&"GuestBook]")(0)
'留言当天数'
chatDayVisits=conn.execute("select count(*) from["&db_PREFIX&"GuestBook] where "& getAccessDatediff("createtime")&"=0")(0)
'文章'
narticlM=conn.execute("select count(*) from["&db_PREFIX&"ArticleDetail] where "& getAccessDatediffMonth("createtime")&"=0")(0)
naritcleCount=conn.execute("select count(*) from["&db_PREFIX&"ArticleDetail]")(0)
 
'活跃用户'
activeUser=conn.execute("select count(*) from["&db_PREFIX&"member] where "& getAccessDatediffYear("loginTime")&"=0")(0)
'总用户' 
totalUser=conn.execute("select count(*) from["&db_PREFIX&"member]")(0)
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

    rs.open"select * from ["&db_PREFIX&"website]",conn,1,1
    if not rs.eof then
        tplname=rs("tplname")
    end if:rs.close

contnet=getDirFolderNameList("../../tpl/")
' call echo("contnet",contnet)
splstr=split(contnet,vbcrlf)
for each folderName in splstr
    img="../../tpl/" & folderName & "/" &folderName&".jpg"
    if checkFile(img)=false then
        img="../../uploadfiles/testpic/" & folderName&".jpg"

        if checkFile(img)=false then
            img="../../uploadfiles/testpic/pic.jpg"  '默认图片'
        end if
    end if
%>
                        <div class="layui-col-md2 layui-col-sm4" style="padding:10px;">
                            <div class="cmdlist-container" style="border:1px solid #000;background:#fff;<%=IIF(folderName=tplname,"background:#fbe9e9;","")%>">
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
                                            <a href="<%="/tpl/" & folderName & "/" %>" target="_blank" class="layui-btn layui-btn-xs ">
                                                查看
                                            </a>
                                        </span>
                                    </div>
                                </div>
                                </a>
                            </div>
                        </div>
                        <%next%>
                        <div style="clear:both;"></div>
                    </div>
                </div>
            </div>
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
    rs.open"select top 5 * from " & db_PREFIX & "GuestBook order by id desc",conn,1,1
  while not rs.eof
%>
                            <li>
                                <h3>
                                    <%=rs("guestName")%>
                                </h3>
                                <p>
                                    <%=rs("bodycontent")%>
                                </p>
                                <span>
                                    <%=rs("createTime")%></span>
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
    rs.open "select top 7 * from " & db_PREFIX & "Member order by loginTime desc",conn,1,1
    for i=1 to 7
      if rs.eof then exit for
      sSel=""
      if i=1 then
        sSel=" class='first'"
      elseif i=2 then
        sSel=" class='second'"
      elseif i=3 then
        sSel=" class='third'"
      end if
      n=dateDiff("n", rs("loginTime"), now()) 
%>
                                        <tr>
                                            <td>
                                                <span<%=sSel%>>
                                                    <%=rs("nickname")%></span>
                                            </td>
                                            <td>
                                                <%=getHandleHowLongAgoTime(rs("loginTime"))%>
                                            </td>
                                            <td>
                                                <%=IIF(n<=10,"<span>在线</span>","<i>离线</i>")%>
                                            </td>
                                            <td>
                                                <%=IIF(rs("isThrough")=0,"否","是")%>
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
    <script type="text/javascript" src="../../js/jquery.js"></script>
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
                              $("div[class='cmdlist-container']").css("background","#fff");
                              $(thisObj).parent().parent().parent().css("background","#fbe9e9");
                              break;
                        }
                    }
                });
                layer.close(index);
            });

        })




    });
    </script>
</body>

</html>