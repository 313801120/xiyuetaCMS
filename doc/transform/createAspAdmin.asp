<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><!--#Include file = "../../inc/config.asp"-->
<!--#Include file = "template_list_page.asp"-->
<!--#Include file = "template_view_page.asp"-->
<!--#Include file = "template_eidt_page.asp"-->
<%
dim formNoRowList
dim glabolJSonIfConfig
dim glabolPowerTitle:glabolPowerTitle=""
dim glabolListConfig:glabolListConfig=ChrW(100)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(44)&ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)
dim configNameListNote
dim glabolFormInputElseAspCode
dim glabol_ascDesc
dim glabol_enFieldList
dim glabol_lineEditList
dim public_js_tags_show:public_js_tags_show=0
dim public_paste_update_image_js_code
dim public_listHeadSortShow
dim public_dropdownJSCode,public_dropdownHtmlCode
dim public_colorpickerJSCode,public_colorpickerHtmlCode
dim public_laydateJSCode,public_laydateHtmlCode
dim public_formViewFieldList:public_formViewFieldList=""
dim public_formViewMaoHao:public_formViewMaoHao=ChrW(65306)
dim public_formEditMaoHao
dim public_formFieldTextNote
dim public_listFieldAddClickAction
dim public_listFieldAddClickJsCode
dim public_idIndexName:public_idIndexName=ChrW(105)&ChrW(100)
dim public_editPageColorJsCode
dim public_editPageTimeJsCode
dim public_layuiadminUploadPicJsCode
dim public_editPathLeftNoteJsCode
dim public_editPage_asp_function
dim public_listPage_asp_function
dim public_listPage_idList_aspCode
dim public_listPage_jsonItem_aspCode
dim public_listPage_JsonDataFieldList
dim public_editPage_add_elseif_asp
dim public_listPage_searchButton_downHtml
dim public_listPage_elseif_aspCode
dim public_listPage_active_jsCode
dim public_listPage_elseif_del_InAddAspCode
dim public_listPage_elseif_copy_InAddAspCode
dim public_listPage_moreDownMenu_jsConfig
dim public_listPage_moreDownMenu_jsContent
dim public_listPage_toolbarButton_html
dim public_listPage_js_function
dim public_listPage_toolbarCase_JsCode
dim public_editpage_editor_JSCode
dim public_editpage_loadJs
dim public_editPage_jsCode
dim public_listPageTopItemIocNote
dim public_listPageFieldValueIocNote
dim public_addToInputFieldList
dim public_configQXList
dim public_configEditQXList
dim public_listpage_table_option_js
dim public_listpage_switch_jsShow
dim public_listpage_onLineEdit_jsShow
dim public_editpage_warp_addid

dim public_editpage_Item_addLayFilter
dim public_editpage_show_inputHtml

dim public_editpage_warp_hide
dim public_listPage_scriptSrc
dim public_listPage_ItemWidth_config
dim public_editSafe_fieldList
dim public_editSafe_azDouHao_fieldList
dim public_editSafe_dirFileName_fieldList
dim public_isClassPage:public_isClassPage=false
dim public_editPage_addnew_defaultValue
dim public_editPage_update_defaultValue
dim public_editpage_not_field_list
dim public_listPage_jsTable_templetList
dim public_listPageRunAction
dim public_editPageRunAction
dim public_editPageSaveRunAction
dim public_viewPageRunAction
dim public_listPage_json_done_foritem
dim public_viewPage_jsCode
dim public_listPage_style
dim public_listPage_include_fileList
dim cfg_tab,cfg_tabAdd1,cfg_tabAdd2,cfg_tabAdd3,tab1,tab2
tab1=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)
tab2=tab1&tab1
cfg_tab=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32) 
cfg_tabAdd1=cfg_tab&tab1
cfg_tabAdd2=cfg_tab&tab2
cfg_tabAdd3=cfg_tab&tab2&tab1


function htmlStartAddTab(a,b)
dim c,d,e
c=split(a,vbcrlf)
for each d in c
e=e & b & d & vbcrlf
next
htmlStartAddTab=e
end function

function getListHeadSortShow(a)
getListHeadSortShow=IIF(instr(ChrW(44)&public_listHeadSortShow&ChrW(44), ChrW(44)&a&ChrW(44))>0,ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101),ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101))
end function

function getFormInputElseAspcode(a,b)
dim c,d,e,f,g,h,i,j
d=split(b,ChrW(44))
for each f in d
if instr(f,ChrW(61)) then
e=split(f,ChrW(61))
h=e(0) 
i=decTsStrReplace(e(1),ChrW(44)&ChrW(61))
i=replace(replace(replace(i,ChrW(34),ChrW(34)&ChrW(34)),ChrW(60),ChrW(38)&ChrW(108)&ChrW(116)&ChrW(59)),ChrW(62),ChrW(38)&ChrW(103)&ChrW(116)&ChrW(59))


if i=ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111) or left(i,5)=ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(43) then  
if left(i,5)=ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(43) then
i=mid(i,6)
if i="" then i=1
else
i=1
end if
j=j & copystr(ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32),1) & ChrW(114)&ChrW(115)&ChrW(46)&ChrW(111)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(34)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(42)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)&ChrW(34)&ChrW(38)&ChrW(32)&ChrW(100)&ChrW(98)&ChrW(95)&ChrW(80)&ChrW(82)&ChrW(69)&ChrW(70)&ChrW(73)&ChrW(88)&ChrW(32)&ChrW(38)&ChrW(34)& a &ChrW(93)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&h&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(34)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(110)&ChrW(44)&ChrW(49)&ChrW(44)&ChrW(49) & vbcrlf
j=j & copystr(ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32),1) & ChrW(105)&ChrW(102)&ChrW(32)&ChrW(110)&ChrW(111)&ChrW(116)&ChrW(32)&ChrW(114)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(111)&ChrW(102)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110) & vbcrlf
j=j & copystr(ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32),2) & ""&h&ChrW(61)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&h&ChrW(34)&ChrW(41)&ChrW(43) & h & vbcrlf 
j=j & copystr(ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32),1) & ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(58)&ChrW(114)&ChrW(115)&ChrW(46)&ChrW(99)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101) & vbcrlf 
end if 
g=getFieldAlt(db_PREFIX & a,h)
if g <>ChrW(73)&ChrW(110)&ChrW(116) and g <>ChrW(89)&ChrW(101)&ChrW(115)&ChrW(78)&ChrW(111) and g <>ChrW(70)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116) then
i=ChrW(34)& i &ChrW(34)
end if
c=c & copystr(ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32),1) & h & ChrW(61) & i & vbcrlf
end if
next  
getFormInputElseAspcode=c&j
end function

function checkWriteToFile(a,b)
if instr(readfile(a,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)),ChrW(39)&ChrW(31105)&ChrW(27490)&ChrW(33258)&ChrW(21160)&ChrW(26356)&ChrW(26032)&ChrW(24403)&ChrW(21069)&ChrW(25991)&ChrW(20214)&ChrW(39))=false then
if glabolPowerTitle <>"" then
b=replace(b,ChrW(34)&ChrW(123)&ChrW(20449)&ChrW(24687)&ChrW(21015)&ChrW(34920)&ChrW(125)&ChrW(34),ChrW(34)& glabolPowerTitle &ChrW(31649)&ChrW(29702)&ChrW(34)) 
b=replace(b,ChrW(34)&ChrW(123)&ChrW(20449)&ChrW(24687)&ChrW(28155)&ChrW(21152)&ChrW(125)&ChrW(34),ChrW(34)& glabolPowerTitle &ChrW(28155)&ChrW(21152)&ChrW(34))
b=replace(b,ChrW(34)&ChrW(123)&ChrW(20449)&ChrW(24687)&ChrW(21024)&ChrW(38500)&ChrW(125)&ChrW(34),ChrW(34)& glabolPowerTitle &ChrW(21024)&ChrW(38500)&ChrW(34))
b=replace(b,ChrW(34)&ChrW(123)&ChrW(20449)&ChrW(24687)&ChrW(20462)&ChrW(25913)&ChrW(125)&ChrW(34),ChrW(34)& glabolPowerTitle &ChrW(20462)&ChrW(25913)&ChrW(34))
end if
call writetofile(a,b,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
end if
end function




if request(ChrW(97)&ChrW(99)&ChrW(116))=ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) then
call createtablepage(request(ChrW(105)&ChrW(100)))
end if 
sub createtablepage(a) 
call openconn() 
dim b,c,d,e,f,g,h,i
dim j,k,l,m,n,o

g=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(32)&ChrW(65)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(44)&ChrW(65)&ChrW(46)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(44)&ChrW(66)&ChrW(46)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(102)&ChrW(114)&ChrW(111)&ChrW(109)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(65)&ChrW(32)&ChrW(106)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(91)& db_PREFIX &ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(93)&ChrW(32)&ChrW(97)&ChrW(115)&ChrW(32)&ChrW(66)&ChrW(32)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(65)&ChrW(46)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(66)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(65)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(61)&a
rs.open g,conn,1,1
if rs.eof then
call eerr(ChrW(25552)&ChrW(31034),ChrW(21019)&ChrW(24314)&ChrW(34920)&ChrW(19981)&ChrW(23384)&ChrW(22312))
end if
f=rs(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101))
call echo(ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),f)
call echo(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101),rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)))
call echo(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116),rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)))
call echo(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116),rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)))
o=public_idIndexName
j=split(rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)),ChrW(44)&ChrW(32))
k=split(rs(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(97)&ChrW(108)&ChrW(116)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)),ChrW(44)&ChrW(32))
for l=0 to ubound(j)
m=phptrim(j(l))
if m <>"" then
h=h&m & ChrW(124) & k(l) & ChrW(44)
n=getFieldAlt(db_PREFIX &f, m)
if o <>"" then o=o &ChrW(44)
o=o & m
if n=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) then
n=ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)
elseif n=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) then
n=ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)


end if
if n=ChrW(105)&ChrW(110)&ChrW(116) then
i=i & m & ChrW(124)&ChrW(124)&ChrW(124)&ChrW(124)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(44)
else
i=i & m & ChrW(124)&  n &ChrW(44)
end if

end if
next
call echo(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),h)
call echo(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),i)
call echo(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),o)
call handleCreateListPage(rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)),f,h,i,o)
end sub
sub handleCreateListPage(a,b,c,d,e) 
call openconn() 
dim f,g,h,i,j
i=c & ChrW(44)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(29992)&ChrW(25143)&ChrW(73)&ChrW(68)&ChrW(44)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(124)&ChrW(26631)&ChrW(39064)&ChrW(44)&ChrW(105)&ChrW(112)&ChrW(124)&ChrW(73)&ChrW(80)&ChrW(22320)&ChrW(22336)&ChrW(44)&ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(21019)&ChrW(24314)&ChrW(26102)&ChrW(38388)&ChrW(44)&ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(124)&ChrW(20462)&ChrW(25913)&ChrW(26102)&ChrW(38388)&ChrW(44)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104)&ChrW(124)&ChrW(23457)&ChrW(26680)&ChrW(44)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(20869)&ChrW(23481)&ChrW(44)&ChrW(105)&ChrW(100)&ChrW(124)&ChrW(73)&ChrW(68)&ChrW(44)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(104)&ChrW(111)&ChrW(114)&ChrW(124)&ChrW(20316)&ChrW(32773)&ChrW(44)&ChrW(114)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(124)&ChrW(21457)&ChrW(24067)&ChrW(26102)&ChrW(38388)&ChrW(44)&ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(115)&ChrW(124)&ChrW(27983)&ChrW(35272)&ChrW(37327)&ChrW(44)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(124)&ChrW(35780)&ChrW(35770)&ChrW(25968)&ChrW(44)&ChrW(100)&ChrW(117)&ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(124)&ChrW(26102)&ChrW(38271)&ChrW(44)
j=d
f=ChrW(47)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(47)&ChrW(97)&ChrW(112)&ChrW(112)&ChrW(47)& b
call createFolder(f)
if rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(21015)&ChrW(34920)&ChrW(39029) then 
g=f &ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
if instr(readfile(g,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)),ChrW(39)&ChrW(31105)&ChrW(27490)&ChrW(33258)&ChrW(21160)&ChrW(26356)&ChrW(26032)&ChrW(24403)&ChrW(21069)&ChrW(25991)&ChrW(20214)&ChrW(39))=false then
h=generateAdminList(b,e,i,j,ChrW(34)&ChrW(32)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(98)&ChrW(121)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(100)&ChrW(101)&ChrW(115)&ChrW(99)&ChrW(34))
call writetofile(g,h,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if
elseif rs(ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101))=ChrW(28155)&ChrW(21152)&ChrW(20462)&ChrW(25913)&ChrW(39029) then 
g=f &ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)
if instr(readfile(g,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)),ChrW(39)&ChrW(31105)&ChrW(27490)&ChrW(33258)&ChrW(21160)&ChrW(26356)&ChrW(26032)&ChrW(24403)&ChrW(21069)&ChrW(25991)&ChrW(20214)&ChrW(39))=false then
h=generateAdminForm(b,e,i,j)
call writetofile(g,h,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
end if
end if
call eerr(ChrW(116)&ChrW(105)&ChrW(112),ChrW(79)&ChrW(75))
end sub

function getConfigSetData(a)
dim b
b=readfile(ChrW(99)&ChrW(111)&ChrW(110)&ChrW(102)&ChrW(105)&ChrW(103)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116),"") 
getConfigSetData=strCut(b,ChrW(39)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)& a &ChrW(83)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(116)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(39),ChrW(39)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)& a &ChrW(69)&ChrW(110)&ChrW(100)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(39),0)  
end function

function generateAdminList(a,b,c,d,e) 
dim f,g,h,i,j,k,l,m,n,o,p
dim q,r,s,t,u,v,w,x,y,z,a1,a2,a3,a4,a5,a6,a7
dim a8
dim a9
dim a10
dim a11
dim a12
dim a13,a14,a15,a16,a17
c=ChrW(44)& c &ChrW(44)
d=ChrW(44)& d &ChrW(44)
f=db_PREFIX & a
g=getFieldList(f)
g=lcase(g)
p=g
if b <>"" and b <>ChrW(42) then
u=split(b,ChrW(44))
for w=0 to ubound(u)
v=u(w) 
if (v <>"" and instr(ChrW(44)& g &ChrW(44),ChrW(44)& v &ChrW(44))>0) or left(v,7)=ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) then
if k <>"" then k=k &ChrW(44)
k=k & v
end if
next
g=k
end if
if instr(b,ChrW(44)&ChrW(105)&ChrW(112)&ChrW(44)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(44))>0 and instr(g,ChrW(44)&ChrW(105)&ChrW(112)&ChrW(44)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(44))=false then
g=replace(g,ChrW(44)&ChrW(105)&ChrW(112)&ChrW(44),ChrW(44)&ChrW(105)&ChrW(112)&ChrW(44)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(44))
end if
if instr(ChrW(44)&g&ChrW(44),ChrW(44)&public_idIndexName&ChrW(44))=false then
if instr(ChrW(44)&p&ChrW(44),ChrW(44)&public_idIndexName&ChrW(44))>0 then
i=public_idIndexName
t=ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)
m=m&ChrW(44)&ChrW(34)&ChrW(34)& i &ChrW(34)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)& t &ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)
call echoRedB(ChrW(25552)&ChrW(31034),ChrW(28155)&ChrW(21152)&ChrW(32034)&ChrW(24341)&ChrW(73)&ChrW(68)&ChrW(21517)&ChrW(31216)&ChrW(21040)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(37324) & public_idIndexName)
end if
end if
h=split(g,ChrW(44))
for each i in h
if i <>"" AND (instr(ChrW(44)& b &ChrW(44),ChrW(44)& i &ChrW(44)) >0 or b=ChrW(42)) then
q=i
r=instr(c,ChrW(44)& i &ChrW(124))
if r>0 then
q=strCut(c,ChrW(44)& i &ChrW(124),ChrW(44),0)
end if
j=getFieldAlt(f,i)
if l="" then
if j="" or (l="" and j=ChrW(73)&ChrW(110)&ChrW(116)) then
l=i
end if 
end if
t=ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)
if left(i,8)=ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95) then
t=ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&mid(i,9)&ChrW(34)&ChrW(41)
end if
a16=""
a6=ChrW(44)& i &ChrW(124)
r=instr(ChrW(44)&public_listPageTopItemIocNote,a6)
if r>0 then
a15=mid(ChrW(44)&public_listPageTopItemIocNote,r+len(a6))
call echo(ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(84)&ChrW(111)&ChrW(112)&ChrW(73)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(73)&ChrW(111)&ChrW(99)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101),public_listPageTopItemIocNote)
a1=split(a15,ChrW(44))
a2=split(a1(0),ChrW(91)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(93))



a16=ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&a2(0)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(45)&ChrW(49)&ChrW(52)&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(101)&ChrW(109)&ChrW(97)&ChrW(105)&ChrW(108)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(115)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&decTsStrReplace(a2(1),ChrW(44)&ChrW(124))&ChrW(34)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(109)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(105)&ChrW(110)&ChrW(45)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(53)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62) 


end if
a17=""

a6=ChrW(44)& i &ChrW(124)
r=instr(ChrW(44)&public_listPageFieldValueIocNote,a6)
if r>0 then
a15=mid(ChrW(44)&public_listPageFieldValueIocNote,r+len(a6))
call echo(ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(73)&ChrW(111)&ChrW(99)&ChrW(78)&ChrW(111)&ChrW(116)&ChrW(101),public_listPageFieldValueIocNote)
a1=split(a15,ChrW(44))
a2=split(a1(0),ChrW(91)&ChrW(65)&ChrW(114)&ChrW(114)&ChrW(97)&ChrW(121)&ChrW(93))
a17=ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&a2(0)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&decTsStrReplace(a2(1),ChrW(44)&ChrW(124))&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)
end if 





v="":a8="":s="":a9="":a10=""
r=instr(d,ChrW(44)& i &ChrW(124))
if r>0 then
v=strCut(d,ChrW(44)& i &ChrW(124),ChrW(44),1)
a1=split(replace(v,ChrW(44),""),ChrW(124))
if ubound(a1) >=1 then
s=a1(1)
end if
if ubound(a1) >=2 then
a9=getListPageItemWidth(i)

end if
if ubound(a1) >=3 then
a10=a1(3)
end if  



end if 
if left(s,5)=ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111) then 
t=ChrW(32)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(60)&ChrW(62)&ChrW(48)&ChrW(44)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(34)&ChrW(41)       
if instr(s,ChrW(45))>0 then


a1=split(s,ChrW(45))
s=a1(0) 
if ubound(a1)=2 then
a8=a1(1) & ChrW(124) & a1(2)
elseif ubound(a1)=1 then
a7=decTsStrReplace(a1(1) ,ChrW(124))
if instr(a7,ChrW(124))>0 then a8=a7
end if



end if
elseif left(s,12)=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(110)&ChrW(109) then
t=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
elseif left(s,16)=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101) then
t=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
elseif left(s,14)=ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(110)&ChrW(109)&ChrW(84)&ChrW(120)&ChrW(116) then

elseif left(s,11)=ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(110)&ChrW(109) then
t=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
elseif left(s,6)=ChrW(105)&ChrW(100)&ChrW(99)&ChrW(97)&ChrW(114)&ChrW(100) then
t=ChrW(105)&ChrW(100)&ChrW(99)&ChrW(97)&ChrW(114)&ChrW(100)&ChrW(89)&ChrW(77)&ChrW(68)&ChrW(72)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
elseif left(s,11)=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111) then
a1=split(s,ChrW(45))
if ubound(a1) >=1 then
t=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)& a1(1) &ChrW(34)&ChrW(41)&ChrW(41)
else
t=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
end if 
elseif left(s,13)=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116) then

a1=split(s,ChrW(45))
if ubound(a1) >=4 then 
t=ChrW(84)&ChrW(83)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(34)& s &ChrW(34)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&a1(4)&ChrW(34)&ChrW(41)&ChrW(41)
else
t=ChrW(84)&ChrW(83)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(40)&ChrW(34)& s &ChrW(34)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(41)&ChrW(41)
end if
elseif left(s,18)=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101) then

a1=split(s,ChrW(45))
if ubound(a1) >=3 then 
t=ChrW(84)&ChrW(83)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(40)&ChrW(34)& s &ChrW(34)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&a1(3)&ChrW(34)&ChrW(41)&ChrW(41)
else 
t=ChrW(84)&ChrW(83)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(40)&ChrW(34)& s &ChrW(34)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
end if 
elseif left(s,13)=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(105)&ChrW(109)&ChrW(103) then
a1=split(s,ChrW(45))
if ubound(a1) >=1 then 
t=ChrW(84)&ChrW(83)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(105)&ChrW(99)&ChrW(73)&ChrW(109)&ChrW(103)&ChrW(40)&ChrW(34)& s &ChrW(34)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&a1(1)&ChrW(34)&ChrW(41)&ChrW(41)
else 
t=ChrW(84)&ChrW(83)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(77)&ChrW(101)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(105)&ChrW(99)&ChrW(73)&ChrW(109)&ChrW(103)&ChrW(40)&ChrW(34)& s &ChrW(34)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
end if 
elseif left(s,15)=ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) then
if instr(s&ChrW(95),ChrW(103)&ChrW(101)&ChrW(116)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(95))>0 then

t=listPage_gettablecount_AspCode(a,s,i,t)

elseif instr(s&ChrW(95),ChrW(103)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(95))>0 then
t=listPage_getipaddr(a,s,i,t)
elseif instr(s&ChrW(95),ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(95))>0 then
t=listPage_getTableInfo_AspCode(a,s,i,t) 
else
t=ChrW(84)&ChrW(83)&ChrW(95)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(34)& s &ChrW(34)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(41)
end if
elseif left(s,15)=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101) then

a1=split(s,ChrW(45))
if ubound(a1) >=1 then 
t=ChrW(84)&ChrW(83)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(40)&ChrW(34)& s &ChrW(34)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&a1(1)&ChrW(34)&ChrW(41)&ChrW(41)
else 
t=ChrW(84)&ChrW(83)&ChrW(95)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(40)&ChrW(34)& s &ChrW(34)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
end if
elseif left(s,12)=ChrW(115)&ChrW(114)&ChrW(99)&ChrW(116)&ChrW(111)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(103) then
t=ChrW(84)&ChrW(83)&ChrW(95)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(116)&ChrW(111)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(40)&ChrW(34)& s &ChrW(34)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
elseif left(s,12)=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116) and instr(s&ChrW(95),ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(95))>0  then
t=get_handle_listPageAspCode(a,s,i,t)
elseif left(s,13)=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(45) then

if instr(ChrW(124)& glabol_lineEditList &ChrW(124),ChrW(124)& i &ChrW(124))=false then 
t=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(79)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(40)&ChrW(34)&i&mid(s,12)&ChrW(34)&ChrW(44)&t&ChrW(41)
else
t=ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(76)&ChrW(40)&t&ChrW(41)
end if
elseif instr(s&ChrW(95),ChrW(45)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(67)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(95))>0 then
t=get_handle_listPageCallFunction(a,s,i,t)  
elseif instr(s&ChrW(95),ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(84)&ChrW(111)&ChrW(73)&ChrW(112)&ChrW(95))>0  then
t=ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(84)&ChrW(111)&ChrW(73)&ChrW(112)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)      
else
if j=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or j=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) then
t=ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(76)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
elseif left(s,5)=ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121) then
t=ChrW(112)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121)&ChrW(67)&ChrW(110)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
end if

end if  
x=strCut(glabolJSonIfConfig,i&ChrW(61)&ChrW(123),ChrW(125),0)

t=getLEVPageRunAction(ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101),i,t)
v=getQXVal(i)
if  v <>"" and v <>ChrW(124) then 
t=ChrW(97)&ChrW(81)&ChrW(88)&ChrW(40)&t&ChrW(44)&ChrW(34)&v&ChrW(34)&ChrW(41)
end if
m=m&ChrW(44)&ChrW(34)&ChrW(34)& i &ChrW(34)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)& t &ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(34)
if s=ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111) then
if a8="" then a8=ChrW(26159)&ChrW(124)&ChrW(21542)
if a9="" then 
a9=ChrW(56)&ChrW(48)
if len(q)=3 then a9=ChrW(49)&ChrW(48)&ChrW(48)
if len(q)=4 then a9=ChrW(49)&ChrW(50)&ChrW(48)
if len(q)=5 then a9=ChrW(49)&ChrW(52)&ChrW(48)        
end if
if left(a9,3)=ChrW(109)&ChrW(105)&ChrW(110) then
a9=ChrW(44)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58) & handleNumber(a9)
elseif left(a9,3)=ChrW(109)&ChrW(97)&ChrW(120) then
a9=ChrW(44)&ChrW(109)&ChrW(97)&ChrW(120)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58) & handleNumber(a9)
elseif a9 <>"" then
a9=ChrW(44)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58) & handleNumber(a9)
end if

y=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&IIF(n&a14 <>"",ChrW(44),"")&ChrW(123)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(39)& i &ChrW(39)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)& q & a16 &ChrW(39)& a9 &ChrW(44)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(58)&ChrW(32)&getListHeadSortShow(i)&ChrW(44)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(39)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(100)&ChrW(41)&ChrW(123)&vbcrlf

if instr(ChrW(124)&glabol_lineEditList&ChrW(124),ChrW(124)&i&ChrW(124))>0 then
y=y & ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(39)&ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(34)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(39)&ChrW(43)&ChrW(100)&ChrW(46)& l &ChrW(43)&ChrW(39)&ChrW(34)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)& i &ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)& i &ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(115)&ChrW(107)&ChrW(105)&ChrW(110)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(119)&ChrW(105)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(61)&ChrW(34)& a8 &ChrW(34)&ChrW(32)&ChrW(39)&ChrW(43)&ChrW(100)&ChrW(46)& i &ChrW(43)&ChrW(39)&ChrW(32)&ChrW(62)&ChrW(39)
public_listpage_switch_jsShow=ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)
else
a1=split(a8&ChrW(124),ChrW(124))
y=y&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(100)&ChrW(46)&ChrW(110)&ChrW(111)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(108)&ChrW(111)&ChrW(119)&ChrW(61)&ChrW(61)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)&ChrW(34)&ChrW(63)&ChrW(34)&a1(0)&ChrW(34)&ChrW(58)&ChrW(34)&a1(1)&ChrW(34)

end if
y=y & ChrW(125)&ChrW(125) & vbCrLf
if instr(x,ChrW(91)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(93))>0 then
y=replace(x,ChrW(91)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(93),y)
end if

v=getQXVal(i)
if  v <>"" and v <>ChrW(124) then 
y=ChrW(60)&ChrW(37)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(65)&ChrW(81)&ChrW(88)&ChrW(40)&ChrW(34)& v &ChrW(34)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(37)&ChrW(62) & y & ChrW(60)&ChrW(37)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(37)&ChrW(62)&vbcrlf
end if

if instr(ChrW(124)& glabol_enFieldList &ChrW(124),ChrW(124)& i &ChrW(124))>0 then 
a14=a14&y
else
n=n&y
end if
else
if a9="" then 
if i=ChrW(105)&ChrW(100) then 
a9=ChrW(55)&ChrW(48)
elseif i=ChrW(112)&ChrW(114)&ChrW(105)&ChrW(99)&ChrW(101) then 
a9=ChrW(56)&ChrW(48)
elseif i=ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101) then 
a9=ChrW(49)&ChrW(54)&ChrW(48)
elseif i=ChrW(105)&ChrW(112) then 
a9=ChrW(49)&ChrW(52)&ChrW(48)
elseif i=ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114) then 
a9=ChrW(49)&ChrW(56)&ChrW(48)
end if
end if 
if left(a9,3)=ChrW(109)&ChrW(105)&ChrW(110) then
a9=ChrW(44)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58) & handleNumber(a9)
elseif left(a9,3)=ChrW(109)&ChrW(97)&ChrW(120) then
a9=ChrW(44)&ChrW(109)&ChrW(97)&ChrW(120)&ChrW(87)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58) & handleNumber(a9)
elseif a9 <>"" then
a9=ChrW(44)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58) & handleNumber(a9)
end if
if left(s,12)=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116) or left(s,17)=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116) or left(s,5)=ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111) then

if instr(glabol_lineEditList,ChrW(124)&i&ChrW(124))>0 then
call listpage_handleDropdownJS(a,i,s)
call echo(ChrW(19979)&ChrW(36733)&ChrW(33756)&ChrW(21333)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(100)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110)&ChrW(74)&ChrW(83)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101),public_dropdownJSCode)

end if
elseif left(s,11)=ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114) then
call handleColorpickerJS(i)
call echo(ChrW(39068)&ChrW(33394)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(74)&ChrW(83)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101),public_colorpickerJSCode) 
elseif left(s,4)=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101) then
call handleLaydateJS(i,s,ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121)&ChrW(47)&ChrW(77)&ChrW(77)&ChrW(47)&ChrW(100)&ChrW(100))
call echo(ChrW(26085)&ChrW(26399)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(74)&ChrW(83)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101),public_laydateJSCode) 
elseif left(s,4)=ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101) then
call handleLaydateJS(i,s,ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121)&ChrW(47)&ChrW(77)&ChrW(77)&ChrW(47)&ChrW(100)&ChrW(100)&ChrW(32)&ChrW(72)&ChrW(72)&ChrW(58)&ChrW(109)&ChrW(109)&ChrW(58)&ChrW(115)&ChrW(115))
call echo(ChrW(26085)&ChrW(38388)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(74)&ChrW(83)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101),public_laydateJSCode) 
end if

if getConfigToFieldValue(public_listFieldAddClickAction,i) <>"" then
call listPage_handleFieldClickJS(i,c)
end if
if left(s,13)=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116) then
a1=split(s&ChrW(45)&ChrW(45)&ChrW(45)&ChrW(45),ChrW(45))
y=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&IIF(n <>"",ChrW(44),"")&ChrW(123)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(39)& i &ChrW(39)& a9 &ChrW(44)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)& q & a16 &ChrW(39)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(100)&ChrW(41)&ChrW(123)&vbcrlf
y=y&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(39)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(117)&ChrW(114)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(112)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(59)&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)& i &ChrW(34)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(28857)&ChrW(20987)&ChrW(28155)&ChrW(21152)&ChrW(20462)&ChrW(25913)&ChrW(34)&ChrW(62)&a17&ChrW(39)&ChrW(43)&ChrW(100)&ChrW(46)& i &ChrW(43)&ChrW(39)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(39)&ChrW(125)&ChrW(125) & vbcrlf
if a1(4) <>"" then
a12=ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(91)&ChrW(34)& a1(4) &ChrW(34)&ChrW(93)
else
a12=ChrW(112)&ChrW(105)&ChrW(100)
end if
call echo(ChrW(115)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)&ChrW(84)&ChrW(121)&ChrW(112)&ChrW(101),s & ChrW(61)&ChrW(61) & a12)
a11=a11 & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(32)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(40)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(32)&ChrW(39)& i &ChrW(39)&ChrW(41)&ChrW(32)&ChrW(123)&ChrW(32) & vbcrlf
a11=a11 & ChrW(108)&ChrW(97)&ChrW(121)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(102)&ChrW(117)&ChrW(108)&ChrW(108)&ChrW(40)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(50)&ChrW(40)&ChrW(39)&ChrW(21015)&ChrW(34920)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(46)&ChrW(46)&ChrW(47)& a1(1) &ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112)&ChrW(63)& a1(2) &ChrW(61)&ChrW(39)&ChrW(32)&ChrW(43)&ChrW(32)& a12 &ChrW(32)&ChrW(41)&ChrW(41)
else
a13=""
if instr(ChrW(124)&glabol_lineEditList&ChrW(124),ChrW(124)&i&ChrW(124))>0 then
if left(s,12)=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116) or left(s,17)=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)  or left(s,5)=ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111) then
a13=ChrW(44)&ChrW(32)&ChrW(117)&ChrW(110)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(35)&ChrW(84)&ChrW(80)&ChrW(76)&ChrW(45)&ChrW(100)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(100)&ChrW(112)&ChrW(119)&ChrW(110)&ChrW(45)&i&ChrW(39) 
elseif  left(s,11)=ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114) then
a13=ChrW(44)&ChrW(32)&ChrW(117)&ChrW(110)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(35)&ChrW(84)&ChrW(80)&ChrW(76)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(45)&i&ChrW(39) 
elseif left(s,4)=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101) or left(s,4)=ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101) then
a13=ChrW(44)&ChrW(32)&ChrW(117)&ChrW(110)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(97)&ChrW(108)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(99)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(39)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(35)&ChrW(84)&ChrW(80)&ChrW(76)&ChrW(45)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&i&ChrW(39)  
else
a13=ChrW(44)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(58)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101) 
public_listpage_onLineEdit_jsShow=ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)
end if

elseif getConfigToFieldValue(public_listFieldAddClickAction,i) <>"" then
a13=ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(100)&ChrW(41)&ChrW(123)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(39)&ChrW(60)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(117)&ChrW(114)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(112)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(59)&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(95)&i&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(28857)&ChrW(20987)&getConfigNameListToCnName(i,c)&ChrW(34)&ChrW(62)&a17&ChrW(39)&ChrW(43)&ChrW(100)&ChrW(46)&i&ChrW(43)&ChrW(39)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(62)&ChrW(39)&ChrW(125) 
end if
if a13="" and a17 <>"" then
a13=a13&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(100)&ChrW(41)&ChrW(123)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(39)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62)&a17&ChrW(39)&ChrW(43)&ChrW(100)&ChrW(46)&i&ChrW(43)&ChrW(39)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62)&ChrW(39)&ChrW(125) 
end if
y=ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&IIF(n <>"",ChrW(44),"")&ChrW(123)&ChrW(32)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(58)&ChrW(32)&ChrW(39)& i &ChrW(39)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(39)& q & a16 &ChrW(39)&a9&ChrW(44)&ChrW(32)&ChrW(115)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(58)&ChrW(32)&getListHeadSortShow(i)&ChrW(32)&a13&ChrW(125)&vbcrlf
if left(s,5)=ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121) then
y=replace(y,ChrW(125)&vbcrlf,ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(100)&ChrW(41)&ChrW(123)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(100)&ChrW(46)&i&ChrW(125)&ChrW(125)&vbcrlf)

elseif instr(ChrW(44)&public_listPage_jsTable_templetList&ChrW(44), ChrW(44)&i&ChrW(44))>0 then
y=replace(y,ChrW(125)&vbcrlf,ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(100)&ChrW(41)&ChrW(123)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(100)&ChrW(46)&i&ChrW(125)&ChrW(125)&vbcrlf)
elseif left(s,10)=ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101) then
call echo(ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101),s):doevents
if instr(s,ChrW(45))>0 then
if instr(s,ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(61))>0 then
a1=split(s,ChrW(95)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(61))
a2=split(a1(1),ChrW(95))
if instr(a2(0),ChrW(42))>0 then
a3=split(a2(0),ChrW(42)) 
y=replace(y,ChrW(125)&vbcrlf,ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(100)&ChrW(41)&ChrW(123)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(100)&ChrW(46)&i&ChrW(33)&ChrW(61)&ChrW(39)&ChrW(39)&ChrW(63)&ChrW(40)&ChrW(39)&ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(34)&ChrW(39)&ChrW(43)&ChrW(100)&ChrW(46)&i&ChrW(43)&ChrW(39)&ChrW(34)&ChrW(32)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(61)&ChrW(34)&a3(0)&ChrW(34)&ChrW(32)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(61)&ChrW(34)&a3(1)&ChrW(34)&ChrW(62)&ChrW(39)&ChrW(41)&ChrW(58)&ChrW(39)&ChrW(39)&ChrW(59)&ChrW(125)&ChrW(125)&vbcrlf)
end if
end if
end if
elseif left(s,6)=ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115) then
y=replace(y,ChrW(125)&vbcrlf,ChrW(44)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(58)&ChrW(39)&ChrW(35)&ChrW(84)&ChrW(80)&ChrW(76)&ChrW(45)&i&ChrW(39)&ChrW(125)&vbcrlf)
call listpage_handleStatus(a,s,i)
end if 
call echo(ChrW(115)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100),a13)
call echo(ChrW(115)&ChrW(74)&ChrW(115)&ChrW(111)&ChrW(110),y)
end if
if instr(x,ChrW(91)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(93))>0 then
y=replace(x,ChrW(91)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(93),y)
end if

v=getQXVal(i)
if  v <>"" and v <>ChrW(124) then 
y=ChrW(60)&ChrW(37)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(65)&ChrW(81)&ChrW(88)&ChrW(40)&ChrW(34)& v &ChrW(34)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(37)&ChrW(62) & y & ChrW(60)&ChrW(37)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(37)&ChrW(62)&vbcrlf
end if

if instr(ChrW(124)& glabol_enFieldList &ChrW(124),ChrW(124)& i &ChrW(124))>0 then
a14=a14&y
else
n=n&y
end if
end if
end if
next 
o=readfile(ChrW(46)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56))
if a <>ChrW(97)&ChrW(114)&ChrW(116)&ChrW(105)&ChrW(99)&ChrW(108)&ChrW(101)&ChrW(100)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(105)&ChrW(108) then
v=strCut(o,ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(26639)&ChrW(30446)&ChrW(19979)&ChrW(25289)&ChrW(21015)&ChrW(34920)&ChrW(45)&ChrW(45)&ChrW(62),ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62),1)
o=replace(o,v,"")
call echo(ChrW(21024)&ChrW(38500)&ChrW(37324)&ChrW(30340)&ChrW(26639)&ChrW(30446)&ChrW(20998)&ChrW(21015)&ChrW(21015)&ChrW(34920)&ChrW(40) & a,v)
end if

if instr(glabolListConfig,ChrW(100)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116))>0 then
o=replace(o,ChrW(60)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(34)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(45)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(101)&ChrW(120)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(34)&ChrW(62)&ChrW(23548)&ChrW(20986)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(62),"")
end if

if instr(glabolListConfig,ChrW(100)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116))>0 then
o=replace(o,ChrW(60)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(105)&ChrW(109)&ChrW(112)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(34)&ChrW(62)&ChrW(23548)&ChrW(20837)&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(62),"")
call echored(ChrW(21024)&ChrW(38500)&ChrW(37324)&ChrW(30340)&ChrW(23548)&ChrW(20837)&ChrW(23548)&ChrW(20986)&ChrW(25353)&ChrW(38062)&ChrW(40) & a,v)
end if
o=replace(o,ChrW(123)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(125),a)
if e <>"" then o=replace(o,ChrW(39)&ChrW(123)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(25490)&ChrW(24207)&ChrW(125),e)

if glabol_ascDesc <>"" then
o=replace(o,ChrW(39)&ChrW(123)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(25490)&ChrW(24207)&ChrW(125),ChrW(34)&ChrW(32)& glabol_ascDesc &ChrW(34)) 
o=replace(o,ChrW(123)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(25490)&ChrW(24207)&ChrW(125), ChrW(32)& glabol_ascDesc & ChrW(32))
end if

u=split(public_listPage_JsonDataFieldList,ChrW(44))
for each i in u

if (instr(ChrW(44)&p&ChrW(44), ChrW(44)&i&ChrW(44))>0 and i <>"") or left(i,8)=ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95) then
if instr(ChrW(44)&g&ChrW(44), ChrW(44)&i&ChrW(44))=false or left(i,8)=ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95) then
j=getFieldAlt(f,i)
call echo(i,j)          
if left(i,8)=ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(95) then
j=getFieldAlt(f,mid(i,9))
t=ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&mid(i,9)&ChrW(34)&ChrW(41)
if j=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or j=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) then
t=ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(76)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&mid(i,9)&ChrW(34)&ChrW(41)&ChrW(41)
end if
else          
t=ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)
if j=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or j=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) then
t=ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(76)&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)&i&ChrW(34)&ChrW(41)&ChrW(41)
end if
end if
m=m&ChrW(44)&ChrW(34)&ChrW(34)& i &ChrW(34)&ChrW(34)&ChrW(58)&ChrW(34)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(38)&ChrW(32)& t &ChrW(32)&ChrW(38)&ChrW(32)&ChrW(34)&ChrW(34)&ChrW(34)
end if
end if
next




o=replace(o,ChrW(123)&ChrW(106)&ChrW(115)&ChrW(111)&ChrW(110)&ChrW(67)&ChrW(125),m)
o=replace(o,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(106)&ChrW(115)&ChrW(67)&ChrW(125),n)
o=replace(o,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(106)&ChrW(115)&ChrW(67)&ChrW(95)&ChrW(101)&ChrW(110)&ChrW(125),a14)
if a4 <>"" then
a4=a4 & vbcrlf & ChrW(47)&ChrW(47)&ChrW(123)&ChrW(106)&ChrW(115)&ChrW(68)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(125)
o=replace(o,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(106)&ChrW(115)&ChrW(68)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(125),a4)
end if

if a11 <>"" then
a11=a11 & vbcrlf & ChrW(47)&ChrW(47)&ChrW(123)&ChrW(106)&ChrW(115)&ChrW(67)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(67)&ChrW(125)
o=replace(o,ChrW(47)&ChrW(47)&ChrW(123)&ChrW(106)&ChrW(115)&ChrW(67)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(67)&ChrW(125),a11)
end if
if a4 <>"" then
o=replace(o,ChrW(47)&ChrW(42)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(52)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(32)&ChrW(26377)&ChrW(22312)&ChrW(32447)&ChrW(36873)&ChrW(25321)&ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(35201)&ChrW(24320)&ChrW(21551)&ChrW(42)&ChrW(47),ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(52)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59))
end if
o=replace(o,ChrW(123)&ChrW(105)&ChrW(100)&ChrW(125),l)
if l <>"" then 
o=replace(o,ChrW(39)&ChrW(123)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(25490)&ChrW(24207)&ChrW(125),ChrW(34)&ChrW(32)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(66)&ChrW(89)&ChrW(32)& l &ChrW(34)) 
o=replace(o,ChrW(123)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(25490)&ChrW(24207)&ChrW(125), ChrW(32)&ChrW(79)&ChrW(82)&ChrW(68)&ChrW(69)&ChrW(82)&ChrW(32)&ChrW(66)&ChrW(89)&ChrW(32)& l & ChrW(32))
end if
generateAdminList=o
end function

function generateAdminForm(a,b,c,d)
generateAdminForm=handleGenerateAdminForm(ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109),a,b,c,d)
end function

function generateAdminView(a,b,c,d)
generateAdminView=handleGenerateAdminForm(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119),a,b,c,d)
end function

function handleGenerateAdminForm(a,b,c,d,e)
dim f,g,h,i,j,k
f=split(c,ChrW(44))
for each g in f
if g <>"" then
if instr(ChrW(44)& h &ChrW(44),ChrW(44)& g &ChrW(44))=false  then
if h <>"" then h=h &ChrW(44)
h=h & g
end if
end if
next
c=h
dim l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11
dim a12,a13,a14,a15,a16,a17,a18,a19,a20,a21
dim a22
dim a23,a24
d=ChrW(44)& d &ChrW(44)
e=ChrW(44)& e &ChrW(44)
l=db_PREFIX & b
m=getFieldList(l)
m=lcase(m)
if c <>"" and c <>ChrW(42) then
a1=split(c,ChrW(44))
for a2=0 to ubound(a1)
a3=a1(a2)        
if  a3 <>"" and (instr(ChrW(44)& m &ChrW(44),ChrW(44)& a3 &ChrW(44))>0  or left(a3,7)=ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)  or instr(ChrW(44)& public_editpage_show_inputHtml &ChrW(44),ChrW(44)& a3 &ChrW(44)) >0) then
if q <>"" then q=q &ChrW(44)
q=q & a3




end if
next
m=q
q=""
end if 
call echo(ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(99)&ChrW(32) & public_editpage_show_inputHtml,m)
a4=getConfigSetData(ChrW(34920)&ChrW(21333)&ChrW(22312)&ChrW(19968)&ChrW(34892))
n=split(m,ChrW(44))
call echo(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116),m)
for each o in n

call echo(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49),o)
if o <>"" AND (instr(ChrW(44)& c &ChrW(44),ChrW(44)& o &ChrW(44)) >0 or c=ChrW(42) or left(o,7)=ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) or instr(ChrW(44)& public_editpage_show_inputHtml &ChrW(44),ChrW(44)& o &ChrW(44)) >0   )  then 
p=getFieldAlt(l,o)
a12=o
if p="" and left(o,7)=ChrW(116)&ChrW(115)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100) then
p=ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)
end if
z=instr(d,ChrW(44)& o &ChrW(124))
if z>0 then
a12=strCut(d,ChrW(44)& o &ChrW(124),ChrW(44),0)
end if
call echo(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(32)&ChrW(50),o)

if   (r="" and p=ChrW(73)&ChrW(110)&ChrW(116) and o=public_idIndexName) and instr(ChrW(44)& public_editpage_show_inputHtml &ChrW(44),ChrW(44)& o &ChrW(44))=false then   
r=o

call echo(ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),o)
else
a6=""
j=IIF(instr(ChrW(44)&public_formViewFieldList&ChrW(44),ChrW(44)&o&ChrW(44))>0,ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119),a)
a3=getAdminInput(j,o,p,a12,e,a6,b,k,s)

a7=getQXVal(o)
if a7 <>"" and a7 <>ChrW(124) then 
a3=ChrW(60)&ChrW(37)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(65)&ChrW(81)&ChrW(88)&ChrW(40)&ChrW(34)& a7 &ChrW(34)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(37)&ChrW(62) & a3 & ChrW(60)&ChrW(37)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(37)&ChrW(62)&vbcrlf
end if

if instr(ChrW(44)&public_editpage_not_field_list&ChrW(44), ChrW(44)&o&ChrW(44))>0 and a <>ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
a3=""
end if
if left(a6,11)=ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45) then

















a3=vbcrlf&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&k&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62)&a3&vbcrlf&cfg_tabAdd1&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62)
a3=a3 & ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&o&ChrW(45)&ChrW(45)&ChrW(62)
a14=ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)& mid(a6,12) &ChrW(45)&ChrW(45)&ChrW(62)

if instr(ChrW(44)& formNoRowList &ChrW(44),ChrW(44)& mid(a6,12) &ChrW(44))=false and formNoRowList <>ChrW(42) then  
if instr(a5 & a24,a14)=false then
a3=htmlStartAddTab(a3,tab1) 
end if
end if


if instr(ChrW(124)& glabol_enFieldList &ChrW(124),ChrW(124)& o &ChrW(124))>0 then
if instr(a24,a14)>0 then
a24=replace(a24,a14,a14&a3)
else
a5=replace(a5,a14,a14&a3)
end if

else 
if instr(q,a14)>0 then
q=replace(q,a14,a14&a3)
else
a5=replace(a5,a14,a14&a3)
end if
end if
elseif a5="" then
if instr(ChrW(44)& formNoRowList &ChrW(44),ChrW(44)& o &ChrW(44))>0 or formNoRowList=ChrW(42) then

if instr(ChrW(124)& glabol_enFieldList &ChrW(124),ChrW(124)& o &ChrW(124))>0 then
call echo(ChrW(33521)&ChrW(25991)&ChrW(29256)&ChrW(49),o)
a24=a24 & a3
else
q=q & a3
end if
else
a5=a3
end if
else        

if instr(ChrW(44)& formNoRowList &ChrW(44),ChrW(44)& o &ChrW(44))>0 or formNoRowList=ChrW(42) then  

if instr(ChrW(124)& glabol_enFieldList &ChrW(124),ChrW(124)& o &ChrW(124))>0 then
call echo(ChrW(33521)&ChrW(25991)&ChrW(29256)&ChrW(50),o)
a24=a24 & a5 & a3
else
q=q & a5 & a3
end if
else
a13=a4
a22=""
if instr(ChrW(44)&public_editpage_warp_addid&ChrW(44), ChrW(44)& lcase(a10) &ChrW(44))>0 then
a22=a22&ChrW(95)&a10
end if
if instr(ChrW(44)&public_editpage_warp_addid&ChrW(44), ChrW(44)& lcase(o) &ChrW(44))>0 then
a22=a22&ChrW(95)&o
end if
if a22 <>"" then 
a22=ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(117)&ChrW(98)&a22&ChrW(34)            
a13=replace(a4,ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(34)&ChrW(62),ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(34)&a22&ChrW(62))
end if

if instr(ChrW(124)& glabol_enFieldList &ChrW(124),ChrW(124)& o &ChrW(124))>0 then
call echo(ChrW(33521)&ChrW(25991)&ChrW(29256)&ChrW(51),o)
a24=a24 & replace(replace(a13,ChrW(39)&ChrW(24038)&ChrW(36793)&ChrW(39),htmlStartAddTab(a5,tab2)),ChrW(39)&ChrW(21491)&ChrW(36793)&ChrW(39),htmlStartAddTab(a3,tab2))
else
q=q & replace(replace(a13,ChrW(39)&ChrW(24038)&ChrW(36793)&ChrW(39),htmlStartAddTab(a5,tab2)),ChrW(39)&ChrW(21491)&ChrW(36793)&ChrW(39),htmlStartAddTab(a3,tab2))
end if
end if
a5=""
end if

end if 
call echoBlueB(ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(50)&ChrW(50)&ChrW(50)&ChrW(50)&ChrW(50)&ChrW(50),o)

if instr(ChrW(44)&public_editpage_not_field_list&ChrW(44), ChrW(44)&o&ChrW(44))=false or a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
s=s & ChrW(44)& handleAspVar(o)
end if
y=getFieldInConfigType(e,o)
a15=getFieldType(e,o)
if left(y,15)=ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) and instr(y&ChrW(95),ChrW(103)&ChrW(101)&ChrW(116)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(116)&ChrW(95))>0  then

v=v&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)& o &ChrW(61) & listPage_gettablecount_AspCode(b,y,o,"")&vbcrlf
elseif left(y,15)=ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110) and instr(y&ChrW(95),ChrW(103)&ChrW(101)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(114)&ChrW(95))>0  then
v=v&eidtPage_getipaddr(b,y,o)

else 

if instr(ChrW(44)&public_editpage_not_field_list&ChrW(44), ChrW(44)&o&ChrW(44))=false or a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
if j=ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109) and left(y,8)=ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120) then
t=t & getHandleCheckboxToASP(o,y)
else 
if p=ChrW(73)&ChrW(110)&ChrW(116) and o <>ChrW(105)&ChrW(115)&ChrW(116)&ChrW(104)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(103)&ChrW(104) and o <>ChrW(112)&ChrW(97)&ChrW(121)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116)  and o <>ChrW(105)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(121)&ChrW(109)&ChrW(101)&ChrW(110)&ChrW(116) and o <>ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(103)&ChrW(110)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(114)&ChrW(97)&ChrW(99)&ChrW(116) and o <>ChrW(105)&ChrW(115)&ChrW(98)&ChrW(105)&ChrW(108)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(103) and getFieldInConfigType(e,o) <>ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111) then
t=t & handleAspVar(o) & ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)& o &ChrW(34)&ChrW(41)&ChrW(41) & vbcrlf      
else
t=t & handleAspVar(o) & ChrW(61)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)& o &ChrW(34)&ChrW(41) & vbcrlf
end if


if o <>r and left(y&ChrW(45),6) <>ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111)&ChrW(45) then
if p=ChrW(73)&ChrW(110)&ChrW(116) or  p=ChrW(70)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116) or p=ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) or p=ChrW(77)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121) then
t=t & ChrW(105)&ChrW(102)&ChrW(32)& handleAspVar(o) &ChrW(61)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32) & handleAspVar(o) & ChrW(61)&ChrW(110)&ChrW(117)&ChrW(108)&ChrW(108) & vbcrlf
end if 
end if
call echo(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49)&ChrW(49),y)
if left(y&ChrW(45),6)=ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111)&ChrW(45) then t=t & handleAspVar(o) & ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)& o &ChrW(61)&ChrW(34)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(44)&ChrW(49)&ChrW(44)&ChrW(48)&ChrW(41)&ChrW(32) & vbcrlf
end if

if instr(ChrW(44)&public_editSafe_fieldList&ChrW(44), ChrW(44)&o&ChrW(44))>0 then
t=t & ""&o&ChrW(61)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(40)&o&ChrW(41) & vbcrlf& vbcrlf
end if

if instr(ChrW(44)&public_editSafe_azDouHao_fieldList&ChrW(44), ChrW(44)&o&ChrW(44))>0 then
t=t & ""&o&ChrW(61)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(65)&ChrW(90)&ChrW(68)&ChrW(111)&ChrW(117)&ChrW(72)&ChrW(97)&ChrW(111)&ChrW(40)&o&ChrW(41) & vbcrlf& vbcrlf
end if

if instr(ChrW(44)&public_editSafe_dirFileName_fieldList&ChrW(44), ChrW(44)&o&ChrW(44))>0 then
t=t & ""&o&ChrW(61)&ChrW(104)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(115)&ChrW(112)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(83)&ChrW(97)&ChrW(102)&ChrW(101)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)&o&ChrW(41) & vbcrlf& vbcrlf
end if

if instr(a15&ChrW(95),ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(80)&ChrW(101)&ChrW(114)&ChrW(109)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(95))>0 then
t=t & ""&o&ChrW(61)&ChrW(114)&ChrW(101)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(40)&o&ChrW(44)&ChrW(34)&ChrW(44)&ChrW(32)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(124)&ChrW(34)&ChrW(41) & vbcrlf& vbcrlf
end if 
end if
x=""
if p <>""   then 
if p=ChrW(73)&ChrW(110)&ChrW(116) or  p=ChrW(70)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(116) or p=ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) then
x=ChrW(105)&ChrW(102)&ChrW(32)& handleAspVar(o) &ChrW(60)&ChrW(62)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32)
end if
x=""

if o <>r then

a16=getAddNewUpdateValue(public_editPage_addnew_defaultValue,o)
if a16 <>"" then

if instr(ChrW(44)& public_editpage_show_inputHtml &ChrW(44),ChrW(44)& o &ChrW(44))=false then

a18=a18 & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32) &ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)& o &ChrW(34)&ChrW(41)&ChrW(61)& a16&vbcrlf
end if
end if

if instr(ChrW(44)&public_formViewFieldList&ChrW(44),ChrW(44)&o&ChrW(44))=false then
a17=handleAspVar(o)
a17=getLEVPageRunAction(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101),o,a17)
if instr(a15&ChrW(95),ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(95))>0 then
f=split(a15&ChrW(95),ChrW(95))
a11=f(1)


if a11 <>ChrW(109)&ChrW(100)&ChrW(53)&ChrW(49)&ChrW(54) and a11 <>ChrW(109)&ChrW(100)&ChrW(53)&ChrW(51)&ChrW(50) then
a11=ChrW(109)&ChrW(121)&ChrW(77)&ChrW(68)&ChrW(53)
end if
a9=x &ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)& o &ChrW(34)&ChrW(41)&ChrW(61)&a11&ChrW(40)& a17&ChrW(41)
else 
a9=x &ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)& o &ChrW(34)&ChrW(41)&ChrW(61)& a17
end if 

if instr(ChrW(44)&public_editpage_not_field_list&ChrW(44), ChrW(44)&o&ChrW(44))>0 and a <>ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
a9=""
end if

a17=getAddNewUpdateValue(public_editPage_update_defaultValue,o)
if a17 <>"" then 

a9=x &ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)& o &ChrW(34)&ChrW(41)&ChrW(61)& a17
end if
a7=getQXVal(o)
a8=getEditQXVal(o)
if (a7 <>"" and a7 <>ChrW(124)) and (a8 <>"" and a8 <>ChrW(124)) then 
a9=ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(65)&ChrW(81)&ChrW(88)&ChrW(40)&ChrW(34)& a7 &ChrW(34)&ChrW(41)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(65)&ChrW(81)&ChrW(88)&ChrW(40)&ChrW(34)& a8 &ChrW(34)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32) & a9  
elseif (a7 <>"" and a7 <>ChrW(124)) then
a9=ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(65)&ChrW(81)&ChrW(88)&ChrW(40)&ChrW(34)& a7 &ChrW(34)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32) & a9  
elseif (a8 <>"" and a8 <>ChrW(124)) then
a9=ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(65)&ChrW(81)&ChrW(88)&ChrW(40)&ChrW(34)& a8 &ChrW(34)&ChrW(41)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32) & a9  
end if 
if instr(a15&ChrW(95),ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(95))>0 then
if instr(a9,ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(65)&ChrW(81)&ChrW(88)&ChrW(40))>0 then
a9=replace(a9,ChrW(105)&ChrW(102)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(65)&ChrW(81)&ChrW(88)&ChrW(40),ChrW(105)&ChrW(102)&ChrW(32)&o&ChrW(60)&ChrW(62)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(65)&ChrW(81)&ChrW(88)&ChrW(40))
else
a9=ChrW(105)&ChrW(102)&ChrW(32)&o&ChrW(60)&ChrW(62)&ChrW(34)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(32) & a9  
end if
a9=a9
end if

if instr(ChrW(44)& public_editpage_show_inputHtml &ChrW(44),ChrW(44)& o &ChrW(44))=false then

if instr(ChrW(124)& glabol_enFieldList &ChrW(124),ChrW(124)& o &ChrW(124))>0 then
a23=a23 & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&a9&vbcrlf
else
u=u & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&a9&vbcrlf
end if
end if
end if
end if
end if
if p="" and instr(ChrW(44)& public_editpage_show_inputHtml &ChrW(44),ChrW(44)& o &ChrW(44)) >0 then

else
if instr(a15&ChrW(95),ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(95))>0 then
call echo(ChrW(19981)&ChrW(26174)&ChrW(31034)&ChrW(23494)&ChrW(30721)&ChrW(36755)&ChrW(20986)&ChrW(20540)&ChrW(30340),ChrW(97)&ChrW(97)&ChrW(97))

elseif instr(ChrW(44)&public_editpage_not_field_list&ChrW(44), ChrW(44)&o&ChrW(44))>0 and a <>ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
else
a19=ChrW(114)&ChrW(115)&ChrW(40)&ChrW(34)& o &ChrW(34)&ChrW(41)
if j=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
a19=getLEVPageRunAction(ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101),o,a19)
else
a19=getLEVPageRunAction(ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101),o,a19)
end if
v=v & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)& handleAspVar(o) &ChrW(61)&a19&vbcrlf
end if
end if
end if
end if
a10=o
next 
if a5 <>"" then q=q & a5

if instr(ChrW(44)&s&ChrW(44),ChrW(44)&ChrW(105)&ChrW(100)&ChrW(44))=false then 
s=s & ChrW(44)&ChrW(105)&ChrW(100)
t=t & vbcrlf & ChrW(105)&ChrW(100)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)&ChrW(105)&ChrW(100)&ChrW(34)&ChrW(41)&ChrW(41)
end if
w=readfile(ChrW(46)&ChrW(47)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(46)&ChrW(97)&ChrW(115)&ChrW(112),ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
w=replace(w,ChrW(123)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(125),b)
w=replace(w,ChrW(39)&ChrW(123)&ChrW(100)&ChrW(105)&ChrW(109)&ChrW(23450)&ChrW(20041)&ChrW(22359)&ChrW(125),s)
w=replace(w,ChrW(39)&ChrW(123)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(115)&ChrW(116)&ChrW(25509)&ChrW(25910)&ChrW(22359)&ChrW(125),t)   
w=replace(w,ChrW(39)&ChrW(123)&ChrW(28155)&ChrW(21152)&ChrW(26032)&ChrW(30340)&ChrW(36861)&ChrW(21152)&ChrW(22359)&ChrW(125),a18)
w=replace(w,ChrW(39)&ChrW(123)&ChrW(114)&ChrW(115)&ChrW(20889)&ChrW(20837)&ChrW(22359)&ChrW(125),u)
w=replace(w,ChrW(39)&ChrW(123)&ChrW(114)&ChrW(115)&ChrW(20889)&ChrW(20837)&ChrW(101)&ChrW(110)&ChrW(22359)&ChrW(125),a23)
w=replace(w,ChrW(39)&ChrW(123)&ChrW(114)&ChrW(115)&ChrW(26174)&ChrW(31034)&ChrW(22359)&ChrW(125),v)
w=replace(w,ChrW(39)&ChrW(123)&ChrW(114)&ChrW(115)&ChrW(40664)&ChrW(35748)&ChrW(22359)&ChrW(125),glabolFormInputElseAspCode)
w=replace(w,ChrW(39)&ChrW(123)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(22359)&ChrW(125),q)
w=replace(w,ChrW(39)&ChrW(123)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(95)&ChrW(101)&ChrW(110)&ChrW(22359)&ChrW(125),a24)
w=replace(w,ChrW(123)&ChrW(105)&ChrW(100)&ChrW(125),r)

if a24="" then
a3=getstrcut(w,ChrW(60)&ChrW(117)&ChrW(108)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(45)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(34)&ChrW(62),ChrW(60)&ChrW(47)&ChrW(117)&ChrW(108)&ChrW(62),1)
w=replace(w,a3,ChrW(60)&ChrW(37)&ChrW(39)&ChrW(33521)&ChrW(25991)&ChrW(29256)&ChrW(27809)&ChrW(26377)&ChrW(20869)&ChrW(23481)&ChrW(65292)&ChrW(21017)&ChrW(25226)&ChrW(33521)&ChrW(25991)&ChrW(29256)&ChrW(26631)&ChrW(39064)&ChrW(21024)&ChrW(38500)&ChrW(25481)&ChrW(37)&ChrW(62))

end if
handleGenerateAdminForm=w 
end function
function getAdminInput(a,b,c,d,e,f,g,h,i) 
dim j,k,l,m,n,o,p,q,r,s,t,u,v,w,x
dim y,z
y=ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)
dim a1,a2,a3,a4,a5,a6
h=""
dim a7
if instr(ChrW(44)&public_editpage_warp_addid&ChrW(44), ChrW(44)& lcase(b) &ChrW(44))>0 then
a7=ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&b&ChrW(34)
end if

if instr(ChrW(44)&public_editpage_warp_hide&ChrW(44), ChrW(44)& lcase(b) &ChrW(44))>0 then
a4=ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(100)&ChrW(105)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(58)&ChrW(110)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(59)&ChrW(34)
end if

if c="" and instr(ChrW(44)& public_editpage_show_inputHtml &ChrW(44),ChrW(44)& b &ChrW(44))=false then 
call eerr(ChrW(36864)&ChrW(20986),b)
exit function 
end if
dim a8:a8=""
dim a9



if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
a8=public_formViewMaoHao
else
a8=public_formEditMaoHao
end if
u=ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)& b &ChrW(45)&ChrW(45)&ChrW(62)

if a <>ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then

a1=ChrW(44)& b &ChrW(124)
m=instr(ChrW(44)&configNameListNote,a1)
if m>0 then
a2=mid(ChrW(44)&configNameListNote,m+len(a1))
p=split(a2,ChrW(44))   

a3=ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(119)&ChrW(101)&ChrW(110)&ChrW(104)&ChrW(97)&ChrW(111)&ChrW(34)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(45)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(61)&ChrW(34)& decTsStrReplace(p(0),ChrW(44)&ChrW(124)) &ChrW(34)&ChrW(62)&ChrW(38)&ChrW(35)&ChrW(120)&ChrW(101)&ChrW(54)&ChrW(48)&ChrW(55)&ChrW(59)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)&ChrW(32) 


call handle_editPathLeftNoteJsCode(b,n)
end if

m=instr(ChrW(44)&public_formFieldTextNote,a1)
if m>0 then
a2=mid(ChrW(44)&public_formFieldTextNote,m+len(a1))
p=split(a2,ChrW(44))  
u=vbcrlf&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(109)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(45)&ChrW(101)&ChrW(109)&ChrW(34)&ChrW(62)& decTsStrReplace(p(0),ChrW(44)&ChrW(124)) &ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & u
end if
end if


j=cfg_tab&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(105)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(39)&a7&a4&ChrW(62) & vbcrlf
j=j&cfg_tabAdd1&ChrW(60)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(101)&ChrW(108)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(45)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(101)&ChrW(108)&ChrW(39)&ChrW(62)& d & a3 & a8 &ChrW(60)&ChrW(47)&ChrW(108)&ChrW(97)&ChrW(98)&ChrW(101)&ChrW(108)&ChrW(62) & vbcrlf






m=instr(e,ChrW(44)& b &ChrW(124))
if m>0 then
r=strCut(e,ChrW(44)& b &ChrW(124),ChrW(44),1)
z=r








end if




if r <>"" then

p=split(replace(r,ChrW(44),""),ChrW(124))
if ubound(p) >=1 then
n=p(1)
end if
if ubound(p) >=2 then
q=p(2)
if q <>"" then

if instr(q,ChrW(112)&ChrW(120))=false and instr(q,ChrW(109))=false and instr(q,ChrW(37))=false then
q=q&ChrW(112)&ChrW(120)
end if

end if
end if 
if ubound(p) >=3 then
if p(3) <>"" then s=ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(102)&ChrW(121)&ChrW(61)&ChrW(39)& p(3) &ChrW(39)
if instr(n&ChrW(95),ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(95))>0 then
if s <>"" then
s=ChrW(60)&ChrW(37)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(102)&ChrW(121)&ChrW(61)&ChrW(39)& p(3) &ChrW(39)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(34)&ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
end if
end if
call echo(ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(102)&ChrW(121)&ChrW(32) & b,p(3))
end if 
if ubound(p) >=4 then
if p(4) <>"" then l=p(4)
end if  
if ubound(p) >=5 then
if p(5) <>"" then f=p(5)

end if  
if ubound(p) >=6 then
if p(6) <>"" then y=p(6) 
if y="" then y=ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)
end if  
if ubound(p) >=7 then
a1=phptrim(p(7))
if a1 <>"" then
if instr(a1,ChrW(112)&ChrW(120))=false and  instr(a1,ChrW(37))=false and  instr(a1,ChrW(118)&ChrW(119))=false and  instr(a1,ChrW(118)&ChrW(104))=false and  instr(a1,ChrW(101)&ChrW(109))=false and  instr(a1,ChrW(114)&ChrW(101)&ChrW(109))=false and  instr(a1,ChrW(112)&ChrW(116))=false then
a1=a1&ChrW(112)&ChrW(120)
end if 
end if
if a1 <>"" then
h=ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58)&a1&ChrW(34) 
end if
end if  
end if



a5=ChrW(35831)&ChrW(36755)&ChrW(20837)& d
if l=ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(119)&ChrW(111)&ChrW(114)&ChrW(100) then
if instr(n&ChrW(95),ChrW(112)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(87)&ChrW(111)&ChrW(114)&ChrW(100)&ChrW(95))>0 then
a5=ChrW(60)&ChrW(37)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(35831)&ChrW(36755)&ChrW(20837)&d&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(19981)&ChrW(20462)&ChrW(25913)&ChrW(30041)&ChrW(31354)&ChrW(34)&ChrW(41)&ChrW(37)&ChrW(62)
end if
a6=ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(97)&ChrW(102)&ChrW(102)&ChrW(105)&ChrW(120)&ChrW(61)&ChrW(34)&ChrW(101)&ChrW(121)&ChrW(101)&ChrW(34)
end if
if left(n,5)=ChrW(121)&ChrW(101)&ChrW(115)&ChrW(110)&ChrW(111) then      
if instr(n,ChrW(45))>0 then
w=split(n,ChrW(45))

if ubound(w)=2 then
v=w(1) & ChrW(124) & w(2)
elseif ubound(w)=1 then
x=decTsStrReplace(w(1) ,ChrW(124))
if instr(x,ChrW(124))>0 then v=x
end if 
end if
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf 
if v="" then v=ChrW(26159)&ChrW(124)&ChrW(21542)
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
w=split(v,ChrW(124))
t= ChrW(60)&ChrW(37)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&b&ChrW(61)&ChrW(48)&ChrW(44)&ChrW(34)&w(1)&ChrW(34)&ChrW(44)&ChrW(34)&w(0)&ChrW(34)&ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
else
t=ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(119)&ChrW(105)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(34)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&b&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(115)&ChrW(107)&ChrW(105)&ChrW(110)&ChrW(61)&ChrW(34)&ChrW(115)&ChrW(119)&ChrW(105)&ChrW(116)&ChrW(99)&ChrW(104)&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(61)&ChrW(34)& v &ChrW(34)&ChrW(32)&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&b&ChrW(61)&ChrW(48)&ChrW(44)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)&ChrW(34)&ChrW(41)&ChrW(37)&ChrW(62)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
end if
elseif instr(n&ChrW(95),ChrW(97)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(80)&ChrW(101)&ChrW(114)&ChrW(109)&ChrW(105)&ChrW(115)&ChrW(115)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(95))>0 then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t= ChrW(60)&ChrW(37)&ChrW(61)& b &ChrW(37)&ChrW(62)
j=j&cfg_tab&t
else
t=editPage_adminPermission(g,n,b,i)
j=j&t 
end if
elseif left(n,15)=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(110)&ChrW(109)&ChrW(84)&ChrW(120)&ChrW(116) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t= ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)& b &ChrW(41)&ChrW(37)&ChrW(62)
j=j&cfg_tab&t
else
t=ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(83)&ChrW(117)&ChrW(98)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(84)&ChrW(120)&ChrW(116)&ChrW(40)&ChrW(34)& mid(n,16) &ChrW(34)&ChrW(44)&ChrW(34)& b &ChrW(34)&ChrW(44)& b &ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tab&t
end if
elseif left(n,12)=ChrW(115)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(110)&ChrW(109) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t= ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)& b &ChrW(41)&ChrW(37)&ChrW(62)
j=j&cfg_tab&t
else
t=ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(83)&ChrW(117)&ChrW(98)&ChrW(73)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)& mid(n,13) &ChrW(34)&ChrW(44)&ChrW(34)& b &ChrW(34)&ChrW(44)& b &ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tab&t
end if
elseif left(n,14)=ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(110)&ChrW(109) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t= ChrW(60)&ChrW(37)&ChrW(61)& b &ChrW(37)&ChrW(62)
j=j&cfg_tab&t
else
t=ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(66)&ChrW(111)&ChrW(120)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)& mid(n,15) &ChrW(34)&ChrW(44)&ChrW(34)& b &ChrW(34)&ChrW(44)& b &ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tab&t
end if
elseif left(n,14)=ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(110)&ChrW(109)&ChrW(84)&ChrW(120)&ChrW(116) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t= ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)& b &ChrW(41)&ChrW(37)&ChrW(62)
j=j&cfg_tab&t
else
t=ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(84)&ChrW(120)&ChrW(116)&ChrW(40)&ChrW(34)& mid(n,15) &ChrW(34)&ChrW(44)&ChrW(34)& b &ChrW(34)&ChrW(44)& b &ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tab&t
end if
elseif left(n,11)=ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(110)&ChrW(109) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(98)&ChrW(108)&ChrW(111)&ChrW(99)&ChrW(107)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t= ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(88)&ChrW(105)&ChrW(121)&ChrW(117)&ChrW(101)&ChrW(116)&ChrW(97)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)& b &ChrW(41)&ChrW(37)&ChrW(62)
j=j&cfg_tab&t
else
t=ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(67)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)& mid(n,12) &ChrW(34)&ChrW(44)&ChrW(34)& b &ChrW(34)&ChrW(44)& b &ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tab&t
end if
elseif left(n,16)=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
t= ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(65)&ChrW(100)&ChrW(109)&ChrW(105)&ChrW(110)&ChrW(73)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(40)& b &ChrW(41)&ChrW(37)&ChrW(62)
j=j&cfg_tab&t
elseif left(n,12)=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if instr(n&ChrW(95),ChrW(99)&ChrW(111)&ChrW(108)&ChrW(117)&ChrW(109)&ChrW(110)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(95))>0 then
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t=viewpage_getHandleOnLiseSelect(g,n,b,t)
j=j & t
else

t=editpage_getHandleOnLiseSelect(g,n,b,t)
j=j&t
end if
else
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t= ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(79)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(40)&ChrW(34)& b & mid(n,13) &ChrW(34)&ChrW(44)& b &ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2 & t
else 
t=cfg_tabAdd2 & ChrW(60)&ChrW(37)&ChrW(61)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(79)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(72)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(40)&ChrW(34)& b & mid(n,13) &ChrW(34)&ChrW(44)& handleAspVar(b) &ChrW(41)&ChrW(37)&ChrW(62)&vbcrlf
j=j& t
end if  
end if
elseif left(n,8)=ChrW(116)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(115)&ChrW(102)&ChrW(101)&ChrW(114) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf     
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t=viewpage_getHandleTransfer(g,n,b)
j=j & t
else

t=editpage_getHandleTransfer(g,n,b,q)
j=j&t
end if  
elseif left(n,17)=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)  or left(n,20)=ChrW(111)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(67)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf     
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t=viewpage_getHandleOnLineSelectValue(g,n,b)
j=j&t
else
t=editpage_onlineSelect_input(g,n,b)
j=j&t
end if   
elseif left(n,5)=ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then         
t=viewpage_radio_input(g,n,b)
j=j&t
else 
t=editpage_radio_input(g,n,b)
j=j&t
end if  
elseif left(n,15)=ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t= ChrW(60)&ChrW(37)&ChrW(61)& b &ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2 & t
else
t= ChrW(60)&ChrW(37)&ChrW(61)&ChrW(84)&ChrW(83)&ChrW(95)&ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(84)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(99)&ChrW(116)&ChrW(40)&ChrW(34)& b &ChrW(34)&ChrW(44)&ChrW(34)& n &ChrW(34)&ChrW(44)& b &ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2 & t

end if 
elseif left(n,6)=ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110) then  
w=split(mid(n,8)&ChrW(95)&ChrW(95),ChrW(95))

j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf

t=ChrW(60)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(116)&ChrW(110)&ChrW(45)&ChrW(115)&ChrW(109)& IIF(w(0) <>"",ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(98)&ChrW(103)&ChrW(45)&w(0)&"","") &ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&b&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(61)&ChrW(34)&b&ChrW(34)&ChrW(62)&d&ChrW(60)&ChrW(47)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(116)&ChrW(111)&ChrW(110)&ChrW(62) & vbcrlf    
j=j&cfg_tabAdd2 & t
elseif left(n,6)=ChrW(114)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t=viewpage_rating_input(g,n,b)
else
t=editpage_rating_input(g,n,b)

end if
j=j&t
else

if (c=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) and n <>ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)) or (c=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) and n=ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)) then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&y&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf

if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t= ChrW(60)&ChrW(37)&ChrW(61)& b &ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2 & t
else

if n=ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114) then
o=ChrW(60)&ChrW(37)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&ChrW(114)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)&ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(111)&ChrW(114)&ChrW(34)&ChrW(41)&ChrW(60)&ChrW(62)&ChrW(34)&ChrW(110)&ChrW(111)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(39)& b &ChrW(39)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(34)&ChrW(41)&ChrW(37)&ChrW(62)
call editpage_editorJSCode(b)
end if




t=ChrW(60)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&b&ChrW(39)&ChrW(32)&o&ChrW(32)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(104)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(39)& a5 &ChrW(39)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(39)& IIF(q <>"",ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)& q &ChrW(39),"") &s & ChrW(62)&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(67)&ChrW(76)&ChrW(40)& b &ChrW(41)&ChrW(37)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
end if
elseif left(n&ChrW(45),5)=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45) or left(n&ChrW(45),5)=ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(45)then
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
t= ChrW(60)&ChrW(37)&ChrW(61)& b &ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
else

if left(n,4)=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101) then
call handleEditPageLaydateJS(b,n,ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121)&ChrW(47)&ChrW(77)&ChrW(77)&ChrW(47)&ChrW(100)&ChrW(100))
call echo(ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(26085)&ChrW(26399)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(74)&ChrW(83)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101),public_laydateJSCode) 
elseif left(n,4)=ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101) then
call handleEditPageLaydateJS(b,n,ChrW(121)&ChrW(121)&ChrW(121)&ChrW(121)&ChrW(47)&ChrW(77)&ChrW(77)&ChrW(47)&ChrW(100)&ChrW(100)&ChrW(32)&ChrW(72)&ChrW(72)&ChrW(58)&ChrW(109)&ChrW(109)&ChrW(58)&ChrW(115)&ChrW(115))
call echo(ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(26085)&ChrW(38388)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(74)&ChrW(83)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101),public_laydateJSCode) 
end if
t=ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(112)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(105)&ChrW(120)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(105)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(39)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(105)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62)&vbcrlf&cfg_tabAdd2&ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(39)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&b&ChrW(39)&ChrW(32)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(104)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(39)& a5 &ChrW(39)&a6&ChrW(32)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(111)&ChrW(102)&ChrW(102)&ChrW(39)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&IIF(n=ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101),ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101))&ChrW(39)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(60)&ChrW(37)&ChrW(61)& b &ChrW(37)&ChrW(62)&ChrW(34)&ChrW(32)&s&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
end if
else
j=j&cfg_tabAdd1&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)& y &ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62) & vbcrlf

if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
if left(n,6)=ChrW(105)&ChrW(100)&ChrW(99)&ChrW(97)&ChrW(114)&ChrW(100) then
t= ChrW(60)&ChrW(37)&ChrW(61)&ChrW(105)&ChrW(100)&ChrW(99)&ChrW(97)&ChrW(114)&ChrW(100)&ChrW(89)&ChrW(77)&ChrW(68)&ChrW(72)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(40)& b &ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
elseif left(n,11)=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111) then
t= ChrW(60)&ChrW(37)&ChrW(61)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(85)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(73)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(40)& b &ChrW(41)&ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
elseif left(n,11)=ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(50) or left(n,3)=ChrW(105)&ChrW(109)&ChrW(103) then
t=ChrW(60)&ChrW(105)&ChrW(109)&ChrW(103)&ChrW(32)&ChrW(115)&ChrW(114)&ChrW(99)&ChrW(61)&ChrW(34)&ChrW(60)&ChrW(37)&ChrW(61)& b &ChrW(37)&ChrW(62)&ChrW(34)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(109)&ChrW(97)&ChrW(120)&ChrW(45)&ChrW(119)&ChrW(105)&ChrW(100)&ChrW(116)&ChrW(104)&ChrW(58)&ChrW(49)&ChrW(48)&ChrW(48)&ChrW(37)&ChrW(34)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
elseif left(n,10)=ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101) then
t=ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34)&ChrW(60)&ChrW(37)&ChrW(61)& b &ChrW(37)&ChrW(62)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(28857)&ChrW(20987)&ChrW(26597)&ChrW(30475)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)& b &ChrW(60)&ChrW(62)&ChrW(34)&ChrW(34)&ChrW(44)& b &ChrW(44)&ChrW(34)&ChrW(34)&ChrW(41)&ChrW(37)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
elseif left(n,4)=ChrW(100)&ChrW(111)&ChrW(119)&ChrW(110) then
t=ChrW(60)&ChrW(97)&ChrW(32)&ChrW(104)&ChrW(114)&ChrW(101)&ChrW(102)&ChrW(61)&ChrW(34)&ChrW(60)&ChrW(37)&ChrW(61)& b &ChrW(37)&ChrW(62)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(114)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(61)&ChrW(34)&ChrW(95)&ChrW(98)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(107)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(28857)&ChrW(20987)&ChrW(26597)&ChrW(30475)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)& b &ChrW(60)&ChrW(62)&ChrW(34)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(28857)&ChrW(20987)&ChrW(19979)&ChrW(36733)&ChrW(25991)&ChrW(20214)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(34)&ChrW(41)&ChrW(37)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(97)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
elseif left(n,8)=ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120) then
t=viewpage_getHandleTransfer(g,n,b)
j=j & t
else
t= ChrW(60)&ChrW(37)&ChrW(61)& handleAspVar(b) &ChrW(37)&ChrW(62) & vbcrlf
j=j&cfg_tabAdd2&t
end if
else
a9=""
if left(n,10)=ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101) or left(n,11)=ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(50)  then


end if

t=ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)& IIF(l <>"",l,ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)) &ChrW(39)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&b&ChrW(39)&ChrW(32)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(104)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(39)& a5 &ChrW(39)&a6&ChrW(32)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(111)&ChrW(102)&ChrW(102)&ChrW(39)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(39)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(67)&ChrW(76)&ChrW(40)& handleAspVar(b) &ChrW(41)&ChrW(37)&ChrW(62)&ChrW(34)&ChrW(32)& s & a9 &ChrW(62) & vbcrlf

if left(n,4)=ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115) then
t=ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(39)& IIF(l <>"",l,ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)) &ChrW(39)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&b&ChrW(39)&ChrW(32)&ChrW(32)&ChrW(97)&ChrW(117)&ChrW(116)&ChrW(111)&ChrW(99)&ChrW(111)&ChrW(109)&ChrW(112)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(111)&ChrW(102)&ChrW(102)&ChrW(39)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(45)&ChrW(114)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(116)&ChrW(97)&ChrW(103)&ChrW(115)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(39)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(39)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(60)&ChrW(37)&ChrW(61)& b &ChrW(37)&ChrW(62)&ChrW(34)&ChrW(32)& s & a9 &ChrW(62) & vbcrlf

public_js_tags_show=1
elseif left(n,8)=ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120) then
t=getHandleCheckboxToHtml(b,n)
call echo(ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(83),z)
call echo(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101),n)
call echo(getFieldInConfigType(e,b),e)
elseif left(n,11)=ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114) then
t=editpage_colorpickerJS(b,t)
call echoBlueB(ChrW(32534)&ChrW(36753)&ChrW(39029)&ChrW(39068)&ChrW(33394)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(32)&ChrW(112)&ChrW(117)&ChrW(98)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(95)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(74)&ChrW(83)&ChrW(67)&ChrW(111)&ChrW(100)&ChrW(101),public_colorpickerJSCode) 
else

t= get_handleEditPageAllAction(n,b,cfg_tab,t)   
end if
call echo(ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101),n)
j=j&cfg_tabAdd2&t
end if
end if
end if
j=j&cfg_tabAdd1&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & u & vbcrlf
if left(n,10)=ChrW(117)&ChrW(112)&ChrW(108)&ChrW(111)&ChrW(97)&ChrW(100)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101) then
if a <>ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then 
j=j & editpage_handle_layuiadminUploadPicJsCode(b,n)

public_paste_update_image_js_code=public_paste_update_image_js_code & ChrW(112)&ChrW(97)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(73)&ChrW(109)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(40)&ChrW(39)&b&ChrW(39)&ChrW(41)&ChrW(59) & vbcrlf
end if
end if
if instr(f,ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(45))>0 then
j=j & ChrW(60)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(52)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(39)&ChrW(62)& mid(f,11) & ChrW(60)&ChrW(47)&ChrW(102)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(62)
end if
j=j&cfg_tab&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
if instr(f,ChrW(97)&ChrW(100)&ChrW(100)&ChrW(116)&ChrW(111)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116))>0 then
j=t
end if
if a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119) then
j=replace(j,ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&h&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(62),ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(45)&ChrW(119)&ChrW(114)&ChrW(97)&ChrW(112)&ChrW(39)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(39)&ChrW(108)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(45)&ChrW(104)&ChrW(101)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(58)&ChrW(52)&ChrW(48)&ChrW(112)&ChrW(120)&ChrW(59)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(35)&ChrW(57)&ChrW(57)&ChrW(57)&ChrW(59)&ChrW(39)&ChrW(62))
end if

getAdminInput=j
end function

function getFieldInConfigType(a,b)
dim c,d,e
c=split(a,ChrW(44))
for each e in c
if instr(e,ChrW(124))>0 then
d=split(e,ChrW(124))
if d(0)=b then
getFieldInConfigType=d(1)
exit function
end if
end if
next
end function

function getFieldType(a,b)
dim c,d,e,f
c=instr(a,ChrW(44)& b &ChrW(124))
if c>0 then
d=strCut(a,ChrW(44)& b &ChrW(124),ChrW(44),1) 
end if 
if d <>"" then

e=split(replace(d,ChrW(44),""),ChrW(124))
if ubound(e) >=1 then
f=e(1)
end if
end if
getFieldType=f
end function

function getConfigNameListToCnName(a,b)
dim c,d
d=instr(b,ChrW(44)& a &ChrW(124))
if d>0 then
getConfigNameListToCnName=strCut(b,ChrW(44)& a &ChrW(124),ChrW(44),0)
end if
end function

sub listPage_handleFieldClickJS(a,b)
dim c,d,e,f,g,h,i
d=getConfigNameListToCnName(a,b)
g=getConfigToFieldValue(public_listFieldAddClickAction,a)  
i=split(g,ChrW(91)&ChrW(45)&ChrW(93))
h=ChrW(115)&ChrW(104)&ChrW(111)&ChrW(119)&ChrW(119)&ChrW(105)&ChrW(110)&ChrW(51)
if ubound(i)=0 then
e=i(0)
elseif ubound(i)=1 then
if i(0) <>"" then d=i(0)
e=i(1)
elseif ubound(i)=2 then
if i(0) <>"" then h=i(0)
if i(1) <>"" then d=i(1)
e=i(2)
end if
call echo(ChrW(99)&ChrW(97)&ChrW(108)&ChrW(108)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101),h)
call echo(ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101),d)
call echo(ChrW(117)&ChrW(114)&ChrW(108),e)
call echo(ChrW(115)&ChrW(112)&ChrW(108)&ChrW(120)&ChrW(120)&ChrW(24635)&ChrW(25968),ubound(i))
c=c & ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(32)&ChrW(101)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(32)&ChrW(40)&ChrW(111)&ChrW(98)&ChrW(106)&ChrW(46)&ChrW(101)&ChrW(118)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(61)&ChrW(61)&ChrW(32)&ChrW(39)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(95)&a&ChrW(39)&ChrW(41)&ChrW(32)&ChrW(123)&vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&h&ChrW(40)&ChrW(39)&d&ChrW(39)&ChrW(44)&ChrW(32)&e&ChrW(41)&ChrW(32)&ChrW(32)&ChrW(32) & vbcrlf
public_listFieldAddClickJsCode=public_listFieldAddClickJsCode&c&vbcrlf
end sub

sub handleLaydateJS(a,b,c)
dim d,e,f
f=split(b,ChrW(45))
e=mid(b,len(f(0))+2) 
if e="" then e=c
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(36873)&ChrW(25321)&ChrW(26085)&ChrW(26399) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(123) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(46)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&a&ChrW(39)&ChrW(44) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(39)&e&ChrW(39)&ChrW(44) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(44)&ChrW(32)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(41)&ChrW(123) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(40)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(33719)&ChrW(21462)&ChrW(24403)&ChrW(21069)&ChrW(34892)&ChrW(25968)&ChrW(25454)&ChrW(40)&ChrW(22914)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(31561)&ChrW(23383)&ChrW(27573)&ChrW(65292)&ChrW(20197)&ChrW(20316)&ChrW(20026)&ChrW(25968)&ChrW(25454)&ChrW(20462)&ChrW(25913)&ChrW(30340)&ChrW(32034)&ChrW(24341)&ChrW(41) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(61)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&a&ChrW(59)&ChrW(47)&ChrW(47)&ChrW(21407)&ChrW(20540) & vbcrlf
d=d&"" & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(61)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(59) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(40)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(61)&ChrW(39)&ChrW(39)&ChrW(41)&ChrW(123) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(109)&ChrW(115)&ChrW(103)&ChrW(40)&ChrW(39)&ChrW(19981)&ChrW(33021)&ChrW(20026)&ChrW(31354)&ChrW(39)&ChrW(41)&ChrW(59) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(114)&ChrW(101)&ChrW(116)&ChrW(117)&ChrW(114)&ChrW(110)&ChrW(32)&ChrW(102)&ChrW(97)&ChrW(108)&ChrW(115)&ChrW(101)&ChrW(59) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(32) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(26356)&ChrW(26032)&ChrW(25968)&ChrW(25454)&ChrW(20013)&ChrW(23545)&ChrW(24212)&ChrW(30340)&ChrW(23383)&ChrW(27573) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&a&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(59)&ChrW(32) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(79)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(39)&a&ChrW(39)&ChrW(44)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(41)&ChrW(46)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(40)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(32)&ChrW(61)&ChrW(62)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(32)&ChrW(32) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(40)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(46)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(61)&ChrW(61)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(41)&ChrW(123)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(20026)&ChrW(20551)&ChrW(65292)&ChrW(24674)&ChrW(22797)&ChrW(21407)&ChrW(26469)&ChrW(30340)&ChrW(20540)&ChrW(32) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(115)&ChrW(40)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(44)&ChrW(32)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(44)&ChrW(32)&ChrW(123)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(125)&ChrW(41)&ChrW(59) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(36)&ChrW(40)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(41)&ChrW(46)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(40)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&a&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(59) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41)&ChrW(32) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41)&ChrW(59) & vbcrlf
public_laydateJSCode=public_laydateJSCode&d&vbcrlf
d=""
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(84)&ChrW(80)&ChrW(76)&ChrW(45)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&a&ChrW(34)&ChrW(62) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(45)&a&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(34)&ChrW(32)&ChrW(112)&ChrW(108)&ChrW(97)&ChrW(99)&ChrW(101)&ChrW(104)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(61)&ChrW(34)&ChrW(36873)&ChrW(25321)&ChrW(26085)&ChrW(26399)&ChrW(34)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(123)&ChrW(123)&ChrW(61)&ChrW(32)&ChrW(100)&ChrW(46)&a&ChrW(32)&ChrW(124)&ChrW(124)&ChrW(32)&ChrW(39)&ChrW(39)&ChrW(32)&ChrW(125)&ChrW(125)&ChrW(34)&ChrW(62) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62) & vbcrlf
public_laydateHtmlCode=public_laydateHtmlCode&d&vbcrlf
end sub

sub handleColorpickerJS(a)
dim b
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(39068)&ChrW(33394)&ChrW(36873)&ChrW(25321)&ChrW(22120) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(123) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(45)&a&ChrW(39)&ChrW(44) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(41)&ChrW(123) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(82)&ChrW(111)&ChrW(119)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(40)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(41)&ChrW(59)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(33719)&ChrW(21462)&ChrW(24403)&ChrW(21069)&ChrW(34892)&ChrW(25968)&ChrW(25454)&ChrW(40)&ChrW(22914)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(32)&ChrW(31561)&ChrW(23383)&ChrW(27573)&ChrW(65292)&ChrW(20197)&ChrW(20316)&ChrW(20026)&ChrW(25968)&ChrW(25454)&ChrW(20462)&ChrW(25913)&ChrW(30340)&ChrW(32034)&ChrW(24341)&ChrW(41) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(61)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&a&ChrW(59)&ChrW(47)&ChrW(47)&ChrW(21407)&ChrW(20540)&ChrW(32) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(61)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(59)&ChrW(32) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&a&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(59)&ChrW(32) & vbcrlf
b=b&"" & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(115)&ChrW(117)&ChrW(98)&ChrW(109)&ChrW(105)&ChrW(116)&ChrW(79)&ChrW(110)&ChrW(76)&ChrW(105)&ChrW(110)&ChrW(101)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(40)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&ChrW(105)&ChrW(100)&ChrW(44)&ChrW(39)&a&ChrW(39)&ChrW(44)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(41)&ChrW(46)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(110)&ChrW(40)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(32)&ChrW(61)&ChrW(62)&ChrW(32)&ChrW(123)&ChrW(32)&ChrW(32)&ChrW(32) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(105)&ChrW(102)&ChrW(40)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(46)&ChrW(115)&ChrW(116)&ChrW(97)&ChrW(116)&ChrW(117)&ChrW(115)&ChrW(61)&ChrW(61)&ChrW(34)&ChrW(110)&ChrW(34)&ChrW(41)&ChrW(123)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(20026)&ChrW(20551)&ChrW(65292)&ChrW(24674)&ChrW(22797)&ChrW(21407)&ChrW(26469)&ChrW(30340)&ChrW(20540)&ChrW(32) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(115)&ChrW(40)&ChrW(114)&ChrW(101)&ChrW(115)&ChrW(46)&ChrW(105)&ChrW(110)&ChrW(102)&ChrW(111)&ChrW(44)&ChrW(32)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(44)&ChrW(32)&ChrW(123)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(32)&ChrW(49)&ChrW(125)&ChrW(41)&ChrW(59) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(111)&ChrW(108)&ChrW(101)&ChrW(46)&ChrW(108)&ChrW(111)&ChrW(103)&ChrW(40)&ChrW(34)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(34)&ChrW(44)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(41) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(36)&ChrW(40)&ChrW(84)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(46)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(41)&ChrW(46)&ChrW(102)&ChrW(105)&ChrW(110)&ChrW(100)&ChrW(40)&ChrW(34)&ChrW(46)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(45)&ChrW(115)&ChrW(112)&ChrW(97)&ChrW(110)&ChrW(34)&ChrW(41)&ChrW(46)&ChrW(99)&ChrW(115)&ChrW(115)&ChrW(40)&ChrW(34)&ChrW(98)&ChrW(97)&ChrW(99)&ChrW(107)&ChrW(103)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(34)&ChrW(44)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(41)&ChrW(59)&ChrW(32) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(46)&a&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(112)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(59) & vbcrlf
b=b&"" & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41)&ChrW(59) & vbcrlf
public_colorpickerJSCode=public_colorpickerJSCode & b & vbcrlf
b=""
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(33)&ChrW(45)&ChrW(45)&ChrW(32)&ChrW(39068)&ChrW(33394)&ChrW(36873)&ChrW(25321)&ChrW(22120)&a&ChrW(32)&ChrW(45)&ChrW(45)&ChrW(62) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(47)&ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)&ChrW(34)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&ChrW(34)&ChrW(84)&ChrW(80)&ChrW(76)&ChrW(45)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(45)&a&ChrW(34)&ChrW(62) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(123)&ChrW(123)&ChrW(35)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(100)&ChrW(46)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(32)&ChrW(124)&ChrW(124)&ChrW(32)&ChrW(91)&ChrW(39)&ChrW(35)&ChrW(49)&ChrW(54)&ChrW(98)&ChrW(97)&ChrW(97)&ChrW(97)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(35)&ChrW(49)&ChrW(54)&ChrW(98)&ChrW(55)&ChrW(55)&ChrW(55)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(35)&ChrW(49)&ChrW(69)&ChrW(57)&ChrW(70)&ChrW(70)&ChrW(70)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(35)&ChrW(70)&ChrW(70)&ChrW(53)&ChrW(55)&ChrW(50)&ChrW(50)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(35)&ChrW(70)&ChrW(70)&ChrW(66)&ChrW(56)&ChrW(48)&ChrW(48)&ChrW(39)&ChrW(44)&ChrW(39)&ChrW(35)&ChrW(51)&ChrW(57)&ChrW(51)&ChrW(68)&ChrW(52)&ChrW(57)&ChrW(39)&ChrW(93)&ChrW(91)&ChrW(77)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(46)&ChrW(114)&ChrW(111)&ChrW(117)&ChrW(110)&ChrW(100)&ChrW(40)&ChrW(77)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(46)&ChrW(114)&ChrW(97)&ChrW(110)&ChrW(100)&ChrW(111)&ChrW(109)&ChrW(40)&ChrW(41)&ChrW(42)&ChrW(53)&ChrW(41)&ChrW(93)&ChrW(59)&ChrW(32)&ChrW(125)&ChrW(125) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(112)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(114)&ChrW(45)&a&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(111)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(123)&ChrW(99)&ChrW(111)&ChrW(108)&ChrW(111)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(123)&ChrW(123)&ChrW(61)&ChrW(32)&ChrW(100)&ChrW(46)&a&ChrW(32)&ChrW(125)&ChrW(125)&ChrW(39)&ChrW(125)&ChrW(34)&ChrW(62)&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
b=b&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62) & vbcrlf
public_colorpickerHtmlCode=public_colorpickerHtmlCode & b & vbcrlf
end sub

function handleEditPageLaydateJS(a,b,c)
dim d,e,f
f=split(b,ChrW(45))
e=mid(b,len(f(0))+2)
if e="" then e=c
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(32)&ChrW(26102)&ChrW(38388)&ChrW(36873)&ChrW(25321)&ChrW(22120)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(32)&a&"" & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(40)&ChrW(34)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(91)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(39)&a&ChrW(39)&ChrW(93)&ChrW(34)&ChrW(41)&ChrW(46)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(40)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(41)&ChrW(32)&ChrW(123) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(46)&ChrW(114)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(123) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(109)&ChrW(58)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(44) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(103)&ChrW(101)&ChrW(114)&ChrW(58)&ChrW(32)&ChrW(39)&ChrW(99)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(107)&ChrW(39)&ChrW(44) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(97)&ChrW(116)&ChrW(58)&ChrW(32)&ChrW(39)&e&ChrW(39) & vbcrlf
d=d&"" & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41)&ChrW(59) & vbcrlf
d=d&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41)&ChrW(59) & vbcrlf
public_editPageTimeJsCode=public_editPageTimeJsCode & d 
end function
function handle_editPathLeftNoteJsCode(a,b)
dim c
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(65311)&ChrW(25552)&ChrW(37266)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(20511)&ChrW(37492)&ChrW(20110)&ChrW(21035)&ChrW(20154)&ChrW(50)&ChrW(48)&ChrW(50)&ChrW(51)&ChrW(48)&ChrW(51)&ChrW(48)&ChrW(57) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(36)&ChrW(40)&ChrW(34)&ChrW(46)&ChrW(105)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(45)&ChrW(119)&ChrW(101)&ChrW(110)&ChrW(104)&ChrW(97)&ChrW(111)&ChrW(34)&ChrW(41)&ChrW(46)&ChrW(104)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(114)&ChrW(40)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(41)&ChrW(123) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(36)&ChrW(40)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(41)&ChrW(46)&ChrW(97)&ChrW(116)&ChrW(116)&ChrW(114)&ChrW(40)&ChrW(34)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(45)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(34)&ChrW(41)&ChrW(59) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(114)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(115)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(115)&ChrW(40)&ChrW(116)&ChrW(104)&ChrW(101)&ChrW(116)&ChrW(120)&ChrW(116)&ChrW(44)&ChrW(32)&ChrW(116)&ChrW(104)&ChrW(105)&ChrW(115)&ChrW(32)&ChrW(44)&ChrW(32)&ChrW(123) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(115)&ChrW(58)&ChrW(32)&ChrW(91)&ChrW(49)&ChrW(44)&ChrW(32)&ChrW(39)&ChrW(35)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(39)&ChrW(93)&ChrW(32)&ChrW(47)&ChrW(47)&ChrW(36824)&ChrW(21487)&ChrW(37197)&ChrW(32622)&ChrW(39068)&ChrW(33394) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(44)&ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(58)&ChrW(32)&ChrW(53)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41)&ChrW(59) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(44)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(40)&ChrW(41)&ChrW(123) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(101)&ChrW(114)&ChrW(46)&ChrW(99)&ChrW(108)&ChrW(111)&ChrW(115)&ChrW(101)&ChrW(65)&ChrW(108)&ChrW(108)&ChrW(40)&ChrW(39)&ChrW(116)&ChrW(105)&ChrW(112)&ChrW(115)&ChrW(39)&ChrW(41)&ChrW(59) & vbcrlf
c=c&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(32)&ChrW(125)&ChrW(41) & vbcrlf
public_editPathLeftNoteJsCode=c
end function

function get_handleEditPageAllAction(a,b,c,d)  
dim e,f,g
if (left(a,5)=ChrW(109)&ChrW(111)&ChrW(110)&ChrW(101)&ChrW(121) or left(a,6)=ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)) then 
if instr(a,ChrW(45)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(83)&ChrW(116)&ChrW(101)&ChrW(112))>0 then
e=split(a&ChrW(95)&ChrW(48)&ChrW(46)&ChrW(48)&ChrW(49),ChrW(45))
g=e(1)
f=split(g,ChrW(95))
d=replace(d,ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61),ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(61)&ChrW(34)&f(1)&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(97)&ChrW(102)&ChrW(102)&ChrW(105)&ChrW(120)&ChrW(61)&ChrW(34)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61))
else
d=replace(d,ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61),ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(112)&ChrW(61)&ChrW(34)&ChrW(49)&ChrW(34)&ChrW(32)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(45)&ChrW(97)&ChrW(102)&ChrW(102)&ChrW(105)&ChrW(120)&ChrW(61)&ChrW(34)&ChrW(110)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(101)&ChrW(114)&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61))
end if
end if

get_handleEditPageAllAction=d
end function

function getHandleCheckboxToHtml(a,b)
dim c,d,e,f,g,h
d=split(b,ChrW(45))
c=c&ChrW(60)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(32)&ChrW(99)&ChrW(108)&ChrW(97)&ChrW(115)&ChrW(115)&ChrW(61)&ChrW(34)&ChrW(108)&ChrW(97)&ChrW(121)&ChrW(117)&ChrW(105)&ChrW(45)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(109)&ChrW(34)&ChrW(62) & vbcrlf
for each e in d
if instr(e,ChrW(95))>0 then
f=split(e,ChrW(95))
h=f(0)
g=a&ChrW(95)&f(1)    
c=c&cfg_tabAdd3&ChrW(60)&ChrW(105)&ChrW(110)&ChrW(112)&ChrW(117)&ChrW(116)&ChrW(32)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(61)&ChrW(34)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(98)&ChrW(111)&ChrW(120)&ChrW(34)&ChrW(32)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61)&ChrW(34)&g&ChrW(34)&ChrW(32)&ChrW(116)&ChrW(105)&ChrW(116)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(34)&h&ChrW(34)&ChrW(60)&ChrW(37)&ChrW(61)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(40)&ChrW(34)&ChrW(124)&ChrW(34)&ChrW(38)& handleAspVar(a) &ChrW(38)&ChrW(34)&ChrW(124)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(124)&f(1)&ChrW(124)&ChrW(34)&ChrW(41)&ChrW(62)&ChrW(48)&ChrW(44)&ChrW(34)&ChrW(32)&ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(101)&ChrW(100)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(34)&ChrW(41)&ChrW(37)&ChrW(62)&ChrW(62) & vbcrlf
end if
next
c=c&cfg_tabAdd2&ChrW(60)&ChrW(47)&ChrW(100)&ChrW(105)&ChrW(118)&ChrW(62) & vbcrlf
getHandleCheckboxToHtml=c
end function

function getHandleCheckboxToASP(a,b)
dim c,d,e,f,g,h 
d=split(b,ChrW(45))
c=c&""& handleAspVar(a) &ChrW(61)&ChrW(34)&ChrW(124)&ChrW(34) & vbcrlf
for each e in d
if instr(e,ChrW(95))>0 then
f=split(e,ChrW(95))
h=f(0)
g=a&ChrW(95)&f(1)  
c=c& handleAspVar(a) &ChrW(61)& handleAspVar(a) &ChrW(32)&ChrW(38)&ChrW(32)&ChrW(73)&ChrW(73)&ChrW(70)&ChrW(40)&ChrW(82)&ChrW(101)&ChrW(113)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(116)&ChrW(40)&ChrW(34)&g&ChrW(34)&ChrW(41)&ChrW(61)&ChrW(34)&ChrW(111)&ChrW(110)&ChrW(34)&ChrW(44)&ChrW(34)&f(1)&ChrW(124)&ChrW(34)&ChrW(44)&ChrW(34)&ChrW(34)&ChrW(41)&ChrW(32) & vbcrlf
end if
next
getHandleCheckboxToASP=c
end function

function getConfigToFieldValue(a,b)
dim c,d,e,f
f=ChrW(44)& b &ChrW(124)
c=instr(ChrW(44)&a,f)
if c>0 then
d=mid(ChrW(44)&a,c+len(f))
e=split(d,ChrW(44)) 
getConfigToFieldValue=e(0)
end if
end function

function encTsStrReplace(a,b)
if instr(b,ChrW(44))>0 then
a=replace(a,ChrW(44),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(36887)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(124))>0 then
a=replace(a,ChrW(124),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(31446)&ChrW(32447)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(61))>0 then
a=replace(a,ChrW(61),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(31561)&ChrW(20110)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(45))>0 then
a=replace(a,ChrW(45),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(36830)&ChrW(23383)&ChrW(31526)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(95))>0 then
a=replace(a,ChrW(95),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(19979)&ChrW(21010)&ChrW(32447)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(92)&ChrW(44))>0 then
a=replace(a,ChrW(92)&ChrW(44),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(36887)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(92)&ChrW(124))>0 then
a=replace(a,ChrW(92)&ChrW(124),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(31446)&ChrW(32447)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(92)&ChrW(61))>0 then
a=replace(a,ChrW(92)&ChrW(61),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(31561)&ChrW(20110)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(92)&ChrW(45))>0 then
a=replace(a,ChrW(92)&ChrW(45),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(36830)&ChrW(23383)&ChrW(31526)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(92)&ChrW(95))>0 then
a=replace(a,ChrW(92)&ChrW(95),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(19979)&ChrW(21010)&ChrW(32447)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(92)&ChrW(62))>0 then
a=replace(a,ChrW(92)&ChrW(62),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(22823)&ChrW(20110)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93))
end if
encTsStrReplace=a
end function

function encTsStrReplace2(a,b) 
if instr(b,ChrW(44))>0 then
a=replace(a,ChrW(92)&ChrW(44),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(36887)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(124))>0 then
a=replace(a,ChrW(92)&ChrW(124),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(31446)&ChrW(32447)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(61))>0 then
a=replace(a,ChrW(92)&ChrW(61),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(31561)&ChrW(20110)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(45))>0 then
a=replace(a,ChrW(92)&ChrW(45),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(36830)&ChrW(23383)&ChrW(31526)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(95))>0 then
a=replace(a,ChrW(92)&ChrW(95),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(19979)&ChrW(21010)&ChrW(32447)&ChrW(125)&ChrW(93)&ChrW(93))
end if
if instr(b,ChrW(62))>0 then
a=replace(a,ChrW(92)&ChrW(62),ChrW(91)&ChrW(91)&ChrW(123)&ChrW(22823)&ChrW(20110)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93))
end if
encTsStrReplace2=a
end function

function decTsStrReplace(a,b)
if instr(b,ChrW(44))>0 then
a=replace(a,ChrW(91)&ChrW(91)&ChrW(123)&ChrW(36887)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93),ChrW(44))
end if
if instr(b,ChrW(124))>0 then
a=replace(a,ChrW(91)&ChrW(91)&ChrW(123)&ChrW(31446)&ChrW(32447)&ChrW(125)&ChrW(93)&ChrW(93),ChrW(124))
end if
if instr(b,ChrW(61))>0 then
a=replace(a,ChrW(91)&ChrW(91)&ChrW(123)&ChrW(31561)&ChrW(20110)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93),ChrW(61))
end if
if instr(b,ChrW(45))>0 then
a=replace(a,ChrW(91)&ChrW(91)&ChrW(123)&ChrW(36830)&ChrW(23383)&ChrW(31526)&ChrW(125)&ChrW(93)&ChrW(93),ChrW(45))
end if
if instr(b,ChrW(95))>0 then
a=replace(a,ChrW(91)&ChrW(91)&ChrW(123)&ChrW(19979)&ChrW(21010)&ChrW(32447)&ChrW(125)&ChrW(93)&ChrW(93),ChrW(95))
end if
if instr(b,ChrW(62))>0 then
a=replace(a,ChrW(91)&ChrW(91)&ChrW(123)&ChrW(22823)&ChrW(20110)&ChrW(21495)&ChrW(125)&ChrW(93)&ChrW(93),ChrW(62))
end if
decTsStrReplace=a
end function

function handleAspVar(a)
dim b
b=lcase(a)
if instr(ChrW(44)&ChrW(108)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(117)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(44)&ChrW(101)&ChrW(110)&ChrW(100)&ChrW(44)&ChrW(105)&ChrW(102)&ChrW(44)&ChrW(102)&ChrW(111)&ChrW(114)&ChrW(44)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(97)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(44)&ChrW(116)&ChrW(97)&ChrW(98)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(97)&ChrW(100)&ChrW(100)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(44)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(44)&ChrW(105)&ChrW(110)&ChrW(44)&ChrW(115)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(116)&ChrW(44)&ChrW(108)&ChrW(101)&ChrW(102)&ChrW(116)&ChrW(44)&ChrW(114)&ChrW(105)&ChrW(103)&ChrW(104)&ChrW(116)&ChrW(44)&ChrW(108)&ChrW(101)&ChrW(110)&ChrW(44)&ChrW(105)&ChrW(110)&ChrW(115)&ChrW(116)&ChrW(114)&ChrW(44)&ChrW(101)&ChrW(97)&ChrW(99)&ChrW(104)&ChrW(44)&ChrW(109)&ChrW(105)&ChrW(100)&ChrW(44),ChrW(44)&b&ChrW(44))>0 then
handleAspVar=ChrW(115)&a
else
handleAspVar=a
end if
end function

function getQXVal(a)
dim b,c,d
c=ChrW(44)& public_configQXList &ChrW(44)
d=instr(c,ChrW(44)& a &ChrW(61))
if d>0 then
b=strCut(c,ChrW(44)& a &ChrW(61),ChrW(44),0)
end if
getQXVal=b
end function

function getEditQXVal(a)
dim b,c,d
c=ChrW(44)& public_configEditQXList &ChrW(44)
d=instr(c,ChrW(44)& a &ChrW(61))
if d>0 then
b=strCut(c,ChrW(44)& a &ChrW(61),ChrW(44),0)
end if
getEditQXVal=b
end function

function getListPageItemWidth(a)
dim b,c,d,e,f
c=ChrW(44)&public_listPage_ItemWidth_config&ChrW(44)
e=ChrW(44)&a&ChrW(61)
d=instr(c,e)
if d>0 then
b=mid(c,d+len(e))
f=split(b,ChrW(44))
getListPageItemWidth=f(0)
end if
end function

function getAddNewUpdateValue(a,b)
dim c,d
d=ChrW(44)& a &ChrW(44)
c=getstrcut(d,ChrW(44)&b&ChrW(124),ChrW(44),0)
if c=ChrW(49) then
c=ChrW(103)&ChrW(101)&ChrW(116)&ChrW(73)&ChrW(80)&ChrW(40)&ChrW(41)
elseif c=ChrW(50) then
c=ChrW(110)&ChrW(111)&ChrW(119)&ChrW(40)&ChrW(41)
elseif c=ChrW(51) then
c=ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(40)&ChrW(41)
elseif c=ChrW(52) then
c=ChrW(116)&ChrW(105)&ChrW(109)&ChrW(101)&ChrW(40)&ChrW(41)
end if
getAddNewUpdateValue=c
end function

function get_listPageRunAction(a) 
get_listPageRunAction=handleLEVPageRunAction(public_listPageRunAction,a)
end function

function get_editPageRunAction(a) 
get_editPageRunAction=handleLEVPageRunAction(public_editPageRunAction,a)
end function

function get_editPageSaveRunAction(a) 
get_editPageSaveRunAction=handleLEVPageRunAction(public_editPageSaveRunAction,a)
end function

function get_viewPageRunAction(a) 
get_viewPageRunAction=handleLEVPageRunAction(public_viewPageRunAction,a)
end function

function handleLEVPageRunAction(a,b)
dim c,d,e

c=instr(ChrW(44)&a&ChrW(124),ChrW(44)&b&ChrW(124))
if c>0 then
d=mid(ChrW(44)&a&ChrW(124),c+len(b)+2)
e=split(d,ChrW(44))  
handleLEVPageRunAction=decTsStrReplace(e(0),ChrW(44)&ChrW(124))

end if
end function

function getLEVPageRunAction(a,b,c)
dim d,e,f
if a=ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) then
d=get_listPageRunAction(b)
elseif a=ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) then
d=get_editPageRunAction(b)
elseif a=ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) then
d=get_editPageSaveRunAction(b)
elseif a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) then
d=get_viewPageRunAction(b)
end if
d=phptrim(d)

if left(lcase(d),15)=ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(102)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(45) then
c=mid(d,16)&ChrW(40)&c&ChrW(41)
elseif d <>"" then 
e=ChrW(116)&ChrW(120)&ChrW(116)&ChrW(92)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(95)&ChrW(65)&ChrW(83)&ChrW(80)&ChrW(95)&ChrW(70)&ChrW(117)&ChrW(110)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(92)&d&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116) 
if checkfile(e)=false then
call eerr(ChrW(103)&ChrW(101)&ChrW(116)&ChrW(76)&ChrW(69)&ChrW(86)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(25552)&ChrW(31034)&ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312) & e,ChrW(60)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62)&ChrW(97)&ChrW(108)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(40)&ChrW(39)&ChrW(103)&ChrW(101)&ChrW(116)&ChrW(76)&ChrW(69)&ChrW(86)&ChrW(80)&ChrW(97)&ChrW(103)&ChrW(101)&ChrW(82)&ChrW(117)&ChrW(110)&ChrW(65)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(25552)&ChrW(31034)&ChrW(25991)&ChrW(20214)&ChrW(19981)&ChrW(23384)&ChrW(22312)&replace(e,ChrW(92),ChrW(92)&ChrW(92))&ChrW(39)&ChrW(41)&ChrW(60)&ChrW(47)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(62))
end if

f=readfile(e,ChrW(117)&ChrW(116)&ChrW(102)&ChrW(45)&ChrW(56)) 
if a=ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) then
if instr(public_listPage_asp_function,f)=false then
public_listPage_asp_function=public_listPage_asp_function&f&vbcrlf
end if 
elseif a=ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) or a=ChrW(101)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(115)&ChrW(97)&ChrW(118)&ChrW(101)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) then
if instr(public_editPage_asp_function,f)=false then
public_editPage_asp_function=public_editPage_asp_function&f&vbcrlf
end if 
elseif a=ChrW(118)&ChrW(105)&ChrW(101)&ChrW(119)&ChrW(112)&ChrW(97)&ChrW(103)&ChrW(101) then
if instr(public_viewPage_asp_function,f)=false then
public_viewPage_asp_function=public_viewPage_asp_function&f&vbcrlf
end if 
end if
c=d&ChrW(40)&ChrW(114)&ChrW(115)&ChrW(44)&c&ChrW(41)
end if
getLEVPageRunAction=c
end function
%> 