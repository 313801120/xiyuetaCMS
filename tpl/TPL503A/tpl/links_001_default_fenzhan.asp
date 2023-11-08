<% 
'#禁止自动更新当前文件'  #号去掉代表此文件不被程序自动更新替换掉

                 '''
'               (0 0)
'   +-----oOO----(_)------------+
'   |                           |
'   |    author:XIYUETA         |
'   |    QQ:313801120           |
'   |    www.xiyueta.com        |
'   |                           |
'   +------------------oOO------+
'              |__|__|
'               || ||
'              ooO Ooo

cssName="links001" 
resurl="/web/tpl/links/001/"
 %>
<style>


.main<%=cssName%> .clearfix,.main<%=cssName%> .container:after,.main<%=cssName%> .row:after,.main<%=cssName%> ul{
  *zoom: 1;
}
.main<%=cssName%> .clearfix:after,.main<%=cssName%> .container:after,.main<%=cssName%> .row:after,.main<%=cssName%> ul:after{
  content: " ";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}
.main<%=cssName%> html{
  line-height: 1.15;
  /* 1 */
  -ms-text-size-adjust: 100%;
  /* 2 */
  -webkit-text-size-adjust: 100%;
  /* 2 */
}
.main<%=cssName%> a{
  background-color: transparent;
  /* 1 */
  -webkit-text-decoration-skip: objects;
  /* 2 */
}
.main<%=cssName%> button,.main<%=cssName%> html [type="button"],.main<%=cssName%> [type="reset"],.main<%=cssName%> [type="submit"]{
  -webkit-appearance: button;
  /* 2 */
}
.main<%=cssName%> ::-webkit-file-upload-button{
  -webkit-appearance: button;
  /* 1 */
  font: inherit;
  /* 2 */
}
.main<%=cssName%> *{
  box-sizing: border-box;
}
.main<%=cssName%> *:before,.main<%=cssName%> *:after{
  box-sizing: border-box;
}
.main<%=cssName%> blockquote,.main<%=cssName%> body,.main<%=cssName%> button,.main<%=cssName%> dd,.main<%=cssName%> dl,.main<%=cssName%> dt,.main<%=cssName%> fieldset,.main<%=cssName%> form,.main<%=cssName%> h1,.main<%=cssName%> h2,.main<%=cssName%> h3,.main<%=cssName%> h4,.main<%=cssName%> h5,.main<%=cssName%> h6,.main<%=cssName%> hr,.main<%=cssName%> input,.main<%=cssName%> legend,.main<%=cssName%> li,.main<%=cssName%> ol,.main<%=cssName%> p,.main<%=cssName%> pre,.main<%=cssName%> td,.main<%=cssName%> textarea,.main<%=cssName%> th,.main<%=cssName%> ul{
  margin: 0;
  padding: 0;
}
.main<%=cssName%> *,.main<%=cssName%> button,.main<%=cssName%> input,.main<%=cssName%> select,.main<%=cssName%> textarea{
  font: 14px/1.5 "\5FAE\8F6F\96C5\9ED1", "arial";
  color: #333;
  font-size: 14px;
}
.main<%=cssName%> ul,.main<%=cssName%> ol{
  list-style: none;
}
.main<%=cssName%> a,.main<%=cssName%> button,.main<%=cssName%> input[type="submit"],.main<%=cssName%> input[type="button"],.main<%=cssName%> input[type="reset"],.main<%=cssName%> input[type="file"]{
  cursor: pointer;
}
.main<%=cssName%> a{
  color: inherit;
  color: expression(this.parentNode.currentStyle.color);
  text-decoration: none;
}
.main<%=cssName%> a:focus{
  outline: thin dotted;
}
.main<%=cssName%> a:active,.main<%=cssName%> a:hover{
  outline: 0;
}
.main<%=cssName%> body,.main<%=cssName%> button,.main<%=cssName%> input,.main<%=cssName%> select,.main<%=cssName%> textarea{
  font: 12px/1.4 "\5FAE\8F6F\96C5\9ED1", "arial";
  color: #5a5a5a;
  font-size: 12px;
}
.main<%=cssName%> body{
  max-width: 1920px;
  margin: 0 auto;
}
.main<%=cssName%> .center{
  width: 1200px;
  margin: 0 auto;
}
.main<%=cssName%>{
  width: 100%;
}
.main<%=cssName%> .flink{
  margin-top: 30px;
  margin-bottom: 20px;
  width: 100%;
}
.main<%=cssName%> .flink .flink_tit{
  width: 100%;
  position: relative;
}
.main<%=cssName%> .flink .flink_tit p{
  height: 12px;
  width: 100%;
  background: url(<%=resurl%>images/dian.png);
  position: absolute;
  top: 15px;
}
.main<%=cssName%> .flink .flink_tit span{
  height: 42px;
  background: #fff;
  color: #1C4587;
  font-size: 14px;
  border: 1px solid #1C4587;
  position: relative;
  z-index: 9;
  display: block;
  width: 115px;
  text-align: center;
  line-height: 42px;
  margin-left: 40px;
}
.main<%=cssName%> .flink .flink_list{
  width: 100%;
  margin-top: 20px;
  padding-left: 40px;/*把margin-left改成padding-left,要不然会出现左右滚动条*/
}
.main<%=cssName%> .flink .flink_list ul li{
  float: left;
  margin-right: 28px;
  margin-bottom: 8px;
}
.main<%=cssName%> .flink .flink_list ul li a{
  font-size: 12px;
  color: #5a5a5a;
}
.main<%=cssName%> .flink .flink_list ul li a:hover{
  color: #036aac;
}
@media screen and (max-width: 1200px){
.main<%=cssName%> .center{
    width: 100%;
  }}
@media screen and (max-width: 768px){
.main<%=cssName%>{
    overflow: hidden;
  }}


</style>
<div class="main<%=cssName%>">
    <div class="flink">
        <div class="center">
            <div class="flink_tit">
                <p></p>
                <span>城市分站 CITYS</span>
            </div>
            <div class="flink_list">
                <ul>



<%
dim thisid:thisid=-1
dim thisParentId
if uTitle<>"" then
    rs.open "select * from " & db_PREFIX & "sheshi where columnName='"& uTitle &"'" ,conn,1,1
    if not rs.eof then
        ' call echo(uTitle,"不为空" & rs("id"))
        thisParentId=rs("parentId")
        thisid=rs("id")
    end if:rs.close
end if


rs.open "select * from " & db_PREFIX & "sheshi where parentId="& thisid &" and isThrough=1 order by sortrank asc,id asc" ,conn,1,1
'为空则调用上一级'
if rs.eof then
    rs.close
rs.open "select * from " & db_PREFIX & "sheshi where parentId="& thisParentId &" and isThrough=1 order by sortrank asc,id asc" ,conn,1,1    
end if

for i=1 to 30
if rs.eof then exit for
  if isDomainOrUrlSuffix="domain" then
    sUrl="http://" & lcase(pinYin2(rs("columnName"))) & "."& myDomain
  else
    if asporhtml=true then
      sUrl=lcase(pinYin2(rs("columnName"))) & "-"
    else
      sUrl="?diqu=" & lcase(pinYin2(rs("columnName")))
    end if
  end if
%>
<li><a href="<%=sUrl%>"><%=rs("columnName")&nav%></a></li> 
<%rs.movenext:next:rs.close%>
                    
                </ul>
            </div>
        </div>
    </div>
</div>
