 
var nPageX=0,nPageY=0
$( document ).on( "mousemove", function( event ) {
	nPageX=event.pageX
	nPageY=event.pageY
	$( "#log" ).text( "pageX: " + event.pageX + ", pageY: " + event.pageY );
})

var rightClickObj
//普通栏目
function commonMenu(eobj,This,delUrl)
{
	rightClickObj=This
	
	if($("").length==0){
		var c="<div class=\"sysmenuwrap\"><a href=\"javascript:showEdit();\" target=\"_self\">编辑</a>"
		if(delUrl!=""){
			c+="<a href=\"javascript:window1abc('"+delUrl+"','delete content');\" target=\"_self\">删除</a>"
		}
		c+="<a href=\"javascript:;\" onClick=\"closeWindow();\" target=\"_self\">关闭</a></div>"
		$("body").prepend(c)	
	}
	$(".sysmenuwrap").hide().show('fast').css("left",nPageX).css("top",nPageY)
    
	eobj = eobj?eobj:event;
	eobj.returnValue=false;
	eobj.cancelBubble = true; 
	eobj.preventDefault();		//禁止ie本身动作
}
 

function closeWindow(){
	$(".sysmenuwrap").hide()
}
//编辑内容
function showEdit(){
	closeWindow();
	$(rightClickObj).dblclick();
}

//定义打开窗口
function window1abc(Url,Title){	 
	openWind(Url,'980','630',Title)
}

//打开窗口函数
function openWind(tourl,w,h,tit){

	  $.dialog({title:tit,width:w+'px',height:h+'px',content:'url:'+tourl,fixed:false}); 
	  var sClassName = "ee"
	  var sUrl = "",oDivView="";
	  switch(sClassName){
		case 'co2':
		  sUrl = "" 
		  sSty = "height: 25px;line-height: 25px;top: 38px;";
		  break;
		case 'co3':
		  sUrl = "" 
		  sSty = "height: 25px;line-height: 25px;top: 38px;";
		  break;
		case 'ee': 
		  sUrl = "" 
		  sSty = "height: 25px;line-height: 25px;top: 10px;"; 
		  break;
		default:
		  oDivView="";
		  break;
	  }
	 //当出错时，在新页打开
	 
  //fLoadIframe(document.getElementsByTagName("iframe")[0],oDivView);			//注释这个，要不出错20160201
}

 
 //放上去改变背景及文字颜色  onMouseMove="onColor(this,'#FDFAC6','')"
function onColor(root,bcolor,wcolor){
	root.style.color=wcolor	
	if(bcolor != "NO"){
		if(bcolor.indexOf(".")==-1){
			root.style.backgroundColor=bcolor
		}else{
			root.style.backgroundImage="url("+bcolor+")";
		}
	}
}
//离开改变背景及文字颜色  onMouseOut="offColor(this,'','')"
function offColor(root,bcolor,wcolor){
	root.style.color=wcolor
	if(bcolor.indexOf(".")==-1){
		root.style.backgroundColor=bcolor
	}else{
		root.style.backgroundImage="url("+bcolor+")";
	}
} 
// 获取URL中指定参数值20220430
function getUrlParam(url, name) { 
	url=url+"";
    var arr = url.split("?");
    name=name+"";//转字符
    if (arr.length > 1) {
        arr = arr[1].split("&");
        for (var i = 0; i < arr.length; i++) {
            var item = arr[i].split("=");
            if (item[0] == name){
                var splxx=item[1].split("#");
                if(splxx.length>1){
                    return splxx[0];
                }
                return item[1];
            } 
        }

    }
    return "";   
}
//刷新父页面20251109
function reloadTable(){
	// alert("刷新父页面")
	window.location.reload()
}
