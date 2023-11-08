$(function () {
    // 手机端 到导航点击特效
    $(".xymob-menu-jt").click(function () {
        var xymobSubmenuBox = $(this).siblings('.xymob-sub-menu');
        var xymobSubmenuSiblingsBox = $(this).parents('li').siblings('li').find('.xymob-sub-menu');
        var xymobSubmenuSiblingsJt = $(this).parents('li').siblings('li').find('.xymob-menu-jt');
        if(!xymobSubmenuBox.is(":visible")){
            $(this).addClass('clicked');
            xymobSubmenuBox.slideDown();
            xymobSubmenuSiblingsJt.removeClass('clicked');
            xymobSubmenuSiblingsBox.slideUp();
        }else {
            $(this).removeClass('clicked');
            xymobSubmenuBox.slideUp();
        }
    });
 
    // 获取本地文件夹名
    // 格式 /xypt/
    var localFileName = app.config.homeUrl.replace(window.location.origin, '');
    $(".x-menu a").each(function () {
        var AHref = $(this).attr('href');

        // 如果连接中不含有域名
        if (AHref.indexOf(app.config.homeUrl) === -1) {
            // 如果当前链接的第一个字符不是 '/'
            if (AHref.charCodeAt(0) !== 47) {
                AHref = '/' + AHref;
            }
            // 如果连接中不含有本地文件夹
            if (AHref.indexOf(localFileName) === -1) {
                // 路径就等于 配置相中的主域名+后台录入的地址
                AHref = app.config.homeUrl.substr(0, app.config.homeUrl.length - 1) + AHref;
            } else {
                // 否则 路径就等于 当前浏览器的origin+后台录入的地址
                AHref = window.location.origin + AHref;
            }
        }

        // 这个是路径一致的情况
        if (AHref === window.location.href) {
            $(".x-menu li").removeClass('active');
            // indexOf('x-sub-menu') 这里的 x-sub-menu 是下拉的元素类名，如果模板里改了类名这里也是要改的
            if ($(this).parent().parent().attr('class').indexOf('x-sub-menu') !== -1) {
                $(this).parent().parents('li').addClass('active')
            } else {
                $(this).parent().addClass('active')
            }
        }
    });

    //手机导航按钮点击效果
    app.clickToggle('.xymob-navbtn','.xymob-menu');

    // 手机搜索按钮点击
    $(".xymob-search-btn").add('.xymob-search-close-btn').click(function () {
        $(".xymob-search").toggleClass('clicked');
        // alert("aaa")
    });

    //导航条固定在头部
    if($(window).scrollTop() > 30){
        $('.xy-head').addClass('scroll');
    }
    $(window).scroll(function () {
        var len = $(this).scrollTop();
        if (len > 30) {
            $('.xy-head').addClass('scroll');
        }else{
            $('.xy-head').removeClass('scroll')
        }
    });

    //返回顶部
    app.backTop(".xymob-page-backtop",300);

    // 搜索框判断
    $("input[name='wd']").each(function () {
        var _plac = $(this).attr('placeholder');
        $(this).focus(function () {
            $(this).attr('placeholder','');
        });
        $(this).blur(function () {
            $(this).attr('placeholder', _plac);
        });
    });

    $('input[type="submit"]').click(function () {
        var _val = $(this).siblings("#keyword").val();
        if(_val === '' || _val ==='请输入搜索关键词') {
            alert('请输入搜索关键词！');
            $("#keyword").focus();
            return false;
        }
    });


    /* 内页共用js代码 */

    // 内页左侧导航栏点击特效
    $(".first-nav-btn").click(function () {
        var boxa = $(this).siblings('.xypg-left-subnav');
        var parbox = $(this).parents('li');
        var parSibBox = $(this).parents('li').siblings('li');
        var boxb = $(this).parents('li').siblings('li').find('.xypg-left-subnav');
        var jta = $(this).parents('li').siblings('li').find('.first-nav-btn');

        var subLiLen = boxa.find('li').length;
        if(subLiLen == 0){
            return false
        }
        if(!boxa.is(":visible")){
            boxa.slideDown();
            parbox.addClass('clicked');
            $(this).addClass('clicked');
            boxb.slideUp();
            jta.removeClass('clicked');
            parSibBox.removeClass('clicked');
        }else {
            boxa.slideUp();
            $(this).removeClass('clicked');
            parbox.removeClass('clicked');
        }
    });

    // 内页标题 字母获取
    $(".xypg-left-title").each(function () {
        var words = $(this).find('span').text();
        var firstLetter = words.substr(0,1);
        $('<i>'+firstLetter+'</i>').appendTo($(this));
    });

    // 内页手机端端 做的导航弹出特效
    $(".xymob-page-navbtn").click(function(){
        $(".xymob-menu-click").addClass('click');
        $('html,body').addClass('no-scroll');
    });
    $(".xymob-left-close-btn").click(function(){
        $(".xymob-menu-click").removeClass('click');
        $('html,body').removeClass('no-scroll');
    });

    // 详情页面 相关产品滚动特效
    if($(".relate-product-slick").length != 0) {
        $(".relate-product-slick").owlCarousel({
            margin: 14,
            dots:false,
            autoplay: true,
            responsive:{
                0:{
                    items:2
                },
                600:{
                    items:3
                },
                1000:{
                    items: 4
                }
            }
        });
    }

    //详细页分页点击效果
    $(".paging_num > a").click(function(){
        var index = $(this).index();
        location.hash = index + 1;
        var hash = location.hash;
        $(this).parent().siblings('.total').find('.paging').eq(hash.slice(1)-1).css("display","block").siblings('.paging').css("display","none");
        $(this).addClass("paging_hover").siblings().removeClass("paging_hover");
    });

    // 详情页下载文件 下拉点击特效
    app.clickToggle('.file-down-title','.file-down-list');

    // 内页左侧当前分类颜色高亮
    $(".xypg-left-nav li a[href='"+window.location.href+"']").closest('li').addClass('clicked');
    $(".xypg-left-threenav .clicked").parents('.xypg-left-subnav').show();
    $(".xypg-left-threenav .clicked").parents('.xypg-left-threenav').show();
    $(".xypg-left-subnav .clicked").parents('.xypg-left-subnav').show();

    // ie9 兼容 placeholder
    if(!app.placeholderSupport()){
        app.iePlaceholder()
    }

    // 防复制代码
    if(app.config.copyCode == 1) {
        app.antiClone();
    }

});



function tabs(tabs, tab_box, _event) {
    $(tab_box).hide();
    $(tab_box).eq(0).show();
    $(tabs).find('li:eq(0)').addClass('cur');
    $(tabs).find("li").bind(_event, function() {
        $(this).addClass("cur").siblings("li").removeClass("cur");
        var _index = $(this).index();
        $(tab_box).eq(_index).show().siblings(tab_box).hide();
    });
};


function tabs1(tabs, tab_box, _event) {
    $(tab_box).eq(0).addClass('haha');
    $(tabs).find('li:eq(0)').addClass('on');
    $(tabs).find("li").bind(_event, function() {
        $(this).addClass("on").siblings("li").removeClass("on");
        var _index = $(this).index();
        $(tab_box).eq(_index).addClass('haha').siblings(tab_box).removeClass('haha');
    });
};
