<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)
winTitle = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)
excludeAdminIDLIst=ChrW(45)&ChrW(57)&ChrW(57)&ChrW(57)
dim msg,isTrue,sql,addSql,id,title,tsfield_layoutcaiaction,isthrough,isaspnote,isdebugcode,isruntime,loginurl,loginsuccess,cailoginurlfun,userfieldname,passfieldname,httpurl,httpurlsuccess,caiurlfun,username,setchar,password,poststr,ndjs,sortrank,caiaction,contenttype,djsurlparame,locltxtfile1,locltxtfile2,locltxtfile3,caisavelocalfilename,saveerrinfofilename,bodycontent,savecratefilepath,gotofilepathtest,postsavetoserver,stablename
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
title=handleAspStrSafe(title)
isthrough=request(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isthrough=IIF(isthrough=ChrW(111)&ChrW(110),1,0) 
isaspnote=request(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))
isaspnote=IIF(isaspnote=ChrW(111)&ChrW(110),1,0) 
isaspnote=handleAspStrSafe(isaspnote)
isdebugcode=request(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))
isdebugcode=IIF(isdebugcode=ChrW(111)&ChrW(110),1,0) 
isdebugcode=handleAspStrSafe(isdebugcode)
isruntime=request(ChrW(105)&ChrW(115)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
isruntime=IIF(isruntime=ChrW(111)&ChrW(110),1,0) 
isruntime=handleAspStrSafe(isruntime)
loginurl=request(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(114)&ChrW(108))
loginurl=handleAspStrSafe(loginurl)
loginsuccess=request(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115))
loginsuccess=handleAspStrSafe(loginsuccess)
cailoginurlfun=getStrToNumber(request(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(117)&ChrW(110)))
if cailoginurlfun="" then cailoginurlfun=null
cailoginurlfun=handleAspStrSafe(cailoginurlfun)
userfieldname=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
userfieldname=handleAspStrSafe(userfieldname)
passfieldname=request(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
passfieldname=handleAspStrSafe(passfieldname)
httpurl=request(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))
httpurl=handleAspStrSafe(httpurl)
httpurlsuccess=request(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115))
httpurlsuccess=handleAspStrSafe(httpurlsuccess)
caiurlfun=getStrToNumber(request(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(117)&ChrW(110)))
if caiurlfun="" then caiurlfun=null
caiurlfun=handleAspStrSafe(caiurlfun)
username=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
username=handleAspStrSafe(username)
setchar=request(ChrW(115)&ChrW(101)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114))
setchar=handleAspStrSafe(setchar)
password=request(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100))
password=handleAspStrSafe(password)
poststr=request(ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(116)&ChrW(114))
poststr=handleAspStrSafe(poststr)
ndjs=getStrToNumber(request(ChrW(110)&ChrW(100)&ChrW(106)&ChrW(115)))
if ndjs="" then ndjs=null
ndjs=handleAspStrSafe(ndjs)
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
caiaction=request(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
caiaction=handleAspStrSafe(caiaction)
contenttype=request(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
contenttype=handleAspStrSafe(contenttype)
djsurlparame=request(ChrW(100)&ChrW(106)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101))
djsurlparame=handleAspStrSafe(djsurlparame)
locltxtfile1=request(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(49))
locltxtfile1=handleAspStrSafe(locltxtfile1)
locltxtfile2=request(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(50))
locltxtfile2=handleAspStrSafe(locltxtfile2)
locltxtfile3=request(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(51))
locltxtfile3=handleAspStrSafe(locltxtfile3)
caisavelocalfilename=request(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
caisavelocalfilename=handleAspStrSafe(caisavelocalfilename)
saveerrinfofilename=request(ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(101)&ChrW(114)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
saveerrinfofilename=handleAspStrSafe(saveerrinfofilename)
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=handleAspStrSafe(bodycontent)
savecratefilepath=request(ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(99)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104))
savecratefilepath=handleAspStrSafe(savecratefilepath)
gotofilepathtest=request(ChrW(103)&ChrW(111)&ChrW(116)&ChrW(111)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116))
gotofilepathtest=handleAspStrSafe(gotofilepathtest)
postsavetoserver=request(ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(116)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114))
postsavetoserver=handleAspStrSafe(postsavetoserver)
stablename=request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
if id <>"" then
call showCheckAdminRule(ChrW(26597)&ChrW(30475) & winTitle) 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
id=rs(ChrW(105)&ChrW(100))
title=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
tsfield_layoutcaiaction=getFindIdToTableCount(rs(ChrW(105)&ChrW(100)),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(105)&ChrW(100),ChrW(40)&ChrW(20849)&ChrW(42)&ChrW(26465)&ChrW(41),ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isaspnote=rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))
isdebugcode=rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))
isruntime=rs(ChrW(105)&ChrW(115)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
loginurl=rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(114)&ChrW(108))
loginsuccess=rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115))
cailoginurlfun=rs(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(117)&ChrW(110))
userfieldname=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
passfieldname=rs(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
httpurl=rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))
httpurlsuccess=rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115))
caiurlfun=rs(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(117)&ChrW(110))
username=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
setchar=rs(ChrW(115)&ChrW(101)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114))
password=rs(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100))
poststr=rs(ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(116)&ChrW(114))
ndjs=rs(ChrW(110)&ChrW(100)&ChrW(106)&ChrW(115))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
caiaction=rs(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
contenttype=rs(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
djsurlparame=rs(ChrW(100)&ChrW(106)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101))
locltxtfile1=rs(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(49))
locltxtfile2=rs(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(50))
locltxtfile3=rs(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(51))
caisavelocalfilename=rs(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
saveerrinfofilename=rs(ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(101)&ChrW(114)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
savecratefilepath=rs(ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(99)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104))
gotofilepathtest=rs(ChrW(103)&ChrW(111)&ChrW(116)&ChrW(111)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116))
postsavetoserver=rs(ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(116)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114))
stablename=rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
end if
else
isthrough=1
isaspnote=1
isdebugcode=1
isruntime=1
ndjs=30
sortrank=10
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
if not rs.eof then
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))+sortrank
end if:rs.close
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if

function thisAddPrefix(a)  
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
thisAddPrefix=ChrW(96)&db_PREFIX&a&ChrW(96)
else
thisAddPrefix=ChrW(91)&db_PREFIX&a&ChrW(93)
end if
end function

function showCheckboxDataTitle(a,b)
dim c,d,e,f
c=split(a,ChrW(45))
for each e in c
if instr(e,ChrW(95))>0 then
d=split(e,ChrW(95))
if instr(ChrW(124)&b&ChrW(124),ChrW(124)&d(1)&ChrW(124))>0 then
if f <>"" then f=f&ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(32)
f=f & d(0)
end if
end if
next
showCheckboxDataTitle=f
end function
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=winTitle%>添加修改</title> 
<link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
<script type="text/javascript" src="../../js/jquery.js"></script>
<link href="../../css/nprogress.min.css" rel="stylesheet"/>  
<script src="../../js/nprogress.min.js"></script>
<style>.layui-input-inline,.layui-input-block{line-height:40px;color:#999;}</style></head>
<body>   
<%if msg <>"" then  call rw(ChrW(60)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62)& msg &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(62))%>
<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 0px 0 0 0;">
<div class="layui-tab" lay-filter="test-hash">
<%%>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=title%>
</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>采集动作：</label>
<div class='layui-input-block layui-input-wrap'>
<%=tsfield_layoutcaiaction%>
</div><!--tsfield_layoutcaiaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isthrough=0,ChrW(21542),ChrW(26159))%>
</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>写ASP注释：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isaspnote=0,ChrW(21542),ChrW(26159))%>
</div><!--isaspnote-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>写调试代码：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isdebugcode=0,ChrW(21542),ChrW(26159))%>
</div><!--isdebugcode-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>运行时间：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isruntime=0,ChrW(21542),ChrW(26159))%>
</div><!--isruntime-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>登录网址：</label>
<div class='layui-input-block layui-input-wrap'>
<%=loginurl%>
</div><!--loginurl-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>登录成功判断：</label>
<div class='layui-input-block layui-input-wrap'>
<%=loginsuccess%>
</div><!--loginsuccess-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>登录采集函数：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(95)&ChrW(48)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(95)&ChrW(50)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(95)&ChrW(51),cailoginurlfun)%>
</div><!--cailoginurlfun-->
</div>
</div>
</div>    
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>账号字段名：</label>
<div class='layui-input-block layui-input-wrap'>
<%=userfieldname%>
</div><!--userfieldname-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>密码字段名：</label>
<div class='layui-input-block layui-input-wrap'>
<%=passfieldname%>
</div><!--passfieldname-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>网址：</label>
<div class='layui-input-block layui-input-wrap'>
<%=httpurl%>
</div><!--httpurl-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>网址成功判断：</label>
<div class='layui-input-block layui-input-wrap'>
<%=httpurlsuccess%>
</div><!--httpurlsuccess-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>采集函数：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(95)&ChrW(48)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(95)&ChrW(50)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(95)&ChrW(51),caiurlfun)%>
</div><!--caiurlfun-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>账号：</label>
<div class='layui-input-block layui-input-wrap'>
<%=username%>
</div><!--username-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编码：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(115)&ChrW(101)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(45)&ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)&ChrW(45)&ChrW(117)&ChrW(116)&ChrW(102)&ChrW(92)&ChrW(45)&ChrW(56),setchar)%>
</div><!--setchar-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>密码：</label>
<div class='layui-input-block layui-input-wrap'>
<%=password%>
</div><!--password-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>post参数集：</label>
<div class='layui-input-block layui-input-wrap'>
<%=poststr%>
</div><!--poststr-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>倒计时：</label>
<div class='layui-input-block layui-input-wrap'>
<%=ndjs%>
</div><!--ndjs-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序：</label>
<div class='layui-input-block layui-input-wrap'>
<%=sortrank%>
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>采集动作：</label>
<div class='layui-input-block layui-input-wrap'>
<%=showCheckboxDataTitle(ChrW(108)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(45)&ChrW(33258)&ChrW(23450)&ChrW(20041)&ChrW(95)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101),caiaction)%>                    </div><!--caiaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>内容类型：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(45)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116),contenttype)%>
</div><!--contenttype-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>网址参数：</label>
<div class='layui-input-block layui-input-wrap'>
<%=djsurlparame%>
</div><!--djsurlparame-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>本地文件1：</label>
<div class='layui-input-block layui-input-wrap'>
<a href="<%=locltxtfile1%>" target="_blank" title="点击查看"><%=IIF(locltxtfile1 <>"",locltxtfile1,"")%></a>
</div><!--locltxtfile1-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>本地文件2：</label>
<div class='layui-input-block layui-input-wrap'>
<a href="<%=locltxtfile2%>" target="_blank" title="点击查看"><%=IIF(locltxtfile2 <>"",locltxtfile2,"")%></a>
</div><!--locltxtfile2-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>本地文件3：</label>
<div class='layui-input-block layui-input-wrap'>
<a href="<%=locltxtfile3%>" target="_blank" title="点击查看"><%=IIF(locltxtfile3 <>"",locltxtfile3,"")%></a>
</div><!--locltxtfile3-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>保存到本地：</label>
<div class='layui-input-block layui-input-wrap'>
<%=caisavelocalfilename%>
</div><!--caisavelocalfilename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>保存错误文件：</label>
<div class='layui-input-block layui-input-wrap'>
<%=saveerrinfofilename%>
</div><!--saveerrinfofilename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>备注：</label>
<div class='layui-input-block layui-input-wrap'>
<%=bodycontent%>
</div><!--bodycontent-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>保存生成文件：</label>
<div class='layui-input-block layui-input-wrap'>
<%=savecratefilepath%>
</div><!--savecratefilepath-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>跳转测试文件：</label>
<div class='layui-input-block layui-input-wrap'>
<%=gotofilepathtest%>
</div><!--gotofilepathtest-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>保存到服务器：</label>
<div class='layui-input-block layui-input-wrap'>
<%=postsavetoserver%>
</div><!--postsavetoserver-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表名称：</label>
<div class='layui-input-block layui-input-wrap'>
<%=stablename%>
</div><!--tablename-->
</div>
</div>
</div>
</div>
</div>
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../../js/pc.js?v20250716_1"></script>
<!-- 编辑页加载更多js文件 -->
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce','colorpicker','rate','transfer'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate,
colorpicker = layui.colorpicker;
var a = (layui.laytpl, layui.setter, layui.view, layui.admin);
//查看图片
a.events.avartatPreview = function(t) { 
var i = $(this).parent().find("input").val();
layui.layer.photos({ photos: { title: "查看图片", data: [{ src: i }] }, shade: .01, closeBtn: 1, anim: 5 })
} 
//{编辑页上传图片JS块}
//{编辑器JS代码}
//{编辑页颜色选择器JS块}
//{编辑页时间选择器JS块} 
//{编辑页字段左边图标注释JS块}
})
// pasteImage("pic");
// 粘贴上传图片
// 配置 nprogress 的基本选项（可选）  
NProgress.configure({ showSpinner: true }); // 显示/隐藏加载时的旋转器  
// 监听页面加载事件  
document.addEventListener('DOMContentLoaded', startProgress); // DOM 结构加载完成（不含样式、图片、子框架）  
window.addEventListener('load', stopProgress); // 页面所有资源加载完成（含样式、图片、子框架）  
function startProgress() {  
NProgress.start(); // 开始显示进度条  
}  
function stopProgress() {  
NProgress.done(); // 完成进度条  
}  
</script>
<!-- 标签显示代码块 --> 
</body>
</html>
