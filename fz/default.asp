<!--#Include file = "../inc/config.Asp"-->
<%
dim url
'http://work.xiyueta.com/detail.asp?id=0'
url="http://www.cnzhongchao.cn/"  
%>
<script type="text/javascript" src="/js/jquery.js"></script>
<!-- <script type="text/javascript" src="/app/dist/xiyueta.min.js"></script> -->
<script src="/app/src/common.js?"></script>
<script src="/app/src/xiyueta.js?"></script>
<script src="/app/src/xiyueta.more.js?"></script>
<script src="/app/src/xiyueta.debug.js?"></script>
<script src="/app/src/xiyueta.css.js?"></script>
<script src="/app/src/url.js?"></script>
<script src="/app/src/handle.js?"></script>
<script src="/app/src/tpl.js?"></script>
<input name="httpurl" type="text" id="httpurl" value="<%=url%>" size="30" />
<input type="button" name="button" id="button" value="下载网址" onclick="downWeb()" />
<div>
    <textarea name="htmlSource" id="htmlSource" cols="45" rows="5"></textarea>
</div>
<div>
    <textarea name="htmlResult" id="htmlResult" cols="45" rows="5"></textarea>
</div>
<script>
var defaultFileName = "default"; //默认文件名 



var htmlUrlList = ""; //html文件列表
var cssUrlList = ""; //css文件列表
var jsUrlList = ""; //js文件列表
var imageUrlList = ""; //image文件列表

var downUrlList = ""; //下载网址列表
var nDownCount = 0; //下载总数

var webDir = "./web/"
var webImageDir = "images/"
var webCssDir = "css/"
var webJsDir = "js/"

function downWeb() {
    var httpurl = jQuery("#httpurl").val();
    jQuery.ajax({
        url: 'action.asp?act=getConfig',
        type: 'POST',
        data: {
            'httpurl': httpurl,
            'webDir': webDir
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest)
            alert(textStatus)
            alert(errorThrown)
        },
        success: function(result) {
            xiyueta.config({urlToNameList:result});            
            handleDownWeb(httpurl);
        }
    });


}

// '下一个下载'
function nextDown() {
    nDownCount++;

    var splstr = cssUrlList.split("\n");
    for (var i = 0; i < splstr.length; i++) {
        var s = splstr[i];
        var splxx = s.split("|")
        // console.log("提醒",downUrlList,"sss",splxx[0])
        if (("|" + downUrlList + "|").indexOf("|" + splxx[0] + "|") == -1) {
            downUrlList += splxx[0] + "|"
            // alert(splxx[0] + " 处理中")
            handleDownWeb(splxx[0], "css");
            return false;
        }
    }
    if (("|" + downUrlList + "|").indexOf("|图片|") == -1) {
        downUrlList += "图片|"
        downImges(imageUrlList); //下载图片    
        console.log("下载图片", imageUrlList)
        return false;
    }
    if (("|" + downUrlList + "|").indexOf("|js文件|") == -1) {
        downUrlList += "js文件|"
        downJs(jsUrlList); //保存JS文件  
        return false;
    }


    alert("结束")
    console.log("结束，完成！")


}
//处理下载
function handleDownWeb(httpurl, sType) {
    jQuery.ajax({
        url: 'action.asp?act=getHttpurl',
        type: 'POST',
        data: {
            'httpurl': httpurl,
            'webDir': webDir,
            'webImageDir': webImageDir,
            'webCssDir': webCssDir,
            'webJsDir': webJsDir
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest)
            alert(textStatus)
            alert(errorThrown)
        },
        success: function(result) {
            jQuery("#htmlSource").val(result)
            if (sType == "css") {
                alert("正在处理CSS块")
                handleCss(httpurl, result); //处理CSS内容
            } else {
                htmlUrlList = httpurl; //html网址
                handlePageHtml(httpurl, result); //处理网页html
            }
        }
    });
}

function handlePageHtml(httpurl, html) {
    xiyueta.load(html);
    xiyueta.config({ jsdir: webJsDir, cssdir: webCssDir, imagesdir: webImageDir }); //设置配置文件
    xiyuetaCSS.config(xiyueta.config()); //CSS部分


    console.log("-------------- 提取CSS文件 --------------");
    //获得CSS链接网址 
    xiyueta("link[rel|NOUL=stylesheet]").each(function(i, obj) {
        var url = xiyueta(this).attr("href");
        if (url != "" && url != undefined) {
            url = xiyueta.fullurl(httpurl, url); //完整网址
            var fileName = xiyueta.getUrlToFileName(url, "css");
            xiyueta(this).attr("href", webCssDir + fileName); //替换 
            if (("\n" + cssUrlList + "|").indexOf("\n" + url + "|") == -1) {
                if (cssUrlList != "") cssUrlList += "\n";
                cssUrlList += url + "|" + webDir + webCssDir + fileName + "|css";
            }
        }
    })

    console.log("-------------- 提取JS文件 --------------");
    //获得JS链接网址
    xiyueta("script").each(function(i, obj) {
        var url = xiyueta(this).attr("src");
        if (url != "" && url != undefined) {
            url = xiyueta.fullurl(httpurl, url); //完整网址
            var fileName = xiyueta.getUrlToFileName(url, "js");
            xiyueta(this).attr("src", webJsDir + fileName); //替换 
            if (("\n" + jsUrlList + "|").indexOf("\n" + url + "|") == -1) {
                if (jsUrlList != "") jsUrlList += "\n";
                jsUrlList += url + "|" + webDir + webJsDir + fileName + "|js";
            }
        }
    })

    console.log("-------------- 提取网页图片 --------------");
    //获得Img链接网址               
    xiyueta("img").each(function(i, obj) {
        var url = xiyueta(this).attr("src");
        if (url != "" && url != undefined) {
            url = xiyueta.fullurl(httpurl, url); //完整网址
            var fileName = xiyueta.getUrlToFileName(url, "image");
            xiyueta(this).attr("src", webImageDir + fileName); //替换 
            if (("\n" + imageUrlList + "|").indexOf("\n" + url + "|") == -1) {
                if (imageUrlList != "") imageUrlList += "\n";
                imageUrlList += url + "|" + webDir + webImageDir + fileName + "|img";
            }
        }
    })


    console.log("-------------- 提取网页元素背景图片 --------------");
    //处理网页里面的stle部分    处理这种  <a style="background-image:url(1.jpg)">
    var item = xiyueta("*").item("style")
    for (let i = 0; i <= item.length - 1; i++) {
        if (item[i].value != undefined) {
            xiyuetaCSS().parse("aa{" + item[i].value + "}"); //解析css
            xiyuetaCSS.config({ parentdir: "" }); //css里不需要../

            var splstr = xiyuetaCSS("(all)").getsrc("server=" + httpurl).split(",");
            for (var j = 0; j < splstr.length; j++) {
                var url = splstr[j];
                if (url != "") {
                    if (("\n" + imageUrlList + "|").indexOf("\n" + url + "|") == -1) {
                        if (imageUrlList != "") imageUrlList += "\n";
                        var fileName = xiyueta.getUrlToFileName(url, "image");
                        imageUrlList += url + "|" + webDir + webImageDir + fileName + "|img";
                    }
                }
            }
            xiyuetaCSS("(all)").setsrc("server=" + httpurl);//让网址完整
            xiyuetaCSS("(all)").setsrc("dir=" + webImageDir)

            var s = xiyuetaCSS().print().trim();
            xiyueta({ 'x': item[i].x, 'y': item[i].y }).attr("style", s.substr(3, s.length - 4)); //替换  去除两边空格                

        }
    }


    console.log("-------------- 提取网页Style背景图片 --------------");
    //处理网页里面的stle部分    处理这种  <a style="background-image:url(1.jpg)">
    var item = xiyueta("style").item();
    for (let i = 0; i <= item.length - 1; i++) {
        var sCss = xiyueta(item[i]).html();
        if (sCss != undefined) {
            xiyuetaCSS().parse(sCss); //解析html 
            xiyuetaCSS.config({ parentdir: "" }); //网页style里的CSS样式不需要../
            c = xiyuetaCSS("(all)").getsrc("server=" + httpurl);
            if (c != undefined) {
                var splstr = c.split(",");
                for (var j = 0; j < splstr.length; j++) {
                    var url = splstr[j];
                    if (url != "") {
                        if (("\n" + imageUrlList + "|").indexOf("\n" + url + "|") == -1) {
                            if (imageUrlList != "") imageUrlList += "\n";
                            var fileName = xiyueta.getUrlToFileName(url, "image");
                            imageUrlList += url + "|" + webDir + webImageDir + fileName + "|img";
                        }
                    }
                }
                xiyuetaCSS("(all)").setsrc("server=" + httpurl);//让网址完整
                xiyuetaCSS("(all)").setsrc("dir=" + webImageDir)
                var c = xiyuetaCSS().print().trim();
                xiyueta({ 'x': item[i].x, 'y': item[i].y }).html(c); //替换HTML                
            }
        }
    }

    console.log("-------------- 提取A链接 --------------");
    //获得CSS链接网址 
    xiyueta("a").each(function(i, obj) {
        var url = xiyueta(this).attr("href");
        url = (url + "").trim()
        if (url.substr(0, 4) != "tel:" && url.substr(0, 4) != "sms:" && url.substr(0, 7) != "mailto:" && url.substr(0, 11) != "javascript:" && url.substr(0, 1) != "#" && url != "" && url != undefined) {
            url = xiyueta.fullurl(httpurl, url); //完整网址
            if (url != "") {
                if (("\n" + htmlUrlList + "\n").indexOf("\n" + url + "\n") == -1) {
                    if (htmlUrlList != "") htmlUrlList += "\n";
                    htmlUrlList += url;
                }
                var fileName = xiyueta.getUrlToFileName(url, "html");
                xiyueta(this).attr("href", fileName); //替换 
                xiyueta(this).removeAttr("target"); //删除target 暂时用下
            }
        }
    });

    console.log("-------------- 保存html网页 --------------");
    var fileName = xiyueta.getUrlToFileName(httpurl, "html");

    jQuery.ajax({
        url: 'action.asp?act=saveWebPage',
        type: 'POST',
        data: {
            'webDir': webDir,
            'httpurl': httpurl,
            'urlFileType': "html",
            'filePath': webDir + fileName,
            'content': xiyueta.html()
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest)
            console.log(textStatus)
            console.log(errorThrown)
        },
        success: function(result) {
            alert(result)
            nextDown(); //下一个下载
        }
    });


    console.log("保存网页 " + fileName);

    console.log("cssUrlList", cssUrlList);
    console.log("jsUrlList", jsUrlList);
    console.log("imageUrlList", imageUrlList);
    console.log("htmlUrlList", htmlUrlList);
}
//处理css内容
function handleCss(httpurl, cssBody) {
    xiyuetaCSS.load(cssBody);
    xiyuetaCSS.config(xiyueta.config()); //CSS部分
    var c = xiyuetaCSS("(all)").getsrc("server=" + httpurl);
    var splstr = c.split(",");

    console.log("-------------- 下载CSS图片 --------------");
    for (var i = 0; i < splstr.length; i++) {
        var url = splstr[i];
        if (url != "") {
            var fileName = xiyueta.getUrlToFileName(url, "image");
            if (("\n" + imageUrlList + "|").indexOf("\n" + url + "|") == -1) {
                if (imageUrlList != "") imageUrlList += "\n";
                imageUrlList += url + "|" + webDir + webImageDir + fileName + "|img";
            }
        }
    }

    for (let i = 0; i < $css("@import").length; i++) {
        var url = $css("@import").eq(i).html();

        url = xiyueta.fullurl(httpurl, url); //完整网址
        if (url != "") {
            console.log("css内导入css文件", url)
            var fileName = xiyueta.getUrlToFileName(url, "css");
            if (("\n" + cssUrlList + "|").indexOf("\n" + url + "|") == -1) {
                if (cssUrlList != "") cssUrlList += "\n";
                cssUrlList += url + "|" + webDir + webCssDir + fileName + "|css";
            }
        }
        $css("@import").eq(i).html(fileName); //替换
    }

    console.log("-------------- 保存css文件 --------------");

    xiyuetaCSS("(all)").setsrc("server=" + httpurl);//让网址完整
    xiyuetaCSS("(all)").setsrc("dir=../" + webImageDir)
    var fileName = xiyueta.getUrlToFileName(httpurl, "css");
    var filePath = webDir + webCssDir + fileName;

    jQuery.ajax({
        url: 'action.asp?act=saveWebPage',
        type: 'POST',
        data: {
            'webDir': webDir,
            'httpurl': httpurl,
            'urlFileType': "css",
            'filePath': webDir + webCssDir + fileName,
            'content': xiyuetaCSS.html()
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest)
            alert(textStatus)
            alert(errorThrown)
        },
        success: function(result) {
            alert(result)
            nextDown(); //下一个下载
        }
    });
}


function downImges(imageUrlList) {
    jQuery.ajax({
        url: 'action.asp?act=downImges',
        type: 'POST',
        data: {
            'webDir': webDir,
            'imageUrlList': imageUrlList
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest)
            console.log(textStatus)
            console.log(errorThrown)
        },
        success: function(result) {
            alert(result)
            nextDown(); //
        }
    });
}

function downJs(jsUrlList) {
    jQuery.ajax({
        url: 'action.asp?act=downJs',
        type: 'POST',
        data: {
            'webDir': webDir,
            'jsUrlList': jsUrlList
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest)
            alert(textStatus)
            alert(errorThrown)
        },
        success: function(result) {
            alert(result)
            nextDown(); //
        }
    });
}
</script>