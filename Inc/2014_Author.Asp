<% 
'关于作者信息
sub aboutAuthor()
    dim c 
    c = c & "<pre>" & vbCrLf 
    c = c & "作者：xiyuetaCOM" & vbCrLf 
    c = c & "联系方式" & vbCrLf 
    c = c & "QQ：313801120" & vbCrLf 
    c = c & "邮箱：313801120@qq.com" & vbCrLf 
    c = c & "微信：mq313801120" & vbCrLf 
    c = c & "交流群35915100(群里已有几百人)" & vbCrLf  
    c = c & "" & vbCrLf 
    c = c & "业务及特长" & vbCrLf 
    c = c & "精通ASP,PHP,VB程序开发，独立开发出一套ASP网站后台和VB辅助软件。" & vbCrLf 
    c = c & "熟练掌握HTML、DIV、CSS、JS" & vbCrLf 
    c = c & "熟练使用Dreamweaver、Fireworks、 Flash、Photoshop等软件" & vbCrLf    
    c = c & "自觉PHP、Android等编程语言" & vbCrLf 
    c = c & "" & vbCrLf 
    c = c & "" & vbCrLf 
    c = c & "自我评价" & vbCrLf 
    c = c & "自学能力强、新知识接受快、勇于面对困难，敢于挑战。" & vbCrLf 

    c = c & "</pre>" & vbCrLf 
    response.write(c) : response.end() 
end sub 

'作者信息
function authorInfo(fileInfo)
    authorInfo = handleAuthorInfo(fileInfo, "asp") 
end function 
'处理作者信息
function handleAuthorInfo(fileInfo, sType)
    dim c, phpS, aspS 
    if sType = "php" then
        phpS = "/" 
    else
        aspS = "'" 
    end if 
    c = aspS & phpS & "************************************************************" & vbCrLf 
    if fileInfo <> "" then c = c & aspS & "  文件：" & fileInfo & vbCrLf 
    c = c & aspS & "作者：xiyuetaCOM 【精通ASP/PHP/ASP.NET/VB/JS/Android/Flash，交流/合作可联系)" & vbCrLf 
    c = c & aspS & "版权：源代码免费公开，各种用途均可使用。 " & vbCrLf 
    c = c & aspS & "创建：" & format_Time(now(), 2) & vbCrLf 
    c = c & aspS & "联系：QQ313801120  交流群35915100(群里已有几百人)    邮箱313801120@qq.com   个人主页 xiyueta.com" & vbCrLf 
    c = c & aspS & "更多帮助，文档，更新　请加群(35915100)或浏览(xiyueta.com)获得" & vbCrLf 
    c = c & aspS & "*                                    Powered by PAAJCMS " & vbCrLf 
    c = c & aspS & "************************************************************" & phpS & vbCrLf 
    handleAuthorInfo = c 
end function 


function authorInfo2()
    dim c 
    c = "                '''" & vbCrLf 
    c = c & "               (0 0)" & vbCrLf 
    c = c & "   +-----oOO----(_)------------+" & vbCrLf 
    c = c & "   |                           |" & vbCrLf 
    c = c & "   |    让我们一起来体验       |" & vbCrLf 
    c = c & "   |    QQ:313801120           |" & vbCrLf 
    c = c & "   |    xiyueta.com         |" & vbCrLf 
    c = c & "   |                           |" & vbCrLf 
    c = c & "   +------------------oOO------+" & vbCrLf 
    c = c & "              |__|__|" & vbCrLf 
    c = c & "               || ||" & vbCrLf 
    c = c & "              ooO Ooo" & vbCrLf 

    authorInfo2 = c 
end function 
%>  

