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
<style>.pageguestbook901 a{-webkit-text-decoration-skip:objects;background-color:transparent;}
.pageguestbook901 button,.pageguestbook901 input,.pageguestbook901 optgroup,.pageguestbook901 select,.pageguestbook901 textarea{line-height:1.42857143;margin:0;outline: none;}
.pageguestbook901 body,.pageguestbook901 button,.pageguestbook901 input,.pageguestbook901 select,.pageguestbook901 textarea{text-rendering: optimizeLegibility;-webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;-moz-font-feature-settings: "liga","kern";}
.pageguestbook901 button,.pageguestbook901 input{overflow:visible;border: 1px solid #ddd;}
.pageguestbook901 [type=reset],.pageguestbook901 [type=submit]{-webkit-appearance:button;}
.pageguestbook901 button::-moz-focus-inner,.pageguestbook901 [type=button]::-moz-focus-inner,.pageguestbook901 [type=reset]::-moz-focus-inner,.pageguestbook901 [type=submit]::-moz-focus-inner{border-style:none;padding:0;}
.pageguestbook901 button:-moz-focusring,.pageguestbook901 [type=button]:-moz-focusring,.pageguestbook901 [type=reset]:-moz-focusring,.pageguestbook901 [type=submit]:-moz-focusring{outline:1px dotted ButtonText;}
.pageguestbook901 textarea{overflow:auto;border: 1px solid #ddd;}
.pageguestbook901 ::-webkit-file-upload-button{-webkit-appearance:button;font:inherit;}
.clearfixguestbook901{zoom:1;}
.clearfixguestbook901:before,.clearfixguestbook901:after{display:table;line-height:0;content:"";}
.clearfixguestbook901:after{clear:both;}
.pageguestbook901 a{color: #333;text-decoration: none;}
.pageguestbook901 a:hover{color: #007333;}
.pageguestbook901{/*padding: 0 10px;width: 1200px;*/margin: 0 auto;overflow-x: hidden;}
.pageguestbook901 .ct2-mn901{/*float: right;width: 940px;*/}
.pageguestbook901 .mn-box901{/*border: 1px solid #efefef;*/padding: 20px;margin-bottom: 15px;}
.pageguestbook901 .content-body901{line-height: 1.8;}
@media screen and (max-width: 767px){
.pageguestbook901{width: auto;}
.pageguestbook901 .ct2-mn901{float: none;width: auto;}
.pageguestbook901 .mn-box901{padding: 0;border: none;}}</style>

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
