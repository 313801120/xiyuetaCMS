<!--#include file="../../inc/Config.asp"--><!--#Include File = "../admin_function.asp"--><!--#Include File = "../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,c,s,splstr,cList,filePath,nFileSize,nSize,isHandle,mdbFilePath,accessPath,content,configFilePath,startStr,endStr,findStr,replaceStr

mdbFilePath=handlePath(MDBPath)
'列表查询
If Request("act") = "list" Then  
    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 
 

    c=getDirFileNameList("../../data", "mdb")
    splstr=split(c,vbcrlf)
    for i=0 to ubound(splstr)
        s=replace(splstr(i),".mdb","")
        if cList<>"" then cList=cList & ","   
        filePath=handlePath("../../data/"&splstr(i))
        isHandle=true
        if lcase(filePath)=lcase(mdbFilePath) then isHandle=false
        cList = cList & "{""i"":""" & (i+1) & """,""name"":""" & s & """,""size"":""" & printFileSize(getfSize(filePath)) & """,""time"":""" & getFileEditDate(filePath) & """,""isHandle"":""" & isHandle & """}"
    next
        	 
  

  

    stemp = stemp & cList & "],""count"":""" & ubound(splstr) & """,""code"":""0"",""msg"":""""}" 

    call die(stemp)
'恢复'
elseif request("act")="recover" then

    if userrs("pwd")<>mymd5(request("pwd")) then
        call die("{""info"": ""验证密码错误，删除失败"",""status"": ""n""}")
    elseif userrs("level")<>1 then
        call die("{""info"": ""只有超级管理员才可操作，删除失败"",""status"": ""n""}")
    end if

    accessPath="/data/" & request("name") &".mdb"
    configFilePath="../../inc/Config.Asp"
    content=readfile(configFilePath,"")
 
    '数据库
    startStr = "MDBPath = """ : endStr = """" 
    if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
        findStr = getStrCut(content, startStr, endStr, 1) 
        replaceStr = startStr & accessPath & endStr 
        content = replace(content, findStr, replaceStr) 
        call writeToFile(configFilePath, content, "") 
    end if 

    call die("{""info"": ""备份数据成功"",""status"": ""y""}") 

'备份'
elseif request("act")="backup" then
  call copyfile(mdbFilePath,"../../data/backup_" & format_Time(now(),6) & ".mdb")
  call die("{""info"": ""备份数据成功"",""status"": ""y""}")

'删除'
elseif request("act")="del" then
    if userrs("pwd")<>mymd5(request("pwd")) then
        call die("{""info"": ""验证密码错误，删除失败"",""status"": ""n""}")
    elseif userrs("level")<>1 then
        call die("{""info"": ""只有超级管理员才可操作，删除失败"",""status"": ""n""}")    
    end if
    filePath="../../data/"& request("name") &".mdb"  '要删除文件的路径'
    'call deleteFile()
    call moveFile(filePath,filePath & ".delete")

  call die("{""info"": ""删除数据成功"",""status"": ""y""}")

'压缩数据库'
elseif request("act")="zip" then     
    nFileSize=getfSize(mdbFilePath)
    call compactDB(mdbFilePath, False) 
    nSize=nFileSize-getfSize(mdbFilePath)
    call die("{""info"": ""压缩数据库成功，压缩大小为("& printFileSize(nSize) &")"",""status"": ""y""}")

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
  <button class="layui-btn" onclick="submitZipData()">压缩数据库</button>
</div>
 

  <script type="text/html" id="barDemo">

    {{#  if(d.isHandle == 'False'){ }} 
        当前使用数据库
    {{#  } else { }}
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="recover"><i class="layui-icon layui-icon-edit"></i>恢复</a>
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
        url: '?act=list',
        cols: [
            [

                { field: 'i', title: '序号', width: 70, sort: true }
                , { field: 'name', title: '名称', minWidth: 120, sort: false } 
                , { field: 'size', title: '文件大小', width: 120, sort: false } 
                , { field: 'time', title: '最后修改时间', width: 160, sort: false } 
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
            layer.prompt({
                formType: 1,
                title: '敏感操作，请验证密码'
            }, function(value, index) {
                layer.close(index);


                layer.confirm('确定删除此数据库？',{icon:3, title:'提示信息'}, function(index) {
                    $.ajax({
                        type: "POST",
                        cache: true,
                        dataType: "json",
                        url: "?act=del",
                        data: { "name": name,"pwd":value }, 
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


        } else if (obj.event === 'recover') {
            layer.prompt({
                formType: 1,
                title: '敏感操作，请验证密码'
            }, function(value, index) {
                layer.close(index);

                layer.confirm('确定恢复些数据库',{icon:3, title:'提示信息'}, function(index) {
                    $.ajax({
                        type: "POST",
                        cache: true,
                        dataType: "json",
                        url: "?act=recover",
                        data: { "name": name,"pwd":value }, 
                        success: function(data) {  
                        layer.msg(data.info);
                            switch (data.status) {
                                case "y":
                                    location.reload(true);
                                    break;
                                case "n":                   
                                    break;
                            }  
                        }
                    });
                    layer.close(index);

                });
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
function submitZipData(){
     layer.confirm('确定要压缩数据库',{icon:3, title:'提示信息'}, function(index) {
        $.ajax({
            type: "POST",
            cache: false,
            dataType: "json",
            url: "?act=zip",  
            success: function(data) {
                layer.msg(data.info, {icon: 1});
            }
        });
        layer.close(index);
    });
}
</script>
<script type="text/javascript" src="../js/pc.js"></script>

</body>
</html>