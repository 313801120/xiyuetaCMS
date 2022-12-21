<%

'Css压缩 cssCompression(Content,0)
function cssCompression(content, nLevel) 
    'Css高级压缩
    if nLevel = 1 then
        content = regExp_Replace(content, "\/\*(.|" & vbCrLf & ")*?\*\/", "") 
        content = regExp_Replace(content, "\s*([\{\}\:\;\,])\s*", "$1") 
        content = regExp_Replace(content, "\,[\s\.\#\d]*\{", "{") 
        content = regExp_Replace(content, ";\s*;", ";") 
    'Css简单压缩
    else
        if nLevel >= 2 then
            content = regExp_Replace(content, "\/\*(.|" & vbCrLf & ")*?\*\/", "")           '//删除注释
        end if 
        content = regExp_Replace(content, "\s*([\{\}\:\;\,])\s*", "$1") 
        content = regExp_Replace(content, "\,[\s\.\#\d]*\{", "{")                  '//容错处理
        content = regExp_Replace(content, ";\s*;", ";")                                 '//清除连续分号
        content = regExp_Replace(content, ";\s*}", "}")                                 '//清除末尾分号和大括号
        content = regExp_Replace(content, "([^\s])\{([^\s])", "$1{$2") 
        content = regExp_Replace(content, "([^\s])\}([^" & vbCrLf & "]s*)", "$1}" & vbCrLf & "$2") 

    end if 
    content = trimVBcrlf(content) 
    cssCompression = content 
end function 

'删除Css里注释
function deleteCssNote(content)
    deleteCssNote = regExp_Replace(content, "\/\*(.|" & vbCrLf & ")*?\*\/", "")     '//删除注释
end function 

'Css格式化  展开CSS
function unCssCompression(content)
    content = regExp_Replace(content, "\s*([\{\}\:\;\,])\s*", "$1") 
    content = regExp_Replace(content, ";\s*;", ";")                                 '//清除连续分号
    content = regExp_Replace(content, "\,[\s\.\#\d]*{", "{") 
    content = regExp_Replace(content, "([^\s])\{([^\s])", "$1 {" & vbCrLf & "" & "    " & "$2") 'vbTab 替换成4个空格 
    content = regExp_Replace(content, "([^\s])\}([^" & vbCrLf & "]*)", "$1" & vbCrLf & "}" & vbCrLf & "$2") 
    content = regExp_Replace(content, "([^\s]);([^\s\}])", "$1;" & vbCrLf & "" & "    " & "$2")     'vbTab 替换成4个空格 
    unCssCompression = content 
end function

'去掉字符串头尾的连续的回车和空格
function trimVbCrlf(str)
    trimVbCrlf = phpRTrim(phpLTrim(str)) 
end function 

'php里Trim方法
function phpTrim(str)
    phpTrim = trimVbCrlf(str) 
end function 

'去掉字符串开头的连续的回车和空格 改进于20171207
function phpLTrim(byval str)
    dim nLen,n,i,s
    if isnul(str) then 
        phpLTrim=""
        exit function
    end if

    nLen = len(str)
    n=0
    for i=1 to nLen
        s=left(str,1)
        if s=" " or s=vbTab or s=chr(10) or s=chr(13) then
            str=mid(str,2)
        elseif s=vbcrlf then
            str=mid(str,3)
        else
            exit for
        end if
    next  
    phpLTrim=str
end function 

'去掉字符串末尾的连续的回车和空格 改进于20171207
function phpRTrim(byval str)
    dim nLen,n,i,s
    nLen = len(str)
    n=0
    for i=1 to nLen
        s=right(str,1)
        if s=" " or s=vbTab or s=chr(10) or s=chr(13) then
            str=mid(str,1,len(str)-1)
        elseif s=vbcrlf then
            str=mid(str,1,len(str)-2)
        else
            exit for
        end if
    next  
    phpRTrim=str
end function 
%>