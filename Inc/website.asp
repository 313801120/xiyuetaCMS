<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "language.asp"-->
<%
dim uDomain,uTitle,dataPrefix,myDomain,splDiQu,cDiQu,nI,diqu
dim isDomainOrUrlSuffix:isDomainOrUrlSuffix=ChrW(115)&ChrW(117)&ChrW(102)&ChrW(102)&ChrW(105)&ChrW(120)
if isDomainOrUrlSuffix=ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110) then 


if myDomain="" then myDomain=getHnaldeMyDomain()
uDomain=request.serverVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69))
dataPrefix=replace(uDomain,myDomain,"")
if dataPrefix <>"" then 
uTitle=getSheShiToCn(mid(dataPrefix,1,len(dataPrefix)-1))
end if
if uTitle="" then
if dataPrefix=ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(46)&ChrW(99)&ChrW(110)&ChrW(46)&ChrW(110)&ChrW(101)&ChrW(116) or 1=1 then
dataPrefix=""
else
call die(uDomain & ChrW(32593)&ChrW(31449)&ChrW(27491)&ChrW(22312)&ChrW(21046)&ChrW(20316)&ChrW(20013)&ChrW(12290)&ChrW(12290)&ChrW(12290) & dataPrefix)
end if
end if
else 
diqu=request(ChrW(100)&ChrW(105)&ChrW(113)&ChrW(117))
if diqu <>"" then
uTitle=getSheShiToCn(diqu)
end if


end if

function urlAddDiQu(a)
if diqu <>"" and a <>"" then
if asporhtml=true then
if left(a,2)=ChrW(46)&ChrW(47) then
a=mid(a,3)
end if
a=diqu & ChrW(45) & a
else
if instr(a,ChrW(63))>0 then
a=a & ChrW(38)&ChrW(100)&ChrW(105)&ChrW(113)&ChrW(117)&ChrW(61) & diqu
else
a=a & ChrW(63)&ChrW(100)&ChrW(105)&ChrW(113)&ChrW(117)&ChrW(61) & diqu
end if
end if
end if
a=urlAddEnlanguage(a)
urlAddDiQu=a
end function

function urlAddEnlanguage(a) 
if language <>"" and a <>"" then
if asporhtml=true then
if left(a,2)=ChrW(46)&ChrW(47) then
a=mid(a,3)
end if
if request(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)) <>ChrW(49) then
a=language & ChrW(45) & a  
end if
else
if instr(a,ChrW(63))>0 then
a=a & ChrW(38)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61) & language
else
a=a & ChrW(63)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61) & language
end if
end if
end if
urlAddEnlanguage=a
end function

function getThisUrlToLanguage(a)
dim b
if asporhtml=true then
if defaultLanguage=a then
b=ChrW(47)
else
b=ChrW(47) & a
end if
else
b=pageUrl
if defaultLanguage=a then
b=getUrlAddToParam(b,ChrW(63)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61),ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101))   
else
b=getUrlAddToParam(b,ChrW(63)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61)&a,ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))   
end if
end if
getThisUrlToLanguage=b
end function

function getThisUrlToCnUrl()
dim a
a=pageUrl
if asporhtml=true then




a=ChrW(47)
else
if language=ChrW(101)&ChrW(110) or language=ChrW(102)&ChrW(116) then
a=getUrlAddToParam(a,ChrW(63)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61),ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101))    
end if
end if
getThisUrlToCnUrl=a
end function

function getThisUrlToEnUrl()
dim a,b,c,d  
a=pageUrl
if asporhtml=true then    








a=ChrW(47)&ChrW(101)&ChrW(110)
else   
a=getUrlAddToParam(a,ChrW(63)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61)&ChrW(101)&ChrW(110),ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))    
end if












getThisUrlToEnUrl=a
end function 

function getThisUrlToFtUrl()
dim a,b,c,d  
a=pageUrl
if asporhtml=true then








a=ChrW(47)&ChrW(102)&ChrW(116)
else   
a=getUrlAddToParam(a,ChrW(63)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(61)&ChrW(102)&ChrW(116),ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))    
end if 
getThisUrlToFtUrl=a
end function 

function getSheShiUrl(a)
dim b,c,d,e,f,g
b=pageUrl
f= lcase(pinYin2(a(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))))
if asporhtml=true and request(ChrW(105)&ChrW(115)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)) <>ChrW(49) then
d=split(b,ChrW(45))
if ubound(d)>0 then
if language=ChrW(101)&ChrW(110) or language=ChrW(102)&ChrW(116) then
g=d(0) & ChrW(45)
end if
g=g & f & ChrW(45)
g=g & d(uBound(d))
b=g 
else
b=f & ChrW(45) 
end if
else   
b=getUrlAddToParam(b,ChrW(63)&ChrW(100)&ChrW(105)&ChrW(113)&ChrW(117)&ChrW(61)&f&"",ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101))    
end if 
getSheShiUrl=b
end function

function SheShiUrl(a)
SheShiUrl=ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)& trim(lcase(pinYin2(a))) &ChrW(46)& myDomain
end function

function getSheShiToCn(a)
call openconn()
dim b:Set b = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(116)) 
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(39) ,conn,1,3
while not b.eof
b(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))=trim(pinYin2(b(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))))
b.update
b.movenext:wend:b.close
b.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(69)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)& a &ChrW(39) ,conn,1,1
if not b.eof then
getSheShiToCn=b(ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
end if:b.close
end function

function getHnaldeMyDomain()
dim a,b
a=getUrl()

a=getWebSiteCleanName(a)

b=split(a,ChrW(46))

if ubound(b) >=1 then
a=b(ubound(b)-1) & ChrW(46) & b(ubound(b))

getHnaldeMyDomain=a
end if
end function
%>