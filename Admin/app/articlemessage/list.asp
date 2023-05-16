<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,columnName,id,title,field,bodycontent,isthrough,articletitle
'获得最新聊天的ID'
if request("act")="getNewChat" then
    rs.open"select * from ["& db_PREFIX &"articlemessage] order by id desc" ,conn,1,1
    if not rs.eof then
        call die(rs("id"))
    end if:rs.close
    call die("没有记录")

'列表查询
elseIf Request("act") = "list" Then  

    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 
    sql = "select * from ["& db_PREFIX &"articlemessage]" 

    
    If Request("date_min") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ") 
      sql = sql & getAccessDatediffTime("createtime",Request("date_min")) & "<=0" 
    End If 
    If Request("date_max") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ") 
      sql = sql & getAccessDatediffTime("createtime",Request("date_max")) & ">=0" 
    End If 
    If Request("key") <> "" Then
      sql =  sql & IIF(instr(sql," where ")=false," where "," and ") & "[title] like '%" & Request("key") & "%' " 
    End If 
    ' call die(sql)
    sql=sql & " order by id desc"
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

           articletitle=""
           rsx.open "select * from " & db_PREFIX & "articledetail where id=" & rs("articleid") ,conn,1,3
           if not rsx.eof then
              articletitle=rsx("title") 
           end if:rsx.close

            bodycontent=jsonCL( handleBodyQQFace(rs("bodycontent")))


	       stemp = stemp & "{""i"":""" & i & """,""id"":""" & rs("id") & """,""ip"":""" & rs("ip") & """,""articletitle"":""" & articletitle & """,""articleid"":""" & rs("articleid") & """,""parentid"":""" & rs("parentid") & """,""addr"":""" & look_ip(rs("ip")) & """,""guestname"":""" & rs("guestname") & """,""isthrough"":""" & isthrough & """,""title"":""" & rs("title") & """,""tel"":""" & rs("tel") & """,""email"":""" & rs("email") & """,""bodycontent"":""" & bodycontent & """,""createtime"":""" & rs("createtime") & """}" &sHr & "" 
    
            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()

elseif request("act")="del" then
  conn.execute"delete from ["& db_PREFIX &"articlemessage] where id="&request("id")
  response.write "{""info"": ""删除成功"",""status"": ""y""}"
  Response.end()
'通过或取消'
elseif request("act")="isthrough" then
    conn.execute"update ["& db_PREFIX &"articlemessage] set isthrough="&IIF(request("isthrough")="true",1,0) &" where id="&request("id")
    response.write "{""info"": ""设置成功"",""status"": ""y""}"
    Response.end()




End If 



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文章留言管理</title>
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
 
    <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称">
    </div>



      
  <button class="layui-btn" data-type="reload">搜索</button>
  <button class="layui-btn" onclick="showwin('添加信息','listform.asp?')">添加</button>
</div>
 

 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
</script>
<table class="layui-hide" id="table" lay-filter="demo"></table>
 
<script>
layui.use(['form','table','upload'], function() {
    var form = layui.form
        table = layui.table; 
    //方法级渲染
    table.render({
        elem: '#table',
        url: '?act=list',
        cols: [
            [

                { field: 'i', title: '序列', width: 70, sort: false }
               ,{ field: 'articleid',width:90, title: '文章ID', sort: false } 
               ,{ field: 'articletitle', title: '文章标题', sort: false }

               ,{ field: 'parentid',width:90, title: '给TA回复', sort: false } 
                , { field: 'guestname', title: '姓名', width: 100, sort: true }
                , { field: 'tel', title: '电话', width: 130, sort: true }
                , { field: 'email', title: '邮箱', width: 160, sort: true }
                , { field: 'ip', title: 'IP', width: 150, sort: false }
                , { field: 'addr', title: '地址', width: 200, sort: false }
                , { field: 'bodycontent', title: '留言内容', minWidth: 200, sort: true }
                , { field: 'createtime', title: '发布时间', width: 160, sort: true }
                 ,{field: 'isthrough', title: '是否显示',width:100, align:'center', templet:function(d){
                    return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
                , { fixed: 'right', title: '操作', width: 150, toolbar: '#barDemo' }


            ]
        ],
        id: 'testReload',
        page: true,
        limit: 20
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
                layer.msg("显示成功！");
            }else{
                layer.msg("取消显示成功！");
            }
        },500);
    })


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


var updateid=""
function getChatUpdate() {
    $.get("?act=getNewChat", function (data, status) {
        // alert(data)
        if(updateid==""){
            updateid=data
        }else if(data!=updateid){
            console.log("不等于",data,updateid)
            updateid=data
            $("button[data-type='reload']").click();
        }
    });
}
//是否开启自动更新最新留言信息
getChatUpdate();
setInterval(getChatUpdate, 5000);
</script>


<script type="text/javascript" src="../../js/pc.js"></script>	

</body>

</html>
