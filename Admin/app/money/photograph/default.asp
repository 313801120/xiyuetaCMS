<!--#include file="../../../../inc/Config.asp"--><!--#Include File = "../../../admin_function.Asp"--><!--#Include File = "../../../admin_safe.Asp"--><% 
call openconn() 
 
if request("act")="uploadbase64Images" then
    call die(uploadbase64Images())
end if
'上传base64图片 
function uploadbase64Images()
    call openconn()
    dim imgDate,dirPath ,imgFile 
    imgDate=request("imgDate") 
    dirPath="/UploadFiles/photograph/"
    call createDirFolder(dirPath)
    imgFile=dirPath & format_Time(now(),6) & ".jpg" 

    uploadbase64Images=imgFile
    call base64ToImages(imgFile,imgDate)  '保存图片  
end function


' 1. HD（1280 x 720）：这是一种低分辨率，适用于入门级和部分中端手机。
' 2. Full HD（1920 x 1080）：这是目前最常见的手机分辨率，提供了更清晰和细腻的显示效果。
' 3. Quad HD（2560 x 1440）：也称为2K分辨率，它比Full HD更高，可以提供更高质量和更丰富的视觉体验。
' 4. Ultra HD/4K（3840 x 2160）：这是当前最高级别的手机分辨率，具有极高的清晰度和细节展示能力。
' 4608*3456  4608*3456  4096*2160 1080*720
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>打开网络摄像头 拍照</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?9e75428c7b3992dd93bd71098a1f9dc3";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
    </script>
    <script src="../../../layuiadmin/layui/layui.js"></script>
<script src="../../../js/jquery.js"></script>
    <link rel="stylesheet" href="../../../layuiadmin/layui/css/layui.css">
</head>

<body>
    <div class="layui-form ">
        <div class="layui-inline">
            <button onclick="startOrStop();" id="startSXT" style="padding-right:4px;">
                <div>
                    <img src="images/start.svg" style="height:24px;padding:4px"><span>开启摄像头</span>
                </div>
                <div style="display:none;">
                    <img src="images/stop.svg"><span>关闭摄像头</span>
                </div>
            </button>
            <button onclick="paizhao();" id="pai" style="padding-right:4px;" disabled><img src="images/pai.svg" style="height:24px;padding:4px">拍照</button>
            <button onclick="zhuahuan();" id="zhuahuan" style="padding-right:4px;" disabled><img src="images/zhuahuan.svg" style="height:24px;padding:4px">切换摄像头</button>
        </div>
        <div class="layui-inline">
            <select name="fenbianlu">
                <option value="">选择分辨率</option>
                <option value="1280x720" selected>HD（1280 x 720）</option>
                <option value="1920x1080">Full HD（1920 x 1080）</option>
                <option value="2560x1440">Quad HD（2560 x 1440）</option>
                <option value="3840x2160">Ultra HD/4K（3840 x 2160）</option>
                <option value="300x100">（300 x 100）</option>
            </select>
        </div>
    </div>
    <video onclick="" style="width:300px;height:200px" id="video" controls autoplay></video>
    <canvas id="canvas" style="border: 1px solid red;width:300px;height:200px"></canvas>
    <script>
    //加载
    $(function() {
        var currentUrl = location.href;
        https = currentUrl.substr(0, 5)
        console.log(currentUrl, https);
        if (https != "https") {
            var url = "https" + currentUrl.substr(4)
            console.log('url', url)
            alert("拍照要以https打头，现在跳转到" + url)
            window.location.href = url;
        }
        $("#startSXT").click();//点击开启摄像头
    })

    function paizhao() {
        var canvas = document.getElementById('canvas');
        var canvasContext = canvas.getContext('2d');
        var video = document.querySelector('video');
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
 
        canvasContext.drawImage(video, 0, 0, canvas.width, canvas.height);
        savePhoto();
    }


    //保存图片
    function savePhoto() {
        var canvas = document.getElementById('canvas');
        var canvasContext = canvas.getContext('2d');
        var video = document.querySelector('video');

        $.ajax({
            url: '?act=uploadbase64Images',
            type: 'POST',
            data: {
                'imgDate': canvas.toDataURL('image/jpeg')
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                //alert(XMLHttpRequest)
                //alert(textStatus)
                //alert(errorThrown)
            },
            success: function(result) { 
                window.parent.getPaiZhaoImg(result)
                $("body").append("<img src='" + result + "'>");


            }
        });
    }

    navigator.getUserMedia = (navigator.getUserMedia ||
        navigator.webkitGetUserMedia ||
        navigator.mozGetUserMedia ||
        navigator.msGetUserMedia);

    var webcamStream; //网站拍照对象
    var cameraState = "stop"; //摄像头状态，默认为stop
    var cfgFacingMode = ''; //默认开启前置摄像头 ，environment为后置摄像头
    //切换摄像头
    function zhuahuan() {
        cfgFacingMode = cfgFacingMode == "environment" ? "" : "environment";
        if (webcamStream) stopWebcam(); //关闭摄像头
        startWebcam(); //打开摄像头
    }
    //打开或关闭摄像头
    function startOrStop() {
        $("#startSXT div").hide();
        if (cameraState == "start") {
            $("#startSXT div:eq(0)").show();
            $("#pai,#zhuahuan").attr("disabled", true);
            if (webcamStream) stopWebcam(); //关闭摄像头
        } else {
            $("#startSXT div:eq(1)").show();
            $("#pai,#zhuahuan").attr("disabled", false);
            startWebcam(); //打开摄像头
        }
        cameraState = cameraState == "stop" ? "start" : "stop";
        console.log("cameraState", cameraState)
    }
    //开启摄像头
    function startWebcam() {
        if (navigator.getUserMedia) {
            console.log("toto", navigator.getUserMedia);
            var idealW,idealH
            var sVal = $("select[name='fenbianlu']").val()
            if(sVal!=""){
                var splxx=sVal.split("x");
                idealW=splxx[0]
                idealH=splxx[1]
            } 
            navigator.getUserMedia(

                // constraints
                {
                    video: {
                        //4608*3456  4608*3456  4096*2160 1080*720
                        width: { ideal: idealW },
                        height: { ideal: idealH },

                        facingMode: cfgFacingMode
                    },
                    audio: false
                    // ,facingMode: 'environment'  //开启前置摄像头无效
                },

                // successCallback
                function(localMediaStream) {
                    var video = document.querySelector('video');
                    //原因是 Chrome 升级后，新版本不再支持该用法。
                    // video.src = window.URL.createObjectURL(localMediaStream);  
                    video.srcObject = localMediaStream;
                    webcamStream = localMediaStream;
                    console.log('localMediaStream', localMediaStream)
                },

                // errorCallback
                function(err) {
                    console.log("The following error occured: " + err);
                }
            );
        } else {
            console.log("getUserMedia not supported");
            alert("不支持getUserMedia")
        }
    }
    //停止拍照
    function stopWebcam() {
        if (webcamStream) {
            webcamStream.getTracks().forEach(function(track) {
                track.stop();
            });
            console.log('摄像头已关闭');
        }
    }
    </script>
</body>

</html>