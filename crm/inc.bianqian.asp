<!--#include file="../inc/Config.asp"-->
<!--#Include File = "../admin/admin_function.asp"-->
<!--#Include File = "../admin/admin_safe.Asp"-->
<% 
userRs("adminnote")=delhtml(request("bq_content"))   '登录状态为0，未登录'
userRs.update 
call die("success") 
%>