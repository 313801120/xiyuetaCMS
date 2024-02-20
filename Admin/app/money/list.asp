<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn() 
dim num,page,stemp,sql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,columnName,id,title,field,isthrough,httpurl,bodycontent,key,countmonery,sPrice,sInadminid
dim inadminid,sqlWhereinadminid,sqlAndinadminid
inadminid=request("inadminid")

dim shouzhitype:shouzhitype=request("shouzhitype")'收入支出类型'


if inadminid<>"" then
    sqlWhereinadminid=" where A.inadminid="& inadminid  
    sqlAndinadminid=" and A.inadminid="& inadminid  
end if
'网站栏目查询
If Request("act") = "list" Then  
 
    num = Request("limit")
    page = Request("page")
    stemp = "{""data"":[" 

    key=request("key")
    if key="" then key=request("key2")
    countmonery=0  '列表总钱'

sql="select A.id,A.price,A.isthrough,A.bodycontent,A.daytime,A.httpurl,A.localdir,A.inadminid,B.username,B.nickname,B.qq from ["& db_PREFIX &"money] as A left outer join ["& db_PREFIX &"member] as B on A.userid=B.id"
  

    If Request("date_min") <> "" Then
      sqlWhereinadminid=sqlWhereinadminid & IIF(instr(sqlWhereinadminid," where ")=false," where "," and ")
      sqlWhereinadminid = sqlWhereinadminid & getAccessDatediffTime("A.daytime",Request("date_min")) & "<=0" 
    End If 
    If Request("date_max") <> "" Then
      sqlWhereinadminid=sqlWhereinadminid & IIF(instr(sqlWhereinadminid," where ")=false," where "," and ")
      sqlWhereinadminid = sqlWhereinadminid & getAccessDatediffTime("A.daytime",Request("date_max")) & ">=0" 
    End If 

    
    If key <> "" Then
      sqlWhereinadminid =  sqlWhereinadminid & IIF(instr(sqlWhereinadminid," where ")=false," where "," and ") & "([B.username] like '%" & key & "%' or [B.nickname] like '%" & key & "%' or [B.qq] like '%" & key & "%'  or [A.bodycontent] like '%" & key & "%') " 
    End If 


    if request("orderBy")<>"" then
        sqlWhereinadminid =  sqlWhereinadminid & IIF(instr(sqlWhereinadminid," where ")=false," where "," and ") & request("orderBy")
    elseif shouzhitype<>"" then '追加于20240129'
        sqlWhereinadminid =  sqlWhereinadminid & IIF(instr(sqlWhereinadminid," where ")=false," where "," and ") 
        if shouzhitype="收入" then
            sqlWhereinadminid=sqlWhereinadminid & " price>0"
        elseif shouzhitype="支出" then
            sqlWhereinadminid=sqlWhereinadminid & " price<0"
        end if
    end if


    sql=sql & sqlWhereinadminid & " order by A.daytime asc,A.id asc"
    
    ' call die(sql)
    
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
            httpurl=rs("httpurl")
            if httpurl<>"" then httpurl="<a href='"& httpurl &"' target='_blank'>"& httpurl &"</a>"

            bodycontent=jsonCL(rs("bodycontent")) 

            sPrice=rs("price")
            if rs("price")>0 then
                sPrice="<font color=green>"& rs("price") &"</font>"
            elseif rs("price")<0 then
                sPrice="<font color=red>"& rs("price") &"</font>"
            end if
            countmonery=countmonery+rs("price")

            sInadminid=rs("inadminid")
            rsx.open"select * from ["& db_PREFIX &"admin] where id="&rs("inadminid"),conn,1,1
            if not rsx.eof then
                sInadminid=rsx("username") & "("& rsx("nickname") &")"
            end if:rsx.close 
 


            bodycontent=delhtml(bodycontent)
	        stemp = stemp & "{""i"":""" & i & """,""id"":""" & rs("id") & """,""qq"":""" & rs("qq") & """,""localdir"":""" & jsonCL(rs("localdir")) & """,""nickname"":""" & jsonCL(rs("nickname")) & """,""sInadminid"":""" & sInadminid & """,""price"":""" & jsonCL(sPrice) & """,""httpurl"":""" & httpurl & """,""isthrough"":""" & isthrough & """,""bodycontent"":""" & bodycontent & """,""daytime"":""" & format_Time(rs("daytime"),2) & """}" &sHr & "" 
    
 

            rs.MoveNext 
        Wend 
    End If 

    stemp = stemp & "],""count"":""" & rs.RecordCount & """,""countmonery"":""" & countmonery & """,""code"":""0"",""msg"":"""",""sql"":"""& sql &"""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()

elseif request("act")="del" then
  conn.execute"delete from ["& db_PREFIX &"money] where id="&request("id")
  response.write "{""info"": ""删除成功"",""status"": ""y""}"
  Response.end()
'在线修改
elseif request("act")="onlineedit" then 
  field=request("field")
  if field="" then field=title
  title=request("title")
  id=request("id")
  rs.open"select * from ["& db_PREFIX &"money] where "& field &"='"& title &"' and id<>" & id,conn,1,1
  if not rs.eof then
    response.write "{""info"": ""字段存在"",""status"": ""n"",""title"": """&rs("title")&"""}"  
  else
    conn.execute"update ["& db_PREFIX &"money] set  "& field &"='"&title&"' where id="&id
    response.write "{""info"": ""修改成(id="&id&")"",""status"": ""y""}"
  end if:rs.close
  Response.end()


'通过或取消'
elseif request("act")="isthrough" then
    conn.execute"update ["& db_PREFIX &"money] set isthrough="&IIF(request("isthrough")="true",1,0) &" where id="&request("id")
    response.write "{""info"": ""设置成功"",""status"": ""y""}"
    Response.end()

'添加默认数据'
elseif request("act")="addDefaultData" then
    call addDefaultData()
    call die("")
End If 

function addDefaultData()
    dim splxx,s,c,i,userid 
    rs.open"select * from ["& db_PREFIX &"member]",conn,1,1
    if not rs.eof then
        userid=rs("id")
    end if:rs.close
    for i = 1 to 800 
        '收入'
        rs.open"select * from ["& db_PREFIX &"money]",conn,1,3
        rs.addnew
        rs("userid")=userid
        rs("inadminid")=userrs("id")
        rs("price")=phpRnd(10,300)
        rs("isthrough")=1
        rs("bodycontent")="测试数据"
        rs("daytime")=DateAdd("d", (i-1)*-1, Now)
        rs.update:rs.close
        '支出'
        rs.open"select * from ["& db_PREFIX &"money]",conn,1,3
        rs.addnew
        rs("userid")=userid
        rs("inadminid")=userrs("id")
        rs("price")=phpRnd(2,50)*-1
        rs("isthrough")=1
        rs("bodycontent")="测试数据"
        rs("daytime")=DateAdd("d", (i-1)*-1, Now)
        rs.update:rs.close
        call echo("i",i)
    next
end function

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>记账列表</title>
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


    <div class="layui-inline" style="width:110px"> 
        <select name="orderBy">
        <option value="">选择类型</option>  
        <option value=" price>0" <%=IIF(shouzhitype="收入","selected","")%> >收入</option> 
        <option value=" price<0" <%=IIF(shouzhitype="支付","selected","")%>>支付</option>  
        </select> 
    </div>


  <div class="layui-inline">  
    <input class="layui-input" value="<%=request("key")%>" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称">
    </div>

 

      
  <button class="layui-btn" data-type="reload">搜索</button>
  <button class="layui-btn" onclick="showwin('添加信息','listform.asp?inadminid=<%=inadminid%>&userid=<%=IIF(inadminid="2","12","")%>')">添加</button>
  <button class="layui-btn" onclick="StatPrice()">统计单价</button>
  <button class="layui-btn" onclick="addDefaultData()">添加默认数据</button>


</div>
 

 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
</script>
<table class="layui-hide" id="table" lay-filter="demo"></table>
 
<script>
//添加默认数据
function addDefaultData(){ 
    layer.confirm('确定要添加默认数据吗？',{icon:3, title:'提示信息'}, function(index) {
        $.ajax({
            type: "POST", 
            url: "?act=addDefaultData", 
            success: function(data) {
                alert(data)
                $('button[data-type=reload]').click();
            }
        });
        layer.close(index);
    }); 
}
//统计价格
function StatPrice(){ 
    var countPrice=0;//统计价格
    $("td[data-field='price']").each(function(){
        var n=$(this).text();
        countPrice+=parseFloat(n)
        console.log("n",n)
    })

    layer.msg("统计总价："+countPrice);
}

layui.use(['form','table'],function(){
    var form = layui.form
        table = layui.table; 

    //方法级渲染
    table.render({
        elem: '#table',
        url: '?act=list&key2=<%=request("key")%>&inadminid=<%=inadminid%>&shouzhitype=<%=shouzhitype%>',

        cols: [
            [

                { field: 'i', title: '序号', width: 60, sort: false } 
                , { field: 'sInadminid', title: '用户',width:120, sort: true }   
                , { field: 'nickname', title: '昵称',width:120, sort: true }   



                // , { field: 'qq', title: 'QQ',width:200, sort: true } 
                , { field: 'price', title: '单价',width:100, sort: true }   
                , { field: 'daytime', title: '打款时间', width: 110, sort: true }
                // , { field: 'httpurl', title: '网站地址', width: 220, sort: true }

                , { field: 'localdir', title: '本地目录',width:130, sort: true } 
                , { field: 'bodycontent', title: '说明',sort: true } 
                ,{field: 'isthrough', title: '是否成交',width:100, align:'center', templet:function(d){
                    return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
                , { fixed: 'right', title: '操作', width: 150, toolbar: '#barDemo' }


            ]
        ],
        id: 'testReload',
        page: true,
        limit: 300
        ,limits:[10,30,50,80,100,200,300,500,1000]   //选择每页显示条数
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
                        ,orderBy: $('select[name=orderBy]').val()
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
</script>


<script type="text/javascript" src="../../js/pc.js"></script>	

</body>

</html>
