<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"--><%
'网站模板处理核心文件   xiyueta202308'

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,id,title,isDebug,s,tplname,url,thisV
thisV=1  '当前页版本号'
isDebug=false  '调试为假，则不显示信息'

'获得当前版本号与账号，与服务器端匹配'
dim serverUrl,webinfo
webinfo=request.serverVariables("SERVER_NAME")
rs.open "select username,version,resurl,tplname from " & db_PREFIX & "website" ,conn,1,1
if not rs.eof then 
    webinfo=webinfo&"@"&rs("username")&"@"&rs("version")
    '服务器地址'
    serverUrl=rs("resurl")      '资源服务器地址'
    tplname=rs("tplname")        '当前使用模板名'
end if:rs.close
if serverUrl="" then serverUrl=getServerUrl()
 

' call echo("webinfo",webinfo)
' call echo("serverUrl",serverUrl)
' call die("end")

webinfo=escape(webinfo)'转码'


'获得服务器地址，并更新'
function getServerUrl()
    dim c,url
    c="{resurl:'http://res/'}"
    c=gethttpurl("http://xiyueta.com/api/cms/?act=resurl&info="&webinfo,"utf-8")  '获得服务器对应资源地址'
    if instr(c,"{resurl:'")>0 then
        url=strcut(c,"{resurl:'","'}",0)
        if url<>"" then
            conn.execute("update " & db_PREFIX & "website set resurl='"& url &"'") '更新资源地址'            
        end if
    end if
    getServerUrl=url
end function

function updateTemplatePage()
    dim updatePath
    updatePath="userlist.asp"
    call deleteFile(updatePath) '先删除'
    if checkfile(updatePath)=false then
        url=serverUrl & "/api/tpl/update/?act=userlistasp"
        ' call echo("url",url)
        call saveRemoteFile(url,updatePath)
    end if 
    call die("{""info"": ""更新模板完成update.asp"",""status"": ""y""}")
end function

call updateTemplatePage()

%>