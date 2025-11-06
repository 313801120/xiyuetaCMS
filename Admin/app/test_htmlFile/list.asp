<!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><%
'#禁止自动更新当前文件'  #号去掉代表此文件不被程序自动更新替换掉
call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,totalrec,id,title,idlist
dim fieldType,addsql,startIndex,endIndex,sql2,pageSize,nCount,x,maxpage,iPageSize,msg,keyword,searchType

dim isMobile:isMobile=checkMobile()  '是否为手机端'20240814 

dim fieldName,fieldValue,tableName,winTitle,delver
dim thisDatabaseType:thisDatabaseType=databaseType  '当前数据库类型'
tableName = "htmlfile" '表名称'
winTitle = "生成html管理"
delver = "no"  ' delete verification 删除是否需要输入密码   yes no  

excludeAdminIDLIst="3"   '排除权限限制的管理id列表，如 1,2,3'

fieldName=phptrim(request("fieldname"))  '字段名'
fieldValue=request("value")              '字段要修改内容'
id=hanldeSccessIdArrayList(request("id"))         'ID'

keyword=replace(phptrim(request("key")),"'","")   '去掉'号，防注入

dim dataOrderyBy '排序顺序'
dataOrderyBy=replace(request("dataOrderyBy"),"'","")
if dataOrderyBy="" then dataOrderyBy=" order by id"'" order by sortrank" 

'手动改总记录数'
nCount=request("count")
if nCount<>"" then  nCount=clng(nCount)

' nCount="" '为空则自动统计总数'
 
 
'列表查询
If Request("act") = "list" Then
    if checkAdminRule(winTitle & "列表")=false then
        call die("{""data"":[],""count"":0,""code"":4,""msg"":""<b style='color:red'>没有【"& winTitle & "列表" &"】权限！</b>""}")
    end if
    
    num = Request("limit")
    page = Request("page") 
    stemp = ""
    sql1 = "select * from "&thisAddPrefix(tableName)


    '20240125'
    pageSize=cLng(num)
    If Request("page") = "" Then
        currentPage = 1 
    Else
        currentPage = cLng(Request("page")) 
    End If
    startIndex = (currentPage - 1) * pageSize + 1
    endIndex = startIndex + pageSize - 1 
 
    If Request("date_min") <> "" Then
        sql=IIF(sql=""," where ",sql & " and ")
        sql = sql & "createtime>="&getTimeFuHao()&Request("date_min")&getTimeFuHao()
    End If 
    If Request("date_max") <> "" Then
        sql=IIF(sql=""," where ",sql & " and ")
        sql = sql & "createtime<="&getTimeFuHao()&Request("date_max")&getTimeFuHao()
    End If 


    If keyword <> ""  Then      
        searchType=replace(phptrim(request("searchType")),"'","")   '搜索字段类型'
        if searchType<>"" then
            sql=IIF(sql=""," where ",sql & " and ")
            if thisDatabaseType="mysql" then
                searchType="`"&searchType&"`"
            else
                searchType="["&searchType&"]"
            end if
            sql =sql & " ("&searchType&" like '%" & keyword & "%')" 

        else '默认搜索sql处理'
            sql=IIF(sql=""," where ",sql & " and ") 'else搜索'
            sql =sql & "( [htmlFilePath] like '%" & keyword & "%' )" 

        end if
    End If

    
    if thisDatabaseType = "sqlserver"  then
        if nCount=""    then
            rs.open"select count(*)as ct from ["&db_PREFIX& tableName & "]" & sql ,conn,1,1
            nCount=IIF(isnull(rs("ct"))=true,0,rs("ct")):rs.close
            msg="有统计总记录，"
        end if

        if sqlServerVersion="2012" or sqlServerVersion="2014" then            
            mysql= "select * from ["& db_PREFIX & tableName & "] " & sql & "   "&dataOrderyBy&"   OFFSET "& (pageSize*(currentPage-1)) &" ROWS FETCH NEXT "& pageSize &" ROWS ONLY"
                ' SELECT *  
                ' FROM Employees  
                ' ORDER BY EmployeeID  
                ' OFFSET 90 ROWS -- 跳过前9页的记录  
                ' FETCH NEXT 10 ROWS ONLY; -- 取接下来的10条记录 
        elseif sqlServerVersion="2008" then
            if left(sql,8)=" where " then sql=" " & mid(sql,8)
            mysql="SELECT TOP (" & num & ") * FROM (SELECT ROW_NUMBER() OVER (  "&dataOrderyBy&"  ) AS RowNum, * FROM "& db_PREFIX & tableName & ") AS SubQuery WHERE RowNum BETWEEN " & startIndex & " AND " & endIndex & sql

            '第二种方法，效果一样'
            'mysql="WITH NumberedRows AS (SELECT *, ROW_NUMBER() OVER (  order by id desc  ) AS RowNum FROM "& db_PREFIX & tableName & " ) SELECT * FROM NumberedRows WHERE RowNum BETWEEN " & startIndex & " AND " & endIndex & sql
        end if

    else

        '追加sql部分'
        mysql = sql1 & sql & " " & dataOrderyBy
    end if

    if thisDatabaseType = "mysql"  then
        if nCount=""    then
            rs.open"select count(*)as ct from " & thisAddPrefix(tableName) & sql ,conn,1,1
            nCount=IIF(isnull(rs("ct"))=true,0,rs("ct")):rs.close
            msg="mysql有统计总记录，"
        end if 
        mysql=mysql & " LIMIT "&((page-1)*num)&", "&num
    end if

    'call die(mysql)
    rs.Open mysql, conn, 1, 1 
 

    If Not rs.EOF Then
        '为access数据库'
        if thisDatabaseType = "access"  then
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
            'jsonCStart'
            stemp = stemp & handleJsonRs(i,rs) 
            'jsonCEnd'
 
            rs.MoveNext 
        next 
    End If 
 
 
    stemp ="{""data"":[" & stemp & "],""count"":""" & nCount & """,""code"":""0"",""page"":"&page&",""msg"":"""& msg & vbEchoTimer() &""",""mysql"":"""& jsonCL(mysql) &"""}" 
    
    rs.close
    stemp=replace(stemp,"\","\\")
    stemp=replace(stemp,vbcrlf,"\n")
    call die(stemp)
 
 

'删除多个id'
elseif request("act")="del" then 
    call batchDel() 
'复制当前行
elseif request("act")="copyRow" then
    call copyRow()
'批量删除html
elseif request("act")="batchDelHtml" then
    call echoB("批量删除html完成","共 "&batchDelHtml(id,0) & " 条")
    call die(getTimer())
'批量删除html
elseif request("act")="batchDelAllHtml" then    
    call echoB("一键删除html完成","共 "&batchDelHtml("*",0) & " 条")
    call die(getTimer())
'导入导出20240817
elseif request("act")="daochu" then    
	Dim exportObj : Set exportObj = New exportData
	call die(exportObj.handleDaoChuData(tableName))  '处理导入导出
    'call die(handleDaoChuData(tableName))  '处理导入导出 旧使用方法弃用

 



End If 

'处理返回js块，兼容分类表用的'
function handleJsonRs(i,rs)
    handleJsonRs="{""editable"":true,""i"":""" & i & """,""id"":""" & rs("id") & """,""stype"":""" & jsonCL(rs("stype")) & """,""htmlfilepath"":""" & jsonCL(rs("htmlfilepath")) & """,""npage"":""" & rs("npage") & """,""createtime"":""" & rs("createtime") & """,""updatetime"":""" & rs("updatetime") & """,""status"":""" & rs("status") & """}"    '模板里用'
end function 
'当前表前缀和安全符号的20250923
function thisAddPrefix(tableName)  
    if thisDatabaseType="mysql" then
        thisAddPrefix="`"&db_PREFIX&tableName&"`"
    else
        thisAddPrefix="["&db_PREFIX&tableName&"]"
    end if
end function
'获得时间符号'
function getTimeFuHao()
    if thisDatabaseType="mysql" then
        getTimeFuHao="'"
    else
        getTimeFuHao="#"
    end if
end function
'当前表和字段加符号，区分mysql' 20250924
function getTableFieldFuHao(s)
    if thisDatabaseType="mysql" then
        getTableFieldFuHao="`"&s&"`"
    else
        getTableFieldFuHao="["&s&"]"
    end if
end function
'批量删除'20250823
function batchDel()
    if checkAdminRule("删除" & winTitle)=false then 
        call addSystemLog(tableName,"删除ID("&id&")失败，没有【删除"&winTitle&"】权限")
        call die("{""info"": ""删除ID("&id&")失败，没有【删除"&winTitle&"】权限"",""status"": ""n""}")    
    end if

    '开启密码验证'
    if delver="yes" and session("adminid")<>-999 then   '排除系统管理员
        if userrs("pwd")<>mymd5(request("pwd")) then
            call addSystemLog(tableName,"删除ID("&id&")失败，验证密码错误，删除失败")
            call die("{""info"": ""验证密码错误，删除失败"",""status"": ""n""}")        
        end if
    end if

    conn.execute"delete from "&thisAddPrefix(tableName)&" where id in("&id&")"

    '{追加代码1}'

    call addSystemLog(tableName,"删除成功，ID("&id&")")
    call die("{""info"": ""删除成功"",""status"": ""y""}") 
end function
'复制或批量复制行' 改进20250823
function copyRow()
    if checkAdminRule("添加" & winTitle)=false then 
        call die("{""info"": ""没有【添加"&winTitle&"】权限"",""status"": ""n""}")
    end if
    dim  field
     
    if id="" then
        call die("{""info"": ""ID为空"",""status"": ""n""}")
    end if 
    sql = "select * from "&thisAddPrefix(tableName)&" where id in("&id&")"
    rs.open sql, conn, 1, 1
    if rs.eof then
        rs.close:set rs=nothing
        call die("{""info"": ""未找到要复制的数据"",""status"": ""n""}")
    end if 
    while not rs.eof
        for each field in rs.fields
            if lcase(field.name)<>"id" then
                fieldValue=rs(field.name)
                if request("fieldName")=lcase(field.name) then
                    if phptrim(request("fieldValue"))<>"" then  '不为空'
                        fieldValue=request("fieldValue")
                    end if
                end if		
				if typeName(fieldValue)="Null" then   '如果为Null 则为null值
					fieldValue="null" 
				end if
                call rsData(field.name,fieldValue)
            end if
        next
        ' rsAddUpdateDebug=true
        ' call eerr("是否成功",rsAddnew(tableName)) '添加'
        if rsAddnew_conn(tableName,conn,db_PREFIX,thisDatabaseType)=false then 
            call addSystemLog(tableName,"复制ID("&id&")失败，错误SQL：" & insertOrUpdateSql)
            call die("{""info"": ""复制失败，错误SQ："&jsonCL(insertOrUpdateSql)&""",""status"": ""n""}") 
        end if
        '{追加代码1}'
    rs.movenext:wend:rs.close
    call addSystemLog(tableName,"复制ID("&id&")成功。")

    call die("{""info"": ""复制成功"",""status"": ""y""}")

end function
'生成导航html' 20251014
function batchDelHtml(idList,nDelHtmlOKCount)  
    dim addSql,filePath
    if idList<>"" then
        addSql=" where status=1"
        if idList<>"*" then  '为*生成全部文章'
            addSql=addSql & " and id in("&idList&")"
        end if 

        dim rs:Set rs = CreateObject("Adodb.RecordSet")
        rs.open"select * from " & db_PREFIX & "htmlFile " & addSql,conn,1,3
        while not rs.eof
            filePath=phptrim(rs("htmlFilePath"))
            if instr(filePath,".")>0 then
                call deleteFile(filePath)
                call echo("删除文件成功",filePath)
                nDelHtmlOKCount=nDelHtmlOKCount+1
            end if
            rs("status")=0   '改为未生成状态'
            rs.update
        rs.movenext:wend:rs.close
         
    end if
    batchDelHtml=nDelHtmlOKCount
end function 


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=winTitle%>列表</title>
<script type="text/javascript" src="<%=adminDir%>js/jquery.js"></script>
<link rel="stylesheet" href="<%=adminDir%>layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="<%=adminDir%>layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=adminDir%>js/pc.js?v8"></script>
<link href="<%=adminDir%>css/nprogress.min.css" rel="stylesheet"/>  
<script src="<%=adminDir%>js/nprogress.min.js"></script>
<style>
.layui-table, .layui-table-view {margin: 10px 0;}
.layui-table thead tr {background-color: #f2f2f2}/*表格头背景颜色*/
body{padding:10px 6px 30px 6px;background: #FFF}
/* 状态显示样式 */
.status-success {
    background-color: #e8f5e8 !important;
    color: #2e7d32;
    padding: 4px 8px;
    border-radius: 4px;
    font-weight: bold;
}
.status-err {
    background-color: #ffebee !important;
    color: #c62828;
    padding: 4px 8px;
    border-radius: 4px;
    font-weight: bold;
}

</style>
</head>
<body>   
    <div class="layui-form">
        <div class="layui-inline">      
          <div class="layui-input-inline" style="width: 100px;">
            <input type="text" name="date_min" placeholder="开始时间" autocomplete="off" class="layui-input date">
          </div>
        </div> 
        <div class="layui-inline">-</div>
        <div class="layui-inline">      
          <div class="layui-input-inline" style="width: 100px;">
            <input type="text" name="date_max" placeholder="结束时间" autocomplete="off" class="layui-input date">
          </div>
        </div> 
        <div class="layui-inline">
            <select name="searchType" id="searchType" selected>
                <option value="">≡ 选择搜索字段 ≡</option>
                <option value="sType">类型(sType)</option>
                <option value="status">生成状态(status)</option>
                <option value="htmlFilePath">html文件路径(htmlFilePath)</option>
            </select>
        </div>
        <div class="layui-inline">
            <select name="dataOrderyBy" id="dataOrderyBy" selected>
                <option value="">≡ 选择排序 ≡</option>
                <option value="order by id desc">id倒排序</option>
                <option value="order by id asc">id正排序</option>
                <option value="order by updatetime desc">updatetime倒排序</option>
                <option value="order by updatetime asc">updatetime正排序</option>
            </select>
        </div>
        <div class="layui-inline">  
          <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="搜索关键词" onkeypress="if (event.keyCode === 13) {$('button[data-type=reload]').click(); }">
        </div>
        <button class="layui-btn layui-bg-normal" data-type="reload"><i class="layui-icon layui-icon-search" title=""></i>搜索</button>
    </div>
 
    <script type="text/html" id="barDemo"> 
      <a class="layui-btn layui-btn-xs layui-bg-blue" lay-event="edit"><i class="layui-icon layui-icon-edit" title=""></i>编辑</a> 
      <a class="layui-btn layui-btn-xs layui-bg-red" lay-event="del"><i class="layui-icon layui-icon-delete" title=""></i>删除</a> 
      <a class="layui-btn layui-btn-xs layui-bg-normal" lay-event="more">更多<i class="layui-icon layui-icon-down"></i></a> 
    </script>
 
   <script type="text/html" id="TPL-status">
      {{# if(d.status == 0) { }}
        <span class="status-err">未生成</span>
      {{# } else if(d.status == 1) { }}
        <span class="status-success">已生成</span>
      {{# } else { }}
        <span>{{= d.status }}</span>
      {{# } }}
    </script>
 
    <script type="text/html" id="TPL-laydate-createtime">
      <input class="layui-input laydate-createtime time" placeholder="选择日期" value="{{= d.createtime || '' }}">
    </script>

    <script type="text/html" id="TPL-laydate-updatetime">
      <input class="layui-input laydate-updatetime time" placeholder="选择日期" value="{{= d.updatetime || '' }}">
    </script>

 
  
    <script type="text/html" id="toolbarDemo">
      <div class="layui-btn-container"> 
        <button class="layui-btn layui-btn-sm layui-bg-red" lay-event="batchdel"><i class="layui-icon layui-icon-delete" title=""></i>批量删除</button>
        <button class="layui-btn layui-btn-sm layui-bg-blue" lay-event="batchCopy"><i class="layui-icon layui-icon-add-1" title=""></i>批量复制</button>
        <button class="layui-btn layui-btn-sm layui-bg-red" lay-event="customize-batchDelHtml"><i class="layui-icon layui-icon-delete" title=""></i>批量删除html</button>
        <button class="layui-btn layui-btn-sm layui-bg-red" lay-event="customize-batchDelAllHtml"><i class="layui-icon layui-icon-delete" title=""></i>一键删除html</button>
        <button class="layui-btn layui-btn-sm layui-bg-normal" lay-event="customize-createWebToHtml"><i class="layui-icon layui-icon-website" title=""></i>生成网站html</button>
        <button class="layui-btn layui-btn-sm layui-bg-normal" lay-event="add"><i class="layui-icon layui-icon-add-circle" title=""></i>添加新的</button>
      </div>
    </script>

    
    <script type="text/html" id="ID-table-demo-page-pagebar">
      <div class="layui-btn-container">
        <%if isMobile=false then '手机端不显示%>
        <button class="layui-btn layui-btn-sm" lay-event="tostartpage">首页</button> 
        <button class="layui-btn layui-btn-sm" lay-event="toendpage">尾页</button>  
        <%end if%>
        <button class="layui-btn layui-btn-sm" lay-event="refreshtable" style="display: none;">刷新</button>  
      </div>
    </script>

    <table class="layui-hide" id="table" lay-filter="demo"></table>
 

<script type="text/javascript" src="../../js/excel.min.js"></script>

<script>  
//重新加载表格 修复于20250721
function reloadTable(){
    // 简化版本：直接刷新表格
    if(typeof layui !== 'undefined' && layui.table){
        layui.table.reload('testReload');
        // console.log("方法1")
    } else {
        // 备用方案：触发搜索按钮
        $('button[data-type=reload]').click();
        layer.closeAll();
        // console.log("方法2")
    }
    
    // 关闭所有弹窗
    if(typeof layer !== 'undefined'){
        layer.closeAll();
    }
}

layui.use(['form','table','dropdown','laydate','colorpicker','upload'],function(){
    var form = layui.form
    var table = layui.table
    var laydate = layui.laydate;
    var dropdown = layui.dropdown;
    var colorpicker = layui.colorpicker; 
    var tableRes="";// 表加载的res 20270429 
    
    //表格重新加载 + 跳转页面
    var tableReload=function(pageNum){ 
        NProgress.start(); // 开始显示进度条  
        //执行重载
        table.reload('testReload', {
            page: {
                curr: pageNum //重新从第 1 页开始
            },
            url: '?act=list', 
            where: {
                date_min: $('input[name=date_min]').val(),
                date_max: $('input[name=date_max]').val(),
                searchType: $('select[name=searchType]').val(),
                dataOrderyBy: $('select[name=dataOrderyBy]').val(),
                key: $('input[name=key]').val()
            }
        });

    } 
    // 处理提交删除，提示，一种是输入密码，一种为确认
    var handleSubmitDelIdList=function(idList,obj){
        if('<%=delver%>'=='yes'){
          layer.prompt({
              formType: 1,
              title: '敏感操作，请验证密码'
          }, function(value, index) {
              layer.close(index); 
              submitDelIdList(idList, obj, value)   //删除'
          });

        }else{
            layer.confirm('确定要删除吗？', function(index) {
                layer.close(index); 
                submitDelIdList(idList,null)   //删除'
            });
        }
    }
    //提交删除  submitDelIdList(id,obj,pwd)   '删除'
    var submitDelIdList = function(idList,obj,pwd){
        NProgress.start(); // 开始显示进度条  
        $.ajax({
            type: "POST",
            cache: true,
            dataType: "json",
            url: "?act=del",
            data: { "id": idList,"pwd":pwd }, 
            success: function(data) {  
                NProgress.done(); // 进度条完成  
                switch (data.status) {
                    case "y":
                        if(obj){
                            obj.del();   
                        }else{
                            table.reload('testReload');
                        }                                                
                        layer.msg(data.info,{icon: 1});
                        break;
                    case "n":                                    
                        layer.msg(data.info,{icon: 2});
                        break;
                }
            }
        });
    }
    //批量删除
    var batchDelSelected=function(){
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

        handleSubmitDelIdList(idlist,null)   //删除'
          
    }
    //批量复制
    var batchCopySelected=function(fieldName){
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

        handleCopyRow(idlist,fieldName)   //删除'
          
    }
    //处理复制行
    var handleCopyRow=function(pid,fieldName){
        if(fieldName==undefined || fieldName==""){
            // 直接复制，不需要用户输入
            layer.confirm('是否要复制该行数据？', {
                icon: 3,
                title: '确认复制'
            }, function(index) {
                layer.close(index); // 关闭确认弹窗
                NProgress.start(); // 显示进度条
                $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "json",
                    url: "?act=copyRow",
                    data: { 
                        "id": pid
                    }, 
                    success: function(res) {
                        NProgress.done();
                        if (res.status === "y") {
                            layer.msg('复制成功！');                 
                            layer.msg(res.info,{icon: 1});
                            table.reload('testReload'); // 复制成功后刷新表格
                        } else {
                            layer.msg(res.info,{icon: 2});
                        }
                    },
                    error: function() {
                        NProgress.done();
                        layer.msg('请求失败，请重试');
                    }
                });
            });
        }else{
            // 让用户输入值
            layer.prompt({
                formType: 0,
                title: '请输入替换'+fieldName+'值',
                area: ['300px', '150px'],
                value: ''
            }, function(value, index) {
                layer.close(index); // 关闭输入弹窗
                NProgress.start(); // 显示进度条
                $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "json",
                    url: "?act=copyRow",
                    data: { 
                        "id": pid,
                        "fieldName": fieldName,
                        "fieldValue": value // 传递用户输入的值
                    },
                    success: function(res) {
                        NProgress.done();
                        if (res.status === "y") {        
                            layer.msg(res.info,{icon: 1});
                            table.reload('testReload'); // 复制成功后刷新表格
                        } else {        
                            layer.msg(res.info,{icon: 2});
                        }
                    },
                    error: function() {
                        NProgress.done();
                        layer.msg('请求失败，请重试');
                    }
                });
            });
        }
    }

  
    //方法级渲染
    table.render({
        elem: '#table',
        url: '?act=list', 
        toolbar: '#toolbarDemo',
        defaultToolbar: ['filter',
{title:'导入导出',layEvent:'LAYTABLE_DRDC',icon:'layui-icon-export'},
{title:'提示帮助',layEvent:'LAYTABLE_TIPS',icon:'layui-icon-help'}],
        pagebar: '#ID-table-demo-page-pagebar', // 分页栏模板
        css: [ // 设置单元格样式
          // 取消默认的溢出隐藏，并设置适当高度
          '.layui-table-cell{height: 50px; line-height: 40px;}',               //表格高度
          '.layui-table-cell .layui-colorpicker{width: 38px; height: 38px;}',  //选择颜色在中间
          '.layui-table-cell select{height: 36px; padding: 0 5px;}',  //选择表单在中间
          '.layui-table-cell .layui-form-checkbox{top: 14px;}',  // checkbox中间
          '.layui-table-cell .layui-form-switch{top: 10px;}',    // swite单选在中间
          '.layui-table-cell .layui-btn-xs{vertical-align: middle; margin: 5px 0;}',  // 操作列中的小按钮垂直居中
        ].join(''),
        cols: [
            [  
                // ,edit:editable  显示编辑器  不需要的时候可以把下面的这个删除掉
                {type: 'checkbox', fixed: 'left'},
                { field: 'id', title: 'ID',width:70, sort: false }
                ,{ field: 'stype', title: '类型',width:100, sort: false }
                ,{ field: 'htmlfilepath', title: 'html文件路径',minWidth:120, sort: false , templet:function(d){return '<span style="cursor: pointer;" lay-event="click_htmlfilepath" title="点击html文件路径">'+d.htmlfilepath+'</span>'}}
                ,{ field: 'npage', title: '页码',width:80, sort: false }
                ,{ field: 'createtime', title: '添加时间',width:160, sort: false }
                ,{ field: 'updatetime', title: '修改时间',width:160, sort: false }
                ,{ field: 'status', title: '状态',width:100, sort: false , templet:'#TPL-status'}
 

                
<%if checkEnLanguage() then '英文部分'  %>
                 
<%end if%>  
, { fixed: 'right', title: '操作', width: <%=IIF(isMobile,84,196)%>, toolbar: '#barDemo' } 
            ]
        ],
        id: 'testReload',
        page: true, 
        limit: 20,
        limits:[10,20,30,50,80,100,200,300,500],   //选择每页显示条数  或 limit: 20,

        done: function(res, curr, count){ 
            var currentLimit = $(this)[0].limit; //记录当前表每页显示数
            // console.log("res",res)

            //翻页时追加加上总记录数   
            if(this.url.indexOf('&count=')==-1){
                this.url+= "&count="+count;
            }

            NProgress.done(); // 进度条完成  
            var options = this;

            // console.log("res",res)
            // console.log("curr",curr)
            // console.log("count",count)

            // 获取当前行数据
            table.getRowData = function(tableId, elem){
                var index = $(elem).closest('tr').data('index');
                return table.cache[tableId][index] || {};
            };  
            
 
 
          // 选择日期
          laydate.render({
            elem: '.laydate-createtime',
            format: 'yyyy/MM/dd HH:mm:ss',
            done: function(value, date, endDate){
                var data = table.getRowData(options.id, this.elem); // 获取当前行数据(如 id 等字段，以作为数据修改的索引)
                var tempData=data.createtime;//原值

                var This=this;
                if(value==''){
                    layer.msg('不能为空');
                    return false;
                } 
                // 更新数据中对应的字段
                data.createtime = value; 
    
                submitOnLineEdit(data.id,'createtime',value).then(res => {   
                    if(res.status=="n"){  // 为假，恢复原来的值 
                        layer.tips(res.info, This.elem, {tips: 1});
                        $(This.elem).val(tempData);                        
                        data.createtime = tempData;
                    }
                }) 
            }
          });

          // 选择日期
          laydate.render({
            elem: '.laydate-updatetime',
            format: 'yyyy-MM-dd HH:mm:ss',
            done: function(value, date, endDate){
                var data = table.getRowData(options.id, this.elem); // 获取当前行数据(如 id 等字段，以作为数据修改的索引)
                var tempData=data.updatetime;//原值

                var This=this;
                if(value==''){
                    layer.msg('不能为空');
                    return false;
                } 
                // 更新数据中对应的字段
                data.updatetime = value; 
    
                submitOnLineEdit(data.id,'updatetime',value).then(res => {   
                    if(res.status=="n"){  // 为假，恢复原来的值 
                        layer.tips(res.info, This.elem, {tips: 1});
                        $(This.elem).val(tempData);                        
                        data.updatetime = tempData;
                    }
                }) 
            }
          });

 
 
        // 双击表格中的某一行-触发行双击事件  20220604         
        table.on('rowDouble(demo)',function (obj) {
            showwin2('查看信息', 'listview.asp?id=' + obj.data["id"])
        })  
 
        table.on('tool(demo)', function(obj) { //工具
            var data = obj.data;
            var pid = obj.data["id"]

            if (obj.event === 'edit') {       //编辑
                showwin('编辑<%=winTitle%>', 'listform.asp?id=' + pid)  //22333
            }else if (obj.event === 'del') {       //删除
                handleSubmitDelIdList(pid,obj)   //删除'
            }else if (obj.event === 'more') {       //更多
                // 更多 - 下拉菜单
                dropdown.render({
                    elem: this, // 触发事件的 DOM 对象
                    show: true, // 外部事件触发即显示
                    data: [{title: '编辑',id: 'edit'}
                        ,{title: '编辑(无编辑器)',id: 'editorno'}
                        ,{title: '删除',id: 'del'}
                        ,{title: '复制',id: 'copyRow'}
                        ,{title: '详细',id: 'clickviewdetail'}],
                    click: function(menudata){ 
                        if (menudata.id === 'edit') {       //编辑
                            showwin('编辑<%=winTitle%>', 'listform.asp?id=' + pid)  //more edit
                        }else if (menudata.id === 'editorno') {       //编辑(无编辑器)
                            showwin('编辑<%=winTitle%>', 'listform.asp?id=' + pid+"&editor=no") //more no editor
                        }else if (menudata.id === 'del') {       //删除
                            handleSubmitDelIdList(pid,obj)   //删除'
                        }else if (menudata.id === 'copyRow') {       //复制
                            handleCopyRow(pid,"")
                        }else if (menudata.id === 'clickviewdetail') {       //详细
                            showwin2('查看详细', 'listview.asp?id=' + obj.data["id"])
                        }

                    },
                    align: 'right', // 右对齐弹出
                    style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
                })
            }else if (obj.event === 'click_htmlfilepath') {       //html文件路径
                   window.open(data.htmlfilepath, '_blank');

            }

        }); 
 
        // 工具栏事件
        table.on('toolbar(demo)', function(obj){
          var id = obj.config.id;
          var checkStatus = table.checkStatus(id);
          var othis = lay(this);
          switch(obj.event){
            case 'getCheckData':
                var data = checkStatus.data;
                layer.alert(layui.util.escape(JSON.stringify(data)));
                break;
            case 'getData':
                var getData = table.getData(id);
                console.log(getData);
                layer.alert(layui.util.escape(JSON.stringify(getData)));
                break;
 
            case 'batchdel':
                batchDelSelected();
                break;                
            case 'batchCopy':
                batchCopySelected("");
                break;

            case 'customize-batchDelHtml':

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
                layer.confirm('是否要批量删除html', {
                    icon: 3,
                    title: '确认生成'
                }, function(index) {
                    layer.close(index); // 关闭输入弹窗
                    showwin2('生成导航html', "?act=batchDelHtml&id="+idlist);  
                });

                break;
            case 'customize-batchDelAllHtml':

                layer.confirm('是否要批量删除全部html', {
                    icon: 3,
                    title: '确认生成'
                }, function(index) {
                    layer.close(index); // 关闭输入弹窗
                    showwin2('删除全部html', "?act=batchDelAllHtml");  
                });

                break;
            case 'customize-createWebToHtml':
                layer.confirm('是否要生成网站到html', {   //20251106
                    icon: 3,
                    title: '确认生成'
                }, function(index) {
                    layer.close(index); // 关闭输入弹窗
                    // 创建包含两个iframe的弹窗
                    var content = '<div style="display: flex; flex-direction: column; gap: 10px; height: 800px;">' +
                        '<div style="flex: 1; border: 1px solid #ddd;">' +
                        '<div style="padding: 5px; background: #f5f5f5; font-weight: bold;">生成导航HTML</div>' +
                        '<iframe src="../test_webcolumn/list.asp?act=batchCreateAllNavHtml" style="width: 100%; height: calc(100% - 30px); border: none;"></iframe>' +
                        '</div>' +
                        '<div style="flex: 1; border: 1px solid #ddd;">' +
                        '<div style="padding: 5px; background: #f5f5f5; font-weight: bold;">生成文章HTML</div>' +
                        '<iframe src="../test_webcolumn/list.asp?act=batchCreateAllArticleHtml" style="width: 100%; height: calc(100% - 30px); border: none;"></iframe>' +
                        '</div>' +
                        '</div>';
                    layer.open({
                        type: 1,
                        title: '生成网站html',
                        area: ['90%', '90%'],
                        content: content,
                        btn: ['关闭'],
                        yes: function(index) {
                            layer.close(index);
                        }
                    });
                }); 
                break;
            case 'add':
                showwin('添加<%=winTitle%>','listform.asp?')
                break;                
            case 'LAYTABLE_DRDC':

                // 更多 - 下拉菜单
                dropdown.render({
                    elem: this, // 触发事件的 DOM 对象
                    show: true, // 外部事件触发即显示
                    data: [{title: '导出',id: 'daochu'}
                        ,{title: '导出excel',id: 'daochu_excel'}
                        ,{title: '导出csv',id: 'daochu_csv'}
                        ,{title: '导入',id: 'daoru'}],
                    click: function(menudata){ 
                        if (menudata.id === 'daochu') {
                             // 添加确认弹窗
                            layer.confirm('确定要导出数据吗？', {
                                icon: 3,
                                title: '确认导出'
                            }, function(index) {
                                layer.close(index); // 关闭确认弹窗
                                
                                console.log("obj.cols",obj.cols) 
                                NProgress.start(); // 开始显示进度条  
                                $.ajax({
                                    type: "POST",
                                    cache: true,
                                    dataType: "json",
                                    url: "?act=daochu",
                                    data: {  }, 
                                    success: function(data) {  
                                        NProgress.done(); // 进度条完成  
                                        switch (data.status) {
                                            case "y":                                              
                                                layer.msg(data.info);
                                                break;
                                            case "n":                                    
                                                layer.msg(data.info);
                                                break;
                                        }
                                    }
                                });
                            }); 
                        }else if (menudata.id === 'daochu_excel') {
                            var excel = layui.excel;
                            NProgress.start();
                            var out = [];
                            try{
                                var tableId = obj.config.id;
                                var tableData = (typeof table.getData === 'function' ? table.getData(tableId) : null) || table.cache[tableId] || [];
                                var cols = (obj.config && obj.config.cols) ? obj.config.cols : [];
                                var headerRow = [];
                                var fieldKeys = [];
                                if(cols.length > 0){
                                    layui.each(cols[0], function(idx, col){
                                        if(col.type === 'checkbox') return;
                                        if(col.fixed === 'right') return;
                                        if(col.hide === true) return; // 只导出可见列
                                        if(!col.field) return;
                                        fieldKeys.push(col.field);
                                        headerRow.push(col.title || col.field);
                                    });
                                }else{
                                    if(tableData.length){
                                        for(var k in tableData[0]){
                                            if(k === 'LAY_CHECKED') continue;
                                            fieldKeys.push(k);
                                            headerRow.push(k);
                                        }
                                    }
                                }
                                out.push(headerRow);
                                layui.each(tableData, function(i, row){
                                    var arr = [];
                                    for(var j=0;j<fieldKeys.length;j++){
                                        var v = row[fieldKeys[j]];
                                        if(typeof v === 'string'){
                                            v = v.replace(/<[^>]*>/g, '');
                                        }
                                        arr.push(v);
                                    }
                                    out.push(arr);
                                });
                                var ts = (function(d){
                                    var pad = function(n){return n<10?('0'+n):n};
                                    return d.getFullYear()+"-"+pad(d.getMonth()+1)+"-"+pad(d.getDate())+"_"+pad(d.getHours())+"-"+pad(d.getMinutes())+"-"+pad(d.getSeconds());
                                })(new Date());
                                var fileName = '<%=tableName%>_'+ ts + '.xlsx';
                                if(excel && typeof excel.exportExcel === 'function'){
                                    excel.exportExcel({ 'sheet1': out }, fileName, 'xlsx');
                                    layer.msg('已导出当前页数据');
                                }else{
                                    throw new Error('excel 模块未加载');
                                }
                            }catch(e){
                                layer.msg('Excel 导出失败，请检查 excel 模块是否已加载');
                            }finally{
                                NProgress.done();
                            }
                        }else if (menudata.id === 'daochu_csv') {
                            NProgress.start();
                            try{
                                var tableId2 = obj.config.id;
                                var tableData2 = (typeof table.getData === 'function' ? table.getData(tableId2) : null) || table.cache[tableId2] || [];
                                var cols2 = (obj.config && obj.config.cols) ? obj.config.cols : [];
                                var headerRow2 = [];
                                var fieldKeys2 = [];
                                if(cols2.length > 0){
                                    layui.each(cols2[0], function(idx, col){
                                        if(col.type === 'checkbox') return;
                                        if(col.fixed === 'right') return;
                                        if(col.hide === true) return; // 只导出可见列
                                        if(!col.field) return;
                                        fieldKeys2.push(col.field);
                                        headerRow2.push(col.title || col.field);
                                    });
                                }else{
                                    if(tableData2.length){
                                        for(var k2 in tableData2[0]){
                                            if(k2 === 'LAY_CHECKED') continue;
                                            fieldKeys2.push(k2);
                                            headerRow2.push(k2);
                                        }
                                    }
                                }
                                var out2 = [];
                                out2.push(headerRow2);
                                layui.each(tableData2, function(i2, row2){
                                    var arr2 = [];
                                    for(var j2=0;j2<fieldKeys2.length;j2++){
                                        var v2 = row2[fieldKeys2[j2]];
                                        if(typeof v2 === 'string'){
                                            v2 = v2.replace(/<[^>]*>/g, '');
                                        }
                                        arr2.push(v2);
                                    }
                                    out2.push(arr2);
                                });
                                var csv = '';
                                for(var i=0;i<out2.length;i++){
                                    var row = out2[i].map(function(x){
                                        var s = (x==null?'':String(x)).replace(/\"/g,'""');
                                        if(/[",\n]/.test(s)) s = '"'+ s +'"';
                                        return s;
                                    }).join(',');
                                    csv += row + '\r\n';
                                }
                                var blob = new Blob([csv], {type: 'text/csv;charset=utf-8;'});
                                var url = URL.createObjectURL(blob);
                                var a = document.createElement('a');
                                var ts2 = (function(d){
                                    var pad2 = function(n){return n<10?('0'+n):n};
                                    return d.getFullYear()+"-"+pad2(d.getMonth()+1)+"-"+pad2(d.getDate())+"_"+pad2(d.getHours())+"-"+pad2(d.getMinutes())+"-"+pad2(d.getSeconds());
                                })(new Date());
                                a.href = url;
                                a.download = ('<%=tableName%>_'+ ts2 + '.csv');
                                document.body.appendChild(a);
                                a.click();
                                document.body.removeChild(a);
                                URL.revokeObjectURL(url);
                                layer.msg('已导出为 CSV');
                            }catch(e){
                                layer.msg('CSV 导出失败');
                            }finally{
                                NProgress.done();
                            }
                        }else if (menudata.id === 'daoru') {
                            // 添加确认弹窗
                            layer.confirm('确定要导入数据吗？', {
                                icon: 3,
                                title: '确认导入'
                            }, function(index) {
                                layer.close(index); // 关闭确认弹窗
                                // 跳转到导入页面
                                window.open('/install/addData.asp?act=importData&tablename=<%=tableName%>');

                            })   
                        }

                    },
                    align: 'right', // 右对齐弹出
                    style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
                })

                break;
            case 'LAYTABLE_TIPS':
                // layer.alert('自定义工具栏图标按钮');
                xiyuetaCMSHelp('<%=tableName%>')
                break;


 
          };
        });
 
        //底部分页栏事件
        table.on('pagebar(demo)', function(obj){
            var eventValue = obj.event; // 获得按钮 lay-event 值
            if(eventValue=='tostartpage'){
                tableReload(1);
            }else if(eventValue=='toendpage'){
                // 获取总页数
                //var totalPage = Math.ceil(count / (res.limit || 20)); // 假设每页10条数据
                var totalPage = Math.ceil(count / currentLimit); // 使用这种方法
                tableReload(totalPage);   //count  加载完成第三个参数自带的
            }else if(eventValue=='refreshtable'){//刷新  
                tableReload(res.page);  //刷新当前页
            }
        }); 
    }
    });
 
    var $ = layui.$,active = {
        reload: function() {
            //执行重载
            tableReload(1); 

        }
    }; 
    $('.layui-form .layui-btn').on('click', function() {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
 
});  
//script end 
// 配置nprogress的一些基本选项（可选）  
NProgress.configure({ showSpinner: true }); // 隐藏加载时的旋转器  
  
// 监听页面加载事件  
document.addEventListener('DOMContentLoaded', startProgress); // DOM 完全加载并解析完成，不包括样式表、图片和子框架的加载  
window.addEventListener('load', stopProgress); // 页面完全加载完成，包括样式表、图片和子框架  
  
function startProgress() {  
    NProgress.start(); // 开始显示进度条  
}  
  
function stopProgress() {  
    NProgress.done(); // 进度条完成  
}  
</script>
 
</body>

</html>
