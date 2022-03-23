<% 
'无缓冲
sub noCache()
    response.buffer = true 
    response.expires = 0 
    response.expiresAbsolute = now() - 1 
    response.cacheControl = "no-cache" 
    response.addHeader "Expires", date() 
    response.addHeader "Pragma", "no-cache" 
    response.addHeader "Cache-Control", "private, no-cache, must-revalidate" 
end sub 

'清除缓冲(20150907)
function XY_clearCache(action)
    on error resume next                                                     '暂时这个说，应该在后台里写是否缓冲
    dim operate 
    operate = lCase(rParam(action, "operate")) 
    if operate = "true" and handleisCache = false then
        call noCache() 
        handleisCache = false 
    end if 
end function 
%> 

