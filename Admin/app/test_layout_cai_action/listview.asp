<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim tableName,winTitle
dim thisDatabaseType:thisDatabaseType=databaseType
tableName = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)
winTitle = ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)
excludeAdminIDLIst=ChrW(45)&ChrW(57)&ChrW(57)&ChrW(57)
dim msg,isTrue,sql,addSql,id,layout_cai_id,parentid,title,sortrank,usevar,dimname,isthrough,isaspnote,isdebugcode,isruntime,isvbcrlf,ishr,actiontype,cuttype,startstr,endstr,forstr,findstr,replacestr,isaddforstr,selectfieldlist,stablename,saddsql,fieldaddstrlist,ifcheck,varleftaddstr,varrightaddstr,nitem,customizeaction,addvar,addvardefaultvalue,aspcode,functionlist,viewtitle,viewsql,viewfieldlist,bodycontent
id=getStrToNumber(request(ChrW(105)&ChrW(100)))
layout_cai_id=getStrToNumber(request(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(105)&ChrW(100)))
if layout_cai_id="" then layout_cai_id=null
parentid=getStrToNumber(request(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)))
if parentid="" then parentid=null
title=request(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
title=handleAspStrSafe(title)
sortrank=getStrToNumber(request(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)))
if sortrank="" then sortrank=null
usevar=request(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(114))
usevar=handleAspStrSafe(usevar)
dimname=request(ChrW(100)&ChrW(105)&ChrW(109)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
dimname=handleAspStrSafe(dimname)
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
isvbcrlf=request(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(98)&ChrW(99)&ChrW(114)&ChrW(108)&ChrW(102))
isvbcrlf=IIF(isvbcrlf=ChrW(111)&ChrW(110),1,0) 
isvbcrlf=handleAspStrSafe(isvbcrlf)
ishr=request(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(114))
ishr=IIF(ishr=ChrW(111)&ChrW(110),1,0) 
ishr=handleAspStrSafe(ishr)
actiontype=request(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
actiontype=handleAspStrSafe(actiontype)
cuttype=getStrToNumber(request(ChrW(99)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)))
if cuttype="" then cuttype=null
cuttype=handleAspStrSafe(cuttype)
startstr=request(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(115)&ChrW(116)&ChrW(114))
startstr=handleAspStrSafe(startstr)
endstr=request(ChrW(101)&ChrW(110)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))
endstr=handleAspStrSafe(endstr)
forstr=request(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(114))
forstr=handleAspStrSafe(forstr)
findstr=request(ChrW(102)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))
findstr=handleAspStrSafe(findstr)
replacestr=request(ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(114))
replacestr=handleAspStrSafe(replacestr)
isaddforstr=request(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(114))
isaddforstr=IIF(isaddforstr=ChrW(111)&ChrW(110),1,0) 
selectfieldlist=request(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
selectfieldlist=handleAspStrSafe(selectfieldlist)
stablename=request(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
saddsql=request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108))
addsql=handleAspStrSafe(addsql)
fieldaddstrlist=request(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
fieldaddstrlist=handleAspStrSafe(fieldaddstrlist)
ifcheck=request(ChrW(105)&ChrW(102)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))
ifcheck=handleAspStrSafe(ifcheck)
varleftaddstr=request(ChrW(118)&ChrW(97)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))
varleftaddstr=handleAspStrSafe(varleftaddstr)
varrightaddstr=request(ChrW(118)&ChrW(97)&ChrW(114)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))
varrightaddstr=handleAspStrSafe(varrightaddstr)
nitem=getStrToNumber(request(ChrW(110)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)))
if nitem="" then nitem=null
nitem=handleAspStrSafe(nitem)
customizeaction=request(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
customizeaction=handleAspStrSafe(customizeaction)
addvar=request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(118)&ChrW(97)&ChrW(114))
addvar=handleAspStrSafe(addvar)
addvardefaultvalue=request(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
addvardefaultvalue=handleAspStrSafe(addvardefaultvalue)
aspcode=request(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))
aspcode=handleAspStrSafe(aspcode)
functionlist=request(ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
functionlist=handleAspStrSafe(functionlist)
viewtitle=request(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
viewtitle=handleAspStrSafe(viewtitle)
viewsql=request(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(113)&ChrW(108))
viewsql=handleAspStrSafe(viewsql)
viewfieldlist=request(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
viewfieldlist=handleAspStrSafe(viewfieldlist)
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=handleAspStrSafe(bodycontent)
if id <>"" then
call showCheckAdminRule(ChrW(26597)&ChrW(30475) & winTitle) 
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,1
if not rs.eof then
id=rs(ChrW(105)&ChrW(100))
layout_cai_id=rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(105)&ChrW(100))
parentid=rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
title=rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
sortrank=rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))
usevar=rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(114))
dimname=rs(ChrW(100)&ChrW(105)&ChrW(109)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
isthrough=rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))
isaspnote=rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))
isdebugcode=rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))
isruntime=rs(ChrW(105)&ChrW(115)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))
isvbcrlf=rs(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(98)&ChrW(99)&ChrW(114)&ChrW(108)&ChrW(102))
ishr=rs(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(114))
actiontype=rs(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
cuttype=rs(ChrW(99)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
startstr=rs(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(115)&ChrW(116)&ChrW(114))
endstr=rs(ChrW(101)&ChrW(110)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))
forstr=rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(114))
findstr=rs(ChrW(102)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))
replacestr=rs(ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(114))
isaddforstr=rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(114))
selectfieldlist=rs(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
stablename=rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
saddsql=rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108))
fieldaddstrlist=rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
ifcheck=rs(ChrW(105)&ChrW(102)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))
varleftaddstr=rs(ChrW(118)&ChrW(97)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))
varrightaddstr=rs(ChrW(118)&ChrW(97)&ChrW(114)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))
nitem=rs(ChrW(110)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109))
customizeaction=rs(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
addvar=rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(118)&ChrW(97)&ChrW(114))
addvardefaultvalue=rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))
aspcode=rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))
functionlist=rs(ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
viewtitle=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
viewsql=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(113)&ChrW(108))
viewfieldlist=rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))
bodycontent=rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
end if
else
sortrank=10
isthrough=1
isaspnote=1
isdebugcode=1
isruntime=1
isvbcrlf=1
ishr=1
nitem=0
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99),conn,1,1
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

function getTimeFuHao()
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) or thisDatabaseType=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then
getTimeFuHao=ChrW(39)
else
getTimeFuHao=ChrW(35)
end if
end function

function getTableFieldFuHao(a)
if thisDatabaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
getTableFieldFuHao=ChrW(96)&a&ChrW(96)
else
getTableFieldFuHao=ChrW(91)&a&ChrW(93)
end if
end function

function get_layout_cai_oneClassColumnName(a) 
if isnul(a) then exit function
dim b
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))  
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
b=c(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))
end if:c.close 
get_layout_cai_oneClassColumnName=b
end function

function get_layout_cai_action_allTreeName(a) 
dim b,c,d

if isnul(a) then exit function
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))  
for b=1 to 10
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)& getTableFieldFuHao(db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not e.eof then
a=e(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))
d=e(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))& ChrW(40)&e(ChrW(105)&ChrW(100))&ChrW(41)
if c <>"" then d= d & ChrW(62)&ChrW(62)
c=d&c
if a=-1 or isNul(a) then exit for
end if:e.close 
next
get_layout_cai_action_allTreeName=c
end function

function get_actiontype_radioValue(a)
a=newCStr(a)
if a=ChrW(99)&ChrW(117)&ChrW(116) then
a=ChrW(25130)&ChrW(21462)
elseif a=ChrW(102)&ChrW(111)&ChrW(114) then
a=ChrW(24490)&ChrW(29615)
elseif a=ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109) then
a=ChrW(39033)
elseif a=ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101) then
a=ChrW(26367)&ChrW(25442)
elseif a=ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116) then
a=ChrW(28155)&ChrW(21152)&ChrW(21040)&ChrW(34920)
elseif a=ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101) then
a=ChrW(26356)&ChrW(26032)&ChrW(21040)&ChrW(34920)
elseif a=ChrW(105)&ChrW(102) then
a=ChrW(21028)&ChrW(26029)
elseif a=ChrW(118)&ChrW(97)&ChrW(114)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(83)&ChrW(116)&ChrW(114) then
a=ChrW(21464)&ChrW(37327)&ChrW(21152)&ChrW(23383)&ChrW(31526)
elseif a=ChrW(97)&ChrW(100)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(114) then
a=ChrW(23450)&ChrW(20041)&ChrW(21464)&ChrW(37327)
elseif a=ChrW(97)&ChrW(115)&ChrW(112)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101) then
a=ChrW(20195)&ChrW(30721)&ChrW(29255)&ChrW(27573)
elseif a=ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(106)&ChrW(115) then
a=ChrW(26381)&ChrW(21153)&ChrW(22120)&ChrW(74)&ChrW(83)
elseif a=ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) then
a=ChrW(23548)&ChrW(20837)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(20989)&ChrW(25968)
elseif a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97) then
a=ChrW(27983)&ChrW(35272)&ChrW(25968)&ChrW(25454)
elseif a=ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) then
a=ChrW(21160)&ChrW(20316)
end if
get_actiontype_radioValue=a 
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
<label class='layui-form-label'>采集页ID：</label>
<div class='layui-input-block layui-input-wrap'>
<%=get_layout_cai_oneClassColumnName(layout_cai_id)%>
</div><!--layout_cai_id-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>选择分类：</label>
<div class='layui-input-block layui-input-wrap'>
<%=get_layout_cai_action_allTreeName(parentid)%>
</div><!--parentid-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=title%>
</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序：</label>
<div class='layui-input-block layui-input-wrap'>
<%=sortrank%>
</div><!--sortrank-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>操作变量：</label>
<div class='layui-input-block layui-input-wrap'>
<%=usevar%>
</div><!--usevar-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>定义变量：</label>
<div class='layui-input-block layui-input-wrap'>
<%=dimname%>
</div><!--dimname-->
</div>
</div>
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
<label class='layui-form-label'>回车换行：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isvbcrlf=0,ChrW(21542),ChrW(26159))%>
</div><!--isvbcrlf-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>加分割线：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(ishr=0,ChrW(21542),ChrW(26159))%>
</div><!--ishr-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>动作类型：</label>
<div class='layui-input-block layui-input-wrap'>
<%=get_actiontype_radioValue(actiontype)%>
</div><!--actiontype-->
</div>
<div class='layui-form-item' id="cuttype">
<label class='layui-form-label'>截取类型：</label>
<div class='layui-input-block layui-input-wrap'>
<%=getOnLineSelectValue(ChrW(99)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(95)&ChrW(48)&ChrW(45)&ChrW(91)&ChrW(65)&ChrW(93)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(91)&ChrW(47)&ChrW(65)&ChrW(93)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(91)&ChrW(65)&ChrW(93)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(95)&ChrW(51)&ChrW(45)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(91)&ChrW(47)&ChrW(65)&ChrW(93)&ChrW(95)&ChrW(52),cuttype)%>
</div><!--cuttype-->
</div>
<div class="layui-row layui-form-item" id="sub_startstr_endstr">
<div class="layui-col-xs6">
<div class='layui-form-item' id="startstr">
<label class='layui-form-label'>开头字符：</label>
<div class='layui-input-block layui-input-wrap'>
<%=startstr%>
</div><!--startstr-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item' id="endstr">
<label class='layui-form-label'>结尾字符：</label>
<div class='layui-input-block layui-input-wrap'>
<%=endstr%>
</div><!--endstr-->
</div>
</div>
</div>    
<div class='layui-form-item' id="forstr">
<label class='layui-form-label'>切割字符：</label>
<div class='layui-input-block layui-input-wrap'>
<%=forstr%>
</div><!--forstr-->
</div>
<div class="layui-row layui-form-item" id="sub_findstr_replacestr">
<div class="layui-col-xs6">
<div class='layui-form-item' id="findstr">
<label class='layui-form-label'>查找内容：</label>
<div class='layui-input-block layui-input-wrap'>
<%=findstr%>
</div><!--findstr-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item' id="replacestr">
<label class='layui-form-label'>替换内容：</label>
<div class='layui-input-block layui-input-wrap'>
<%=replacestr%>
</div><!--replacestr-->
</div>
</div>
</div>    
<div class='layui-form-item' id="isaddforstr">
<label class='layui-form-label'>加切割部分：</label>
<div class='layui-input-inline layui-input-wrap' style='line-height:40px;color: #999;'>
<%=IIF(isaddforstr=0,ChrW(21542),ChrW(26159))%>
</div><!--isaddforstr-->
</div>
<div class='layui-form-item' id="selectfieldlist">
<label class='layui-form-label'>查询字段：</label>
<div class='layui-input-block layui-input-wrap'>
<%=selectfieldlist%>
</div><!--selectfieldlist-->
</div>
<div class='layui-form-item' id="tablename">
<label class='layui-form-label'>表名称：</label>
<div class='layui-input-block layui-input-wrap'>
<%=stablename%>
</div><!--tablename-->
</div>
<div class='layui-form-item' id="addsql">
<label class='layui-form-label'>追加SQL：</label>
<div class='layui-input-block layui-input-wrap'>
<%=saddsql%>
</div><!--addsql-->
</div>
<div class='layui-form-item' id="fieldaddstrlist">
<label class='layui-form-label'>变量写表字段：</label>
<div class='layui-input-block layui-input-wrap'>
<%=fieldaddstrlist%>
</div><!--fieldaddstrlist-->
</div>
<div class='layui-form-item' id="ifcheck">
<label class='layui-form-label'>IF判断：</label>
<div class='layui-input-block layui-input-wrap'>
<%=ifcheck%>
</div><!--ifcheck-->
</div>
<div class='layui-form-item' id="varleftaddstr">
<label class='layui-form-label'>左加字符：</label>
<div class='layui-input-block layui-input-wrap'>
<%=varleftaddstr%>
</div><!--varleftaddstr-->
</div>
<div class='layui-form-item' id="varrightaddstr">
<label class='layui-form-label'>右加字符：</label>
<div class='layui-input-block layui-input-wrap'>
<%=varrightaddstr%>
</div><!--varrightaddstr-->
</div>
<div class='layui-form-item' id="nitem">
<label class='layui-form-label'>项：</label>
<div class='layui-input-block layui-input-wrap'>
<%=nitem%>
</div><!--nitem-->
</div>
<div class='layui-form-item' id="customizeaction">
<label class='layui-form-label'>自定义动作：</label>
<div class='layui-input-block layui-input-wrap'>
<%=customizeaction%>
</div><!--customizeaction-->
</div>
<div class='layui-form-item' id="addvar">
<label class='layui-form-label'>添加变量：</label>
<div class='layui-input-block layui-input-wrap'>
<%=addvar%>
</div><!--addvar-->
</div>
<div class='layui-form-item' id="addvardefaultvalue">
<label class='layui-form-label'>变量值：</label>
<div class='layui-input-block layui-input-wrap'>
<%=addvardefaultvalue%>
</div><!--addvardefaultvalue-->
</div>
<div class='layui-form-item' id="aspcode">
<label class='layui-form-label'>asp代码：</label>
<div class='layui-input-block layui-input-wrap'>
<%=aspcode%>
</div><!--aspcode-->
</div>
<div class='layui-form-item' id="functionlist">
<label class='layui-form-label'>函数列表：</label>
<div class='layui-input-block layui-input-wrap'>
<%=functionlist%>
</div><!--functionlist-->
</div>
<div class='layui-form-item' id="viewtitle">
<label class='layui-form-label'>浏览标题：</label>
<div class='layui-input-block layui-input-wrap'>
<%=viewtitle%>
</div><!--viewtitle-->
</div>
<div class='layui-form-item' id="viewsql">
<label class='layui-form-label'>浏览追加SQL：</label>
<div class='layui-input-block layui-input-wrap'>
<%=viewsql%>
</div><!--viewsql-->
</div>
<div class='layui-form-item' id="viewfieldlist">
<label class='layui-form-label'>浏览显示字段：</label>
<div class='layui-input-block layui-input-wrap'>
<%=viewfieldlist%>
</div><!--viewfieldlist-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>备注：</label>
<div class='layui-input-block layui-input-wrap'>
<%=bodycontent%>
</div><!--bodycontent-->
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
}).use(['index', 'form', 'upload', 'laydate','layedit','tinymce','colorpicker','rate','transfer','croppers'], function() {
var $ = layui.$,
form = layui.form,
upload = layui.upload,
laydate = layui.laydate,
colorpicker = layui.colorpicker; 
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
