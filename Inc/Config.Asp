<% option explicit%> 
<!--#Include file = "Common.Asp"-->  
<!--#Include file = "FSO.Asp"-->  
<!--#Include file = "AdodbStream.Asp"-->  
<!--#Include file = "XML.Asp"-->  
<!--#Include file = "Time.Asp"-->  
<!--#Include file = "RegExp.Asp"-->  
<!--#Include file = "Http.Asp"-->   
<!--#Include file = "Cai.Asp"-->  
<!--#Include file = "StringNumber.Asp"-->  
<!--#Include file = "EncDec.Asp"-->  
<!--#Include file = "Access.Asp"-->   
<!--#Include file = "ASPPHPAccess.asp"-->   
<!--#Include file = "Check.Asp"-->   
<!--#Include file = "Url.Asp"-->  
<!--#Include file = "Conn.Asp"-->  
<!--#Include file = "Md5.Asp"-->   
<!--#Include file = "IE.Asp"-->   
<!--#Include file = "Json.Asp"-->
<!--#Include file = "2014_Js.Asp"-->  
<!--#Include file = "2014_Css.Asp"-->  
<!--#Include file = "2014_GBUTF.Asp"-->    
<!--#Include file = "2014_Cache.Asp"--> 
<!--#Include file = "2014_Cookies.Asp"--> 
<!--#Include file = "2014_Author.Asp"--> 
<!--#Include file = "2015_Color.Asp"--> 
<!--#Include file = "2015_SqlIn.Asp"-->
<!--#Include file = "2015_Json.Asp"-->
<!--#Include file = "2015_hexSwitch.asp"-->   
<!--#Include file = "2016_Log.Asp"-->   
<!--#Include file = "SystemInfo.Asp"-->   
<!--#Include file = "ip.Asp"-->    
<!--#Include file = "function.Asp"-->
<!--#Include file = "PinYin.Asp"-->
<!--#Include file = "Class_image.asp"-->
<!--#Include file = "member.asp"-->
<%  
server.scriptTimeout = 9999                                                     '超时
session.timeout = 1440                                                          '最大值为24小时，也就是说你最大可以session.timeout=1440，1441都是不可以
response.addheader "Content-Type", "text/html; charset=utf-8"
'禁止缓冲
response.buffer = true 
response.expires = 0 
response.expiresAbsolute = now() - 1 
response.cacheControl = "no-cache"  
response.addHeader "Expires", date() 
response.addHeader "Pragma", "no-cache"   
response.addHeader "Cache-Control", "private, no-cache, must-revalidate" 
dim conn, rs, rsx, rss, rst, rsd, tempRs, tempRs2, rsTemp,rs1,rs2,rs3,bbsRs
dim pubTimer : pubTimer = now()                                                 'Timer()不要用这个(20150728)
 
'Note:开发程序原则，能简单，绝对不复杂，能修改html的，绝对不修改asp，能傻瓜式，绝对不要用脑(20160121)
dim WEBCOLUMNTYPE : WEBCOLUMNTYPE = "首页|home,文本|text,产品|product,新闻|news,视频|video,下载|down,案例|case,留言|guestbook,反馈|feedback,招聘|job,搜索|search" 
dim adminDir : adminDir = "/admin/"                                               '后台目录
dim WEB_VIEWURL : WEB_VIEWURL = "/default.asp"                                   '前台显示
dim WEB_ADMINURL : WEB_ADMINURL = adminDir & "default.asp"                                  '后台显示
dim EDITORTYPE : EDITORTYPE = "asp"                                             '程序类型，是ASP,或PHP,或jSP,或.NET
dim webDir : webDir = "" 
MDBPath = "/data\data.mdb" 
dim ipMDBPath:ipMDBPath="/data/ip.dat"                                             'IP数据库
 
dim databaseType : databaseType = "access"                                      '数据库类型，Access与SqlServer之分
dim sqlServerHostIP : sqlServerHostIP = "localhost"                          'SQL主机IP地址（服务器名）在2008版本使用
dim sqlServerVersion : sqlServerVersion = "2012"                          'SQL版本，有2008，和2012，建议使用2012,翻页用到
dim sqlServerUsername : sqlServerUsername = "sa"                                'SQL数据库用户名
dim sqlServerPassword : sqlServerPassword = "sa"                                'SQL数据库用户密码
dim sqlServerDatabaseName : sqlServerDatabaseName = "webdata"                   'SQL数据库名
dim sqlServerPort : sqlServerPort = "1433"   '数据库端口号20240114'
dim db_PREFIX : db_PREFIX = "xy_"                                               '表前缀

dim countTi:countTi=200 '默认显示题数
dim WEB_CACHEFile : WEB_CACHEFile = "[adminDir]/[EDITORTYPE]cachedata.txt" '缓冲文件
dim isLoginIPAllow:isLoginIPAllow=false  '是否开启登录后台管理IP限制 20220627
dim isOnAdminLoginOnlyAddress:isOnAdminLoginOnlyAddress=false  '是否开启登录后台一个账号只能同一IP登录，不可多IP登录 20220923
dim maxLoginErr:maxLoginErr=5  '登录错误最大次数  ，超过则不可再登录了 0为不设置
dim isAdminArticleOnPaiZhan:isAdminArticleOnPaiZhan=true  '后台文章添加开启拍照按钮 20230828
dim version:version="V1.3"       '(20230311升级到1.3)'

dim pubIsDownIPJson:pubIsDownIPJson=false'是否下载IP查询不到时下载ip138数据20221029
dim pubWebSite:pubWebSite=""   '全部网站域名地址20221115' https://www.xiyueta.com/


'获得数组里的现在时间，因为access与sqlserver里获得时间不一致'
function getAccessDatediff(zdName)
	if databaseType = "acc"&"ess" then'防止被替换
		getAccessDatediff=" datediff('d',"& zdName &",now())"
	else
		getAccessDatediff=" datediff(day,"& zdName &",GETDATE())"
	end if	
end function
'获得数组里的现在时间，
function getAccessDatediffTime(zdName,sTime)
	if databaseType = "acc"&"ess" then'防止被替换
		getAccessDatediffTime=" datediff('d',"& zdName &",#" & sTime &"#)"
	else
		getAccessDatediffTime=" datediff(day,"& zdName &",'"& sTime &"')"   '要加上'号，要不然会报错
	end if	
end function


'秒'
function getAccessDatediffsecond(zdName)
    if databaseType = "acc"&"ess" then'防止被替换
        getAccessDatediffsecond=" datediff('s',"& zdName &",now())" 
    else
        getAccessDatediffsecond=" datediff(second,"& zdName &",GETDATE())"
    end if  
end function

'时
function getAccessDatediffHour(zdName)
    if databaseType = "acc"&"ess" then'防止被替换
        getAccessDatediffHour=" datediff('h',"& zdName &",now())" 
    else
        getAccessDatediffHour=" datediff(hour,"& zdName &",GETDATE())"
    end if  
end function



'周'
function getAccessDatediffWeek(zdName)
	if databaseType = "acc"&"ess" then'防止被替换
		getAccessDatediffWeek=" datediff('ww',"& zdName &",now())"
	else
		getAccessDatediffWeek=" datediff(week,"& zdName &",GETDATE())"
	end if	
end function
'月'
function getAccessDatediffMonth(zdName)
	if databaseType = "acc"&"ess" then'防止被替换
		getAccessDatediffMonth=" datediff('m',"& zdName &",now())"
	else
		getAccessDatediffMonth=" datediff(month,"& zdName &",GETDATE())"
	end if	
end function
'年'
function getAccessDatediffYear(zdName)
	if databaseType = "acc"&"ess" then'防止被替换
		getAccessDatediffYear=" datediff('yyyy',"& zdName &",now())"
	else
		getAccessDatediffYear=" datediff(year,"& zdName &",GETDATE())"
	end if	
end function

'sql语句里Text字段类型相等比较20231121'  如  sqlTextFieldEquation("bodycontent","xiyuetacom")
function sqlTextFieldEquation(fieldName,sValue)
    if databaseType = "acc"&"ess" then'防止被替换
        sqlTextFieldEquation= fieldName & "='"&  sValue &"'"
    else
        sqlTextFieldEquation="cast("& fieldName &" as varchar(7999))='"& sValue &"'"
    end if
end function
'sql语句里两个Text字段类型相等比较20231121 ''
function sqlTowTextFieldEquation(fieldName,fieldNameTow)
    if databaseType = "acc"&"ess" then'防止被替换
        sqlTowTextFieldEquation= fieldName & "='"&  fieldNameTow &"'"
    else
        sqlTowTextFieldEquation="cast("& fieldName &" as varchar(7999))='"& fieldNameTow &"'"
    end if
end function

'处理sql在accces与sqlserver里显示不一样' 20231101
function sqlAorS(stype)
    if databaseType = "acc"&"ess" then'防止被替换
        if instr("|s|h|d|ww|m|yyyy|","|"& stype &"|")>0 then
            stype="'"& stype &"'"
        end if
    else
        ' call echo("stype",stype)
        if sType="'s'" or sType="s" then
            sType="second"
        elseif sType="'h'" or sType="h" then
            sType="hour"
        elseif sType="'d'" or sType="d" then
            sType="day"
        elseif sType="'ww'" or sType="ww" then
            sType="week"
        elseif sType="'m'" or sType="m" then
            sType="month"
        elseif sType="'yyyy'" or sType="yyyy" then
            sType="year"
        elseif sType="now()" or sType="now" then
            sType="GETDATE()"
        elseif left(sType,1)="#" then
            sType="'" & mid(sType,2,len(sType)-2) & "'"
        end if
        ' call echo("stype",stype):call hr()
    end if
    sqlAorS=sType
end function

'排除指定域名 '
' if webDoMain()="http://demo.xiyueta.com" then

'指定域名做不同IP显示不同网站'
if instr(webDoMain(),"xiyueta.com")>0 then
	'不同IP显示不同内容'
	MDBPath = "/data/data_" & getIP() &".mdb"
	if checkFile(MDBPath)=false then
		call copyFile("/data/data.mdb",MDBPath)
	end if
end if
%> 