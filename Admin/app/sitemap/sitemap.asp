<!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<%

call showCheckAdminRule("生成sitemap")
dim genXml, genHtml, msg, resultLinks,isDebug,isFirstVisit
isDebug=false
msg = ""
resultLinks = ""

' 处理表单提交的值
if request("act")="submit" then
    ' 提交时，保存用户选择到 Session
    genXml = request("gen_xml")
    genHtml = request("gen_html")
    ' 确保保存到 Session（即使是空值也要保存）
    if genXml = "" then
        session("sitemap_gen_xml") = ""
    else
        session("sitemap_gen_xml") = genXml
    end if
    if genHtml = "" then
        session("sitemap_gen_html") = ""
    else
        session("sitemap_gen_html") = genHtml
    end if
else
    ' 非提交时，从 Session 或 request 获取值
    if request("gen_xml") <> "" or request("gen_html") <> "" then
        ' 如果有 URL 参数，使用参数值
        genXml = request("gen_xml")
        genHtml = request("gen_html")
    else
        ' 否则使用 Session 中保存的值（如果 Session 不存在，则为空）
        if isempty(session("sitemap_gen_xml")) then
            genXml = ""
        else
            genXml = session("sitemap_gen_xml")
        end if
        if isempty(session("sitemap_gen_html")) then
            genHtml = ""
        else
            genHtml = session("sitemap_gen_html")
        end if
    end if
end if

' 判断是否是首次访问（Session 中没有保存的值且没有提交）
dim hasSessionXml, hasSessionHtml
hasSessionXml = not isempty(session("sitemap_gen_xml"))
hasSessionHtml = not isempty(session("sitemap_gen_html"))
isFirstVisit = (genXml = "" and genHtml = "" and request("act") <> "submit" and not hasSessionXml and not hasSessionHtml)

if request("act")="submit" then
    msg = ""
    resultLinks = ""
    
    ' 检查是否至少选择了一个选项
    if genXml <> "on" and genHtml <> "on" then
        msg = "<div class='layui-elem-quote layui-quote-nm' style='border-left: 4px solid #ff5722; margin-bottom: 20px;'><i class='layui-icon layui-icon-close-fill' style='color: #ff5722; font-size: 18px;'></i> <strong style='color: #ff5722;'>您还没有选择任何生成类型！</strong><br><br>请至少选择一个选项（<span style='color: #1E9FFF; font-weight: 500;'>生成 sitemap.xml</span> 或 <span style='color: #1E9FFF; font-weight: 500;'>生成 sitemap.html</span>）才能生成网站地图。您可以同时选择两个选项来生成两种格式。</div>"
    else
        dim successCount
        successCount = 0
        
        ' 生成 XML
        if genXml = "on" then
            call getSiteMapXML()
            successCount = successCount + 1
            resultLinks = resultLinks & "<a href='/sitemap.xml' target='_blank' class='layui-btn layui-btn-sm layui-btn-primary'><i class='layui-icon layui-icon-file'></i> 查看 sitemap.xml</a> "
        end if
        
        ' 生成 HTML
        if genHtml = "on" then
            call getSiteMapHTML()
            successCount = successCount + 1
            resultLinks = resultLinks & "<a href='/sitemap.html' target='_blank' class='layui-btn layui-btn-sm layui-btn-primary'><i class='layui-icon layui-icon-file'></i> 查看 sitemap.html</a> "
        end if
        
        if successCount > 0 then
            msg = "<div class='layui-elem-quote layui-quote-nm' style='border-left: 4px solid #5FB878;'><i class='layui-icon layui-icon-ok' style='color: #5FB878;'></i> 生成成功！共生成 " & successCount & " 个文件，时间：" & format_Time(now(),1) & "</div><div style='margin-top: 15px;'>" & resultLinks & "</div>"
        end if
    end if
end if

function handleWebUrl(url)
	if url="/default.asp" then url="/"
	if left(url,1)<>"/" then url="/" & url
	handleWebUrl=webDoMain() & url
end function

' function getSiteMapXML()
'     dim httpurl,c
'     httpurl=webDoMain() & "/sitemap.asp"
'     if isDebug then call echo("httpurl",httpurl)
'     c=gethttpurl(httpurl,"utf-8") 
'     call writetofile("/sitemap.xml",c,"utf-8") 
' end function

function getSiteMapXML()
    call openconn()
    dim c
    c="<?xml version='1.0' encoding='UTF-8'?>" & vbcrlf
    c=c&"<urlset xmlns=""http://www.sitemaps.org/schemas/sitemap/0.9"">"&vbcrlf
 
    ' rs.open "select * from " & db_PREFIX & "sitemap where isThrough=1 and statuscode=200 order by id asc" ,conn,1,1
    ' if isDebug then call echo("提示","共有"& rs.recordcount &"条")
    ' while not rs.eof
    '     c=c & vbtab & "<url>"&vbcrlf
    '     c=c & copystr(vbtab,2) & "<loc><![CDATA[" & rs("url")&"]]></loc>" & vbcrlf
    '     c=c & copystr(vbtab,2) & "<lastmod>"&format_Time(rs("createtime"),2)&"</lastmod>" & vbcrlf
    '     c=c & copystr(vbtab,2) & "<changefreq>weekly</changefreq>" & vbcrlf
    '     c=c & vbtab & "</url>"&vbcrlf

    ' rs.movenext:wend:rs.close    

    c=c&getNavToSiteMap("*")
    c=c&getArticleSiteMap("*")
    c=c & "</urlset>"
    call writetofile("/sitemap.xml",c,"utf-8")
    getSiteMapXML=c
end function


'生成导航html' 20251014
function getNavToSiteMap(idList)  
    dim url,htmlFile,isGenerate,content,navtype,newUrl,newHtmlFile,viewUrl,nMaxPage,totalPages,totalRecords,i,pageUrl,sql,addSql,pageHtmlFile,nLen,defaultLanguage,splxx,languageList,nMax,j,c 
    if idList<>"" then
        addSql=" where isthrough=1 and ishtml=1"  '生成html要为真'
        if idList<>"*" then  '为*生成全部文章'
            addSql=addSql & " and id in("&idList&")"
        end if


        dim rs:Set rs = CreateObject("Adodb.RecordSet")
        rs.open"select languageList from " & db_PREFIX & "website order by sortrank desc,sortrank asc",conn,1,1
        if not rs.eof then
            languageList=rs("languageList") 
            if isDebug then call echo("需要生成的版本有",rs("languageList"))
            splxx=split(rs("languageList")&"|cn|","|")
            defaultLanguage=splxx(1)  '默认语言'
            if isDebug then call echo("默认语言为",defaultLanguage)
        end if:rs.close
        ' and updatetime > createHtmltime ' 暂时不需要这个
        addSql=addSql&" ORDER BY parentid asc, sortrank asc"  '生成html要正排序，更新要倒排序，让没生成在前，更新在前'
        sql="select * from ["& db_PREFIX &"webcolumn]"&addSql
        if isDebug then call echo("sql",sql):doevents 

        rs.open sql,conn,1,1
        nMax=rs.recordcount
        if nMax>9999 then nMax=9999
        for i=1 to nMax
            if rs.eof then exit for      
            if isDebug then call echoBlueB("处理导行id="&rs("id"),i&"/"&nMax)
            isGenerate=true
            if phptrim(rs("httpurl"))<>"" then        '网址不为空则URL为网址'
                isGenerate=false
            end if
            navtype=rs("columntype")
            if navtype="text" then navtype="about"

            if phptrim(rs("filename"))<>"" then
                htmlFile="/"&phptrim(rs("filename"))
            elseif navtype="home" then
                htmlFile="/index.html"
            else
                htmlFile="/"&navtype & "_" & rs("id") &  ".html"
            end if 
            if isGenerate then
                ' 首页优先级最高，其他导航页面次之
                dim navPriority
                if navtype="home" then
                    navPriority="1.0"
                else
                    navPriority="0.9"
                end if
                
                if instr(languageList,"|cn|")>0 then
                    url=getWebUrl("cn",htmlFile,defaultLanguage)
                    c=c & getSitemapC(url,rs("updatetime"),navPriority)
                    if isDebug then call echo("cn",url)
                end if                

                if instr(languageList,"|en|")>0 then      
                    url=getWebUrl("en",htmlFile,defaultLanguage)
                    c=c & getSitemapC(url,rs("updatetime"),navPriority)
                    if isDebug then call echo("en",url)
                end if    

                if instr(languageList,"|ft|")>0 then  
                    url=getWebUrl("ft",htmlFile,defaultLanguage)
                    c=c & getSitemapC(url,rs("updatetime"),navPriority)
                    if isDebug then call echo("ft",url)
                end if



                '翻页'
                if instr("|product|news|video|down|case|","|"&navtype&"|")>0 then
 
                    idList=getColumAllID20251015(rs("id"))
                    if idList<>"" then idList=idList+","
                    idList=idList & rs("id")
                    addSql=" where parentId in("& idList &")"

                    sql="select count(*)as ct from ["&db_PREFIX&"articledetail]"&addSql
                    rsx.open sql ,conn,1,1
                    totalRecords=IIF(isnull(rsx("ct"))=true,0,rsx("ct")):rsx.close
                    totalPages=calculateTotalPages(totalRecords,rs("npagesize"))

                    if isDebug then call echo("sql",sql)
                    if isDebug then call echo("条数",totalRecords)
                    if isDebug then call echo("每页显示",rs("npagesize"))
                    if isDebug then call echo("页数totalPages",totalPages)
                    if totalPages>1 then
                        for j=2 to totalPages  '从第二页开始生成'
                            nLen=instrrev(htmlFile,".")
                            pageHtmlFile=mid(htmlFile,1,nLen-1) & "_"&j&mid(htmlFile,nLen)
                            if isDebug then call echo("pageHtmlFile",pageHtmlFile) 
                            if instr(languageList,"|cn|")>0 then
                                url=getWebUrl("cn",pageHtmlFile,defaultLanguage)
                                c=c & getSitemapC(url,rs("updatetime"),"0.7")
                                if isDebug then call echo("翻页cn",url)
                                doevents
                            end if
                            if instr(languageList,"|en|")>0 then  
                                url=getWebUrl("en",pageHtmlFile,defaultLanguage)
                                c=c & getSitemapC(url,rs("updatetime"),"0.7")
                                if isDebug then call echo("翻页en",url)
                                doevents
                            end if
                            if instr(languageList,"|ft|")>0 then  
                                url=getWebUrl("ft",pageHtmlFile,defaultLanguage)
                                c=c & getSitemapC(url,rs("updatetime"),"0.7")
                                if isDebug then call echo("翻页ft",url)
                                doevents
                            end if
                        next
                    end if
                    doevents
                end if
 

            end if 
        rs.movenext:next:rs.close
    end if 
    getNavToSiteMap=c
end function

'生成文章html' 20251016
function getArticleSiteMap(idList)  
    dim url,htmlFile,i,pageUrl,sql,addSql,pageHtmlFile,nLen,defaultLanguage,splxx,languageList,nMax,c
    if idList<>"" then
        addSql=" where isthrough=1 and ishtml=1"  '生成html要为真'
        if idList<>"*" then  '为*生成全部文章'
            addSql=addSql & " and id in("&idList&")"
        end if

        dim rs:Set rs = CreateObject("Adodb.RecordSet")
        rs.open"select languageList from " & db_PREFIX & "website order by sortrank desc,sortrank asc",conn,1,1
        if not rs.eof then 
            languageList=rs("languageList") 
            if isDebug then call echo("需要生成的版本有",rs("languageList"))
            splxx=split(rs("languageList")&"|cn|","|")
            defaultLanguage=splxx(1)  '默认语言'
            if isDebug then call echo("默认语言为",defaultLanguage)
        end if:rs.close
        'and updatetime > createHtmltime 不要这个判断，在搜索里有搜索未生成选项可查看到未生成html文章的'
        addSql=addSql&" ORDER BY updatetime DESC"  '生成html要正排序，更新要倒排序，让没生成在前，更新在前'
        sql="select * from ["& db_PREFIX &"articledetail]"&addSql
        if isDebug then call echo("sql",sql):doevents

        rs.open sql,conn,1,1
        nMax=rs.recordcount
        if nMax>9999 then nMax=9999
        for i=1 to nMax
            if rs.eof then exit for           
            if isDebug then call echoBlueB("生成文章",i&"/"&nMax)
            if phptrim(rs("filename"))<>"" then
                htmlFile="/"&phptrim(rs("filename")) 
            else
                htmlFile="/detail_" & rs("id") &  ".html"
            end if
 
            if rs("isthrough") then     '审核为真'
                ' 文章页面优先级设为0.8
                if instr(languageList,"|cn|")>0 then
                    url=getWebUrl("cn",htmlFile,defaultLanguage)
                    c=c & getSitemapC(url,rs("updatetime"),"0.8")
                    if isDebug then call echo("文章cn",url)
                end if                

                if instr(languageList,"|en|")>0 then      
                    url=getWebUrl("en",htmlFile,defaultLanguage)
                    c=c & getSitemapC(url,rs("updatetime"),"0.8")
                    if isDebug then call echo("文章en",url)
                end if    

                if instr(languageList,"|ft|")>0 then  
                    url=getWebUrl("ft",htmlFile,defaultLanguage)
                    c=c & getSitemapC(url,rs("updatetime"),"0.8")
                    if isDebug then call echo("文章ft",url)
                end if
            end if
        rs.movenext:next:rs.close
    end if
    getArticleSiteMap=c
end function


function getSitemapC(url,updateTime,priority)
    dim c,lastmodTime
    ' 如果没有提供updatetime，使用当前时间
    if isDate(updateTime) then
        lastmodTime=format_Time(updateTime,2)
    else
        lastmodTime=format_Time(now(),2)
    end if
    ' 如果没有提供priority，默认为0.8
    if priority="" or not isnumeric(priority) then priority="0.8"
    
    c=c & vbtab & "<url>"&vbcrlf
    c=c & copystr(vbtab,2) & "<loc><![CDATA[" & phptrim(url) &"]]></loc>" & vbcrlf
    c=c & copystr(vbtab,2) & "<lastmod>"&lastmodTime&"</lastmod>" & vbcrlf
    c=c & copystr(vbtab,2) & "<changefreq>weekly</changefreq>" & vbcrlf
    c=c & copystr(vbtab,2) & "<priority>"&priority&"</priority>" & vbcrlf
    c=c & vbtab & "</url>"&vbcrlf
    getSitemapC=c
end function
'获得网站网址'
function getWebUrl(language,htmlFile,defaultLanguage)
    dim newHtmlFile
    if language<>defaultLanguage then
        call createFolder("/"&language&"/")  '创建对英言版本目录'
        newHtmlFile="/" & language & htmlFile  '加个判断'
    else
        newHtmlFile= htmlFile  '加个判断'
    end if
    getWebUrl=webDoMain() & newHtmlFile
end function


'获得全部栏目ID列表 20210321  如1,4,5,6,2,6,8,9
function getColumAllID20251015(parentid)
  if parentid="" then getColumAllID20251015="": exit function
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s
  rs.open "select * from ["& db_PREFIX &"webcolumn] where parentid="&parentid,conn,1,1
  while not rs.EOF 
    if c<>"" then c=c & ","
    c=c & rs("id")
    s=getColumAllID20251015(rs("id"))
    if s<>"" then
      c=c & "," & s
    end if
  rs.movenext:wend:rs.close
  getColumAllID20251015=c
end function
' 计算总页数的函数
Function calculateTotalPages(totalRecords, recordsPerPage)
    If recordsPerPage <= 0 Then
        calculateTotalPages = 0
        Exit Function
    End If
    
    If totalRecords <= 0 Then
        calculateTotalPages = 0
        Exit Function
    End If
    
    ' 使用向上取整计算总页数
    calculateTotalPages = Int((totalRecords - 1) / recordsPerPage) + 1
End Function

'生成sitemap.html文件 20250101
function getSiteMapHTML()
    call openconn()
    dim c,siteTitle,siteDomain
    siteDomain=webDoMain()
    
    ' 获取网站标题
    dim rs:Set rs = CreateObject("Adodb.RecordSet")
    rs.open"select top 1 * from " & db_PREFIX & "website order by sortrank desc,sortrank asc",conn,1,1
    if not rs.eof then
        siteTitle=phptrim(rs("webtitle"))
        if siteTitle="" then siteTitle="网站地图"
    else
        siteTitle="网站地图"
    end if
    rs.close
    
    ' 开始生成HTML
    c="<!DOCTYPE html>" & vbcrlf
    c=c & "<html lang=""zh-CN"">" & vbcrlf
    c=c & "<head>" & vbcrlf
    c=c & vbtab & "<meta charset=""UTF-8"">" & vbcrlf
    c=c & vbtab & "<meta name=""viewport"" content=""width=device-width, initial-scale=1.0"">" & vbcrlf
    c=c & vbtab & "<meta name=""robots"" content=""index,follow"">" & vbcrlf
    c=c & vbtab & "<title>" & server.HTMLEncode(siteTitle) & " - 网站地图</title>" & vbcrlf
    c=c & vbtab & "<style>" & vbcrlf
    c=c & vbtab & vbtab & "body { font-family: Arial, 'Microsoft YaHei', sans-serif; line-height: 1.6; margin: 0; padding: 20px; background: #f5f5f5; }" & vbcrlf
    c=c & vbtab & vbtab & ".container { max-width: 1200px; margin: 0 auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }" & vbcrlf
    c=c & vbtab & vbtab & "h1 { color: #333; border-bottom: 3px solid #007bff; padding-bottom: 10px; margin-bottom: 30px; }" & vbcrlf
    c=c & vbtab & vbtab & "h2 { color: #555; margin-top: 30px; margin-bottom: 15px; padding-left: 10px; border-left: 4px solid #007bff; }" & vbcrlf
    c=c & vbtab & vbtab & ".sitemap-section { margin-bottom: 40px; }" & vbcrlf
    c=c & vbtab & vbtab & ".link-list { list-style: none; padding: 0; margin: 0; }" & vbcrlf
    c=c & vbtab & vbtab & ".link-list li { padding: 8px 0; border-bottom: 1px solid #eee; }" & vbcrlf
    c=c & vbtab & vbtab & ".link-list li:last-child { border-bottom: none; }" & vbcrlf
    c=c & vbtab & vbtab & ".link-list a { color: #007bff; text-decoration: none; transition: color 0.3s; }" & vbcrlf
    c=c & vbtab & vbtab & ".link-list a:hover { color: #0056b3; text-decoration: underline; }" & vbcrlf
    c=c & vbtab & vbtab & ".link-list .update-time { color: #999; font-size: 12px; margin-left: 10px; }" & vbcrlf
    c=c & vbtab & vbtab & ".language-group { margin-bottom: 20px; }" & vbcrlf
    c=c & vbtab & vbtab & ".language-title { font-weight: bold; color: #666; margin-bottom: 10px; padding: 5px 10px; background: #f0f0f0; border-radius: 4px; }" & vbcrlf
    c=c & vbtab & vbtab & ".footer { text-align: center; margin-top: 40px; padding-top: 20px; border-top: 1px solid #eee; color: #999; font-size: 12px; }" & vbcrlf
    c=c & vbtab & "</style>" & vbcrlf
    c=c & "</head>" & vbcrlf
    c=c & "<body>" & vbcrlf
    c=c & vbtab & "<div class=""container"">" & vbcrlf
    c=c & vbtab & vbtab & "<h1>网站地图 - " & server.HTMLEncode(siteTitle) & "</h1>" & vbcrlf
    c=c & vbtab & vbtab & "<p style=""color: #666; margin-bottom: 30px;"">最后更新：" & format_Time(now(),1) & " | <a href=""/sitemap.xml"" target=""_blank"">查看XML格式</a></p>" & vbcrlf
    
    ' 生成导航部分
    c=c & getNavToSiteMapHTML("*")
    
    ' 生成文章部分
    c=c & getArticleSiteMapHTML("*")
    
    c=c & vbtab & vbtab & "<div class=""footer"">" & vbcrlf
    c=c & vbtab & vbtab & vbtab & "<p>© " & year(now()) & " " & server.HTMLEncode(siteTitle) & " | 网站地图自动生成</p>" & vbcrlf
    c=c & vbtab & vbtab & "</div>" & vbcrlf
    c=c & vbtab & "</div>" & vbcrlf
    c=c & "</body>" & vbcrlf
    c=c & "</html>" & vbcrlf
    
    call writetofile("/sitemap.html",c,"utf-8")
    getSiteMapHTML=c
end function

'生成导航HTML部分
function getNavToSiteMapHTML(idList)
    dim url,htmlFile,isGenerate,navtype,defaultLanguage,splxx,languageList,nMax,i,c,rs,addSql,sql,totalPages,totalRecords,pageHtmlFile,nLen,j,idListForPage
    c=""
    if idList<>"" then
        addSql=" where isthrough=1 and ishtml=1"
        if idList<>"*" then
            addSql=addSql & " and id in("&idList&")"
        end if

        Set rs = CreateObject("Adodb.RecordSet")
        rs.open"select languageList from " & db_PREFIX & "website order by sortrank desc,sortrank asc",conn,1,1
        if not rs.eof then
            languageList=rs("languageList")
            splxx=split(languageList&"|cn|","|")
            defaultLanguage=splxx(1)
        end if
        rs.close
        
        addSql=addSql&" ORDER BY parentid asc, sortrank asc"
        sql="select * from ["& db_PREFIX &"webcolumn]"&addSql
        
        rs.open sql,conn,1,1
        nMax=rs.recordcount
        if nMax>9999 then nMax=9999
        
        c=c & vbtab & vbtab & "<div class=""sitemap-section"">" & vbcrlf
        c=c & vbtab & vbtab & vbtab & "<h2>导航页面</h2>" & vbcrlf
        
        for i=1 to nMax
            if rs.eof then exit for
            isGenerate=true
            if phptrim(rs("httpurl"))<>"" then
                isGenerate=false
            end if
            navtype=rs("columntype")
            if navtype="text" then navtype="about"

            if phptrim(rs("filename"))<>"" then
                htmlFile="/"&phptrim(rs("filename"))
            elseif navtype="home" then
                htmlFile="/index.html"
            else
                htmlFile="/"&navtype & "_" & rs("id") &  ".html"
            end if
            
            if isGenerate then
                c=c & vbtab & vbtab & vbtab & "<div class=""language-group"">" & vbcrlf
                c=c & vbtab & vbtab & vbtab & vbtab & "<div class=""language-title"">" & server.HTMLEncode(rs("columnName")) & "</div>" & vbcrlf
                c=c & vbtab & vbtab & vbtab & vbtab & "<ul class=""link-list"">" & vbcrlf
                
                if instr(languageList,"|cn|")>0 then
                    url=getWebUrl("cn",htmlFile,defaultLanguage)
                    c=c & vbtab & vbtab & vbtab & vbtab & vbtab & "<li><a href=""" & url & """ target=""_blank"">" & server.HTMLEncode(url) & "</a><span class=""update-time"">" & format_Time(rs("updatetime"),2) & "</span></li>" & vbcrlf
                end if
                
                if instr(languageList,"|en|")>0 then
                    url=getWebUrl("en",htmlFile,defaultLanguage)
                    c=c & vbtab & vbtab & vbtab & vbtab & vbtab & "<li><a href=""" & url & """ target=""_blank"">" & server.HTMLEncode(url) & "</a><span class=""update-time"">" & format_Time(rs("updatetime"),2) & "</span></li>" & vbcrlf
                end if
                
                if instr(languageList,"|ft|")>0 then
                    url=getWebUrl("ft",htmlFile,defaultLanguage)
                    c=c & vbtab & vbtab & vbtab & vbtab & vbtab & "<li><a href=""" & url & """ target=""_blank"">" & server.HTMLEncode(url) & "</a><span class=""update-time"">" & format_Time(rs("updatetime"),2) & "</span></li>" & vbcrlf
                end if
                
                '翻页处理
                if instr("|product|news|video|down|case|","|"&navtype&"|")>0 then
                    idListForPage=getColumAllID20251015(rs("id"))
                    if idListForPage<>"" then idListForPage=idListForPage+","
                    idListForPage=idListForPage & rs("id")
                    addSql=" where parentId in("& idListForPage &")"

                    sql="select count(*)as ct from ["&db_PREFIX&"articledetail]"&addSql
                    Set rsx = CreateObject("Adodb.RecordSet")
                    rsx.open sql ,conn,1,1
                    totalRecords=IIF(isnull(rsx("ct"))=true,0,rsx("ct")):rsx.close
                    totalPages=calculateTotalPages(totalRecords,rs("npagesize"))

                    if totalPages>1 then
                        for j=2 to totalPages  '从第二页开始生成'
                            nLen=instrrev(htmlFile,".")
                            pageHtmlFile=mid(htmlFile,1,nLen-1) & "_"&j&mid(htmlFile,nLen)
                            
                            if instr(languageList,"|cn|")>0 then
                                url=getWebUrl("cn",pageHtmlFile,defaultLanguage)
                                c=c & vbtab & vbtab & vbtab & vbtab & vbtab & "<li><a href=""" & url & """ target=""_blank"">" & server.HTMLEncode(url) & "</a><span class=""update-time"">" & format_Time(rs("updatetime"),2) & "</span></li>" & vbcrlf
                            end if
                            
                            if instr(languageList,"|en|")>0 then
                                url=getWebUrl("en",pageHtmlFile,defaultLanguage)
                                c=c & vbtab & vbtab & vbtab & vbtab & vbtab & "<li><a href=""" & url & """ target=""_blank"">" & server.HTMLEncode(url) & "</a><span class=""update-time"">" & format_Time(rs("updatetime"),2) & "</span></li>" & vbcrlf
                            end if
                            
                            if instr(languageList,"|ft|")>0 then
                                url=getWebUrl("ft",pageHtmlFile,defaultLanguage)
                                c=c & vbtab & vbtab & vbtab & vbtab & vbtab & "<li><a href=""" & url & """ target=""_blank"">" & server.HTMLEncode(url) & "</a><span class=""update-time"">" & format_Time(rs("updatetime"),2) & "</span></li>" & vbcrlf
                            end if
                        next
                    end if
                end if
                
                c=c & vbtab & vbtab & vbtab & vbtab & "</ul>" & vbcrlf
                c=c & vbtab & vbtab & vbtab & "</div>" & vbcrlf
            end if
        rs.movenext:next:rs.close
        
        c=c & vbtab & vbtab & "</div>" & vbcrlf
    end if
    getNavToSiteMapHTML=c
end function

'生成文章HTML部分
function getArticleSiteMapHTML(idList)
    dim url,htmlFile,defaultLanguage,splxx,languageList,nMax,i,c,rs,articleCount,addSql,sql
    c=""
    if idList<>"" then
        addSql=" where isthrough=1 and ishtml=1"
        if idList<>"*" then
            addSql=addSql & " and id in("&idList&")"
        end if

        Set rs = CreateObject("Adodb.RecordSet")
        rs.open"select languageList from " & db_PREFIX & "website order by sortrank desc,sortrank asc",conn,1,1
        if not rs.eof then
            languageList=rs("languageList")
            splxx=split(languageList&"|cn|","|")
            defaultLanguage=splxx(1)
        end if
        rs.close
        
        addSql=addSql&" ORDER BY updatetime DESC"
        sql="select * from ["& db_PREFIX &"articledetail]"&addSql
        
        rs.open sql,conn,1,1
        nMax=rs.recordcount
        if nMax>9999 then nMax=9999
        
        ' 只显示前500篇文章，避免HTML文件过大
        articleCount=0
        if nMax>500 then nMax=500
        
        c=c & vbtab & vbtab & "<div class=""sitemap-section"">" & vbcrlf
        c=c & vbtab & vbtab & vbtab & "<h2>文章内容 (" & nMax & " 条最新)</h2>" & vbcrlf
        c=c & vbtab & vbtab & vbtab & "<ul class=""link-list"">" & vbcrlf
        
        for i=1 to nMax
            if rs.eof then exit for
            if rs("isthrough") then
                if phptrim(rs("filename"))<>"" then
                    htmlFile="/"&phptrim(rs("filename"))
                else
                    htmlFile="/detail_" & rs("id") &  ".html"
                end if
                
                if instr(languageList,"|cn|")>0 then
                    url=getWebUrl("cn",htmlFile,defaultLanguage)
                    c=c & vbtab & vbtab & vbtab & vbtab & "<li><a href=""" & url & """ target=""_blank"">" & server.HTMLEncode(rs("title")) & " - " & server.HTMLEncode(url) & "</a><span class=""update-time"">" & format_Time(rs("updatetime"),2) & "</span></li>" & vbcrlf
                end if
                
                if instr(languageList,"|en|")>0 then
                    url=getWebUrl("en",htmlFile,defaultLanguage)
                    c=c & vbtab & vbtab & vbtab & vbtab & "<li><a href=""" & url & """ target=""_blank"">" & server.HTMLEncode(rs("title")) & " - " & server.HTMLEncode(url) & "</a><span class=""update-time"">" & format_Time(rs("updatetime"),2) & "</span></li>" & vbcrlf
                end if
                
                if instr(languageList,"|ft|")>0 then
                    url=getWebUrl("ft",htmlFile,defaultLanguage)
                    c=c & vbtab & vbtab & vbtab & vbtab & "<li><a href=""" & url & """ target=""_blank"">" & server.HTMLEncode(rs("title")) & " - " & server.HTMLEncode(url) & "</a><span class=""update-time"">" & format_Time(rs("updatetime"),2) & "</span></li>" & vbcrlf
                end if
                
                articleCount=articleCount+1
            end if
        rs.movenext:next:rs.close
        
        c=c & vbtab & vbtab & vbtab & "</ul>" & vbcrlf
        c=c & vbtab & vbtab & "</div>" & vbcrlf
    end if
    getArticleSiteMapHTML=c
end function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>生成网站地图</title>
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
<link href="../../css/nprogress.min.css" rel="stylesheet" />
<script src="../../js/nprogress.min.js"></script>
<style>
.sitemap-container {
    padding: 20px;
    max-width: 900px;
    margin: 0 auto;
}
.sitemap-card {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
    padding: 30px;
    margin-bottom: 20px;
}
.sitemap-title {
    font-size: 24px;
    font-weight: 500;
    color: #333;
    margin-bottom: 10px;
    padding-bottom: 15px;
    border-bottom: 2px solid #1E9FFF;
}
.sitemap-desc {
    color: #666;
    line-height: 1.8;
    margin-bottom: 30px;
    font-size: 14px;
}
.sitemap-options {
    margin: 30px 0;
}
.sitemap-option-item {
    padding: 20px;
    margin-bottom: 15px;
    border: 2px solid #e6e6e6;
    border-radius: 6px;
    transition: all 0.3s;
    cursor: pointer;
    background: #fafafa;
}
.sitemap-option-item:hover {
    border-color: #1E9FFF;
    background: #f0f8ff;
}
.sitemap-option-item.active {
    border-color: #1E9FFF;
    background: #e8f4ff;
}
.sitemap-option-item input[type="checkbox"] {
    margin-right: 10px;
    cursor: pointer;
}
.sitemap-option-label {
    font-size: 16px;
    font-weight: 500;
    color: #333;
    cursor: pointer;
    display: flex;
    align-items: center;
    user-select: none;
}
.sitemap-option-desc {
    font-size: 13px;
    color: #999;
    margin-top: 8px;
    margin-left: 28px;
    line-height: 1.6;
}
.sitemap-icon {
    font-size: 24px;
    color: #1E9FFF;
    margin-right: 12px;
}
.sitemap-submit-btn {
    width: 100%;
    height: 50px;
    font-size: 16px;
    margin-top: 20px;
}
.sitemap-info-box {
    background: #f8f9fa;
    border-left: 4px solid #1E9FFF;
    padding: 15px;
    margin-top: 20px;
    border-radius: 4px;
}
.sitemap-info-box .layui-icon {
    font-size: 16px;
    margin-right: 8px;
}
@keyframes shake {
    0%, 100% { transform: translateX(0); }
    10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
    20%, 40%, 60%, 80% { transform: translateX(5px); }
}
.sitemap-option-item.error-highlight {
    border-color: #ff5722 !important;
    background-color: #fff5f5 !important;
    animation: shake 0.5s;
}
</style>
</head>
<body style="background: #f2f2f2;">
<div class="sitemap-container">
    <div class="sitemap-card">
        <h1 class="sitemap-title">
            <i class="layui-icon layui-icon-location" style="color: #1E9FFF;"></i> 网站地图生成器
        </h1>
        <div class="sitemap-desc">
            网站地图可以帮助搜索引擎更好地抓取和索引您的网站内容。您可以选择生成 XML 格式（供搜索引擎使用）或 HTML 格式（供用户浏览），也可以同时生成两种格式。
        </div>
        
        <%if msg<>"" then call rw(msg)%>
        
        <form id="sitemapForm" name="sitemapForm" class="layui-form" method="post" action="?act=submit">
            <div class="sitemap-options">
                <div class="sitemap-option-item<% if genXml = "on" or isFirstVisit then response.write " active" %>" id="option_xml">
                    <label class="sitemap-option-label" for="gen_xml">
                        <input type="checkbox" name="gen_xml" id="gen_xml" value="on" lay-skin="primary" title="生成 sitemap.xml"<% if genXml = "on" or isFirstVisit then response.write " checked"%>>
                        <span class="sitemap-icon"><i class="layui-icon layui-icon-file"></i></span>
                        <span>生成 sitemap.xml</span>
                    </label>
                    <div class="sitemap-option-desc">
                        XML 格式的网站地图，符合搜索引擎标准，用于提交给 Google、Bing 等搜索引擎，帮助提高网站收录率。
                    </div>
                </div>
                
                <div class="sitemap-option-item<% if genHtml = "on" or isFirstVisit then response.write " active" %>" id="option_html">
                    <label class="sitemap-option-label" for="gen_html">
                        <input type="checkbox" name="gen_html" id="gen_html" value="on" lay-skin="primary" title="生成 sitemap.html"<% if genHtml = "on" or isFirstVisit then response.write " checked"%>>
                        <span class="sitemap-icon"><i class="layui-icon layui-icon-file"></i></span>
                        <span>生成 sitemap.html</span>
                    </label>
                    <div class="sitemap-option-desc">
                        HTML 格式的网站地图，用户友好的可视化页面，方便访客浏览网站结构，提升用户体验。
                    </div>
                </div>
            </div>
            
            <div class="sitemap-info-box">
                <i class="layui-icon layui-icon-tips"></i>
                <strong>提示：</strong>生成过程可能需要一些时间，请耐心等待。建议定期更新网站地图以保持内容同步。
            </div>
            
            <button type="submit" class="layui-btn layui-btn-lg layui-btn-normal sitemap-submit-btn">
                <i class="layui-icon layui-icon-play"></i> 开始生成
            </button>
        </form>
    </div>
</div>

<script>
layui.use(['form', 'layer'], function(){
    var form = layui.form;
    var layer = layui.layer;
    
    // 初始化表单
    form.render();
    
    // 延迟初始化，确保 Layui 渲染完成
    setTimeout(function() {
        // 同步所有复选框的初始状态（根据服务器端设置的值）
        $('#gen_xml, #gen_html').each(function() {
            var checkbox = this;
            // 确保 Layui 样式与原生复选框状态一致
            if (checkbox.checked) {
                $(checkbox).next('.layui-form-checkbox').addClass('layui-form-checked');
            } else {
                $(checkbox).next('.layui-form-checkbox').removeClass('layui-form-checked');
            }
            // 同步选项卡片样式
            syncCheckboxState(checkbox);
        });
    }, 150);
    
    // 更新选项样式
    function updateOptionStyle(item, checked) {
        if (checked) {
            item.addClass('active');
        } else {
            item.removeClass('active');
        }
    }
    
    // 同步复选框状态（原生复选框和 Layui 样式）
    function syncCheckboxState(checkbox) {
        if (!checkbox) return;
        
        var $checkbox = $(checkbox);
        var layuiCheckbox = $checkbox.next('.layui-form-checkbox');
        
        // 同步 Layui 样式
        if (checkbox.checked) {
            layuiCheckbox.addClass('layui-form-checked');
        } else {
            layuiCheckbox.removeClass('layui-form-checked');
        }
        
        // 更新选项样式
        var item = $checkbox.closest('.sitemap-option-item');
        updateOptionStyle(item, checkbox.checked);
    }
    
    // 监听复选框变化（Layui 的 checkbox 事件）
    form.on('checkbox', function(data){
        var checkbox = data.elem;
        var item = $(checkbox).closest('.sitemap-option-item');
        
        // 确保原生复选框状态与 Layui 事件数据同步
        if (checkbox) {
            checkbox.checked = data.elem.checked;
        }
        
        // 更新样式
        updateOptionStyle(item, checkbox.checked);
    });
    
    // 防止重复点击的标记
    var isProcessing = false;
    
    // 使用事件委托处理点击事件，避免冲突
    $(document).on('click', '.sitemap-option-item', function(e){
        // 如果正在处理中，忽略点击
        if (isProcessing) {
            e.preventDefault();
            e.stopPropagation();
            return false;
        }
        
        // 如果点击的是复选框本身，不处理（让浏览器和 Layui 处理）
        if ($(e.target).is('input[type="checkbox"]')) {
            return;
        }
        
        // 如果点击的是 label 内的文字，不处理（label 会触发复选框）
        if ($(e.target).closest('label').length > 0 && !$(e.target).is('.sitemap-option-desc')) {
            return;
        }
        
        // 阻止事件冒泡，避免重复触发
        e.preventDefault();
        e.stopPropagation();
        
        // 设置处理标记
        isProcessing = true;
        
        // 点击选项区域的其他部分时，切换复选框
        var checkbox = $(this).find('input[type="checkbox"]')[0];
        if (checkbox) {
            // 切换状态
            var newState = !checkbox.checked;
            checkbox.checked = newState;
            
            // 先同步状态
            syncCheckboxState(checkbox);
            
            // 触发 change 事件，让 Layui 知道状态变化
            try {
                var event = new Event('change', { bubbles: true });
                checkbox.dispatchEvent(event);
            } catch(err) {
                // 兼容旧浏览器
                try {
                    var event = document.createEvent('Event');
                    event.initEvent('change', true, true);
                    checkbox.dispatchEvent(event);
                } catch(e2) {
                    // 如果都失败，手动触发 jQuery 事件
                    $(checkbox).trigger('change');
                }
            }
            
            // 重新渲染 Layui 复选框
            form.render('checkbox');
            
            // 再次同步状态（确保 Layui 渲染后状态正确）
            setTimeout(function() {
                syncCheckboxState(checkbox);
                isProcessing = false;
            }, 100);
        } else {
            isProcessing = false;
        }
        
        return false;
    });
    
    // 监听原生复选框的 change 事件作为备用
    $(document).on('change', '#gen_xml, #gen_html', function() {
        syncCheckboxState(this);
    });
    
    // 直接点击复选框时，确保状态同步
    $(document).on('click', '#gen_xml, #gen_html', function(e) {
        // 让浏览器和 Layui 先处理
        setTimeout(function() {
            syncCheckboxState(this);
        }.bind(this), 50);
    });
    
    // 表单提交
    $('#sitemapForm').submit(function(e){
        // 先移除之前可能添加的隐藏字段
        $('input[name="gen_xml"][type="hidden"]').remove();
        $('input[name="gen_html"][type="hidden"]').remove();
        
        // 直接检查原生复选框的 checked 属性（最可靠的方法）
        var xmlCheckbox = document.getElementById('gen_xml');
        var htmlCheckbox = document.getElementById('gen_html');
        
        // 方法1: 检查原生复选框状态
        var genXml = xmlCheckbox && (xmlCheckbox.checked === true || xmlCheckbox.checked === 'checked');
        var genHtml = htmlCheckbox && (htmlCheckbox.checked === true || htmlCheckbox.checked === 'checked');
        
        // 方法2: 如果原生复选框状态不明确，通过 Layui 的样式类判断
        if (xmlCheckbox && genXml === false) {
            var layuiXml = $('input[name="gen_xml"]').next('.layui-form-checkbox');
            if (layuiXml.length > 0 && layuiXml.hasClass('layui-form-checked')) {
                genXml = true;
            }
        } else if (!xmlCheckbox) {
            // 如果原生复选框不存在，尝试通过 Layui 样式判断
            var layuiXml = $('input[name="gen_xml"]').next('.layui-form-checkbox');
            if (layuiXml.length > 0 && layuiXml.hasClass('layui-form-checked')) {
                genXml = true;
            }
        }
        
        if (htmlCheckbox && genHtml === false) {
            var layuiHtml = $('input[name="gen_html"]').next('.layui-form-checkbox');
            if (layuiHtml.length > 0 && layuiHtml.hasClass('layui-form-checked')) {
                genHtml = true;
            }
        } else if (!htmlCheckbox) {
            // 如果原生复选框不存在，尝试通过 Layui 样式判断
            var layuiHtml = $('input[name="gen_html"]').next('.layui-form-checkbox');
            if (layuiHtml.length > 0 && layuiHtml.hasClass('layui-form-checked')) {
                genHtml = true;
            }
        }
        
        if (!genXml && !genHtml) {
            // 显示更明确的错误提示
            layer.msg('您还没有选择任何生成类型！请至少选择一个选项（sitemap.xml 或 sitemap.html）才能生成网站地图。', {
                icon: 2,
                time: 4000,
                area: ['400px', 'auto']
            });
            
            // 添加视觉反馈：高亮未选中的选项并添加错误样式
            $('.sitemap-option-item').each(function() {
                var checkbox = $(this).find('input[type="checkbox"]')[0];
                if (checkbox && !checkbox.checked) {
                    $(this).addClass('error-highlight');
                    setTimeout(function() {
                        $(this).removeClass('error-highlight');
                    }.bind(this), 1000);
                }
            });
            
            e.preventDefault();
            return false;
        }
        
        // 确保选中的复选框值会被正确提交
        // 方法：如果复选框被选中，确保它有正确的值，并且没有被禁用
        if (genXml) {
            if (xmlCheckbox) {
                xmlCheckbox.value = 'on';
                xmlCheckbox.disabled = false;
                xmlCheckbox.checked = true;
            } else {
                // 如果原生复选框不存在，创建隐藏字段
                $('<input>').attr({
                    type: 'hidden',
                    name: 'gen_xml',
                    value: 'on'
                }).appendTo('#sitemapForm');
            }
        }
        
        if (genHtml) {
            if (htmlCheckbox) {
                htmlCheckbox.value = 'on';
                htmlCheckbox.disabled = false;
                htmlCheckbox.checked = true;
            } else {
                // 如果原生复选框不存在，创建隐藏字段
                $('<input>').attr({
                    type: 'hidden',
                    name: 'gen_html',
                    value: 'on'
                }).appendTo('#sitemapForm');
            }
        }
        
        // 显示加载提示
        var index = layer.load(1, {
            shade: [0.1,'#fff']
        });
        
        // 提交后会刷新页面，所以这里不需要手动关闭
        return true;
    });
});
</script>
</body>
</html>