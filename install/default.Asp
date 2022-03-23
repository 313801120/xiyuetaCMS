<!--#Include file = "../inc/Config.Asp"-->
<%
if request("act")="login" then
    if trim(request("pass"))="xiyueta.com" then
        session("installLoginPass")="mima"
    else
        call echo("提示","密码错误")
    end if
end if
call checkInstallLogin()
'检测安装登录
function checkInstallLogin()
    if session("installLoginPass")="" then
        call die("<form name='form1' method='post' action='?act=login'>密码<input type='text' name='pass' id='pass'><input type='submit' name='button' id='button' value='登录'></form>")   
    end if 
end function
%> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>安装SQLServer/Access数据库,QQ:313801120:::</title>
    <style type="text/css">
    a img {
        border: none
    }

    .imga {
        vertical-align: bottom;
    }

    .imgb {
        vertical-align: bottom;
        display: block;
    }

    /*解决图片下面有空隙的简单方法  以前是img{这样图片就会换行*/
    body,
    div,
    p,
    img,
    dl,
    dt,
    dd,
    ul,
    ol,
    li,
    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    pre,
    form,
    fieldset,
    input,
    textarea,
    blockquote {
        padding: 0px;
        margin: 0px
    }

    li {
        list-style-type: none
    }

    a {
        font-size: 12px;
        line-height: 18px;
        color: #000000;
        text-decoration: none
    }

    a:hover {
        text-decoration: none;
        color: #000099
    }

    /*PHPCMS表单样式*/
    .input-text,
    .measure-input,
    textarea,
    input.date,
    input.endDate,
    .input-focus {
        border: 1px solid #A7A6AA;
        height: 22px;
        line-height: 22px;
        margin: 0 5px 0 0;
        padding: 2px 0 2px 5px;
        border: 1px solid #d0d0d0;
        background: #FFF url(../images/input.png) repeat-x;
        font-family: Verdana, Geneva, sans-serif, "宋体";
        font-size: 12px;
    }

    input.date,
    input.endDate {
        background: #fff url(../images/input_date.png) no-repeat right 3px;
        padding-right: 18px;
        font-size: 12px;
    }

    select {
        vertical-align: middle;
        background: none repeat scroll 0 0 #F9F9F9;
        border-color: #666666 #CCCCCC #CCCCCC #666666;
        border-style: solid;
        border-width: 1px;
        color: #333;
        padding: 2px;
    }

    /*自定义按钮 待改进*/
    .btnclick1 {
        color: #000;
        font-size: 14px;
        padding: 0 20px;
        background-color: #fff;
        border: 0px;
        border: 1px solid #666666;
        text-decoration: none;
        cursor: pointer;
        line-height: 26px;
        font-weight: bold;
        border-radius: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        -o-border-radius: 5px;
    }

    .btnclick1:hover {
        background-color: #E6E6E6;
        background-position: 0px -50px;
    }

    .btnclick1:active {
        background-color: #fff;
    }



    .pright {
        width: 720px;
        margin: 0 auto;
    }

    .pr-title {
        width: 720px;
        height: 22px;
        margin: 8px auto 0px;
        overflow: hidden;
    }

    .pr-title h3 {
        width: 158px;
        height: 22px;
        line-height: 22px;
        overflow: hidden;
        display: block;
        font-size: 12px;
        padding-top: 1px;
        text-indent: 10px;
        letter-spacing: 2px;
        color: #6D8A4F;
        font-weight: bold;
    }

    input {
        vertical-align: middle;
        margin-right: 3px;
        font-size: 12px;
    }

    textarea {
        vertical-align: top;
        font-size: 12px;
        line-height: 156%;
        border: 1px solid #AAA;
        padding: 3px;
        letter-spacing: 1px;
        word-break: break-all;
        overflow-y: auto;
    }

    .input-txt {
        padding: 4px 8px 4px 6px;
        border: 1px solid #AAA;
        font-size: 12px;
        color: #000;
        width: 200px;
    }

    .textipt_on {
        border: 1px solid #F90;
    }


    hr {
        height: 1px;
        line-height: 1px;
        overflow: hidden;
        border-width: 1px 0px 0px 0px;
        border-top: 1px solid #E6E6E6;
        /*兼容Opera*/
    }

    hr:empty {
        margin: 8px 0px 7px 0px !important;
        margin: 0px;
    }

    small {
        font-size: 12px;
    }

    .moncolor td {
        background: #FFC;
    }

    .twbox {
        width: 706px;
        border: 1px solid #CFDCC9;
        font-size: 12px;
        overflow: hidden;
        margin: 8px auto;

    }


    .twbox thead tr td {
        height: 31px;
        line-height: 31px;
        text-indent: 10px;
    }

    .twbox thead tr td strong {
        letter-spacing: 2px;
        margin-right: 14px;
        color: #FFF;
        font-size: 14px;
    }


    .twbox thead tr td span {
        color: #CDA;
    }


    .twbox thead tr td p {
        height: 31px;
        display: inline;
        float: right;
        margin: -31px 10px 0 0;
        overflow: hidden;
    }

    .twbox thead tr td p * {
        float: right;
    }

    .twbox thead tr td a.thlink {
        color: #FFF;
    }

    .twbox thead tr td a.thlink:hover {
        color: #FFFF00;
        text-decoration: none;
    }


    .twbox tbody {
        overflow: hidden;
        text-align: left;
    }

    .twbox tbody tr th {
        background: #F9FCEF;
        color: #6D8A4F;
        line-height: 21px;
        height: 21px;
        text-indent: 30px;
        font-weight: normal;
        border-bottom: 1px solid #EFF7D8;
        letter-spacing: 2px;
    }

    .twbox tbody tr td {
        padding: 7px;
        border-bottom: 1px solid #F2F2F2;
        color: #333;
        vertical-align: top;
    }

    .twbox tbody tr td p {
        line-height: 21px;
    }

    .twbox tbody tr td p strong img {
        vertical-align: middle;
    }

    .twbox tbody tr td img {
        vertical-align: top;
        margin: 0px 10px 5px 0px;

    }

    .twbox tbody tr td small {
        color: #888;
    }

    .twbox tfoot tr td {
        padding: 10px;
        line-height: 25px;
        text-align: center;
    }

    .twbox tfoot tr td p {
        line-height: 21px;
        margin-bottom: 10px;
    }

    input.but {
        height: 26px;
        padding-left: 6px;
        padding-right: 6px;
        line-height: 26px;
        font-weight: bold;
        letter-spacing: 1px;
        color: #FFF;
        background-color: #FC3;
    }

    .onetd {
        width: 120px;
        text-align: right;
        line-height: 25px;
    }

    .mytipwrap {
        line-height: 30px;
        color: #999999;
    }

    a.mytip {
        line-height: 14px;
        padding: 6px 20px;
        border-style: solid;
        border-width: 1px;
        border-color: #EEE #CCC #CCC #EEE;
        background: #FAFAFA;
        color: #333;
        margin-right: 10px;
        text-decoration: none;
    }
    </style>
</head>

<body>
    <% 


dim selectDatabase, dbhost, dbuser, dbpwd, dbname, accessDir, accessPath, configFilePath, content, startStr, endStr, findStr, replaceStr 
dim tempContent, msgStr, isYes, connStr 
dim showLayout                                                                  '显示布局

dim  tableListC 

call loadRun()                                                                  '【@是.netc屏蔽@】'【@是jsp屏蔽@】
sub loadRun()
    if EDITORTYPE = "asp" then
        configFilePath = "/inc/Config.Asp" 
    elseif EDITORTYPE = "aspx" then
        configFilePath = "/inc_csharp/Config.Aspx" 
    elseif EDITORTYPE = "jsp" then
        configFilePath = "/inc_jsp/config.jsp" 
    end if 
    if request("act") = "createAccess" then
        call createAccess()                                                             '创建数据库
    elseif request("act") = "displayImportTableLayout" then
        call displayImportTableLayout()                                                 '显示导入数据页面
    elseif request("act") = "displayImportData" then
        call displayImportData()                                                        '显示导入数据
    else
        call displayDefault() 
    end if 
'call echo("tableListC",tableListC)
end sub 


'判断创建表是否可以生成
function checkCreateTable(byval tableName)
    dim sTableName 
    sTableName = lcase(tableName) 
    if db_PREFIX <> "" then
        sTableName = mid(sTableName, len(db_PREFIX) + 1) 
    end if 
    'call echo("db_PREFIX",db_PREFIX)
    'call echo("sTableName",sTableName)
    'call eerr("tableName",tableName)
    tableListC = tableListC & sTableName & "|" 
    checkCreateTable = checkTable_show(tableName) 
     
end function 


'注意，创建数据时 Default """"  默认值用这个   不要用这种Default ''    20150506
'网站数据库
sub webData(db_PREFIX, loginname, loginpwd)
    dim tableName, sql, isAddData, splStr, splxx, i, s, splTrue, bigClassName 
    dim splUrl, splNavName, sNavClassName, splImg, templateIndex, templateHome, templateMain 
    'call echo("db_PREFIX",db_PREFIX)
    '网站信息表-------------------------------
    tableName = db_PREFIX & "WebSite" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[WebSiteUrl] VarChar Default """","                                  '网站地址
        sql = sql & "[webSiteBottom] Text Default """","                                  '底部信息 WebSiteBottom
        sql = sql & "[email] VarChar Default """","                                       'email
        sql = sql & "[copyright] VarChar Default """","                                   '版权
        sql = sql & "[logo] VarChar Default """","                                    	  'Logo
        sql = sql & "[qrcode] VarChar Default """","                                      '二维码
		
        '2013,12,18
        sql = sql & "[webTitle] VarChar Default """","                                    '网站自定标题
        sql = sql & "[webKeywords] VarChar Default """","                                 '网站关键词
        sql = sql & "[webDescription] Text Default """","                                 '网站描述

        sql = sql & "[createTime] DateTime Default Now(),"                               '创建时间
        sql = sql & "[upDateTime] DateTime Default Now(),"                                '修改时间
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型

        conn.execute(sql) 
    end if 
    
 
    '网站栏目表-------------------------------
    tableName = db_PREFIX & "WebColumn" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[columnName] VarChar Default """","                                  '导航名称
        sql = sql & "[columnEnName] VarChar Default """","                                '导航名称(英文)
        sql = sql & "[columnType] VarChar Default """","                                  '导航类型
        sql = sql & "[parentId] Int Default -1,"                                          '父栏目ID
        sql = sql & "[sortRank] Int Default 0,"                                           '排序编号
        sql = sql & "[views] Int Default 0,"                                              '点击次数
        sql = sql & "[smallImage] VarChar Default """","                                  '小图片地址
        sql = sql & "[bigImage] VarChar Default """","                                    '大图片地址
        sql = sql & "[bannerImage] VarChar Default """","                                 '当前Banner图片
        sql = sql & "[isThrough] Int Default 1,"                                          '是否通过

        sql = sql & "[webTitle] VarChar Default """","                                    '网站自定标题
        sql = sql & "[webKeywords] VarChar Default """","                                 '网站关键词
        sql = sql & "[webDescription] Text Default """","                                 '网站描述		
        sql = sql & "[nPageSize] Int Default 10,"                                         '每页显示条数
        
        sql = sql & "[flags] VarChar Default """","                                       '旗
        sql = sql & "[httpUrl] VarChar Default """","                                     '链接网址

        sql = sql & "[createTime] DateTime Default Now(),"                               '创建时间
        sql = sql & "[upDateTime] DateTime Default Now(),"                                '修改时间
        sql = sql & "[aboutcontent] Text Default """","                                   '简单介绍
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if 

    '文章信息表-------------------------------
    tableName = db_PREFIX & "ArticleDetail" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[parentId] Int Default -1,"                                          '父栏目ID
        sql = sql & "[sortRank] Int Default 0,"                                           '排序编号
        sql = sql & "[views] Int Default 0,"                                              '点击次数
        sql = sql & "[smallImage] VarChar Default """","                                  '小图片地址
        sql = sql & "[bigImage] VarChar Default """","                                    '大图片地址
        sql = sql & "[title] VarChar Default """","                                       '标题
        sql = sql & "[author] VarChar Default """","                                      '作者
		
        sql = sql & "[isThrough] Int Default 1,"                                          '是否通过
        sql = sql & "[createTime] DateTime Default Now(),"                               '创建时间
        sql = sql & "[upDateTime] DateTime Default Now(),"                                '修改时间       

        sql = sql & "[webTitle] VarChar Default """","                                    '网站自定标题
        sql = sql & "[webKeywords] VarChar Default """","                                 '网站关键词
        sql = sql & "[webDescription] Text Default """","                                 '网站描述
        sql = sql & "[flags] VarChar Default """","                                       '旗
        sql = sql & "[aboutcontent] Text Default """","                                   '简单介绍
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if 

    '单页表-------------------------------
    tableName = db_PREFIX & "OnePage" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[title] VarChar Default """","                                       '标题
        sql = sql & "[webTitle] VarChar Default """","                                    '网站自定标题
        sql = sql & "[webKeywords] VarChar Default """","                                 '网站关键词
        sql = sql & "[webDescription] Text Default """","                                 '网站描述
        sql = sql & "[sortRank] Int Default 0,"                                           '顺序
        sql = sql & "[banner] VarChar Default """","                                      '当前Banner图片
        sql = sql & "[views] Int Default 0,"                                              '点击次数
		
        sql = sql & "[isThrough] Int Default 1,"                                          '是否通过
        sql = sql & "[createTime] DateTime Default Now(),"                               '创建时间
        sql = sql & "[upDateTime] DateTime Default Now(),"                                '修改时间
        sql = sql & "[aboutcontent] Text Default """","                                   '简单介绍
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if     

    '管理员表-------------------------------
    tableName = db_PREFIX & "Admin" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[userName] VarChar Default """","                                    '账号
        sql = sql & "[pwd] VarChar Default """","                                         '密码
        sql = sql & "[nickname] VarChar Default """","                                    '昵称 
        sql = sql & "[level] Int Default 0,"                                              '管理级别
        sql = sql & "[pic] VarChar Default """","                                         '头像
        sql = sql & "[sex] VarChar Default ""男"","                                       '性别
        sql = sql & "[email] VarChar Default """","                                       '邮箱
        sql = sql & "[tel] VarChar Default """","                                         '电话
        sql = sql & "[isThrough] Int Default 1,"                                          '通过审核
        sql = sql & "[flags] VarChar Default """","                                          '电话

        sql = sql & "[createTime] DateTime Default Now(),"                               '创建时间
        sql = sql & "[upDateTime] DateTime Default Now(),"                                '修改时间
        sql = sql & "[regIP] VarChar Default """","                                       '注册IP
        sql = sql & "[upIP] VarChar Default """","                                        '修改IP
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if     
    '系统日志表-------------------------------
    tableName = db_PREFIX & "SystemLog" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[msgStr] Text Default """","                                         '信息内容
        sql = sql & "[item] VarChar Default """","                                        '类目
        sql = sql & "[tableName] VarChar Default """","                                   '表名 也可以说module模块
        sql = sql & "[url] Text Default """","                                            '动作
        sql = sql & "[adminId] Int Default -1,"                                            '管理员id
        sql = sql & "[adminName] VarChar Default 0,"                                      '管理员名称
        sql = sql & "[IP] VarChar Default """","                                          'IP地址


        sql = sql & "[createTime] DateTime Default Now(),"                               '创建时间
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if 
    '友情链接表-------------------------------
    tableName = db_PREFIX & "FriendLink" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[title] VarChar Default """","                                       '标题
        sql = sql & "[smallImage] VarChar Default """","                                  '小图片地址
        sql = sql & "[httpUrl] VarChar Default """","                                     '网址
        sql = sql & "[sortRank] Int Default 0,"                                           '排序编号


        sql = sql & "[isThrough] Int Default 1,"                                          '是否通过
        sql = sql & "[createTime] DateTime Default Now(),"                               '创建时间
        sql = sql & "[upDateTime] DateTime Default Now(),"                                '修改时间
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if 
    '招聘表-------------------------------
    tableName = db_PREFIX & "Job" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[title] VarChar Default """","                                       '职位名称
        sql = sql & "[sex] VarChar Default """","                                         '性别
        sql = sql & "[age] VarChar Default """","                                         '年龄
        sql = sql & "[education] VarChar Default """","                                   '教育
        sql = sql & "[workArea] VarChar Default """","                                    '工作区
        sql = sql & "[monthly] VarChar Default """","                                     '月薪待遇
        sql = sql & "[startTime] VarChar Default """","                               '发布日期
        sql = sql & "[endTime] VarChar Default """","                                 '截止日期
        sql = sql & "[webTitle] VarChar Default """","                                    '网站自定标题
        sql = sql & "[webKeywords] VarChar Default """","                                 '网站关键词
        sql = sql & "[webDescription] Text Default """","                                 '网站描述
        sql = sql & "[flags] VarChar Default """","                                       '旗
        sql = sql & "[sortRank] Int Default 0,"                                           '排序编号
        sql = sql & "[isThrough] Int Default 0,"                                          '是否通过

        sql = sql & "[createTime] DateTime Default Now(),"                               '创建时间
        sql = sql & "[upDateTime] DateTime Default Now(),"                                '修改时间
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if 
    '留言表-------------------------------
    tableName = db_PREFIX & "GuestBook" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[columnid] VarChar Default """","                                    '栏目ID
        sql = sql & "[parentId] Int Default -1,"                                          '父栏目ID
        sql = sql & "[title] VarChar Default """","                                       '标题
        sql = sql & "[guestName] VarChar Default """","                                   '姓名
        sql = sql & "[tel] VarChar Default """","                                         '电话
        sql = sql & "[fax] VarChar Default """","                                         '传真
        sql = sql & "[email] VarChar Default """","                                       '邮箱 
        sql = sql & "[QQ] VarChar Default """","                                          'QQ
        sql = sql & "[MSN] VarChar Default """","                                         'MSN号码
        sql = sql & "[company] VarChar Default """","                                     '公司
        sql = sql & "[address] VarChar Default """","                                     '地址
        sql = sql & "[postcode] VarChar Default """","                                    '邮编
        sql = sql & "[ip] VarChar Default """","                                          'IP地址 

        sql = sql & "[createTime] DateTime Default Now(),"                               '创建时间
        sql = sql & "[upDateTime] DateTime Default Now(),"                                '修改时间
        sql = sql & "[isThrough] Int Default 0,"                                          '是否通过


        sql = sql & "[reply] Text Default """","                                          '回复内容
        sql = sql & "[replyip] Text Default """","                                        '回复IP
        sql = sql & "[replydatetime] Text Default """","                                  '回复时间
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if 
    '反馈表-------------------------------
    tableName = db_PREFIX & "Feedback" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[columnid] VarChar Default """","                                    '栏目ID
        sql = sql & "[title] VarChar Default """","                                       '标题
        sql = sql & "[feedbacktype] VarChar Default """","                                '反馈类型
        sql = sql & "[guestName] VarChar Default """","                                   '姓名
        sql = sql & "[tel] VarChar Default """","                                         '电话
        sql = sql & "[fax] VarChar Default """","                                         '传真
        sql = sql & "[email] VarChar Default """","                                       '邮箱
        sql = sql & "[QQ] VarChar Default """","                                          'QQ号码
        sql = sql & "[MSN] VarChar Default """","                                         'MSN号码
        sql = sql & "[company] VarChar Default """","                                     '公司
        sql = sql & "[address] VarChar Default """","                                     '地址
        sql = sql & "[postcode] VarChar Default """","                                    '邮编
        sql = sql & "[ip] VarChar Default """","                                          'IP地址

        sql = sql & "[createTime] DateTime Default Now(),"                               '创建时间
        sql = sql & "[upDateTime] DateTime Default Now(),"                                '修改时间
        sql = sql & "[isThrough] Int Default 0,"                                          '是否通过


        sql = sql & "[reply] Text Default """","                                          '回复内容
        sql = sql & "[replyip] Text Default """","                                        '回复IP
        sql = sql & "[replydatetime] Text Default """","                                  '回复时间

        sql = sql & "[noteBody] Text Default """","                                       '笔记信息
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if 
    '会员表-------------------------------
    tableName = db_PREFIX & "Member" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table " & tableName & " (Id Int Identity(0,1) Primary Key," 
        sql = sql & "[userid] Int Default -1,"                                            '上级会员ID
        sql = sql & "[level] Int Default 0,"                                              '级别
        sql = sql & "[userType] VarChar Default """","                                    '类型
        sql = sql & "[userName] VarChar Default """","                                    '账号
        sql = sql & "[pwd] VarChar Default """","                                         '密码
        sql = sql & "[nickname] VarChar Default """","                                    '昵称
        sql = sql & "[pic] VarChar Default """","                                         '头像
        sql = sql & "[expiredatetime] DateTime Default Now(),"                            '到期时间
        
        
        sql = sql & "[sex] VarChar Default """","                                         '性别
        sql = sql & "[age] Int Default 18,"                                               '年龄
        sql = sql & "[tel] VarChar Default """","                                         '电话
        sql = sql & "[email] VarChar Default """","                                       '邮箱 
        sql = sql & "[qq] VarChar Default """","                                          'QQ号
        sql = sql & "[department] VarChar Default """","                                  '所在部门
        sql = sql & "[idcard] VarChar Default """","                                      '身份证
        sql = sql & "[dateOfBirth] DateTime,"                                             '出生日期
        sql = sql & "[address] VarChar Default """","                                     '联系地址
        sql = sql & "[hometown] VarChar Default """","                                    '籍贯

        
        sql = sql & "[lottery] Int Default 0,"                                            '抽奖次数
        sql = sql & "[money] Int Default 0,"                                              '金币 

        
        sql = sql & "[IP] VarChar Default """","                                          'IP
        sql = sql & "[regIP] VarChar Default """","                                       '注册IP
        sql = sql & "[regTime] DateTime Default Now(),"                                   '注册时间

        sql = sql & "[lastLoginIP] VarChar Default """","                                 '上次登录IP
        sql = sql & "[lastLoginTime] DateTime Default Now(),"                             '上次登录时间
        sql = sql & "[loginIp] VarChar Default """","                                     '登录IP
        sql = sql & "[loginTime] DateTime Default Now(),"                                 '登录时间        
        sql = sql & "[loginCount] Int Default 0,"                                         '登录次数
		
        sql = sql & "[isThrough] Int Default 0,"                                          '是否通过
        sql = sql & "[bodycontent] Text Default """")"                                    '备注
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if 

    '访问统计(引用别人202103)-------------------------------
    tableName = db_PREFIX & "count" 
    if checkCreateTable(tableName) = false then
        sql = "Create Table [" & tableName & "] (Id Int Identity(0,1) Primary Key,"  
        sql = sql & "ip VarChar Default """","                                          'IP 
        sql = sql & "useragent VarChar Default """","                                   '浏览器 
        sql = sql & "pv Int Default 0,"                                                 'pv
        sql = sql & "addr VarChar Default """","                                        '地址  
        sql = sql & "intime DateTime Default Now(),"                                    '创建时间 
        sql = sql & "url VarChar Default """")"                                         '来路网址
        if MDBPath = "" then sql = handleSqlServer(sql)                                 '把Access数据库类型转成SqlServer数据库类型
        conn.execute(sql) 
    end if 
    isAddData = true 
    if isAddData = true then
        ' call echo("loginname",loginname)
        ' call echo("loginpwd",loginpwd)
        'Add Admin
        conn.execute("insert into " & db_PREFIX & "admin (username,pwd,nickname,[level],flags) values('" & loginname & "','" & myMD5(loginpwd) & "','小孙',1,'|*|')") 

        dim fieldNameList, fieldValueList 
        fieldNameList = "webTitle,webKeywords,webDescription,WebSiteUrl,WebSiteBottom" 
        fieldValueList = "'网站标题','网站关键词','网站描述','http://www.baidu.com','版权所有 小云所有 电话：021-66666666 传真：021-8888888<br>联系QQ：313801120 邮箱：313801120@qq.com'" 
        conn.execute("insert into " & db_PREFIX & "website (" & fieldNameList & ") values(" & fieldValueList & ")") 
    end if 

end sub 

'创建数据库
sub createAccess()
    dim loginname, loginpwd 
    loginname = request("loginname") 
    loginpwd = request("loginpwd") 
    call openconn() 


    call webData(db_PREFIX, loginname, loginpwd)                                    '导入网站数据

    showLayout = "step5"                                                            '其它是没有内容的
end sub 
'显示默认
sub displayDefault()

    showLayout = "step1" 
    '默认配置
    selectDatabase = "access" 
    dbhost = "localhost" 
    dbuser = "sa" 
    dbpwd = "sa" 
    dbname = "webdata" 
    accessDir = "/data/" 
    msgStr = "创建数据库" 
    isYes = true 
    if request.form("selectDatabase") <> "" then
        selectDatabase = request.form("selectDatabase") 
        dbhost = request.form("dbhost") 
        dbuser = request.form("dbuser") 
        dbpwd = request.form("dbpwd") 
        dbname = request.form("dbname") 
        accessDir = phptrim(request.form("accessDir")) 
        accessPath = accessDir & "/data.mdb" 

        if selectDatabase = "access" then
            if accessDir = "" then
                msgStr = "access数据库安装目录不能为空" 
                isYes = false 
            elseif checkFolder(accessDir) = false then
                msgStr = "access数据库安装目录不存在" 
                isYes = false 
            elseif checkFile(accessPath) = true then
                msgStr = "access数据库存在，使用（" & accessPath & "）" 
            'isYes = false
            else
                call createMdb(accessPath)                                                      '创建数据库
            end if 

        'sqlserver 测试
        else
            accessPath = "" 
            if EDITORTYPE = "aspx" then
                connStr = "server='" & dbhost & ",1433';database='" & dbname & "';uid='" & dbuser & "';pwd='" & dbpwd & "';" 
            else
                connStr = " Password = " & dbpwd & "; user id =" & dbuser & "; Initial Catalog =" & dbname & "; data source =" & dbhost & ",1433;Provider = sqloledb;" 
            end if 


            if checkSqlServer(connStr) = false then
                call echo("connStr", connStr) 
                msgStr = "链接SqlServer数据库失败，检测账号密码" 
                isYes = false 
            end if 

        end if 

        '为真则创建数据库
        if isYes = true then
            content = readFile(configFilePath, "utf-8") 
            tempContent = content 

            '数据库
            startStr = "MDBPath = """ : endStr = """" 
            if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
                findStr = getStrCut(content, startStr, endStr, 1) 
                if EDITORTYPE = "aspx" then
                    if accessPath <> "" then
                        accessPath = handlePath(accessPath) 
                    end if 
                    accessPath = replace(accessPath, "\", "\\") 
                else
                    accessPath = replace(accessPath, "\\", "\") 
                    accessPath=replace(accessPath,handlePath("/"),"/")  '20170517
                end if 
                replaceStr = startStr & accessPath & endStr 
                content = replace(content, findStr, replaceStr) 
            end if 
            '数据库
            startStr = "databaseType = """ : endStr = """" 
            if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
                findStr = getStrCut(content, startStr, endStr, 1) 
                replaceStr = startStr & selectDatabase & endStr 
                content = replace(content, findStr, replaceStr) 
            end if 



            startStr = "sqlServerHostIP = """ : endStr = """" 
            if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
                findStr = getStrCut(content, startStr, endStr, 1) 
                if EDITORTYPE = "aspx" then
                    dbhost = replace(dbhost, "\", "\\") 
                end if 
                replaceStr = startStr & dbhost & endStr 
                content = replace(content, findStr, replaceStr) 
            end if 
            startStr = "sqlServerUsername = """ : endStr = """" 
            if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
                findStr = getStrCut(content, startStr, endStr, 1) 
                replaceStr = startStr & dbuser & endStr 
                content = replace(content, findStr, replaceStr) 
            end if 
            startStr = "sqlServerPassword = """ : endStr = """" 
            if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
                findStr = getStrCut(content, startStr, endStr, 1) 
                replaceStr = startStr & dbpwd & endStr 
                content = replace(content, findStr, replaceStr) 
            end if 
            startStr = "sqlServerDatabaseName = """ : endStr = """" 
            if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
                findStr = getStrCut(content, startStr, endStr, 1) 
                replaceStr = startStr & dbname & endStr 
                content = replace(content, findStr, replaceStr) 
            end if 

            '更新配置文件
            if tempContent <> content then
                   call writeToFile(configFilePath, content, "utf-8") 
            end if 

            showLayout = "step2" 
        end if 
    end if 
end sub 
'显示导入表面板
sub displayImportTableLayout()
    dim content, startStr, endStr, findStr, replaceStr 

    content = readFile(configFilePath, "utf-8")
    startStr = "db_PREFIX = """ 
    endStr = """" 
    if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
        findStr = getStrCut(content, startStr, endStr, 1) 
        replaceStr = startStr & request("db_PREFIX") & endStr 
        content = replace(content, findStr, replaceStr) 
        call writeToFile(configFilePath, content, "utf-8") 
    end if 

    '删除缓冲文件
    WEB_CACHEFile = replace(replace(WEB_CACHEFile, "[adminDir]", adminDir), "[EDITORTYPE]", EDITORTYPE) 
    'call echo("WEB_CACHEFile",WEB_CACHEFile)
    call deleteFile(WEB_CACHEFile) 
    showLayout = "step3" 
end sub 
'显示导入数据
sub displayImportData()
    call setsession("adminusername", "PAAJCMS") 
    call setsession("adminflags", "|*|") 
    showLayout = "step4" 
end sub 
%>
    <% if showLayout = "step1" then%>
    <form id="form1" name="form1" method="post" action="?act=displayDefault">
        <div class="pright">
            <div class="pr-title">
                <h3>第一步 选择数据库</h3>
            </div>
            <label for="radio"><input name="selectDatabase" type="radio" id="radio" value="access" <%=IIF(selectDatabase="access" , "checked" , "" )%> onClick="selectInsrtDatabase(this.value);" />
                Access数据库</label>
            <label for="radio2"><input name="selectDatabase" type="radio" id="radio2" value="sqlserver" <%=IIF(selectDatabase="sqlserver" , "checked" , "" )%> onClick="selectInsrtDatabase(this.value);" />
                SqlServer数据库</label>
            <table width="726" border="0" align="center" cellpadding="0" cellspacing="0" class="twbox">
                <tbody>
                    <tr>
                        <td class="onetd"><strong>提示：</strong></td>
                        <td>
                            <div class="mytipwrap">
                                <%=msgStr%> &nbsp;<a href="<% =WEB_VIEWURL%>" class="mytip" target="_blank">访问网站首页</a><a href="<% =WEB_ADMINURL%>" class="mytip" target="_blank">登录网站后台</a> </div>
                        </td>
                    </tr>
                </tbody>
                <tbody id="access_layout" <%=IIF(selectDatabase="sqlserver" , "style='display:none'" , "" )%>>
                    <tr>
                        <td class="onetd"><strong>Access目录：</strong></td>
                        <td>
                            <div style="float:left;margin-right:3px;"><input name="accessDir" id="accessDir" type="text" value="<% =accessDir%>" class="input-txt">
                            </div>
                            <div style="float:left" id="havedbsta">
                                <font color="red"></font>
                            </div>
                        </td>
                    </tr>
                </tbody>
                <tbody id="sqlserver_layout" <%=IIF(selectDatabase="access" , "style='display:none'" , "" )%> >
                    <tr>
                        <td class="onetd"><strong>数据库主机：</strong></td>
                        <td><input name="dbhost" id="dbhost" type="text" value="<% =dbhost%>" class="input-txt">
                            <small>一般为localhost 或 .\SQLEXPRESS</small> </td>
                    </tr>
                    <tr>
                        <td class="onetd"><strong>数据库用户：</strong></td>
                        <td><input name="dbuser" id="dbuser" type="text" value="<% =dbuser%>" class="input-txt"></td>
                    </tr>
                    <tr>
                        <td class="onetd"><strong>数据库密码：</strong></td>
                        <td>
                            <div style="float:left;margin-right:3px;"><input name="dbpwd" type="text" value="<% =dbpwd%>" class="input-txt" id="dbpwd" onChange="TestDb()">
                            </div>
                            <div style="float:left" id="dbpwdsta">
                                <font color="red"></font>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="onetd"><strong>数据库名称：</strong></td>
                        <td>
                            <div style="float:left;margin-right:3px;"><input name="dbname" id="dbname" type="text" value="<% =dbname%>" class="input-txt" onChange="HaveDB()">
                                请确定数据库名称存在
                            </div>
                            <div style="float:left" id="havedbsta">
                                <font color="red"></font>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-box">
                <input name="提交" type="submit" class="btnclick1" onClick="window.location.href='index.php?step=3';" value="继续">
            </div>
        </div>
        <script language="javascript">
            function selectInsrtDatabase(sValue){  
        //alert(document.getElementById("sqlserver_layout").innerHTML)  
        if(sValue=="access"){   
            document.getElementById("access_layout").style.display = ""  
            document.getElementById("sqlserver_layout").style.display="none";  
        }else{  
            document.getElementById("access_layout").style.display="none";  
            document.getElementById("sqlserver_layout").style.display="";  
        }  
    }  
    </script>
    </form>
    <% elseif showLayout = "step2" then%>
    <form id="form1" name="form1" method="post" action="?act=displayImportTableLayout">
        <div class="pright">
            <div class="pr-title">
                <h3>第二步 设置登录密码</h3>
            </div>
            <table width="726" border="0" align="center" cellpadding="0" cellspacing="0" class="twbox">
                <tbody>
                    <tr>
                        <td class="onetd"><strong>提示：</strong></td>
                        <td>
                            <div class="mytipwrap">创建数据库成功。(如果不恢复数据库将退出) &nbsp;<a href="<% =WEB_VIEWURL%>" class="mytip" target="_blank">访问网站首页</a><a href="<% =WEB_ADMINURL%>" class="mytip" target="_blank">登录网站后台</a> </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="onetd"><strong>表前缀：</strong></td>
                        <td>
                            <div style="float:left;margin-right:3px;"><input name="db_PREFIX" id="db_PREFIX" type="text" value="xy_" class="input-txt">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="onetd"><strong>登录账号：</strong></td>
                        <td>
                            <div style="float:left;margin-right:3px;"><input name="loginname" type="text" value="admin" class="input-txt">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="onetd"><strong>登录密码：</strong></td>
                        <td>
                            <div style="float:left;margin-right:3px;"><input name="loginpwd" type="text" value="admin" class="input-txt">
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-box">
                <input name="提交" type="submit" class="btnclick1" value="继续">
            </div>
        </div>
    </form>
    <% elseif showLayout = "step3" then%>
    <form id="form1" name="form1" method="post" action="?act=displayImportData">
        <div class="pright">
            <div class="pr-title">
                <h3>第三步 导入数据</h3>
            </div>
            <table width="726" border="0" align="center" cellpadding="0" cellspacing="0" class="twbox">
                <tbody>
                    <tr>
                        <td class="onetd"><strong>提示：</strong></td>
                        <td>
                            <div class="mytipwrap">创建表完成。(如果不恢复数据库将退出) &nbsp;<a href="<% =WEB_VIEWURL%>" class="mytip" target="_blank">访问网站首页</a><a href="<% =WEB_ADMINURL%>" class="mytip" target="_blank">登录网站后台</a> </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%dim iframeUrl:iframeUrl="?act=createAccess&loginname="&request("loginname")&"&loginpwd="&request("loginpwd")%>
                            <iframe src="<%=iframeUrl%>" width="100%" height="350"></iframe>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-box">
                <input name="提交" type="submit" class="btnclick1" value="继续">
            </div>
        </div>
    </form>
    <% elseif showLayout = "step4" then%>
    <div class="pright">
        <div class="pr-title">
            <h3>第四步 完成</h3> 
        </div>
        <table width="726" border="0" align="center" cellpadding="0" cellspacing="0" class="twbox">
            <tbody>
                <tr>
                    <td class="onetd"><strong>提示：</strong></td>
                    <td>
                        <div class="mytipwrap">导入数据完成 &nbsp;<a href="<% =WEB_VIEWURL%>" class="mytip" target="_blank">访问网站首页</a><a href="<% =WEB_ADMINURL%>" class="mytip" target="_blank">登录网站后台</a> </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <iframe src="addData.asp?act=setAccess&webdataDir=/install/WebData&login=out&n=<% =getRnd(9)%>" width="100%" height="350"></iframe>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <% end if%>
</body>

</html>