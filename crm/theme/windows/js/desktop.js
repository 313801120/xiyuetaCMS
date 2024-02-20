// JavaScript Document
$(function() {

    $(window).resize(function() {
        arrange();
        setsize();
    });

    arrange();

    //排列图标
    function arrange() {
        //位置坐标
        var position = {
            x: 12,
            y: 20,
            bottom: 40,
            width: 100,
            height: 100
        };

        All_height = $(window).height() - 40; //桌面图标区域总高度
        All_width = $(window).width();

        $(".applist").css("height", All_height + "px");

        $(".applist").find(".desk_app").each(function(index) {

            $(this).css("left", position.x + "px");
            $(this).css("top", position.y + "px");

            position.height = $(this).height();
            position.width = $(this).width();

            position.y = position.y + position.height + 20;

            if (position.y + position.height >= All_height) {
                position.y = 20;
                position.x = position.x + position.width + 10;
            }
        });

        //开始菜单右侧图标	
        $("#links li:eq(0)").css("width", "214px");
        $("#links li:eq(6)").css("width", "214px");
    }

    //开始菜单
    $('.startwin10').on('click', function(event) {
        event.stopPropagation(); //阻止事件冒泡
        $("#startmenu").slideToggle("fast");

        var listdata = '';
        $(".desk_page").each(function() {
            listdata += parseInt($(this).css("z-index")) + ",";
            return listdata;
        });
        var indexarr = listdata.split(',');
        var nowZindex = Math.max.apply(null, indexarr) + 1;

        $("#startmenu").css("z-index", nowZindex);

        //点击空白处，下拉框隐藏
        var tag = $("#startmenu");
        var flag = true;
        $(document).bind("click", function(e) { //点击空白处，开始菜单消失
            if ($(e.target).closest(tag).length == 0 && flag == true) {
                $(tag).hide();
                flag = false;
            }
        });
    });
})

$(function() {

    /*弹出窗口封装代码*/
    $(".desk-app").on("click", function() {

        $("#startmenu").css("display", "none"); //收起开始菜单
        $('#rightmenu').css('display', 'none'); //右键菜单消失

        if (($(".taskcontainer .taskgroup").length + 1) * 113 >= $(window).width() - 190) {
            layer.msg('打开窗口过多，请先关闭一些窗口');
            return false;
        }

        var id = $(this).data("id");
        var title = $(this).data("title");
        var url = $(this).attr("href");
        var icon = $(this).data("icon");

        var listdata = '';
        $(".desk_page").each(function() {
            listdata += parseInt($(this).css("z-index")) + ",";
            return listdata;
        });
        var indexarr = listdata.split(',');
        var nowZindex = Math.max.apply(null, indexarr) + 1;

        $(".desk_page").removeClass("aui_state_focus");

        //窗口已存在
        if ($(".d" + id).length >= 1) {

            $(".d" + id).addClass("aui_state_focus");
            $(".d" + id).css("display", "block");
            $(".d" + id).css("z-index", nowZindex);

            $("#taskcontainer .taskgroup").removeClass("taskcurrent");
            $("#t" + id).addClass("taskcurrent");

            return false;

        } else {

            width = $(this).data("width") ? $(this).data("width") : document.body.clientWidth * 0.8;
            height = $(this).data("height") ? $(this).data("height") : document.body.clientHeight * 0.8;
            height = $(document).height() < height ? '80%' : height;
            $.dialog.open(url, {
                id: id,
                title: title,
                width: width,
                height: height,
                max: true,
                min: true,
                fixed: true,
                lock: false,
                init: function() {
                    $("#taskcontainer .taskgroup").removeClass("taskcurrent");
                    $("#taskcontainer").append('<div class="taskgroup taskcurrent" id="t' + id + '"><div class="taskitemicon"><i class="fa ' + icon + '"></i></div><div class="taskitemtxt">' + title + '</div></div>');
                },
                close: function() {
                    $('#taskcontainer #t' + id).remove();
                }
            });

            return false;

        }

    });


    //任务栏控制
    $("body").on("click", ".taskgroup", function() {

        $("#taskcontainer .taskgroup").removeClass("taskcurrent");
        $(this).addClass("taskcurrent");

        var nowid = $(this).attr('id').replace("t", ""); // 获取数字id

        var listdata = '';
        $(".desk_page").each(function() {
            listdata += parseInt($(this).css("z-index")) + ",";
            return listdata;
        });
        var indexarr = listdata.split(',');
        var nowZindex = Math.max.apply(null, indexarr) + 1;

        $(".desk_page").removeClass("aui_state_focus");
        $(".d" + nowid).addClass("aui_state_focus");
        $(".d" + nowid).css("display", "block");
        $(".d" + nowid).css("z-index", nowZindex);

    });

    //屏蔽浏览器右键菜单
    document.oncontextmenu = function() {
        return false;
    }

    //按下鼠标
    $(document).mousedown(function(e) {

        var key = e.which; //获取鼠标键位
        if (key == 3) //(1:代表左键； 2:代表中键； 3:代表右键)
        {
            //获取右键点击坐标
            var x = e.clientX;
            var y = e.clientY;

            $("#rightmenu").show().css({
                left: x,
                top: y
            });
        }
    });

    //点击任意部位隐藏
    $(document).click(function() {
        $("#rightmenu").hide();
    })

});

function show_desktop() {
    $(".desk_page").css("display", "none");
    $('#rightmenu').css('display', 'none');
}

function closeall() {

    art.dialog({
        content: '是否确定关闭所有窗口?',
        icon: 'error',
        zindex: '99999',
        ok: function() {

            var list = art.dialog.list;
            for (var i in list) { list[i].close(); };

        },
        cancelVal: '关闭',
        cancel: true //为true等价于function(){}
    });
    $('#rightmenu').css('display', 'none');

}

function lock_desktop() {

    art.dialog({
        lock: true,
        background: '#333', // 背景色
        opacity: 0.87, // 透明度
        content: '锁屏后需要刷新才能重新进入系统',
        icon: 'error',
        zindex: '999999',
        ok: function() {
            /*art.dialog({content: '再来一个锁屏', lock: true});*/
            return false;
        },
        cancel: true
    });
    $('#rightmenu').css('display', 'none');

}

$("#themesettings").on("click", function() {
    $('#rightmenu').css('display', 'none');
    $(".desktop-menu").hide();
    var themebox = $("#theme_body").html();
    $("#theme_body").css("display", "block");
    layer.open({
        type: 1,
        title: "主题设置",
        area: ["810px", "370px"],
        skin: "layui-layer-theme",
        anim: 2,
        shade: false,
        zindex: 999999,
        content: themebox,
        success: function(layero, index) {
            $(".theme_setting").click(function() {
                var a = $(this);
                var themeid = a.attr("themeid");
                var nowid = a.attr("nowid");
                var src = a.attr("bigpicurl");
                $("body").css("background-image", "url(" + src + ")");
                $("#themezoom").css("background-image", "url(" + src + ")");
                $(".theme_setting").removeClass("theme_select");
                a.addClass("theme_select");
                $.post("inc.theme.asp", {
                    id: nowid
                }, function(data) {
                    if (data == "success") {
                        layer.msg("主题保存成功")
                    } else {
                        layer.msg("主题保存失败")
                    }
                })
            });

            $(".theme_upload").click(function() {
                $.dialog.open("themesave.asp", { title: '上传主题', width: 680, height: 450, fixed: true, lock: false });
            });

        }
    })
});

$(".logout").on("click", function() {
    $('#rightmenu').css('display', 'none');
    $(".desktop-menu").hide();
    layer.alert("确定要注销登录吗?", {
        icon: 0,
        btn: ["确定", "取消"],
        zIndex: parseInt(10000001 + 1000),
        yes: function(index, layero) {
            $.post("logout.asp", {}, function(data) {
                if (data == "success") {
                    layer.msg("注销成功");
                    window.location.replace("/admin")
                } else {
                    layer.msg("操作失败")
                }
            })
        },
        end: function() {}
    })
});

$(function() {

    if (desk_xitong == 1) {
        matop = "15px";
        maleft = (document.body.clientWidth - 300 - 325) + "px"
    } else {
        matop = "15px";
        maleft = (document.body.clientWidth - 300 - 15) + "px"
    }

    if (user_ziliao == 1) {
        matop_bq = "188px";
    } else {
        matop_bq = "15px";
    }

    if (user_ziliao == 1) {
        setTimeout(function() {
            layer.open({
                type: 1,
                title: "个人资料",
                skin: 'layui-layer-userinfo',
                area: ["300px", "165px"],
                offset: [matop, maleft],
                //anim: 6,
                shade: false,
                zIndex: 999,
                content: '<iframe style="height:125px;" width="100%" frameborder=0 scrolling="auto" src="notice_userinfo.asp" allowTransparency="true" scrolling="no"></iframe>',
                success: function(layero, index) {}
            })
        }, 0.15 * 1000)
    }

    bianqian = $(".bianqian").text();
    if (desk_bianqian == 1) {
        setTimeout(function() {
            layer.open({
                type: 1,
                title: "桌面便签",
                skin: 'layui-layer-notepaper',
                area: ["300px", "157px"],
                offset: [matop_bq, maleft],
                //anim: 6,
                shade: false,
                zIndex: 999,
                content: '<textarea class="layui-textarea notepaper">' + bianqian + "</textarea>",
                success: function(layero, index) {
                    $(layero).find(".notepaper").on("change", function() {
                        $.post("inc.bianqian.asp", { bq_content: escape($(this).val()) }, function(data) {
                            //layer.msg("便签保存成功")
                            if (data == "success") {
                                layer.msg("便签保存成功")
                            } else {
                                layer.msg("便签保存失败")
                            }
                        })
                    })
                }
            })
        }, 0.2 * 1000)
    }

    if (desk_xitong == 1) {
        setTimeout(function() {
            layer.open({
                type: 1,
                title: "桌面提醒",
                skin: 'tixing-class',
                area: ["300px", "330px"],
                offset: ["15px", (document.body.clientWidth - 300 - 15) + "px"],
                shade: false,
                zIndex: 999,
                content: '<iframe id="noticek" style="height:290px;" width="100%" frameborder=0 scrolling="auto" src="notice.asp" allowTransparency="true"></iframe>',
                success: function(layero, index) {},
                resizing: function(layero) {
                    $("#noticek").height(($(".tixing-class .layui-layer-content").height() - 5) + "px")
                }
            })
        }, 0.2 * 1000)
    }

    //不显示执行过程
    var yc_left = document.body.clientWidth + 10

    // setTimeout(function() {
    //     layer.open({
    //         type: 1,
    //         title: "自动执行程序",
    //         skin: 'zidong-class',
    //         area: ["300px", "300px"],
    //         offset: ["330px", yc_left + "px"],
    //         shade: false,
    //         zIndex: 999,
    //         content: '<iframe style="height:260px;" width="100%" frameborder=0 scrolling="auto" src="/crm/auto/" allowTransparency="true"></iframe>'
    //     })
    // }, 0.7 * 1000)


})


setsize();

function setsize() {

    $("#desktop").css("height", $(window).height() + "px");

    if (desk_xitong == 1) {
        matop = "215px";
        matop_bq = "188px";
        maleft = (document.body.clientWidth - 300 - 325) + "px"
    } else {
        matop = "15px";
        matop_bq = "188px";
        maleft = (document.body.clientWidth - 300 - 15) + "px"
    }

    $('.layui-layer-notepaper').css("left", maleft);
    $('.layui-layer-userinfo').css("left", maleft);
    $('.tixing-class').css("left", (document.body.clientWidth - 300 - 15) + "px");
    $('.zidong-class').css("left", (document.body.clientWidth + 10) + "px");
    $('.layui-layim').css("top", (document.body.clientHeight - 520 - 40 - 8) + "px");
    $('.layui-layim').css("left", (document.body.clientWidth - 260 - 16) + "px");
    $('.layui-layim-min').css("top", (document.body.clientHeight - 40 - 8) + "px");
    $('.layui-layim-min').css("left", (document.body.clientWidth - 160) + "px");

}

function show_desktop() {
    $(".desk_page").css("display", "none");
    $('#rightmenu').css('display', 'none');
}

//任务栏时间
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var minutes = date.getMinutes();
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (minutes >= 0 && minutes <= 9) {
        minutes = "0" + minutes;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate +
        " " + date.getHours() + seperator2 + minutes +
        seperator2 + date.getSeconds();
    var time_ymd = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    var time_hs = date.getHours() + seperator2 + minutes;

    $("#time-ymd").html(time_ymd);
    $("#time-hs").html(time_hs);
}

setInterval("getNowFormatDate()", 1000);