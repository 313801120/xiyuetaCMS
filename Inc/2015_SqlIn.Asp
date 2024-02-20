<% 
'--------版权说明------------------
'Author:小云
'QQ:313801120
'E-Mail:313801120@qq.com



'--------定义部份------------------
sub sqlIn(paramList)
    ' call echo("id",request("id"))
    dim strIn, splStr, i, j,c,s,param
    '自定义需要过滤的字串,用 "|" 分隔
    strIn = "'|;|and|(|)|exec|insert|select|delete|update|count|*|chr|mid|master|truncate|char|declare" 
    splStr = split(strIn, "|")                                                      '--------Post部份------------------
    if request.queryString <> "" then
        for each param in request.queryString
            if instr("|"& paramList &"|","|"& lcase(param) &"|")>0 or paramList="*" then
                ' call echo("param",param)
                for i = 0 to uBound(splStr)
                    c=" "& lCase(request.queryString(param)) &" "
                    s=" "& splStr(i) &" "
                    ' call echo("c",c)
                    ' call echo("s",s)
                    '比较'
                    if inStr(c, s) <> 0 then
                        call saveSqlInInfo("Get",splStr(i)) 
                        call eerr("Get注入", "你的IP[" & getIP & "]已被收录") 
                    end if 
                next 
            end if
        next 
    end if 

    '--------Get部份------------------
    if request.form <> "" then
        ' call echo("request.form",request.form)
        for each param in request.form
            ' call echo("param",param)
            if instr("|"& paramList &"|","|"& lcase(param) &"|")>0 or paramList="*" then
                for i = 0 to uBound(splStr)
                    c=" "& lCase(request.form(param)) &" "
                    s=" "& splStr(i) &" "
                    ' call echo("c",c)
                    ' call echo("s",s)
                    if inStr(c, s) <> 0 then
                        call saveSqlInInfo("Post",splStr(i)) 
                        call eerr("Post注入", "你的IP[" & getIP & "]已被收录") 
                    end if 
                next 
            end if
        next 
    end if 
    '--------Cookies部份------------------


'等开发
end sub 
'保存Sqlin注入
function saveSqlInInfo(getOrPost,str)
    dim fileName, operatingNow, operatingIP, myFile, meLoadFile, fso, f 
    fileName = server.mapPath("/sqlin.txt") 
    operatingNow = now() 
    operatingIP = request.serverVariables("Remote_Addr") 
    str = operatingNow & " - " & operatingIP & " - "& getOrPost &"   " & str & "   " & getThisUrl()
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(fileName) then
            set myFile = fso.openTextFile(fileName, 1)
                set f = fso.getFile(fileName)
                    if f.size > 0 then meLoadFile = myFile.readAll 
                set f = nothing 
            set myFile = nothing 
            set myFile = fso.createTextFile(fileName, true)
                myFile.writeLine(meLoadFile & str) 
            set myFile = nothing 
        else
            set myFile = fso.createTextFile(fileName, true)
                myFile.writeLine(str) 
            set myFile = nothing 
        end if 
    set fso = nothing 
end function 
%>  


