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

resurl="/web/tpl/page-guestbook/900/"
 %>
<style>.pageguestbook900 #message-form{
    font-size: 0;
}
.pageguestbook900 #message-form .red-star{
    color: red;
}
.pageguestbook900 #message-form label{
    font-size: 14px;
}
.pageguestbook900 #message-form textarea{
    resize: none;
}
.pageguestbook900 #message-form #checkcode{
    display: inline-block;
    width: 30%;
}
.pageguestbook900 #message-form .error-info{
    padding-top: 4px;
    display: inline-block;
    vertical-align: top;
    position: absolute;
}
@media (max-width: 768px){
.pageguestbook900 #message-form .form-group{
        margin-bottom: 25px;
    }
.pageguestbook900 #message-form .error-info{
        display: block;
        padding-top: 0;
        float: none !important;
        padding-left: 10px;
    }}

.pageguestbook900 img{
    image-rendering: -moz-crisp-edges; /* Firefox */
    image-rendering: -o-crisp-edges; /* Opera */
    image-rendering: -webkit-optimize-contrast; /* Webkit (non-standard naming) */
    image-rendering: crisp-edges;
    -ms-interpolation-mode: nearest-neighbor; /* IE (non-standard property) */
}</style> 
<span class="pageguestbook900"> 
                    <form action="/api/liuyan.asp?act=submit" method="post" class="form-horizontal nice-validator n-default" id="message-form" novalidate="novalidate" style="    padding-top: 20px;">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">
                                <span class="red-star">*</span>
                                <span class="wz">姓名</span>：
                            </label>
                            <div class="col-sm-7"><input id="name" name="name" type="text" class="form-control" placeholder="请输入您的姓名">
                            </div>
                            <div class="pull-left">
                                <div class="error-info"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="mobile" class="col-sm-2 control-label">
                                <span class="red-star">*</span>
                                <span class="wz">手机号</span>：
                            </label>
                            <div class="col-sm-7"><input id="mobile" name="mobile" type="text" class="form-control" placeholder="请输入您的手机号">
                            </div>
                            <div class="pull-left">
                                <div class="error-info"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">
                                <span class="wz">邮箱</span>：
                            </label>
                            <div class="col-sm-7"><input id="email" name="email" type="text" class="form-control" placeholder="请输入您的邮箱地址">
                            </div>
                            <div class="pull-left">
                                <div class="error-info"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="content" class="col-sm-2 control-label">
                                <span class="red-star">*</span>
                                <span class="wz">留言内容</span>：
                            </label>
                            <div class="col-sm-7">
                                <textarea id="content" rows="5" name="content" class="form-control" placeholder="请输入您的留言内容"></textarea>
                            </div>
                            <div class="pull-left">
                                <div class="error-info"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="checkcode" class="col-sm-2 control-label">
                                <span class="red-star">*</span>
                                <span class="wz">验证码</span>：
                            </label>
                            <div class="col-sm-7"><input id="checkcode" class="form-control" name="yzm" type="text" placeholder="验证码"><img id="checkCodeImg" style="padding-left: 11px;
    vertical-align: top;cursor: pointer;" title="点击换一张" src="/inc/yzm_7.asp" height="34" onclick="src='/inc/yzm_7.asp?'+Math.random();">
 
 
                                <div class="error-info"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 hidden-xs"></div>
                            <div class="col-sm-2 col-xs-12"><input type="submit" class="btn btn-primary form-control" name="btn" value="提交" style="background-color:#337ab7;border-color: #1a7ee0;"> 
                            </div>
                        </div>
                    </form> 

<link rel="stylesheet" type="text/css" href="<%=resUrl%>css/jquery.validator.css?v1">
<script src='<%=resUrl%>js/jquery.validator.js'></script>
<script src='<%=resUrl%>js/validator.cn.js'></script>
<script>
    // 表单交互验证 (利用插件实现的)
    $("#message-form").validator({
        // 验证规则
        fields: {
            name: "required",
            mobile:"required;phone",
            email:'email',
            content:'required',
            yzm:'required;checkcode'
        },
        // 获取当前提示信息抬头
        display: function(el) {
            return $(el).closest('.form-group').find('label span.wz').text();
        },
        // 自定义正则表达式
        rules: {
            // phone: [/^1[34578]+d{9}$/, "请填写有效的手机号"],
            checkcode:[/^[a-zA-Z0-9]{4}$/,"验证码必须为四位数字和字母"]
        },
        // 自定义错误消息提示框
        target: function(elem){
            var $formitem = $(elem).closest('.form-group'),
                $msgbox = $formitem.find('div.error-info');
            if (!$msgbox.length) {
                $msgbox = $('<span class="msg-box"></span>').appendTo($formitem);
            }
            return $msgbox;
        }
    });

    // placholder 点击之后提示消失
    // 默认隐藏这个功能，如果需要下面就取消注释
    /*
    $("#message-form .form-control").each(function(){
        var placholdeText = $(this).attr('placeholder');
        $(this).focus(function () {
            $(this).attr('placeholder','');
        });
        $(this).blur(function () {
            $(this).attr('placeholder',placholdeText);
        });
    });
    */
</script>
</span>

