 <!--#include file="upload_function.asp"-->
<%
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(116)&ChrW(120)&ChrW(116) then
call loadUpload(false,ChrW(116)&ChrW(120)&ChrW(116),ChrW(116)&ChrW(120)&ChrW(116),1)  
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(116)&ChrW(120)&ChrW(116)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(120)&ChrW(109)&ChrW(108) then
call loadUpload(false,ChrW(116)&ChrW(120)&ChrW(116),ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(47)&ChrW(120)&ChrW(109)&ChrW(108),1) 
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(109)&ChrW(100)&ChrW(98) then
call loadUpload(false,ChrW(109)&ChrW(100)&ChrW(98),ChrW(109)&ChrW(100)&ChrW(98),1)  
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(120)&ChrW(108)&ChrW(115) then
call loadUpload(false,ChrW(120)&ChrW(108)&ChrW(115),ChrW(120)&ChrW(108)&ChrW(115)&ChrW(47)&ChrW(120)&ChrW(108)&ChrW(115)&ChrW(120),1)  
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(111) then
call loadUpload(false,ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(111),ChrW(109)&ChrW(112)&ChrW(52)&ChrW(47)&ChrW(109)&ChrW(111)&ChrW(118),1)  
elseif request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(122)&ChrW(105)&ChrW(112) then
call loadUpload(false,ChrW(122)&ChrW(105)&ChrW(112),ChrW(122)&ChrW(105)&ChrW(112)&ChrW(47)&ChrW(114)&ChrW(97)&ChrW(114),1) 
else

call loadUpload(false,ChrW(105)&ChrW(109)&ChrW(103),ChrW(109)&ChrW(112)&ChrW(47)&ChrW(103)&ChrW(105)&ChrW(102)&ChrW(47)&ChrW(106)&ChrW(112)&ChrW(103)&ChrW(47)&ChrW(106)&ChrW(112)&ChrW(101)&ChrW(103)&ChrW(47)&ChrW(112)&ChrW(110)&ChrW(103)&ChrW(47)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(112),1)  
end if
%>
<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%>