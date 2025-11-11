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
caiaction=ChrW(124)
caiaction=caiaction & IIF(Request(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(109))=ChrW(111)&ChrW(110),ChrW(108)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(124),"") 
caiaction=caiaction & IIF(Request(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101))=ChrW(111)&ChrW(110),ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(124),"") 
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

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& title &ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName) & addsql

rs.open sql,conn,1,3
if not rs.eof then
msg=ChrW(32593)&ChrW(22336)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)&ChrW(12290)
else
if id="" then
rs.addnew
else
rs.close  
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=title
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))=isaspnote
rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))=isdebugcode
rs(ChrW(105)&ChrW(115)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=isruntime
rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(114)&ChrW(108))=loginurl
rs(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115))=loginsuccess
rs(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(117)&ChrW(110))=cailoginurlfun
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=userfieldname
rs(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=passfieldname
rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108))=httpurl
rs(ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115))=httpurlsuccess
rs(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(117)&ChrW(110))=caiurlfun
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=username
rs(ChrW(115)&ChrW(101)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114))=setchar
rs(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100))=password
rs(ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(116)&ChrW(114))=poststr
rs(ChrW(110)&ChrW(100)&ChrW(106)&ChrW(115))=ndjs
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=caiaction
rs(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=contenttype
rs(ChrW(100)&ChrW(106)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101))=djsurlparame
rs(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(49))=locltxtfile1
rs(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(50))=locltxtfile2
rs(ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(51))=locltxtfile3
rs(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=caisavelocalfilename
rs(ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(101)&ChrW(114)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=saveerrinfofilename
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent
rs(ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(99)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104))=savecratefilepath
rs(ChrW(103)&ChrW(111)&ChrW(116)&ChrW(111)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116))=gotofilepathtest
rs(ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(116)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114))=postsavetoserver
rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=stablename

if checkEnLanguage() then
end if
rs.update 
if id <>"" then
call addSystemLog(tableName,ChrW(32534)&ChrW(36753)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41))
else
call addSystemLog(tableName,ChrW(28155)&ChrW(21152)&ChrW(25104)&ChrW(21151)&ChrW(65292)&ChrW(73)&ChrW(68)&ChrW(40)&id&ChrW(41))
end if
call die(ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(59)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62))
end if:rs.close 
end if

elseif id <>"" then
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
</head>
<body>   
<%if msg <>"" then  call rw(ChrW(60)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(45)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62)& msg &ChrW(32)&ChrW(38)&ChrW(110)&ChrW(98)&ChrW(115)&ChrW(112)&ChrW(59)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(58)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(46)&ChrW(103)&ChrW(111)&ChrW(40)&ChrW(45)&ChrW(49)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(39)&ChrW(62)&ChrW(36820)&ChrW(22238)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(113)&ChrW(117)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(62))%>
<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 0px 0 0 0;">
<div class="layui-tab" lay-filter="test-hash">
<%%>
<div class="layui-tab-content">
<div class="layui-tab-item layui-show">
<div class='layui-form-item'>
<label class='layui-form-label'>标题</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='title' placeholder='请输入标题' autocomplete='off' class='layui-input' value="<%=inputCL(title)%>"  lay-verify='required'>
</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>采集动作：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=tsfield_layoutcaiaction%>
</div><!--tsfield_layoutcaiaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>审核</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isthrough" lay-skin="switch" lay-text="是|否" <%=IIF(isthrough=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isthrough-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>写ASP注释</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isaspnote" lay-skin="switch" lay-text="是|否" <%=IIF(isaspnote=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">只有采集页开启后，动作里开启才有作用</div><!--isaspnote-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>写调试代码</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isdebugcode" lay-skin="switch" lay-text="是|否" <%=IIF(isdebugcode=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">只有采集页开启后，动作里开启才有作用</div><!--isdebugcode-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>运行时间</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isruntime" lay-skin="switch" lay-text="是|否" <%=IIF(isruntime=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">采集页开起运行时间则动作里开启才有效</div><!--isruntime-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>登录网址</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='loginurl' placeholder='请输入登录网址' autocomplete='off' class='layui-input' value="<%=inputCL(loginurl)%>" >
</div><!--loginurl-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>登录成功判断</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='loginsuccess' placeholder='请输入登录成功判断' autocomplete='off' class='layui-input' value="<%=inputCL(loginsuccess)%>" >
</div><!--loginsuccess-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>登录采集函数</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(95)&ChrW(48)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(95)&ChrW(50)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(95)&ChrW(51),cailoginurlfun)%>
</div><!--cailoginurlfun-->
</div>
</div>
</div>    
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>账号字段名</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='userfieldname' placeholder='请输入账号字段名' autocomplete='off' class='layui-input' value="<%=inputCL(userfieldname)%>" >
</div><!--userfieldname-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>密码字段名</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='passfieldname' placeholder='请输入密码字段名' autocomplete='off' class='layui-input' value="<%=inputCL(passfieldname)%>" >
</div><!--passfieldname-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>网址</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='httpurl' placeholder='请输入网址' autocomplete='off' class='layui-input' value="<%=inputCL(httpurl)%>" >
</div><!--httpurl-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>网址成功判断</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='httpurlsuccess' placeholder='请输入网址成功判断' autocomplete='off' class='layui-input' value="<%=inputCL(httpurlsuccess)%>" >
</div><!--httpurlsuccess-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>采集函数</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(99)&ChrW(97)&ChrW(105)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(95)&ChrW(48)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(95)&ChrW(50)&ChrW(45)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(87)&ChrW(105)&ChrW(110)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(95)&ChrW(51),caiurlfun)%>
</div><!--caiurlfun-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>账号</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='username' placeholder='请输入账号' autocomplete='off' class='layui-input' value="<%=inputCL(username)%>" >
</div><!--username-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>编码</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(115)&ChrW(101)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(45)&ChrW(103)&ChrW(98)&ChrW(50)&ChrW(51)&ChrW(49)&ChrW(50)&ChrW(45)&ChrW(117)&ChrW(116)&ChrW(102)&ChrW(92)&ChrW(45)&ChrW(56),setchar)%>
</div><!--setchar-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>密码</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='password' placeholder='请输入密码' autocomplete='off' class='layui-input' value="<%=inputCL(password)%>" >
</div><!--password-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>post参数集</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='poststr' placeholder='请输入post参数集' autocomplete='off' class='layui-input' value="<%=inputCL(poststr)%>" >
</div><!--poststr-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>倒计时</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='ndjs' placeholder='请输入倒计时' autocomplete='off' class='layui-input' value="<%=inputCL(ndjs)%>"  lay-verify='required'>
</div>
<div class="layui-form-mid layui-text-em">秒</div><!--ndjs-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='sortrank' placeholder='请输入排序' autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>" >
</div><!--sortrank-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>采集动作</label>
<div class='layui-input-inline layui-input-wrap'>
<div class="layui-form">
<input type="checkbox" name="caiaction_liveNowscoreCom" title="liveNowscoreCom"<%=IIF(instr(ChrW(124)&caiaction&ChrW(124),ChrW(124)&ChrW(108)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(109)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="checkbox" name="caiaction_customize" title="自定义"<%=IIF(instr(ChrW(124)&caiaction&ChrW(124),ChrW(124)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(124))>0,ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
</div>
</div><!--caiaction-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>内容类型</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(45)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116),contenttype)%>
</div><!--contenttype-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>网址参数</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='djsurlparame' placeholder='请输入网址参数' autocomplete='off' class='layui-input' value="<%=inputCL(djsurlparame)%>" >
</div>
<div class="layui-form-mid layui-text-em">如：nLine1,nLIne2</div><!--djsurlparame-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>本地文件1</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='locltxtfile1' placeholder='请输入本地文件1' autocomplete='off' class='layui-input' value="<%=inputCL(locltxtfile1)%>" >
</div><!--locltxtfile1-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-locltxtfile1"><i class="layui-icon">&#xe67c;</i>上传txt|json|xml文件1</button>
<input class="layui-upload-file" type="file" accept="" name="file">
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>本地文件2</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='locltxtfile2' placeholder='请输入本地文件2' autocomplete='off' class='layui-input' value="<%=inputCL(locltxtfile2)%>" >
</div><!--locltxtfile2-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-locltxtfile2"><i class="layui-icon">&#xe67c;</i>上传txt|json|xml文件2</button>
<input class="layui-upload-file" type="file" accept="" name="file">
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>本地文件3</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='locltxtfile3' placeholder='请输入本地文件3' autocomplete='off' class='layui-input' value="<%=inputCL(locltxtfile3)%>" >
</div><!--locltxtfile3-->
<button type="button" class="layui-btn layui-btn-primary" id="upload-locltxtfile3"><i class="layui-icon">&#xe67c;</i>上传txt|json|xml文件3</button>
<input class="layui-upload-file" type="file" accept="" name="file">
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>保存到本地</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='caisavelocalfilename' placeholder='请输入保存到本地' autocomplete='off' class='layui-input' value="<%=inputCL(caisavelocalfilename)%>" >
</div>
<div class="layui-form-mid layui-text-em">采集到内容保存到本地的文件</div><!--caisavelocalfilename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>保存错误文件</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='saveerrinfofilename' placeholder='请输入保存错误文件' autocomplete='off' class='layui-input' value="<%=inputCL(saveerrinfofilename)%>" >
</div>
<div class="layui-form-mid layui-text-em">写入数据库报错保存到的文件</div><!--saveerrinfofilename-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>备注</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='bodycontent'  placeholder='请输入备注' class='layui-textarea'><%=inputCL(bodycontent)%></textarea>
</div><!--bodycontent-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>保存生成文件</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='savecratefilepath' placeholder='请输入保存生成文件' autocomplete='off' class='layui-input' value="<%=inputCL(savecratefilepath)%>" >
</div>
<div class="layui-form-mid layui-text-em">保存到本地位置</div><!--savecratefilepath-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>跳转测试文件</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='gotofilepathtest' placeholder='请输入跳转测试文件' autocomplete='off' class='layui-input' value="<%=inputCL(gotofilepathtest)%>" >
</div>
<div class="layui-form-mid layui-text-em">跳转到生成的采集页</div><!--gotofilepathtest-->
</div>
</div>
</div>    
<div class='layui-form-item'>
<label class='layui-form-label'>保存到服务器</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='postsavetoserver' placeholder='请输入保存到服务器' autocomplete='off' class='layui-input' value="<%=inputCL(postsavetoserver)%>" >
</div><!--postsavetoserver-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>表名称</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='tablename' placeholder='请输入表名称' autocomplete='off' class='layui-input' value="<%=inputCL(stablename)%>" >
</div><!--tablename-->
</div>
</div>
<!-- 提交按钮需要，外部调用 -->
<div class="layui-form-item<%=IIF(request(ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116))=ChrW(49),"",ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101))%>">
<input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
</div>
</div>
</div>
</div>
</form>
<script src="../../layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="../../js/pc.js?v20250716_1"></script>
<script>
layui.config({
base: '../../layuiadmin/' //静态资源所在路径
}).extend({
index: 'lib/index' //主入口模块
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce','colorpicker','rate','transfer','croppers'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate,
colorpicker = layui.colorpicker; 
// 上传txt/json/xml文件 for locltxtfile1
upload.render({
elem: '#upload-locltxtfile1',
url: '/api/upload/?act=txtjsonxml',
accept: 'file',
exts: 'txt|json|xml',
done: function(res) {
if(res.code!=0){              
layer.msg(res.msg, {icon: 2}); 
}else{
layer.msg(res.msg, {icon: 1}); 
if(typeof(res.data[0])!="undefined"){
var imgSrc=res.data[0].src;
}else{
var imgSrc=res.data.src;
}
//$(this.item).prev("div").children("input").val(imgSrc)
$("input[name='locltxtfile1']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
}
});
// 上传txt/json/xml文件 for locltxtfile2
upload.render({
elem: '#upload-locltxtfile2',
url: '/api/upload/?act=txtjsonxml',
accept: 'file',
exts: 'txt|json|xml',
done: function(res) {
if(res.code!=0){              
layer.msg(res.msg, {icon: 2}); 
}else{
layer.msg(res.msg, {icon: 1}); 
if(typeof(res.data[0])!="undefined"){
var imgSrc=res.data[0].src;
}else{
var imgSrc=res.data.src;
}
//$(this.item).prev("div").children("input").val(imgSrc)
$("input[name='locltxtfile2']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
}
});
// 上传txt/json/xml文件 for locltxtfile3
upload.render({
elem: '#upload-locltxtfile3',
url: '/api/upload/?act=txtjsonxml',
accept: 'file',
exts: 'txt|json|xml',
done: function(res) {
if(res.code!=0){              
layer.msg(res.msg, {icon: 2}); 
}else{
layer.msg(res.msg, {icon: 1}); 
if(typeof(res.data[0])!="undefined"){
var imgSrc=res.data[0].src;
}else{
var imgSrc=res.data.src;
}
//$(this.item).prev("div").children("input").val(imgSrc)
$("input[name='locltxtfile3']").val(imgSrc) //用下面这种，因为有注释的话，上面这种就不行'
}
}
});
})
// pasteImage("pic");
pasteImage('locltxtfile1');
pasteImage('locltxtfile2');
pasteImage('locltxtfile3');
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
