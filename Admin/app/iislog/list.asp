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
    sql1 = "select * from ["& db_PREFIX &"iislog]" 

    
    If Request("date_min") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & getAccessDatediffTime("browsetime",Request("date_min")) & "<=0" 
    End If 
    If Request("date_max") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & getAccessDatediffTime("browsetime",Request("date_max")) & ">=0" 
    End If 
    If parentid <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & "parentid="&parentid
    End If 
    If request("filetypeSQL") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & request("filetypeSQL")
    End If 

    '从来路里找搜索引擎'
    If Request("spider") <> ""  Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql =sql & "[incomingroad] like '%" & Request("spider") & "%' " 
    End If

    If Request("key") <> "" and request("searchField")<>"" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql =sql & "["& request("searchField") &"] like '%" & Request("key") & "%' " 
    End If


    mysql = sql1 & sql & request("sqlOrderyBy")
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
 
            isthrough=""
            if rs("isthrough")<>0 then 
                isthrough=" checked"
            end if 

            spider=""
            nLen=instr(lcase(rs("incomingroad")),"spider")
            if nLen>0 then
                spider=mid(rs("incomingroad"),1,nLen+5)
                nLen=instrrev(spider,"+")
                if nLen>0 then
                    spider=mid(spider,nLen+1)
                end if
            else
                if instr(rs("incomingroad"),"AhrefsBot")>0 then
                    spider="AhrefsBot"
                elseif instr(rs("incomingroad"),"Googlebot")>0 then
                    spider="Googlebot"
                elseif instr(rs("incomingroad"),"SeznamBot")>0 then
                    spider="SeznamBot"
                elseif instr(rs("incomingroad"),"DotBot")>0 then
                    spider="DotBot"
                elseif instr(rs("incomingroad"),"PetalBot")>0 then
                    spider="PetalBot"
                elseif instr(rs("incomingroad"),"BLEXBot")>0 then
                    spider="BLEXBot"
                elseif instr(rs("incomingroad"),"MJ12bot")>0 then
                    spider="MJ12bot"
                elseif instr(rs("incomingroad"),"Applebot")>0 then
                    spider="Applebot"
                elseif instr(rs("incomingroad"),"bingbot")>0 then
                    spider="bingbot"
                elseif instr(rs("incomingroad"),"Neevabot")>0 then
                    spider="Neevabot"
                elseif instr(rs("incomingroad"),"SemrushBot")>0 then
                    spider="SemrushBot"
                end if
                
            end if


	       stemp = stemp & "{""id"":""" & rs("id") & """,""browsetime"":""" &rs("browsetime") & """,""url"":""" &rs("url") & """,""method"":""" &rs("method") & """,""urlparameter"":""" &rs("urlparameter") & """,""port"":""" &rs("port") & """,""username"":""" &rs("username") & """,""userip"":""" &rs("userip") & """,""useripaddr"":""" &look_ip(rs("userip")) & """,""incomingroad"":""" &rs("incomingroad") & """,""statuscode"":""" &rs("statuscode") & """,""bottomstatuscode"":""" &rs("bottomstatuscode") & """,""win32statuscode"":""" &rs("win32statuscode") & """,""handletime"":""" &rs("handletime") & """,""filename"":""" &rs("filename") & """,""filetype"":""" &rs("filetype") & """,""spider"":""" & spider & """,""createtime"":""" & rs("createtime") & """}" &sHr & "" 
    
 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()

elseif request("act")="del" then
  conn.execute"delete from ["& db_PREFIX &"iislog] where id in("&request("id")&")"
  response.write "{""info"": ""删除成功"",""status"": ""y""}"
  Response.end()
'在线修改
elseif request("act")="onlineedit" then 
  title=request("title")
  id=request("id")
  rs.open"select * from ["& db_PREFIX &"iislog] where title='"& title &"' and id<>" & id,conn,1,1
  if not rs.eof then
    response.write "{""info"": ""名称存在"",""status"": ""n"",""title"": """&rs("title")&"""}"  
  else
    conn.execute"update ["& db_PREFIX &"iislog] set  title='"&title&"' where id="&id
    response.write "{""info"": ""修改成功"&id&""",""status"": ""y""}"
  end if:rs.close
  Response.end()
'通过或取消'
elseif request("act")="isthrough" then
    conn.execute"update ["& db_PREFIX &"iislog] set isthrough="&IIF(request("isthrough")="true",1,0) &" where id="&request("id")
    response.write "{""info"": ""设置成功"",""status"": ""y""}"
    Response.end()

'更新文章标签'
elseif request("act")="updateTags" then 
    dim splstr,s
    conn.execute"update ["& db_PREFIX &"iislog] set isthrough=0"  '统计数为0'

    rs.open"select * from ["& db_PREFIX &"articleDetail] where tags<>''" ,conn,1,1
    for i=1 to 500
        if rs.eof then exit for
        tags=phptrim(rs("tags"))
        call echo("tags",tags)
        splstr=split(tags,",")
        for each s in splstr
            if s<>"" then
                rsx.open"select * from ["& db_PREFIX &"iislog] where title='"& s &"'" ,conn,1,3
                if rsx.eof then
                    rsx.addnew
                    rsx("count")=1
                    rsx("title")=s
                    rsx("isthrough")=1
                else
                    rsx("count")=rsx("count")+1
                end if
                rsx.update:rsx.close
            end if
        next
    rs.movenext:next 

    call die("操作完成" & rs.RecordCount)
    Response.end()
End If 



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IIS日志管理</title>
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
        <select name="filetypeSQL">
        <option value="">选择文件后缀</option> 
        <option value=" (filetype='' or filetype='asp' or filetype='htm'  or filetype='html') ">网址</option> 
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
        <select name="spider">
        <option value="">选择搜索蜘蛛</option> 
        <option value="Baiduspider">Baiduspider(百度)</option> 
        <option value="Googlebot">google蜘蛛</option>   
        <option value="YisouSpider">YisouSpider(神马)</option>  
        <option value="Sogou+web+spider">Sogou+web+spider(搜狗)</option>  
        <option value="SemrushBot">SemrushBot</option>  
        <option value="bingbot">bingbot</option>  
        </select> 
    </div>
    <div class="layui-inline"> 
        <select name="sqlOrderyBy">
        <option value="">选择排序</option> 
        <option value=" order by handletime">处理时间正排序</option> 
        <option value=" order by handletime desc">处理时间倒排序</option>  
        </select> 
    </div>

    <div class="layui-inline"> 
        <select name="searchField">
        <option value="incomingroad">选择搜索字段</option> 
        <option value="incomingroad">来路</option> 
        <option value="statuscode">状态码</option>  
        </select> 
    </div>

                        

  <div class="layui-inline"> 
 
    <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称">
    </div>



      
  <button class="layui-btn" data-type="reload">搜索</button>
  <button class="layui-btn" onclick="showwin('添加信息','listform.asp?')">添加</button>
          <button class="layui-btn" data-type="batchdel">删除</button> 
  <button class="layui-btn" id="importXls">导入</button> 

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
        elem: '#importXls',
        url: '/api/upload/uploadIISLog.asp',
        exts: 'log', //只允许上传log文件
        done: function(res) {
            // alert("res.data.src="+res.data.src)
              $.get('handleIISLog.asp?act=send', {
                    logPath:res.data.src
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
                , { field: 'spider', title: '蜘蛛',width:140, sort: true }
                , { field: 'filename', title: '文件名',width:100, sort: true }
                , { field: 'filetype', title: '文件类型',width:120, sort: true }
                , { field: 'browsetime', title: '日期时间',width:160, sort: true }
                , { field: 'method', title: '方法', width:80, sort: true }
                , { field: 'url', title: 'URL',minWidth:80, sort: true }
                , { field: 'urlparameter', title: 'URL参数',minWidth:110, sort: true }
                , { field: 'port', title: '端口', width:80, sort: true }
                , { field: 'username', title: '用户名', width:100, sort: true }
                , { field: 'userip', title: '用户IP', width:140, sort: true }
                , { field: 'useripaddr', title: '用户IP地址', width:140, sort: true }
                , { field: 'incomingroad', title: '来路', width:120, sort: true }
                , { field: 'statuscode', title: '状态码', width:90, sort: true }
                , { field: 'bottomstatuscode', title: '底层状态码', width:130, sort: true }
                , { field: 'win32statuscode', title: 'Win32状态', width:120, sort: true }
                , { field: 'handletime', title: '处理时间', width:120, sort: true }
                // , { field: 'createtime', title: '发布时间', width: 160, sort: true }
                , { fixed: 'right', title: '操作', width: 160, toolbar: '#barDemo' }


            ]
        ],
        id: 'testReload',
        page: true,
        limit: 120
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
