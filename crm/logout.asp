<!--#include file="../inc/Config.asp"-->
<!--#Include File = "../admin/admin_function.asp"-->
<!--#Include File = "../admin/admin_safe.Asp"-->
<%
'退出登录' 
session("adminid")=""
call removeCookie("adminuser")
call removeCookie("adminpass")   
call removeCookie("pwd")   '暂留'
call removeCookie("updatetime")  '暂留' 

userRs("loginstatus")=0   '登录状态为0，未登录'
userRs.update 
call die("success") 
%>