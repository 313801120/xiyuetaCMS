<!--#Include file = "inc/config.asp"-->
<!--#Include file = "website.asp"-->
<%
' +-----oOO-------------------+"
' |    author:XIYUETA         |"
' |    QQ:313801120           |"
' |    www.xiyueta.com        |"
' +------------------oOO------+"


call openconn()
dim nav,i,j,webtitle,webkeywords,webdescription,weblogo,webbiglogo,webqrcode,id,aboutcontent,bodycontent,parentid,webcopyright,webfoot,pageUrl,columnType,thisUrlFileName,navId,title,createTime,author,n,idList,columnName,columnEnName,bigimage,smallImage,views,webqq,webphone,webtel,webfax,webweixin,webemail,webaddress,webFileName,pageType,ennav,cssName,resurl,webcompany,webcompanyen,weburl,websql
dim addSql,bannerimage,asporhtml,onAutoAddDataToAccess,fabulous,tags
asporhtml=true   '静态网页为真'0为asp 1为html
onAutoAddDataToAccess=true  '开启自动添加数组到数据库里(主要是对onepage操作)20220602'
 
 
dim sKeyword
sKeyword=replace(request("k"),"'","")'搜索'
dim searchDid
searchDid=replace(request("searchDid"),"'","")'搜索大类'

id=replace(request("id"),"'","")
' if id<>"" then call eerr("id",id)
'读网站信息'
rs.open "select * from " & db_PREFIX & "website" ,conn,1,1
if not rs.eof then
  webtitle=uTitle & rs("webtitle")       '网页标题'(前面加个地区信息)
  webkeywords=rs("webkeywords")          '网页关键词'  
  webdescription=rs("webdescription")    '网页描述'
  webfoot=rs("webfoot")                  '网页底部'
  webcopyright=rs("copyright")           '网站版权'
  weblogo=rs("logo")                     '网站logo' 
  webbiglogo=rs("biglogo")               '网站biglogo' 
  webqrcode=rs("qrcode")                 '网站二维码'
  webqq=rs("qq")                         '网站QQ'
  webphone=rs("phone")                   '网站手机号'
  webtel=rs("tel")                       '网站电话'
  webfax=rs("fax")                       '网站传真'
  webweixin=rs("weixin")                 '网站微信'
  webemail=rs("email")                   '网站邮箱'
  webaddress=rs("address")               '公司地址'
  webcompany=rs("company")               '公司名称'
  webcompanyen=rs("companyen")           '公司英文名称'
  weburl=rs("weburl")                    '网站域名'
  asporhtml=IIF(rs("asporhtml")=0,false,true)              '静态网页为真'0为asp 1为html
  ' call echo(rs("asporhtml"),asporhtml) 
end if:rs.close

'获得网站底部，为默认的时候则更新20220327'
function getWebFoot(defaultContent)
  if instr(webfoot,"地址：某某市某某区某某路")>0 and onAutoAddDataToAccess=true then  '自动更改数据为真则操作'
    dim rs:Set rs = CreateObject("Adodb.RecordSet")
    rs.open "select webfoot from " & db_PREFIX & "WebSite" ,conn,1,3
    if not rs.eof then
      rs("webfoot")=defaultContent
      rs.update:rs.close
      getWebFoot=defaultContent
    end if
  else
    getWebFoot=webfoot
  end if  
end function
'获得网站二维码，为空时时候则更新20220327'
function getWebQrcode(defaultContent)
  if webqrcode="" and onAutoAddDataToAccess=true then  '自动更改数据为真则操作'
    dim rs:Set rs = CreateObject("Adodb.RecordSet")
    rs.open "select qrcode from " & db_PREFIX & "website" ,conn,1,3
    if not rs.eof then
      rs("qrcode")=defaultContent
      rs.update:rs.close
      getWebQrcode=defaultContent
    end if
  else
    getWebQrcode=webqrcode
  end if  
end function


thisUrlFileName=lcase(request.serverVariables("script_name"))
if instr(thisUrlFileName,"/")>0 then
  thisUrlFileName=mid(thisUrlFileName,instrrev(thisUrlFileName,"/")+1)
end if

if request("nav")<>"" then
  pageUrl=getNavNameToUrl("",request("nav"))  
  ' call echo(request("nav"),getNavNameToID("","首页"))
  ' call eerr("pageUrl",pageUrl)
  if pageUrl<>"" then
    if sKeyword<>"" then
      if asporhtml=true then
        asporhtml=false
        pageUrl=getNavNameToUrl("",request("nav"))
      end if
      pageUrl=pageUrl & "&k=" & sKeyword
    end if

    
      ' call eerr("pageUrl",pageUrl)

    response.redirect( pageUrl) '跳转网址
  end if

'为文章详细内容页'
elseif right(thisUrlFileName,10)="detail.asp" then
    pageType="detail"
    webFileName=phptrim(replace(request("filename"),"'",""))
    if webFileName<>"" then
      websql="select * from " & db_PREFIX & "articledetail where filename='"& webFileName &"'"
    else
      websql="select * from " & db_PREFIX & "articledetail where id=" & id
    end if
    'call eerr("websql",websql)
    rs.open websql,conn,1,3
    if not rs.eof then
        rs("views")=rs("views")+1  			   '浏览次数'
        rs.update
      	parentid=rs("parentid")            '上一级栏目ID'
        title=uTitle & rs("title")         '标题(前面加个地区信息)'
      

        aboutcontent=rs("aboutcontent")    '文章介绍'
        bodycontent=rs("bodycontent")      '文章内容'
        createtime=rs("createtime")        '文章创建时间'
        smallimage=rs("smallimage")        '文章小图'
        bigimage=rs("bigimage")            '文章大图'
        author=rs("author")                '文章作者'
        views=rs("views")                  '文章浏览量'
        fabulous=rs("fabulous")            '文章赞量'
        tags=rs("tags")                    '标签'
        id=rs("id")                        '文章ID，如果以文件名来查的的，需要加上id 2020715'


        if rs("title")<>"" then webtitle=uTitle & rs("title")                   '网页标题(前面加个地区信息)'
        if rs("webtitle")<>"" then webtitle=rs("webtitle")                      '网页标题'
        if rs("webkeywords")<>"" then webkeywords=rs("webkeywords")             '网页关键词'
        if rs("webdescription")<>"" then webdescription=rs("webdescription")    '网页描述'

        rsx.open "select * from " & db_PREFIX & "Webcolumn where id=" & rs("parentid") ,conn,1,1
        if not rsx.eof then
          navid=rsx("id")                         '栏目ID'
          nav=getRootNavName(rsx("id"))           '主栏目名称'
          ennav=getRootNavEnName(rsx("id"))       '主栏目英文名'
          columnname=rsx("columnname")            '当前栏目名称'
          columnenname=rsx("columnenname")        '当前栏目英文名'
          columntype=rsx("columntype")            '当前栏目类型'
          webfilename=rsx("filename")             '当前网站文件名'
        end if:rsx.close

        '记录文章浏览信息 view 为浏览 20230218'
        rsx.open "select * from " & db_PREFIX & "articlecount where  "& getAccessDatediff("updatetime")&"=0 and type='view' and  articleid=" & rs("id") ,conn,1,3
        if rsx.eof then
          rsx.addnew
          rsx("articleid")=rs("id")
          rsx("type")="view"
          rsx("count")=1
          rsx("createtime")=date()  
          rsx("ip")=getip()
          rsx.update


          rs("views")=1          '浏览次数'
          rs.update
          views=rs("views")                  '文章浏览量'
        else
          rsx("updatetime")=now()
          rsx("count")=rsx("count")+1
          rsx.update

          rss.open "select * from " & db_PREFIX & "articlecount where type='view' and  articleid=" & rs("id") ,conn,1,1
          rs("views")=rss.recordcount          '浏览次数'
          rss.close
          rs.update
          views=rs("views")                  '文章浏览量'
          ' call echo("show",rs("views"))
        end if:rsx.close
    end if:rs.close  

elseif id<>"" then
  pageType="column"
  rs.open "select * from " & db_PREFIX & "webcolumn where id=" & id ,conn,1,1
    if not rs.eof then
      parentid=rs("parentid")                '上一级栏目ID'
      navid=rs("id")                         '当前栏目ID'
      nav=getRootNavName(rs("id"))           '主栏目名称'
      ennav=getRootNavEnName(rs("id"))       '主栏目英文名'
      columnname=rs("columnname")            '当前栏目名称'
      columnenname=rs("columnenname")        '当前栏目英文名'
      columntype=rs("columntype")            '当前栏目类型'
      webfilename=rs("filename")             '当前网站文件名'
      aboutcontent=rs("aboutcontent")        '栏目介绍'
      bodycontent=rs("bodycontent")          '栏目内容'
        
      if rs("columnname")<>"" then webtitle=uTitle & rs("columnname")          '网页标题等于栏目名(前面加个地区信息)'
      if rs("webtitle")<>"" then webtitle=uTitle & rs("webtitle")              '网页标题等于栏目自定标题(前面加个地区信息)'
      if rs("webkeywords")<>"" then webkeywords=rs("webkeywords")              '网页关键词'
      if rs("webdescription")<>"" then webdescription=rs("webdescription")     '网页描述'
    else
      '导航不存在显示404    20230818
      Response.Clear()
      Response.Status = "404 Not Found"
      Response.End()
    end if:rs.close

end if
'导航ID不为空'
if navid<>"" then
  bannerimage=getNavBannerImage(navid)
  if bannerimage="" then bannerimage="/UploadFiles/testpic/ad.jpg"    '默认banner'
end if
'获得导航URL'
if columntype<>"" then
  pageUrl=getNavUrl(navid,columntype)
end if

'获得导航banner图片'  从小类往大类的banner图片，直到找到就停止
function getNavBannerImage(id)
  if id="" then getNavBannerImage="": exit function
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  rs.open "select * from ["& db_PREFIX &"webcolumn] where id="&id,conn,1,1
  if not rs.eof then
    if rs("bannerimage")<>"" then
      getNavBannerImage=rs("bannerimage")
      exit function
    elseif rs("parentid")<>-1 then
      getNavBannerImage=getNavBannerImage(rs("parentid"))
    end if
  end if:rs.close
end function


'是否为选择导航foucs'
function isFocusNav(rs)
  if rs("columntype")="home" and nav="" then
    isFocusNav=true
  elseif nav=rs("columnname") then  
    isFocusNav=true
  end if 
end function
'网站当前位置'
function navLocation(navid,c)
  dim parentid,s:parentid=-1
  if navid="" then navLocation="": exit function
  rs.open "select * from " & db_PREFIX & "webcolumn where id=" & navid ,conn,1,1
  if not rs.eof then
    parentid=rs("parentid")
    s=uTitle&rs("columnName")
    'pageType="detail" 为文章详细页，则全部导航都可点击20220715'
    if c<>"" or pageType="detail" then s="<a href='"& getNavUrl(rs("id"),rs("columnType")) &"'>"& s &"</a>"'前面/去掉了'
    c=s & " > " & c
  end if:rs.close
  if parentid<>-1 then
    call navLocation(parentid,c)
  else
    c="<a href='./'>首页</a> > "+c       '前面加个点0220525
  end if
  navLocation=c
end function
'获得导航URL'
function getNavUrl(navid,navtype)
  dim url,id
  id=navid
  if navid<>"" then
    dim rs:Set rs = CreateObject("Adodb.RecordSet")
    rs.open "select * from ["& db_PREFIX &"webcolumn] where id="&navid,conn,1,1
    if not rs.eof then
      id=navid
      if rs("filename")<>"" then           '文件名不为空则URL为文件名
        getNavUrl=urlWanZhen(rs("filename"))
        exit function
      elseif rs("httpurl")<>"" then        '网址不为空则URL为网址'
        getNavUrl=urlWanZhen(rs("httpurl"))
        exit function
      end if
      navtype=rs("columntype")             '类目类型更新20220410'
    end if:rs.close
  end if

  if navtype="home" then
    url="./"
  elseif navtype="text" then               '这个是自定义，系统已经设置好了
    if asporhtml=true then
      url="about_" & id &  ".html"
    else
      url="about.asp?id="&id
    end if
  elseif asporhtml=true then
    url=navtype & "_" & id &  ".html"


  else
    url=navtype & ".asp?id="&id
  end if
  getNavUrl=urlWanZhen(url)
end function
'获得导航URL不处理httpurl和filename字段'
function getNavGoToUrl(navid,navtype)
  dim url
  if navid<>"" then
    dim rs:Set rs = CreateObject("Adodb.RecordSet")
    rs.open "select * from ["& db_PREFIX &"webcolumn] where id="&navid,conn,1,1
    if not rs.eof then      
      navtype=rs("columntype") '类目类型更新20220410'
    end if:rs.close
  end if

  if navtype="home" then
    url="./"
  elseif navtype="text" then
    url="about.asp?id="&navid
  else
    url=navtype & ".asp?id="&navid
  end if
  getNavGoToUrl=url
end function
'让网页链接与当前网址进行处理获得目录，然后替换成指定域名20221116'
function urlWanZhen(url)
  dim thisUrl,nLen 
  if pubWebSite<>"" then
    thisUrl=getUrl()    '当前URL'
    nLen=instr(thisUrl,"://")
    if nLen>0 then
      thisUrl=mid(thisUrl,nLen+3)

      nLen=instr(thisUrl,"/")
      if nLen>0 then
        thisUrl=mid(thisUrl,nLen+1)
      end if
      thisUrl=pubWebSite & thisUrl
      url=fullHttpUrl(thisUrl,url)
      ' call eerr(thisUrl,url)
      url=replace(url,"/Default.asp?","/?")'替换这种'
    end if
  end if
  urlWanZhen=url 
end function

'获得文章链接 重写于20220524
function getArticleUrl(id) 
  dim dirName,parentid,columntype
  if id="" then getArticleUrl="": exit function


  '动态网页处理'
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  rs.open "select * from ["& db_PREFIX &"articledetail] where id="&id,conn,1,1
  if not rs.eof then
    if rs("filename")<>"" then           '文件名不为空则URL为文件名       
        getArticleUrl=urlWanZhen(rs("filename") )
        exit function
    end if
    parentid=rs("parentid")
  end if:rs.close

  '栏目目录 文件名称不为空'
  if parentid<>"" then
    rs.open "select * from ["& db_PREFIX &"webcolumn] where id="&parentid,conn,1,1
    if not rs.eof then      
      if rs("filename")<>"" then
        dirName=rs("filename") & "/"'目录名' 
      end if
      columntype=rs("columntype") & "_"
    end if:rs.close
  end if 

  '为动态网站时，直接显示㚃'
  if asporhtml=false then
    getArticleUrl=urlWanZhen(columntype & "detail.asp?id="&id)
    exit function
  end if
  ' call echo(parentid,columntype)
  getArticleUrl=urlWanZhen(dirName & columntype & "detail_"& id &".html")
end function
 

'获得导航字符转URL'   getNavNameToUrl("","产品中心>2020产品")  
function getNavNameToUrl(parentid,c)
  getNavNameToUrl=getNavUrl(getNavNameToID(parentid,c),"")
end function
'获得导航字符转ID'     如   getNavNameToID("","产品中心>2020产品")
function getNavNameToID(parentid,c)
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim sql,columnname,id,newid,addsql
  ' if parentid="" then parentid=-1     '这个不要'
  columnname=c
  if instr(c,">")>0 then
    columnname=mid(c,1,instr(c,">")-1)
    c=mid(c,instr(c,">")+1)
  else
    columnname=c
    c=""
  end if
  if parentid<>"" then addsql=" and parentid="& parentid &""
  sql="select * from " & db_PREFIX & "webcolumn where  columnname='"& columnname &"'"&addsql
  ' call echo("sql",sql):doevents
  rs.open sql ,conn,1,1
  if not rs.eof then 
    id=rs("id") 
  end if:rs.close
  ' call echo(c,"有"):doevents
  if c<>"" and id<>"" then
    newid=getNavNameToID(id,c)
  else
    newid=id
  end if
  getNavNameToID=newid
end function

'获得全部栏目ID列表 20210321  如1,4,5,6,2,6,8,9
function getColumAllID(parentid)
  if parentid="" then getColumAllID="": exit function
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s
  rs.open "select * from ["& db_PREFIX &"webcolumn] where parentid="&parentid,conn,1,1
  while not rs.EOF 
    if c<>"" then c=c & ","
    c=c & rs("id")
    s=getColumAllID(rs("id"))
    if s<>"" then
      c=c & "," & s
    end if
  rs.movenext:wend:rs.close
  getColumAllID=c
end function
'根据栏目名称获得全部子类id'   20210531
function getNameToAllId(name)
  dim id,s
  s=name
  id=getNavNameToID("",s)
  if id<>"" then
    idList=getColumAllID(id)
    if idList<>"" then
      getNameToAllId=id & "," & idList
    else
      getNameToAllId=id
    end if
  else
    getNameToAllId="-2"'-2为找不到内容'
  end if
end function

'获得主导航名称
function getRootNavName(id)
  if id="" then getRootNavName="": exit function
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s
  rs.open "select * from ["& db_PREFIX &"webcolumn] where id="&id,conn,1,1
  while not rs.EOF
    if rs("parentid")=-1 then
      getRootNavName=rs("columnname")
      exit function
    else
      getRootNavName=getRootNavName(rs("parentid"))
    end if
  rs.movenext:wend:rs.close
end function

'获得主栏目的说明内容20220531'
function getnavabout(id)
  if id="" then getnavabout="": exit function
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s
  rs.open "select * from ["& db_PREFIX &"webcolumn] where id="&id,conn,1,1
  while not rs.EOF
    if rs("parentid")=-1 then
      getnavabout=rs("aboutcontent")
      exit function
    else
      getnavabout=getnavabout(rs("parentid"))
    end if
  rs.movenext:wend:rs.close
end function

'获得主导航英文名称
function getRootNavEnName(id)
  if id="" then getRootNavEnName="": exit function
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s
  rs.open "select * from ["& db_PREFIX &"webcolumn] where id="&id,conn,1,1
  while not rs.EOF
    if rs("parentid")=-1 then
      getRootNavEnName=rs("columnenname")
      exit function
    else
      getRootNavEnName=getRootNavEnName(rs("parentid"))
    end if
  rs.movenext:wend:rs.close
end function
'获得主导航ID 20210529
function getRootNavId(id)
  if id="" then getRootNavId="": exit function
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s
  rs.open "select * from ["& db_PREFIX &"WebColumn] where id="&id,conn,1,1
  while not rs.EOF
    if rs("parentid")=-1 then
      getRootNavId=rs("id")
      exit function
    else
      getRootNavId=getRootNavId(rs("parentid"))
    end if
  rs.movenext:wend:rs.close
end function
'获得栏目内容20210531'
function getColumBody(name,cutNumb)
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  rs.open "select * from ["& db_PREFIX &"WebColumn] where columnName='"& name &"'",conn,1,1
  if not rs.eof then
    getColumBody=cutStr(rs("bodycontent"),cutNumb,"...")
  end if:rs.close
end function

'获得栏目ID'
function getColumnId(name)
  dim id
  id=-1
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  rs.open "select id from ["& db_PREFIX &"WebColumn] where columnName='"& name &"'",conn,1,1
  if not rs.eof then
    id=rs("id")
  end if:rs.close
  getColumnId=id
end function

'获得单页内容，     cutStr("abcd",60,"...")
function getOnePageBody(title,content)  
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c:c=content
  rs.open"select * from ["& db_PREFIX &"onepage] where title='"& title &"'",conn,1,3
  if not rs.eof then
    c=rs("bodycontent")
  else
    if content<>"" and onAutoAddDataToAccess=true then  '自动更改数据为真则操作'
      rs.addnew
      rs("title")=title
      rs("bodycontent")=content
      rs.update
      ' call echo("onAutoAddDataToAccess",onAutoAddDataToAccess)
    end if
  end if:rs.close
  getOnePageBody=c
end function
'获得单页里图片20220521
function getOnePageImage(title)  
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c 
  rs.open"select * from ["& db_PREFIX &"onepage] where title='"& title &"'",conn,1,2
  if not rs.eof then
    c=rs("smallimage")   
  end if:rs.close
  getOnePageImage=c
end function
'获得上一页，下一页网址20220525'
function getUpDownPageUrl(url,page)
  if asporhtml=true and request("k")="" then'静态页，并且搜索值为空20220703
    if instr(url,".html")>0 then
       getUpDownPageUrl=left(url,len(url)-5) & "_" & page & ".html" 
    else
       getUpDownPageUrl=page & ".html"
    end if
  else
    getUpDownPageUrl=url & IIF(instr(url,"?")=false,"?","&")  & "page="&page &IIF(sKeyword<>"","&k="&sKeyword,"")
  end if
  getUpDownPageUrl=urlWanZhen(getUpDownPageUrl)  '处理当前网址完整并替换指定域名20221116'
end function

'显示在线编辑 调用方法 call displayOnLineEdit(true)  网址后面加参数：?onlineedit=1'
function displayOnLineEdit(isShow)
  if isShow=true then
    if request("onlineedit")<>"" then
      call rw("<script src='http://xiyueta.com/js/online/'></script>")
    end if
  end if
end function
'获得样式'
function getStyle(httpurl)
  dim c,nLen
  c=gethttpurl(httpurl,"utf-8")
  nLen=instr(c,"<body>")
  if nLen>0 then
    c=mid(c,nLen+6)
  end if
  nLen=instrRev(c,"</body>")
  if nLen>0 then
    c=mid(c,1,nLen-1)
  end if
  call rw(c)
end function
'获得主栏目名称20170404
function getRootColumnCnName(byval id) 
  dim i,parentid
  for i =1 to 9
    rs1.open"select * from " & db_PREFIX & "WebColumn where id="& id &"",conn,1,1
    if not rs1.eof then
      parentid=cstr(rs1("parentid"))
      if parentid<>"-1" then
        id=rs1("parentid")
      else
        getRootColumnCnName=rs1("columnname") 
        rs1.close
        exit for    
      end if
    else
      exit for
    end if:rs1.close
  next
end function
 
'地址不为区则替换网页标题，关键词，描述里,前面加上地区信息'
if uTitle<>"" then
  webTitle=uTitle & replace(replace(webTitle,",", ","&uTitle),"，", "，"&uTitle)                
  webkeywords=uTitle & replace(replace(webkeywords,",",  "," & uTitle),"，", "，" &uTitle)
  webdescription=uTitle & replace(replace(webdescription,",",  "," & uTitle),"，", "，" &uTitle)
end if


'获得xiyueta分类ID对应的名称列表20230420'
function getXiyuetaColumnIdToName(id) 
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  id=id &""
  if id="" then getXiyuetaColumnIdToName="": exit function
  ' call echo("id",id):doevents
  rs.open "select * from ["& db_PREFIX &"xiyuetaclass] where id="&id,conn,1,1
  if not rs.eof then
    getXiyuetaColumnIdToName=rs("columnname")
  else
    getXiyuetaColumnIdToName=""
  end if:rs.close
end function
%>