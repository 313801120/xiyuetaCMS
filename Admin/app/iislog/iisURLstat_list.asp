<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 

 

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,columnName,id,title,parentid,isthrough,tags
dim spider,nLen
parentid=request("parentid")
'网站栏目查询
If Request("act") = "list" Then  

    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 
    sql1 = "select * from ["& db_PREFIX &"iisurlstat]" 

    
    If Request("date_min") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & getAccessDatediffTime("browsetime",Request("date_min")) & "<=0" 
    End If 
    If Request("date_max") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & getAccessDatediffTime("browsetime",Request("date_max")) & ">=0" 
    End If 

    If request("filetypeSQL") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & request("filetypeSQL")
    End If
 
    If Request("key") <> "" and request("searchField")<>"" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql =sql & "["& request("searchField") &"] like '%" & Request("key") & "%' " 
    End If
 

    mysql = sql1 & sql & request("sqlOrderyBy")
    ' call die(mysql)
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
 
  

	       stemp = stemp & "{""id"":""" & rs("id") & """,""url"":""" & jsonCL(rs("url")) & """,""urlcount"":""" &rs("urlcount") & """,""statuscode"":""" &rs("statuscode") & """,""createtime"":""" & rs("createtime") & """}" &sHr & "" 
    
 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()

elseif request("act")="del" then
  conn.execute"delete from ["& db_PREFIX &"iisurlstat] where id in("&request("id")&")"
  response.write "{""info"": ""删除成功"",""status"": ""y""}"
  Response.end()
'在线修改
elseif request("act")="onlineedit" then 
  title=request("title")
  id=request("id")
  rs.open"select * from ["& db_PREFIX &"iisurlstat] where title='"& title &"' and id<>" & id,conn,1,1
  if not rs.eof then
    response.write "{""info"": ""名称存在"",""status"": ""n"",""title"": """&rs("title")&"""}"  
  else
    conn.execute"update ["& db_PREFIX &"iisurlstat] set  title='"&title&"' where id="&id
    response.write "{""info"": ""修改成功"&id&""",""status"": ""y""}"
  end if:rs.close
  Response.end()
'通过或取消'
elseif request("act")="isthrough" then
    conn.execute"update ["& db_PREFIX &"iisurlstat] set isthrough="&IIF(request("isthrough")="true",1,0) &" where id="&request("id")
    response.write "{""info"": ""设置成功"",""status"": ""y""}"
    Response.end()

'清空数据'
elseif request("act")="cleardata" then 
    dim splstr,s
    conn.execute"delete from ["& db_PREFIX &"iisurlstat]"
    call die("清空数据完成")
    Response.end()
'处理iis日志'
elseif request("act")="handleIISIP" then 
    call handleIISIP()
    Response.end()
End If 

'处理IIS日志到IP'
sub handleIISIP()
    dim i,nCount,nLen 
    call openconn()
    rs.open"select url from ["& db_PREFIX &"iislog] GROUP BY url",conn,1,1
    for i=1 to 3000
        if rs.eof then exit for
        '总记录数'
        rsx.open"select count(*) as tj from ["& db_PREFIX &"iislog] where url='"& rs("url") &"'",conn,1,1
        nCount=IIF(isnull(rsx("tj"))=true,0,rsx("tj")):rsx.close
    
      call echo("nCount",nCount):doevents
      rsx.open"select * from ["& db_PREFIX &"iisurlstat] where url='"& rs("url") &"'",conn,1,3
      if rsx.eof then
        rsx.addnew
        rsx("url")=rs("url")
        rsx("filetype")=getFileAttr(rs("url"),"4")
        rsx("urlcount")=nCount  

        rss.open"select statuscode from ["& db_PREFIX &"iislog] where url='"& rs("url") &"'",conn,1,1
        if not rss.eof then
            rsx("statuscode")=rss("statuscode")  '状态码'
        end if:rss.close
        
        rsx.update
      end if:rsx.close
       
    rs.movenext:next
    call echo("总数",rs.recordcount ) 
end sub



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IIS日志管理</title>
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
        <select name="filetypeSQL">
        <option value="">选择文件后缀</option> 
        <option value=" (filetype='' or filetype='asp' or filetype='php' or filetype='htm'  or filetype='html') "  >网址</option> 
        <option value="filetype='asp'">asp</option>   
        <option value="filetype='htm'">htm</option>  
        <option value="filetype='html'">html</option>  
        <option value="filetype='css'">css</option>  
        <option value="filetype='js'">js</option>  
        <option value="filetype='txt'">txt</option>  
        <option value="filetype='xml'">xml</option>  
        <option value="filetype='php'">php</option>  
        </select> 
    </div>
 
    <div class="layui-inline"> 
        <select name="sqlOrderyBy">
        <option value="">选择排序</option>  
        <option value=" order by urlcount">网址统计正排序</option> 
        <option value=" order by urlcount desc">网址统计倒排序</option>    
        <option value=" order by statuscode">状态码正排序</option> 
        <option value=" order by statuscode desc">状态码倒排序</option>  
        <option value=" order by urltime">日期正排序</option> 
        <option value=" order by urltime desc">日期倒排序</option>  
        </select> 
    </div>

    <div class="layui-inline"> 
        <select name="searchField">
        <option value="incomingroad">选择搜索字段</option> 
        <option value="url">URL</option>   
        <option value="statuscode">状态码</option>   
        </select> 
    </div>
         

  <div class="layui-inline"> 
 
    <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称" onkeypress="if (event.keyCode === 13) {$('button[data-type=reload]').click(); }">
    </div>



      
  <button class="layui-btn" data-type="reload">搜索</button>
  <!-- <button class="layui-btn" onclick="showwin('添加信息','listform.asp?')">添加</button> -->
          <button class="layui-btn" data-type="batchdel">删除</button>  
  <button class="layui-btn" onclick="cleardata()">清空数据</button> 
  <button class="layui-btn" onclick="handleIISIP()">处理iis日志</button> 

</div>
 

 <script type="text/html" id="barDemo">
  <!-- <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>  -->
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
</script>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
 
<script> 
function handleIISIP(){
     layer.confirm('确定要处理iis日志？', function(index) {   
        layer.close(index);
        var winObj=layer.open({
          title: '处理iis日志'
          ,content: '正在处理iis日志，请等待！'
        }); 

        $.ajax({
            type: "POST",
            cache: true,
            // dataType: "json",
            url: "?act=handleIISIP", 
            success: function(data) {
                table.reload('testReload');
                layer.msg('处理iis日志完成！');
            }
        });

    });
}
function cleardata(){
     layer.confirm('确定要清空数据吗？', function(index) {   
        layer.close(index);
        var winObj=layer.open({
          title: '清空数据'
          ,content: '正在清空数据，请等待！'
        }); 

        $.ajax({
            type: "POST",
            cache: true,
            // dataType: "json",
            url: "?act=cleardata", 
            success: function(data) {
                table.reload('testReload');
                layer.msg('清空数据完成！');
            }
        });

    });
}
layui.use(['form','table','upload'],function(){
    var form = layui.form
        table = layui.table; 

    var upload = layui.upload
    upload.render({
        elem: '#importXls',
        url: '/api/upload/uploadIISLog.asp',
        exts: 'log', //只允许上传log文件
        done: function(res) {
            // alert("res.data[0].src="+res.data[0].src)
            
             var winObj=layer.open({
                  title: '提示'
                  ,content: "正在导入IIS数据，请等待！"
                });  
            
              $.get('handleIISLog.asp?act=send', {
                    logPath:res.data[0].src
                }, function (strData) {
                    table.reload('testReload');
                    layer.msg(strData);

                })
        }
    });

    //方法级渲染
    table.render({
        elem: '#demo',
        url: '?act=list',
 
        cols: [
            [
                {type: 'checkbox', fixed: 'left'},
                { field: 'id', title: 'ID', width: 70, sort: true } 
                , { field: 'urlcount', title: '访问总数',width:120, sort: true }
                , { field: 'url', title: '网址',minWidth:140, sort: true } 
                , { field: 'statuscode', title: '状态码', width:90, sort: true }
                , { field: 'urltime', title: '日期',width:160, sort: true }
                // , { field: 'createtime', title: '发布时间', width: 160, sort: true }
                , { fixed: 'right', title: '操作', width: 90, toolbar: '#barDemo' }


            ]
        ],
        id: 'testReload',
        page: true,
        limit: 20   //太大加载会很慢
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
                        ,sqlOrderyBy: $('select[name=sqlOrderyBy]').val()
                        ,searchField: $('select[name=searchField]').val()
                        ,spider: $('select[name=spider]').val()
                        ,filetypeSQL: $('select[name=filetypeSQL]').val()
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
