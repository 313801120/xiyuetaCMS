<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "createAspAdmin.Asp"-->
<!--#Include file = "function_make_configActionPage.Asp"-->
<!--#Include file = "asp_action_page_function_txt_template_replace.asp"-->
<!--#Include file = "asp_action_page_function_txt_layout_action.asp"-->
<script  language="javascript" runat="server" src="asp.xiyueta.min.js"></script> 
<script language="javascript" runat="server">
//处理生成asp代码，
function handleMakeASPCode(sHtml,sConfig){
if(sConfig=='|'||sConfig==''){
return sHtml;
}
xiyuetaASP.load(sHtml); 
console.log("sConfig",sConfig)
if(sConfig.indexOf("|functionParamBlur|")!=-1 && sConfig.indexOf("|functionVarBlur|")!=-1){ //函数参数变量混淆
xiyuetaASP("*").functionBlur()
}else if(sConfig.indexOf("|functionParamBlur|")!=-1 ){ //函数参考混淆
xiyuetaASP("*").functionParamBlur()
}else if( sConfig.indexOf("|functionVarBlur|")!=-1){ //函数变量混淆
xiyuetaASP("*").functionVarBlur()
}
if( sConfig.indexOf("|globalFunctionNameBlur|")!=-1){ //全局函数混淆
xiyuetaASP.globalFunctionNameBlur()
}
if( sConfig.indexOf("|globalVarBlur|")!=-1){  //全局变量混淆
xiyuetaASP.globalVarBlur()
}
if( sConfig.indexOf("|zip|")!=-1){  //代码压缩，要左右tab和空格
var c=xiyuetaASP.html("zip")
}else if( sConfig.indexOf("|delnote|")!=-1){  //删除asp代码里的注释
var c=xiyuetaASP.html("delnote")
}else{
var c=xiyuetaASP.html("")
}
// alert(c)
return c;
}
//替换conn到thisConn
function replaceConnToThisConn(sHtml){
xiyuetaASP.load(sHtml); 
xiyuetaASP.globalVarReplace("conn,db_PREFIX","thisConn,this_db_PREFIX");  //表前缀也替换掉
xiyuetaASP.globalReplaceFunctionName("conn.execute ","thisConn.execute");
return xiyuetaASP.html("")
}
</script>
<%
dim thisConn:Set thisConn = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
call selectOpenConn(thisConn)
Set conn = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
selectOpenConn(conn)

call echo(ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49),thisConn)
call echo(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110),conn)
if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))="" then
call eerr(ChrW(25552)&ChrW(31034),ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(39)&ChrW(47)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(47)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(39)&ChrW(62)&ChrW(35831)&ChrW(20808)&ChrW(30331)&ChrW(24405)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)) 
end if
dim id,sql,this_configNameList,this_lineEditList,this_listPage,this_AddPage,this_ViewPage,this_English,this_AddPageViewField,fieldConfig,thisFieldType,rssFieldName,replaceOpenConnC,addtoinput,listpage_table_button_html,listpage_table_action_html,listpage_table_action_js,listpage_top_form_html
dim this_TableName,this_InputCheck,sMaoHao,this_configTypeList,isInputCheck,this_addEditTip,this_DefaultValue,this_listPage_Form_JS
dim listpage_table_toolbar_menu,this_search_parem_submit_js,this_search_parem_request_asp
dim isclickviewdetail:isclickviewdetail=false
id=phptrim(request(ChrW(105)&ChrW(100)))
if id="" then
call echo(ChrW(25552)&ChrW(31034),ChrW(73)&ChrW(68)&ChrW(20026)&ChrW(31354))
end if

sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61) & id
rs.open sql,thisConn,1,1
if rs.eof then
call eerr(ChrW(25552)&ChrW(31034),ChrW(73)&ChrW(68)&ChrW(19981)&ChrW(23384)&ChrW(22312))
end if 

function getLayoutTableButton(a)
dim b,c,d,e,f,g 

b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rsx.open b,thisConn,1,1
call echo(ChrW(115)&ChrW(113)&ChrW(108),b)
if not rsx.eof then
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(68)&ChrW(101)&ChrW(109)&ChrW(111)&ChrW(34)&ChrW(62) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(62)&ChrW(32) & vbcrlf
while not rsx.eof  
e=rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
g=e
f=phptrim(rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)))
if e=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101) then 
if left(f,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then f=mymd5(f)
g=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) & f
e=f
end if
d=""
if rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111)) <>"" then
d=ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111))&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116))&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)
end if 
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(115)&ChrW(109)& IIF(rsx(ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)) <>"",ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(103)&ChrW(45)&rsx(ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))&"","") &ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&g&ChrW(34)&ChrW(62)&d&rsx(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(62) & vbcrlf
call handle_layout_table_button(rsx,g,e,phptrim(rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))))
rsx.movenext:wend 
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62) & vbcrlf
end if:rsx.close
getLayoutTableButton=c
end function

function getLayoutTableAction(a)
dim b,c,d,e,f,g,h,i,j,k,l,m,n,o,p
dim q,r
k=30

b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rst.open b,thisConn,1,1

b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rsx.open b,thisConn,1,1

if not rst.eof or not rsx.eof then
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(39)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(40)&ChrW(100)&ChrW(101)&ChrW(109)&ChrW(111)&ChrW(41)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(24037)&ChrW(20855) & vbcrlf
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(59) & vbcrlf
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(112)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(91)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(93) & vbcrlf
f=f&"" & vbcrlf   
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(68)&ChrW(101)&ChrW(109)&ChrW(111)&ChrW(34)&ChrW(62)&ChrW(32) & vbcrlf
while not rsx.eof  
k=k+rsx(ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)) 
if g <>"" then k=k+5
p=rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
q=phptrim(rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)))
if p=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101) then
if left(q,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then q=handleMD5(q,16)
p=p&ChrW(45) &  q
end if

d=""
if rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111)) <>"" then
d=ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111))&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116))&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)
end if

e=""
if rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101) then
e=ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)
end if

c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(97)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(120)&ChrW(115)& IIF(rsx(ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)) <>"",ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(103)&ChrW(45)&rsx(ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))&"","") &ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&p&ChrW(34)&ChrW(62)&d&rsx(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&e&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62)&ChrW(32) & vbcrlf

g=g&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&IIF(g <>"",ChrW(125)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32),"")&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(40)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(32)&ChrW(39)& p&ChrW(39)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47) & rsx(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & vbcrlf

g=g & handle_layout_table_action(rsx,p,rsx(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),phptrim(rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))))
if rsx(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) then
isclickviewdetail=true
end if

h="":i="":j=""
b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&rsx(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rss.open b,thisConn,1,1
call echo(ChrW(115)&ChrW(113)&ChrW(108),b)
if not rss.eof then
while not rss.eof
call echo(ChrW(23376)&ChrW(31867),rss(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
p=rss(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
q=phptrim(rss(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)))
if p=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101) then  
if left(q,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then q=handleMD5(q,16)
p=p&ChrW(45) & q
end if
if rss(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) then
isclickviewdetail=true
end if

if h <>"" then h=h&vbcrlf & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(44)
h=h & ChrW(123)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)&rss(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(39)&ChrW(44)&ChrW(105)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(39)&p&ChrW(39)&ChrW(125)
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&IIF(i <>"",ChrW(125)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32),"")&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(40)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(32)&ChrW(39)& p&ChrW(39)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47) & rss(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & vbcrlf

i=i & handle_layout_table_action(rss,rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)) & ChrW(45) & p,rss(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),phptrim(rss(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))))
rss.MoveNext:wend
if i <>"" then
i=i & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125) & vbcrlf
end if
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(26356)&ChrW(22810)&ChrW(32)&ChrW(45)&ChrW(32)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(123) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(44)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(35302)&ChrW(21457)&ChrW(20107)&ChrW(20214)&ChrW(30340)&ChrW(32)&ChrW(68)&ChrW(79)&ChrW(77)&ChrW(32)&ChrW(23545)&ChrW(35937) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(22806)&ChrW(37096)&ChrW(20107)&ChrW(20214)&ChrW(35302)&ChrW(21457)&ChrW(21363)&ChrW(26174)&ChrW(31034) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(58)&ChrW(32)&ChrW(91)&h&ChrW(93)&ChrW(44) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(58)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(41)&ChrW(123)&ChrW(32) & vbcrlf
j=j&i & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(44) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(21491)&ChrW(23545)&ChrW(40784)&ChrW(24377)&ChrW(20986) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(45)&ChrW(115)&ChrW(104)&ChrW(97)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(49)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(114)&ChrW(103)&ChrW(98)&ChrW(40)&ChrW(48)&ChrW(32)&ChrW(48)&ChrW(32)&ChrW(48)&ChrW(32)&ChrW(47)&ChrW(32)&ChrW(49)&ChrW(50)&ChrW(37)&ChrW(41)&ChrW(59)&ChrW(39)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(35774)&ChrW(32622)&ChrW(39069)&ChrW(22806)&ChrW(26679)&ChrW(24335) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41) & vbcrlf
g=g&j
end if:rss.close 
rsx.movenext:wend 
while not rst.eof
b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rst(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))
rsd.open b,thisConn,1,1
if not rsd.eof then  
if phptrim(rst(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108)))="" then
r=ChrW(34920)&this_TableName&ChrW(44)&ChrW(23383)&ChrW(27573) & rsd(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)) & ChrW(28857)&ChrW(20987)&ChrW(24320)&ChrW(21551)&ChrW(65292)&ChrW(20294)&ChrW(27809)&ChrW(26377)&ChrW(37197)&ChrW(32622)
call echoRedB(ChrW(101)&ChrW(114)&ChrW(114)&ChrW(111)&ChrW(114)&ChrW(25552)&ChrW(31034)&r,ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&r&ChrW(39)&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62))
else

g=g&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&IIF(g <>"",ChrW(125)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32),"")&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(40)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(32)&ChrW(39)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(95)& lcase(rsd(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))&ChrW(39)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47) & rsd(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & vbcrlf
o=ChrW(39)&rsd(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(39)
l=split(rst(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108)),ChrW(91)&ChrW(45)&ChrW(93))
m=ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(51)
if ubound(l)=0 then
n=l(0)
elseif ubound(l)=1 then
if l(0) <>"" then o=replace(l(0),ChrW(42),rsd(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
n=l(1)
elseif ubound(l)=2 then
if l(0) <>"" then m=l(0)
if l(1) <>"" then o=replace(l(1),ChrW(42),rsd(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
n=l(2)
end if
call echo(ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),rsd(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))
call echo(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108),rst(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(117)&ChrW(114)&ChrW(108)))
doevents
if l(0)=ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107) then
g=g&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(40)&n&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(39)&ChrW(41)&ChrW(59) & vbcrlf 
else
g=g&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&m&ChrW(40)&o&ChrW(44)&ChrW(32)&n&ChrW(41)&ChrW(32)&ChrW(32)&ChrW(32) & vbcrlf
end if
end if
end if:rsd.close
rst.movenext:wend 
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62) & vbcrlf
f=f & g & vbcrlf


f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125) & vbcrlf
f=f&"" & vbcrlf
f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41)&ChrW(59)&ChrW(32) & vbcrlf
if rsx.recordcount>0 then
public_listpage_table_option_js=ChrW(44)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(25805)&ChrW(20316)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58)&ChrW(32)&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&ChrW(105)&ChrW(115)&ChrW(77)&ChrW(111)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(44)&ChrW(56)&ChrW(52)&ChrW(44)&k&ChrW(41)&ChrW(37)&ChrW(62)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(35)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(68)&ChrW(101)&ChrW(109)&ChrW(111)&ChrW(39)&ChrW(32)&ChrW(125) 
end if
end if:rsx.close:rst.close
listpage_table_action_js=f
getLayoutTableAction=c
end function

function getLayoutTableToolbar(a)
dim b,c,d,e,f,g,h,i,j,k,l
dim m

b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(45)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rsx.open b,thisConn,1,1
call echo(ChrW(115)&ChrW(113)&ChrW(108),b)
if not rsx.eof then  
while not rsx.eof  
call echo(ChrW(105),rsx(ChrW(105)&ChrW(100)))
i=phptrim(rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)))
l=i
j=phptrim(rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)))
if i=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101) then 
if left(j,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then 
j=handleMD5(j,16)  
end if
l=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) & j
i=j
end if
if e <>"" then e=e &ChrW(44)&vbcrlf
if i=ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114) or i=ChrW(101)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(115) or i=ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116) then
e=e&ChrW(39)&i&ChrW(39)
else
e=e & ChrW(123)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(39)&rsx(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(39)&ChrW(44)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(69)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(58)&ChrW(39)&l&ChrW(39)&ChrW(44)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(58)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111))&ChrW(39)&ChrW(125)
end if

f="":g="":h=""
b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&rsx(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rss.open b,thisConn,1,1
call echo(ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&rss.recordcount,b)
if not rss.eof then
while not rss.eof
call echo(ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(23376)&ChrW(31867),rss(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
k=phptrim(rss(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)))
m=k
j=phptrim(rss(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)))
if k=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101) then 
if left(j,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then 
j=handleMD5(j,16)  
end if
m=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) & j
k=j
end if

if f <>"" then f=f&vbcrlf&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(44)
if k=ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101) then
f=f & ChrW(123)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)&rss(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(39)&ChrW(44)&ChrW(105)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(39)&m&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(125)
else
f=f & ChrW(123)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)&rss(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(39)&ChrW(44)&ChrW(105)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(39)&m&ChrW(39)&ChrW(125)
g=g&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&IIF(g <>"",ChrW(125)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32),"")&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(40)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(32)&ChrW(39)& m&ChrW(39)&ChrW(41)&ChrW(32)&ChrW(123) & vbcrlf 
g=g & handle_layout_table_toolbar_small(k,phptrim(rss(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))))
end if
rss.MoveNext:wend
if g <>"" then
g=g & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125) & vbcrlf
end if
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(26356)&ChrW(22810)&ChrW(32)&ChrW(45)&ChrW(32)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(123) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(44)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(35302)&ChrW(21457)&ChrW(20107)&ChrW(20214)&ChrW(30340)&ChrW(32)&ChrW(68)&ChrW(79)&ChrW(77)&ChrW(32)&ChrW(23545)&ChrW(35937) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(22806)&ChrW(37096)&ChrW(20107)&ChrW(20214)&ChrW(35302)&ChrW(21457)&ChrW(21363)&ChrW(26174)&ChrW(31034) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(58)&ChrW(32)&ChrW(91)&f&ChrW(93)&ChrW(44) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(58)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(117)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(41)&ChrW(123)&ChrW(32) & vbcrlf
h=h&g & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(44) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(21491)&ChrW(23545)&ChrW(40784)&ChrW(24377)&ChrW(20986) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(45)&ChrW(115)&ChrW(104)&ChrW(97)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(49)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(32)&ChrW(114)&ChrW(103)&ChrW(98)&ChrW(40)&ChrW(48)&ChrW(32)&ChrW(48)&ChrW(32)&ChrW(48)&ChrW(32)&ChrW(47)&ChrW(32)&ChrW(49)&ChrW(50)&ChrW(37)&ChrW(41)&ChrW(59)&ChrW(39)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(35774)&ChrW(32622)&ChrW(39069)&ChrW(22806)&ChrW(26679)&ChrW(24335) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41) & vbcrlf 
end if:rss.close
call handle_layout_table_toolbar(l,i,h,phptrim(rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))))
rsx.movenext:wend  
end if:rsx.close  
getLayoutTableToolbar=e
end function

function getLayoutListPageForm(a)
dim b,c,d,e,f,g,h,i,j,k

b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rsx.open b,thisConn,1,1
call echo(ChrW(115)&ChrW(113)&ChrW(108),b)
if not rsx.eof then 
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(34)&ChrW(62) & vbcrlf
while not rsx.eof  
d=""
if rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111)) <>"" then
d=ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111))&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116))&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)
end if
f=phptrim(rsx(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
g=phptrim(rsx(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)))
k=phptrim(rsx(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)))
if left(k,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then  
k=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101) & handleMD5(k,16)
end if
if f <>""  then
if instr(ChrW(124)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(124)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(124)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(124)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(124),ChrW(124)&rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))&ChrW(124))>0 then
if e <>"" then e=e&ChrW(44)&vbcrlf 
i=ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)

if instr(ChrW(124)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(124)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(124)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(124),ChrW(124)&rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))&ChrW(124))>0 then
i=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)
end if
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&f&ChrW(58)&ChrW(32)&ChrW(36)&ChrW(40)&ChrW(39)&i&ChrW(91)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&f&ChrW(93)&ChrW(39)&ChrW(41)&ChrW(46)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(40)&ChrW(41)



if rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101) then  
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(73)&ChrW(102)&ChrW(32)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)&f&ChrW(34)&ChrW(41)&ChrW(32)&ChrW(60)&ChrW(62)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(84)&ChrW(104)&ChrW(101)&ChrW(110) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(34)&ChrW(44)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(34)&ChrW(41) & vbcrlf

h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&g&""&rsx(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(98)&ChrW(106)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))&ChrW(34)&ChrW(38)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(70)&ChrW(117)&ChrW(72)&ChrW(97)&ChrW(111)&ChrW(40)&ChrW(41)&ChrW(38)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)&f&ChrW(34)&ChrW(41)&ChrW(38)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(70)&ChrW(117)&ChrW(72)&ChrW(97)&ChrW(111)&ChrW(40)&ChrW(41) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(69)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(102)&ChrW(32) & vbcrlf
end if
end if
end if
if rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) then      
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)& IIF(rsx(ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)) <>"",ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(103)&ChrW(45)&rsx(ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))&"","") &ChrW(34)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(45)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(114)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(34)&ChrW(62)&d&rsx(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(62) & vbcrlf
call handle_layout_listpage_form(rsx) 
elseif rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101) then      
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(34)&ChrW(62)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(34)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(34)&ChrW(62) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(34)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&rsx(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(34)&ChrW(32)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(104)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(34)&rsx(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(34)&ChrW(32)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(111)&ChrW(102)&ChrW(102)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(34)&ChrW(62) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf 
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62)&ChrW(32) & vbcrlf
elseif rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116) then 
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(34)&ChrW(62)&ChrW(32)&ChrW(32) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(34)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&rsx(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(100)&ChrW(101)&ChrW(109)&ChrW(111)&ChrW(82)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(34)&ChrW(32)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(111)&ChrW(102)&ChrW(102)&ChrW(34)&ChrW(32)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(104)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(34)&rsx(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(34)&ChrW(32)&ChrW(111)&ChrW(110)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(112)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(40)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(46)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(32)&ChrW(49)&ChrW(51)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(36)&ChrW(40)&ChrW(39)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(45)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(93)&ChrW(39)&ChrW(41)&ChrW(46)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(40)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(125)&ChrW(34)&ChrW(62) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf  
elseif rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101) then   
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(34)&ChrW(62)&ChrW(45)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf    
elseif rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101) or rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116) then    
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(34)&ChrW(62) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&rsx(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&rsx(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(34)&ChrW(32)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(62) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&rsx(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))&ChrW(34)&ChrW(62)&rsx(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62) & vbcrlf

b = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(61)&rsx(ChrW(105)&ChrW(100))&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&a(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rss.open b,thisConn,1,1
call echo(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&rss.recordcount,b)        
while not rss.eof
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&rss(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))&ChrW(34)&ChrW(62)&rss(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(62) & vbcrlf
rss.MoveNext:wend:rss.close
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(62) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf    
elseif rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110) then    
j=ChrW(60)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)& IIF(rsx(ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)) <>"",ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(103)&ChrW(45)&rsx(ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114))&"","") &ChrW(34)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(45)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&IIF(k <>"",k,f)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&IIF(k <>"",k,f)&ChrW(34)&ChrW(62)&d&rsx(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(62) & vbcrlf
c=c&j 
call handle_layout_listpage_form(rsx) 
elseif rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(108)&ChrW(97)&ChrW(98)&ChrW(101)&ChrW(108) then
j=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(34)&ChrW(62)&ChrW(32) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&rsx(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(34)&ChrW(62)&rsx(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62) & vbcrlf
j=j&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
c=c&j  
elseif rsx(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116) then 
j=listpage_form_onlineSelect(this_TableName, rsx(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)),rsx(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),rsx(ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)))
c=c&j  
end if 
rsx.movenext:wend 
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
end if:rsx.close
getLayoutListPageForm=c
this_search_parem_request_asp=this_search_parem_request_asp&h
this_search_parem_submit_js=this_search_parem_submit_js&e

call echo(ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(95)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(95)&ChrW(106)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(95)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(95)&ChrW(106)&ChrW(115),this_search_parem_submit_js)
end function
call openUseDatabase()

dim rootFolderDir:rootFolderDir=adminDir & ChrW(97)&ChrW(112)&ChrW(112)&ChrW(47)& rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114))
dim idindexname
if checkFolder(rootFolderDir)=false then
call createFolder(rootFolderDir)
call echo(ChrW(25552)&ChrW(31034)&ChrW(65292)&ChrW(21019)&ChrW(24314)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(25104)&ChrW(21151),rootFolderDir)
end if

call echoRedB(ChrW(25552)&ChrW(31034)&ChrW(44)&ChrW(29983)&ChrW(25104)&ChrW(25991)&ChrW(20214)&ChrW(23384)&ChrW(22312)&ChrW(30446)&ChrW(24405),rootFolderDir):doevents
this_addEditTip=replace(rs(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(112)),ChrW(34),ChrW(34)&ChrW(34))
this_TableName=lcase(rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))
idindexname=replace(phptrim(rs(ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))),ChrW(34),ChrW(34)&ChrW(34))
if idindexname <>"" then public_idIndexName=idindexname
call echo(ChrW(25552)&ChrW(31034),ChrW(39029)&ChrW(38754)&ChrW(37197)&ChrW(32622)):doevents

sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rsx.open sql,thisConn,1,1
call echo(ChrW(115)&ChrW(113)&ChrW(108)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(119)&ChrW(104)&ChrW(105)&ChrW(108)&ChrW(101), sql)

while not rsx.eof  
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rsx(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))
rss.open sql,thisConn,1,1
if not rss.eof then 
rssFieldName=lcase(rss(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) )

this_configNameList=this_configNameList & rssFieldName & ChrW(124) & rss(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)) & ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(79)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116))=1 then this_lineEditList=this_lineEditList & rssFieldName & ChrW(124)

if rsx(ChrW(105)&ChrW(115)&ChrW(69)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104))=1 then this_English=this_English & rssFieldName & ChrW(124)

if rsx(ChrW(105)&ChrW(115)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))=1 then this_listPage=this_listPage & rssFieldName & ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116))=1 then public_listHeadSortShow=public_listHeadSortShow & rssFieldName & ChrW(44)
if rsx(ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(73)&ChrW(100))=1 then public_editpage_warp_addid=public_editpage_warp_addid & rssFieldName & ChrW(44)
if rsx(ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114))=1 then public_editpage_Item_addLayFilter=public_editpage_Item_addLayFilter & lcase(rssFieldName) & ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(72)&ChrW(105)&ChrW(100)&ChrW(101))=1 then public_editpage_warp_hide=public_editpage_warp_hide & rssFieldName & ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119))=1 then this_AddPageViewField=this_AddPageViewField & rssFieldName & ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108))=1 then public_editpage_show_inputHtml=public_editpage_show_inputHtml & rssFieldName & ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(105)&ChrW(100)&ChrW(101))=1 then public_editpage_not_field_list=public_editpage_not_field_list & rssFieldName & ChrW(44)

if phptrim(rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(76)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(73)&ChrW(99)&ChrW(111))) <>"" then configNameListNote=configNameListNote & rssFieldName & ChrW(124)&rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(76)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(73)&ChrW(99)&ChrW(111))&ChrW(44)

if phptrim(rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(82)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116))) <>"" then public_formFieldTextNote=public_formFieldTextNote & rssFieldName & ChrW(124)&encTsStrReplace(rsx(ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(82)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)),ChrW(44)&ChrW(124))&ChrW(44)

if phptrim(rsx(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))) <>"" then public_listPageRunAction=public_listPageRunAction & rssFieldName & ChrW(124)&encTsStrReplace(rsx(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)),ChrW(44)&ChrW(124))&ChrW(44)      

if phptrim(rsx(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))) <>"" then public_editPageSaveRunAction=public_editPageSaveRunAction & rssFieldName & ChrW(124)&encTsStrReplace(rsx(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)),ChrW(44)&ChrW(124))&ChrW(44)    

if phptrim(rsx(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))) <>"" then public_editPageRunAction=public_editPageRunAction & rssFieldName & ChrW(124)&encTsStrReplace(rsx(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)),ChrW(44)&ChrW(124))&ChrW(44)      

if phptrim(rsx(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))) <>"" then public_viewPageRunAction=public_viewPageRunAction & rssFieldName & ChrW(124)&encTsStrReplace(rsx(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)),ChrW(44)&ChrW(124))&ChrW(44)

if phptrim(rsx(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))) <>"" then public_listPageTopItemIocNote=public_listPageTopItemIocNote & rssFieldName & ChrW(124)&encTsStrReplace(rsx(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111)) & ChrW(91)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(93) & rsx(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)),ChrW(44)&ChrW(124))&ChrW(44)

if phptrim(rsx(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111))) <>"" then public_listPageFieldValueIocNote=public_listPageFieldValueIocNote & rssFieldName & ChrW(124)&encTsStrReplace(rsx(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111)) & ChrW(91)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(93) & rsx(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)),ChrW(44)&ChrW(124))&ChrW(44)

if phptrim(rsx(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(82)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))) <>"" then public_configQXList=public_configQXList & rssFieldName & ChrW(61)&rsx(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(82)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))&ChrW(44)

if phptrim(rsx(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(82)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))) <>"" then public_configEditQXList=public_configEditQXList & rssFieldName & ChrW(61)&rsx(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(82)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116))&ChrW(44)

if rsx(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)) <>"" then public_editPage_addnew_defaultValue=public_editPage_addnew_defaultValue & rssFieldName & ChrW(124)&rsx(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))&ChrW(44) 

if rsx(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)) <>"" then public_editPage_update_defaultValue=public_editPage_update_defaultValue & rssFieldName & ChrW(124)&rsx(ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101))&ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(67)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107))=1 then public_listFieldAddClickAction=public_listFieldAddClickAction & rssFieldName & ChrW(124)&rsx(ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(85)&ChrW(114)&ChrW(108))&ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116))=1 then public_listPage_jsTable_templetList=public_listPage_jsTable_templetList & rssFieldName &ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(74)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97))=1 then public_listPage_JsonDataFieldList=public_listPage_JsonDataFieldList& rssFieldName & ChrW(44)
if rsx(ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101))=1 then public_editSafe_fieldList=public_editSafe_fieldList& rssFieldName & ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101))=2 then public_editSafe_azDouHao_fieldList=public_editSafe_azDouHao_fieldList& rssFieldName & ChrW(44)    

if rsx(ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101))=3 then public_editSafe_dirFileName_fieldList=public_editSafe_dirFileName_fieldList& rssFieldName & ChrW(44)

if rsx(ChrW(105)&ChrW(115)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(84)&ChrW(119)&ChrW(111)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110))=0 then
formNoRowList=formNoRowList & rssFieldName & ChrW(44)
end if
public_formViewMaoHao=rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(77)&ChrW(97)&ChrW(111)&ChrW(72)&ChrW(97)&ChrW(111))
public_formEditMaoHao=rs(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(77)&ChrW(97)&ChrW(111)&ChrW(72)&ChrW(97)&ChrW(111))


if rsx(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(79)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107))=1 then
sMaoHao=ChrW(39)

if rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) <>"" then

thisFieldType=getFieldAlt(rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)), rssFieldName)
else
thisFieldType=getFieldAlt(db_PREFIX&rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)), rssFieldName)
end if

if instr(ChrW(44)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(44)&ChrW(89)&ChrW(101)&ChrW(115)&ChrW(78)&ChrW(111)&ChrW(44)&ChrW(70)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(44)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(44), ChrW(44)&thisFieldType&ChrW(44))>0 then

sMaoHao=""      
end if

if this_InputCheck <>"" then this_InputCheck=this_InputCheck &ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)
this_InputCheck=this_InputCheck & rssFieldName &ChrW(61)&sMaoHao&ChrW(34)&ChrW(38)&ChrW(32)& handleAspVar(rssFieldName) &ChrW(32)&ChrW(38)&ChrW(34)&sMaoHao&""
end if
isInputCheck=IIF(rsx(ChrW(105)&ChrW(115)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)),ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(100),"")
fieldConfig=phptrim(rss(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)))
if fieldConfig <>"" and left(fieldConfig,1) <>ChrW(45) then fieldConfig=ChrW(45)&fieldConfig

addtoinput=phptrim(lcase(rsx(ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)))) 
this_configTypeList=this_configTypeList &  rssFieldName &ChrW(124)&rss(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))&encTsStrReplace(fieldConfig,ChrW(124)&ChrW(44))&ChrW(124)&rss(ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116))&ChrW(124)&isInputCheck&ChrW(124)&rss(ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))&ChrW(124)&IIF(addtoinput <>"",ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&addtoinput,"")&ChrW(124)&rss(ChrW(100)&ChrW(105)&ChrW(118)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101))&ChrW(124)&rsx(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))&ChrW(44)
if addtoinput <>"" then
if public_addToInputFieldList <>"" then public_addToInputFieldList=public_addToInputFieldList&ChrW(44)
public_addToInputFieldList=public_addToInputFieldList&addtoinput
end if

if phptrim(rsx(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))) <>"" then
public_listPage_ItemWidth_config=public_listPage_ItemWidth_config&rssFieldName&ChrW(61) & phptrim(rsx(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104))) & ChrW(44)
end if
if rsx(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)) <>"" then
this_DefaultValue=this_DefaultValue & rssFieldName & ChrW(61) & encTsStrReplace(rsx(ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)),ChrW(44)&ChrW(61)) & ChrW(44)
end if
end if:rss.close
rsx.MoveNext:wend:rsx.close
call echo(ChrW(25552)&ChrW(31034),ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)):doevents

sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rsx.open sql,thisConn,1,1 
while not rsx.eof
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rsx(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))
rss.open sql,thisConn,1,1
if not rss.eof then 
rssFieldName=lcase(rss(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) )

if rsx(ChrW(105)&ChrW(115)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116))=1 then this_AddPage=this_AddPage & rssFieldName & ChrW(44)
end if:rss.close
rsx.MoveNext:wend:rsx.close
call echo(ChrW(25552)&ChrW(31034),ChrW(26597)&ChrW(30475)&ChrW(39029)&ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)):doevents

sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(61)&rs(ChrW(105)&ChrW(100)) & ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(99)
rsx.open sql,thisConn,1,1 
while not rsx.eof  
sql = ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&addPrefix(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100))&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(61)&ChrW(49)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&rsx(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100))
rss.open sql,thisConn,1,1
if not rss.eof then 
rssFieldName=lcase(rss(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) )

if rsx(ChrW(105)&ChrW(115)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119))=1 then this_ViewPage=this_ViewPage & rssFieldName & ChrW(44)
end if:rss.close
rsx.MoveNext:wend:rsx.close

call echo(ChrW(25552)&ChrW(31034),ChrW(22788)&ChrW(29702)&ChrW(34920)&ChrW(24038)&ChrW(36793)&ChrW(25353)&ChrW(38062)&ChrW(43)&ChrW(21491)&ChrW(36793)&ChrW(25353)&ChrW(38062)&ChrW(43)&ChrW(39030)&ChrW(37096)&ChrW(34920)&ChrW(21333)&ChrW(21644)&ChrW(39033)&ChrW(25805)&ChrW(20316)&ChrW(43)&ChrW(21160)&ChrW(20316)):doevents

listpage_table_button_html=getLayoutTableButton(rs)
listpage_table_action_html=getLayoutTableAction(rs)
listpage_table_toolbar_menu=getLayoutTableToolbar(rs)
listpage_top_form_html=getLayoutListPageForm(rs)
call handleLayoutAction(rs)
this_configTypeList=ChrW(44)&this_configTypeList&ChrW(44)
call hr()
call echoB(ChrW(34920)&ChrW(21517)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),this_TableName)
call echoBlueB(ChrW(37197)&ChrW(32622)&ChrW(21517)&ChrW(31216)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),this_configNameList)
call echoRedB(ChrW(37197)&ChrW(32622)&ChrW(31867)&ChrW(22411)&ChrW(21015)&ChrW(34920)&ChrW(40)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(41),this_configTypeList)
call echoBlueB(ChrW(22312)&ChrW(32447)&ChrW(20462)&ChrW(25913)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),this_lineEditList)
call echoBlueB(ChrW(33521)&ChrW(25991)&ChrW(22359)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(69)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104),this_English)
call echoRedB(ChrW(28155)&ChrW(21152)&ChrW(21807)&ChrW(19968)&ChrW(23383)&ChrW(27573)&ChrW(40)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(41),this_InputCheck)
call echoBlueB(ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101),this_listPage)
call echoBlueB(ChrW(26597)&ChrW(30475)&ChrW(39029)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101),this_ViewPage)
call echoBlueB(ChrW(28155)&ChrW(21152)&ChrW(20462)&ChrW(25913)&ChrW(39029)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101),this_AddPage) 
call echoBlueB(ChrW(28155)&ChrW(21152)&ChrW(20462)&ChrW(25913)&ChrW(39029)&ChrW(37324)&ChrW(26174)&ChrW(31034)&ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100),this_AddPageViewField)
call echoBlueB(ChrW(19968)&ChrW(34892)&ChrW(20004)&ChrW(21015)&ChrW(40)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(21017)&ChrW(26174)&ChrW(31034)&ChrW(20026)&ChrW(19968)&ChrW(34892)&ChrW(20004)&ChrW(21015)&ChrW(41)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(78)&ChrW(111)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),formNoRowList) 
call echoBlueB(ChrW(21015)&ChrW(34920)&ChrW(22836)&ChrW(37096)&ChrW(25490)&ChrW(24207)&ChrW(26174)&ChrW(31034)&ChrW(23383)&ChrW(27573)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(72)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119),public_listHeadSortShow) 
call echoBlueB(ChrW(23383)&ChrW(27573)&ChrW(27880)&ChrW(37322)&ChrW(24038)&ChrW(36793)&ChrW(22270)&ChrW(26631)&ChrW(29256)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101),configNameListNote) 
call echoBlueB(ChrW(23383)&ChrW(27573)&ChrW(27880)&ChrW(37322)&ChrW(21491)&ChrW(36793)&ChrW(25991)&ChrW(26412)&ChrW(29256)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101),public_formFieldTextNote) 
call echoBlueB(ChrW(21015)&ChrW(34920)&ChrW(39033)&ChrW(23383)&ChrW(27573)&ChrW(28857)&ChrW(20987)&ChrW(21160)&ChrW(20316)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(67)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),public_listFieldAddClickAction) 
call echoBlueB(ChrW(73)&ChrW(68)&ChrW(32034)&ChrW(24341)&ChrW(21517)&ChrW(31216)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(73)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),public_idIndexName) 
call echoBlueB(ChrW(40664)&ChrW(35748)&ChrW(20540)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101),this_DefaultValue) 
call echoBlueB(ChrW(26174)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(37324)&ChrW(30340)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(25968)&ChrW(25454)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(74)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),public_listPage_JsonDataFieldList) 
call echoBlueB(ChrW(28155)&ChrW(21152)&ChrW(21040)&ChrW(21478)&ChrW(19968)&ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),public_addToInputFieldList) 
call echoBlueB(ChrW(26681)&ChrW(25454)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(26174)&ChrW(31034)&ChrW(23383)&ChrW(27573)&ChrW(26435)&ChrW(38480)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(81)&ChrW(88)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),public_configQXList) 
call echoBlueB(ChrW(26681)&ChrW(25454)&ChrW(31649)&ChrW(29702)&ChrW(21592)&ChrW(20462)&ChrW(25913)&ChrW(23383)&ChrW(27573)&ChrW(26435)&ChrW(38480)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(81)&ChrW(88)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),public_configEditQXList) 
call echoBlueB(ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(37324)&ChrW(39033)&ChrW(21253)&ChrW(35065)&ChrW(21152)&ChrW(105)&ChrW(100)&ChrW(21517)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(119)&ChrW(97)&ChrW(114)&ChrW(112)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(105)&ChrW(100),public_editpage_warp_addid) 
call echoBlueB(ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(37324)&ChrW(39033)&ChrW(21152)&ChrW(36807)&ChrW(28388)&ChrW(22120)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114),public_editpage_Item_addLayFilter) 
call echoBlueB(ChrW(74)&ChrW(83)&ChrW(25628)&ChrW(32034)&ChrW(21442)&ChrW(25968)&ChrW(20256)&ChrW(36882)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(109)&ChrW(95)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(95)&ChrW(106)&ChrW(115),this_search_parem_submit_js) 
call echoBlueB(ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(21482)&ChrW(26174)&ChrW(31034)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(19981)&ChrW(20445)&ChrW(23384)&ChrW(21040)&ChrW(34920)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(95)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108),public_editpage_show_inputHtml) 
call echoBlueB(ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39030)&ChrW(37096)&ChrW(34920)&ChrW(21333)&ChrW(74)&ChrW(83)&ChrW(37096)&ChrW(20998)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(70)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(95)&ChrW(74)&ChrW(83),this_listPage_Form_JS) 
call echoBlueB(ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(23485)&ChrW(24230)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103),public_listPage_ItemWidth_config) 
call echoBlueB(ChrW(32534)&ChrW(36753)&ChrW(23433)&ChrW(20840)&ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),public_editSafe_fieldList) 
call echoBlueB(ChrW(28155)&ChrW(21152)&ChrW(26102)&ChrW(40664)&ChrW(35748)&ChrW(31995)&ChrW(32479)&ChrW(20540)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(95)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101),public_editPage_addnew_defaultValue) 
call echoBlueB(ChrW(26356)&ChrW(26032)&ChrW(26102)&ChrW(40664)&ChrW(35748)&ChrW(31995)&ChrW(32479)&ChrW(20540)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(95)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101),public_editPage_update_defaultValue) 
call echoBlueB(ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(19981)&ChrW(26174)&ChrW(31034)&ChrW(23383)&ChrW(27573)&ChrW(37197)&ChrW(32622)&ChrW(21644)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(26174)&ChrW(31034)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116),public_editpage_not_field_list) 
call echoBlueB(ChrW(21015)&ChrW(34920)&ChrW(39033)&ChrW(72)&ChrW(53)&ChrW(40)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(41)&ChrW(26174)&ChrW(31034)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(106)&ChrW(115)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),public_listPage_jsTable_templetList) 
call echoBlueB(ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(26174)&ChrW(31034)&ChrW(26102)&ChrW(22788)&ChrW(29702)&ChrW(21160)&ChrW(20316)&ChrW(65292)&ChrW(22914)&ChrW(21152)&ChrW(20989)&ChrW(25968)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),public_listPageRunAction) 
call echoBlueB(ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(39033)&ChrW(26174)&ChrW(31034)&ChrW(26102)&ChrW(22788)&ChrW(29702)&ChrW(21160)&ChrW(20316)&ChrW(65292)&ChrW(22914)&ChrW(21152)&ChrW(20989)&ChrW(25968)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),public_editPageRunAction) 
call echoRedB(ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(39033)&ChrW(20445)&ChrW(23384)&ChrW(26102)&ChrW(22788)&ChrW(29702)&ChrW(21160)&ChrW(20316)&ChrW(65292)&ChrW(22914)&ChrW(21152)&ChrW(20989)&ChrW(25968)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),public_editPageSaveRunAction) 
call echoBlueB(ChrW(26597)&ChrW(30475)&ChrW(39029)&ChrW(39033)&ChrW(26174)&ChrW(31034)&ChrW(26102)&ChrW(22788)&ChrW(29702)&ChrW(21160)&ChrW(20316)&ChrW(65292)&ChrW(22914)&ChrW(21152)&ChrW(20989)&ChrW(25968)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),public_viewPageRunAction) 
call hr()
doevents 



call hanldeDatabase()

function openUseDatabase()
dim a,b,c
if rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) <>"" then 
a=split(rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)),ChrW(46))    

if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) <>-999 then 
c=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & db_PREFIX & ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)& session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))
call echo(ChrW(115)&ChrW(113)&ChrW(108),c):doevents
userRs.open c,conn,1,1
if userRs.eof then
call eerr(ChrW(25552)&ChrW(31034),ChrW(38656)&ChrW(35201)&ChrW(30331)&ChrW(24405)&ChrW(21518)&ChrW(38754)&ChrW(65281) & ession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)))
end if :userRs.close
end if
if session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)) <>-999 then 

if rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) then
b=phptrim(lcase(handlePath(rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))))) 
if instr(b,ChrW(92)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(92)&ChrW(109)&ChrW(100)&ChrW(98)&ChrW(92))=false then
call eerr(ChrW(25552)&ChrW(31034),ChrW(23548)&ChrW(20837)&ChrW(22833)&ChrW(36133)&ChrW(65306)&ChrW(23548)&ChrW(20837)&ChrW(34920)&ChrW(21040)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(20301)&ChrW(32622)&ChrW(19981)&ChrW(22312)&ChrW(47)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(47)&ChrW(109)&ChrW(100)&ChrW(98)&ChrW(47)&ChrW(37324))
end if 
else
if phptrim(lcase(rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104))))=ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(104)&ChrW(111)&ChrW(115)&ChrW(116) or phptrim(rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(112)&ChrW(97)&ChrW(116)&ChrW(104)))=ChrW(49)&ChrW(50)&ChrW(55)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(49) then
call eerr(ChrW(25552)&ChrW(31034),ChrW(23548)&ChrW(20837)&ChrW(22833)&ChrW(36133)&ChrW(65306)&ChrW(23548)&ChrW(20837)&ChrW(34920)&ChrW(21040)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(22833)&ChrW(36133)&ChrW(65292)&rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(19981)&ChrW(33021)&ChrW(20351)&ChrW(29992)&ChrW(26412)&ChrW(22320)&ChrW(25968)&ChrW(25454)&ChrW(24211))
end if
end if
end if
Set conn = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
if rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) or rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then 
call handle_selectOpenConn(conn,rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)) ,rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)),rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)),rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)),rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)),"","")
else  
call handle_selectOpenConn(conn,ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) ,"","","","", rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) ,rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)) )

end if
end if
end function
function hanldeDatabase() 
if rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) <>"" then
call echoBlueB(ChrW(25171)&ChrW(24320)&ChrW(22806)&ChrW(37096)&ChrW(25968)&ChrW(25454)&ChrW(24211),rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))):doevents 
if rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) or rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
db_PREFIX=""
databaseType = rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))
sqlServerHostIP = rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))
sqlServerDatabaseName = rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
sqlServerUsername = rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114))
sqlServerPassword = rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115))
replaceOpenConnC=replaceOpenConnC&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(58)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(61)&ChrW(34)&ChrW(34) & vbcrlf 
replaceOpenConnC=replaceOpenConnC&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(58)&ChrW(83)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(40)&ChrW(34)&ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(41) & vbcrlf  
if rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
replaceOpenConnC=replaceOpenConnC&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(101)&ChrW(112)&ChrW(110)&ChrW(77)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(40)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(44)&ChrW(34)&sqlServerHostIP&ChrW(34)&ChrW(44)&ChrW(34)&sqlServerDatabaseName&ChrW(34)&ChrW(44)&ChrW(34)&sqlServerUsername&ChrW(34)&ChrW(44)&ChrW(34)&sqlServerPassword&ChrW(34)&ChrW(41) & vbcrlf
else
replaceOpenConnC=replaceOpenConnC&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(101)&ChrW(112)&ChrW(110)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(40)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(44)&ChrW(34)&sqlServerHostIP&ChrW(34)&ChrW(44)&ChrW(34)&sqlServerDatabaseName&ChrW(34)&ChrW(44)&ChrW(34)&sqlServerUsername&ChrW(34)&ChrW(44)&ChrW(34)&sqlServerPassword&ChrW(34)&ChrW(41) & vbcrlf
end if
else
db_PREFIX=""
databaseType = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) 
MDBPath = rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) 
accessPass = rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)) 
replaceOpenConnC=replaceOpenConnC&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(58)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(95)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(61)&ChrW(34)&ChrW(34) & vbcrlf 
replaceOpenConnC=replaceOpenConnC&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(58)&ChrW(83)&ChrW(101)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(40)&ChrW(34)&ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(41) & vbcrlf  
replaceOpenConnC=replaceOpenConnC&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(40)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(44)&ChrW(34)&MDBPath&ChrW(34)&ChrW(44)&ChrW(34)&accessPass&ChrW(34)&ChrW(41) & vbcrlf
end if
call closeconn()
call openconn()
end if
end function
call makeWebAdmin_LayoutPage() 
call makeConfigAspCode()
function makeWebAdmin_LayoutPage()  
dim a,b,c,d,e,f,g,h,i,j,k,l
dim m
dim n



dim o











glabolPowerTitle=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(27979)&ChrW(35797) 
glabolListConfig=ChrW(100)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(44)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)
glabolFormInputElseAspCode=getFormInputElseAspcode(this_TableName,this_DefaultValue)
glabol_enFieldList=ChrW(124)& this_English &ChrW(124)
glabol_lineEditList=ChrW(124)& this_lineEditList &ChrW(124)
glabol_ascDesc=ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(32)

m=this_configNameList
n=ChrW(44)&this_configTypeList & ChrW(44)


o=getHandleViewConfigTypeList(n)
call echoBlueB(ChrW(26597)&ChrW(30475)&ChrW(39029)&ChrW(37197)&ChrW(32622)&ChrW(65292)&ChrW(23383)&ChrW(27573)&ChrW(22312)&ChrW(19968)&ChrW(34892)&ChrW(26174)&ChrW(31034)&ChrW(32)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),o) :doevents 







a=generateAdminList(this_TableName,this_listPage, m,n ,ChrW(34)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(34))
e=""
if public_listpage_switch_jsShow=ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119) then

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(105)&ChrW(115)&ChrW(79)&ChrW(110)&ChrW(79)&ChrW(102)&ChrW(102)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if 

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 

if instr(public_listPage_asp_function,e)=false then
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if 
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(79)&ChrW(110)&ChrW(92)&ChrW(115)&ChrW(119)&ChrW(105)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
end if
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(115)&ChrW(119)&ChrW(105)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(21151)&ChrW(33021)&ChrW(106)&ChrW(115)&ChrW(20195)&ChrW(30721)&ChrW(22359)&ChrW(125),e)
e=""
if public_listpage_onLineEdit_jsShow=ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119) then

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(111)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_js_function,e)=false then
public_listPage_js_function=public_listPage_js_function&e&vbcrlf
end if 

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if 

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 

if instr(public_listPage_asp_function,e)=false then
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if 
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(79)&ChrW(110)&ChrW(92)&ChrW(111)&ChrW(110)&ChrW(73)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
end if
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(111)&ChrW(110)&ChrW(22312)&ChrW(32447)&ChrW(20462)&ChrW(25913)&ChrW(21151)&ChrW(33021)&ChrW(106)&ChrW(115)&ChrW(20195)&ChrW(30721)&ChrW(22359)&ChrW(125),e)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(21452)&ChrW(20987)&ChrW(30417)&ChrW(21548)&ChrW(24037)&ChrW(20855)&ChrW(20107)&ChrW(20214)&ChrW(47)&ChrW(47),getConfigSetData(ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(21452)&ChrW(20987)&ChrW(30417)&ChrW(21548)&ChrW(24037)&ChrW(20855)&ChrW(20107)&ChrW(20214))) 
a=replace(a,ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(34),ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&this_TableName&ChrW(34))
a=replace(a,ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(20250)&ChrW(21592)&ChrW(34),ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&replace(rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),ChrW(34),ChrW(34)&ChrW(34))&ChrW(34))

if rs(ChrW(105)&ChrW(115)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115))=0 then
a=replace(a,ChrW(100)&ChrW(101)&ChrW(108)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(121)&ChrW(101)&ChrW(115)&ChrW(34),ChrW(100)&ChrW(101)&ChrW(108)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34))
end if

l=getHandle_listsearch(rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)))

if l="" then
e=getstrcut(a,ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(40664)&ChrW(35748)&ChrW(25628)&ChrW(32034)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(22788)&ChrW(29702)&ChrW(39),ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102),1)
if e <>"" then

a=replace(a,e,ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102))
end if
else 
a=replace(a,ChrW(40)&ChrW(32)&ChrW(91)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(37)&ChrW(39)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(37)&ChrW(39)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(91)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(37)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(37)&ChrW(39)&ChrW(32)&ChrW(41), l)
end if
a=replace(a,ChrW(47)&ChrW(47)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(74)&ChrW(83)&ChrW(22359),public_dropdownJSCode)
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),public_dropdownHtmlCode)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(39068)&ChrW(33394)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(74)&ChrW(83)&ChrW(22359),public_colorpickerJSCode)
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(39068)&ChrW(33394)&ChrW(25805)&ChrW(20316)&ChrW(22120)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),public_colorpickerHtmlCode)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(26085)&ChrW(26399)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(74)&ChrW(83)&ChrW(22359),public_laydateJsCode)
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(26085)&ChrW(26399)&ChrW(25805)&ChrW(20316)&ChrW(22120)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),public_laydateHtmlCode)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(21015)&ChrW(34920)&ChrW(39033)&ChrW(23383)&ChrW(27573)&ChrW(28857)&ChrW(20987)&ChrW(21160)&ChrW(20316),public_listFieldAddClickJsCode)
a=replace(a,ChrW(39)&ChrW(123)&ChrW(22810)&ChrW(32423)&ChrW(20998)&ChrW(31867)&ChrW(23450)&ChrW(20041)&ChrW(105)&ChrW(100)&ChrW(21015)&ChrW(34920)&ChrW(125),public_listPage_idList_aspCode)

a=replace(a,ChrW(39)&ChrW(123)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(20989)&ChrW(25968)&ChrW(22359)&ChrW(125),public_listPage_asp_function)
a=replace(a,ChrW(34)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(34),ChrW(34)&ChrW(32)&rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(79)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(66)&ChrW(121))&ChrW(34))
a=replace(a,ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(44),ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(58)&ChrW(32)&rs(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101))&ChrW(44))

if rs(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(85)&ChrW(112)&ChrW(68)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101))=0 then 
e=getstrcut(a,ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(73)&ChrW(68)&ChrW(45)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(45)&ChrW(100)&ChrW(101)&ChrW(109)&ChrW(111)&ChrW(45)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(45)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(34)&ChrW(62),ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62),1)
if e <>"" then a=replace(a,e,"")


a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(24213)&ChrW(37096)&ChrW(20998)&ChrW(39029)&ChrW(26639)&ChrW(20107)&ChrW(20214)&ChrW(125),"") 
else
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(79)&ChrW(110)&ChrW(47)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
e=replace(e,ChrW(40)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(46)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(124)&ChrW(124)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(41),ChrW(40)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(46)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(32)&ChrW(124)&ChrW(124)&ChrW(32)&rs(ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101))&ChrW(41))
if e <>"" then a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(24213)&ChrW(37096)&ChrW(20998)&ChrW(39029)&ChrW(26639)&ChrW(20107)&ChrW(20214)&ChrW(125),e) 
end if

if rs(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(83)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104))=0 then
e=getstrcut(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(25628)&ChrW(32034)&ChrW(34920)&ChrW(21333)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(25628)&ChrW(32034)&ChrW(34920)&ChrW(21333)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),1) 
if e <>"" then a=replace(a,e,"")
end if

if rs(ChrW(105)&ChrW(115)&ChrW(66)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101))=0 then  
a=replace(a,ChrW(60)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(115)&ChrW(109)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(103)&ChrW(45)&ChrW(111)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(101)&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(34)&ChrW(62)&ChrW(25209)&ChrW(37327)&ChrW(21024)&ChrW(38500)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(62),"")
a=replace(a,ChrW(123)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(39)&ChrW(125)&ChrW(44),"")
end if

if rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110))=0 then 
a=replace(a,ChrW(60)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(115)&ChrW(109)&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(34)&ChrW(62)&ChrW(28155)&ChrW(21152)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(62),"")
end if

if rs(ChrW(105)&ChrW(115)&ChrW(66)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101))=0 and rs(ChrW(105)&ChrW(115)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110))=0 then  
e=getstrcut(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(21024)&ChrW(38500)&ChrW(25353)&ChrW(38062)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(21024)&ChrW(38500)&ChrW(25353)&ChrW(38062)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),1)
if e <>"" then a=replace(a,e,"")
end if

if rs(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116))=0 then
e=getstrcut(a,ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(84)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(91)&ChrW(39),ChrW(125)&ChrW(93)&ChrW(44),1)
if e <>"" then a=replace(a,e,ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(84)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(58)&ChrW(91)&ChrW(93)&ChrW(44))
e=getstrcut(a,ChrW(47)&ChrW(47)&ChrW(23548)&ChrW(20837)&ChrW(23548)&ChrW(20986)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116),ChrW(47)&ChrW(47)&ChrW(23548)&ChrW(20837)&ChrW(23548)&ChrW(20986)&ChrW(101)&ChrW(110)&ChrW(100),1)
if e <>"" then a=replace(a,e,ChrW(47)&ChrW(47)&ChrW(23548)&ChrW(20837)&ChrW(23548)&ChrW(20986))
end if

if rs(ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(80)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101))=0 then
e=getstrcut(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(21015)&ChrW(34920)&ChrW(25805)&ChrW(20316)&ChrW(33756)&ChrW(21333)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(21015)&ChrW(34920)&ChrW(25805)&ChrW(20316)&ChrW(33756)&ChrW(21333)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),1)
if e <>"" then a=replace(a,e,"")
e=getstrcut(a,ChrW(47)&ChrW(47)&ChrW(30417)&ChrW(21548)&ChrW(34892)&ChrW(24037)&ChrW(20855)&ChrW(20107)&ChrW(20214)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116),ChrW(47)&ChrW(47)&ChrW(30417)&ChrW(21548)&ChrW(34892)&ChrW(24037)&ChrW(20855)&ChrW(20107)&ChrW(20214)&ChrW(101)&ChrW(110)&ChrW(100),1)
if e <>"" then a=replace(a,e,"")
a=replace(a,ChrW(44)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(25805)&ChrW(20316)&ChrW(39)&ChrW(44),ChrW(47)&ChrW(47)&ChrW(44)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(120)&ChrW(101)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(25805)&ChrW(20316)&ChrW(39)&ChrW(44)) 
end if 
e=""
if rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(98)&ChrW(108)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))  then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(79)&ChrW(110)&ChrW(92)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(68)&ChrW(111)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(21452)&ChrW(20987)&ChrW(34920)&ChrW(26684)&ChrW(20013)&ChrW(30340)&ChrW(26576)&ChrW(19968)&ChrW(34892)&ChrW(125),e)
if public_listPage_jsonItem_aspCode <>"" then
e=getstrcut(a,ChrW(39)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(39),ChrW(39)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(69)&ChrW(110)&ChrW(100)&ChrW(39),1) 
if a <>"" then
a=replace(a,e,public_listPage_jsonItem_aspCode)
end if 
end if
if replaceOpenConnC <>"" then a=replace(a,ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(40)&ChrW(41),replaceOpenConnC) 
a=replace(a,ChrW(39)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(102)&ChrW(25209)&ChrW(37327)&ChrW(21024)&ChrW(38500)&ChrW(37324)&ChrW(36861)&ChrW(21152)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(20195)&ChrW(30721)&ChrW(39),public_listPage_elseif_del_InAddAspCode)
a=replace(a,ChrW(39)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(102)&ChrW(22797)&ChrW(21046)&ChrW(24403)&ChrW(21069)&ChrW(34892)&ChrW(21028)&ChrW(26029)&ChrW(37324)&ChrW(36861)&ChrW(21152)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(20195)&ChrW(30721)&ChrW(39),public_listPage_elseif_copy_InAddAspCode)
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(25628)&ChrW(32034)&ChrW(25353)&ChrW(38062)&ChrW(19979)&ChrW(38754)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),public_listPage_searchButton_downHtml)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(36861)&ChrW(21152)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(21028)&ChrW(26029)&ChrW(21160)&ChrW(20316)&ChrW(125),public_listPage_active_jsCode)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(26356)&ChrW(22810)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(37197)&ChrW(32622)&ChrW(74)&ChrW(83)&ChrW(22359),public_listPage_moreDownMenu_jsConfig)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(26356)&ChrW(22810)&ChrW(19979)&ChrW(25289)&ChrW(33756)&ChrW(21333)&ChrW(20869)&ChrW(23481)&ChrW(74)&ChrW(83)&ChrW(22359),public_listPage_moreDownMenu_jsContent)
if rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)) <>"" then
a=replace(a,ChrW(114)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(34)&ChrW(62)&ChrW(25628)&ChrW(32034)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(62),ChrW(114)&ChrW(101)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(34)&ChrW(62)&ChrW(25628)&ChrW(32034)&rs(ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104))&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(62))
end if
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(24037)&ChrW(20855)&ChrW(25353)&ChrW(38062)&ChrW(36861)&ChrW(21152)&ChrW(21306)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),public_listPage_toolbarButton_html)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(74)&ChrW(83)&ChrW(20869)&ChrW(37096)&ChrW(20989)&ChrW(25968)&ChrW(22359)&ChrW(125),public_listPage_js_function)
if public_listPage_toolbarCase_JsCode <>"" then
h=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(24037)&ChrW(20855)&ChrW(26639)&ChrW(20107)&ChrW(20214) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(39)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(40)&ChrW(100)&ChrW(101)&ChrW(109)&ChrW(111)&ChrW(41)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(41)&ChrW(123) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(59) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(59) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(111)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(40)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(41)&ChrW(59) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(119)&ChrW(105)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(40)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(41)&ChrW(123) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(39)&ChrW(58) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(59) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(46)&ChrW(117)&ChrW(116)&ChrW(105)&ChrW(108)&ChrW(46)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(101)&ChrW(40)&ChrW(74)&ChrW(83)&ChrW(79)&ChrW(78)&ChrW(46)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(105)&ChrW(102)&ChrW(121)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(41)&ChrW(41)&ChrW(41)&ChrW(59) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(107)&ChrW(59) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(39)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(39)&ChrW(58) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(41)&ChrW(59) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(40)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(41)&ChrW(59) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(46)&ChrW(117)&ChrW(116)&ChrW(105)&ChrW(108)&ChrW(46)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(97)&ChrW(112)&ChrW(101)&ChrW(40)&ChrW(74)&ChrW(83)&ChrW(79)&ChrW(78)&ChrW(46)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(105)&ChrW(102)&ChrW(121)&ChrW(40)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(41)&ChrW(41)&ChrW(41)&ChrW(59) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(107)&ChrW(59) & vbcrlf
h=h&ChrW(32) & vbcrlf
h=h&public_listPage_toolbarCase_JsCode & vbcrlf
h=h&ChrW(32) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(59) & vbcrlf
h=h&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41)&ChrW(59) & vbcrlf 
end if 
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(74)&ChrW(83)&ChrW(22359)&ChrW(125),h)
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(34920)&ChrW(26684)&ChrW(39030)&ChrW(37096)&ChrW(25353)&ChrW(38062)&ChrW(21015)&ChrW(34920)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62)&ChrW(32),listpage_table_button_html)
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(21015)&ChrW(34920)&ChrW(27599)&ChrW(39033)&ChrW(25805)&ChrW(20316)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(68)&ChrW(101)&ChrW(109)&ChrW(111)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),listpage_table_action_html)
a=replace(a,ChrW(47)&ChrW(42)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(84)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114)&ChrW(33756)&ChrW(21333)&ChrW(21015)&ChrW(34920)&ChrW(37197)&ChrW(32622)&ChrW(42)&ChrW(47),listpage_table_toolbar_menu)
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39030)&ChrW(19978)&ChrW(34920)&ChrW(21333)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),listpage_top_form_html)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(30417)&ChrW(21548)&ChrW(34892)&ChrW(24037)&ChrW(20855)&ChrW(20107)&ChrW(20214)&ChrW(125),listpage_table_action_js)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(34920)&ChrW(26684)&ChrW(37324)&ChrW(27599)&ChrW(39033)&ChrW(25805)&ChrW(20316)&ChrW(125),public_listpage_table_option_js)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39030)&ChrW(37096)&ChrW(34920)&ChrW(21333)&ChrW(25805)&ChrW(20316)&ChrW(74)&ChrW(83)&ChrW(22359)&ChrW(125),this_listPage_Form_JS)
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(21152)&ChrW(36733)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(74)&ChrW(83)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),public_listPage_scriptSrc)
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(21152)&ChrW(36733)&ChrW(22806)&ChrW(37096)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(25991)&ChrW(20214)&ChrW(45)&ChrW(45)&ChrW(62),public_listPage_include_fileList)
a=getBatchReplaceCode(a,rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)))

if rs(ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)) <>"" then

a=replace(a,ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(77)&ChrW(83)&ChrW(72)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(40)&ChrW(39)&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(37)&ChrW(62)&ChrW(39)&ChrW(41),ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(50)&ChrW(40)&ChrW(39)&ChrW(24110)&ChrW(21161)&ChrW(25991)&ChrW(26723)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(39)&ChrW(41)&ChrW(32))
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode &ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(34)&ChrW(41)&ChrW(61)&ChrW(34)&ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110) & vbcrlf&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(100)&ChrW(105)&ChrW(101)&ChrW(40)&ChrW(34)&replace(replace(rs(ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)),ChrW(34),ChrW(34)&ChrW(34)),vbcrlf,ChrW(34)&ChrW(38)&ChrW(118)&ChrW(98)&ChrW(99)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(38)&ChrW(34))&ChrW(34)&ChrW(41) & vbcrlf
end if 
a=replace(a,ChrW(39)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(102)&ChrW(21028)&ChrW(26029)&ChrW(39),public_listPage_elseif_aspCode)

if rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)) <>"" then a=handleListSerchField(a,replace(rs(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)),ChrW(34),ChrW(34)&ChrW(34)))
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(74)&ChrW(83)&ChrW(25628)&ChrW(32034)&ChrW(21442)&ChrW(25968)&ChrW(20256)&ChrW(36882)&ChrW(125),this_search_parem_submit_js)
a=replace(a,ChrW(39)&ChrW(123)&ChrW(25628)&ChrW(32034)&ChrW(26465)&ChrW(20214)&ChrW(21442)&ChrW(25968)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(20195)&ChrW(30721)&ChrW(125)&ChrW(39),this_search_parem_request_asp)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(25968)&ChrW(25454)&ChrW(21152)&ChrW(36733)&ChrW(23436)&ChrW(24490)&ChrW(29615)&ChrW(27599)&ChrW(39033)&ChrW(125),public_listPage_json_done_foritem)
a=replace(a,ChrW(124)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(124)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(124)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(124),glabol_lineEditList)
if idindexname <>"" and idindexname <>ChrW(105)&ChrW(100) then
call echoYellowB(ChrW(25552)&ChrW(31034),ChrW(27491)&ChrW(22312)&ChrW(22788)&ChrW(29702)&ChrW(26367)&ChrW(25442)&ChrW(25351)&ChrW(23450)&ChrW(73)&ChrW(68)&ChrW(32034)&ChrW(24341)&ChrW(21517)&ChrW(61) & lcase(idindexname))
a=replace(a,ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(100),ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&lcase(idindexname)&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(100))
a=replace(a,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40),ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&lcase(idindexname)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(40))
a=replace(a,ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(91)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(93),ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(91)&ChrW(34)&lcase(idindexname)&ChrW(34)&ChrW(93))
a=replace(a,ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(91)&ChrW(105)&ChrW(93)&ChrW(46)&ChrW(105)&ChrW(100),ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(91)&ChrW(105)&ChrW(93)&ChrW(46)&lcase(idindexname))
a=replace(a,ChrW(114)&ChrW(111)&ChrW(119)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(59),ChrW(114)&ChrW(111)&ChrW(119)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&lcase(idindexname)&ChrW(59))
a=replace(a,ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(105)&ChrW(100),ChrW(93)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&lcase(idindexname)&ChrW(61)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(105)&ChrW(100))
a=replace(a,ChrW(40)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(46)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(60)&ChrW(62)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34),ChrW(40)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(46)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(60)&ChrW(62)&ChrW(34)&lcase(idindexname)&ChrW(34))
end if 
i=""

if public_editSafe_fieldList <>"" then
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39)&ChrW(20026)&ChrW(23433)&ChrW(20840)&ChrW(22788)&ChrW(29702)&ChrW(30340)&ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)&ChrW(39) & vbcrlf
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(40)&ChrW(34)&ChrW(124)&replace(public_editSafe_fieldList,ChrW(44),ChrW(124))&ChrW(124)&ChrW(34)&ChrW(44)&ChrW(32)&ChrW(34)&ChrW(124)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(108)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(40)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(38)&ChrW(34)&ChrW(124)&ChrW(34)&ChrW(41)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(32) & vbcrlf
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(40)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(41) & vbcrlf
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102) & vbcrlf
end if

if public_editSafe_azDouHao_fieldList <>"" then
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39)&ChrW(21482)&ChrW(35201)&ChrW(23383)&ChrW(27597)&ChrW(21644)&ChrW(100)&ChrW(111)&ChrW(117)&ChrW(104)&ChrW(97)&ChrW(111)&ChrW(39) & vbcrlf
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(40)&ChrW(34)&ChrW(124)&replace(public_editSafe_azDouHao_fieldList,ChrW(44),ChrW(124))&ChrW(124)&ChrW(34)&ChrW(44)&ChrW(32)&ChrW(34)&ChrW(124)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(108)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(40)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(38)&ChrW(34)&ChrW(124)&ChrW(34)&ChrW(41)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(32) & vbcrlf
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(65)&ChrW(90)&ChrW(68)&ChrW(111)&ChrW(117)&ChrW(72)&ChrW(97)&ChrW(111)&ChrW(40)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(41) & vbcrlf
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102) & vbcrlf
end if

if public_editSafe_dirFileName_fieldList <>"" then
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(39)&ChrW(22788)&ChrW(29702)&ChrW(25104)&ChrW(30446)&ChrW(24405)&ChrW(25991)&ChrW(20214)&ChrW(21517)&ChrW(27809)&ChrW(26377)&ChrW(21518)&ChrW(32512)&ChrW(30340)&ChrW(39) & vbcrlf
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(40)&ChrW(34)&ChrW(124)&replace(public_editSafe_dirFileName_fieldList,ChrW(44),ChrW(124))&ChrW(124)&ChrW(34)&ChrW(44)&ChrW(32)&ChrW(34)&ChrW(124)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(108)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(40)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(41)&ChrW(32)&ChrW(38)&ChrW(34)&ChrW(124)&ChrW(34)&ChrW(41)&ChrW(62)&ChrW(48)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(32) & vbcrlf
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(41) & vbcrlf
i=i&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102) & vbcrlf
end if
a=replace(a,ChrW(39)&ChrW(23383)&ChrW(31526)&ChrW(37324)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(26631)&ChrW(31614)&ChrW(23433)&ChrW(20840)&ChrW(22788)&ChrW(29702)&ChrW(23383)&ChrW(27573)&ChrW(21015)&ChrW(34920)&ChrW(39),i)
a=replace(a,ChrW(101)&ChrW(120)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(68)&ChrW(76)&ChrW(73)&ChrW(115)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(34),ChrW(101)&ChrW(120)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(68)&ChrW(76)&ChrW(73)&ChrW(115)&ChrW(116)&ChrW(61)&ChrW(34)&session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))&ChrW(34))
a=replace(a,ChrW(47)&ChrW(42)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(26679)&ChrW(24335)&ChrW(42)&ChrW(47),public_listPage_style)

if public_isClassPage=true then
j=ChrW(44)&ChrW(34)&ChrW(34)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(76)&ChrW(40)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(41)&ChrW(32)&ChrW(38)&ChrW(34)&ChrW(34)&ChrW(34)&ChrW(125)&ChrW(34) 
k=ChrW(44)&ChrW(34)&ChrW(34)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(34)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(76)&ChrW(40)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(41)&ChrW(32)&ChrW(38)&ChrW(34)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(34)&ChrW(98)&ChrW(106)&ChrW(121)&ChrW(122)&ChrW(34)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(117)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(40)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(120)&ChrW(120)&ChrW(41)&ChrW(43)&ChrW(49)&ChrW(32)&ChrW(38)&ChrW(34)&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(114)&ChrW(115)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(38)&ChrW(34)&ChrW(34)&ChrW(34)&ChrW(125)&ChrW(34)  
a=replace(a,j,k)
end if
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then 




a=replace(a,ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101),ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&databaseType&ChrW(34)) 
end if
if replaceOpenConnC <>"" then a=replaceConnToThisConn(a)
a=handleMakeASPCode(a,cstr(rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(90)&ChrW(105)&ChrW(112))))
b=rootFolderDir &ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
call checkWriteToFile(b,a)
call echoRedB(ChrW(29983)&ChrW(25104)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(25104)&ChrW(21151),b)
call hr()



a=generateAdminView(this_TableName,this_ViewPage,m,  o )
a=replace(a,ChrW(60)&ChrW(47)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(62),ChrW(60)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(62)&ChrW(46)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(44)&ChrW(46)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(123)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(52)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(35)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(59)&ChrW(125)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(104)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(62)) 
a=replace(a,ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(34),ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&this_TableName&ChrW(34))
a=replace(a,ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(20250)&ChrW(21592)&ChrW(34),ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&replace(rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),ChrW(34),ChrW(34)&ChrW(34))&ChrW(34))
if this_English="" then
a=get_handle_EnglishHtml(a)
call echoYellowB(ChrW(25552)&ChrW(31034),ChrW(27809)&ChrW(26377)&ChrW(33521)&ChrW(25991)&ChrW(34920)&ChrW(21333)&ChrW(37197)&ChrW(32622)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(33521)&ChrW(25991)&ChrW(29256)&ChrW(26412)&ChrW(20999)&ChrW(25442))
end if

e=getstrcut(a,ChrW(39)&ChrW(28155)&ChrW(21152)&ChrW(20462)&ChrW(25913),ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(105)&ChrW(100),1) 
a=replace(a,e,ChrW(105)&ChrW(102)&ChrW(32)&ChrW(105)&ChrW(100))

if idindexname <>"" and idindexname <>ChrW(105)&ChrW(100) then
call echoYellowB(ChrW(26597)&ChrW(30475)&ChrW(39029)&ChrW(25552)&ChrW(31034),ChrW(27491)&ChrW(22312)&ChrW(22788)&ChrW(29702)&ChrW(26367)&ChrW(25442)&ChrW(25351)&ChrW(23450)&ChrW(73)&ChrW(68)&ChrW(32034)&ChrW(24341)&ChrW(21517)&ChrW(61) & idindexname)
a=replace(a,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(100),ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&idindexname&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(100)) 
end if
a=replace(a,ChrW(39)&ChrW(123)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(20989)&ChrW(25968)&ChrW(22359)&ChrW(125),public_viewPage_asp_function)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(74)&ChrW(83)&ChrW(36861)&ChrW(21152)&ChrW(20195)&ChrW(30721)&ChrW(22359)&ChrW(125),public_viewPage_jsCode)
a=getBatchReplaceCode(a,rs(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)))
e=getstrcut(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(25552)&ChrW(20132)&ChrW(25353)&ChrW(38062)&ChrW(38656)&ChrW(35201)&ChrW(65292)&ChrW(22806)&ChrW(37096)&ChrW(35843)&ChrW(29992)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62),1)
if e <>"" then a=replace(a,e,"")
if replaceOpenConnC <>"" then a=replace(a,ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(40)&ChrW(41),replaceOpenConnC)
a=replace(a,ChrW(101)&ChrW(120)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(68)&ChrW(76)&ChrW(73)&ChrW(115)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(34),ChrW(101)&ChrW(120)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(68)&ChrW(76)&ChrW(73)&ChrW(115)&ChrW(116)&ChrW(61)&ChrW(34)&session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))&ChrW(34))
if replaceOpenConnC <>"" then a=replaceConnToThisConn(a)
c=rootFolderDir &ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then




a=replace(a,ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101),ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&databaseType&ChrW(34)) 
end if
a=handleMakeASPCode(a,cstr(rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(90)&ChrW(105)&ChrW(112))))
if rs(ChrW(105)&ChrW(115)&ChrW(100)&ChrW(98)&ChrW(108)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101))=0 and isclickviewdetail=false then
call deleteFile(c)
call echoRedB(ChrW(21024)&ChrW(38500)&ChrW(26597)&ChrW(30475)&ChrW(39029)&ChrW(25104)&ChrW(21151),c)
else
call checkWriteToFile(c,a)
call echoRedB(ChrW(29983)&ChrW(25104)&ChrW(26597)&ChrW(30475)&ChrW(39029)&ChrW(25104)&ChrW(21151),c)
call hr()
end if
public_formViewFieldList=this_AddPageViewField


a=generateAdminForm(this_TableName,this_AddPage,m,n & ChrW(44) & o)
a=replace(a,ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(34),ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&this_TableName&ChrW(34))
a=replace(a,ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(20250)&ChrW(21592)&ChrW(34),ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&replace(rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)),ChrW(34),ChrW(34)&ChrW(34))&ChrW(34))

if this_InputCheck <>"" then
a=replace(a,ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(38)&ChrW(34)&ChrW(39)&ChrW(34), ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&this_InputCheck&ChrW(34))
else
a=replace(a,ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(38)&ChrW(34)&ChrW(39)&ChrW(34), ChrW(34)&ChrW(34))
a=replace(a,ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(100), ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(100))
a=replace(a,ChrW(105)&ChrW(102)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(111)&ChrW(102)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(32)&ChrW(39)&ChrW(28155)&ChrW(21152)&ChrW(21028)&ChrW(26029)&ChrW(39),ChrW(105)&ChrW(102)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(111)&ChrW(102)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(49)&ChrW(61)&ChrW(50)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)&ChrW(32)&ChrW(39)&ChrW(28155)&ChrW(21152)&ChrW(21028)&ChrW(26029)&ChrW(39))
end if 
a=replace(a,ChrW(29992)&ChrW(25143)&ChrW(21517)&ChrW(31216)&ChrW(24050)&ChrW(32463)&ChrW(23384)&ChrW(22312),this_addEditTip)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(32534)&ChrW(36753)&ChrW(22120)&ChrW(74)&ChrW(83)&ChrW(20195)&ChrW(30721)&ChrW(125),public_editpage_editor_JSCode)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(39068)&ChrW(33394)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(74)&ChrW(83)&ChrW(22359)&ChrW(125),public_editPageColorJsCode)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(26102)&ChrW(38388)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(74)&ChrW(83)&ChrW(22359)&ChrW(125),public_editPageTimeJsCode)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(19978)&ChrW(20256)&ChrW(22270)&ChrW(29255)&ChrW(74)&ChrW(83)&ChrW(22359)&ChrW(125),public_layuiadminUploadPicJsCode)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(23383)&ChrW(27573)&ChrW(24038)&ChrW(36793)&ChrW(22270)&ChrW(26631)&ChrW(27880)&ChrW(37322)&ChrW(74)&ChrW(83)&ChrW(22359)&ChrW(125),public_editPathLeftNoteJsCode)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(32)&ChrW(31896)&ChrW(36148)&ChrW(19978)&ChrW(20256)&ChrW(22270)&ChrW(29255),public_paste_update_image_js_code)
a=replace(a,ChrW(39)&ChrW(123)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(20989)&ChrW(25968)&ChrW(22359)&ChrW(125),public_editPage_asp_function)
a=replace(a,ChrW(39)&ChrW(123)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(36861)&ChrW(21152)&ChrW(21160)&ChrW(20316)&ChrW(21028)&ChrW(26029)&ChrW(125),public_editPage_add_elseif_asp)
a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(21152)&ChrW(36733)&ChrW(26356)&ChrW(22810)&ChrW(106)&ChrW(115)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),public_editpage_loadJs)
a=replace(a,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(74)&ChrW(83)&ChrW(36861)&ChrW(21152)&ChrW(20195)&ChrW(30721)&ChrW(22359)&ChrW(125),public_editPage_jsCode)

if public_js_tags_show=1 then a=replace(a,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(26631)&ChrW(31614)&ChrW(26174)&ChrW(31034)&ChrW(20195)&ChrW(30721)&ChrW(22359)&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62),getConfigSetData(ChrW(26631)&ChrW(31614)&ChrW(26174)&ChrW(31034)&ChrW(20195)&ChrW(30721)&ChrW(22359)))

if this_English="" then 
a=get_handle_EnglishHtml(a)
call echoYellowB(ChrW(25552)&ChrW(31034),ChrW(27809)&ChrW(26377)&ChrW(33521)&ChrW(25991)&ChrW(34920)&ChrW(21333)&ChrW(37197)&ChrW(32622)&ChrW(65292)&ChrW(21024)&ChrW(38500)&ChrW(33521)&ChrW(25991)&ChrW(29256)&ChrW(26412)&ChrW(20999)&ChrW(25442))
end if

if idindexname <>"" and idindexname <>ChrW(105)&ChrW(100) then
call echoYellowB(ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(25552)&ChrW(31034),ChrW(27491)&ChrW(22312)&ChrW(22788)&ChrW(29702)&ChrW(26367)&ChrW(25442)&ChrW(25351)&ChrW(23450)&ChrW(73)&ChrW(68)&ChrW(32034)&ChrW(24341)&ChrW(21517)&ChrW(61) & idindexname)
a=replace(a,ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(100),ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&idindexname&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(100)) 
a=replace(a,ChrW(32)&ChrW(105)&ChrW(100)&ChrW(60)&ChrW(62)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(100),ChrW(32)&idindexname&ChrW(60)&ChrW(62)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(100))
end if
if rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)) <>"" then
call writetofile(ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(26367)&ChrW(25442)&ChrW(20869)&ChrW(23481)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),replace(replace(replace(rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)),ChrW(34),ChrW(34)&ChrW(34)),ChrW(60)&ChrW(37),ChrW(60)&ChrW(34)&ChrW(38)&ChrW(34)&ChrW(37)),ChrW(37)&ChrW(62),ChrW(37)&ChrW(34)&ChrW(38)&ChrW(34)&ChrW(62)),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56) )
end if
a=getBatchReplaceCode(a,rs(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)))
if replaceOpenConnC <>"" then a=replace(a,ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(32)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(40)&ChrW(41),replaceOpenConnC)
a=replace(a,ChrW(101)&ChrW(120)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(68)&ChrW(76)&ChrW(73)&ChrW(115)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(34),ChrW(101)&ChrW(120)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(68)&ChrW(76)&ChrW(73)&ChrW(115)&ChrW(116)&ChrW(61)&ChrW(34)&session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))&ChrW(34))
if replaceOpenConnC <>"" then a=replaceConnToThisConn(a)
if databaseType=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then




a=replace(a,ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101),ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&databaseType&ChrW(34)) 
end if
a=handleMakeASPCode(a,cstr(rs(ChrW(97)&ChrW(115)&ChrW(112)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(90)&ChrW(105)&ChrW(112))))
d=rootFolderDir &ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
call checkWriteToFile(d,a)
call echoRedB(ChrW(29983)&ChrW(25104)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(25104)&ChrW(21151),d)
call hr()
call echo(ChrW(24635)&ChrW(20849)&ChrW(29992)&ChrW(26102),vbEchoTimer())
end function

function getBatchReplaceCode(a,b)
dim c,d,e
if isnul(b)=false then
call echoRedB(ChrW(25552)&ChrW(31034),ChrW(22788)&ChrW(29702)&ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(26367)&ChrW(25442))

c=split(b,ChrW(91)&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(93))
for each d in c
if instr(d,ChrW(91)&ChrW(61)&ChrW(62)&ChrW(93))>0 then
e=split(d,ChrW(91)&ChrW(61)&ChrW(62)&ChrW(93))
if instr(a,e(0))>0 then
a=replace(a,e(0),e(1))
else
call echo(ChrW(25552)&ChrW(31034)&ChrW(65292)&ChrW(19981)&ChrW(23384)&ChrW(22312),replace(replace(e(0),ChrW(60),ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)),ChrW(62),ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59)))
call echo(ChrW(99),replace(replace(a,ChrW(60),ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)),ChrW(62),ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59)))
call writetofile(ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),a,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
call writetofile(ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(49)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),e(0),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
call eerr(ChrW(97)&ChrW(97),"")
end if
end if
next
end if
getBatchReplaceCode=a
end function

function handleListSerchField(a,b)
dim c,d,e,f
d=split(b,ChrW(44))
for each e in d
e=phptrim(e)
if e <>"" then
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(73)&ChrW(102)&ChrW(32)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)&e&ChrW(34)&ChrW(41)&ChrW(32)&ChrW(60)&ChrW(62)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(84)&ChrW(104)&ChrW(101)&ChrW(110) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(61)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(34)&ChrW(44)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(34)&ChrW(41) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(32)&e&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)&e&ChrW(34)&ChrW(41) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(69)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(102)&ChrW(32)&ChrW(32) & vbcrlf
f=f&ChrW(38)&e&ChrW(61)&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)&e&ChrW(34)&ChrW(41)&ChrW(37)&ChrW(62)
end if
next
this_search_parem_request_asp=this_search_parem_request_asp&c

a=replace(a,ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(39),ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&f&ChrW(39))

a=replace(a,ChrW(44)&ChrW(39)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&ChrW(39)&ChrW(41),ChrW(44)&ChrW(39)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)&b&ChrW(61)&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)&b&ChrW(34)&ChrW(41)&ChrW(37)&ChrW(62)&ChrW(39)&ChrW(41))
handleListSerchField=a
end function

function get_handle_EnglishHtml(a)
dim b,c


for c=1 to 2
b=getstrcut(a,ChrW(60)&ChrW(37)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(69)&ChrW(110)&ChrW(76)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(37)&ChrW(62),ChrW(60)&ChrW(37)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(37)&ChrW(62),1)
if b <>"" then a=replace(a,b,"")
next
get_handle_EnglishHtml=a
end function

function getHandleViewConfigTypeList(a)
dim b,c,d,e
b=split(a,ChrW(44))
for each d in b
if d <>"" then
if instr(d,ChrW(124))>0 then
c=split(d,ChrW(124))
if instr(ChrW(44)&public_addToInputFieldList&ChrW(44), ChrW(44)& c(0) &ChrW(44))>0 then
c(6)=ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)
else

c(6)=ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)
end if
d=c(0)&ChrW(124)&c(1)&ChrW(124)&c(2)&ChrW(124)&c(3)&ChrW(124)&c(4)&ChrW(124)&c(5)&ChrW(124)&c(6) 
end if
if e <>"" then e=e &ChrW(44)
e=e &d 
end if
next
getHandleViewConfigTypeList=ChrW(44)&e&ChrW(44)
end function

function handle_layout_table_button(a,b,c,d)
dim e,f,g
dim h,i 
h=a(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)) 
i=phptrim(a(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))
f=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(39)&b&ChrW(39)&ChrW(58) & vbcrlf
public_listPage_toolbarCase_JsCode=public_listPage_toolbarCase_JsCode&f
if c=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121) then
e=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(40)&ChrW(34)&h&ChrW(34)&ChrW(41)&ChrW(59) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(107)&ChrW(59) & vbcrlf 
if instr(public_listPage_toolbarCase_JsCode,e)=false then
public_listPage_toolbarCase_JsCode=public_listPage_toolbarCase_JsCode&e & vbcrlf
end if
call listPage_copy_template_handle(ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116),c,h,d,i)
elseif c=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(100)&ChrW(101)&ChrW(108) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(34920)&ChrW(26684)&ChrW(24038)&ChrW(36793)&ChrW(33756)&ChrW(21333)&ChrW(92)&c&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_toolbarCase_JsCode,e)=false then
public_listPage_toolbarCase_JsCode=public_listPage_toolbarCase_JsCode&e&vbcrlf
end if 

call listPage_del_template_handle(ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116),c,h,d)
elseif c=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116) then
e=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(40)&ChrW(34)&h&ChrW(34)&ChrW(41)&ChrW(59) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(107)&ChrW(59) & vbcrlf 
if instr(public_listPage_toolbarCase_JsCode,e)=false then
public_listPage_toolbarCase_JsCode=public_listPage_toolbarCase_JsCode&e & vbcrlf
end if
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_js_function,e)=false then
public_listPage_js_function=public_listPage_js_function&e&vbcrlf
end if
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_js_function,e)=false then
public_listPage_js_function=public_listPage_js_function&e&vbcrlf
end if
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,e)=false then

if idindexname <>"" and idindexname <>ChrW(105)&ChrW(100) then 
e=replace(e,ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(41),ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&lcase(idindexname)&ChrW(34)&ChrW(41)) 
e=replace(e,ChrW(34)&ChrW(32)&ChrW(119)&ChrW(101)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34),ChrW(34)&ChrW(32)&ChrW(87)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&lcase(idindexname)&ChrW(61)&ChrW(34))
end if 
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if

elseif c=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) then
e=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(59) & vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(107)&ChrW(59) & vbcrlf 
if instr(public_listPage_toolbarCase_JsCode,e)=false then
public_listPage_toolbarCase_JsCode=public_listPage_toolbarCase_JsCode&e & vbcrlf
end if
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_js_function,e)=false then
public_listPage_js_function=public_listPage_js_function&e&vbcrlf
end if

elseif left(d,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then 


e=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&replace(mid(d,5),ChrW(123)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(125),ChrW(60)&ChrW(37)&ChrW(61)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(37)&ChrW(62))&vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(107)&ChrW(59) 
public_listPage_toolbarCase_JsCode=public_listPage_toolbarCase_JsCode&e&vbcrlf
else 
if a(ChrW(115)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101) and d=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103) then 
end if
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(34920)&ChrW(26684)&ChrW(24038)&ChrW(36793)&ChrW(33756)&ChrW(21333)&ChrW(92)&c&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if e="" then
e=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&ChrW(27809)&ChrW(26377)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(111)&ChrW(110)&ChrW(21160)&ChrW(20316)&ChrW(65292)&ChrW(37197)&ChrW(32622)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(34920)&ChrW(26684)&ChrW(24038)&ChrW(36793)&ChrW(33756)&ChrW(21333)&ChrW(47)&c&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(35831)&ChrW(23436)&ChrW(21892)&ChrW(65281)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&d&ChrW(39)&ChrW(41) &vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(107)&ChrW(59) 
end if
if instr(public_listPage_toolbarCase_JsCode,e)=false then
public_listPage_toolbarCase_JsCode=public_listPage_toolbarCase_JsCode&e&vbcrlf
end if 
if d=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(118)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(118)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(118)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,e)=false then  
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if
elseif d=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(78)&ChrW(97)&ChrW(118)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(78)&ChrW(97)&ChrW(118)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(118)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,e)=false then  
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if
elseif d=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,e)=false then  
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if
elseif d=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,e)=false then  
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if
elseif d=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,e)=false then  
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if
elseif d=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,e)=false then  
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if

end if
end if

if c=ChrW(99)&ChrW(108)&ChrW(115) then    
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(99)&ChrW(108)&ChrW(115)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(99)&ChrW(108)&ChrW(115)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_js_function,e)=false then
public_listPage_js_function=public_listPage_js_function&e&vbcrlf
end if
end if
end function

function handle_layout_table_action(a,b,c,d)
dim e,f,g,h,i,j
h=phptrim(a(ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)))
call echo(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),d)
call echo(ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61) & a(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)),b)
i=ChrW(26080)
if b=ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(82)&ChrW(111)&ChrW(119) or b=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(82)&ChrW(111)&ChrW(119)  then 
f=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(112)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(34)&c&ChrW(34)&ChrW(41)&vbcrlf
call listPage_copy_template_handle(ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109),b,c,d,h)
i=ChrW(22797)&ChrW(21046)
elseif b=ChrW(100)&ChrW(101)&ChrW(108) or b=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45)&ChrW(100)&ChrW(101)&ChrW(108)  then 
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(33756)&ChrW(21333)&ChrW(92)&b&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
f=f&e & vbcrlf 

call listPage_del_template_handle(ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109),b,c,d)
i=ChrW(21024)&ChrW(38500)

elseif (left(b,10)=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) or left(b,15)=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45)) and d=ChrW(98)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)  then 
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(33756)&ChrW(21333)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))    
if e <>"" then
f=f&e & vbcrlf
end if 
i=ChrW(29983)&ChrW(25104)&ChrW(24067)&ChrW(23616)&ChrW(39029)

elseif (left(b,10)=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) or left(b,15)=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45)) and d=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)  then 
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(33756)&ChrW(21333)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(77)&ChrW(97)&ChrW(110)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))    
if e <>"" then
f=f&e & vbcrlf
end if 
i=ChrW(36827)&ChrW(20837)&ChrW(31649)&ChrW(29702)

elseif (left(b,10)=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) or left(b,15)=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45)) and d=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(67)&ChrW(97)&ChrW(105)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)  then 
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(33756)&ChrW(21333)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(67)&ChrW(97)&ChrW(105)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))    
if e <>"" then
f=f&e & vbcrlf
end if 
i=ChrW(37319)&ChrW(38598)&ChrW(39029)&ChrW(21019)&ChrW(24314)

elseif left(d,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then 


f=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&replace(mid(d,5),ChrW(123)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(125),ChrW(60)&ChrW(37)&ChrW(61)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(37)&ChrW(62))&vbcrlf
i=ChrW(36339)&ChrW(36716)&ChrW(32593)&ChrW(22336)&ChrW(61) & d
elseif (left(b,10)=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) or left(b,15)=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45)) and d=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(33756)&ChrW(21333)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if e <>"" then
f=f&e & vbcrlf 
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if


e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_asp_function,e)=false then
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(77)&ChrW(100)&ChrW(98)&ChrW(80)&ChrW(111)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_asp_function,e)=false then
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if
i=ChrW(21019)&ChrW(24314)&ChrW(25968)&ChrW(25454)&ChrW(34920)
elseif (left(b,10)=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) or left(b,15)=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45)) and d=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(33756)&ChrW(21333)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if e <>"" then
f=f&e & vbcrlf 
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if


e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_asp_function,e)=false then
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(77)&ChrW(100)&ChrW(98)&ChrW(80)&ChrW(111)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_asp_function,e)=false then
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if
i=ChrW(21019)&ChrW(24314)&ChrW(25968)&ChrW(25454)&ChrW(34920)&ChrW(23383)&ChrW(27573)
elseif (left(b,10)=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) or left(b,15)=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45)) and d=ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(33756)&ChrW(21333)&ChrW(92)&ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if e <>"" then
f=f&e & vbcrlf 
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if


e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_asp_function,e)=false then
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if
i=ChrW(23548)&ChrW(20837)&ChrW(34920)&ChrW(21040)&ChrW(24067)&ChrW(23616)
elseif (left(b,10)=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) or left(b,15)=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45)) and d=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103) then
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(33756)&ChrW(21333)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if e <>"" then
f=f&e & vbcrlf 
end if

e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if


e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_asp_function,e)=false then
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if
i=ChrW(23548)&ChrW(20986)&ChrW(24067)&ChrW(23616)&ChrW(39029)&ChrW(21450)&ChrW(30456)&ChrW(20851)&ChrW(37197)&ChrW(32622)
else
call echoYellowB(ChrW(97)&ChrW(97)&ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110),b) 
dim k,l
if left(b,5)=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45) then
k=copyStr(ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32),3)
l=ChrW(23376)&ChrW(33756)&ChrW(21333)
end if

if (left(b,10)=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45) or left(b,15)=ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(45)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(45)) and d <>"" then
b=d


j=ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&d&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if checkFile(j) then
e=readfile(j,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_elseif_aspCode,e)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&e&vbcrlf
end if
end if

j=ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&d&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if checkFile(j) then
e=readfile(j,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if instr(public_listPage_asp_function,e)=false then
public_listPage_asp_function=public_listPage_asp_function&e&vbcrlf
end if
end if

j=ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&d&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)
if checkFile(j) then
e=readfile(j,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_js_function,e)=false then
public_listPage_js_function=public_listPage_js_function&e&vbcrlf
end if 
end if
end if
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(33756)&ChrW(21333)&ChrW(92)&b&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))  
if e <>"" then
f=f&e & vbcrlf
elseif b <>ChrW(109)&ChrW(111)&ChrW(114)&ChrW(101) then

f=f&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&k&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&l&ChrW(27809)&ChrW(26377)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(40)&ChrW(100)&ChrW(101)&ChrW(109)&ChrW(111)&ChrW(41)&ChrW(41)&ChrW(21160)&ChrW(20316)&ChrW(65292)&ChrW(37197)&ChrW(32622)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(39033)&ChrW(33756)&ChrW(21333)&ChrW(47)&b&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(35831)&ChrW(23436)&ChrW(21892)&ChrW(65281)&d&ChrW(39)&ChrW(41) &vbcrlf
end if
i=ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61) & d
end if
call echoB(ChrW(115)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116),i)
handle_layout_table_action=f 
end function

function handle_layout_table_toolbar(a,b,c,d)
dim e
if b=ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114) then
else 

if left(d,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then  
e=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(39)&a&ChrW(39)&ChrW(58) & vbcrlf   
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&replace(mid(d,5),ChrW(123)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(125),ChrW(60)&ChrW(37)&ChrW(61)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(37)&ChrW(62))&vbcrlf
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(107)&ChrW(59) 
else      
e=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(34920)&ChrW(26684)&ChrW(21491)&ChrW(36793)&ChrW(22270)&ChrW(26631)&ChrW(25353)&ChrW(38062)&ChrW(92)&b&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))   
if e="" then
e=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(39)&a&ChrW(39)&ChrW(58) & vbcrlf   
if c <>"" then
c=c&vbcrlf&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(107)&ChrW(59)
else 
e=e&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&ChrW(27809)&ChrW(26377)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(111)&ChrW(110)&ChrW(21160)&ChrW(20316)&ChrW(65292)&ChrW(19968)&ChrW(32423)&ChrW(33756)&ChrW(21333)&ChrW(65292)&ChrW(37197)&ChrW(32622)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(34920)&ChrW(26684)&ChrW(21491)&ChrW(36793)&ChrW(22270)&ChrW(26631)&ChrW(25353)&ChrW(38062)&ChrW(47)&b&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(35831)&ChrW(23436)&ChrW(21892)&ChrW(65281)&ChrW(39)&ChrW(41) &vbcrlf
e=e & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(98)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(107)&ChrW(59)
end if 
end if
end if
if instr(public_listPage_toolbarCase_JsCode,e)=false then
public_listPage_toolbarCase_JsCode=public_listPage_toolbarCase_JsCode&e&vbcrlf & c & vbcrlf
end if
end if
end function

function handle_layout_table_toolbar_small(a,b)
dim c
if a=ChrW(99)&ChrW(108)&ChrW(115)&ChrW(51)&ChrW(51)&ChrW(51)&ChrW(51) or a=ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101) then  
else  

if a=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117) then

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_elseif_aspCode,c)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&c&vbcrlf
end if 

elseif a=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117)&ChrW(95)&ChrW(99)&ChrW(115)&ChrW(118) or a=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117)&ChrW(95)&ChrW(101)&ChrW(120)&ChrW(99)&ChrW(101)&ChrW(108) then
c=ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(106)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(34)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(34)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(106)&ChrW(115)&ChrW(47)&ChrW(101)&ChrW(120)&ChrW(99)&ChrW(101)&ChrW(108)&ChrW(46)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(46)&ChrW(106)&ChrW(115)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)
if instr(public_listPage_scriptSrc,c)=false then
public_listPage_scriptSrc=public_listPage_scriptSrc&c&vbcrlf
end if 

elseif a=ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101) then 

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_elseif_aspCode,c)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&c&vbcrlf
end if 
c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(100)&ChrW(97)&ChrW(111)&ChrW(99)&ChrW(104)&ChrW(117)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,c)=false then         
public_listPage_asp_function=public_listPage_asp_function & c & vbcrlf
end if

elseif a=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(73)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)  then  

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(77)&ChrW(111)&ChrW(100)&ChrW(97)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_js_function,c)=false then
public_listPage_js_function=public_listPage_js_function&c&vbcrlf
end if 

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(73)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_elseif_aspCode,c)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&c&vbcrlf
end if 

elseif a=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)  then   

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(77)&ChrW(111)&ChrW(100)&ChrW(97)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_js_function,c)=false then
public_listPage_js_function=public_listPage_js_function&c&vbcrlf
end if 

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_elseif_aspCode,c)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&c&vbcrlf
end if 

elseif a=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then    

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(77)&ChrW(111)&ChrW(100)&ChrW(97)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_js_function,c)=false then
public_listPage_js_function=public_listPage_js_function&c&vbcrlf
end if 

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_elseif_aspCode,c)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&c&vbcrlf
end if 

elseif a=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(77)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then    

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(69)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(77)&ChrW(111)&ChrW(100)&ChrW(97)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_js_function,c)=false then
public_listPage_js_function=public_listPage_js_function&c&vbcrlf
end if 

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(77)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if instr(public_listPage_elseif_aspCode,c)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&c&vbcrlf
end if  
end if
if left(b,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then  
c=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&replace(mid(b,5),ChrW(123)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(125),ChrW(60)&ChrW(37)&ChrW(61)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(37)&ChrW(62))&vbcrlf  
else      
c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(34920)&ChrW(26684)&ChrW(21491)&ChrW(36793)&ChrW(22270)&ChrW(26631)&ChrW(25353)&ChrW(38062)&ChrW(92)&a&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if c="" then 
c=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&ChrW(27809)&ChrW(26377)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(111)&ChrW(110)&ChrW(21160)&ChrW(20316)&ChrW(65292)&ChrW(20108)&ChrW(23376)&ChrW(32423)&ChrW(33756)&ChrW(21333)&ChrW(65292)&ChrW(37197)&ChrW(32622)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(34920)&ChrW(26684)&ChrW(21491)&ChrW(36793)&ChrW(22270)&ChrW(26631)&ChrW(25353)&ChrW(38062)&ChrW(47)&a&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(35831)&ChrW(23436)&ChrW(21892)&ChrW(65281)&ChrW(39)&ChrW(41) &vbcrlf

end if
end if
handle_layout_table_toolbar_small=c & vbcrlf

if b=ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) then   

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))       
if instr(public_listPage_elseif_aspCode,c)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&c&vbcrlf
end if

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(65)&ChrW(110)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,c)=false then         
public_listPage_asp_function=public_listPage_asp_function & c & vbcrlf
end if

elseif b=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103) then   

c=ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(35)&ChrW(73)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(117)&ChrW(100)&ChrW(101)&ChrW(32)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(47)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(34)&ChrW(45)&ChrW(45)&ChrW(62)
if instr(public_listPage_include_fileList,c)=false then
public_listPage_include_fileList=public_listPage_include_fileList&vbcrlf&c 
end if

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))       
if instr(public_listPage_elseif_aspCode,c)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode&c&vbcrlf
end if

c=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,c)=false then         
public_listPage_asp_function=public_listPage_asp_function & c & vbcrlf
end if
end if
end if
end function

function handle_layout_listpage_form(a)
dim b,c,d
dim e
e=phptrim(a(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)))
if a(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110) then
if a(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(115)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107) then
b=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(92)&ChrW(115)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))   
if b="" then
b=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&ChrW(115)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(32)&ChrW(24453)&ChrW(24320)&ChrW(21457)&ChrW(39)&ChrW(41)
end if
if instr(public_listPage_active_jsCode,b)=false then
public_listPage_active_jsCode=public_listPage_active_jsCode&b&vbcrlf
end if
b=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(115)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,b)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode & b & vbcrlf
end if 
b=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,b)=false then         
public_listPage_asp_function=public_listPage_asp_function & b & vbcrlf
end if 
elseif a(ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(67)&ChrW(102)&ChrW(103) then
b=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(67)&ChrW(102)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))   
if b="" then
b=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(67)&ChrW(102)&ChrW(103)&ChrW(32)&ChrW(24453)&ChrW(24320)&ChrW(21457)&ChrW(39)&ChrW(41)
end if
if instr(public_listPage_active_jsCode,b)=false then
public_listPage_active_jsCode=public_listPage_active_jsCode&b&vbcrlf
end if
b=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(69)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(102)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(67)&ChrW(102)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_elseif_aspCode,b)=false then
public_listPage_elseif_aspCode=public_listPage_elseif_aspCode & b & vbcrlf
end if 
b=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(66)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(67)&ChrW(102)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,b)=false then         
public_listPage_asp_function=public_listPage_asp_function & b & vbcrlf
end if 
b=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&ChrW(100)&ChrW(101)&ChrW(99)&ChrW(84)&ChrW(115)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(public_listPage_asp_function,b)=false then         
public_listPage_asp_function=public_listPage_asp_function & b & vbcrlf
end if 
elseif left(e,4)=ChrW(117)&ChrW(114)&ChrW(108)&ChrW(58) then          
d=ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101) & handleMD5(e,16) 
b=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(44)&d&ChrW(58)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(41)&ChrW(123) & vbcrlf  
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&replace(mid(e,5),ChrW(123)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(125),ChrW(60)&ChrW(37)&ChrW(61)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(37)&ChrW(62))&vbcrlf 
public_listPage_active_jsCode=public_listPage_active_jsCode&b&vbcrlf 
else
b=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(92)&e&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))   
if b="" then
b=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(44)&e&ChrW(58)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(41)&ChrW(123) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&ChrW(27809)&ChrW(26377)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(21160)&ChrW(20316)&ChrW(65292)&ChrW(37197)&ChrW(32622)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(74)&ChrW(83)&ChrW(95)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(47)&e&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(19981)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(35831)&ChrW(23436)&ChrW(21892)&ChrW(65281)&ChrW(39)&ChrW(41)
end if 
if instr(public_listPage_active_jsCode,b)=false then
public_listPage_active_jsCode=public_listPage_active_jsCode&b&vbcrlf
end if
end if
elseif a(ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))=ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116) then
b=readfile(ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(21015)&ChrW(34920)&ChrW(39029)&ChrW(34920)&ChrW(21333)&ChrW(92)&ChrW(28857)&ChrW(20987)&ChrW(25628)&ChrW(32034)&ChrW(25353)&ChrW(38062)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if instr(this_listPage_Form_JS,b)=false then         
this_listPage_Form_JS=this_listPage_Form_JS & b & vbcrlf
end if  
end if
end function 

function getHandle_listsearch(a)
dim b,c,d,e,f
if phptrim(a)=ChrW(105)&ChrW(112)&ChrW(95)&ChrW(98)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(95)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104) then
getHandle_listsearch=ChrW(40)&ChrW(91)&ChrW(98)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(62)&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(105)&ChrW(112)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(41)&ChrW(45)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(38)&ChrW(34)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(91)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(93)&ChrW(60)&ChrW(61)&ChrW(34)&ChrW(38)&ChrW(40)&ChrW(105)&ChrW(112)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(41)&ChrW(43)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(41)&ChrW(38)&ChrW(34)&ChrW(41)
exit function
end if
b=split(phptrim(a),ChrW(32))
for each c in b
if c <>"" then
if d <>"" then d=d & ChrW(32)
if c <>ChrW(97)&ChrW(110)&ChrW(100) and c <>ChrW(111)&ChrW(114) then 



e=getFieldAlt(db_PREFIX & rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)), c)
f=ChrW(39)
if instr(ChrW(44)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(44)&ChrW(89)&ChrW(101)&ChrW(115)&ChrW(78)&ChrW(111)&ChrW(44)&ChrW(70)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(44)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(44), ChrW(44)&e&ChrW(44))>0 then
f=""      
end if        
d=d & ChrW(32)&ChrW(91)&c&ChrW(93)&ChrW(32)&ChrW(108)&ChrW(105)&ChrW(107)&ChrW(101)&ChrW(32)&f&ChrW(37)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(37)&f&ChrW(32)
else
d=d & c
end if
end if
next
if d <>"" then d=ChrW(40)&d&ChrW(41)
getHandle_listsearch=d
end function
%>
