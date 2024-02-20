<!--#include file="../../inc/Config.asp"--><!--#Include File = "../admin_function.asp"--><!--#Include File = "../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec

'列表查询
If Request("act") = "list" Then  
    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 
    sql = "select * from ["& db_PREFIX &"systemLog]" 
 
    If Request("date_min") <> "" Then
      sql=sql & IIF(instr(sql," where ")=false," where "," and ")
      sql = sql & getAccessDatediffTime("createtime",Request("date_min")) & "<=0" 
    End If 
    If Request("date_max") <> "" Then      
      sql=sql & IIF(instr(sql," where ")=false," where "," and ")
      sql = sql & getAccessDatediffTime("createtime",Request("date_max")) & ">=0" 
    End If  
	
	If Request("key") <> "" Then
      sql=sql & IIF(instr(sql," where ")=false," where "," and ")
      sql =sql & " ([adminname] like '%" & Request("key") & "%' ) " 
      '搜索追加部分'
    End If
	
    mysql = sql & " order by id desc"  
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


            If i = sS Then
                sHr = "" 
            Else
                sHr = "," 
            End If 
 

	          stemp = stemp & "{""id"":""" & rs("id") & """,""item"":""" & rs("item") & """,""adminname"":""" & rs("adminname") & """,""msgstr"":""" & rs("msgstr") & """,""ip"":""" & rs("ip") & """,""addr"":""" & look_ip(rs("ip")) & """,""createTime"":""" & rs("createTime") & """}" &sHr & "" 
        	 
 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()
 

End If 



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台日志</title>
<script type="text/javascript" src="../js/jquery.js"></script>
 <link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../layuiadmin/layui/layui.js"></script>
</head>
<body style="padding:10px 6px 30px 6px;background: #FFF">  
 
 <div class="layui-form "> 
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
        <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称" onkeypress="if (event.keyCode === 13) {$('button[data-type=reload]').click(); }">
    </div>
      
  <button class="layui-btn" data-type="reload">搜索</button> 
</div>
 

 
<table class="layui-hide" id="table" lay-filter="demo"></table>
 

<script>
layui.use('table', function() {
    var table = layui.table;
    //方法级渲染
    table.render({
        elem: '#table',
        url: '?act=list',
        cols: [
            [

                { field: 'id', title: 'ID', width: 70, sort: true }
                , { field: 'item', title: '项目', width: 90, sort: false }
                , { field: 'adminname', title: '管理员', minWidth: 80, sort: false }
                , { field: 'ip', title: 'IP', minWidth: 100, sort: false }
                , { field: 'addr', title: '地址', minWidth: 200, sort: false }
                , { field: 'msgstr', title: '信息',minWidth: 150, sort: false }
                , { field: 'createTime', title: '时间', width: 160, sort: true }




            ]
        ],
        id: 'testReload',
        page: true,
        limit: 20
    });


    var $ = layui.$,
        active = {
            reload: function() {

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