<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,level 

'会员列表查询
If Request("act") = "userlist" Then
    num = UCase(Request("limit")) 
    page = UCase(Request("page")) 
    stemp = "{""data"":[" 

    sql = "select * from ["& db_PREFIX &"admin]" 

    If Request("date_min") <> "" Then
      sql = sql & IIF(instr(sql," where ")=false," where "," and ") & "datediff('d',createTime,#" & Request("date_min") & "#)<=0" 
    End If 
    If Request("date_max") <> "" Then
      sql = sql & IIF(instr(sql," where ")=false," where "," and ") & "datediff('d',createTime,#" & Request("date_max") & "#)>=0" 
    End If 
    If Request("key") <> "" Then
      sql =  sql & IIF(instr(sql," where ")=false," where "," and ") & "[username] like '%" & Request("key") & "%' " 
    End If 
    sql=sql & " order by id desc" 
    ' call die(sql)
    
    rs.Open sql, conn, 1, 1 


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

            if rs("level")=1 then
                level="超级管理员"
            elseif rs("level")=2 then
                level="普通管理员"
            elseif rs("level")=3 then
                level="审核员"
            elseif rs("level")=4 then
                level="编辑人员"
            end if
            stemp = stemp & "{""i"":""" & i & """,""id"":""" & rs("id") & """,""username"":""" & rs("userName") & """,""tel"":""" & rs("tel") & """,""email"":""" & rs("email") & """,""level"":""" & level & """,""createTime"":""" & rs("createTime") & """,""isthrough"":""" & IIF(rs("isThrough")=0,"未审核","已审核") & """}" &sHr & "" 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()

elseif request("act")="del" then 
    if userrs("pwd")<>mymd5(request("pwd")) then
        response.write "{""info"": ""验证密码错误，删除失败"",""status"": ""n""}"
    else
        conn.execute"delete from ["& db_PREFIX &"admin] where id="&request("id")
        response.write "{""info"": ""删除成功"",""status"": ""y""}"
    end if
    Response.end()

End If 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员列表</title>
<script type="text/javascript" src="../../js/jquery.js"></script>
 <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
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
 
    <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的账号">
    </div>
      
  <button class="layui-btn" data-type="reload">搜索</button>
  <button class="layui-btn" onclick="showwin('添加管理员','adminform.asp?')">添加</button>
</div>
 

 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>

    {{#  if(d.level == '超级管理员'){ }}
    <a class="layui-btn layui-btn-xs layui-btn-danger layui-btn-disabled" lay-event="delNO"><i class="layui-icon layui-icon-delete"></i>删除</a>
    {{#  } else { }}
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
    {{#  } }}
 
</script>
<table class="layui-hide" id="table" lay-filter="demo"></table>
 

<script>
layui.use('table', function() {
    var table = layui.table;

    //方法级渲染
    table.render({
        elem: '#table',
        url: '?act=userlist',   
        cols: [
            [

                { field: 'i', title: '序列', width: 80, sort: true }
                , { field: 'username', title: '登录名',minWidth:90, sort: false }
                , { field: 'tel', title: '手机',width:120, sort: false } 
                , { field: 'email', title: '邮箱',width:120, sort: false }
                , { field: 'level', title: '角色',width:100, sort: false }
                , { field: 'isthrough', title: '审核状态',width:100,sort: false }
                , { field: 'createTime', title: '加入时间',width:160, sort: true }
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


    //监听行工具事件
    table.on('tool(demo)', function(obj) {
        var data = obj.data;
        var pid = obj.data["id"]
        if (obj.event === 'del') {
            layer.prompt({
                formType: 1,
                title: '敏感操作，请验证密码'
            }, function(value, index) {
                layer.close(index);


                layer.confirm('确定删除此管理员？',{icon:3, title:'提示信息'}, function(index) {
                    $.ajax({
                        type: "POST",
                        cache: true,
                        dataType: "json",
                        url: "?act=del",
                        data: { "id": pid,"pwd":value }, 
                        success: function(data) { 
                            switch (data.status) {
                                case "y":
                                    obj.del();
                                    break;
                                case "n":                                    
                                    layer.msg(data.info);
                                    break;
                            }
                        }
                    });
                    layer.close(index);

                });
            });


        } else if (obj.event === 'edit') {
            showwin('编辑管理员', 'adminform.asp?id=' + pid)

        }
    }); 

});
</script>


<script type="text/javascript" src="../../js/pc.js"></script>	

</body>

</html>
