<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,splxx,idlist

'会员列表查询
If Request("act") = "userlist" Then
    num = UCase(Request("limit")) 
    page = UCase(Request("page")) 
    stemp = "{""data"":["  

    splxx=split(adminLevelList,",")         '管理权限对应名称'

    sql = "select * from ["& db_PREFIX &"admin]" 

    If Request("date_min") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & getAccessDatediffTime("createtime",Request("date_min")) & "<=0" 
    End If 
    If Request("date_max") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & getAccessDatediffTime("createtime",Request("date_max")) & ">=0" 
    End If 
     If Request("key") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql =sql & IIF(instr(sql," where ")=false," where "," and ") & "[username] like '%" & Request("key") & "%' " 
      '分级搜索'
     idlist=getXiyuetaColumnSearchIdList(request("key"))
     if idlist<>"" then sql=sql &" or grouping in("& idlist & ")  "

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
 
            stemp = stemp & "{""i"":""" & i & """,""id"":""" & rs("id") & """,""username"":""" & rs("username") & """,""nickname"":""" & rs("nickname") & """,""tel"":""" & rs("tel") & """,""email"":""" & rs("email") & """,""level"":""" & splxx(rs("level")) & """,""createTime"":""" & rs("createTime") & """,""grouping"":""" & getXiyuetaColumnIdToName(rs("grouping")) & """,""permission"":""" & rs("permission") & """,""isthrough"":""" & IIF(rs("isThrough")=0,"未审核","已审核") & """}" &sHr & "" 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()

elseif request("act")="del" then 
    if userrs("pwd")<>mymd5(request("pwd")) then
        call die("{""info"": ""验证密码错误，删除失败"",""status"": ""n""}")
    elseif userrs("level")<>1 then
        call die("{""info"": ""只有超级管理员才可操作，删除失败"",""status"": ""n""}")
    else 
        conn.execute"delete from ["& db_PREFIX &"admin] where id="&request("id")
        call die("{""info"": ""删除成功"",""status"": ""y""}")
    end if

End If 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员列表</title>
<script type="text/javascript" src="../../js/jquery.js"></script><link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
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
 
    <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询内容">
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
                , { field: 'nickname', title: '昵称',minWidth:90, sort: false }
                , { field: 'tel', title: '手机',width:120, sort: false } 
                , { field: 'email', title: '邮箱',width:120, sort: false }
                , { field: 'level', title: '角色',width:100, sort: true }
                , { field: 'grouping', title: '分组',width:100, sort: true }
                , { field: 'permission', title: '权限列表',width:100, sort: true }
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
                            layer.msg(data.info);
                            switch (data.status) {
                                case "y":
                                    obj.del();
                                    break;
                                case "n":                   
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
