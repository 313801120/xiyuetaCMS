<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 

dim inadminid,sqlWhereinadminid,sqlAndinadminid
inadminid=request("inadminid")
if inadminid<>"" then
    sqlWhereinadminid=" where inadminid="& inadminid
    sqlAndinadminid=" and inadminid="& inadminid
end if
call openconn()  
'导出
if request("act")="exportTXT" then
    dim c,filePath,toFilePath
    sql = "select * from ["& db_PREFIX &"Member] order by id" 
    rs.open sql,conn,1,1
    while not rs.eof
        c=c&"【username】"&rs("username") & vbcrlf   '用户名'
        c=c&"【nickname】"&rs("nickname") & vbcrlf   '昵称'
        c=c&"【inadminid】"&rs("inadminid") & vbcrlf  '用户类型也导出去'
        c=c&"【sex】"&rs("sex") & vbcrlf       '性别'
        c=c&"【pic】"&rs("pic") & vbcrlf        '头像'
        c=c&"【department】"&rs("department") & vbcrlf        '所在部门'
        c=c&"【dateofbirth】"&rs("dateofbirth") & vbcrlf        '出生日期
        c=c&"【email】"&rs("email") & vbcrlf        '邮箱
        c=c&"【weixin】"&rs("weixin") & vbcrlf   '微信'
        c=c&"【alipay】"&rs("alipay") & vbcrlf '支付宝'
        c=c&"【qq】"&rs("qq") & vbcrlf               'QQ'
        c=c&"【phone】"&rs("phone") & vbcrlf               '手机
        c=c&"【address】"&rs("address") & vbcrlf               '联系地址
        c=c&"【regtime】"&rs("regtime") & vbcrlf '注册时间'
        c=c&"【isthrough】"&rs("isthrough") & vbcrlf 
        if rs("bodycontent")<>"" then c=c&"【bodycontent】"&rs("bodycontent") & "【/bodycontent】" & vbcrlf 
        c=c&"-------------------------------"&vbcrlf
    rs.MoveNext:wend:rs.close
    filePath="/install/WebData/member/list.txt"
    toFilePath="/install/WebData/member/#list_" & format_Time(now(),6) &".txt"
    if checkFile(filePath) then
        call movefile(filePath,toFilePath)
    end if
    call writetofile(filePath,c,"utf-8")

    '项目'
    c=""
    sql = "select * from ["& db_PREFIX &"money] order by id" 
    rs.open sql,conn,1,1
    while not rs.eof
        c=c&"【userid】"&rs("userid") & vbcrlf    '会员ID'
        c=c&"【inadminid】"&rs("inadminid") & vbcrlf   '用户类型'
        c=c&"【price】"&rs("price") & vbcrlf       '价格'
        c=c&"【daytime】"&rs("daytime") & vbcrlf      '打款时间'
        c=c&"【localdir】"&rs("localdir") & vbcrlf    '本地目录地址'
        c=c&"【smallimage】"&rs("smallimage") & vbcrlf  '图片1'
        c=c&"【pic2】"&rs("pic2") & vbcrlf                '图片2'
        c=c&"【pic3】"&rs("pic3") & vbcrlf                '图片3'
        c=c&"【createtime】"&rs("createtime") & vbcrlf    '创建时间'
        c=c&"【isthrough】"&rs("isthrough") & vbcrlf 
        if rs("bodycontent")<>"" then c=c&"【bodycontent】"&rs("bodycontent") & "【/bodycontent】" & vbcrlf 
        c=c&"-------------------------------"&vbcrlf
    rs.MoveNext:wend:rs.close
    filePath="/install/WebData/money/list.txt"
    toFilePath="/install/WebData/money/#list_" & format_Time(now(),6) &".txt"
    if checkFile(filePath) then
        call movefile(filePath,toFilePath)
    end if
    call writetofile(filePath,c,"utf-8")



    '日记'
    c=""
    sql = "select * from ["& db_PREFIX &"diary] order by id" 
    rs.open sql,conn,1,1
    while not rs.eof
        c=c&"【createtime】"&rs("createtime") & vbcrlf     '创建时间'
        c=c&"【updatetime】"&rs("updatetime") & vbcrlf      '修改时间'
        c=c&"【title】"&rs("title") & vbcrlf                  '标题'
        c=c&"【weather】"&rs("weather") & vbcrlf  '天气
        c=c&"【writedatetime】"&rs("writedatetime") & vbcrlf
        if rs("bodycontent")<>"" then c=c&"【bodycontent】"&rs("bodycontent") & "【/bodycontent】" & vbcrlf 
        c=c&"-------------------------------"&vbcrlf
    rs.MoveNext:wend:rs.close
    filePath="/install/WebData/diary/list.txt"
    toFilePath="/install/WebData/diary/#list_" & format_Time(now(),6) &".txt"
    if checkFile(filePath) then
        call movefile(filePath,toFilePath)
    end if
    call writetofile(filePath,c,"utf-8")



    call rw(jsTiming("?",6))
    call eerr("提示","导出成TXT成功，有member表和money表和diary表")
end if

dim num,page,stemp,sql,currentPage,perpage,page_count,i,n,totalrec,isthrough,id,price,ncount,pinjuiMonery,bodycontent

'会员列表查询
If Request("act") = "userlist" Then
    num = UCase(Request("limit")) 
    page = UCase(Request("page"))        
    stemp = ""

    sql = "select * from ["& db_PREFIX &"Member]" 
 

    If Request("date_min") <> "" Then
      sql=sql & IIF(instr(sql," where ")=false," where "," and ")
      sql = sql & getAccessDatediffTime("regtime",Request("date_min")) & "<=0" 
    End If 
    If Request("date_max") <> "" Then
      sql=sql & IIF(instr(sql," where ")=false," where "," and ")
      sql = sql & getAccessDatediffTime("regtime",Request("date_max")) & ">=0" 
    End If 



    If Request("key") <> "" Then
      sql =  sql & IIF(instr(sql," where ")=false," where "," and ") & "([username] like '%" & Request("key") & "%' or [nickname] like '%" & Request("key") & "%' )" 
    End If 
    sql=sql & " order by id asc" 
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


            isthrough=""
            if rs("isthrough")<>0 then
                isthrough=" checked"
            end if
                

        rsx.open"select sum(price)as tpv from ["&db_PREFIX&"money] where userid="&rs("id") & sqlAndinadminid,conn,1,1
        price=IIF(isnull(rsx("tpv"))=true,0,rsx("tpv"))
        rsx.close
        ncount=conn.execute("select count(*) from ["&db_PREFIX&"money]  where userid="&rs("id") & sqlAndinadminid)(0)
        if ncount=0 then
            pinjuiMonery=0
        else
            pinjuiMonery=Formatnumber(price/ncount,0) 
        end if
        pinjuiMonery=replace(cstr(pinjuiMonery),",","")
        

            bodycontent=rs("bodycontent")
            bodycontent=replace(bodycontent,vbcrlf,"<br>")
            bodycontent=replace(bodycontent,chr(10),"<br>")
            bodycontent=replace(bodycontent,chr(13),"<br>")
            bodycontent=replace(bodycontent,"\","\\")   '处理一下转译20220902'

            if not (price=0 and request("inadminid")<>"") then

 

                if stemp<>"" then stemp=stemp & ","

                stemp = stemp & "{""i"":""" &i& """,""id"":""" & rs("id") & """,""username"":""" & rs("userName") & """,""nickname"":""" & rs("nickname") & """,""qq"":""" & rs("qq") & """,""isthrough"":""" & isthrough & """,""regtime"":""" & format_Time(rs("regTime"),2) & """,""price"":""" & price & """,""ncount"":""" & ncount & """,""pinjuiMonery"":""" & pinjuiMonery & """,""bodycontent"":""" & bodycontent & """,""alipay"":""" & rs("alipay") & """,""weixin"":""" & rs("weixin") & """}" 
            end if
            rs.MoveNext 
        Wend 
    End If 

    stemp = "{""data"":[" & stemp & "],""count"":""" & rs.RecordCount & """,""code"":""0"",""msg"":""""}" 

    Response.Write stemp 
    rs.Close 
    Response.end()

elseif request("act")="del" then
    id=request("id")
    if userrs("pwd")<>mymd5(request("pwd")) then
        response.write "{""info"": ""验证密码错误，删除失败"",""status"": ""n""}"
    else
        rs.open"select * from ["& db_PREFIX &"Member] where id=" &id,conn,1,3
        if not rs.eof then
            rs.delete
            rs.update
            response.write "{""info"": ""删除用户成功"",""status"": ""y""}"
        else
            response.write "{""info"": ""删除用户失败，用户不存在"",""status"": ""n""}"
        end if:rs.close
    end if
    Response.end()
'通过或取消'
elseif request("act")="isthrough" then
    conn.execute"update ["& db_PREFIX &"Member] set isthrough="&IIF(request("isthrough")="true",1,0) &" where id="&request("id")
    response.write "{""info"": ""设置成功"",""status"": ""y""}"
    Response.end()




End If 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员列表</title>
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
 
    <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的账号">
    </div>
      
  <button class="layui-btn" data-type="reload">搜索</button>
  <button class="layui-btn" onclick="showwin('添加用户','userform.asp?inadminid=<%=inadminid%>')">添加</button>
  <button class="layui-btn" onclick="window.location='?act=exportTXT'">导出</button>
</div>
 

 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> 
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="jizhang"><i class="layui-icon layui-icon-edit"></i>记账</a> 
</script>

<table class="layui-hide" id="table" lay-filter="demo"></table>
 

<script> 
layui.use(['form','table'],function(){
    var form = layui.form
        table = layui.table; 

    //方法级渲染
    table.render({
        elem: '#table',
        url: '?act=userlist&inadminid=<%=inadminid%>',
        cols: [
            [
                { field: 'i', title: '序列', width:80, sort: true }
                , { field: 'username', title: '用户名',width:90, sort: true }
                // , { field: 'nickname', title: '昵称',width:120, sort: true }  

                ,{field: 'nickname', title: '昵称',width:120, sort: true, align:'center', templet:function(d){ 
        return '<span style="cursor: pointer;" lay-event="kainfo">'+d.nickname+'</span>'}}


                , { field: 'price', title: '总收款',width:90, sort: true }
                , { field: 'ncount', title: '次数',width:80, sort: true }
                , { field: 'pinjuiMonery', title: '单价',width:80, sort: true }
                , { field: 'qq', title: 'QQ',minWidth:200, sort: true }  
                , { field: 'weixin', title: '微信',minWidth:150, sort: false }
                , { field: 'alipay', title: '支付宝',minWidth:150, sort: false }
                , { field: 'bodycontent', title: '说明',sort: true } 
                ,{field: 'isthrough', title: '审核状态',width:100, align:'center', templet:function(d){
                    return '<input type="checkbox" value="'+d.id+'" name="isthrough" lay-event="isthrough" lay-skin="switch" lay-text="是|否" '+d.isthrough+' >'}}
                , { field: 'regtime', title: '加入时间',width:160, sort: true }
                , { fixed: 'right', title: '操作', width: 220, toolbar: '#barDemo' }

            ]
        ],
        id: 'testReload',
        page: true,
        limit: 100
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
                layer.msg("审核通过！");
            }else{
                layer.msg("取消审核！");
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
        var nickname = obj.data["nickname"]
        if (obj.event === 'del') {

            layer.prompt({
                formType: 1,
                title: '敏感操作，请验证密码'
            }, function(value, index) {
                layer.close(index);
                $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "json",
                    url: "?act=del",
                    data: { "id": pid,"pwd":value }, 
                    success: function(data) { 
                        switch (data.status) {
                            case "y":
                                obj.del();                                                   
                                layer.msg(data.info);
                                break;
                            case "n":                                    
                                layer.msg(data.info);
                                break;
                        }
                    }
                });
            });



        } else if (obj.event === 'edit') {
            showwin('编辑用户', 'userform.asp?id=' + pid)

        
        } else if (obj.event === 'jizhang') {
            showwin('添加任务','../../app/money/listform.asp?userid=' + pid+'&inadminid=<%=request("inadminid")%>')   

        } else if (obj.event === 'kainfo') {
            showwin2('任务列表', '/admin/app/money/list.asp?inadminid=<%=inadminid%>&key=' + nickname)
 
        }
    });

}); 


</script>
<script type="text/javascript" src="../../js/pc.js?v3"></script>
 

</body>

</html>
