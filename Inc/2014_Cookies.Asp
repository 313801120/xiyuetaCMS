<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 
sub setApp(a, b)
application.lock 
application.contents.item(a) = b 
application.unlock 
end sub 
function getApp(a)
if a = "" then getApp = "" : exit function 
getApp = application.contents.item(a) 
end function 
sub removeApp(a)
application.lock 
application.contents.remove(a) 
application.unlock 
end sub 

function setCookie(a, b, c)
response.cookies(a) = b 
response.cookies(a).expires =dateAdd(ChrW(115),c, now())
end function 

function getCookie(byVal a)
getCookie = request.cookies(a) 
end function 

function removeCookie(byVal a)
response.cookies(a) = empty 
response.cookies(a).expires = now() 
end function 

function clearCookie(byVal a)
removeCookie(a) 
end function 

function deleteCookie(byVal a)
removeCookie(a) 
end function 


sub setSession(a,b)
Session(a)=b
end sub

function getSession(a)
getSession=Session(a)
end function

sub deleteSession(a)
Session(a)=""
end sub
%> 
