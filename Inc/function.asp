<%

'记录访问网站20210327
Function jcount() 
    call openconn()
    dim frs,sql
    Set frs = Server.CreateObject("Adodb.RecordSet")
    sql = "select * from ["+db_PREFIX+"count] where ip='" & getip() & "' and datediff('d',intime,now())=0 "  
    frs.Open sql, conn, 3, 3 
    If Not frs.EOF Then
        frs("pv") = frs("pv") + 1 
        frs.Update 
    Else
        frs.AddNew 
        frs("useragent") = Request.ServerVariables("http_user_agent") 
        If Request.ServerVariables("HTTP_REFERER") = "" Then
            frs("url") = "直接访问" 
        Else
            frs("url") = Request.ServerVariables("HTTP_REFERER") 
        End If 
        frs("addr") = look_ip(getip()) 
        frs("pv") = 1 

        frs("ip") = getip()

        frs.Update 

    End If 
    frs.Close  
End Function





'打乱数组20220219'
function shuffleArray(splxx)
    Dim leng,b,temp,ii
    '随机排序  
    leng=UBound(splxx)
    randomize  
    for ii=0 to leng
        b=int(rnd()*leng)  
        temp=splxx(b)  
        splxx(b)=splxx(ii)  
        splxx(ii)=temp
    Next
    shuffleArray=splxx
end function
%>