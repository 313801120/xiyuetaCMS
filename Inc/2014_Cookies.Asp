<% 
sub setApp(appName, appData)
    application.lock 
    application.contents.item(appName) = appData 
    application.unlock 
end sub 
function getApp(appName)
    if appName = "" then getApp = "" : exit function 
    getApp = application.contents.item(appName) 
end function 
sub removeApp(appName)
    application.lock 
    application.contents.remove(appName) 
    application.unlock 
end sub 


'设置cookie(20151120)
function setCookie(cookieName, cookieValue, nAddMinutes)
    response.cookies(cookieName) = cookieValue 
    response.cookies(cookieName).expires =dateAdd("s",nAddMinutes, now())	'now + 0.00001*nAddMinutes    '加多少秒
end function 
'获得cookie值
function getCookie(byVal cookieName)
    getCookie = request.cookies(cookieName) 
end function 
'移除cookie
function removeCookie(byVal cookieName)
    response.cookies(cookieName) = empty 
    response.cookies(cookieName).expires = now() 
end function 
'清除cookie
function clearCookie(byVal cookieName)
    removeCookie(cookieName) 
end function 
'清除cookie
function deleteCookie(byVal cookieName)
    removeCookie(cookieName) 
end function 
 
 
'session
'设置Session
sub setSession(sessionName,sessionValue)
	Session(sessionName)=sessionValue
end sub
'获得Session
function getSession(sessionName)
	getSession=Session(sessionName)
end function
'删除Session
sub deleteSession(sessionName)
	Session(sessionName)=""
end sub
%> 
  
