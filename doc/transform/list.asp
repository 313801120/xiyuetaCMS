<!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><!--列表页加载外部asp文件--><!--列表页导入ASP函数用javascript写的--><%
'#禁止自动更新当前文件'  #号去掉代表此文件不被程序自动更新替换掉
call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,totalrec,id,title,idlist
dim fieldType,addsql,startIndex,endIndex,sql2,pageSize,nCount,x,maxpage,iPageSize,msg,keyword,searchType

dim isMobile:isMobile=checkMobile()  '是否为手机端'20240814 

dim fieldName,fieldValue,tableName,winTitle,delver
dim thisDatabaseType:thisDatabaseType=databaseType  '当前数据库类型'
'listpage addto dim list'
tableName = "member" '表名称'
winTitle = "会员"
delver = "yes"  ' delete verification 删除是否需要输入密码   yes no  

excludeAdminIDLIst=""   '排除权限限制的管理id列表，如 1,2,3'

fieldName=phptrim(request("fieldname"))  '字段名'
fieldValue=request("value")              '字段要修改内容'
id=hanldeSccessIdArrayList(request("id"))         'ID'
 
keyword=replace(phptrim(request("key")),"'","")   '去掉'号，防注入

dim dataOrderyBy '排序顺序'
dataOrderyBy=replace(request("dataOrderyBy"),"'","")
if dataOrderyBy="" then dataOrderyBy=" order by id desc"'" order by sortrank" 

'手动改总记录数'
nCount=request("count")
if nCount<>"" then  nCount=clng(nCount)

' nCount="" '为空则自动统计总数'
 
 'listpage header aspcode'
 
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
 
'{搜索条件参数ASP代码}'

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
            sql =sql & "( [nickname] like '%" & keyword & "%' or [username] like '%" & keyword & "%' or [sex] like '%" & keyword & "%' )" 

        end if
    End If

    '{多级分类定义id列表}
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
        mysql=mysql & " LIMIT "&((currentPage-1)*num)&", "&num
    end if


    call getHandleRs(rs,mysql)
    ' 'call die(mysql)
    ' rs.Open mysql, conn, 1, 1 
 

    If Not rs.EOF Then
        '为access数据库'
        if thisDatabaseType = "access"  then
            iPageSize = num 
            rs.PageSize = iPageSize 
            rs.AbsolutePage = currentPage 
            nCount=rs.recordcount  '总条数'
            maxpage=rs.PageCount 

            if currentPage=maxpage then    '使用 currentPage  而不用 page'
                x=nCount-(maxpage-1)*iPageSize
            else
                x=iPageSize
            end if 
        else
            x=num 
        end if 
 
 
        For i=1 To x 
            if rs.eof then exit for'在最后退出    
 
            'jsonCStart'
            if stemp<>"" then stemp=stemp & ","
            stemp = stemp & handleJsonRs(i,rs) 
            'jsonCEnd'
 
            if i<>x then rs.MoveNext   '大于则还有下一条20251122，不这样写搜索时会有问题，晕'
        next 
    End If 
 
 
    stemp ="{""data"":[" & stemp & "],""count"":""" & nCount & """,""code"":""0"",""page"":"&currentPage&",""msg"":"""& msg & vbEchoTimer() &""",""mysql"":"""& jsonCL(mysql) &"""}" 
    
    rs.close
    stemp=replace(stemp,"\","\\")
    stemp=replace(stemp,vbcrlf,"\n")
    call die(stemp)
 
 

'elseif判断'

End If 

'处理返回js块，兼容分类表用的'
function handleJsonRs(i,rs)
    handleJsonRs="{""editable"":true,""i"":""" & i & """{jsonC}}"    '模板里用'
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
    if thisDatabaseType="mysql" or thisDatabaseType="sqlserver" then
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
'获得Rs打开判断
function getHandleRs(rs,sql)
    on error resume next
    rs.open sql,conn,1,1
    if err<>0 then
        call die("{""data"":[],""count"":0,""code"":4,""msg"":""<b style='color:red'>sql="&sql&"<br>错误="&err.description&"</b>""}")
    end if
end function 
'{列表页ASP函数块}

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
/*列表页style样式*/
</style>
</head>
<body>   
<!-- 列表页顶上表单 --> 
<!-- 列表每项操作barDemo --> 
<!-- 下拉菜单 --> 
<!-- 日期操作器 --> 
<!-- 颜色操作器 -->  
<!-- 表格顶部按钮列表 --> 
    
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
 

<!-- 加载script JS文件 -->
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
//{JS搜索参数传递}
            }
        });

    } 
//{JS内部函数块}  
    //方法级渲染
    table.render({
        elem: '#table',
        url: '?act=list', 
        toolbar: '#toolbarDemo',
        defaultToolbar: [/*defaultToolbar菜单列表配置*/],
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
//{jsC} 

                
<%if checkEnLanguage() then '英文部分'  %>
                //{jsC_en} 
<%end if%>  
//{表格里每项操作} 
            ]
        ],
        id: 'testReload',
        page: true, 
        limit: 10,
        limits:[10,20,30,50,80,100,200,300,500],   //选择每页显示条数  或 limit: 10,

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
            
//{列表页json数据加载完循环每项} 
//下拉菜单选择器JS块 
//日期选择器JS块 
//颜色选择器JS块 
//{双击表格中的某一行} 
//{tableon在线修改功能js代码块} 
//{监听行工具事件} 
//{toolbarJS块} 
//{底部分页栏事件} 
    }
    });
//{switch功能js代码块} 
    var $ = layui.$,active = {
        reload: function() {
            //执行重载
            tableReload(1); 
//{追加active判断动作}
        }
    }; 
//{列表页顶部表单操作JS块} 
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
