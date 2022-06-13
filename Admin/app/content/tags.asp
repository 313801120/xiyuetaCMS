<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,idList,columnname,splxx,sortrank,id,isthrough

'网站栏目查询
If Request("act") = "list" Then 
	idList=getColumAllID("-1")
	splxx=split(idList,",")

    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 
    sql1 = "select * from ["& db_PREFIX &"WebColumn]" 

    if  idList<>"" then 
    	sql1=sql1 & " where id in("& idlist  &")"
    else
    	sql1=sql1 & " where parentId=-1"
    end if
    If Request("date_min") <> "" Then
        sql = sql & " and datediff('d',createTime,#" & Request("date_min") & "#)<=0" 
    End If 
    If Request("date_max") <> "" Then
        sql = sql & " and datediff('d',createTime,#" & Request("date_max") & "#)>=0" 
    End If 
    If Request("key") <> "" Then
        sql = " and [columnname] like '%" & Request("key") & "%' " 
    End If 
    mysql = sql1 & sql' & " order by sortrank asc" 
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


    		rsx.open"select * from ["& db_PREFIX &"webcolumn] where id="&splxx(i-1),conn,1,1
	    	if not rsx.eof then
	            if rsx("parentid")<>-1 then
	            	columnname=getSubColumSort(rsx("parentid"),"")  & rsx("columnname")
	            else
	            	columnname=rsx("columnname")
	            end if
                

 
                isthrough=""
                if rsx("isthrough")<>0 then
                    isthrough=" checked"
                end if 

	            stemp = stemp & "{""id"":""" & rsx("id") & """,""flags"":""" & rsx("flags") & """,""name"":""" & columnname & """,""isthrough"":""" & isthrough & """,""sortrank"":""" & rsx("sortrank") & """}" &sHr & "" 
        	end if:rsx.close
 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 
    

    rs.close
    stemp=replace(stemp,"\","\\")
    call die(stemp)

elseif request("act")="del" then
  conn.execute"delete from ["& db_PREFIX &"webcolumn] where id="&request("id")
  response.write "{""info"": ""删除成功"",""status"": ""y""}"
  Response.end()

'在线修改
elseif request("act")="onlineedit" then 
  sortrank=handleNumber(request("sortrank"))
  id=request("id")
  if sortrank="" or id="" then
    call die("{""info"": ""修改成功"&id&""",""status"": ""n""}")
  else
    conn.execute"update ["& db_PREFIX &"webcolumn] set  sortrank='"&sortrank&"' where id="&id
    call die("{""info"": ""修改成功"&id&""",""status"": ""y""}")
   end if 
'通过或取消'
elseif request("act")="isthrough" then
    conn.execute"update ["& db_PREFIX &"webcolumn] set isthrough="&IIF(request("isthrough")="true",1,0) &" where id="&request("id")
    response.write "{""info"": ""设置成功"",""status"": ""y""}"
    Response.end()
End If 



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站栏目</title>
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
  
      
  <button class="layui-btn" data-type="reload">搜索</button>
  <button class="layui-btn" onclick="showwin('添加栏目','tagsform.asp?')">添加</button>
</div>
 

 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
</script>
<table class="layui-hide" id="table" lay-filter="demo"></table>
 

<script>
layui.use(['form','table'],function(){
    var form = layui.form
        table = layui.table; 

    //方法级渲染
    table.render({
        elem: '#table',
        url: '?act=list',
        cols: [
            [

                { field: 'id', title: 'ID', width: 70, minWidth: 70, sort: false }
                , { field: 'name', title: '分类名', sort: false }
                , { field: 'flags', title: '位置', width: 100, sort: false }
                , { field: 'sortrank', title: '排序', width: 70, minWidth: 70, edit: 'text', sort: false }
                 ,{field: 'isthrough', title: '是否显示',width:100, align:'center', templet:function(d){
                    return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
                , { fixed: 'right', title: '操作', width: 150, toolbar: '#barDemo' }


            ]
        ],
        id: 'testReload',
        page: true,
        limit: 90
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
            layer.confirm('确定删除此分类？',{icon:3, title:'提示信息'}, function(index) {
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
            showwin('修改栏目', 'tagsform.asp?id=' + pid)        
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
                data: { "sortrank":  value  },
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
