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

 %>
<style>
#comments{
        margin-top:10px;
    }
#comments .table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 1px;
}
#comments .table-bordered > tbody > tr > td, #comments .table-bordered > tbody > tr > th, #comments .table-bordered > tfoot > tr > td, #comments .table-bordered > tfoot > tr > th, #comments .table-bordered > thead > tr > td, #comments .table-bordered > thead > tr > th {
    border: 0px solid #FFF !important;
}
#comments .table-bordered {
    border: 0px solid #FFF !important;
}
#comments table, #comments th, #comments td {
    border: 0px solid #FFF !important;
    padding: 1px 1px !important;
}
#comments table, #comments th, #comments td a {
    color: #777;
}
#comments #username1 {
    background: #fff;
    width: 73%;
    height: 30px;
    margin: 1px 1px 1px 1px;
    padding: 0 5px;
    border: 1px solid #ddd !important;
    border-radius: 5px;
}
#comments #password1 {
    background: #fff;
    width: 73%;
    height: 30px;
    margin: 1px 1px 1px 1px;
    padding: 0 5px;
    border: 1px solid #ddd !important;
    border-radius: 5px;
}
#comments .inputText {
    background: #fff;
    width: 60px;
    height: 30px;
    margin: 5px 10px 10px 0;
    padding: 0 5px;
    border: 1px solid #ddd !important;
    border-radius: 5px;
}
#comments .ecomment {
    margin: 0;
    padding: 0;
}
#comments .ecomment {
    margin-bottom: 12px;
    overflow-x: hidden;
    overflow-y: hidden;
    padding-bottom: 3px;
    padding-left: 3px;
    padding-right: 3px;
    padding-top: 3px;
    background: #FFFFEE;
    border-radius: 5px;
    border: 1px dotted #dddddd !important;
}
#comments .ecommentauthor {
    float: left;
    color: #F96;
    font-weight: bold;
}
#comments .ecommenttext {
    clear: left;
    margin: 0;
    padding: 0;
}
#comments .showpage #plpost {
    margin-top: 10px;
    border: 1px solid #FFFFFF;
}
#comments .showpage #plpost .title {
    border: 0px solid #AACCEE !important;
}
#comments .showpage #plpost .title span {
    color: #CC0000;
}
#comments .showpage #plpost #saytext {
    display: block;
    margin: 0 0 10px;
    padding: 8px;
    height: 100px;
    width: 97%;
    border: 1px solid #ccc !important;
    border-radius: 5px;
}
#comments .name1 {
    display: block;
    color: #666666;
    font-size: 16px;
    font-weight: 500;
}
#comments .name1 img {
    height: 50px !important;
    width: 50px !important;
    border: #DDD solid 1px;
    border-radius: 50%;
    transition: all 1.0s;
}
#comments .name1 img:hover {
    transform: rotate(720deg);
}
#comments .table-responsive {
    border: 0px;
    min-height: .001%;
    overflow-x: auto;
}

@media screen and (max-width:767px) {
#comments .table-responsive {
    border: 0px !important
}
}

@media screen and (max-width:736px) {
#comments #username1 {
    background: #fff;
    width: 100%;
    height: 30px;
    margin: 1px 1px 1px 1px;
    padding: 0 5px;
    border: 1px solid #ddd !important;
    border-radius: 5px;
}
#comments #password1 {
    background: #fff;
    width: 100%;
    height: 30px;
    margin: 1px 1px 1px 1px;
    padding: 0 5px;
    border: 1px solid #ddd !important;
    border-radius: 5px;
}
#comments .inputText {
    background: #fff;
    width: 60px;
    height: 30px;
    margin: 5px 10px 10px 0;
    padding: 0 5px;
    border: 1px solid #ddd !important;
    border-radius: 5px;
}
}
</style>


<%

  rs.open "select * from " & db_PREFIX & "articlemessage where isthrough=1 and articleid="&id&" order by id desc" ,conn,1,1
%>
<div id="comments"> 
<div class="showpage" id="plpost">
<table width="100%" border="0" cellpadding="0" cellspacing="0"  style="line-height: 25px; padding: 5px 3px 1px 8px; font-size: 18px;">
<tr><td><strong><font color="#333333">留言与评论（共有 <span id="infocommentnumarea"><%=rs.recordcount%></span> 条评论）</font></strong></td></tr>
</table>
<script>
          function CheckPl(obj)
          {
          if(obj.saytext.value=="")
          {
          alert("您没什么话要说吗？");
          obj.saytext.focus();
          return false;
          }
          return true;
          }
          </script>
                        <form action="/api/submitComment.asp?act=replycomment&articleid=<%=id%>" method="post" name="saypl" id="saypl" onsubmit="return CheckPl(document.saypl)">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" id="plpost">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="10" cellpadding="0">
                                            <tr>
                                                <td>  


<table width="98%" border="0" cellpadding="0" cellspacing="2">
  <tr><td align="left">昵称：
    <input name="username" type="text" class="inputText" id="username1"  value="匿名" placeholder="昵称（必填），登录账号后不用填写" value="" size="16" />
  </td></tr>
  <!--<tr><td align="left"><label>密码：</label><input name="password" type="password" class="inputText" id="password1" placeholder="密码" value=" size="16" /></td></tr>-->
  <tr><td align="left">

    <input name="nomember" type="checkbox" id="nomember" value="1" checked="checked" />

    匿名发表 <!--<a href="/e/member/login/" target="_blank"><i class="fa fa-user"></i> 登录账号</a>-->

  </td></tr>

</table>



                                                    <textarea name="saytext" rows="6" id="saytext" placeholder="请遵守互联网相关规定，不要发布广告和违法内容!"></textarea>
 
<script>
function eaddplface(tag) {
        var myField;
        if (document.getElementById('saytext') && document.getElementById('saytext').type == 'textarea') {
                myField = document.getElementById('saytext');
        }
        else {
                return false;
        }
        if (document.selection) {
                myField.focus();
                sel = document.selection.createRange();
                sel.text = tag;
                myField.focus();
        }
        else if (myField.selectionStart || myField.selectionStart == '0') {
                var startPos = myField.selectionStart;
                var endPos = myField.selectionEnd;
                var cursorPos = endPos;
                myField.value = myField.value.substring(0, startPos)
                                          + tag
                                          + myField.value.substring(endPos, myField.value.length);
                cursorPos += tag.length;
                myField.focus();
                myField.selectionStart = cursorPos;
                myField.selectionEnd = cursorPos;
        }
        else {
                myField.value += tag;
                myField.focus();
        }
}
for(var i=1;i<=72;i++){
    document.write("<a href='javascript:;' onclick=\"eaddplface('[em_"+i+"]');\"><img src='/kf/images/qqface/"+i+".png' border=0 title='"+getQQFaceDescribe(i)+"'></a>");   
}

function getQQFaceDescribe(i){
    var splxx="微笑，撇嘴，色，发呆，得意，流泪，害羞，闭嘴，睡，大哭，尴尬，发怒，调皮，呲牙，惊讶，难过，酷，冷汗，抓狂，吐，偷笑，可爱，白眼，傲慢，饥饿，困，惊恐，流汗，憨笑，悠闲，奋斗，咒骂，疑问，嘘，晕，折磨，衰，骷髅，敲打，再见，擦汗，抠鼻，鼓掌，臭大了，坏笑，左哼哼，右哼哼，哈欠，鄙视，委屈，快哭了，阴险，右亲亲，左亲亲，吓，可伶，眨眼睛，笑哭，doge，泪奔，无奈，托腮，卖萌，斜眼笑，喷血，惊喜，骚扰，小纠结，我最美，加油必胜，口罩护体，搬砖中".split("，")
    return splxx[i-1]
}
</script>
                                                    

                                                    &nbsp;&nbsp;&nbsp;

                                <input name="repid" type="hidden" id="repid" value="" />
                                                    
                                                    <table width='100%' align='left' cellpadding=3 cellspacing=1 bgcolor='#FFF'>
                                                        <tr>
                                                            <td width="80%" height="40" bgcolor="#FFFFFF">验证码：<input name="key" type="text" class="inputText" size="16" />
                                                                <img src="/inc/YZM_7.Asp" align="absmiddle" name="plKeyImg" id="plKeyImg" onclick="plKeyImg.src='/inc/YZM_7.Asp?t='+Math.random()" title="看不清楚,点击刷新" style="cursor:pointer;" />
                                                            </td>
                                                            <td width="20%" height="40" bgcolor="#FFFFFF">
                                                                <input name="sumbit" type="submit" value="提交评论" tabindex="6" style="border-radius: 5px;font-size: 16px;background: #e94c3d none repeat scroll 0% 0%;border: 0px none;margin: 0px 16px;padding: 1px 16px;height: 33px;line-height: 30px;color: rgb(255, 255, 255);opacity: 0.95;">
                                                                


                                                               
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </form>




<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
  <% 
  for i=1 to rs.recordcount
  %>
    <tbody>
        <tr>
            <td bgcolor="#FFFFFF" id="infocommentarea">
                <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" style="word-break:break-all; word-wrap:break-all;line-height: 32px; padding: 9px 9px 1px; margin-top: 22px; border-radius: 5px; border: 1px dotted rgb(221, 221, 221); font-size: 14px;border-collapse:separate;word-wrap:break-word;">
                    <tbody>
                        <tr>
                            <td height="30"><span class="name1">
                                    <font size="4" color="#b1b1b1"><img src="<%=rs("memberpic")%>" border="0"> <%=rs("guestname")%></font>
                                    <font size="2" color="#d1d1d1"><%=format_Time(rs("createtime"),1)%></font>
                                </span></td>
                            <td>
                                <div align="right">
                                    <font size="6" color="#e9e9e9">
                                        <%=rs.recordcount-i%>楼</font>
                                </div>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td height="50" colspan="2" class="text">
                              <%
                              ' call echo("id",id)
  rsx.open "select * from " & db_PREFIX & "articlemessage where isthrough=1 and articleid="&id&" and id="& rs("parentid") ,conn,1,1
  if not rsx.eof then
%>
                                <div class="ecomment">
                                    <span class="ecommentauthor">网友 <%=rsx("guestname")%> 的原文：</span>
                                    <p class="ecommenttext"><%=handleBodyQQFace(rsx("bodycontent"))%></p>
                                </div>
<%end if:rsx.close%>

                                <%=handleBodyQQFace(rs("bodycontent"))%>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div align="right" class="re"><a href="#tosaypl" onclick="javascript:document.saypl.repid.value='<%=rs("id")%>';document.saypl.saytext.focus();">回复</a>&nbsp;
                                    <a href="javascript:sustainOppose(<%=rs("id")%>,'sustain')">支持</a>[<span id="sustain<%=rs("id")%>">
                                        <%=rs("sustain")%> </span>]&nbsp; <a href="javascript:sustainOppose(<%=rs("id")%>,'oppose')">反对</a>[<span id="oppose<%=rs("id")%>">
                                        <%=rs("oppose")%> </span>] </div>
                            </td>
                        </tr>
                    </tbody>
                </table> 
            </td>
        </tr>  
    </tbody>
    <%rs.movenext:next:rs.close
 
  %>
</table>
<script>
//支持与反对  javaScript:sustainOppose(3)
function sustainOppose(id,type){
    jQuery.ajax({
        url: '/api/sustainOppose.asp?act='+type+'&showtype=json',
        type: 'POST',
        data: {
            'id': id
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest)
            alert(textStatus)
            alert(errorThrown)
        },
        success: function(result) { 
           var obj=$.parseJSON(result);
          $("#"+type+id).text(obj.count);
          alert(obj.info)
        }
    });
}
</script> 
                    </div>
            </div>










