<% 
'Check验证 (2013,10,26)

'检测URL文件名称是否带参数，如:.js?  .css?  用法 checkUrlFileNameParam("http://sdfsd.com/aaa.js","js|css|")  
function checkUrlFileNameParam(httpurl, sList)
    dim url, splStr, searchStr 
    url = lcase(httpurl) 
    sList = lcase(sList) 
    splStr = split(sList, "|") 
    for each searchStr in splStr
        if searchStr <> "" then
            searchStr = "." & searchStr & "?" 
            'call echo("searchStr",searchStr)
            if inStr(url, searchStr) > 0 then 
                checkUrlFileNameParam = true 
                exit function 
            end if 
        end if 
    next 
    checkUrlFileNameParam = false 
end function 

'是大写 20160105
function isUCase(content)
    dim i, s 
    isUCase = true 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr("ABCDEFGHIJKLMNOPQRSTUVWXYZ", s) = false then
            isUCase = false 
            exit function 
        end if 
    next 
end function 
'是小写 20160105
function isLCase(content)
    dim i, s 
    isLCase = true 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr("abcdefghijklmnopqrstuvwxyz", s) = false then
            isLCase = false 
            exit function 
        end if 
    next 
end function 


'检测错误
sub checkErr(errMsg)
    if err.number <> 0 then
        call echo(err.number, "自定义错误信息：" & errMsg & "<br>系统错误信息：" & err.description & "<br>最初生成错误的对象或应用程序的名称：" & err.source) 
    end if 
end sub 

'把字符true转真类型 false转假类型
function strToTrueFalse(byVal content)
    content = trim(LCase(content)) 
    strToTrueFalse = IIF(content = "true", true, false) 
end function 
'把字符true转1类型 false转0类型
function strTrueFalseToInt(byVal content)
    content = trim(LCase(content)) 
    strTrueFalseToInt = IIF(content = "true", 1, 0) 
end function 
'检查换行
function checkVbCrlf(content)
    checkVbCrlf = false 
    if inStr(content, vbCrLf) > 0 then checkVbCrlf = true 
	
end function 
'检查换行    辅助
function checkBr(content)
    checkBr = checkVbCrlf(content) 
end function 

'判断数字奇偶
function isParity(numb)
    isParity = true
    if not isNumeric(numb) then				'【@不是asp屏蔽@】 
        isParity = "这不是一个数字啊" '【@不是asp屏蔽@】 
        exit function '【@不是asp屏蔽@】 
    end if '【@不是asp屏蔽@】 
    if numb mod 2 = 0 then
        isParity = false  
    end if 
end function 
'检测eval正确性
function checkEval(content)
    on error resume next 
    call execute(content) 
    if err.number = 0 then
        checkEval = true 
    else
        checkEval = false 
    end if 
end function 
'********************************************************
'过滤SQL非法字符并格式化html代码
'********************************************************
function replace_SQLText(fString)
        replace_SQLText = "" 
    if isNull(fString) then
        exit function 
    else
        fString = trim(fString) 
        fString = replace(fString, "'", "''") 
        fString = replace(fString, ";", "；") 
        fString = replace(fString, "--", "—")  
        fString = displayHtml(fString) 
        replace_SQLText = fString 
    end if 
end function 
'********************************************************
'检查是否外部提交数据
'********************************************************
function chkPost()
    dim server_v1, server_v2  
    chkPost = false 
    server_v1 = CStr(request.serverVariables("HTTP_REFERER")) 
    server_v2 = CStr(request.serverVariables("SERVER_NAME")) 
    call echo(server_v1, server_v2) 
    if mid(server_v1, 8, len(server_v2)) <> server_v2 then
        chkPost = false 
    else
        chkPost = true 
    end if 
end function 

 
'验证手机号码
function isValidMobileNo(MobileNo)
    dim regEx
    set regEx = createObject("VBscript.RegExp")
    regEx.Pattern = "^1\d{10}$"						'待改进
    isValidMobileNo=regEx.test(MobileNo)
end function 
'Response.Write(IsMail("asdf@sdf.com"))
'正则表达验证邮箱
function isMail(email)
    isMail = true 
    dim rep 
    set rep = createObject("VBscript.RegExp")
        rep.pattern = "([\.a-zA-Z0-9_-]){2,10}@([a-zA-Z0-9_-]){2,10}(\.([a-zA-Z0-9]){2,}){1,4}$" 
        isMail = rep.test(email) 
    set rep = nothing 
end function 
'邮箱验证第二种
function isValidEmail(email)
    dim splNames, sName, i, c 
    isValidEmail = true 
    splNames = split(email, "@") 
    if uBound(splNames) <> 1 then isValidEmail = false : exit function 
    for each sName in splNames
        if len(sName) <= 0 then isValidEmail = false : exit function 
        for i = 1 to len(sName)
            c = LCase(mid(sName, i, 1)) 
            if inStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not isNumeric(c) then isValidEmail = false : exit function 
        next 
        if left(sName, 1) = "." or right(sName, 1) = "." then isValidEmail = false : exit function 
    next 
    if inStr(splNames(1), ".") <= 0 then isValidEmail = false : exit function 
    i = len(splNames(1)) - inStrRev(splNames(1), ".") 
    if i <> 2 and i <> 3 then isValidEmail = false : exit function 
    isValidEmail=IIF(inStr(email, "..") > 0,false,true) 
	
	
end function 
'检测为有效字符
function isCode(byVal content)
    dim c 
    c = replace(content, " ", "") 
    c = replace(c, chr(13), "") 
    c = replace(c, chr(10), "") 
    c = replace(c, vbTab, "") 
    isCode = IIF(c <> "", true, false) 
end function 
'测试是否为数字
function checkNumber(byVal content)
    dim i, s 
    checkNumber = true 
    if len(content) = 0 then checkNumber = false : exit function 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr("0123456789", LCase(s)) = false then
            checkNumber = false 
            exit function 
        end if 
    next 
end function 
'测试是否为数字 (辅助)
function isNumber(byVal content)
    isNumber = checkNumber(content) 
end function 
'测试是否为字母
function checkABC(byVal content)
    dim i, s 
    checkABC = true 
    for i = 1 to len(content)
        s = mid(content, i, 1) 
        if inStr("abcdefghijklmnopqrstuvwxyz", LCase(s)) = false then
            checkABC = false 
            exit function  
        end if 
    next 
end function 
'获得字符长度 汉字算两个字符
function getLen(content)
    dim i, nS, n 
    n = 0 
    for i = 1 to len(content)
        nS = asc(mid(CStr(content), i, 1)) 
        if nS < 0 then
            n = n + 2 
        else
            n = n + 1 
        end if 
    next 
    getLen = n 
end function 
'测试是否为时间类型
function checkTime(sTime)
    checkTime = IIF(isDate(sTime) = false, false, true) 
end function 
'判断是否为空
function isNul(byVal s)
    on error resume next : if err.number <> 0 then err.clear 
    isNul = false 
    select case varType(s)
        case vbEmpty, vbNull
            isNul = true : exit function 
        case vbString
            if s = "" then isNul = true : exit function 
        case vbObject
            select case typeName(s)
                case "Nothing", "Empty"
                    isNul = true : exit function 
                case "Recordset"
                    if s.state = 0 then isNul = true : exit function 
                    if s.BOF and s.EOF then isNul = true : exit function 
                case "Dictionary"
                    if s.count = 0 then isNul = true : exit function 
            end select
    case vbArray, 8194, 8204, 8209
        if uBound(s) = -1 then isNul = true : exit function 
    end select 
    on error goto 0 
end function 


'****************************************************
'函数名：FoundInArr
'作  用：检查一个数组中所有元素是否包含指定字符串
'时  间：2011年10月13日
'参  数： strArr
'strToFind
'strSplit
'返回值：字符串
'调  试：SHtml=R_("{测试}",Function FoundInArr(strArr, strToFind, strSplit))
'****************************************************
function foundInArr(strArr, strToFind, strSplit)
    dim arrTemp, i 
    foundInArr = false 
    if inStr(strArr, strSplit) > 0 then
        arrTemp = split(strArr, strSplit) 
        for i = 0 to uBound(arrTemp)
            if LCase(trim(arrTemp(i))) = LCase(trim(strToFind)) then
                foundInArr = true : exit for 
            end if 
        next 
    else
        if LCase(trim(strArr)) = LCase(trim(strToFind)) then foundInArr = true 
    end if 
end function 
%>   
