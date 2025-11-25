/*!
 * Cropper v3.0.0      修复于20231122
 */

layui.config({
    base: '../../layuiadmin/modules/' //layui自定义layui组件目录
}).define(['jquery','layer','cropper'],function (exports) {
    var $ = layui.jquery
        ,layer = layui.layer;  
    var html = "<link rel=\"stylesheet\" href=\"../../layuiadmin/modules/cropper.css\">\n" +
        "<link rel=\"stylesheet\" href=\"../../layuiadmin/style/fontawesome.all.min.css\">\n" +
        "<div class=\"layui-fluid showImgEdit\" style=\"display: none\">\n" +
        "    <div class=\"layui-form-item\">\n" +
        "        <div class=\"layui-input-inline layui-btn-container\" style=\"width: auto;\">\n" +
        "            <label for=\"cropper_avatarImgUpload\" class=\"layui-btn layui-btn-primary\">\n" +
        "                <i class=\"layui-icon\">&#xe67c;</i>选择图片\n" +
        "            </label>\n" +
        "            <input class=\"layui-upload-file\" id=\"cropper_avatarImgUpload\" type=\"file\" value=\"选择图片\" name=\"file\">\n" +
        "        </div>\n" +
        "        <div class=\"layui-form-mid layui-word-aux\"><span class=\"cropper-tip-text\">头像的尺寸限定150x150px,大小在50kb以内</span><span style=\"margin-left:8px;color:#FF5722;\">(可直接粘贴图片)</span></div>\n" +
        "    </div>\n" +
        "    <div class=\"layui-row layui-col-space15\">\n" +
        "        <div class=\"layui-col-xs9\">\n" +
        "            <div class=\"readyimg\" style=\"height:450px;background-color: rgb(247, 247, 247);\">\n" +
        "                <img src=\"\" >\n" +
        "            </div>\n" +
        "        </div>\n" +
        "        <div class=\"layui-col-xs3\">\n" +
        "            <div class=\"img-preview\" style=\"width:200px;height:200px;overflow:hidden\">\n" +
        "            </div>\n" +
        "        </div>\n" +
        "    </div>\n" +
        "    <div class=\"layui-row layui-col-space15\">\n" +
        "        <div class=\"layui-col-xs9\">\n" +
        "            <div class=\"layui-row\">\n" +
        "                <div style='flaot:left'>\n" +
        "                    <button type=\"button\" class=\"layui-btn\" title='向左旋转' cropper-event=\"rotate\" data-option=\"-15\" title=\"Rotate -90 degrees\"><span class=\"fa fa-undo-alt\"></span> </button>\n" +
        "                    <button type=\"button\" class=\"layui-btn\" title='向右旋转' cropper-event=\"rotate\" data-option=\"15\" title=\"Rotate 90 degrees\"><span class=\"fa fa-redo-alt\"></span></button>\n" +
        
       "                    <button type=\"button\" class=\"layui-btn\" cropper-event=\"moveleft\" title=\"向左移动\"><span class=\"fa fa-arrow-left\"></span></button>\n" +
       "                    <button type=\"button\" class=\"layui-btn\" cropper-event=\"moveright\" title=\"向左移动\"><span class=\"fa fa-arrow-right\"></span></button>\n" +
       "                    <button type=\"button\" class=\"layui-btn\" cropper-event=\"moveup\" title=\"向上移动\"><span class=\"fa fa-arrow-up\"></span></button>\n" +
       "                    <button type=\"button\" class=\"layui-btn\" cropper-event=\"movedown\" title=\"向下移动\"><span class=\"fa fa-arrow-down\"></span></button>\n" +
       "                    <button type=\"button\" class=\"layui-btn\" cropper-event=\"zoombig\" title=\"放大图片\" ><span class='fa fa-search-plus'></span></button>\n" +
       "                    <button type=\"button\" class=\"layui-btn\" cropper-event=\"zoomsmall\"  title=\"缩小图片\"><span class=\"fa fa-search-minus\"></span></button>\n" +
        "                    <button type=\"button\" class=\"layui-btn\" cropper-event=\"reset\" title=\"重置图片\"><span class=\"fa fa-sync-alt\"></span></button>\n" +
        "                </div>\n" +
        "            </div>\n" +
        "        </div>\n" +
        "        <div class=\"layui-col-xs3\">\n" +
        "            <button class=\"layui-btn layui-btn-fluid\" cropper-event=\"confirmSave\" type=\"button\"> 保存修改</button>\n" +
        "        </div>\n" +
        "    </div>\n" +
        "\n" +
        "</div>";
    var obj = {
        render: function(e){
            // 仅注入一次模板，避免多处调用重复插入导致ID/Class冲突
            if ($('.showImgEdit').length === 0) {
                $('body').append(html);
            }
            var self = this,
                elem = e.elem,
                saveW = e.saveW,
                saveH = e.saveH,
                mark = e.mark,
                area = e.area,
                url = e.url,
                done = e.done;
  
            var content = $('.showImgEdit')
                ,image = $(".showImgEdit .readyimg img")
                ,preview = '.showImgEdit .img-preview'
                ,file = $(".showImgEdit input[name='file']")
                , options = {aspectRatio: mark,preview: preview,viewMode:1};

            // 根据传入配置或默认规则设置提示文本
            var defaultTip;
            // 判断 mark 是否为有效的数字（不是 NaN）
            if (typeof mark === 'number' && !isNaN(mark) && mark !== null) {
                if (saveW && saveH) {
                    defaultTip = "尺寸限定" + saveW + "x" + saveH + "px,大小在50kb以内";
                } else {
                    defaultTip = "按固定比例裁切，建议控制图片大小在50kb以内";
                }
            } else {
                // mark 为 NaN、null、undefined 或其他值时，表示自由裁切
                defaultTip = "自由裁切，保存按选区尺寸输出，建议控制图片大小在50kb以内";
            }
            var tipText = e.tip || defaultTip;
            // 立即更新提示文本
            content.find('.cropper-tip-text').text(tipText);

            $(elem).on('click',function () {
                layer.open({
                    type: 1
                    , content: content
                    , area: area
                    , success: function () {
                        // 弹窗打开时再次更新提示文本，确保显示正确
                        content.find('.cropper-tip-text').text(tipText);
                        image.cropper(options);
                    }
                    , cancel: function (index) {
                        layer.close(index);
                        image.cropper('destroy');
                    }
                });
            });
            // 事件改为作用域绑定，避免影响全局其它 .layui-btn
            content.on('click',"[cropper-event]",function () {
                var event = $(this).attr("cropper-event");
                //监听确认保存图像
                if(event === 'confirmSave'){
                    image.cropper("getCroppedCanvas",{
                        width: saveW,
                        height: saveH
                    }).toBlob(function(blob){
                        var formData=new FormData();
                        formData.append('file',blob,'head.jpg');
                        $.ajax({
                            method:"post",
                            url: url, //用于文件上传的服务器端请求地址
                            data: formData,
                            processData: false,
                            contentType: false,
                            success:function(result){
                                if(typeof(result)=="string"){
                                    result=$.parseJSON(result);//转json20210418
                                }
                                return done( result)

                            }
                        });
                    });
                    //监听旋转
                }else if(event === 'rotate'){
                    var option = $(this).attr('data-option');
                    image.cropper('rotate', option);
                    //重设图片
                }else if(event === 'reset'){
                    image.cropper('reset');
                    //向左移动
                }else if(event === 'moveleft'){ 
                    image.cropper("move", -10, 0);
                    //向右移动
                }else if(event === 'moveright'){ 
                    image.cropper("move", 10, 0);
                    //向上移动
                }else if(event === 'moveup'){ 
                    image.cropper("move", 0, -10);
                    //向下移动
                }else if(event === 'movedown'){ 
                    image.cropper("move", 0, 10);
                    //放大
                }else if(event === 'zoombig'){ 
                    image.cropper('zoom',0.1);
                    //缩小
                }else if(event === 'zoomsmall'){ 
                    image.cropper('zoom',-0.1);
                }
            });
            // 文件选择（作用域绑定，防重复绑定）
            content.off('change', "input[name='file']").on('change', "input[name='file']", function () {
                var r= new FileReader();
                var f=this.files[0];
                r.readAsDataURL(f);
                r.onload=function (e) {
                    image.cropper('destroy').attr('src', r.result).cropper(options);
                };
            });
        }

    };





    var imgInputObj;//图片的input对象
    //获得粘贴板内容
    document.body.addEventListener('paste', function (event) {  
        
      imgInputObj=$(this);
      uploadclipboardDataImage(event);
    })

    // let pHtml = event.clipboardData.getData('text/html');  为获取网页内容部分20230306

    //上传粘贴板里的图片
    function uploadclipboardDataImage(event){ 
        if (!event || !event.clipboardData) return;
        let pText = event.clipboardData.getData('text/plain');
        if (pText) {//有文本内容的时候才是true   注意：空字符串''是false
            // showCVText(pText);
        } else if (event.clipboardData.items) {//没有文本内容，判断这个数组，文件可能在这个数组里
            let blob = null, items = event.clipboardData.items;
            for (let i = 0; i < items.length; i++) {
                if (items[i].kind === 'file') {//类型 是 文件
                    blob = items[i].getAsFile();
                    if (items[i].type.indexOf("image") !== -1) {//文件类型是图像
                        
                        showImage(blob);
                        // alert("图片")
                    } else if (items[i].type.indexOf("text") !== -1) {//文件类型是文本
                        // showText(blob);
                    }
                } 
            }
        } else {
            alert("粘了个寂寞");
        }
    }
 


    //显示复制过来的图片20240524
    function showImage(blob) {
        getContext(blob).then(res => { //图片数据能直接被img识别
           // console.log("res",res)

                var content = $('.showImgEdit')
                ,image = $(".showImgEdit .readyimg img")
                ,preview = '.showImgEdit .img-preview'
                ,file = $(".showImgEdit input[name='file']")
                , options = {aspectRatio: 1,preview: preview,viewMode:1};
                 image.cropper('destroy').attr('src', res).cropper(options);

        })
    }

 
    /**
     * 把字节转为web识别的base64格式数据
     * @param blob
     * @returns {Promise<unknown>}
     */
    function getContext(blob) {
        return new Promise((resolve) => {
            if (blob == null) resolve();
            let reader = new FileReader();
            reader.onload = function (event) {
                // console.log(event)
                resolve(event.target.result);
            }
            reader.readAsDataURL(blob);
        });
    }




    exports('croppers', obj);
});
