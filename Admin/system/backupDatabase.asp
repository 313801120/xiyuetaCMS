<!--#include file="../../inc/Config.asp"--><!--#Include File = "../admin_function.asp"--><!--#Include File = "../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,c,s,splstr,cList

'列表查询
If Request("act") = "list" Then  
    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 
 

    c=getDirFileNameList("../../data", "mdb")
    splstr=split(c,vbcrlf)
    for i=0 to ubound(splstr)
        s=replace(splstr(i),".mdb","")
        if instr(s,"backup_")>0 then
            if cList<>"" then cList=cList & ","     
	        cList = cList & "{""i"":""" & (i+1) & """,""name"":""" & s & """}"
        end if
    next
        	 
  

  

    stemp = stemp & cList & "],""count"":""" & ubound(splstr) & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp  
    Response.end()
'恢复'
elseif request("act")="recover" then
  call copyFile("../../data/data.mdb","../../data/del_" & format_Time(now(),6) & ".mdb")'先移除原数据'  
  call deleteFile("../../data/data.mdb")
  call moveFile("../../data/"& request("name") &".mdb","../../data/data.mdb")'恢复数据'
  response.write "{""info"": ""备份数据成功"",""status"": ""y""}"
  Response.end()
'备份'
elseif request("act")="backup" then
  call copyfile("../../data/data.mdb","../../data/backup_" & format_Time(now(),6) & ".mdb")
  response.write "{""info"": ""备份数据成功"",""status"": ""y""}"
  Response.end()
elseif request("act")="del" then
  call deleteFile("../../data/"& request("name") &".mdb")
  response.write "{""info"": ""删除数据成功"",""status"": ""y""}"
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
   
      
  <button class="layui-btn" data-type="reload">搜索</button> 
  <button class="layui-btn" onclick="submitBackupData()">备份数据</button>
</div>
 

  <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>恢复</a>
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

                { field: 'i', title: '序号', width: 70, sort: true }
                , { field: 'name', title: '名称', minWidth: 120, sort: false } 
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
        var name = obj.data["name"]
        if (obj.event === 'del') {
            layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'}, function(index) {
                $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "json",
                    url: "?act=del",
                    data: { "name": name },
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
             layer.confirm('确定要恢复数据',{icon:3, title:'提示信息'}, function(index) {
                $.ajax({
                    type: "POST",
                    cache: false,
                    dataType: "json",
                    url: "?act=recover",  
                    data: { "name": name },
                    success: function() {
                        location.reload(true);
                    }
                });
                layer.close(index);
            });


        }

    });
});
function submitBackupData(){
     layer.confirm('确定要备份数据',{icon:3, title:'提示信息'}, function(index) {
        $.ajax({
            type: "POST",
            cache: false,
            dataType: "json",
            url: "?act=backup",  
            success: function() {
                location.reload(true);
            }
        });
        layer.close(index);
    });
}
</script>
<script type="text/javascript" src="../js/pc.js"></script>

</body>
</html>