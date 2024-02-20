<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 

 

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,totalrec,columnName,id,title,parentid,isthrough,tags
dim spider,nLen,startIndex,endIndex,sql2,pageSize,nCount,x,maxpage,iPageSize
parentid=request("parentid")
'网站栏目查询
If Request("act") = "list" Then  

    num = Request("limit")
    page = Request("page")
    stemp = ""
    sql1 = "select * from ["& db_PREFIX &"iislog]" 

    '20240125'
    pageSize=cint(num)
    If Request("page") = "" Then
        currentPage = 1 
    Else
        currentPage = CInt(Request("page")) 
    End If
    startIndex = (currentPage - 1) * pageSize + 1
    endIndex = startIndex + pageSize - 1
    
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


    if databaseType = "sqlserver"  then
        rs.open"select count(*)as ct from ["&db_PREFIX&"iislog]" & sql ,conn,1,1
        nCount=IIF(isnull(rs("ct"))=true,0,rs("ct")):rs.close

        if sqlServerVersion="2012" or sqlServerVersion="2014" then            
            mysql= "select * from ["& db_PREFIX &"iislog] " & sql & "  order by id desc OFFSET "& (pageSize*(currentPage-1)) &" ROWS FETCH NEXT "& pageSize &" ROWS ONLY"
                ' SELECT *  
                ' FROM Employees  
                ' ORDER BY EmployeeID  
                ' OFFSET 90 ROWS -- 跳过前9页的记录  
                ' FETCH NEXT 10 ROWS ONLY; -- 取接下来的10条记录 
        elseif sqlServerVersion="2008" then
            if left(sql,8)=" where " then sql=" " & mid(sql,8)
            mysql="SELECT TOP (" & num & ") * FROM (SELECT ROW_NUMBER() OVER ( order by id desc) AS RowNum, * FROM "& db_PREFIX &"iislog) AS SubQuery WHERE RowNum BETWEEN " & startIndex & " AND " & endIndex & sql

            '第二种方法，效果一样'
            'mysql="WITH NumberedRows AS (SELECT *, ROW_NUMBER() OVER ( order by id desc) AS RowNum FROM "& db_PREFIX &"iislog ) SELECT * FROM NumberedRows WHERE RowNum BETWEEN " & startIndex & " AND " & endIndex & sql
        end if

    else
        '追加sql部分'
        mysql = sql1 & sql & " order by id desc"'" order by sortrank" 
    end if



    'call die(mysql)
    rs.Open mysql, conn, 1, 1 

    If Not rs.EOF Then
        '为access数据库'
        if databaseType = "access"  then
            iPageSize = num 
            rs.PageSize = iPageSize 
            rs.AbsolutePage = currentPage 
            nCount=rs.recordcount  '总条数'
            maxpage=rs.PageCount 

            if page=maxpage then
                x=nCount-(maxpage-1)*iPageSize
            else
                x=iPageSize
            end if 
        else
            x=num
        end if 
 
        For i=1 To x 
            if rs.eof then exit for'在最后退出    
            if stemp<>"" then stemp=stemp & ","
 
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

                    if spider="spider" and instr(rs("incomingroad"),"sogou.com")>0 then
                        spider="sogou"
                    end if
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
 

	       stemp = stemp & "{""id"":""" & rs("id") & """,""browsetime"":""" &rs("browsetime") & """,""url"":""" & jsonCL(rs("url")) & """,""method"":""" & jsonCL(rs("method")) & """,""urlparameter"":""" &jsonCL(rs("urlparameter")) & """,""port"":""" &rs("port") & """,""username"":""" & jsonCL(rs("username")) & """,""userip"":""" &rs("userip") & """,""useripaddr"":""" &ipToAddr2022(rs("userip"),"all") & """,""incomingroad"":""" & jsonCL(rs("incomingroad")) & """,""statuscode"":""" &rs("statuscode") & """,""bottomstatuscode"":""" &rs("bottomstatuscode") & """,""win32statuscode"":""" &rs("win32statuscode") & """,""handletime"":""" &rs("handletime") & """,""filename"":""" & jsonCL(rs("filename")) & """,""filetype"":""" &rs("filetype") & """,""spider"":""" & spider & """,""createtime"":""" & rs("createtime") & """}" 
    
 

            rs.MoveNext 
        next 
    End If 

    stemp ="{""data"":[" & stemp & "],""count"":""" & nCount & """,""code"":""0"",""msg"":"""& vbEchoTimer() &""",""mysql"":"""& jsonCL(mysql) &"""}" 

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

'清空数据'
elseif request("act")="cleardata" then 
    dim splstr,s
    conn.execute"delete from ["& db_PREFIX &"iislog]"   
 

    call die("清空数据完成")
    Response.end()
End If 



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
        <option value="url">URL</option>  
        <option value="incomingroad">来路</option> 
        <option value="statuscode">状态码</option>  
        <option value="userip">用户IP</option>  
        </select> 
    </div>

                        

  <div class="layui-inline"> 
 
    <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称" onkeypress="if (event.keyCode === 13) {$('button[data-type=reload]').click(); }">
    </div>



      
  <button class="layui-btn" data-type="reload">搜索</button>
  
  <!-- <button class="layui-btn" onclick="showwin('添加信息','listform.asp?')">添加</button> -->

          <button class="layui-btn" data-type="batchdel">删除</button> 
  <button class="layui-btn" id="importXls">导入</button> 
  <button class="layui-btn" onclick="cleardata()">清空数据</button> 

</div>
 

 <script type="text/html" id="barDemo">
  <!-- <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>  -->
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
</script>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
 
<script> 
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
                {type: 'checkbox', fixed: 'left'},
                { field: 'id', title: 'ID', width: 70, sort: true }
                , { field: 'spider', title: '蜘蛛',width:140, sort: true }
                , { field: 'filename', title: '文件名',width:100, sort: true }
                , { field: 'filetype', title: '文件类型',width:105, sort: true }
                , { field: 'browsetime', title: '日期时间',width:160, sort: true }
                , { field: 'method', title: '方法', width:80, sort: true }
                , { field: 'url', title: 'URL',minWidth:80, sort: true }
                , { field: 'urlparameter', title: 'URL参数',minWidth:110, sort: true }
                , { field: 'port', title: '端口', width:80, sort: true }
                , { field: 'username', title: '用户名', width:100, sort: true }
                , { field: 'userip', title: '用户IP', width:140, sort: true }
                , { field: 'useripaddr', title: '用户IP地址', width:240, sort: true }
                , { field: 'incomingroad', title: '来路', width:120, sort: true }
                , { field: 'statuscode', title: '状态码', width:90, sort: true }
                , { field: 'bottomstatuscode', title: '底层状态码', width:130, sort: true }
                , { field: 'win32statuscode', title: 'Win32状态', width:120, sort: true }
                , { field: 'handletime', title: '处理时间', width:120, sort: true }
                // , { field: 'createtime', title: '发布时间', width: 160, sort: true }
                , { fixed: 'right', title: '操作', width: 90, toolbar: '#barDemo' }


            ]
        ],
        id: 'testReload',
        page: true,
        limit: 20
        ,limits:[10,20,30,40,50,60,70,80,90,200,500,1000]   //选择每页显示条数
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
