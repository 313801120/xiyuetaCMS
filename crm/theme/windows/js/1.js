 $("#loading").css("display", "none");
 $(".desk-newpage").click(function() {
     var newpage_url = $(this).attr("href");
     window.open(newpage_url, "_blank");
 });

 $("#gbtips").click(function() {
     $(".bbtips").remove();
 });
 $("#app_url").click(function() {
     var app_url = $(this).attr("data-href");
     layer.open({
         type: 2,
         title: '手机APP下载',
         area: ['800px', '600px'],
         content: app_url //内容是URL，如果不想让iframe出现滚动条，可以content: ['http://xxx.com', 'no']
     });
 });

 var lastTime = new Date().getTime();
 var currentTime = new Date().getTime();
 var timeOut = 10 * 60 * 1000; //10分钟超时时间
 $(function() {
     $(document).mouseover(function() {
         lastTime = new Date().getTime(); //更新操作时间
     });
 });

 // var get_show_msg = function() {
 //     currentTime = new Date().getTime(); //更新当前时间
 //     if (currentTime - lastTime > timeOut) { //判断是否超时
 //         console.log("timeout stop msg");
 //         $('#msg_timeout').text('1');
 //         clearInterval(ds_sysmsg);
 //     }
 //     $.getJSON("/crm/msg_ajax.asp",
 //         function(data) {
 //             if (data.msg_id > 0) {
 //                 new_msg(data.msg_id);
 //             } else if (data.msg_id == '-1') {
 //                 clearInterval(ds_sysmsg);
 //                 console.log("closed stop msg");
 //             }
 //         })
 // };
 // var ds_sysmsg = setInterval(get_show_msg, 33000);
 /*document.addEventListener("visibilitychange", function() {
  if(document.hidden){
   clearInterval(ds_sysmsg);
  }else{
   ds_sysmsg = setInterval(get_show_msg,20000);
  }
 });*/
 function check_hd() {
     currentTime = new Date().getTime(); //更新当前时间
     if (currentTime - lastTime > timeOut) { //判断是否超时
         console.log("timeout for msg");
     } else {
         if ($('#msg_timeout').text() == '1') {
             console.log("restart msg");
             $('#msg_timeout').text('0')
             ds_sysmsg = setInterval(get_show_msg, 33000);
         }
     }
 }
 window.setInterval(check_hd, 33000);
 msg_top = $(window).height() - 42 - 215;
 msg_left = $(window).width() - 340;
 ck_width = $(window).width() * 0.8;
 ck_height = $(window).height() * 0.8;

 function new_msg(msg_id) {
     layer.open({
         id: '801' + msg_id,
         btn: ['<i class="fa fa-search"></i> 立即查看', '忽略'],
         type: 2,
         anim: 2,
         zIndex: 10000001,
         title: '新消息提醒',
         skin: 'new-msg',
         area: ['340px', '215px'],
         offset: [msg_top, msg_left],
         shade: 0,
         scrollbar: false,
         content: 'msg_show.asp?id=' + msg_id, //iframe的url
         yes: function(index) {
             $.dialog.open('msg_url.asp?id=' + msg_id, { title: '处理消息', width: ck_width, height: ck_height, fixed: true, lock: false });
             layer.close(index);
         }
     });
 }

 $("#layui-layim-new").on("click", function() {
     $(".layui-layim").toggle();
 });
 $("#layui-layim-no").on("click", function() {
     layer.tips("内部聊天功能未开启", $(this), {
         tips: [1, 'rgb(57, 57, 58)'],
         time: 5000
     });
 });