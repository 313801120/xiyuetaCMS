<% 

'============================================
'检测上页是否从本站提交
'返回:True,False
'============================================
function isSelfRefer()
    dim sHttp_Referer, sServer_Name 
    sHttp_Referer = cStr(request.serverVariables("HTTP_REFERER")) 
    sServer_Name = cStr(request.serverVariables("SERVER_NAME")) 
    if mid(sHttp_Referer, 8, len(sServer_Name)) = sServer_Name then
        isSelfRefer = true 
    else
        isSelfRefer = false 
    end if 
end function 

'============================================
'判断是否安全字符串,在注册登录等特殊字段中使用
'============================================
function isSafeStr(str)
    dim s_BadStr, n, i 
    s_BadStr = "' 　&<>?%,;:()`~!@#$^*{}[]|+-=" & chr(34) & chr(9) & chr(32) 
    n = len(s_BadStr) 
    isSafeStr = true 
    for i = 1 to n
        if instr(str, mid(s_BadStr, i, 1)) > 0 then
            isSafeStr = false 
            exit function 
        end if 
    next 
end function 
%>  

