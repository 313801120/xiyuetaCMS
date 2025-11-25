<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../inc/Config.Asp"-->
<%
dim dbport
if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110) then
call checkLogin()
end if 

function checkLogin()
dim a,b,c 
c=ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)
a=ChrW(47)&ChrW(46)&ChrW(46)&ChrW(47)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116) 
if checkFile(a) then  
b=readfile(a,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))   
c=phptrim(getStrCut(b,ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34),ChrW(34),0)) 
end if
if trim(request(ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)))=c then
session(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115))=ChrW(109)&ChrW(105)&ChrW(109)&ChrW(97)
else
call echo(ChrW(25552)&ChrW(31034),ChrW(23494)&ChrW(30721)&ChrW(38169)&ChrW(35823))
end if
end function
call checkInstallLogin()

function checkInstallLogin()
if session(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115))="" then
call die(ChrW(60)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(49)&ChrW(39)&ChrW(32)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(39)&ChrW(32)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(61)&ChrW(39)&ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(39)&ChrW(62)&ChrW(23494)&ChrW(30721)&ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(39)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(39)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(39)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(39)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(39)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(30331)&ChrW(24405)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(62))   
end if 
end function

function autoHandleSqlToSqlServerOrMysql(a)
if databaseType = ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)  then
a=handleMysql(a)  
elseif databaseType = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)  then
a=handleSqlServer(a)         
end if
autoHandleSqlToSqlServerOrMysql=a
end function
%> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>安装SQLServer/Access数据库,QQ:313801120:::</title>
<style type="text/css">
a img {
border: none
}
.imga { 
vertical-align: bottom;
}
.imgb {
vertical-align: bottom;
display: block;
}
/*解决图片下面有空隙的简单方法  以前是img{这样图片就会换行*/
body,
div,
p,
img,
dl,
dt,
dd,
ul,
ol,
li,
h1,
h2,
h3,
h4,
h5,
h6,
pre,
form,
fieldset,
input,
textarea,
blockquote {
padding: 0px;
margin: 0px
}
li {
list-style-type: none
}
a {
font-size: 12px;
line-height: 18px;
color: #000000;
text-decoration: none
}
a:hover {
text-decoration: none;
color: #000099
}
/*PHPCMS表单样式*/
.input-text,
.measure-input,
textarea,
input.date,
input.endDate,
.input-focus {
border: 1px solid #A7A6AA;
height: 22px;
line-height: 22px;
margin: 0 5px 0 0;
padding: 2px 0 2px 5px;
border: 1px solid #d0d0d0;
background: #FFF url(../images/input.png) repeat-x;
font-family: Verdana, Geneva, sans-serif, "宋体";
font-size: 12px;
}
input.date,
input.endDate {
background: #fff url(../images/input_date.png) no-repeat right 3px;
padding-right: 18px;
font-size: 12px;
}
select {
vertical-align: middle;
background: none repeat scroll 0 0 #F9F9F9;
border-color: #666666 #CCCCCC #CCCCCC #666666;
border-style: solid;
border-width: 1px;
color: #333;
padding: 2px;
}
/*自定义按钮 待改进*/
.btnclick1 {
color: #000;
font-size: 14px;
padding: 0 20px;
background-color: #fff;
border: 0px;
border: 1px solid #666666;
text-decoration: none;
cursor: pointer;
line-height: 26px;
font-weight: bold;
border-radius: 5px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
-o-border-radius: 5px;
}
.btnclick1:hover {
background-color: #E6E6E6;
background-position: 0px -50px;
}
.btnclick1:active {
background-color: #fff;
}
.pright {
width: 720px;
margin: 0 auto;
}
.pr-title {
width: 720px;
height: 22px;
margin: 8px auto 0px;
overflow: hidden;
}
.pr-title h3 {
width: 158px;
height: 22px;
line-height: 22px;
overflow: hidden;
display: block;
font-size: 12px;
padding-top: 1px;
text-indent: 10px;
letter-spacing: 2px;
color: #6D8A4F;
font-weight: bold;
}
input {
vertical-align: middle;
margin-right: 3px;
font-size: 12px;
}
textarea {
vertical-align: top;
font-size: 12px;
line-height: 156%;
border: 1px solid #AAA;
padding: 3px;
letter-spacing: 1px;
word-break: break-all;
overflow-y: auto;
}
.input-txt {
padding: 4px 8px 4px 6px;
border: 1px solid #AAA;
font-size: 12px;
color: #000;
width: 200px;
}
.textipt_on {
border: 1px solid #F90;
}
hr {
height: 1px;
line-height: 1px;
overflow: hidden;
border-width: 1px 0px 0px 0px;
border-top: 1px solid #E6E6E6;
/*兼容Opera*/
}
hr:empty {
margin: 8px 0px 7px 0px !important;
margin: 0px;
}
small {
font-size: 12px;
}
.moncolor td {
background: #FFC;
}
.twbox {
width: 706px;
border: 1px solid #CFDCC9;
font-size: 12px;
overflow: hidden;
margin: 8px auto;
}
.twbox thead tr td {
height: 31px;
line-height: 31px;
text-indent: 10px;
}
.twbox thead tr td strong {
letter-spacing: 2px;
margin-right: 14px;
color: #FFF;
font-size: 14px;
}
.twbox thead tr td span {
color: #CDA;
}
.twbox thead tr td p {
height: 31px;
display: inline;
float: right;
margin: -31px 10px 0 0;
overflow: hidden;
}
.twbox thead tr td p * {
float: right;
}
.twbox thead tr td a.thlink {
color: #FFF;
}
.twbox thead tr td a.thlink:hover {
color: #FFFF00;
text-decoration: none;
}
.twbox tbody {
overflow: hidden;
text-align: left;
}
.twbox tbody tr th {
background: #F9FCEF;
color: #6D8A4F;
line-height: 21px;
height: 21px;
text-indent: 30px;
font-weight: normal;
border-bottom: 1px solid #EFF7D8;
letter-spacing: 2px;
}
.twbox tbody tr td {
padding: 7px;
border-bottom: 1px solid #F2F2F2;
color: #333;
vertical-align: top;
}
.twbox tbody tr td p {
line-height: 21px;
}
.twbox tbody tr td p strong img {
vertical-align: middle;
}
.twbox tbody tr td img {
vertical-align: top;
margin: 0px 10px 5px 0px;
}
.twbox tbody tr td small {
color: #888;
}
.twbox tfoot tr td {
padding: 10px;
line-height: 25px;
text-align: center;
}
.twbox tfoot tr td p {
line-height: 21px;
margin-bottom: 10px;
}
input.but {
height: 26px;
padding-left: 6px;
padding-right: 6px;
line-height: 26px;
font-weight: bold;
letter-spacing: 1px;
color: #FFF;
background-color: #FC3;
}
.onetd {
width: 120px;
text-align: right;
line-height: 25px;
}
.mytipwrap {
line-height: 30px;
color: #999999;
}
a.mytip {
line-height: 14px;
padding: 6px 20px;
border-style: solid;
border-width: 1px;
border-color: #EEE #CCC #CCC #EEE;
background: #FAFAFA;
color: #333;
margin-right: 10px;
text-decoration: none;
}
</style>
</head>
<body>
<% 
dim selectDatabase, dbhost, dbuser, dbpwd, dbname, accessDir, accessPath, configFilePath, content, startStr, endStr, findStr, replaceStr 
dim mysql_dbhost, mysql_dbuser, mysql_dbpwd, mysql_dbname
dim tempContent, msgStr, isYes, connStr 
dim showLayout
dim tableListC 
call loadRun()
sub loadRun()
if EDITORTYPE = ChrW(97)&ChrW(115)&ChrW(112) then
configFilePath = ChrW(47)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(47)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(65)&ChrW(115)&ChrW(112) 
elseif EDITORTYPE = ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120) then
configFilePath = ChrW(47)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(95)&ChrW(99)&ChrW(115)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(112)&ChrW(47)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(120) 
elseif EDITORTYPE = ChrW(106)&ChrW(115)&ChrW(112) then
configFilePath = ChrW(47)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(95)&ChrW(106)&ChrW(115)&ChrW(112)&ChrW(47)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(106)&ChrW(115)&ChrW(112) 
end if 
if request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) then
call createAccess()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(73)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116) then
call displayImportTableLayout()
elseif request(ChrW(97)&ChrW(99)&ChrW(116)) = ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(73)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97) then
call displayImportData()
else
call displayDefault() 
end if 

end sub 

function checkCreateTable(byval a)
dim b 
b = lcase(a) 
if db_PREFIX <> "" then
b = mid(b, len(db_PREFIX) + 1) 
end if 



tableListC = tableListC & b & ChrW(124) 


checkCreateTable = checkTable_show(a) 
end function 


sub webData(a, b, c)
dim d, e, f, g, h, i, j, k, l 
dim m, n, o, p, q, r, s 


d = a & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)  
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(97)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(113)&ChrW(113)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(105)&ChrW(103)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(113)&ChrW(114)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(124)&ChrW(99)&ChrW(110)&ChrW(124)&ChrW(101)&ChrW(110)&ChrW(124)&ChrW(34)&ChrW(44)

e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(112)&ChrW(108)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)

conn.execute(e) 
end if 

d = a & ChrW(115)&ChrW(104)&ChrW(101)&ChrW(115)&ChrW(104)&ChrW(105) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)

conn.execute(e) 
end if   

d = a & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(105)&ChrW(103)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(97)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if 

d = a & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(49)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(51)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(52)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(53)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(54)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(55)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(56)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(57)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49)&ChrW(48)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49)&ChrW(49)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(49)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if      

d = a & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(108)&ChrW(111)&ChrW(117)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(103)&ChrW(111)&ChrW(111)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(97)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(105)&ChrW(103)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(110)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(98)&ChrW(117)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(73)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(117)&ChrW(121)&ChrW(95)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(95)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(82)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(84)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(121)&ChrW(95)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(73)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(82)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(84)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(97)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(113)&ChrW(113)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(115)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(111)&ChrW(112)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if  

d = a & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(115)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(105)&ChrW(99) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(111)&ChrW(110)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(97)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if   

d = a & ChrW(99)&ChrW(104)&ChrW(97)&ChrW(116) 
if checkCreateTable(d) = false then 
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(111)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)

e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if 

d = a & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(82)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)


e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(30007)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(112)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if   

d = a & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(95)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(101)&ChrW(114)&ChrW(109)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if     

d = a & ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(108)&ChrW(111)&ChrW(103) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if 

d = a & ChrW(102)&ChrW(114)&ChrW(105)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(107) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if 

d = a & ChrW(106)&ChrW(111)&ChrW(98) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(100)&ChrW(117)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(107)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(104)&ChrW(108)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e)  
end if  

d = a & ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(98)&ChrW(111)&ChrW(111)&ChrW(107) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(97)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(113)&ChrW(113)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(115)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if 

d = a & ChrW(102)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(101)&ChrW(101)&ChrW(100)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(103)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(97)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(113)&ChrW(113)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(115)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if 

d = a & ChrW(109)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(105)&ChrW(114)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(97)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(56)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(104)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(113)&ChrW(113)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(100)&ChrW(99)&ChrW(97)&ChrW(114)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(111)&ChrW(102)&ChrW(98)&ChrW(105)&ChrW(114)&ChrW(116)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(111)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(120)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(120)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(104)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(111)&ChrW(98)&ChrW(98)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(103)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if 

d = a & ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)   
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(110)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(121)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(109)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(100)&ChrW(105)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)

conn.execute(e) 
end if  

d = a & ChrW(100)&ChrW(105)&ChrW(97)&ChrW(114)&ChrW(121)
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)           
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(114)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e)
end if

d = a & ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(112)&ChrW(118)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(105)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(117)&ChrW(114)&ChrW(108)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(116)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(119)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(104)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(105)&ChrW(105)&ChrW(115)&ChrW(108)&ChrW(111)&ChrW(103) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(98)&ChrW(114)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(51)&ChrW(50)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(105)&ChrW(105)&ChrW(115)&ChrW(105)&ChrW(112)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(112)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(105)&ChrW(105)&ChrW(115)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(119)&ChrW(111)&ChrW(114)&ChrW(107)&ChrW(97)&ChrW(116)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(97)&ChrW(110)&ChrW(99)&ChrW(101) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)   
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(103)&ChrW(111)&ChrW(116)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(115)&ChrW(107)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(115)&ChrW(97)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(101)&ChrW(108)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(108)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(102)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(107)&ChrW(121)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(107)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
for i=1 to 31
e = e & ChrW(91)&ChrW(110)&ChrW(111)& i &ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
next
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if  

d = a & ChrW(105)&ChrW(112) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(98)&ChrW(101)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(121)&ChrW(117)&ChrW(110)&ChrW(121)&ChrW(105)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e)
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)   
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(83)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(85)&ChrW(112)&ChrW(68)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(66)&ChrW(97)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(68)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(83)&ChrW(101)&ChrW(97)&ChrW(114)&ChrW(99)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(66)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(111)&ChrW(80)&ChrW(101)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(98)&ChrW(108)&ChrW(67)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(77)&ChrW(97)&ChrW(111)&ChrW(72)&ChrW(97)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(77)&ChrW(97)&ChrW(111)&ChrW(72)&ChrW(97)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(79)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(66)&ChrW(121)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(81)&ChrW(117)&ChrW(101)&ChrW(114)&ChrW(121)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(101)&ChrW(108)&ChrW(112)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(90)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)     
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(79)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(69)&ChrW(110)&ChrW(103)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(79)&ChrW(110)&ChrW(108)&ChrW(121)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(84)&ChrW(119)&ChrW(111)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(72)&ChrW(101)&ChrW(97)&ChrW(100)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(72)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(86)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(76)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(73)&ChrW(99)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(82)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(67)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(74)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(82)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(82)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(73)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(76)&ChrW(97)&ChrW(121)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(72)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(72)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(83)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if 

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)     
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(111)&ChrW(111)&ChrW(108)&ChrW(98)&ChrW(97)&ChrW(114) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)     
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)     
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)     
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(66)&ChrW(74)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(99)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)      
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(98)&ChrW(105)&ChrW(103)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(72)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)   
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(73)&ChrW(80)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(100)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(82)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(95)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(99)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(99)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(83)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(69)&ChrW(110)&ChrW(100)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(83)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(76)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(117)&ChrW(114)&ChrW(108)&ChrW(83)&ChrW(117)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(68)&ChrW(74)&ChrW(83)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(106)&ChrW(115)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(80)&ChrW(97)&ChrW(114)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(84)&ChrW(120)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(49)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(84)&ChrW(120)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(108)&ChrW(84)&ChrW(120)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(51)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(83)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(76)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(69)&ChrW(114)&ChrW(114)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(67)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(103)&ChrW(111)&ChrW(116)&ChrW(111)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(83)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(95)&ChrW(99)&ChrW(97)&ChrW(105)&ChrW(95)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(102)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(117)&ChrW(115)&ChrW(116)&ChrW(111)&ChrW(109)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(76)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(82)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(68)&ChrW(101)&ChrW(98)&ChrW(117)&ChrW(103)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(86)&ChrW(98)&ChrW(67)&ChrW(114)&ChrW(108)&ChrW(102)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(72)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if

d = a & ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(73)&ChrW(68)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(73)&ChrW(68)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(79)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(73)&ChrW(68)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(77)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(73)&ChrW(68)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(97)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(49)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(51)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(49)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(51)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(52)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(53)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(54)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(55)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(56)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(57)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(49)&ChrW(48)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(49)&ChrW(49)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(49)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(49)&ChrW(51)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(72)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(103)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(71)&ChrW(79)&ChrW(80)&ChrW(69)&ChrW(78)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(49)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(51)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(52)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(53)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(54)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(55)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(56)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(57)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(84)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(49)&ChrW(48)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(51)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(50)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(51)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(101)&ChrW(110)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(111)&ChrW(117)&ChrW(116)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(106)&ChrW(105)&ChrW(110)&ChrW(113)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)

conn.execute(e) 
end if

d = a & ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)  
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(91) & d & ChrW(93)&ChrW(32)&ChrW(40)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(106)&ChrW(105)&ChrW(110)&ChrW(113)&ChrW(105)&ChrW(97)&ChrW(110)&ChrW(93)&ChrW(32)&ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(101)&ChrW(119)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(116)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)

conn.execute(e) 
end if 

d = a & ChrW(110)&ChrW(101)&ChrW(119)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(112)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(101)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(101)&ChrW(120)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)

conn.execute(e) 
end if

d = a & ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(79)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(110)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44)  
e = e & ChrW(91)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if   

d = a & ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(77)&ChrW(111)&ChrW(114)&ChrW(101)&ChrW(67)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(109)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(45)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(110)&ChrW(112)&ChrW(101)&ChrW(105)&ChrW(120)&ChrW(117)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(48)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if 

d = a & ChrW(121)&ChrW(105)&ChrW(121)&ChrW(97)&ChrW(110) 
if checkCreateTable(d) = false then
e = ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(32) & d & ChrW(32)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(73)&ChrW(100)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(121)&ChrW(40)&ChrW(48)&ChrW(44)&ChrW(49)&ChrW(41)&ChrW(32)&ChrW(80)&ChrW(114)&ChrW(105)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(121)&ChrW(32)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(44) 
e = e & ChrW(91)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(117)&ChrW(105)&ChrW(100)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(104)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(107)&ChrW(111)&ChrW(116)&ChrW(111)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(115)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(93)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(49)&ChrW(44)
e = e & ChrW(91)&ChrW(105)&ChrW(112)&ChrW(93)&ChrW(32)&ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(44)
e = e & ChrW(91)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(78)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)&ChrW(44)
e = e & ChrW(91)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(68)&ChrW(101)&ChrW(102)&ChrW(97)&ChrW(117)&ChrW(108)&ChrW(116)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(41)
e = autoHandleSqlToSqlServerOrMysql(e)
conn.execute(e) 
end if 
f = true 
if f = true then





dim t, u 
t = ChrW(119)&ChrW(101)&ChrW(98)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(44)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(107)&ChrW(101)&ChrW(121)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(115)&ChrW(44)&ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(44)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(85)&ChrW(114)&ChrW(108)&ChrW(44)&ChrW(87)&ChrW(101)&ChrW(98)&ChrW(102)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(44)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110) 
u = ChrW(39)&ChrW(32593)&ChrW(31449)&ChrW(26631)&ChrW(39064)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(32593)&ChrW(31449)&ChrW(20851)&ChrW(38190)&ChrW(35789)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(32593)&ChrW(31449)&ChrW(25551)&ChrW(36848)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)&ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(29256)&ChrW(26435)&ChrW(25152)&ChrW(26377)&ChrW(32)&ChrW(23567)&ChrW(20113)&ChrW(25152)&ChrW(26377)&ChrW(32)&ChrW(30005)&ChrW(35805)&ChrW(65306)&ChrW(48)&ChrW(50)&ChrW(49)&ChrW(45)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(54)&ChrW(32)&ChrW(20256)&ChrW(30495)&ChrW(65306)&ChrW(48)&ChrW(50)&ChrW(49)&ChrW(45)&ChrW(56)&ChrW(56)&ChrW(56)&ChrW(56)&ChrW(56)&ChrW(56)&ChrW(56)&ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(32852)&ChrW(31995)&ChrW(81)&ChrW(81)&ChrW(65306)&ChrW(51)&ChrW(49)&ChrW(51)&ChrW(56)&ChrW(48)&ChrW(49)&ChrW(49)&ChrW(50)&ChrW(48)&ChrW(32)&ChrW(37038)&ChrW(31665)&ChrW(65306)&ChrW(51)&ChrW(49)&ChrW(51)&ChrW(56)&ChrW(48)&ChrW(49)&ChrW(49)&ChrW(50)&ChrW(48)&ChrW(64)&ChrW(113)&ChrW(113)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(50)&ChrW(48)&ChrW(50)&ChrW(51)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(118)&ChrW(50)&ChrW(46)&ChrW(48)&ChrW(39) 
conn.execute(ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & a & ChrW(119)&ChrW(101)&ChrW(98)&ChrW(115)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(40) & t & ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40) & u & ChrW(41)) 
session(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(105)&ChrW(100))=0
rs.open ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32) & a & ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(48) ,conn,1,3
if not rs.eof then
rs(ChrW(117)&ChrW(112)&ChrW(105)&ChrW(112))=getip()
rs.update
end if:rs.close
end if 
end sub 

sub createAccess()
dim a, b 
a = request(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
b = request(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(119)&ChrW(100)) 
call openconn() 
call webData(db_PREFIX, a, b)
showLayout = ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(53)
end sub 

sub displayDefault()
dim a       
showLayout = ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(49) 

selectDatabase = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) 
dbhost = ChrW(108)&ChrW(111)&ChrW(99)&ChrW(97)&ChrW(108)&ChrW(104)&ChrW(111)&ChrW(115)&ChrW(116) 
dbuser = ChrW(115)&ChrW(97) 
dbpwd = ChrW(115)&ChrW(97)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115) 
dbname = ChrW(119)&ChrW(101)&ChrW(98)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97) 
dbport = ChrW(49)&ChrW(52)&ChrW(51)&ChrW(51) 
mysql_dbhost = ChrW(49)&ChrW(50)&ChrW(55)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(46)&ChrW(49) 
mysql_dbuser = ChrW(114)&ChrW(111)&ChrW(111)&ChrW(116) 
mysql_dbpwd = ChrW(114)&ChrW(111)&ChrW(111)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115) 
mysql_dbname = ChrW(116)&ChrW(101)&ChrW(115)&ChrW(116) 
accessDir = ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(47) 
msgStr = ChrW(21019)&ChrW(24314)&ChrW(25968)&ChrW(25454)&ChrW(24211) 
isYes = true 
if request.form(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)) <> "" then
selectDatabase = request.form(ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)) 
dbhost = request.form(ChrW(100)&ChrW(98)&ChrW(104)&ChrW(111)&ChrW(115)&ChrW(116)) 
dbuser = request.form(ChrW(100)&ChrW(98)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) 
dbpwd = request.form(ChrW(100)&ChrW(98)&ChrW(112)&ChrW(119)&ChrW(100)) 
dbname = request.form(ChrW(100)&ChrW(98)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)) 
dbport = request.form(ChrW(100)&ChrW(98)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)) 
mysql_dbhost = request.form(ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(95)&ChrW(100)&ChrW(98)&ChrW(104)&ChrW(111)&ChrW(115)&ChrW(116)) 
mysql_dbuser = request.form(ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(95)&ChrW(100)&ChrW(98)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)) 
mysql_dbpwd = request.form(ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(95)&ChrW(100)&ChrW(98)&ChrW(112)&ChrW(119)&ChrW(100)) 
mysql_dbname = request.form(ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(95)&ChrW(100)&ChrW(98)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))  
accessDir = phptrim(request.form(ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(68)&ChrW(105)&ChrW(114))) 
accessPath = accessDir & ChrW(47)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(109)&ChrW(100)&ChrW(98) 
if selectDatabase = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) then
if accessDir = "" then
msgStr = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(23433)&ChrW(35013)&ChrW(30446)&ChrW(24405)&ChrW(19981)&ChrW(33021)&ChrW(20026)&ChrW(31354) 
isYes = false 
elseif checkFolder(accessDir) = false then
msgStr = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(23433)&ChrW(35013)&ChrW(30446)&ChrW(24405)&ChrW(19981)&ChrW(23384)&ChrW(22312) 
isYes = false 
elseif checkFile(accessPath) = true then
msgStr = ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(23384)&ChrW(22312)&ChrW(65292)&ChrW(20351)&ChrW(29992)&ChrW(65288) & accessPath & ChrW(65289) 

else
call createMdb(accessPath)
end if 
elseif selectDatabase = ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
dbhost = mysql_dbhost
dbuser = mysql_dbuser
dbpwd = mysql_dbpwd
dbname = mysql_dbname
accessPath = "" 
connStr=ChrW(100)&ChrW(115)&ChrW(110)&ChrW(61)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(59)&ChrW(68)&ChrW(114)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(123)&ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(100)&ChrW(114)&ChrW(105)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(125)&ChrW(59)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(61)& dbhost &ChrW(59)&ChrW(117)&ChrW(105)&ChrW(100)&ChrW(61) & dbuser & ChrW(59)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(61) & dbpwd & ChrW(59)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(61)&dbname




if checkSqlServer(connStr) = false then
call echo(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(65288)&ChrW(77)&ChrW(121)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(65289), connStr) 
msgStr = ChrW(38142)&ChrW(25509)&ChrW(77)&ChrW(121)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(26816)&ChrW(27979)&ChrW(36134)&ChrW(21495)&ChrW(23494)&ChrW(30721) 
isYes = false 
end if 

else
accessPath = "" 
if EDITORTYPE = ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120) then
connStr = ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(39) & dbhost & ChrW(44)& dbport &ChrW(39)&ChrW(59)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(61)&ChrW(39) & dbname & ChrW(39)&ChrW(59)&ChrW(117)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39) & dbuser & ChrW(39)&ChrW(59)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(61)&ChrW(39) & dbpwd & ChrW(39)&ChrW(59) 
else
connStr = ChrW(32)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32) & dbpwd & ChrW(59)&ChrW(32)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(61) & dbuser & ChrW(59)&ChrW(32)&ChrW(73)&ChrW(110)&ChrW(105)&ChrW(116)&ChrW(105)&ChrW(97)&ChrW(108)&ChrW(32)&ChrW(67)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(32)&ChrW(61) & dbname & ChrW(59)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(117)&ChrW(114)&ChrW(99)&ChrW(101)&ChrW(32)&ChrW(61) & dbhost & ChrW(44)& dbport &ChrW(59)&ChrW(80)&ChrW(114)&ChrW(111)&ChrW(118)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(98)&ChrW(59) 
end if 
if checkSqlServer(connStr) = false then
call echo(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(83)&ChrW(116)&ChrW(114), connStr):doevents
msgStr = ChrW(38142)&ChrW(25509)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(25968)&ChrW(25454)&ChrW(24211)&ChrW(22833)&ChrW(36133)&ChrW(65292)&ChrW(26816)&ChrW(27979)&ChrW(36134)&ChrW(21495)&ChrW(23494)&ChrW(30721) 
isYes = false 
else 
Set a = CreateObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
a.open connStr 
end if
end if 

if isYes = true then
content = readFile(configFilePath, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
tempContent = content 

startStr = ChrW(77)&ChrW(68)&ChrW(66)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) : endStr = ChrW(34) 
if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
findStr = getStrCut(content, startStr, endStr, 1) 
if EDITORTYPE = ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120) then
if accessPath <> "" then
accessPath = handlePath(accessPath) 
end if 
accessPath = replace(accessPath, ChrW(92), ChrW(92)&ChrW(92)) 
else
accessPath = replace(accessPath, ChrW(92)&ChrW(92), ChrW(92)) 
accessPath=replace(accessPath,handlePath(ChrW(47)),ChrW(47))
end if 
replaceStr = startStr & accessPath & endStr 
content = replace(content, findStr, replaceStr) 
end if 

startStr = ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) : endStr = ChrW(34) 
if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
findStr = getStrCut(content, startStr, endStr, 1) 
replaceStr = startStr & selectDatabase & endStr 
content = replace(content, findStr, replaceStr)  
end if 
startStr = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(72)&ChrW(111)&ChrW(115)&ChrW(116)&ChrW(73)&ChrW(80)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) : endStr = ChrW(34) 
if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
findStr = getStrCut(content, startStr, endStr, 1) 
if EDITORTYPE = ChrW(97)&ChrW(115)&ChrW(112)&ChrW(120) then
dbhost = replace(dbhost, ChrW(92), ChrW(92)&ChrW(92)) 
end if 
replaceStr = startStr & dbhost & endStr 
content = replace(content, findStr, replaceStr) 
end if 
startStr = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) : endStr = ChrW(34) 
if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
findStr = getStrCut(content, startStr, endStr, 1) 
replaceStr = startStr & dbuser & endStr 
content = replace(content, findStr, replaceStr) 
end if 
startStr = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) : endStr = ChrW(34) 
if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
findStr = getStrCut(content, startStr, endStr, 1) 
replaceStr = startStr & dbpwd & endStr 
content = replace(content, findStr, replaceStr) 
end if 
startStr = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) : endStr = ChrW(34) 
if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
findStr = getStrCut(content, startStr, endStr, 1) 
replaceStr = startStr & dbname & endStr 
content = replace(content, findStr, replaceStr) 
end if 

startStr = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) : endStr = ChrW(34) 
if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
findStr = getStrCut(content, startStr, endStr, 1) 
replaceStr = startStr & dbport & endStr 
content = replace(content, findStr, replaceStr) 
end if 
if selectDatabase=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) then

if tempContent <> content then
call writeToFile(configFilePath, content, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
end if 

startStr = ChrW(115)&ChrW(113)&ChrW(108)&ChrW(83)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(86)&ChrW(101)&ChrW(114)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) : endStr = ChrW(34) 
if instr(content, startStr) > 0 and instr(content, startStr) > 0 then
findStr = getStrCut(content, startStr, endStr, 1) 
replaceStr = startStr & getSqlServerVersion(a) & endStr 
content = replace(content, findStr, replaceStr) 
end if 
end if

if tempContent <> content then
call writeToFile(configFilePath, content, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
end if 
showLayout = ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(50) 
end if 
end if 
end sub 

sub displayImportTableLayout()
dim a, b, c, d, e 
a = readFile(configFilePath, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
b = ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(34) 
c = ChrW(34) 
if instr(a, b) > 0 and instr(a, b) > 0 then
d = getStrCut(a, b, c, 1) 
e = b & request(ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)) & c 
a = replace(a, d, e) 
call writeToFile(configFilePath, a, ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
end if 

WEB_CACHEFile = replace(replace(WEB_CACHEFile, ChrW(91)&ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(93), adminDir), ChrW(91)&ChrW(69)&ChrW(68)&ChrW(73)&ChrW(84)&ChrW(79)&ChrW(82)&ChrW(84)&ChrW(89)&ChrW(80)&ChrW(69)&ChrW(93), EDITORTYPE) 

call deleteFile(WEB_CACHEFile) 
showLayout = ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(51) 
end sub 

sub displayImportData()
call setsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101), ChrW(120)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(77)&ChrW(83)) 
call setsession(ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(108)&ChrW(97)&ChrW(103)&ChrW(115), ChrW(124)&ChrW(42)&ChrW(124)) 
showLayout = ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(52) 
end sub 

function getSqlServerVersion(a)
on error resume next 
dim b,c,d
c=a.execute(ChrW(83)&ChrW(69)&ChrW(76)&ChrW(69)&ChrW(67)&ChrW(84)&ChrW(32)&ChrW(64)&ChrW(64)&ChrW(86)&ChrW(69)&ChrW(82)&ChrW(83)&ChrW(73)&ChrW(79)&ChrW(78))(0)
b=phptrim(mid(c,21))
d=split(b&ChrW(32),ChrW(32))
getSqlServerVersion=d(0)
end function
%>
<% if showLayout = ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(49) then%>
<form id="form1" name="form1" method="post" action="?act=displayDefault">
<div class="pright">
<div class="pr-title">
<h3>第一步 选择数据库</h3>
</div>
<label for="radio"><input name="selectDatabase" type="radio" id="radio" value="access" <%=IIF(selectDatabase=ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) , ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100) , "" )%> onClick="selectInsrtDatabase(this.value);" />
Access数据库</label>
<label for="radio2"><input name="selectDatabase" type="radio" id="radio2" value="sqlserver" <%=IIF(selectDatabase=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) , ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100) , "" )%> onClick="selectInsrtDatabase(this.value);" />
SqlServer数据库</label>
<label for="radio3"><input name="selectDatabase" type="radio" id="radio3" value="mysql" <%=IIF(selectDatabase=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) , ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100) , "" )%> onClick="selectInsrtDatabase(this.value);" />
MySql数据库</label>
<table width="726" border="0" align="center" cellpadding="0" cellspacing="0" class="twbox">
<tbody>
<tr>
<td class="onetd"><strong>提示：</strong></td>
<td>
<div class="mytipwrap">
<%=msgStr%> &nbsp;<a href="<% =WEB_VIEWURL%>" class="mytip" target="_blank">访问网站首页</a><a href="<% =WEB_ADMINURL%>" class="mytip" target="_blank">登录网站后台</a> </div>
</td>
</tr>
</tbody>
<tbody id="access_layout" <%=IIF(selectDatabase=ChrW(97)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115) ,"", ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(58)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(39))%>>
<tr>
<td class="onetd"><strong>Access目录：</strong></td>
<td>
<div style="float:left;margin-right:3px;"><input name="accessDir" id="accessDir" type="text" value="<% =accessDir%>" class="input-txt">
</div>
<div style="float:left" id="havedbsta">
<font color="red"></font>
</div>
</td>
</tr>
</tbody>
<tbody id="sqlserver_layout" <%=IIF(selectDatabase=ChrW(115)&ChrW(113)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(118)&ChrW(101)&ChrW(114) ,"", ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(58)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(39))%> >
<tr>
<td class="onetd"><strong>数据库主机：</strong></td>
<td><input name="dbhost" id="dbhost" type="text" value="<% =dbhost%>" class="input-txt">
<small>一般为localhost 或 .\SQLEXPRESS</small> </td>
</tr> 
<tr>  
<td class="onetd"><strong>数据库端口：</strong></td>  
<td><input name="dbport" id="dbport" type="text" value="<% =dbport%>" class="input-txt">  
<small>默认为1433</small>                </td>  
</tr> 
<tr>
<td class="onetd"><strong>数据库用户：</strong></td>
<td><input name="dbuser" id="dbuser" type="text" value="<% =dbuser%>" class="input-txt"></td>
</tr>
<tr>
<td class="onetd"><strong>数据库密码：</strong></td>
<td>
<div style="float:left;margin-right:3px;"><input name="dbpwd" type="text" value="<% =dbpwd%>" class="input-txt" id="dbpwd" onChange="TestDb()">
</div>
<div style="float:left" id="dbpwdsta">
<font color="red"></font>
</div>
</td>
</tr>
<tr>
<td class="onetd"><strong>数据库名称：</strong></td>
<td>
<div style="float:left;margin-right:3px;"><input name="dbname" id="dbname" type="text" value="<% =dbname%>" class="input-txt" onChange="HaveDB()">
请确定数据库名称存在
</div>
<div style="float:left" id="havedbsta">
<font color="red"></font>
</div>
</td>
</tr>
</tbody>
<tbody id="mysql_layout" <%=IIF(selectDatabase=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) ,"", ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(58)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(39)  )%> >
<tr>
<td class="onetd"><strong>数据库主机：</strong></td>
<td><input name="mysql_dbhost" type="text" value="<% =mysql_dbhost%>" class="input-txt">
<small>一般为localhost 或 127.0.0.1。待改进</small> </td>
</tr>
<tr>
<td class="onetd"><strong>数据库用户：</strong></td>
<td><input name="mysql_dbuser"   type="text" value="<% =mysql_dbuser%>" class="input-txt"></td>
</tr>
<tr>
<td class="onetd"><strong>数据库密码：</strong></td>
<td>
<div style="float:left;margin-right:3px;"><input name="mysql_dbpwd" type="text" value="<% =mysql_dbpwd%>" class="input-txt"  onChange="TestDb()">
</div>
<div style="float:left" id="dbpwdsta">
<font color="red"></font>
</div>
</td>
</tr>
<tr>
<td class="onetd"><strong>数据库名称：</strong></td>
<td>
<div style="float:left;margin-right:3px;"><input name="mysql_dbname" type="text" value="<% =mysql_dbname%>" class="input-txt" onChange="HaveDB()">
请确定数据库名称存在
</div>
<div style="float:left" id="havedbsta">
<font color="red"></font>
</div>
</td>
</tr>
</tbody>
</table>
<div class="btn-box">
<input name="提交" type="submit" class="btnclick1" value="继续">
</div>
</div>
<script language="javascript">
function selectInsrtDatabase(sValue){  
//alert(document.getElementById("sqlserver_layout").innerHTML)  
document.getElementById("access_layout").style.display = "none"  
document.getElementById("sqlserver_layout").style.display = "none"  
document.getElementById("mysql_layout").style.display="none";  
if(sValue=="access"){   
document.getElementById("access_layout").style.display = ""  
}else if(sValue=="sqlserver"){   
document.getElementById("sqlserver_layout").style.display = ""  
}else if(sValue=="mysql"){
document.getElementById("mysql_layout").style.display="";  
}  
}  
</script>
</form>
<% elseif showLayout = ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(50) then%>
<form id="form1" name="form1" method="post" action="?act=displayImportTableLayout">
<div class="pright">
<div class="pr-title">
<h3>第二步 设置登录密码</h3>
</div>
<table width="726" border="0" align="center" cellpadding="0" cellspacing="0" class="twbox">
<tbody>
<tr>
<td class="onetd"><strong>提示：</strong></td>
<td>
<div class="mytipwrap">创建数据库成功。(如果不恢复数据库将退出) &nbsp;<a href="<% =WEB_VIEWURL%>" class="mytip" target="_blank">访问网站首页</a><a href="<% =WEB_ADMINURL%>" class="mytip" target="_blank">登录网站后台</a> </div>
</td>
</tr>
<tr>
<td class="onetd"><strong>表前缀：</strong></td>
<td>
<div style="float:left;margin-right:3px;"><input name="db_PREFIX" id="db_PREFIX" type="text" value="xy_" class="input-txt">
</div>
</td>
</tr>
<tr>
<td class="onetd"><strong>登录账号：</strong></td>
<td>
<div style="float:left;margin-right:3px;"><input name="loginname" type="text" value="admin" class="input-txt">
</div>
</td>
</tr>
<tr>
<td class="onetd"><strong>登录密码：</strong></td>
<td>
<div style="float:left;margin-right:3px;"><input name="loginpwd" type="text" value="admin" class="input-txt">
</div>
</td>
</tr>
</tbody>
</table>
<div class="btn-box">
<input name="提交" type="submit" class="btnclick1" value="继续">
</div>
</div>
</form>
<% elseif showLayout = ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(51) then%>
<form id="form1" name="form1" method="post" action="?act=displayImportData">
<div class="pright">
<div class="pr-title">
<h3>第三步 导入数据</h3>
</div>
<table width="726" border="0" align="center" cellpadding="0" cellspacing="0" class="twbox">
<tbody>
<tr>
<td class="onetd"><strong>提示：</strong></td>
<td>
<div class="mytipwrap">创建表完成。(如果不恢复数据库将退出) &nbsp;<a href="<% =WEB_VIEWURL%>" class="mytip" target="_blank">访问网站首页</a><a href="<% =WEB_ADMINURL%>" class="mytip" target="_blank">登录网站后台</a> </div>
</td>
</tr>
<tr>
<td colspan="2">
<%dim iframeUrl:iframeUrl=ChrW(63)&ChrW(97)&ChrW(99)&ChrW(116)&ChrW(61)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(99)&ChrW(99)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(38)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&request(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101))&ChrW(38)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(119)&ChrW(100)&ChrW(61)&request(ChrW(108)&ChrW(111)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(119)&ChrW(100))%>
<iframe src="<%=iframeUrl%>" width="100%" height="350"></iframe>
</td>
</tr>
</tbody>
</table>
<div class="btn-box">
<input name="提交" type="submit" class="btnclick1" value="继续">
</div>
</div>
</form>
<% elseif showLayout = ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(52) then%>
<div class="pright">
<div class="pr-title">
<h3>第四步 完成</h3> 
</div>
<table width="726" border="0" align="center" cellpadding="0" cellspacing="0" class="twbox">
<tbody>
<tr>
<td class="onetd"><strong>提示：</strong></td>
<td>
<div class="mytipwrap">导入数据完成 &nbsp;<a href="<% =WEB_VIEWURL%>" class="mytip" target="_blank">访问网站首页</a><a href="<% =WEB_ADMINURL%>" class="mytip" target="_blank">登录网站后台</a> </div>
</td>
</tr>
<tr>
<td colspan="2">
<iframe src="addData.asp?act=setAccess&webdataDir=/install/WebData&login=out&n=<% =getRnd(9)%>" width="100%" height="350"></iframe>
</td>
</tr>
</tbody>
</table>
</div>
<% end if%>
</body>
</html>