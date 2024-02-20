function killerrors() {
    return true
}
	 
window.onerror = killerrors;
var searchReq = createAjaxObj();

function createAjaxObj() {
    var httprequest = false;
    if (window.XMLHttpRequest) {
        httprequest = new XMLHttpRequest();
        if (httprequest.overrideMimeType) {
            httprequest.overrideMimeType("text/xml")
        }
    } else {
        if (window.ActiveXObject) {
            try {
                httprequest = new ActiveXObject("Msxml2.XMLHTTP")
            } catch(e) {
                try {
                    httprequest = new ActiveXObject("Microsoft.XMLHTTP")
                } catch(e) {}
            }
        }
    }
    return httprequest
}

function CheckAll(thisform) {
    for (var i = 0; i < thisform.elements.length; i++) {
        var e = thisform.elements[i];
        if (e.Name != "chkAll" && e.disabled != true) {
            e.checked = thisform.chkAll.checked
        }
    }
}

function createXmlHttp() {
    xmlHttp = false;
    if (window.ActiveXObject) {
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP")
        } catch(e) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")
        }
    } else {
        if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest()
        }
    }
}

function setCookie(name, value) {
    var Days = 1;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString()
}

function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg)) {
        return unescape(arr[2])
    } else {
        return null
    }
}

function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) {
        document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString()
    }
}

function createxmlhttp() {
    xmlhttpobj = false;
    try {
        xmlhttpobj = new XMLHttpRequest
    } catch(e) {
        try {
            xmlhttpobj = new ActiveXObject("MSXML2.XMLHTTP")
        } catch(e2) {
            try {
                xmlhttpobj = new ActiveXObject("Microsoft.XMLHTTP")
            } catch(e3) {
                xmlhttpobj = false
            }
        }
    }
    return xmlhttpobj
}

function getarea(jinke_diqu) {
    if (jinke_diqu == 0) {
        document.getElementById("squarediv").innerHTML = "<select name='squares' class='int'><option value='' selected>请选择</option></select>";
        return
    }
    var xmlhttpobj = createxmlhttp();
    if (xmlhttpobj) {
        xmlhttpobj.open("GET", "/crm/inc.isok.asp?action=area&jinke_diqu=" + escape(jinke_diqu) + "&number=" + Math.random() + "", true);
        xmlhttpobj.onreadystatechange = function() {
            if (xmlhttpobj.readyState == 4) {
                if (xmlhttpobj.status == 200) {
                    var ResponseText = xmlhttpobj.responseText;
                    if (ResponseText == "") {
                        document.getElementById("squarediv").innerHTML = ResponseText
                    } else {
                        document.getElementById("squarediv").innerHTML = ResponseText
                    }
                } else {
                    document.getElementById("squarediv").innerHTML = "读取错误"
                }
            } else {
                document.getElementById("squarediv").innerHTML = "正在加载..."
            }
        };
        xmlhttpobj.send(null)
    } else {
        document.getElementById("squarediv").innerHTML = "浏览器不兼容"
    }
}

function getsquare(str) {
    document.getElementById("square").value = str.value
}
function gettrade(tradedata) {
    if (tradedata == 0) {
        document.getElementById("stradediv").innerHTML = "<select name='strades' class='int'><option value='' selected>请选择</option></select>";
        return
    }
    var xmlhttpobj = createxmlhttp();
    if (xmlhttpobj) {
        xmlhttpobj.open("GET", "/crm/inc.isok.asp?action=trade&tradedata=" + escape(tradedata) + "&number=" + Math.random() + "", true);
        xmlhttpobj.onreadystatechange = function() {
            if (xmlhttpobj.readyState == 4) {
                if (xmlhttpobj.status == 200) {
                    var ResponseText = xmlhttpobj.responseText;
                    if (ResponseText == "") {
                        document.getElementById("stradediv").innerHTML = ResponseText
                    } else {
                        document.getElementById("stradediv").innerHTML = ResponseText
                    }
                } else {
                    document.getElementById("stradediv").innerHTML = "读取错误"
                }
            } else {
                document.getElementById("stradediv").innerHTML = "正在加载..."
            }
        };
        xmlhttpobj.send(null)
    } else {
        document.getElementById("stradediv").innerHTML = "浏览器不兼容"
    }
}


function guanbi(){
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭 
}