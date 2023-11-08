<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 

'严格排序方法，但数据太多时，会显示慢'

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,idList,name,splxx,isthrough,sData


'获得全部栏目ID列表 20210321  如1,4,5,6,2,6,8,9
function getxiyuetaclassIdList(parentid,addSql)
    dim rs:Set rs = CreateObject("Adodb.RecordSet")
    dim c,s
    rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where parentId="&parentid & addSql &  " order by sortrank asc,id asc",conn,1,1
    while not rs.EOF 
        if c<>"" then c=c & ","
        c=c & rs("id")
        s=getxiyuetaclassIdList(rs("id"),addSql)
        if s<>"" then
            c=c & "," & s
        end if
    rs.movenext:wend:rs.close 
    getxiyuetaclassIdList=c
end function
'获得子栏目树状20210331  如  ├─栏目名称
function getSubxiyuetaclassSort(parentid,subStr)
    dim rs:Set rs = CreateObject("Adodb.RecordSet")
    rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where id="&parentid,conn,1,1
    if not rs.eof then
        if subStr<>"" then
            subStr="&nbsp;&nbsp;" & subStr
        else
            subStr=subStr & "&nbsp;&nbsp;├─" 
        end if
        if rs("parentId")<>-1 then
            call getSubxiyuetaclassSort(rs("parentId"),subStr)
        end if
    end if:rs.close
    getSubxiyuetaclassSort=subStr
end function
'网站栏目查询
If Request("act") = "list" Then 
	idList=getxiyuetaclassIdList("-1","")
	splxx=split(idList,",")

    dim nStart,nEnd
    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 
    sData=""
    nStart=num*(page-1) 
    nEnd=num*page
    if nEnd>ubound(splxx) then nEnd=ubound(splxx)
    for i=nStart to nEnd
        rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where id="&splxx(i),conn,1,1
        if not rs.eof then
            if sData<>"" then sData=sData & ","
            isthrough=""
            if rs("isthrough")<>0 then
                isthrough=" checked"
            end if
            name=rs("columnName")
            if rs("parentId")<>-1 then
                name=getSubxiyuetaclassSort(rs("parentid"),"") &name
            end if
            

	       sData=sData &"{""id"":""" & rs("id") & """,""name"":""" & name & """,""isthrough"":""" & isthrough & """,""sortrank"":""" & rs("sortrank") & """}" &sHr & ""  
        end if:rs.close
        
    next
    stemp = stemp & sData & "],""count"":""" & ubound(splxx) & """,""code"":""0"",""msg"":""""}" 

    stemp=replace(stemp,"\","\\")
    call die(stemp)

elseif request("act")="del" then
  conn.execute"delete from ["& db_PREFIX &"xiyuetaclass] where id="&request("id")
  response.write "{""info"": ""删除成功"",""status"": ""y""}"
  Response.end()

'通过或取消'
elseif request("act")="isthrough" then
    conn.execute"update ["& db_PREFIX &"xiyuetaclass] set isthrough="&IIF(request("isthrough")="true",1,0) &" where id="&request("id")
    response.write "{""info"": ""设置成功"",""status"": ""y""}"
    Response.end() 

End If 



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站栏目</title>
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
  
      
  <button class="layui-btn" data-type="reload">搜索</button>
  <button class="layui-btn" onclick="showwin('添加栏目','listform2.asp?')">添加</button>
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
                , { field: 'sortrank', title: '排序', width: 70, minWidth: 70, sort: false }
                , { fixed: 'right', title: '操作', width: 150, toolbar: '#barDemo' }


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
            showwin('修改栏目', 'listform2.asp?id=' + pid)        
        }
    });







});
</script>



<script type="text/javascript" src="../../js/pc.js"></script>	

</body>

</html>
