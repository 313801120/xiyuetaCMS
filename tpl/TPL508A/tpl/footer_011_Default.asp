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

cssName="footer011" 
 %>
<style>

.foot<%=cssName%> body{
    overflow-x: hidden;
    font-family: "Microsoft YaHei";
}
.foot<%=cssName%> ul{
    padding: 0;
    margin: 0;
}
.foot<%=cssName%> ul li{
    list-style: none;
}
.foot<%=cssName%> a{
    color: #337ab7;
    text-decoration: none;
}
.foot<%=cssName%> h1,.foot<%=cssName%> h2,.foot<%=cssName%> h3,.foot<%=cssName%> h4,.foot<%=cssName%> h5{
    margin: 0;
}
.foot<%=cssName%> a:focus,.foot<%=cssName%> a:hover{
    color: #FFF;
    text-decoration: none;
}
.foot<%=cssName%> a:focus{
    outline: none;
    outline-offset: -2px;
}
@media (max-width: 768px){
.foot<%=cssName%> body{
        padding-top: 60px;
    }}
.foot<%=cssName%> img{
    image-rendering: -moz-crisp-edges; /* Firefox */
    image-rendering: -o-crisp-edges; /* Opera */
    image-rendering: -webkit-optimize-contrast; /* Webkit (non-standard naming) */
    image-rendering: crisp-edges;
    -ms-interpolation-mode: nearest-neighbor; /* IE (non-standard property) */
}
.foot<%=cssName%> .tong{
  max-width: 1200px;/*1632*/
  margin-left: auto;
  margin-right: auto;
  padding: 0 15px; }
.foot<%=cssName%> .flex{
  display: flex;
  justify-content: space-between; }
.foot<%=cssName%>{
  padding-top: 4.48vw;
  background-color: #0d62be;
  color: #fff; }
@media (max-width: 780px){
.foot<%=cssName%>{
      padding-top: 30px; }}
.foot<%=cssName%> a{
    color: #fff; }
.foot<%=cssName%> .con{
    padding-bottom: 2.08vw; }
@media (max-width: 780px){
.foot<%=cssName%> .con{
        flex-wrap: wrap;
        padding-bottom: 30px; }}
.foot<%=cssName%> .con .flogo{
      margin-top: 1.82vw; }
@media (max-width: 780px){
.foot<%=cssName%> .con .flogo{
          text-align: center;
          width: 100%; }}
.foot<%=cssName%> .con .foot1{
      width: 60%;
      padding: 0 15px; }
@media (max-width: 780px){
.foot<%=cssName%> .con .foot1{
          width: 100%;
          margin-top: 20px; }}
.foot<%=cssName%> .con .foot1 li h2{
        font-size: 20px; }
.foot<%=cssName%> .con .foot1 li .sec{
        margin-top: 4px; }
.foot<%=cssName%> .con .foot1 li .sec dd{
          font-size: 16px;
          line-height: 38px;
          font-weight: 200; }
@media (max-width: 780px){
.foot<%=cssName%> .con .foot1 li .sec dd{
              font-size: 14px;
              line-height: 28px; }}
.foot<%=cssName%> .con .foot2{
      text-align: center;
      background: #fff;
      padding: 24px 0;
      position: relative; 
        width: 15%
    }
@media (max-width: 780px){
.foot<%=cssName%> .con .foot2{
    width: 63%;
    margin: 20px auto;
}}
.foot<%=cssName%> .con .foot2 li{
        /*width: 50%;*/
        padding: 0 30.75px; }
.foot<%=cssName%> .con .foot2 li .img img{
          max-width: 100%; }
.foot<%=cssName%> .con .foot2 li dd{
          color: #333333;
          font-size: 16px;
          margin-top: 4px;
          font-weight: 200; }
@media (max-width: 780px){
.foot<%=cssName%> .con .foot2 li dd{
              font-size: 14px; }}
.foot<%=cssName%> .ban{
    text-align: center;
    border-top: 1px solid rgba(255, 255, 255, 0.4);
    font-weight: 200;
    padding: 14px 0; }


</style> 
    <div class="foot<%=cssName%>">
        <div class="tong">
            <div class="con flex">
                <div class="flogo"><img src="<%=weblogo%>">
                </div>
                <ul class="foot1 flex hidden-xs">





<%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 and flags like'%foot%' order by sortRank asc" ,conn,1,1
for i=1 to rs.recordcount
if rs.eof then exit for
    rsx.open "select * from " & db_PREFIX & "WebColumn where parentId="& rs("id") &" and isThrough=1 order by sortRank asc" ,conn,1,1
    if not rsx.eof then
%>
<li>
    <h2><%=IIF(rs("columnType")<>"home",uTitle,"") & rs("columnname")%></h2>

                                        <!-- 子集 -->
                                        <div class="sec">
        <%

        ' while not rsx.eof


        for j=1 to rsx.recordcount
            if j=5 then

    %>


 
            <dd>
                                <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>">查看更多+</a>
                            </dd>

                            <%
exit for
                            else%>

 
            <dd>
                                <a href="<%=getNavUrl(rsx("id"),rsx("columnType"))%>"><%=rsx("columnname")%></a>
                            </dd>
                            <%end if%>



        <%rsx.movenext:next%>
                                        </div>
               
</li> <%
                end if:rsx.close%>
<%rs.movenext:next:rs.close%> 

 
                </ul>
                <ul class="foot2 flex">
                    <li>
                        <div class="img"><img src="<%=webqrcode%>" alt="扫一扫添加微信">
                        </div>
                        <dd>扫一扫添加微信</dd>
                    </li>
                </ul>
            </div>
        </div>
        <div class="ban">
            <div class="tong">
                <%=webfoot%>
            </div>
        </div>
    </div>
