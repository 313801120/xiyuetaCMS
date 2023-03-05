<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><%  
call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,columnName,id,title,isthrough,createtime,sData,userid
dim username,chattype,bodycontent,nickname 

'获得最新聊天的ID'
if request("act")="getNewChat" then
    rs.open"select * from ["& db_PREFIX &"chat] where isdel=0 order by id desc" ,conn,1,1
    if not rs.eof then
        call die(rs("id"))
    end if:rs.close
    call die("没有记录")

'列表查询
elseIf Request("act") = "list" Then  

    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 

    ' sql1 = "select * from ["& db_PREFIX &"order]" 
 
    
    ' rs.open"select userid from ["& db_PREFIX &"chat] group by userid ",conn,1,1


    ' sql="select userid from ["& db_PREFIX &"chat] group by userid"

     sql1 = "select * from ["& db_PREFIX &"member] "


    ' sql1="select A.id,A.nickname,A.chatendtime from ["& db_PREFIX &"member] as A left outer join ["& db_PREFIX &"chat] as B on A.id=B.userid"


 
     
    If Request("date_min") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & getAccessDatediffTime("createtime",Request("date_min")) & "<=0" 
    End If 
    If Request("date_max") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql = sql & getAccessDatediffTime("createtime",Request("date_max")) & ">=0" 
    End If

    If Request("key") <> "" Then
      sql=IIF(sql=""," where ",sql & " and ")
      sql =sql & "[username] like '%" & Request("key") & "%' " 
    End If 
    mysql = sql1 & sql & " order by chatendtime desc" 
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


 
            bodycontent=""
            rsx.open"select * from ["& db_PREFIX &"chat] where userid="& rs("id") &" and isdel=0 order by id desc",conn,1,1
            if not rsx.eof then
                bodycontent=jsonCL( handleBodyQQFace(rsx("bodycontent")))
                id=rsx("id")
            end if:rsx.close 

 
        if rs("id")<>0 then
            if sData<>"" then sData=sData & "," 
	       sData = sData & "{""id"":""" & id & """,""userid"":""" & rs("id") & """,""bodycontent"":""" & bodycontent & """,""nickname"":""" & rs("nickname") & """,""createtime"":""" & rs("chatendtime") & """}"  
           end if    
 

            rs.MoveNext
        Wend 
    End If 

    stemp = stemp & sData & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()

elseif request("act")="del" then    
    userid=request("userid")'要删除ID'
    rs.open"select * from ["& db_PREFIX &"chat] where ( (userid="& userid & " and touserid=0) or (userid=0 and touserid="& userid & ") )",conn,1,3

    response.write "{""info"": ""删除成功，共 "& rs.recordcount &" 条"",""status"": ""y""}"
    if not rs.eof then
        ' rs.delete
        ' rs.update
        conn.execute("delete from ["& db_PREFIX &"chat] where ( (userid="& userid & " and touserid=0) or (userid=0 and touserid="& userid & ") )")
        ' call eerr(userid,"update from ["& db_PREFIX &"chat] set isdel=0 where ( (userid="& userid & " and touserid=0) or (userid=0 and touserid="& userid & ") )")
        ' conn.execute("update ["& db_PREFIX &"chat] set isdel=0 where ( (userid="& userid & " and touserid=0) or (userid=0 and touserid="& userid & ") )")
    end if:rs.close
    Response.end()

End If 



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>部件列表</title>
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
  <!-- <button class="layui-btn" onclick="showwin('添加信息','listform.asp?')">添加</button> -->
          <button class="layui-btn" data-type="batchdel">删除</button>

</div>
 

 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>回复</a> 
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
</script>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
 
<script>
layui.use(['form','table'],function(){
    var form = layui.form
        table = layui.table; 

    //方法级渲染
    table.render({
        elem: '#demo',
        url: '?act=list',
        cols: [
            [
                {type: 'checkbox', fixed: 'left'},
                { field: 'id', title: 'ID', width: 70, sort: false } 

                // , { field: 'chattype', title: '用户/客服', width: 120, sort: true }
                , { field: 'userid', title: '会员ID', width: 90,  sort: true }
                , { field: 'nickname', title: '会员昵称', width: 110,  sort: true }
                , { field: 'bodycontent', title: '聊天内容',  sort: true }
                , { field: 'createtime', title: '发布时间', width: 160, sort: true }
                 // ,{field: 'isthrough', title: '是否发货',width:100, align:'center', templet:function(d){
                 //    return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
                // , { fixed: 'right', title: '操作', width: 160, toolbar: '#barDemo' }

  , { fixed: 'right', title: '操作', width: 210, templet:function(d){
return '<a class="layui-btn layui-btn-xs layui-btn-normal" target="_blank" href="/kf.asp?type=hf&touserid='+d.userid+'"><i class="layui-icon layui-icon-edit"></i>聊天</a>  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除聊天记录</a> '

}}



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
        var userid = obj.data["userid"]
        if (obj.event === 'del') {
            layer.confirm('你确定要删除与 “'+obj.data["nickname"]+'” 全部聊天记录吗？',{icon:3, title:'提示信息'}, function(index) {
                $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "json",
                    url: "?act=del",
                    data: { "userid": userid },
                    success: function(data) {

                        switch (data.status) {
                            case "y":
                                // obj.del();
                                layer.msg(data.info, {icon: 1});
                                break;
                        }
                    }
                });
                layer.close(index);
            });

        } else if (obj.event === 'edit') {
            showwin('修改信息', 'listform.asp?userid=' + obj.data["userid"])
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
getChatUpdate();
setInterval(getChatUpdate, 5000);
</script>


<script type="text/javascript" src="../../js/pc.js"></script>	

</body>

</html>
