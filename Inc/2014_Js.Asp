<% 
'Js

'Js定时跳转 Timing = 定时 时间测定 例：Call Rw("账号或密码错误，" & JsTiming("返回", 5))
Function jsTiming(url, nSeconds)
    Dim c 
    c = c & "<span id=mytimeidboyd>倒计时</span>" & vbCrLf 
    c = c & "<script type=""text/javascript"">" & vbCrLf 
    c = c & "//配置Config" & vbCrLf 
    c = c & "var coutnumb" & vbCrLf 
    c = c & "coutnumb=" & nSeconds & "" & vbCrLf 
    c = c & "" & vbCrLf 
    c = c & "//定时跳转" & vbCrLf 
    c = c & "function Countdown(){" & vbCrLf                                        'Countdown=倒数计秒
    c = c & "    coutnumb-=1" & vbCrLf 
    c = c & "    mytimeidboyd.innerHTML=""倒计时<font color=#000000>""+coutnumb+""</font>""" & vbCrLf 
    c = c & "    if(coutnumb<1){    " & vbCrLf 

    If url = "back" Or url = "返回" Then                                              '当Action为back是返回上页
        c = c & "        history.back();" & vbCrLf 
    ElseIf url = "父窗体刷新" Then
        c = c & "        parent.location.reload();" & vbCrLf 
    ElseIf left(url,7) = "action:" Then   '如 action:document.write('你好')
        c = c & "        "& mid(url,8) & vbCrLf 
    Else
        c = c & "        location.href='" & url & "';" & vbCrLf 
    End If 


    c = c & "    }else{" & vbCrLf 
    c = c & "        setTimeout(""Countdown()"",1000);" & vbCrLf 
    c = c & "    }" & vbCrLf 
    c = c & "}setTimeout(""Countdown()"",1)" & vbCrLf 
    c = c & "</" & "script>" & vbCrLf 
    jsTiming = c 
End Function




'JS转换，引用别人
Function jsEncode__(ByVal s)
    If isNul(s) Then
        jsEncode__ = "" 
        Exit Function 
    End If 
    Dim arr1, arr2, i, j, c, p, t 
    arr1 = Array(Chr(34), Chr(92), Chr(47), Chr(8), Chr(12), Chr(10), Chr(13), Chr(9)) '34|",92|\,47|/,8|,12|,10| ,13| ,9|    ,
    arr2 = Array(Chr(34), Chr(92), Chr(47), Chr(98), Chr(102), Chr(110), Chr(114)) '34|",92|\,47|/,98|b,102|f,110|n,114|r,1865|,
    For i = 1 To Len(s)
        p = True 
        c = Mid(s, i, 1) 
        For j = 0 To UBound(arr1)
            If c = arr1(j) Then
                t = t & "\" & arr2(j) 
                p = False 
                Exit For 
            End If 
        Next 
        If p Then t = t & c 
    Next 
    jsEncode__ = t 
End Function

%>