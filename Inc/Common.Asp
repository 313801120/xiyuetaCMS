<% 
'常用函数大全 (2013,9,27Option Explicit)
 
'成功永远都是缓慢的 2013,10,4,悟 
 
'显示弹窗对话框20150312 
sub msgBox(byVal content)    
    content = replace(replace(content, chr(10), "\n"), chr(13), "\n") 
    response.write("<script>alert('" & content & "');</"&"script>")  
end sub 
'提示20150729  
sub MBInfo(title, content) 
    call msgBox(title)   
end sub   
'给Queststring赋值  
sub addRq(gookeName, valueStr)  
    response.queryString(gookeName) = valueStr   
end sub  
'ASP自带的跳转
sub rr(url)
    response.redirect(url) 
end sub 
'替换Request.Form对象
function rf(str)
    rf = request.form(str) 
end function 
'获得传值
function rq(str)
    rq = request.queryString(str) 
end function 
'获得传值
function rfq(str)
    rfq = request(str) 
end function 
'处理Post获得内容处理 写入数据库 加强版20160819
function ADSqlRf(inputName)
	dim s
	s=replace(request.form(inputName), "'", "''")
	if EDITORTYPE="jsp" then
		s=replace(s,"\","\\")
	end if 
    ADSqlRf =s & ""
end function 
'处理成Access数据库值   辅助上面   加强版20160819
Function ADSql(valueStr) 
	dim s
	s=replace(valueStr, "'", "''")
	if EDITORTYPE="jsp" then
		s=replace(s,"\","\\")
	end if
    ADSql =s
End Function 
'替换Response.Write对象
sub rw(str)
    response.write(str) 
end sub 
'输出内容加换行
sub rwBr(str)
    response.write(str & vbCrLf) 
end sub 
'替换Response.Write对象 + Response.End()
sub rwEnd(str)
    response.write(str) 
    response.end() 
end sub 
'以pre方式显示  20160928
sub rwPre(content)
	response.Write("<pre>"& replace(content,"<","&lt;") &"</pre>")
end sub
function pre(content)
	pre = "<pre>"& replace(content,"<","&lt;") &"</pre>"
end function
'HTML结束
sub htmEnd(str)
    call rwEnd(str) 
end sub 
'替换Response.Write对象+Response.End()
sub die(str)
    call rwEnd(str) 
end sub 
'替换Response.Write对象
sub debug(str)
    response.write("<div  style=""border:solid 1px #000000;margin-bottom:2px;"">调试" & str & "</div>" & vbCrLf) 
end sub 
'跟踪 
sub trace(str)
    call debug(str) 
end sub 




'回显内容
sub echoPrompt(word, str)
    response.write("<font color=Green>" & word & "</font>：" & str & "<br>") 
end sub 
'回显内容
sub echoStr(word, str)
    call echoPrompt(word, str) 
end sub 
'测试显示信息
sub echo(word, str)
    call echoPrompt(word, str) 
end sub 
'测试显示信息+粗
sub echoB(word, str)
    response.write("<b><font color=Green>" & word & "</font>：" & str & "</b><br>") 
end sub 
'测试显示信息+红色
sub echoRed(word, str)
    response.write("<font color=red>" & word & "</font>：" & str & "<br>") 
end sub 
'测试显示信息+红色+粗
sub echoRedB(word, str)
    response.write("<b><font color=red>" & word & "</font>：" & str & "</b><br>") 
end sub 
'测试显示信息+黄色
sub echoYellow(word, str)
    response.write("<font color=#B38704>" & word & "</font>：" & str & "<br>") 
end sub 
'测试显示信息+黄色+粗
sub echoYellowB(word, str)
    response.write("<b><font color=#B38704>" & word & "</font>：" & str & "</b><br>") 
end sub 
'测试显示信息+蓝色
sub echoBlue(word, str)
    response.write("<font color=blue>" & word & "</font>：" & str & "<br>") 
end sub 
'测试显示信息+蓝色+粗
sub echoBlueB(word, str)
    response.write("<b><font color=blue>" & word & "</font>：" & str & "</b><br>") 
end sub 
'测试显示信息+灰色
sub echoGay(word, str)
    response.write("<font color=#ccc>" & word & "</font>：" & str & "<br>") 
end sub 
'测试显示信息+灰色+粗
sub echoGayB(word, str)
    response.write("<b><font color=#ccc>" & word & "</font>：" & str & "</b><br>") 
end sub 



'打印数组 打印PHP里用到  打印 [0] => aa [1] => bb [2] => cc
sub print_R(arrArray)
    dim i, c  
    if typeName(arrArray) = "Variant()" then
        for i = 0 to uBound(arrArray)
            c = c & "[" & i & "] => " & arrArray(i) & vbCrLf 
        next 
    else
        c = arrArray 
    end if 
    response.write(c) 
end sub 
'测试显示信息 颜色
sub setColorEcho(color, word, str)
    response.write("<font color=" & color & ">" & word & "</font>：" & str & "<br>") 
end sub 
'测试显示信息暂停
sub eerr(word, str)
    'Response.Write(TypeName(Word) & "-" & TypeName(Str)):Response.End()
    response.write("<font color=red>" & word & "</font>：" & str) 
    response.end() 
end sub 
'立即回显内容
sub doEvents()
    response.flush() 
end sub 
'功能:ASP里的IIF 如：IIF(1 = 2, "a", "b")
function IIF(bExp, sVal1, sVal2)
    if(bExp) then IIF = sVal1 else IIf = sVal2 
end function 
'Hr
sub hr()
    response.write("<hr size='1' color='#666666'> ") 
end sub 
'BR 20160517
sub br()
    response.write("<br/>") 
end sub 

'输出字符串 引用别人20141217
'Public Sub Echo(ByVal s) : Response.Write(s) : End Sub
'输出字符串和一个换行符
sub print(byVal s)
    response.write(s & vbCrLf) : response.flush() 
end sub 
'输出字符串和一个html换行符
sub println(byVal s)
    response.write(s & "<br />" & vbCrLf) : response.flush() 
end sub 
'输出字符串并将HTML标签转为普通字符
sub printHtml(byVal s)
    response.write(replace(replace(s, "<", "&lt;"), ">", "&gt;") & vbCrLf)  
end sub
sub printlnHtml(byVal s) 
    response.write(replace(replace(s, "<", "&lt;"), ">", "&gt;") & "<br />" & vbCrLf)  
end sub 
'将任意变量直接输出为字符串(Json格式)
'Public Sub PrintString(ByVal s) : Response.Write(Str.ToString(s) & VbCrLf) : End Sub
'Public Sub PrintlnString(ByVal s) : Response.Write(Str.ToString(s)) & "<br />" & VbCrLf : End Sub
'输出经过格式化的字符串
'Public Sub PrintFormat(ByVal s, ByVal f) : Response.Write(Str.Format(s, f)) & VbCrLf : End Sub
'Public Sub PrintlnFormat(ByVal s, ByVal f) : Response.Write(Str.Format(s, f)) & "<br />" & VbCrLf : End Sub
'输出字符串并终止程序运行
sub printEnd(byVal s)
    response.write(s) : response.end() 
end sub
 



'判断是否一样，一样返回checked,否者返回空值
function setIsChecked(byVal str, byVal str2)
	setIsChecked=IIF(str = str2,"checked='checked'","")  
end function 
'判断是否一样，一样返回selected,否者返回空值 
function setIsSelected(byVal str, byVal str2)
	setIsSelected=IIF(str = str2,"selected='selected'","") 
end function  

'处理错误信息 If Err Then call doError(Err.Description, "Msg")
sub doError(s, msg)
    'On Error Resume Next
    dim nRnd, c 
    randomize 
    nRnd = cint(rnd() * 29252) '29252888
    c = "<br />" 
    c = c & "<div style=""width:100%; font-size:12px;;line-height:150%"">" 
    c = c & "  <label onClick=""ERRORDIV" & nRnd & ".style.display=(ERRORDIV" & nRnd & ".style.display=='none'?'':'none')"">" 
    c = c & "  <span style=""background-color:#820222;color:#FFFFFF;height:23px;font-size:14px;cursor:pointer"">〖 出错 提示信息 ERROR 〗</span><br />" 
    c = c & "  </label>" 
    c = c & "  <div id=""ERRORDIV" & nRnd & """ style=""width:100%;border:1px solid #820222;padding:5px;overflow:hidden;"">" 
    c = c & " <span style=""color:#FF0000;"">出错描述</span> " & s & "<br />" 
    c = c & " <span style=""color:#FF0000;"">回显信息</span> " & msg & "<br />" 
    c = c & "  </div>" 
    c = c & "</div>" 
    c = c & "<br />" 
    response.write(c) 
    response.end()                                                                  '终止，程序停止
end sub 

'执行ASP脚本
function exec(byVal tStr)
    if tStr = "" then exit function : end if 
    on error resume next 
    execute(tStr) 
    on error goto 0 
end function 


'处理内容里QQ表情20230226'
function handleBodyQQFace(c)
  dim i
  for i=1 to 75
    c=replace(c,"[em_"& i  &"]","<img src='/images/qqface/"& i & ".png' style='vertical-align:middle;margin-left:5px;margin-right:5px' title='"& getQQFaceDescribe(i) &"'>")
  next
  handleBodyQQFace=c
end function
function getQQFaceDescribe(i)
    dim splxx
    splxx=split("微笑，撇嘴，色，发呆，得意，流泪，害羞，闭嘴，睡，大哭，尴尬，发怒，调皮，呲牙，惊讶，难过，酷，冷汗，抓狂，吐，偷笑，可爱，白眼，傲慢，饥饿，困，惊恐，流汗，憨笑，悠闲，奋斗，咒骂，疑问，嘘，晕，折磨，衰，骷髅，敲打，再见，擦汗，抠鼻，鼓掌，臭大了，坏笑，左哼哼，右哼哼，哈欠，鄙视，委屈，快哭了，阴险，右亲亲，左亲亲，吓，可伶，眨眼睛，笑哭，doge，泪奔，无奈，托腮，卖萌，斜眼笑，喷血，惊喜，骚扰，小纠结，我最美，加油必胜，口罩护体，搬砖中","，")
    
    if ubound(splxx)>=i-1 then
        getQQFaceDescribe=splxx(i-1)
    else
        getQQFaceDescribe="无"
    end if
end function
%>   

