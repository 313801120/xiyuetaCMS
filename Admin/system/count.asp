<!--#include file="../../inc/Config.asp"--><!--#Include File = "../admin_safe.Asp"--><% 
call openconn()
dim sql,i,d,num,page,stemp,sql1,mysql,currentPage,perpage,page_count,totalrec,n,sS,useragent,curl,sHr

'统计查询
If Request("act") = "list" Then
    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":["  
    sql1 = "select * from ["+db_PREFIX+"count] where ip<>''" 

    If Request("type") <> "" Then
        sql = sql & " and instr(type," & Request("type") & ")>0" 
    End If 
    If Request("date_min") <> "" Then
        sql = sql & " and datediff('d',intime,#" & Request("date_min") & "#)<=0" 
    End If 

    If Request("date_max") <> "" Then
        sql = sql & " and datediff('d',intime,#" & Request("date_max") & "#)>=0" 
    End If 

    If Request("key") <> "" Then
        sql = " and ip like '%" & Request("key") & "%' " 
    End If 

    mysql = sql1 & sql & " order by id desc" 
    rs.Open mysql, conn, 1, 1 
    If Not rs.EOF Then
        If Request("page") = "" Then
            currentPage = 1 
        Else
            currentPage = CInt(Request("page")) 
        End If 
        perpage = num 
        rs.PageSize = perpage 
        rs.AbsolutePage = currentPage 
        page_count = 0 
        i =(page - 1) * num 
        totalrec = rs.RecordCount 
        While (Not rs.EOF) And(Not page_count = rs.PageSize)
            i = i + 1 
            page_count = page_count + 1 
            If totalrec Mod perpage = 0 Then
                n = totalrec \ perpage 
            Else
                n = totalrec \ perpage + 1 
            End If 
            If CInt(page) = n Then
                sS = totalrec 
            Else
                sS = page * num 
            End If 
            If Trim(rs("useragent")) = "" Or IsNull(rs("useragent")) Then
                useragent = "" 
            Else
                useragent = Replace(Replace(rs("useragent"), " ", ""), "            ", "") 
            End If 

            curl = Replace(Replace(Replace(rs("url"), " ", ""), "    ", ""), "\", "") 


            If i = sS Then
                sHr = "" 
            Else
                sHr = "," 
            End If 
            stemp = stemp & "{""id"":""" & rs("id") & """,""ip"":""" & rs("ip") & """,""useragent"":""" & useragent & """,""pv"":""" & rs("pv") & """,""w"":""" & rs("w") & """,""h"":""" & rs("h") & """,""addr"":""" & rs("addr") & """,""url"":""" & curl & """,""intime"":""" & rs("intime") & """}" &sHr & "" 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
	response.End()
	 

End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>访客统计</title> 
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" type="text/css"/>
<script src="../js/echarts.min.js?v1"></script>
<script type="text/javascript" src="../layuiadmin/layui/layui.js"></script>
<script src="../js/macarons.js?v1"></script>


</head>
<style>
.chart_ip{
	width: 900px;
	height: 400px;
	
}
</style>
<body style="padding: 0 10px 10px 10px; background: #FFF"> 
   
   <div class="layui-tab" lay-filter="test">
  <ul class="layui-tab-title">
    <li class="layui-this" lay-id="11">访客统计</li>
    <li lay-id="22">访客图表统计</li>
    <li lay-id="33">来源排行</li>
    <li lay-id="44">访客列表</li>
   
  </ul>
  <div class="layui-tab-content" style="padding:0px;">
    <div class="layui-tab-item layui-show">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="layui-table">
 <thead>
  <tr>
    <td colspan="7" align="center"><strong>访客访问量统计</strong></td>
    </tr>
  <tr>
    <td>统计类型</td>
    <td>昨日</td>
    <td>今天</td>
    <td>本周</td>
    <td>本月</td>
    <td>本年</td>
    <td>全部</td>
  </tr>
  </thead>
  <tr>
    <td>IP</td>  
    <td><%sql="select ip from ["+db_PREFIX+"count] where "& getAccessDatediff("intime") &"=1 group by ip"
	rs.open sql,conn,1,1
	response.Write rs.recordcount&"<br>"
	rs.close
	%></td>
    <td><%sql="select ip from ["+db_PREFIX+"count] where "& getAccessDatediff("intime") &"=0 group by ip"
	rs.open sql,conn,1,1
	response.Write rs.recordcount&"<br>"
	
	rs.close
	%></td>
    <td><%sql="select ip from ["+db_PREFIX+"count] where "& getAccessDatediffWeek("intime") &"=0 group by ip"
	rs.open sql,conn,1,1
	response.Write rs.recordcount&"<br>"
	
	rs.close  
			 
			 
			 
	%></td>
    <td><%sql="select ip from ["+db_PREFIX+"count] where "& getAccessDatediffMonth("intime") &"=0 group by ip"
	rs.open sql,conn,1,1
	response.Write rs.recordcount&"<br>"
	
	rs.close
			 
			 
			 
	%></td>
    <td><%sql="select ip from ["+db_PREFIX+"count] where "& getAccessDatediffYear("intime") &"=0 group by ip"
	rs.open sql,conn,1,1
	response.Write rs.recordcount&"<br>"
	
	rs.close
			 
			 
			 
	%></td>
    <td><%sql="select ip from ["+db_PREFIX+"count]  group by ip"
	rs.open sql,conn,1,1
	response.Write rs.recordcount&"<br>"
	
	rs.close
			 
			 
			 
	%></td>
  </tr>
  <tr>
    <td>PV</td>
    <td><%sql="select sum(pv)as tpv from ["+db_PREFIX+"count] where "& getAccessDatediff("intime") &"=1 "
	rs.open sql,conn,1,1
	if isnull(rs("tpv"))=true then
		response.Write("0")
	else
		response.Write rs("tpv")
	end if
	rs.close
	%></td>
    <td><%sql="select sum(pv)as tpv from ["+db_PREFIX+"count] where "& getAccessDatediff("intime") &"=0 "
	rs.open sql,conn,1,1
	if isnull(rs("tpv"))=true then
		response.Write("0")
	else
		response.Write rs("tpv")
	end if
	rs.close
	%></td>
    <td><%sql="select sum(pv)as tpv from ["+db_PREFIX+"count] where "& getAccessDatediffWeek("intime") &"=0 "
	rs.open sql,conn,1,1
	if isnull(rs("tpv"))=true then
		response.Write("0")
	else
		response.Write rs("tpv")
	end if
	rs.close
	%></td>
    <td><%sql="select sum(pv)as tpv from ["+db_PREFIX+"count] where "& getAccessDatediffMonth("intime") &"=0 "
	rs.open sql,conn,1,1
	if isnull(rs("tpv"))=true then
		response.Write("0")
	else
		response.Write rs("tpv")
	end if
	rs.close
	%></td>
    <td><%sql="select sum(pv)as tpv from ["+db_PREFIX+"count] where "& getAccessDatediffYear("intime") &"=0 "
	rs.open sql,conn,1,1
	if isnull(rs("tpv"))=true then
		response.Write("0")
	else
		response.Write rs("tpv")
	end if
	rs.close
	%></td>
    <td><%sql="select sum(pv)as tpv from ["+db_PREFIX+"count] "
	rs.open sql,conn,1,1
	if isnull(rs("tpv"))=true then
		response.Write("0")
	else
		response.Write rs("tpv")
	end if
	rs.close
	%></td>
  </tr>
</table>

    </div>
    
  <div class="layui-tab-item" >
  
  
  <div id="chart_ip" class="chart_ip"></div></div>  
    <div class="layui-tab-item">
     
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="layui-table">
 <thead>
  <tr>
    <td colspan="2" align="center"><strong>来源排行</strong></td>
    </tr>
  <tr>
    <td>来源</td>
    <td>次数</td>
    </tr>
  </thead><%
  sql="select url,count(*)as tnum from ["+db_PREFIX+"count]  group by url order by count(*) desc "
	rs.open sql,conn,1,1
	do while not rs.eof
	
	%>
  <tr>
    <td><%=rs("url")%></td>
    <td><%=rs("tnum")%></td>
    </tr><%rs.movenext
  
  loop
  rs.close%>
  
 
</table> 
</div>


   
  <div class="layui-tab-item"> 
 <div class="layui-form" style="padding-top: 10px;">
 
 
  <div class="layui-inline">
      
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="date_min" placeholder="开始日期" autocomplete="off" class="layui-input date">
      </div>
      <div class="layui-input-inline">-</div>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="date_max" placeholder="结束日期" autocomplete="off" class="layui-input date">
      </div>
    </div>
  
  <div class="layui-inline">
 
    <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的ip">
</div>
      
  <button class="layui-btn" data-type="reload">搜索</button>
</div>
 

 
<table class="layui-hide" id="table" lay-filter="demo"></table>
 
  </div> 
   
   
   
  </div>
</div>
 
	 

 

<script>
	$(function(){
	var myChart = echarts.init(document.getElementById("chart_ip"),'macarons');
	
	myChart.setOption({
			title: {
				left: 'center',
				text: '最近10日访客统计'
			},
			tooltip: {
				trigger: 'axis'
			},
			legend: {
				bottom:0,
				
				textStyle:{
					color:'#123'
				},
				//orient:'vertical',
			
			},
			grid: {
				left: '0%',
				right: '0%',
				bottom: '10%',
				top:'10%',
				containLabel: true
			},
			
			
			xAxis: {
				type: 'category',
				boundaryGap: true,
				axisTick:{show:false},
				axisLabel:{
					textStyle:{
						color:"#666", //刻度颜色
						fontSize:12  //刻度大小
						}
				},
				axisLine:{
					show:true,
					lineStyle:{
						color: '#5FB878',
						width: 2,
						type: 'solid'
					}
				},
				splitLine:{
					show:true,
					lineStyle:{
						color: '#eee',
						width: 1,
						type: 'solid'
					}
				},
				data:[ <%
				
	 for i=0 to 9
	 D=9-i
	 response.Write "'"&month(DateAdd("d", -D, date()))&"-"&day(DateAdd("d", -d, date()))&"'"&","
	 
	  next   %> ]
			},
			yAxis: {
				
				type: 'value',
				axisTick:{show:false},
				axisLabel:{
					textStyle:{
						color:"#666", //刻度颜色
						fontSize:12  //刻度大小
						}
				},
				axisLine:{
					show:true,
					lineStyle:{
						color: '#5FB878',
						width: 2,
						type: 'solid'
					}
				},
				splitLine:{
					show:true
					
				}
				
				
			},
			series: [
						
						{
							name:'PV',
							type:'line',
							itemStyle : {  
									normal : {  
									color:'#006AD4'
								},
								lineStyle:{
									normal:{
									color:'#F3891B',
									opacity:1
										}
								}
							},
							data:[
  <%
	 for i=0 to 9
	 D=9-i
	// call die(getAccessDatediffTime("intime",DateAdd("d", -D, date())))
	 sql="select sum(pv)as tpv from ["+db_PREFIX+"count] where "& getAccessDatediffTime("intime",DateAdd("d", -D, date())) &"=0 "
	rs.open sql,conn,1,1
	if isnull(rs("tpv")) then
	response.Write "0,"
	else
	
	response.Write rs("tpv")&","
	end if
	
	rs.close
	 
	  next   %>
 
            ]
						},
						{
							name:'IP',
							type:'line',
							itemStyle : {  
									normal : {  
									color:'#009895'
								},
								lineStyle:{
									normal:{
									color:'#009895',
									opacity:1
										}
								}
							},
							data:[<%
	 for i=0 to 9
	 D=9-i
	 sql="select ip from ["+db_PREFIX+"count] where "& getAccessDatediffTime("intime",DateAdd("d", -D, date())) &"=0 group by ip"
	rs.open sql,conn,1,1
	response.Write rs.recordcount&","
	
	rs.close
	 
	 
	
	 
	  next   %>]
						}
					]
		}	
	);
})



</script>

<script>
layui.use('table', function() {
    var table = layui.table;

    //方法级渲染
    table.render({
        elem: '#table',
        url: '?act=list',
        toolbar: '#toolbarDemo',
        title: '用户数据表',
        cellMinWidth: 100 ,
        cols: [
            [

                { field: 'id', title: 'ID', width: 50, sort: false }
                , { field: 'ip', title: 'ip', sort: true }
                , { field: 'addr', title: '地址', sort: true }
                , { field: 'pv', title: 'pv', sort: true }
                , { field: 'w', title: '屏幕宽', sort: true }
                , { field: 'h', title: '屏幕高', sort: true }
                , { field: 'url', title: '来源', sort: true }
                , { field: 'useragent', title: 'useragent', sort: false }
                , { field: 'intime', title: '发布时间', width: 150, sort: true }

            ]
        ],
        id: 'testReload',
        page: true,
        limit: 20
    });


    var $ = layui.$,
        active = {
            reload: function() {
                var demoReload = $('#demoReload');

                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        date_min: $('input[name=date_min]').val(),
                        date_max: $('input[name=date_max]').val(),
                        key: $('input[name=key]').val()
                    }

                });
            }
        };

    $('.layui-form .layui-btn').on('click', function() {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

});
</script>
<script type="text/javascript" src="../js/pc.js"></script>	

 

</body>

</html>
