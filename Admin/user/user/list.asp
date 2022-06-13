<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,isthrough,id

'会员列表查询
If Request("act") = "userlist" Then
    num = UCase(Request("limit")) 
    page = UCase(Request("page"))        
    stemp = "{""data"":[" 

    sql = "select * from ["& db_PREFIX &"Member]" 
  



    If Request("date_min") <> "" Then
      sql = sql & IIF(instr(sql," where ")=false," where "," and ") & "datediff('d',regTime,#" & Request("date_min") & "#)<=0" 
    End If 
    If Request("date_max") <> "" Then
      sql = sql & IIF(instr(sql," where ")=false," where "," and ") & "datediff('d',regTime,#" & Request("date_max") & "#)>=0" 
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

            isthrough=""
            if rs("isthrough")<>0 then
                isthrough=" checked"
            end if
   

            stemp = stemp & "{""i"":""" &i& """,""id"":""" & rs("id") & """,""username"":""" & rs("userName") & """,""nickname"":""" & rs("nickname") & """,""isthrough"":""" & isthrough & """,""regtime"":""" & rs("regTime") & """,""ip"":""" & rs("ip") & """,""addr"":""" & look_ip(rs("ip")) & """}" &sHr & "" 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()

elseif request("act")="del" then
    id=request("id")
    if userrs("pwd")<>mymd5(request("pwd")) then
        response.write "{""info"": ""验证密码错误，删除失败"",""status"": ""n""}"
    else
        rs.open"select * from ["& db_PREFIX &"Member] where id=" &id,conn,1,3
        if not rs.eof then
            rs.delete
            rs.update
            response.write "{""info"": ""删除用户成功"",""status"": ""y""}"
        else
            response.write "{""info"": ""删除用户失败，用户不存在"",""status"": ""n""}"
        end if:rs.close
    end if
    Response.end()
'通过或取消'
elseif request("act")="isthrough" then
    conn.execute"update ["& db_PREFIX &"Member] set isthrough="&IIF(request("isthrough")="true",1,0) &" where id="&request("id")
    response.write "{""info"": ""设置成功"",""status"": ""y""}"
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
  <button class="layui-btn" onclick="showwin('添加用户','userform.asp?')">添加</button>
</div>
 

 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="jizhang"><i class="layui-icon layui-icon-edit"></i>记账</a> 
</script>

<table class="layui-hide" id="table" lay-filter="demo"></table>
 

<script> 
layui.use(['form','table'],function(){
    var form = layui.form
        table = layui.table; 

    //方法级渲染
    table.render({
        elem: '#table',
        url: '?act=userlist',
        cols: [
            [
                { field: 'i', title: '序列', width:80, sort: true }
                , { field: 'username', title: '用户名',width:80, sort: false }
                , { field: 'nickname', title: '昵称',width:80, sort: false }  
                , { field: 'ip', title: 'IP',width:120, sort: false }
                , { field: 'addr', title: '地址',minWidth:150, sort: false }
                ,{field: 'isthrough', title: '审核状态',width:100, align:'center', templet:function(d){
                    return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
                , { field: 'regtime', title: '加入时间',width:160, sort: true }
                , { fixed: 'right', title: '操作', width: 210, toolbar: '#barDemo' }

            ]
        ],
        id: 'testReload',
        page: true,
        limit: 10
    });


    //是否置顶
    form.on('switch', function(data){
        var index = layer.msg('修改中，请稍候',{icon: 16,time:false,shade:0.8});
        setTimeout(function(){
            var pid=data.elem.value
            layer.close(index);

            $.ajax({
                type: "POST",
                cache: true,
                dataType: "json",
                url: "?act=isthrough",
                data: { "id": pid,"isthrough":data.elem.checked }, 
                success: function(data) { 
                    switch (data.status) {
                        case "y": 
                            break;
                        case "n":                       
                            break;
                    }
                }
            });
            if(data.elem.checked){
                layer.msg("置顶成功！");
            }else{
                layer.msg("取消置顶成功！");
            }
        },500);
    })


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
                                layer.msg(data.info);
                                break;
                            case "n":                                    
                                layer.msg(data.info);
                                break;
                        }
                    }
                });
            });



        } else if (obj.event === 'edit') {
            showwin('编辑用户', 'userform.asp?id=' + pid)

        
        } else if (obj.event === 'jizhang') {
            showwin('添加账务信息','../../app/finance/listform.asp?userid=' + pid)   

        }
    });

}); 


</script>
<script type="text/javascript" src="../../js/pc.js?v3"></script>
 

</body>

</html>
