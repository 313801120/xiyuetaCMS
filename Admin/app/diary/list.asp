<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,columnName,id,title,field
'网站栏目查询
If Request("act") = "list" Then  
 
    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 
    sql = "select * from ["& db_PREFIX &"diary]" 
 
    If Request("date_min") <> "" Then
      sql=sql & IIF(instr(sql," where ")=false," where "," and ")
      sql = sql & getAccessDatediffTime("writedatetime",Request("date_min")) & "<=0" 
    End If 
    If Request("date_max") <> "" Then
      sql=sql & IIF(instr(sql," where ")=false," where "," and ")
      sql = sql & getAccessDatediffTime("writedatetime",Request("date_max")) & ">=0" 
    End If  

    If Request("key") <> "" Then
      sql=sql & IIF(instr(sql," where ")=false," where "," and ")
      sql =sql & "[title] like '%" & Request("key") & "%' " 
    End If 
    mysql = sql & " order by id" 
    'call die(mysql)
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

	       stemp = stemp & "{""i"":""" & i & """,""id"":""" & rs("id") & """,""title"":""" & jsonCL(rs("title")) & """,""bodycontent"":""" & jsonCL(rs("bodycontent")) & """,""writedatetime"":""" & rs("writedatetime") & """,""createtime"":""" & rs("createtime") & """}" &sHr & "" 
    
 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()

elseif request("act")="del" then
  conn.execute"delete from ["& db_PREFIX &"diary] where id="&request("id")
  response.write "{""info"": ""删除成功"",""status"": ""y""}"
  Response.end()
'在线修改
elseif request("act")="onlineedit" then 
  field=request("field")
  if field="" then field="money"
  title=request("title")
  id=request("id") 
  rs.open"select * from ["& db_PREFIX &"diary] where "& field &"="& title &" and id<>" & id,conn,1,1
  if not rs.eof then
    response.write "{""info"": ""字段存在"",""status"": ""n"",""title"": """&rs("title")&"""}"  
  else
    ' call die("update ["& db_PREFIX &"diary] set  "& field &"="&title&" where id="&id)
    conn.execute"update ["& db_PREFIX &"diary] set  ["& field &"]="&title&" where id="&id
    response.write "{""info"": ""修改成功"",""status"": ""y""}"
  end if:rs.close
  Response.end()




End If 



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>部件列表</title>
<script type="text/javascript" src="../../js/jquery.js"></script>
 <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
<style>
.layui-table-cell .layui-form-checkbox[lay-skin="primary"] {/*让列表选项位置上下居中 20230331*/
    top: 4px;
}
</style>
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
 
    <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称">
    </div>



      
  <button class="layui-btn" data-type="reload">搜索</button>
  <button class="layui-btn" onclick="showwin('添加新日记','listform.asp?')">添加</button>
</div>
 

 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
</script>
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

                { field: 'i', title: '序列', width: 60, sort: false }
                , { field: 'title', title: '日记标题',minWidth:200, sort: true } 
                , { field: 'bodycontent', title: '日记内容', sort: true } 
                , { field: 'writedatetime', title: '时间', width: 150, sort: true }
                // , { field: 'createtime', title: '发布时间', width: 150, sort: true }
                , { fixed: 'right', title: '操作', width: 150, toolbar: '#barDemo' }


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
                        date_min: $('input[name=date_min]').val()
                        ,date_max: $('input[name=date_max]').val()
                        ,key: $('input[name=key]').val()
                        ,parentid: $('select[name=parentid]').val()
                    }

                });
            }
        };

    $('.layui-form .layui-btn').on('click', function() {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });


    //监听行工具事件
    table.on('tool(demo)', function(obj) {
        var data = obj.data;
        var pid = obj.data["id"]
        if (obj.event === 'del') {
            layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'}, function(index) {
                $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "json",
                    url: "?act=del",
                    data: { "id": pid },
                    success: function(data) {
                        switch (data.status) {
                            case "y":
                                obj.del();
                                break;
                        }
                    }
                });
                layer.close(index);
            });

        } else if (obj.event === 'edit') {
            showwin('修改信息', 'listform.asp?id=' + pid)
        }

    });


    //监听单元格编辑
    table.on('edit(demo)', function(obj){
      var value = obj.value //得到修改后的值
      ,data = obj.data //得到所在行所有键值
      ,field = obj.field; //得到字段
      var thisObj=obj
      $.ajax({
                type: "POST",
                cache: true,
                dataType: "json",
                url: "?act=onlineedit&id="+data.id,
                data: { "field":  field,"title":  value  },
                success: function(data) {
                    switch (data.status) {
                        case "y": 
                        layer.msg(data.info, {icon: 1});
                            break;
                        case "n": 
                        layer.msg(data.info, {icon: 2}); 
                            break;
                    }
                }
            });




    });





});
</script>


<script type="text/javascript" src="../../js/pc.js?v1"></script>	

</body>

</html>
