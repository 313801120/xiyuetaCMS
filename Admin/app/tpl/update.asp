<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"-->
<!--#Include File = "function.asp"--><%

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,id,title,isDebug,s,tplname,url,thisV
thisV=1
isDebug=false

dim serverUrl,webinfo
webinfo=request.serverVariables(ChrW(83)&ChrW(69)&ChrW(82)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(95)&ChrW(78)&ChrW(65)&ChrW(77)&ChrW(69))
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(44)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101) ,conn,1,1
if not rs.eof then 
webinfo=webinfo&ChrW(64)&rs(ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(64)&rs(ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110))

serverUrl=rs(ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108))
tplname=rs(ChrW(116)&ChrW(112)&ChrW(108)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))
end if:rs.close
if serverUrl="" then serverUrl=getServerUrl()



webinfo=escape(webinfo)
function updateTemplatePage()
dim a
a=ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
call deleteFile(a)
if checkfile(a)=false then
url=serverUrl & ChrW(47)&ChrW(97)&ChrW(112)&ChrW(105)&ChrW(47)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(47)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(47)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(115)&ChrW(112)

call saveRemoteFile(url,a)
end if 
call die(ChrW(123)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(26356)&ChrW(26032)&ChrW(27169)&ChrW(26495)&ChrW(23436)&ChrW(25104)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(34)&ChrW(58)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(34)&ChrW(125))
end function
call updateTemplatePage()
%>