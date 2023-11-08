layui.use(['layer', 'form', 'laydate', 'upload', 'element', 'carousel'], function() {
    var layer = layui.layer;
    var form = layui.form;
    var element = layui.element;
    var laydate = layui.laydate;
    var device = layui.device();
    var carousel = layui.carousel;
    carousel.render({
        elem: '#banner',
        width: '100%' //设置容器宽度
            ,
        arrow: 'always' //始终显示箭头

        //,anim: 'updown' //切换动画方式
    });


    var upload = layui.upload
    upload.render({
        elem: '.uploads',
        url: '../upload/index.asp',
        before: function(obj) {
            layer.load();
        },
        done: function(res) {
            layer.closeAll('loading');
            //如果上传失败
            if (res.code > 0) {
                return layer.msg(res.msg);
            }
            //上传成功
            if (res.code == 0) {

                var item = this.item
                console.log(item)
                item.parent(".layui-upload").find(".fileurl").val(res.data["src"]);

                return layer.msg(res.msg);

            }
        },
        error: function() {
            layer.closeAll('loading');
            //演示失败状态，并实现重传
            return layer.msg('上传失败');

        }
    });


    upload.render({
        elem: '.files',
        url: '../upload/file.asp',
        accept: 'file',
        before: function(obj) {
            layer.load();
        },
        done: function(res) {
            layer.closeAll('loading');
            //如果上传失败
            if (res.code > 0) {
                return layer.msg(res.msg);
            }
            //上传成功
            if (res.code == 0) {

                var item = this.item
                console.log(item)
                item.parent(".layui-upload").find(".fileurl").val(res.data["src"]);

                return layer.msg(res.msg);

            }
        },
        error: function() {
            layer.closeAll('loading');
            //演示失败状态，并实现重传
            return layer.msg('上传失败');

        }
    });



    if (device.ios || device.android) {

        //	document.location.href= 'wap/';      s
    }




    lay('.date').each(function() {
        laydate.render({
            elem: this,
            trigger: 'click',
            format: 'yyyy/MM/dd'

        });
    });
    var tipsi;
    $(".tips").hover(function() {
        var info = $(this).attr("tips")
        tipsi = layer.tips(info, this, { time: 0 });
    }, function() {
        layer.close(tipsi);
    });


    form.verify({

        content: function(value, item) { //value：表单的值、item：表单的DOM对象
            if (value.length < 3 || value.length > 500) {

                return '评论为2到500个字符';
            }
            var rowNum = value.split(/\r?\n|\r/).length

            if (rowNum > 20) {
                return '不要超过20行'
            }
        },
        username: [/^[\u4E00-\u9FA5\uf900-\ufa2d\w\.]{1,12}$/, '姓名为1到12个字符'],
        pass: [/^[a-zA-Z0-9.]{6,16}$/, '密码为6到16个字符']
    });
    form.on('submit(set_email)', function() {

        set_email()

    })
    form.on('submit(mes)', function() {

        message()

    })
    form.on('submit(reg)', function() {
        reg()
        return false;
    })
    form.on('submit(login)', function() {
        login_user()
        return false;
    })
    form.on('submit(login_admin)', function() {
        login()
        return false;
    })
});

function en(content) {
    result = '';
    for (var i = 0; i < content.length; i++)
        result += '&#' + content.charCodeAt(i) + ';';
    return result;
}

function cn(content) {
    var code = content.match(/&#(\d+);/g);
    result = '';
    for (var i = 0; i < code.length; i++)
        result += String.fromCharCode(code[i].replace(/[&#;]/g, ''));
    return result;
}

function picclose(obj) {
    var my_id = $(obj).prev("input[name=pic]").val()

    $.ajax({
        type: "POST",
        cache: true,
        dataType: "json",
        url: "../inc/ajax.asp?act=dell_file",
        data: { "id": my_id },
        error: function() { alert("fail"); },
        success: function(data) {}

    });
    $(obj).parents(".upload-img").remove();
}

function fjclose(obj) {

    var my_id = $(obj).prev("input[name=fujian]").val()


    $.ajax({
        type: "POST",
        cache: true,
        dataType: "json",
        url: "../inc/ajax.asp?act=dell_file",
        data: { "id": my_id },
        error: function() { alert("fail"); },
        success: function(data) {}

    });
    $(obj).parents(".upload-file").remove();

}

function qrcode(id) {
    var url = window.location.href;
    var str = url + "/wap/wshow.asp?id=" + id
    var qrcode = new QRCode('qrcode');
    qrcode.makeCode(str);

    $(".qrcode").css("display", "block")

}

function qrcode_close() {
    $("#qrcode").html("")
    $(".qrcode").css("display", "none")

}

function set_attr(id, zt) {



    layer.open({
        type: 1,
        title: '设置属性',
        skin: 'layui-layer-rim', //加上边框
        area: ['420px', '200px'], //宽高
        content: '<form class="layui-form" style="padding:20px;">' +

            '<input class="sx" type="checkbox" name="ontop" value="1" title="置顶" >' +
            '<input class="sx" type="checkbox" name="isnice" value="1" title="推荐" >' +
            '<input class="sx" type="checkbox" name="isnote" value="1" title="公告" >' +
            '<p style="margin-top:10px;"><button type="button" class="layui-btn " onclick="sav_attr(' + id + ')">确定</button></p>' +
            '</form>'
    });
    for (i = 0; i < zt.length; i++) {
        if (zt[i] == 1) {
            $(".sx").eq(i).prop("checked", true)
        }
    }
    layui.form.render('checkbox');

}


function sav_attr(id) {

    ontop = $("input[name=ontop]:checked").val()
    isnice = $("input[name=isnice]:checked").val()
    isnote = $("input[name=isnote]:checked").val()

    $.ajax({
        type: "POST",
        cache: true,
        dataType: "json",
        url: "inc/ajax.asp?act=attr",
        data: { "id": id, "ontop": ontop, "isnice": isnice, "isnote": isnote },
        error: function() { alert("fail"); },
        success: function(data) {
            switch (data.status) {
                case "n":
                    layer.msg(data.info)
                    break;
                case "y":
                    location.reload();
                    break;


            }
        }

    });

}


function set_file(id, point) {

    layer.prompt({

        value: point,
        title: '输入下载所需积分',

    }, function(value, index, elem) {

        $.ajax({
            type: "POST",
            cache: true,
            dataType: "json",
            url: "inc/ajax.asp?act=set_file",
            data: { "id": id, "point": value },
            error: function() { alert("fail"); },
            success: function(data) {

            }

        });
        layer.close(index);
    })

}


function down_file(id) {

    $.ajax({
        type: "POST",
        cache: true,
        dataType: "json",
        url: "inc/ajax.asp?act=down_file",
        data: { "id": id },
        error: function() { alert("fail"); },
        success: function(data) {
            switch (data.status) {
                case "n":
                    layer.msg(data.info)
                    break;
                case "y":
                    window.open(data.file);
                    break;


            }

        }

    });


}

function qd() {

    $.ajax({
        type: "POST",
        cache: true,
        dataType: "json",
        url: "../inc/ajax.asp?act=qd",
        data: {},
        error: function() { alert("fail"); },
        success: function(data) {
            switch (data.status) {
                case "n":

                    break;
                case "y":
                    location.reload();
                    break;


            }

        }

    });


}



function login_show() {

    $("#admin").show(500);

}






function checknum() {

    var lenInput = $('.content').val().length;
    $('.textareaInput').html(lenInput);

    $(".content").on(" keypress keyup change", function() {
        lenInput = $(this).val().length;

        var rowNum = $('.content').val().split(/\r?\n|\r/).length

        if (lenInput > 500) {
            $('.content').val($('.content').val().substring(0, 500));

        }
        if (rowNum > 20) {
            layer.msg('不要超过20行')

        }
        $('.textareaInput').html(lenInput);
    });

}





function tc(my_tit, my_url, my_width, my_height) {

    layer.open({
        title: my_tit,
        type: 2,
        area: [my_width + 'px', my_height + 'px'],
        fixed: false, //不固定
        maxmin: true,
        content: my_url,
        success: function(index, layero) {

        }

    });

}

function tc2(my_tit, my_url, my_width, my_height) {

    return layer.open({
        title: my_tit,
        type: 2,
        area: [my_width + 'px', my_height + 'px'], 
        btn: ['确定', '取消'],
        fixed: false, //不固定
        maxmin: true,
        content: my_url,

        yes: function(index, layero){
                var iframeWindow = window['layui-layer-iframe'+ index]
                ,submitID = 'LAY-user-front-submit'
                ,submit = layero.find('iframe').contents().find('#'+ submitID);

                //监听提交
                iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
                  
                });  
                
                submit.trigger('click');
              } 
    });

}

function tc3(my_tit, my_url, my_width, my_height) {

    layer.open({
        title: my_tit,
        type: 2,
        area: [my_width + 'px', my_height + 'px'], 
        btn: ['打电话', '取消'],
        fixed: false, //不固定
        maxmin: true,
        content: my_url,

        yes: function(index, layero){
                var iframeWindow = window['layui-layer-iframe'+ index]
                ,submitID = 'LAY-user-front-submit'
                ,submit = layero.find('iframe').contents().find('#'+ submitID);

                //监听提交
                iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
                  
                });  
                
                submit.trigger('click');
              }



    });

}

function pop_up(my_tit, my_url, my_width, my_height) {

    return layer.open({
        title: my_tit,
        type: 2,
        // area: [my_width, my_height],
        area: [my_width + 'px', my_height + 'px'], 
        fixed: false, //不固定
        maxmin: true,
        content: my_url,
        success: function(index, layero) {

        }

    });

}





function set(zd, zt, my_id, info) {
    layer.confirm(info, function(index) {

        $.ajax({
            type: "POST",
            cache: true,
            dataType: "json",
            url: "inc/ajax.asp?act=set",
            data: { "id": my_id, "zd": zd, "zt": zt },
            error: function() { alert("fail"); },
            success: function(data) {

                switch (data.status) {
                    case "n":
                        layer.msg(data.info)
                        break;
                    case "y":
                        location.reload();
                        break;


                }

            }

        });


        layer.close(index);
    });

}


function message() {

    var jianbook = $(".jianbook_cor").html()


    var index = layer.load();
    $.ajax({
        type: "POST",
        dataType: "json",
        cache: true,
        url: "../inc/ajax.asp?act=comment",
        data: $("#cform").serialize(),
        error: function() { alert("fail"); },
        success: function(data) {
            if (data.status == 'y') {
                parent.location.href = data.url;
            } else {
                layer.msg(data.info)
                layer.close(index);

            }

        }

    });



}

function exit() {

    var index = layer.load();
    $.ajax({
        type: "POST",
        dataType: "json",
        cache: true,
        url: "../inc/ajax.asp?act=loginout",
        error: function() { alert("fail"); },
        success: function(data) {
            if (data.status == 'y') {
                location.reload()
            } else {
                layer.msg(data.info)
                layer.close(index);

            }

        }

    });



}

function del_type(my_table, my_id) {
    layer.confirm('确定删除？', function(index) {

        $.ajax({
            type: "POST",
            cache: true,
            dataType: "json",
            url: "../inc/admin.asp?act=del_type",
            data: { "table": my_table, "id": my_id },
            error: function() { alert("fail"); },
            success: function(data) {
                switch (data.status) {
                    case "n":
                        layer.msg(data.info)
                        break;
                    case "y":

                        location.reload();
                        break;


                }

            }

        });


        layer.close(index);
    });

}


function dell(obj, my_id) {
    layer.confirm('确定删除？', function(index) {

        $.ajax({
            type: "POST",
            cache: true,
            dataType: "json",
            url: "inc/ajax.asp?act=dell",
            data: { "id": my_id },
            error: function() { alert("fail"); },
            success: function(data) {
                switch (data.status) {
                    case "n":
                        layer.msg(data.info)
                        break;
                    case "y":
                        $(obj).parents(".c_show").remove()

                        break;


                }

            }

        });


        layer.close(index);
    });

}

function del_reply_page(obj, my_id, upid) {
    layer.confirm('确定删除？', function(index) {

        $.ajax({
            type: "POST",
            cache: true,
            dataType: "json",
            url: "inc/ajax.asp?act=del_reply",
            data: { "id": my_id, "upid": upid },
            error: function() { alert("fail"); },
            success: function(data) {
                switch (data.status) {
                    case "n":
                        layer.msg(data.info)
                        break;
                    case "y":
                        $(obj).parents(".c_show ").remove()

                        break;


                }

            }

        });


        layer.close(index);
    });

}

function del_reply(obj, my_id, upid) {
    layer.confirm('确定删除？', function(index) {

        $.ajax({
            type: "POST",
            cache: true,
            dataType: "json",
            url: "inc/ajax.asp?act=del_reply",
            data: { "id": my_id, "upid": upid },
            error: function() { alert("fail"); },
            success: function(data) {
                switch (data.status) {
                    case "n":
                        layer.msg(data.info)
                        break;
                    case "y":
                        $(obj).parents(".reply_list").remove()

                        break;


                }

            }

        });


        layer.close(index);
    });

}

function del_file(my_id) {
    layer.confirm('确定删除？', function(index) {

        $.ajax({
            type: "POST",
            cache: true,
            dataType: "json",
            url: "../inc/ajax.asp?act=dell_file",
            data: { "id": my_id },
            error: function() { alert("fail"); },
            success: function(data) {
                switch (data.status) {
                    case "n":
                        layer.msg(data.info)
                        break;
                    case "y":
                        location.reload();

                        break;


                }

            }

        });


        layer.close(index);
    });

}


function zan(obj, the) {

    $.ajax({
        type: "POST",
        dataType: "json",
        cache: true,
        url: "inc/ajax.asp?act=zan",
        data: { "id": the },
        error: function() { alert("fail"); },
        success: function(data) {

            if (data.status == 'y') {
                $(obj).addClass("active");
                $(obj).children("b").html(data.info)
            } else {
                layer.msg(data.info)
            }

        }

    });


}

function login()

{


    $.ajax({
        type: "POST",
        dataType: "json",
        cache: true,
        url: "inc/ajax.asp?act=login",
        data: $("#aform").serialize(),
        error: function() { alert("fail"); },
        success: function(data) {

            if (data.status == 'y') {
                //location.href='index.asp';
                parent.location.reload();
            } else {
                layer.msg(data.info)
            }

        }

    });


}


function set_email()

{


    $.ajax({
        type: "POST",
        dataType: "json",
        cache: true,
        url: "../inc/admin.asp?act=email",
        data: $("#eform").serialize(),
        error: function() { alert("fail"); },
        success: function(data) {
            if (data.status == 'y') {
                layer.msg(data.info)
            } else {
                layer.msg(data.info)
            }

        }

    });


}



function get10MinutesScale() {
    var currDate = new Date();
    var odd = currDate.getMinutes() % 10;
    var returnArr = new Array();
    currDate.setMinutes(currDate.getMinutes() - odd);
    for (var i = 0; i < 7; i++) {
        returnArr.push(currDate.getHours() + ":" + (currDate.getMinutes() < 10 ? ("0" + currDate.getMinutes()) : currDate.getMinutes()));
        currDate.setMinutes(currDate.getMinutes() - 10);
    }
    return returnArr;
}


function getLatestDays(num) {
    var currentDay = new Date();
    var returnDays = [];
    for (var i = 0; i < num; i++) {
        currentDay.setDate(currentDay.getDate() - 1);
        returnDays.push((currentDay.getMonth() + 1) + "/" + currentDay.getDate());
    }
    return returnDays;
}

function pic() {
    $(".galleryOverlay").remove()

    $(".c_pic").each(function() {
        $(this).find("a").touchTouch();
    });



    $('.readmore').readmore({

        maxHeight: 85

    });

}







$(function() {

    var startHref;

    function item_masonry() {
        $('.item_list img').load(function() { $('.list-loop').masonry({ itemSelector: '.loop' }); });
        $('.list-loop').masonry({ itemSelector: '.loop' });
    }

    var p = false;
    if ($(".item_list").length > 0) { p = true;
        item_masonry(); }
    $(".pagemore a").click(function() {

        var href = $(this).attr("href");
        startHref = href;
        if (href != undefined) {
            $.ajax({
                type: "get",
                cache: false,
                url: startHref,
                success: function(data) {

                    var $result = $(data).find(".loop");
                    if (p) { $(".list-loop").append($result).masonry('appended', $result);
                        item_masonry(); } else { $(".list-loop").append($result); }
                    var newHref = $(data).find(".pagemore a").attr("href");
                    if (newHref != "") { $(".pagemore a").attr("href", newHref); } else { $(".pagemore").html("已显示全部内容"); }
                    emo()
                    pic()
                }
            })

        }
        return false;

    })


    $(window).bind("scroll", function() {
        if ($(document).scrollTop() + $(window).height() > $(document).height() - 70) {
            if ($(".pagemore a").attr('href') != startHref) { $(".pagemore a").trigger("click"); }
        }
    })


    var music = document.getElementById("bgMusic");
    $("#audioBtn").click(function() {
        if (music.paused) {
            music.play();
            $("#audioBtn").removeClass("pause").addClass("play");
        } else {
            music.pause();
            $("#audioBtn").removeClass("play").addClass("pause");
        }
    });


    $(".ser_div").click(function() {
        $(".h_ser_bg").show()

    })

    $(".h_ser_close").click(function() {
        $(".h_ser_bg").hide()

    })
});


var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount; //当前剩余秒数

var codeLength = 6; //验证码长度
function sendMessage() {
    curCount = count;
    var dealType; //验证方式
    var uid = $("#email").val(); //用户uid


    //产生验证码
    if (uid == "") {
        layer.msg("请输入邮箱！");

        return false;
    }

    if (!uid.match(/^([\w\_\-]+)@([\w\-]+[\.]?)*[\w]+\.[a-zA-Z]{2,10}$/)) {
        alert("邮箱格式不正确！");

        return false;
    }


    //设置button效果，开始计时
    $("#btnSendCode").attr("disabled", "true");
    $("#btnSendCode").val(+curCount + "秒再获取");
    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
    //向后台发送处理数据
    $.ajax({
        type: "post", //用POST方式传输
        dataType: "json", //数据格式:JSON
        url: "inc/ajax.asp?act=yzm",
        data: { "uid": uid },
        error: function() {},
        success: function(data) {
            if (data.status == 'y') {
                layer.msg('验证码已发送')
            } else

            {
                layer.msg(data.info)
                clearInterval(InterValObj)
                $("#btnSendCode").removeAttr("disabled");
                $("#btnSendCode").val("获取验证码");
            }




        }
    });
}
//timer处理函数
function SetRemainTime() {

    if (curCount == 0) {
        window.clearInterval(InterValObj); //停止计时器
        $("#btnSendCode").removeAttr("disabled"); //启用按钮
        $("#btnSendCode").val("重新发送验");

    } else {
        curCount--;
        $("#btnSendCode").val(+curCount + "秒再获取");
    }
}

function user_login() {

    $("#user").show(500);

}

function login_div() {
    $("#user .atit").html('会员登陆');
    $("#reg").hide();
    $("#login").show();

}

function reg_div() {
    $("#user .atit").html('会员注册');
    $("#login").hide();
    $("#reg").show();

}


function reg() {

    $.ajax({
        type: "POST",
        dataType: "json",
        cache: true,
        url: "inc/ajax.asp?act=reg",
        data: $("#rform").serialize(),
        error: function() { alert("fail"); },
        success: function(data) {

            if (data.status == 'y') {
                layer.msg(data.info)
                login_div()
                $("input[name=email]").val("")
                $("input[name=code]").val("")
                $("input[name=code1]").val("")
                $("input[name=username]").val("")
            } else {
                layer.msg(data.info)
            }

        }

    });


}

function login_user() {
    $.ajax({
        type: "POST",
        dataType: "json",
        cache: true,
        url: "inc/ajax.asp?act=login_user",
        data: $("#lform").serialize(),
        error: function() { alert("fail"); },
        success: function(data) {

            if (data.status == 'y') {
                parent.location.reload();
            } else {
                layer.msg(data.info)
            }

        }

    });


}

function login_close() {
    $(".abg").hide(300);
}
//显示窗体，宽度不超过800    20220210
function showwin(title,url){
    var nWidth=800;
    var n=($(window).width());
    if(n<nWidth)nWidth=n;
    var index=tc2(title,url, nWidth, 450);
    // alert("index="+index);
    if(n<800){//宽度小于800，则全屏
        layer.full(index);//全屏
    }

    return index;
}
//显示窗体，宽度不超过800    20220210  不显示底部的确认和取消按钮
function showwin2(title,url){
    var nWidth=800;
    var n=($(window).width());
    if(n<nWidth)nWidth=n;

    return pop_up(title,url, nWidth, 450)
    // tc3(title,url, nWidth, 450)
}




