<% 
'--------版权说明------------------
'Author:小云
'QQ:313801120
'E-Mail:313801120@qq.com
'--------定义部份------------------
sub sqlIn()
    dim strIn, splStr, i, j 
    '自定义需要过滤的字串,用 "|" 分隔
    strIn = "'|;|and|(|)|exec|insert|select|delete|update|count|*|chr|mid|master|truncate|char|declare" 
    splStr = split(strIn, "|")                                                      '--------Post部份------------------
    if request.queryString <> "" then
        for each j in request.queryString
            for i = 0 to uBound(splStr)
                if inStr(lCase(request.queryString), splStr(i)) <> 0 then
                    call saveSqlInInfo(splStr(i)) 
                    call eerr("Post注入", "你的IP[" & getIP & "]已被收录") 
                end if 
            next 
        next 
    end if 

    '--------Get部份------------------
    if request.form <> "" then
        for each j in request.queryString
            for i = 0 to uBound(splStr)
                if inStr(lCase(request.queryString), splStr(i)) <> 0 then
                    call saveSqlInInfo(splStr(i)) 
                    call eerr("Get注入", "你的IP[" & getIP & "]已被收录") 
                end if 
            next 
        next 
    end if 
    '--------Cookies部份------------------
'等开发
end sub 
'保存Sqlin注入
function saveSqlInInfo(str)
    dim fileName, operatingNow, operatingIP, myFile, meLoadFile, fso, f 
    fileName = server.mapPath("./SqlIn.Txt") 
    operatingNow = now() 
    operatingIP = request.serverVariables("Remote_Addr") 
    str = operatingNow & " - " & operatingIP & "   " & str 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(fileName) then
            set myFile = fso.openTextFile(fileName, 1)
                set f = fso.getFile(fileName)
                    if f.size > 0 then meLoadFile = myFile.readAll 
                set f = nothing 
            set myFile = nothing 
            set myFile = fso.createTextFile(fileName, true)
                myFile.writeLine(meLoadFile & vbCrLf & str) 
            set myFile = nothing 
        else
            set myFile = fso.createTextFile(fileName, true)
                myFile.writeLine(str) 
            set myFile = nothing 
        end if 
    set fso = nothing 
end function 
%>  


