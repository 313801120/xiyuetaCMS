

/*   20220726
sList：  操作字符列表 如   aa|11,bb|22
didFocus: 查的大类名
nFocus:   定位子类的位置
sValue：  定位的子类值
如：updateStrArray(sList, "建安B", 1, "abc")
*/
function updateStrArray(sList, didFocus, nFocus, sValue, sType) {
    var c = "";
    sType=sType+"";
    var isDel = false; 
    sList=sList+"";//转字符
    var splstr = sList.split(",");
    for (var i = 0; i < splstr.length; i++) {
        var sItem = splstr[i];
        if (sItem != "") {
            var splxx = sItem.split("|")
            var did = splxx[0];
            var isDel = false;
            if (did == didFocus) {
                
                if (sType == "del") {
                    isDel = true;
                }else if(sType=="check"){//为查找则返回
                    return true;
                }else if(sType=="get"){//获得值
                    if(splxx.length<nFocus)return "";
                    return splxx[nFocus];
                }else{//替换
                    if (splxx.length >= nFocus) {
                        splxx[nFocus] = sValue;
                    }
                }
            }
            if (isDel == false) {
                var cItem = "";
                for (var j = 0; j < splxx.length; j++) {
                    if (cItem != "") cItem += "|";
                    cItem += splxx[j];
                }
                if (c != "") c += ","
                c += cItem;
            }
        }
    }
    if(sType=="check"){
        return false;
    }else if(sType=="get"){
        return "";
    }
    return c;
}
//删除指定的大类名
function deleteStrArray(sList, didFocus) {
    return updateStrArray(sList, didFocus, 1, '',"del");
}
//检测指定的大类名
function checkStrArray(sList, didFocus) {
    return updateStrArray(sList, didFocus, 1, '',"check");
}
//获得指定的大类名
function getStrArray(sList, didFocus,nFocus) {
    if(nFocus==undefined)nFocus=1;//默认为1
    return updateStrArray(sList, didFocus, nFocus, '',"get");
}
//测试
// var sList = ",建安B|2022/07/25,中国|123,"
// console.log(sList)
// console.log("建安B",checkStrArray(sList, "建安B"))
// console.log("测试",checkStrArray(sList, "测试"))
// sList=updateStrArray(sList, "中国", 1, "abc"); 
// console.log(sList)
// sList=updateStrArray(sList, "建安B", 1, "11111"); 
// console.log(sList)


//处理证书的大类时间20220825
function handleZhenShuDidTime(didlist,timelist){
  var c='';
  var array=didlist.split(", ")
  array.forEach(function(did,i) {
    var time1=getStrArray(timelist, did, 1);
    var time2=getStrArray(timelist, did, 2); 
    if(c!="")c+="<hr>"; 
    c+='证书：'+did + "<br>资格证签发时间："+time1+"<br>证书有效截止时间："+time2
  });
  document.write(c)
} 
//处理安全类的大类时间20220825
function handleAnquanDidTime(didlist,timelist){
  var c='';
  var array=didlist.split(", ")
  array.forEach(function(did,i) {
    var time1=getStrArray(timelist, did, 3); 
    if(c!="")c+="<hr>"; 
    c+='安全类：'+did + "<br>安全B证截止时间："+time1 
  });
  document.write(c)
}

