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
<!--#Include file = "2014_Js.Asp"-->  
<!--#Include file = "2014_Css.Asp"-->  
<!--#Include file = "2014_GBUTF.Asp"-->    
<!--#Include file = "2014_Cache.Asp"--> 
<!--#Include file = "2014_Cookies.Asp"--> 
<!--#Include file = "2014_Author.Asp"--> 
<!--#Include file = "2015_Color.Asp"--> 
<!--#Include file = "2015_SqlIn.Asp"-->
<!--#Include file = "2016_Log.Asp"-->   
<!--#Include file = "SystemInfo.Asp"-->   
<!--#Include file = "ip.Asp"-->   
<!--#Include file = "2015_Json.Asp"-->
<!--#Include file = "function.Asp"-->
<!--#Include file = "PinYin.Asp"-->
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
dim WEBCOLUMNTYPE : WEBCOLUMNTYPE = "首页|home,文本|text,产品|product,新闻|news,视频|video,下载|down,案例|case,留言|message,反馈|feedback,招聘|job,搜索|search" 
dim WEB_VIEWURL : WEB_VIEWURL = "/default.asp"                                   '前台显示
dim WEB_ADMINURL : WEB_ADMINURL = "/admin/default.asp"                                  '后台显示
dim EDITORTYPE : EDITORTYPE = "asp"                                             '程序类型，是ASP,或PHP,或jSP,或.NET
dim webDir : webDir = "" 
MDBPath = "/data\data.mdb" 
dim ipMDBPath:ipMDBPath="/data/ip.dat"                                             'IP数据库
 
dim databaseType : databaseType = "access"                                      '数据库类型，Access与SqlServer之分
dim sqlServerHostIP : sqlServerHostIP = "localhost"                          'SQL主机IP地址（服务器名）在2008版本使用
dim sqlServerUsername : sqlServerUsername = "sa"                                'SQL数据库用户名
dim sqlServerPassword : sqlServerPassword = "sa"                                'SQL数据库用户密码
dim sqlServerDatabaseName : sqlServerDatabaseName = "webdata"                   'SQL数据库名
dim db_PREFIX : db_PREFIX = "xy_"                                               '表前缀

dim countTi:countTi=200 '默认显示题数
dim adminDir : adminDir = "/admin/"                                               '后台目录
dim WEB_CACHEFile : WEB_CACHEFile = "[adminDir]/[EDITORTYPE]cachedata.txt" '缓冲文件


'获得数组里的现在时间，因为access与sqlserver里获得时间不一致'
function getAccessDatediff(zdName)
	if databaseType = "acc"&"ess" then'防止被替换
		getAccessDatediff="datediff('d',"& zdName &",now())"
	else
		getAccessDatediff="datediff(day,"& zdName &",GETDATE())"
	end if	
end function
'获得数组里的现在时间，
function getAccessDatediffTime(zdName,sTime)
	if databaseType = "acc"&"ess" then'防止被替换
		getAccessDatediffTime="datediff('d',"& zdName &",#" & sTime &"#)"
	else
		getAccessDatediffTime="datediff(day,"& zdName &","& sTime &")"
	end if	
end function
'周'
function getAccessDatediffWeek(zdName)
	if databaseType = "acc"&"ess" then'防止被替换
		getAccessDatediffWeek="datediff('ww',"& zdName &",now())"
	else
		getAccessDatediffWeek="datediff(week,"& zdName &",GETDATE())"
	end if	
end function
'月'
function getAccessDatediffMonth(zdName)
	if databaseType = "acc"&"ess" then'防止被替换
		getAccessDatediffMonth="datediff('m',"& zdName &",now())"
	else
		getAccessDatediffMonth="datediff(month,"& zdName &",GETDATE())"
	end if	
end function
'年'
function getAccessDatediffYear(zdName)
	if databaseType = "acc"&"ess" then'防止被替换
		getAccessDatediffYear="datediff('yyyy',"& zdName &",now())"
	else
		getAccessDatediffYear="datediff(year,"& zdName &",GETDATE())"
	end if	
end function




%> 