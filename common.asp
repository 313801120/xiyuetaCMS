<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "inc/config.asp"-->
<!--#Include file = "inc/website.asp"-->
<%





call openconn()
dim nav,i,j,webtitle,webkeywords,webdescription,weblogo,webbiglogo,webqrcode,id,aboutcontent,bodycontent,parentid,webcopyright,webfoot,pageUrl,columnType,thisUrlFileName,navId,title,createTime,author,n,idList,columnName,columnEnName,bigimage,smallImage,views,webqq,webphone,webtel,webfax,webweixin,webemail,webaddress,webFileName,pageType,ennav,cssName,resurl,webcompany,weburl,websql
dim addSql,bannerimage,asporhtml,onAutoAddDataToAccess,fabulous,tags,detailPagingTypeList,sUrl
asporhtml=true
onAutoAddDataToAccess=true
detailPagingTypeList=ChrW(44)&ChrW(44)
dim sKeyword
sKeyword=replace(request(ChrW(107)),ChrW(39),"")
dim searchDid
searchDid=replace(request(ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(105)&ChrW(100)),ChrW(39),"")
id=replace(request(ChrW(105)&ChrW(100)),ChrW(39),"")
call sqlIn(ChrW(124)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(107)&ChrW(124)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(105)&ChrW(100)) 

function loadWebConfig()
dim a

rsWeb.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(32)&ChrW(49)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(44)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99) ,conn,1,1
if not rsWeb.eof then
languageList=rsWeb(ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))
a=split(languageList&ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124),ChrW(124))
defaultLanguage=a(1)
if language="" then      
language=defaultLanguage
end if
if language=ChrW(101)&ChrW(110) then
webtitle=rsWeb(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
webkeywords=rsWeb(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
webdescription=rsWeb(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
webfoot=rsWeb(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))
webaddress=rsWeb(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))
webcompany=rsWeb(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))
else
webtitle=rsWeb(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
webkeywords=rsWeb(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
webdescription=rsWeb(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
webfoot=rsWeb(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))
webaddress=rsWeb(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115))
webcompany=rsWeb(ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))
end if
webcopyright=rsWeb(ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))
weblogo=rsWeb(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))
webbiglogo=rsWeb(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111))
webqrcode=rsWeb(ChrW(113)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))
webqq=rsWeb(ChrW(113)&ChrW(113))
webphone=rsWeb(ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101))
webtel=rsWeb(ChrW(116)&ChrW(101)&ChrW(108))
webfax=rsWeb(ChrW(102)&ChrW(97)&ChrW(120))
webweixin=rsWeb(ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110))
webemail=rsWeb(ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108))
weburl=rsWeb(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108))
asporhtml=IIF(rsWeb(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))=0,false,true)

if language=ChrW(102)&ChrW(116) then
webtitle=jtToft(webtitle)
webkeywords=jtToft(webkeywords)
webdescription=jtToft(webdescription)
webfoot=jtToft(webfoot)
webaddress=jtToft(webaddress)
webcompany=jtToft(webcompany)
webcopyright=jtToft(webcopyright)
end if
end if
end function
call loadWebConfig()
if request(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))=ChrW(49) then asporhtml=true

function getWebFoot(a)
if instr(webfoot,ChrW(22320)&ChrW(22336)&ChrW(65306)&ChrW(26576)&ChrW(26576)&ChrW(24066)&ChrW(26576)&ChrW(26576)&ChrW(21306)&ChrW(26576)&ChrW(26576)&ChrW(36335))>0 and onAutoAddDataToAccess=true then
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(87)&ChrW(101)&ChrW(98)&ChrW(83)&ChrW(105)&ChrW(116)&ChrW(101) ,conn,1,3
if not b.eof then
b(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116))=a
b.update:b.close
getWebFoot=a
end if
else
getWebFoot=webfoot
end if  
end function

function getWebQrcode(a)
if webqrcode="" and onAutoAddDataToAccess=true then
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(113)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101) ,conn,1,3
if not b.eof then
b(ChrW(113)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))=a
b.update:b.close
getWebQrcode=a
end if
else
getWebQrcode=webqrcode
end if  
end function
thisUrlFileName=lcase(request.serverVariables(ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(95)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
if instr(thisUrlFileName,ChrW(47))>0 then
thisUrlFileName=mid(thisUrlFileName,instrrev(thisUrlFileName,ChrW(47))+1)
end if
if request(ChrW(110)&ChrW(97)&ChrW(118)) <>"" then
pageUrl=getNavNameToUrl("",request(ChrW(110)&ChrW(97)&ChrW(118)))  


if pageUrl <>"" then
if sKeyword <>"" then
if asporhtml=true then
asporhtml=false
pageUrl=getNavNameToUrl("",request(ChrW(110)&ChrW(97)&ChrW(118)))
end if
pageUrl=pageUrl & ChrW(38)&ChrW(107)&ChrW(61) & sKeyword
end if

response.redirect( pageUrl)
end if

elseif right(thisUrlFileName,10)=ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112) then
pageType=ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)
webFileName=phptrim(replace(request(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),ChrW(39),""))
if webFileName <>"" then
websql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& webFileName &ChrW(39)
else
websql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & id
end if

pageUrl=getArticleUrl(id)
rs.open websql,conn,1,3
if not rs.eof then
rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115))=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115))+1
rs.update
parentid=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
title=uTitle & rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
aboutcontent=rs(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
createtime=rs(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
smallimage=rs(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
bigimage=rs(ChrW(98)&ChrW(105)&ChrW(103)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
author=rs(ChrW(97)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(114))
views=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115))
fabulous=rs(ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115))
tags=rs(ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115))
id=rs(ChrW(105)&ChrW(100))
if language=ChrW(101)&ChrW(110) then 
aboutcontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
title=uTitle & rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
if rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) <>"" then webtitle=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
if rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) <>"" then webtitle=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
if rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)) <>"" then webkeywords=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
if rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)) <>"" then webdescription=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
else
if rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) <>"" then webtitle=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
if rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) <>"" then webtitle=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
if rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)) <>"" then webkeywords=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
if rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)) <>"" then webdescription=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
end if
if language=ChrW(102)&ChrW(116) then
title=jtToft(title)
aboutcontent=jtToft(aboutcontent)
bodycontent=jtToft(bodycontent)
webtitle=jtToft(webtitle)
webkeywords=jtToft(webkeywords)
webdescription=jtToft(webdescription)
end if
rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(87)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) ,conn,1,1
if not rsx.eof then
navid=rsx(ChrW(105)&ChrW(100))
nav=getRootNavName(rsx(ChrW(105)&ChrW(100)))
ennav=getRootNavEnName(rsx(ChrW(105)&ChrW(100)))
columnname=rsx(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
columnenname=rsx(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
columntype=rsx(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
webfilename=rsx(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
if language=ChrW(101)&ChrW(110) then 
columnname=rsx(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
end if
if language=ChrW(102)&ChrW(116) then
columnname=jtToft(columnname)
end if
end if:rsx.close

rsx.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(32)& getAccessDatediff(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))&ChrW(61)&ChrW(48)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100)) ,conn,1,3
if rsx.eof then
rsx.addnew
rsx(ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100))=rs(ChrW(105)&ChrW(100))
rsx(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)
rsx(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))=1
rsx(ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=date()  
rsx(ChrW(105)&ChrW(112))=getip()
rsx.update
rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115))=1
rs.update
views=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115))
else
rsx(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=now()
rsx(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))=rsx(ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116))+1
rsx.update
rss.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(61) & rs(ChrW(105)&ChrW(100)) ,conn,1,1
rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115))=rss.recordcount
rss.close
rs.update
views=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115))

end if:rsx.close
end if:rs.close  
elseif id <>"" then
pageType=ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & id ,conn,1,1
if not rs.eof then
parentid=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
navid=rs(ChrW(105)&ChrW(100))
nav=getRootNavName(rs(ChrW(105)&ChrW(100)))
ennav=getRootNavEnName(rs(ChrW(105)&ChrW(100)))
columnname=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
columnenname=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
columntype=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
webfilename=rs(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
aboutcontent=rs(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
if language=ChrW(101)&ChrW(110) then
columnname=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
aboutcontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
if rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) <>"" then webtitle=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
if rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) <>"" then webtitle=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
if rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)) <>"" then webkeywords=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
if rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)) <>"" then webdescription=rs(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
else
if rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) <>"" then webtitle=rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
if rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) <>"" then webtitle=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
if rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)) <>"" then webkeywords=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115))
if rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)) <>"" then webdescription=rs(ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
end if
if language=ChrW(102)&ChrW(116) then
nav=jtToft(nav)
columnname=jtToft(columnname)
title=jtToft(title)
aboutcontent=jtToft(aboutcontent)
bodycontent=jtToft(bodycontent)
webtitle=jtToft(webtitle)
webkeywords=jtToft(webkeywords)
webdescription=jtToft(webdescription)
end if
else

Response.Clear()
Response.Status = ChrW(52)&ChrW(48)&ChrW(52)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(70)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)
Response.End()
end if:rs.close
end if

if navid <>"" then
bannerimage=getNavBannerImage(navid)
if bannerimage="" then bannerimage=ChrW(47)&ChrW(85)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(47)&ChrW(97)&ChrW(100)&ChrW(46)&ChrW(106)&ChrW(112)&ChrW(103)
end if

if columntype <>"" and pageUrl="" then
pageUrl=getNavUrl(navid,columntype)
end if

function getNavBannerImage(a)
if a="" then getNavBannerImage="": exit function
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not b.eof then
if b(ChrW(98)&ChrW(97)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)) <>"" then
getNavBannerImage=b(ChrW(98)&ChrW(97)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))
exit function
elseif b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
getNavBannerImage=getNavBannerImage(b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
end if
end if:b.close
end function

function isFocusNav(a) 
if a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101) and nav="" then
isFocusNav=true
elseif language=ChrW(101)&ChrW(110) and nav=a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))  then
isFocusNav=true
elseif language=ChrW(102)&ChrW(116) and nav=jtToft(a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))  then 
isFocusNav=true
elseif language=ChrW(99)&ChrW(110) and nav=a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))  then 
isFocusNav=true
end if 
end function

function navLocation(a,b)
dim c,d:c=-1
if a="" then navLocation="": exit function
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & a ,conn,1,1
if not rs.eof then
c=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
if language=ChrW(101)&ChrW(110) then
d=uTitle&rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
else
d=uTitle&rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
end if
if language=ChrW(102)&ChrW(116) then
d=jtToft(d)
end if

if b <>"" or pageType=ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) then d=ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)& getNavUrl(rs(ChrW(105)&ChrW(100)),rs(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))) &ChrW(39)&ChrW(62)& d &ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)
b=d & ChrW(32)&ChrW(62)&ChrW(32) & b
end if:rs.close
if c <>-1 then
call navLocation(c,b)
else
if language=ChrW(101)&ChrW(110) then
b=ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(46)&ChrW(47)&ChrW(39)&ChrW(62)&ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)&ChrW(62)&ChrW(32)+b
elseif language=ChrW(102)&ChrW(116) then
b=ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(46)&ChrW(47)&ChrW(39)&ChrW(62)&ChrW(39318)&ChrW(38913)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)&ChrW(62)&ChrW(32)+b
else
b=ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(46)&ChrW(47)&ChrW(39)&ChrW(62)&ChrW(39318)&ChrW(39029)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32)&ChrW(62)&ChrW(32)+b
end if
end if
navLocation=b
end function

function getNavUrl(a,b)


dim c,d
d=a
if a <>"" then
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not e.eof then
d=a
if e(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) <>"" then
getNavUrl=urlWanZhen(e(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
exit function
elseif e(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)) <>"" then
getNavUrl=urlWanZhen(e(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)))
exit function
end if 
b=e(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
end if:e.close
end if
if b=ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101) then
c=urlAddDiQu(WEB_VIEWURL)
elseif b=ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116) then
if asporhtml=true then
c=urlAddDiQu(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95) & d &  ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
else
c=urlAddDiQu(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(105)&ChrW(100)&ChrW(61)&d)
end if
elseif asporhtml=true then
c=urlAddDiQu(b & ChrW(95) & d &  ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))
else
c=urlAddDiQu(b & ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(105)&ChrW(100)&ChrW(61)&d)
end if
getNavUrl=urlWanZhen(c)
end function

function getNavGoToUrl(a,b)
dim c
if a <>"" then
dim d:Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
d.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not d.eof then      
b=d(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
end if:d.close
end if
if b=ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101) then
c=urlWanZhen(ChrW(46)&ChrW(47))
elseif b=ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116) then
c=urlWanZhen(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(105)&ChrW(100)&ChrW(61)&a)
else
c=urlWanZhen(b & ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(105)&ChrW(100)&ChrW(61)&a)
end if
getNavGoToUrl=c
end function

function urlWanZhen(a) 
dim b,c 
if pubWebSite <>"" then
b=getUrl()
c=instr(b,ChrW(58)&ChrW(47)&ChrW(47))
if c>0 then
b=mid(b,c+3)
c=instr(b,ChrW(47))
if c>0 then
b=mid(b,c+1)
end if
b=pubWebSite & b
a=fullHttpUrl(b,a)

a=replace(a,ChrW(47)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63),ChrW(47)&ChrW(63))
end if
end if

if defaultLanguage=language or asporhtml=true then
a=getUrlAddToParam(a,ChrW(63)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61),ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101))   
else
a=getUrlAddToParam(a,ChrW(63)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61)&language,ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))   
end if  
urlWanZhen=a   
end function

function getArticleUrl(a) 
dim b,c,d
if a="" then getArticleUrl="": exit function

dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not e.eof then
if e(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) <>"" then
getArticleUrl=urlWanZhen(e(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) )
exit function 
end if
c=e(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
end if:e.close

if c <>"" then
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&c,conn,1,1
if not e.eof then      
if e(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) <>"" then
b=e(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(47)
end if

if instr(ChrW(44)& detailPagingTypeList &ChrW(44), ChrW(44)& e(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)) &ChrW(44))>0 then
d=e(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)) & ChrW(95)
end if
end if:e.close
end if 

if asporhtml=false then
getArticleUrl=urlWanZhen( urlAddDiQu(d & ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(105)&ChrW(100)&ChrW(61)&a) )
exit function
end if

getArticleUrl=urlWanZhen( urlAddDiQu(b & d & ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(95)& a &ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)) )
end function

function getNavNameToUrl(a,b)
getNavNameToUrl=getNavUrl(getNavNameToID(a,b),"")
end function

function getNavNameToID(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim d,e,f,g,h

e=b
if instr(b,ChrW(62))>0 then
e=mid(b,1,instr(b,ChrW(62))-1)
b=mid(b,instr(b,ChrW(62))+1)
else
e=b
b=""
end if
if a <>"" then h=ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)& a &""
d=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& e &ChrW(39)&h

c.open d ,conn,1,1
if not c.eof then 
f=c(ChrW(105)&ChrW(100)) 
end if:c.close

if b <>"" and f <>"" then
g=getNavNameToID(f,b)
else
g=f
end if
getNavNameToID=g
end function

function getColumAllID(a)
if a="" then getColumAllID="": exit function
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
while not b.eof 
if c <>"" then c=c & ChrW(44)
c=c & b(ChrW(105)&ChrW(100))
d=getColumAllID(b(ChrW(105)&ChrW(100)))
if d <>"" then
c=c & ChrW(44) & d
end if
b.movenext:wend:b.close
getColumAllID=c
end function

function getNameToAllId(a)
dim b,c
c=a
b=getNavNameToID("",c)
if b <>"" then
idList=getColumAllID(b)
if idList <>"" then
getNameToAllId=b & ChrW(44) & idList
else
getNameToAllId=b
end if
else
getNameToAllId=ChrW(45)&ChrW(50)
end if
end function

function getRootNavName(a)
if a="" then getRootNavName="": exit function
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
while not b.eof
if b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=-1 then
if language=ChrW(101)&ChrW(110) then
getRootNavName=b(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
else
getRootNavName=b(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
end if
exit function
else
getRootNavName=getRootNavName(b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
end if
b.movenext:wend:b.close
if language=ChrW(102)&ChrW(116) then  
getRootNavName=jtToft(getRootNavName)
end if
end function

function getnavabout(a)
if a="" then getnavabout="": exit function
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
while not b.eof
if b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=-1 then
getnavabout=b(ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
exit function
else
getnavabout=getnavabout(b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
end if
b.movenext:wend:b.close
if language=ChrW(102)&ChrW(116) then  
getnavabout=jtToft(getnavabout)
end if
end function

function getRootNavEnName(a)
if a="" then getRootNavEnName="": exit function
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
while not b.eof
if b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=-1 then
getRootNavEnName=b(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
exit function
else
getRootNavEnName=getRootNavEnName(b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
end if
b.movenext:wend:b.close
end function

function getRootNavId(a)
if a="" then getRootNavId="": exit function
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
while not b.eof
if b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=-1 then
getRootNavId=b(ChrW(105)&ChrW(100))
exit function
else
getRootNavId=getRootNavId(b(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
end if
b.movenext:wend:b.close
end function

function getColumBody(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& a &ChrW(39),conn,1,1
if not c.eof then
getColumBody=cutStr(c(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)),b,ChrW(46)&ChrW(46)&ChrW(46))
end if:c.close
if language=ChrW(102)&ChrW(116) then  
getColumBody=jtToft(getColumBody)
end if
end function

function getColumnId(a)
dim b
b=-1
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& a &ChrW(39),conn,1,1
if not c.eof then
b=c(ChrW(105)&ChrW(100))
end if:c.close
getColumnId=b
end function

function getOnePageBody(a,b)   
getOnePageBody=getOnePageBodyPlus(a,b,"")  
end function

function getOnePageBodyPlus(a,b,c)  
dim d:Set d = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))   
d.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(111)&ChrW(110)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& a &ChrW(39),conn,1,3
if not d.eof then
b=d(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))  
c=d(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)) 
else
if b <>"" or c <>"" and onAutoAddDataToAccess=true then
d.addnew
d(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=a
d(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=b
d(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=c
d.update

end if
end if:d.close
if language=ChrW(101)&ChrW(110) then
getOnePageBodyPlus=c
elseif language=ChrW(102)&ChrW(116) then  
getOnePageBodyPlus=jtToft(b) 
else
getOnePageBodyPlus=b
end if
end function

function getOnePageImage(a)  
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c 
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(111)&ChrW(110)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& a &ChrW(39),conn,1,2
if not b.eof then
c=b(ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101))   
end if:b.close
getOnePageImage=c
end function 

function getUpDownPageUrl(a,b)
if asporhtml=true and request(ChrW(107))="" then
if instr(a,ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108))>0 then
if b>1 then
getUpDownPageUrl=left(a,len(a)-5) & ChrW(95) & b & ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108) 
else
getUpDownPageUrl=a
end if
else
getUpDownPageUrl=b & ChrW(46)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)
end if
else
getUpDownPageUrl=a & IIF(instr(a,ChrW(63))=false,ChrW(63),ChrW(38))  & ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61)&b &IIF(sKeyword <>"",ChrW(38)&ChrW(107)&ChrW(61)&sKeyword,"")
end if
getUpDownPageUrl=urlWanZhen(getUpDownPageUrl)
end function

function displayOnLineEdit(a)
if a=true then
if request(ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)) <>"" then
call rw(ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(39)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(47)&ChrW(106)&ChrW(115)&ChrW(47)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(47)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62))
end if
end if
end function

function getStyle(a)
dim b,c
b=gethttpurl(a,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
c=instr(b,ChrW(60)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62))
if c>0 then
b=mid(b,c+6)
end if
c=instrRev(b,ChrW(60)&ChrW(47)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(62))
if c>0 then
b=mid(b,1,c-1)
end if
call rw(b)
end function

function getRootColumnCnName(byval a) 
dim b,c
for b =1 to 9
rs1.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(87)&ChrW(101)&ChrW(98)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)& a &"",conn,1,1
if not rs1.eof then
c=cstr(rs1(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
if c <>ChrW(45)&ChrW(49) then
a=rs1(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
else
getRootColumnCnName=rs1(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
rs1.close
exit for    
end if
else
exit for
end if:rs1.close
next
end function

if uTitle <>"" then
webTitle=uTitle & replace(replace(webTitle,ChrW(44), ChrW(44)&uTitle),ChrW(65292), ChrW(65292)&uTitle)                
webkeywords=uTitle & replace(replace(webkeywords,ChrW(44),  ChrW(44) & uTitle),ChrW(65292), ChrW(65292) &uTitle)
webdescription=uTitle & replace(replace(webdescription,ChrW(44),  ChrW(44) & uTitle),ChrW(65292), ChrW(65292) &uTitle)
end if

function getXiyuetaColumnIdToName(a) 
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
a=a &""
if a="" then getXiyuetaColumnIdToName="": exit function

b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not b.eof then
getXiyuetaColumnIdToName=b(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
else
getXiyuetaColumnIdToName=""
end if:b.close
end function

function get_WebColumName(a)
if language=ChrW(101)&ChrW(110) then
get_WebColumName=a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
elseif language=ChrW(102)&ChrW(116) then
get_WebColumName=jtToft(a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))
else
get_WebColumName=a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
end if
end function  

function get_articleTitle(a)
if language=ChrW(101)&ChrW(110) then
get_articleTitle=a(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
elseif language=ChrW(102)&ChrW(116) then
get_articleTitle=jtToft(a(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
else
get_articleTitle=a(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
end if
end function  

function get_LinksTitle(a)  
if language=ChrW(102)&ChrW(116) then
get_LinksTitle=jtToft(a(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
else
get_LinksTitle=a(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
end if
end function

function get_sheshiColumName(a)



if language=ChrW(102)&ChrW(116) then
get_sheshiColumName=jtToft(a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))
else
get_sheshiColumName=a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
end if
end function  

function get_columnNameBJ(a,b)
if language=ChrW(101)&ChrW(110) then
get_columnNameBJ=IIF(a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=columnname,b,"")
else
get_columnNameBJ=IIF(a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=columnname,b,"")
end if
end function  

function get_webcompany()  
if language=ChrW(101)&ChrW(110) then
get_webcompany=rsWeb(ChrW(101)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))
else
get_webcompany=rsWeb(ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121))
end if
end function
%>