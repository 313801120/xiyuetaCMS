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


    <div class="pageguestbook901 clearfixguestbook901">
        <!--栏目侧边栏-->
        <div class="ct2-mn901">
            <div class="mn-box901">
                <div class="content-body901">
                    <table width="100%" align="center" cellpadding="3" cellspacing="1" bgcolor="#DBEAF5" style="table-layout:fixed">
                        <form name="form1" id="liuyan001" method="post" action="/api/liuyan.asp?act=submit" onsubmit="return onsubmitLiuYan001();">
                        <tbody>
                            <tr style="height: 40px;">
                                <td width="16%" height="25" bgcolor="ffffff" align="center" valign="center">您的姓名</td>
                                <td bgcolor="ffffff"><input id="liuyan001name" name="name" type="text" value="">* 必填</td>
                            </tr>
                            <tr style="height: 40px;">
                                <td width="20%" height="25" bgcolor="ffffff" align="center" valign="center">联系电话</td>
                                <td bgcolor="ffffff"><input id="liuyan001mobile" name="mobile" type="text" value="">* 必填</td>
                            </tr>
                            <tr>
                                <td width="20%" height="25" bgcolor="ffffff" align="center" valign="center">信息内容</td>
                                <td bgcolor="ffffff">
                                    <textarea id="liuyan001content" name="content" style="width: 80%;height: 90px;margin-top: 18px;margin-bottom: 10px;"></textarea>* 必填
                                </td>
                            </tr>
                            <!--验证码-->
                            <script type="text/javascript">function edoshowkey(showid,vname){
	document.getElementById(showid).innerHTML='<img src="/inc/yzm_7.asp?v='+vname+'&t='+Math.random()+'" name="'+vname+'KeyImg" id="'+vname+'KeyImg" align="bottom" onclick=edoshowkey("'+showid+'","'+vname+'") title="看不清楚,点击刷新">';
}</script>
                            <tr style="height: 40px;">
                                <td width="20%" height="25" bgcolor="ffffff" align="center" valign="center">验证码</td>
                                <td bgcolor="ffffff"><input name="yzm" id="liuyan001yzm" type="text" size="">
                                    <span id="loginshowkey">
                                        <a href="#EmpireCMS" onclick="edoshowkey('loginshowkey','feedback','/');" title="点击显示验证码">点击显示验证码</a>
                                    </span>
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td bgcolor="ffffff"></td>
                                <td bgcolor="ffffff">
                                    <input type="submit" name="submit" value="  提  交  " style="HEIGHT: 32px;"> 
                                    <input type="reset" name="reset" value="  重  置  " style="HEIGHT: 32px;">
                                </td>
                            </tr>
                        </tbody></form>
                        <script>function onsubmitLiuYan001(){
    var name=$("#liuyan001name").val();
    var mobile=$("#liuyan001mobile").val();
    var content=$("#liuyan001content").val();
    var yzm=$("#liuyan001yzm").val();
    if(name==""){
        alert("请输入您的姓名");
        $("#liuyan001name").focus();
        return false;
    }else if(mobile==""){
        alert("请输入联系电话");
        $("#liuyan001mobile").focus();
        return false;
    }else if(content==""){
        alert("请输入信息内容");
        $("#liuyan001content").focus();
        return false;
    }else if(yzm==""){
        alert("请输入验证码");
        $("#liuyan001yzm").focus();
        return false;
    }else{
        return true;
    }
}</script>
                    </table>
                </div>
            </div>
        </div>
    </div> 
