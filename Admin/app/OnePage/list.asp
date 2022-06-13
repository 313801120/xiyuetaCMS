<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><%
'#禁止自动更新当前文件'  #号去掉代表此文件不被程序自动更新替换掉
call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,id,title
'网站栏目查询
If Request("act") = "list" Then  
 
    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 
    sql1 = "select * from ["& db_PREFIX &"onepage]" 

    
    If Request("date_min") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & "datediff('d',createtime,#" & Request("date_min") & "#)<=0" 
    End If 
    If Request("date_max") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & "datediff('d',createtime,#" & Request("date_max") & "#)>=0" 
    End If    

    If Request("key") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql =sql & "[title] like '%" & Request("key") & "%' " 
    End If 
    mysql = sql1 & sql & " order by id desc"'" order by sortrank" 
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
 

	       stemp = stemp & "{""i"":""" & i & """,""id"":""" & rs("id") & """,""title"":""" & rs("title") & """,""createtime"":""" & rs("createtime") & """}" &sHr & ""
    
 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 
    
    rs.close
    stemp=replace(stemp,"\","\\")
    stemp=replace(stemp,vbcrlf,"\n")
    call die(stemp)
elseif request("act")="del" then
  conn.execute"delete from ["& db_PREFIX &"onepage] where id in("&request("id")&")"
  response.write "{""info"": ""删除成功"",""status"": ""y""}"
  Response.end()
'在线修改
elseif request("act")="onlineedit" then 
  title=request("title")
  id=request("id")
  rs.open"select * from ["& db_PREFIX &"onepage] where title='"& title &"' and id<>" & id,conn,1,1
  if not rs.eof then
    response.write "{""info"": ""名称存在"",""status"": ""n"",""title"": """&rs("title")&"""}"  
  else
    conn.execute"update ["& db_PREFIX &"onepage] set  title='"&title&"' where id="&id
    response.write "{""info"": ""修改成功"&id&""",""status"": ""y""}"
  end if:rs.close
  Response.end()
'通过或取消'
elseif request("act")="isthrough" then
    conn.execute"update ["& db_PREFIX &"onepage] set isthrough="&IIF(request("isthrough")="true",1,0) &" where id="&request("id")
    response.write "{""info"": ""设置成功"",""status"": ""y""}"
    Response.end()



End If 



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>列表</title>
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
        <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称">
    </div>



      
  <button class="layui-btn" data-type="reload">搜索</button>
  <button class="layui-btn" onclick="showwin('添加信息','listform.asp?')">添加</button>
  <button class="layui-btn" data-type="batchdel">删除</button>
  
  

</div>
 

 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> 
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
</script>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
 
<script>
 
layui.use(['form','table','upload'],function(){
    var form = layui.form
        table = layui.table; 

    var upload = layui.upload
    upload.render({
        elem: '#import',
        url: '/api/upload/uploadXls.asp',
        exts: 'xlsx|xls|txt', //只允许上传excel文件
        done: function(res) {
            // alert("res.data.src="+res.data.src)
              $.get('import.asp', {
                    act:'import',
                    xls:res.data.src
                }, function (strData) {
                    layer.msg(strData);
                    table.reload('testReload');
                })
        }
    });

    //方法级渲染
    table.render({
        elem: '#demo',
        url: '?act=list',
        cols: [
            [
                {type: 'checkbox', fixed: 'left'}
               ,{ field: 'id',width:70, title: 'ID', sort: false }
               ,{ field: 'title', title: '标题', sort: false }
               ,{ field: 'createtime',width:160, title: '创建时间', sort: false }

                , { fixed: 'right', title: '操作', width: 160, toolbar: '#barDemo' }


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
                layer.msg("置顶成功！");
            }else{
                layer.msg("取消置顶成功！");
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
            },batchdel: function(){
                //testReload为table渲染时改变的 id: 'testReload'
                var checkStatus = table.checkStatus('testReload')
                ,checkData = checkStatus.data; //得到选中的数据
                
                if(checkData.length === 0){
                   return layer.msg('请选择数据');
                }
                var idlist='';
                for(var i=0;i<checkData.length;i++){
                    if(idlist!='')idlist+=',';
                    idlist+=checkData[i].id;
                }              
                layer.confirm('确定删除吗？', function(index) {
                 
                     $.ajax({
                        type: "POST",
                        cache: true,
                        dataType: "json",
                        url: "?act=del",
                        data: { "id": idlist },
                        success: function(data) {
                            switch (data.status) {
                                case "y":
                                    table.reload('testReload');
                                    layer.msg('已删除');
                                    break;
                            }
                        }
                    });

                });
            },export: function(){//导出 
                //testReload为table渲染时改变的 id: 'testReload'
                var checkStatus = table.checkStatus('testReload')
                ,checkData = checkStatus.data; //得到选中的数据
                
                if(checkData.length === 0){
                   return layer.msg('请选择数据');
                }
                var idlist='';
                for(var i=0;i<checkData.length;i++){
                    if(idlist!='')idlist+=',';
                    idlist+=checkData[i].id;
                }              
                layer.confirm('确定导出数据吗？', function(index) {
                 
                     $.ajax({
                        type: "POST", 
                        url: "export.asp?act=export",
                        data: { "id": idlist },
                        success: function(data) {
                            // 创建a标签
                            var elementA = document.createElement('a');

                            //文件的名称为时间戳加文件名后缀
                            elementA.download = +new Date() + ".txt";
                            elementA.style.display = 'none';

                            //生成一个blob二进制数据，内容为json数据
                            var blob = new Blob([data]);
                            console.log(blob)

                            //生成一个指向blob的URL地址，并赋值给a标签的href属性
                            elementA.href = URL.createObjectURL(blob);
                            document.body.appendChild(elementA);
                            elementA.click();
                            document.body.removeChild(elementA);
                        }
                    });

                    layer.close(index);

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
        } else if (obj.event === 'edit2') {
            showwin('修改信息', 'listform.asp?editor=no&id=' + pid)
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
                data: { "title":  value  },
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


<script type="text/javascript" src="../../js/pc.js"></script>	

</body>

</html>
