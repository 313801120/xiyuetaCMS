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
dim msg,isTrue,sql,addSql,id,layout_cai_id,parentid,title,sortrank,usevar,dimname,isthrough,isaspnote,isdebugcode,isruntime,isvbcrlf,ishr,actiontype,cuttype,startstr,endstr,forstr,findstr,replacestr,isaddforstr,selectfieldlist,stablename,saddsql,fieldaddstrlist,ifcheck,varleftaddstr,varrightaddstr,nitem,customizeaction,addvar,addvardefaultvalue,aspcode,functionlist,bodycontent
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
bodycontent=request(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))
bodycontent=handleAspStrSafe(bodycontent)

if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101) then
if id <>"" then
call showCheckAdminRule(ChrW(32534)&ChrW(36753) & winTitle)
else
call showCheckAdminRule(ChrW(28155)&ChrW(21152) & winTitle)
end if
isTrue=true
if isTrue=true then
addsql=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)& parentid &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)& title &ChrW(39)
if id <>"" then
addsql=addsql & ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&id
end if
sql=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName) & addsql

rs.open sql,conn,1,3
if not rs.eof then
msg=ChrW(26631)&ChrW(39064)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312)
else
if id="" then
rs.addnew
else
rs.close  
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(tableName)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&id,conn,1,3
end if 
rs(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(105)&ChrW(100))=layout_cai_id
rs(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100))=parentid
rs(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))=title
rs(ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107))=sortrank
rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(118)&ChrW(97)&ChrW(114))=usevar
rs(ChrW(100)&ChrW(105)&ChrW(109)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=dimname
rs(ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104))=isthrough
rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101))=isaspnote
rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(103)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))=isdebugcode
rs(ChrW(105)&ChrW(115)&ChrW(114)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101))=isruntime
rs(ChrW(105)&ChrW(115)&ChrW(118)&ChrW(98)&ChrW(99)&ChrW(114)&ChrW(108)&ChrW(102))=isvbcrlf
rs(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(114))=ishr
rs(ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=actiontype
rs(ChrW(99)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=cuttype
rs(ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(115)&ChrW(116)&ChrW(114))=startstr
rs(ChrW(101)&ChrW(110)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))=endstr
rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(114))=forstr
rs(ChrW(102)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))=findstr
rs(ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(114))=replacestr
rs(ChrW(105)&ChrW(115)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(115)&ChrW(116)&ChrW(114))=isaddforstr
rs(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=selectfieldlist
rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))=stablename
rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108))=saddsql
rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=fieldaddstrlist
rs(ChrW(105)&ChrW(102)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))=ifcheck
rs(ChrW(118)&ChrW(97)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))=varleftaddstr
rs(ChrW(118)&ChrW(97)&ChrW(114)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(116)&ChrW(114))=varrightaddstr
rs(ChrW(110)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109))=nitem
rs(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=customizeaction
rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(118)&ChrW(97)&ChrW(114))=addvar
rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))=addvardefaultvalue
rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101))=aspcode
rs(ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116))=functionlist
rs(ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116))=bodycontent

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

function oneColumnClass_layout_cai_SubInput(a)
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim c,d,e
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&thisAddPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105))&ChrW(32)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not b.eof  
e=""
if a <>"" then
if cStr(a)=cStr(b(ChrW(105)&ChrW(100))) then e=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
c=c & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& b(ChrW(105)&ChrW(100)) &ChrW(34)& e &ChrW(62)& b(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
b.movenext:wend:b.close
oneColumnClass_layout_cai_SubInput=c
end function

function columnClass_layout_cai_action_SubInput(a,b,c,d)
dim e:Set e = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
dim f,g,h
if b <>"" then d=d&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)& b
e.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&a & d &ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99),conn,1,1
while not e.eof  
h=""
if c <>"" then
if cStr(c)=cStr(e(ChrW(105)&ChrW(100))) then h=ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)
end if
f=f & ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)& e(ChrW(105)&ChrW(100)) &ChrW(34)& h &ChrW(62)& get_layout_cai_action_SubColumnClassSort(e(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),"")  & e(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(40)&e(ChrW(105)&ChrW(100))&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62)    
f=f & columnClass_layout_cai_action_SubInput(e(ChrW(105)&ChrW(100)),b,c,d)    
e.movenext:wend:e.close
columnClass_layout_cai_action_SubInput=f
end function

function get_layout_cai_action_SubColumnClassSort(a,b)
dim c:Set c = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116))
c.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&a,conn,1,1
if not c.eof then
if b <>"" then
b=ChrW(160)&ChrW(160) & b
else
b=b & ChrW(160)&ChrW(160)&ChrW(9500)&ChrW(9472) 
end if
if c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)) <>-1 then
call get_layout_cai_action_SubColumnClassSort(c(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)),b)
end if
end if:c.close
get_layout_cai_action_SubColumnClassSort=b
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
<label class='layui-form-label'>采集页ID</label>
<div class='layui-input-inline layui-input-wrap'>
<select name="layout_cai_id" id="layout_cai_id" lay-filter="layout_cai_id" selected>
<%=oneColumnClass_layout_cai_SubInput(layout_cai_id)%>
</select>
</div><!--layout_cai_id-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>选择分类</label>
<div class='layui-input-inline layui-input-wrap'>
<select name="parentid" id="parentid" lay-filter="parentid" selected>
<option value="-1">≡ 作为一级栏目 ≡</option>
<%=columnClass_layout_cai_action_SubInput(-1,id,parentid,IIF(layout_cai_id <>"",ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&layout_cai_id,""))%>
</select>
</div><!--parentid-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>标题</label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='title' placeholder='请输入标题' autocomplete='off' class='layui-input' value="<%=inputCL(title)%>"  lay-verify='required'>
</div><!--title-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>排序</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='sortrank' placeholder='请输入排序' autocomplete='off' class='layui-input' value="<%=inputCL(sortrank)%>"  lay-verify='required'>
</div><!--sortrank-->
</div>
<div class="layui-row layui-form-item">
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>操作变量</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='usevar' placeholder='请输入操作变量' autocomplete='off' class='layui-input' value="<%=inputCL(usevar)%>" >
</div>
<div class="layui-form-mid layui-text-em">为空则为上级变量</div><!--usevar-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item'>
<label class='layui-form-label'>定义变量</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='dimname' placeholder='请输入定义变量' autocomplete='off' class='layui-input' value="<%=inputCL(dimname)%>" >
</div><!--dimname-->
</div>
</div>
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
<div class="layui-form-mid layui-text-em">需要采集页先开启</div><!--isaspnote-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>写调试代码</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isdebugcode" lay-skin="switch" lay-text="是|否" <%=IIF(isdebugcode=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">需要采集页先开启</div><!--isdebugcode-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>运行时间</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isruntime" lay-skin="switch" lay-text="是|否" <%=IIF(isruntime=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">对当前处理加个运行时间</div><!--isruntime-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>回车换行</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isvbcrlf" lay-skin="switch" lay-text="是|否" <%=IIF(isvbcrlf=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">代码里加回车换行</div><!--isvbcrlf-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>加分割线</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="ishr" lay-skin="switch" lay-text="是|否" <%=IIF(ishr=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div>
<div class="layui-form-mid layui-text-em">调试时加分割线</div><!--ishr-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>动作类型</label>
<div class='layui-input-block layui-input-wrap'>
<input type="radio" name="actiontype" value="cut" title="截取" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(99)&ChrW(117)&ChrW(116),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="for" title="循环" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(102)&ChrW(111)&ChrW(114),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="item" title="项" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="replace" title="替换" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="insert" title="添加到表" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="update" title="更新到表" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="if" title="判断" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(105)&ChrW(102),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="varAddStr" title="变量加字符" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(118)&ChrW(97)&ChrW(114)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(83)&ChrW(116)&ChrW(114),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="addVar" title="定义变量" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(97)&ChrW(100)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(114),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="aspCode" title="代码片段" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(97)&ChrW(115)&ChrW(112)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="serverjs" title="服务器JS" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(106)&ChrW(115),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="importAspFunction" title="导入ASP函数" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
<input type="radio" name="actiontype" value="action" title="动作" lay-filter="actiontype" <%=IIF(actiontype+""=ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100),"")%>>
</div><!--actiontype-->
</div>
<div class='layui-form-item' id="cuttype">
<label class='layui-form-label'>截取类型</label>
<div class='layui-input-inline layui-input-wrap'>
<%=showOnLineSelectHtml(ChrW(99)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(45)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(95)&ChrW(48)&ChrW(45)&ChrW(91)&ChrW(65)&ChrW(93)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(91)&ChrW(47)&ChrW(65)&ChrW(93)&ChrW(95)&ChrW(49)&ChrW(45)&ChrW(91)&ChrW(65)&ChrW(93)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(95)&ChrW(51)&ChrW(45)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(91)&ChrW(47)&ChrW(65)&ChrW(93)&ChrW(95)&ChrW(52),cuttype)%>
</div><!--cuttype-->
</div>
<div class="layui-row layui-form-item" id="sub_startstr_endstr">
<div class="layui-col-xs6">
<div class='layui-form-item' id="startstr">
<label class='layui-form-label'>开头字符</label>
<div class='layui-input-inline layui-input-wrap'>
<textarea name='startstr'  placeholder='请输入开头字符' class='layui-textarea'><%=inputCL(startstr)%></textarea>
</div><!--startstr-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item' id="endstr">
<label class='layui-form-label'>结尾字符</label>
<div class='layui-input-inline layui-input-wrap'>
<textarea name='endstr'  placeholder='请输入结尾字符' class='layui-textarea'><%=inputCL(endstr)%></textarea>
</div><!--endstr-->
</div>
</div>
</div>    
<div class='layui-form-item' id="forstr">
<label class='layui-form-label'>切割字符</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='forstr' placeholder='请输入切割字符' autocomplete='off' class='layui-input' value="<%=inputCL(forstr)%>" >
</div><!--forstr-->
</div>
<div class="layui-row layui-form-item" id="sub_findstr_replacestr">
<div class="layui-col-xs6">
<div class='layui-form-item' id="findstr">
<label class='layui-form-label'>查找内容</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='findstr' placeholder='请输入查找内容' autocomplete='off' class='layui-input' value="<%=inputCL(findstr)%>" >
</div><!--findstr-->
</div>
</div>
<div class="layui-col-xs6">
<div class='layui-form-item' id="replacestr">
<label class='layui-form-label'>替换内容</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='replacestr' placeholder='请输入替换内容' autocomplete='off' class='layui-input' value="<%=inputCL(replacestr)%>" >
</div><!--replacestr-->
</div>
</div>
</div>    
<div class='layui-form-item' id="isaddforstr">
<label class='layui-form-label'>加切割部分</label>
<div class='layui-input-inline layui-input-wrap'>
<input type="checkbox" lay-filter="switch" name="isaddforstr" lay-skin="switch" lay-text="是|否" <%=IIF(isaddforstr=0,"",ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100))%>>
</div><!--isaddforstr-->
</div>
<div class='layui-form-item' id="selectfieldlist">
<label class='layui-form-label'>查询字段</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='selectfieldlist' placeholder='请输入查询字段' autocomplete='off' class='layui-input' value="<%=inputCL(selectfieldlist)%>" >
</div>
<div class="layui-form-mid layui-text-em">为空则为*</div><!--selectfieldlist-->
</div>
<div class='layui-form-item' id="tablename">
<label class='layui-form-label'>表名称</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='tablename' placeholder='请输入表名称' autocomplete='off' class='layui-input' value="<%=inputCL(stablename)%>" >
</div><!--tablename-->
</div>
<div class='layui-form-item' id="addsql">
<label class='layui-form-label'>追加SQL</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='addsql' placeholder='请输入追加SQL' autocomplete='off' class='layui-input' value="<%=inputCL(saddsql)%>" >
</div><!--addsql-->
</div>
<div class='layui-form-item' id="fieldaddstrlist">
<label class='layui-form-label'>变量写表字段<i class="layui-icon icon-wenhao" data-txt="如：title=s1">&#xe607;</i> </label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='fieldaddstrlist'  placeholder='请输入变量写表字段' class='layui-textarea'style='height:400px'><%=inputCL(fieldaddstrlist)%></textarea>
</div><!--fieldaddstrlist-->
</div>
<div class='layui-form-item' id="ifcheck">
<label class='layui-form-label'>IF判断</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='ifcheck' placeholder='请输入IF判断' autocomplete='off' class='layui-input' value="<%=inputCL(ifcheck)%>" >
</div>
<div class="layui-form-mid layui-text-em">判断，如：title<>""</div><!--ifcheck-->
</div>
<div class='layui-form-item' id="varleftaddstr">
<label class='layui-form-label'>左加字符</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='varleftaddstr' placeholder='请输入左加字符' autocomplete='off' class='layui-input' value="<%=inputCL(varleftaddstr)%>" >
</div><!--varleftaddstr-->
</div>
<div class='layui-form-item' id="varrightaddstr">
<label class='layui-form-label'>右加字符</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='varrightaddstr' placeholder='请输入右加字符' autocomplete='off' class='layui-input' value="<%=inputCL(varrightaddstr)%>" >
</div><!--varrightaddstr-->
</div>
<div class='layui-form-item' id="nitem">
<label class='layui-form-label'>项</label>
<div class='layui-input-inline layui-input-wrap'>
<input step="1" lay-affix="number" type='number' name='nitem' placeholder='请输入项' autocomplete='off' class='layui-input' value="<%=inputCL(nitem)%>" >
</div><!--nitem-->
</div>
<div class='layui-form-item' id="customizeaction">
<label class='layui-form-label'>自定义动作</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='customizeaction' placeholder='请输入自定义动作' autocomplete='off' class='layui-input' value="<%=inputCL(customizeaction)%>" >
</div>
<div class="layui-form-mid layui-text-em">如：getTitleToDaXioQiu，为null则不处理为分类需要</div><!--customizeaction-->
</div>
<div class='layui-form-item' id="addvar">
<label class='layui-form-label'>添加变量</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='addvar' placeholder='请输入添加变量' autocomplete='off' class='layui-input' value="<%=inputCL(addvar)%>" >
</div>
<div class="layui-form-mid layui-text-em">添加变量名</div><!--addvar-->
</div>
<div class='layui-form-item' id="addvardefaultvalue">
<label class='layui-form-label'>变量值</label>
<div class='layui-input-inline layui-input-wrap'>
<input type='text' name='addvardefaultvalue' placeholder='请输入变量值' autocomplete='off' class='layui-input' value="<%=inputCL(addvardefaultvalue)%>" >
</div>
<div class="layui-form-mid layui-text-em">添加变量名默认值：如""，为空则不认为默认值</div><!--addvardefaultvalue-->
</div>
<div class='layui-form-item' id="aspcode">
<label class='layui-form-label'>asp代码<i class="layui-icon icon-wenhao" data-txt="输入asp代码，左边退格会自动加上">&#xe607;</i> </label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='aspcode'  placeholder='请输入asp代码' class='layui-textarea'style='height:600px'><%=inputCL(aspcode)%></textarea>
</div><!--aspcode-->
</div>
<div class='layui-form-item' id="functionlist">
<label class='layui-form-label'>函数列表<i class="layui-icon icon-wenhao" data-txt="输入asp代码，左边退格会自动加上">&#xe607;</i> </label>
<div class='layui-input-block layui-input-wrap'>
<input type='text' name='functionlist' placeholder='请输入函数列表' autocomplete='off' class='layui-input' value="<%=inputCL(functionlist)%>" >
</div><!--functionlist-->
</div>
<div class='layui-form-item'>
<label class='layui-form-label'>备注</label>
<div class='layui-input-block layui-input-wrap'>
<textarea name='bodycontent'  placeholder='请输入备注' class='layui-textarea'><%=inputCL(bodycontent)%></textarea>
</div><!--bodycontent-->
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
//？提醒   借鉴于别人20230309
$(".icon-wenhao").hover(function(){
var thetxt = $(this).attr("data-txt");
var tips = layer.tips(thetxt, this , {
tips: [1, '#000'] //还可配置颜色
,time: 50000
});
},function(){
layer.closeAll('tips');
})
// 根据“动作类型”显示/隐藏相关字段（使用 HTML 上的 id）  20250905 20250913 7
function toggleActionSections(value){
var $cutType = $('#cuttype');
var $range = $('#sub_startstr_endstr');
var $forStr = $('#forstr'); 
var $isaddforstr = $('#isaddforstr');
var $sub_findstr_replacestr = $('#sub_findstr_replacestr');
var $selectfieldlist = $('#selectfieldlist');
var $tablename = $('#tablename');
var $addsql = $('#addsql');
var $fieldaddstrlist = $('#fieldaddstrlist');
var $ifcheck = $('#ifcheck');
var $customizeaction = $('#customizeaction');
var $varleftaddstr = $('#varleftaddstr');
var $varrightaddstr = $('#varrightaddstr');
var $nitem = $('#nitem');
var $addvar = $('#addvar');
var $addvardefaultvalue = $('#addvardefaultvalue');
var $aspcode = $('#aspcode');
var $functionlist = $('#functionlist');
// 未选择任何动作类型时，全部隐藏
$cutType.hide();
$range.hide();
$forStr.hide();
$isaddforstr.hide(); 
$sub_findstr_replacestr.hide();
$selectfieldlist.hide();
$tablename.hide();
$addsql.hide();
$fieldaddstrlist.hide();
$ifcheck.hide();
$customizeaction.hide();
$varleftaddstr.hide();
$varrightaddstr.hide();
$nitem.hide();
$addvar.hide();
$addvardefaultvalue.hide();
$aspcode.hide();
$functionlist.hide();
if(value === 'cut'){
$cutType.show();
$range.show();   
}else if(value === 'for'){ 
$forStr.show();
$isaddforstr.show();  
}else if(value === 'replace'){ 
$sub_findstr_replacestr.show(); 
}else if(value === 'if'){ 
$ifcheck.show(); 
}else if(value === 'insert' || value === 'update'){ 
$selectfieldlist.show();
$tablename.show();
$addsql.show();
$fieldaddstrlist.show(); 
}else if(value === 'action'){ 
$customizeaction.show(); 
}else if(value === 'varAddStr'){ 
$varleftaddstr.show();
$varrightaddstr.show(); 
}else if(value === 'item'){ 
$nitem.show(); 
}else if(value === 'addVar'){ 
$addvar.show();
$addvardefaultvalue.show();  
}else if(value === 'aspCode'){ 
$aspcode.show();
}else if(value === 'serverjs'){ 
$aspcode.show();
$customizeaction.show(); 
}else if(value === 'importAspFunction'){ 
$functionlist.show(); 
}
}
// 渲染单选框（确保 Layui 已处理为自定义样式）
form.render('radio');
// 初始化：根据当前已选的动作类型决定显示/隐藏
// 如果没有选中任何动作类型，则不默认选择，保持全部隐藏
var current = $('input[name="actiontype"]:checked').val() || '';
toggleActionSections(current);
// 仅使用 Layui 的监听方式
form.on('radio(actiontype)', function(data){
toggleActionSections(data.value || '');
});
})
// pasteImage("pic");
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
