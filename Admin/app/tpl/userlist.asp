<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_function.asp"--><!--#Include File = "../../admin_safe.Asp"-->
<!--#Include File = "merge.asp"--><%
'网站模板处理核心文件 xiyueta2023'

call openconn() 
dim num,page,stemp,sql1,sql,mysql,currentPage,perpage,page_count,i,n,sS,sHr,totalrec,id,title,isDebug,s,tplname,url,thisV
thisV=2  '当前页版本号'
isDebug=false  '调试为假，则不显示信息'

'获得当前版本号与账号，与服务器端匹配'
dim serverUrl,webinfo
webinfo=request.serverVariables("SERVER_NAME")
rs.open "select username,version,resurl,tplname from " & db_PREFIX & "website" ,conn,1,1
if not rs.eof then 
    webinfo=webinfo&"@"&rs("username")&"@"&rs("version")
    '服务器地址'
    serverUrl=rs("resurl")      '资源服务器地址'
    tplname=rs("tplname")        '当前使用模板名'
end if:rs.close
if serverUrl="" then serverUrl=getServerUrl()
 

' call echo("webinfo",webinfo)
' call echo("serverUrl",serverUrl)
' call die("end")

webinfo=escape(webinfo)'转码'


'获得服务器地址，并更新'
function getServerUrl()
    on error resume next
    dim c,url
    ' c="{resurl:'http://res/'}"
    c=gethttpurl("http://xiyueta.com/api/cms/?act=resurl&info="&webinfo,"utf-8")  '获得服务器对应资源地址'
    if instr(c,"{resurl:'")>0 then
        url=strcut(c,"{resurl:'","'}",0)
        if url<>"" then
            conn.execute("update " & db_PREFIX & "website set resurl='"& url &"'") '更新资源地址'            
        end if
    else        
        url="http://res/"    '提取服务器地址出错，就用本地测试的'
    end if
    getServerUrl=url
end function


'应用模板并运行动作'
function useTplAction(tplid,action)
    dim c,splstr,splxx,pagename,saction,s,res,url
    call createFolder("../../../tpl")      '创建TPL文件夹'
    url=serverUrl & "/api/tpl/action/?tplid="&tplid&"&info="&webinfo
    c=gethttpurl(url,"utf-8")
    if instr(c,"[$]")>0 then
        splxx=split(c,"[$]")
        if ubound(splxx)>=2 then
            call eerr("提示信息",c)
        end if
    end if
    if instr(c,"[,]")=false then
        call eerr(url,c)
    end if
    splstr=split(c,"[,]")
    for each s in splstr
        if instr(s,"[|]")>0 then
            splxx=split(s,"[|]")
            pagename=splxx(1)
            saction=splxx(2)
            res=splxx(3)
            if isDebug then call echo("pagename",pagename)'页名'
            if isDebug then call echo("saction",saction)'动作'
            if isDebug then call echo("res",res)'资源
            if pagename<>"" then
                call forActionList(tplid,action,pagename,saction)        
                call downServerRes(res)    
            end if
            if isDebug then call hr()
        end if
    next 


    dim webViewPic
    webViewPic="../../../tpl/" & tplid & "/" & tplid & ".jpg"
    if checkfile(webViewPic)=false then
        url=getServerUrl & "/uploadfiles/mb/" & tplid & ".jpg"
        if isDebug then call echo("下载缩浏图完成",webViewPic & " =>> "  & url)
        call saveRemoteFile(url,webViewPic) '下载网站的缩浏图'
    end if
	call echo("mergeCssStyle","mergeCssStyle")
    '处理css的style样式到一个文件里20240108'
    call mergeCssStyle(tplid)   '合并模块里的css样式20240108'

    if isDebug then 
        useTplAction = c
    else
        useTplAction = "完成，调试为假，不显示详细信息，可手动修改后查看回显信息"
    end if
end function
'下载服务器上的资源'
function downServerRes(res)
    dim splstr,s,filePath,url,msg
    splstr=split(res,vbcrlf)
    for each s in splstr
        if s<>"" then
            filePath="../../../" & s
            url=serverUrl & s
            filePath=handlePath(filePath)
            msg=""
            if checkfile(filePath) then
                msg=" &nbsp; <font color=red>本有存在，无需下载</font>"
            end if
            if isDebug then call echo("资源地址",url & " ==>> " & filePath & msg)
            if msg="" then
                call createDirFolder(filePath)'创建一组目录'
                call saveRemoteFile(url,filePath)
                if isDebug then call echo("下载资源成功",filePath)
            end if
        end if
    next
end function
'循环动作'
function forActionList(tplid,action,pagename,saction)
    dim splstr,splxx,s,c,filePath,html,did,row,parame,ascdesc,str,str1,str2,str3,str4,str5,testViewDir

    if action="view" then  '为查看是不要生成网站了'
        testViewDir=tplid & "/tpl/"
        call createDirFolder("../../../tpl/" & tplid) 
        call createDirFolder("../../../tpl/" & tplid & "/tpl") 
    end if 
    splstr=split(saction,vbcrlf)
    for each s in splstr
        s=trim(s)
        did="":row="":ascdesc="":str="":str1="":str2=""  '初始化为空内容'
        if s <>"" then
            did="":row=""
            if isDebug then call echo("s",s)
            parame=strCut(s,"{","}",0)
            if isDebug then call echo("parame",parame)
            if parame<>"" then
                s=replace(s,"{"& parame &"}","")
                parame=parame&","
                did=strCut(parame,"did:",",",0)
                row=strCut(parame,"row:",",",0)
                ascdesc=strCut(parame,"asc:",",",0)
                str=strCut(parame,"str:",",",0)
                str1=strCut(parame,"str1:",",",0)
                str2=strCut(parame,"str2:",",",0)
                str3=strCut(parame,"str3:",",",0)
                str4=strCut(parame,"str4:",",",0)
                str5=strCut(parame,"str5:",",",0)
                if isDebug then 
                    call echo("did",did)
                    call echo("row",row)
                    call echo("asc",ascdesc)
                    call echo("str",str)
                    call echo("str1",str1)
                    call echo("str2",str2)
                    call echo("str3",str3)
                    call echo("str4",str4)
                    call echo("str5",str5)
                end if
            end if
            if isDebug then call echo("s2",s)
            s=replace(s,vbtab," ")
            s=replace(s,"  "," ")
            s=replace(s,"  "," ")
            s=replace(s,"  "," ")
            splxx=split(s&"   "," ")
            c=c & getTplModle(testViewDir,splxx(0),splxx(1),splxx(2),did,row,ascdesc,str,str1,str2,str3,str4,str5) & vbcrlf
        end if
    next

    if action<>"view" then  '为查看是不要生成网站了' 
        filePath="../../../" & pagename
        if checkfile(filePath)=false then    '不存在调用默认模块'       
            if checkfile("../../../web/tpl.asp")=false then
                call die("默认模板页未找到，查看失败，请注意查看 =>> " & handlePath(filePath))
            end if
            html=readfile("../../../web/tpl.asp","utf-8")
        else
            html=readfile(filePath,"utf-8")
        end if
        splxx=split(html,"<body>")
        c=splxx(0) & "<body>" & vbcrlf & c & vbcrlf & "</body>" & vbcrlf &"</html>"

        call writetofile(filePath,c,"utf-8")
        if isDebug then call echo("生成网页",filePath)

    else
        '生成预览网页' 
        filePath="../../../tpl/" & tplid & "/" & pagename

        if checkfile(filePath)=false then    '不存在调用默认模块'     
            if checkfile("../../../web/tpl.asp")=false then
                call die("默认模板页未找到，应用失败，请注意查看 =>> " & handlePath(filePath))
            end if
            html=readfile("../../../web/tpl.asp","utf-8")
        else
            html=readfile(filePath,"utf-8")
        end if
        splxx=split(html,"<body>")
        c=splxx(0) & "<body>" & vbcrlf & c & vbcrlf & "</body>" & vbcrlf &"</html>"
        c=replace(c,"<body>","<body>" & vbcrlf & "<"&"% onAutoAddDataToAccess=false %"&">" & showThisWebAuthorInfo2022())    
        call writetofile(filePath,c,"utf-8")
        if isDebug then call echo("生成预览网页",filePath)

    end if 

end function
'显示当前网站作者信息'
function showThisWebAuthorInfo2022()
    dim content,splstr,s,c
    content=authorInfo2()
    c="console.log("""& replace(content,vbcrlf,"\n")  &""")"

    c="<script>"& c &"</script>"
    showThisWebAuthorInfo2022="<!--"& vbcrlf & content &"-->" & vbcrlf & c
end function

dim modleUrlList ' 记录模板请求的URL,重复的不要再提交，减少服务器请求'
'获得模块'
function getTplModle(testViewDir,sType,id,style,did,row,ascdesc,str,str1,str2,str3,str4,str5)
    dim fileName
    style=style & ""
    id=id&""
    if style="0" or style="1" then style=""
    if id="" then id="001"
    fileName=sType & "_" & id 
    if style<>"" then fileName=fileName & "_" & style
    '判断是否尾部追加.asp' 20220612
    if lcase(right(fileName,4))<>".asp" then
        fileName=fileName & ".asp"
    end if
    dim c,url 

    url=serverUrl & "/api/tpl/?type="& sType &"&id="& id &"&style=" & style& "&info="&webinfo
    if did<>"" then url=url & "&did="&escape(did)
    if row<>"" then url=url  & "&row="&row
    if ascdesc<>"" then url=url & "&asc="&ascdesc 
    if str<>"" then url=url & "&str="&escape(str)
    if str1<>"" then url=url & "&str1="&escape(str1)
    if str2<>"" then url=url & "&str2="&escape(str2)
    if str3<>"" then url=url & "&str3="&escape(str3)
    if str4<>"" then url=url & "&str4="&escape(str4)
    if str5<>"" then url=url & "&str5="&escape(str5)

    '之前获得了，就不要再请求了'
    if instr("【"& modleUrlList &"】","【"& url &"】")>0 then
        getTplModle="<!--#Include file = ""tpl/"& fileName &"""-->"
        exit function   '退出，'
    end if
    modleUrlList=modleUrlList & "【"& url &"】"   '添加模块URL列表'

    if isDebug then call echo("样式url",url)
    c=gethttpurl(url,"utf-8")
    call writetofile("../../../tpl/" & testViewDir & fileName,c,"utf-8")
    if isDebug then call echo("获得模板块",fileName)
    getTplModle="<!--#Include file = ""tpl/"& fileName &"""-->"
end function
  
'列表查询
If Request("act") = "list" Then
    dim updateusername,sListStr,splVersion
    ' call eerr("url",serverUrl & "/api/tpl/list/?info="&webinfo)
    sListStr=gethttpurl(serverUrl & "/api/tpl/list/?info="&webinfo&"&tplname="&tplname&"&thisv="& thisV &"&key="&escape(request("key"))&"&order="&escape(request("orderBy"))&"&page="&request("page"),"utf-8")

    '服务器地址错误时，重复获得地址，并更新资源地址'
    if instr(sListStr,"count"":")=false then
        serverUrl=getServerUrl()
        sListStr=gethttpurl(serverUrl & "/api/tpl/list/?info="&webinfo&"&key="&escape(request("key")),"utf-8")
    end if
    '更新当前账号与服务器账号一致'
    if instr(sListStr,"updateusername"":""")>0 then
        updateusername=strcut(sListStr,"updateusername"":""","""",0)
        if updateusername<>"" then
            conn.execute("update " & db_PREFIX & "website set username='"& updateusername &"'") '更新账号'  
        end if
    end if
    call die(sListStr)

elseIf Request("act") = "use" Then  '为使用模板'
    ' call useTplAction(request("tplid"),"use")  
    s= useTplAction(request("tplid"),"view")

    call useTpl2022("../../../",request("tplid"))
    call die(s)
elseIf Request("act") = "view" Then   '为查看模板，放到对应的目录 如 /tpl/TPL500'
    s= useTplAction(request("tplid"),"view")
    call die(s)
elseIf Request("act") = "myuser" Then  '获得用户信息20230819'
    sListStr=gethttpurl(serverUrl & "/api/tpl/user/?info="&webinfo,"utf-8")
    call die("{""info"": """& sListStr &""",""status"": ""y""}")

elseIf Request("act") = "editusername" Then  '获得用户信息20230819'
    
    url=serverUrl & "/api/tpl/user/?act=checkusername&info="&webinfo&"&username="&escape(request("username"))
    s=gethttpurl(url,"utf-8")
    ' call echo("s",s)
    ' call eerr("url",url)
    if left(s,4)="[OK]" then 
        rs.open "select username from " & db_PREFIX & "website" ,conn,1,3
        if not rs.eof then
            rs("username")=request("username")
            rs.update
        end if:rs.close
        call die("{""info"": ""修改成功"",""status"": ""y""}")
    else
        call die("{""info"": ""修改失败，域名对应的账号不正确"",""status"": ""n""}")
    end if

elseIf Request("act") = "update" Then  '更新模板程序20230823
    call updateTemplatePage()
End If 

function updateTemplatePage()
    dim updatePath
    updatePath="update.asp"
    if checkfile(updatePath)=false then
        url=serverUrl & "/api/tpl/update/?act=updatepage"
        ' call echo("url",url)
        call saveRemoteFile(url,updatePath)
    end if
    if checkfile(updatePath) then
        response.redirect("update.asp")
    end if


    call die("{""info"": ""更新模板完成"",""status"": ""y""}")
end function


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>模板列表</title>
<script type="text/javascript" src="../../js/jquery.js"></script><link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  />
<script type="text/javascript" src="../../layuiadmin/layui/layui.js"></script>
<style>
.layui-table-cell .layui-form-checkbox[lay-skin="primary"] {/*让列表选项位置上下居中 20230331*/
    top: 6px;
}
td .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {/*让列表选项位置上下居中 20230331*/
    top: 0px;
} 
.layui-table td .layui-table-cell {
   height: auto;
   line-height:80px;
}
</style>
</head>
<body style="padding:10px 6px 30px 6px;background: #FFF">  
  
 <div class="layui-form ">
 
 
  <div class="layui-inline">
      
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="date_min" placeholder="开始日期" autocomplete="off" class="layui-input date">
      </div>
      <div class="layui-input-inline">-</div>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="date_max" placeholder="结束日期" autocomplete="off" class="layui-input date">
      </div>
    </div>

    <div class="layui-inline" style="width:110px"> 
        <select name="orderBy">
        <option value="">选择排序</option> 
        <option value="hot" selected>热度</option> 
        <option value="sortrank">排序</option>  
        <option value="id">ID</option>  
        </select> 
    </div>
 
    <div class="layui-inline"> 
        <input class="layui-input" name="key" id="demoReload" autocomplete="off" placeholder="输入要查询的名称">
    </div>



      
  <button class="layui-btn" data-type="reload" id="btnsearch">搜索</button>
  <button class="layui-btn"  data-type="myuser" id="myuser"></button>
  <!-- <button class="layui-btn" onclick="showwin('添加信息','listform.asp?')">添加</button> -->
          <!-- <button class="layui-btn" data-type="batchdel">删除</button> -->

</div>
 

 <script type="text/html" id="barDemo">
<!--   <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> 
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>  -->

    {{#  if(d.usetplid == '1'){ }}
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="use"><i class="layui-icon layui-icon-app"></i>应该</a> 
     {{#  } else { }}
  <a class="layui-btn layui-btn-xs layui-btn-normal layui-btn-disabled"><i class="layui-icon layui-icon-dollar"></i>开通</a> 
    {{#  } }}

    {{#  if(d.usetplid == '1'){ }}
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="view"><i class="layui-icon layui-icon-template"></i>预览</a> 
     {{#  } else { }}
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="gotoview"><i class="layui-icon layui-icon-link"></i>演示</a> 
    {{#  } }}

    {{#  if(d.edittplid == '1'){ }}
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="customizecustomize"><i class="layui-icon layui-icon-set"></i>自定义</a>      {{#  } else { }}
  <a class="layui-btn layui-btn-xs layui-btn-normal layui-btn-disabled" ><i class="layui-icon layui-icon-set"></i>自定义</a>  
    {{#  } }}
</script>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
 
<script>
layui.use(['form','table'],function(){
    var form = layui.form
        table = layui.table; 

    //方法级渲染
    table.render({
        elem: '#demo',
        url: '?act=list',
        cols: [
            [
                // {type: 'checkbox', fixed: 'left'},
               { field: 'id', title: 'ID', width:70,sort: false }
               ,{ field: 'img', title: '缩览图', width:120, sort: false } 
               ,{ field: 'ahref', title: '模板ID', width:120, sort: false } 
               // ,{ field: 'pic', title: '预览', sort: false } 
               ,{ field: 'ntype', title: '类型', width:90, sort: false }
               ,{ field: 'title', title: '标题', sort: false }
               // ,{ field: 'sortrank', title: '排序', width:90, sort: false }
               , { fixed: 'right', title: '操作', width: 240, toolbar: '#barDemo' }
            ]
        ],
        id: 'testReload',
        page: true,
        limit: 20,
        done: function(res, curr, count) {
            // console.log(res)
            $("#myuser",).text("积分："+res.money)
            if(res.isUpdateTemplatePage!=undefined){ 
                layer.confirm('已经有新版模板更新程序，是否更新？', function(index) { 
                     layer.close(index);

var layerIndex = layer.msg('正在处理更新模板程序，请等待！', { icon: 16, time: false, shade: 0.8 });
                     $.ajax({
                        type: "POST",
                        cache: true,
                        dataType: "json",
                        url: "?act=update",
                        data: {  },
                        success: function(data) {
                            switch (data.status) {                                
                                case "y":
                                    layer.msg(data.info);
                                    location.reload();
                                    break;
                            }
                        }
                    });

                });
            }
            // alert("加载完成")
            // 表格加载完成后执行其他动作
            // res 为接口返回的数据
            // curr 为当前页码
            // count 为数据总数
            
            // 其他动作...
          }
    });



    //是否置顶
    form.on('switch', function(data){
        var index = layer.msg('修改中，请稍候',{icon: 16,time:false,shade:0.8});
        setTimeout(function(){
            var pid=data.elem.value
            layer.close(index);

            $.ajax({
                type: "POST",
                cache: true,
                dataType: "json",
                url: "?act=isthrough",
                data: { "id": pid,"isthrough":data.elem.checked }, 
                success: function(data) { 
                    switch (data.status) {
                        case "y": 
                            break;
                        case "n":                       
                            break;
                    }
                }
            });
            if(data.elem.checked){
                layer.msg("置顶成功！");
            }else{
                layer.msg("取消置顶成功！");
            }
        },500);
    })

    var $ = layui.$,
        active = {
            reload: function() {
                var demoReload = $('#demoReload');

                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        date_min: $('input[name=date_min]').val()
                        ,date_max: $('input[name=date_max]').val()
                        ,key: $('input[name=key]').val()
                        ,parentid: $('select[name=parentid]').val()
                        ,orderBy: $('select[name=orderBy]').val()
                    }

                });
            },batchdel: function(){
                //testReload为table渲染时改变的 id: 'testReload'
                var checkStatus = table.checkStatus('testReload')
                ,checkData = checkStatus.data; //得到选中的数据
                
                if(checkData.length === 0){
                   return layer.msg('请选择数据');
                }
                var idlist='';
                for(var i=0;i<checkData.length;i++){
                    if(idlist!='')idlist+=',';
                    idlist+=checkData[i].id;
                }              
                layer.confirm('确定删除吗？', function(index) {
                 
                     $.ajax({
                        type: "POST",
                        cache: true,
                        dataType: "json",
                        url: "?act=del",
                        data: { "id": idlist },
                        success: function(data) {
                            switch (data.status) {
                                case "y":
                                    table.reload('testReload');
                                    layer.msg('已删除');
                                    break;
                            }
                        }
                    });

                });
            },myuser: function(){                   
                 $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "json",
                    url: "?act=myuser", 
                    success: function(data) {
                        switch (data.status) {
                            case "y": 
                                var splxx=data.info.split("[$]");
                                if(splxx.length>=3){
                                    layer.open({
                                      title: '提示'
                                      ,content: splxx[1]
                                    });
                                    if(splxx.length>=4){
                                        $("#myuser",).text("积分："+splxx[2])
                                    }
                                }else{
                                    layer.msg(data.info);
                                } 
                                break;
                        }
                    }
                });

                
            } 
        };

    $('.layui-form .layui-btn').on('click', function() {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });


    //监听行工具事件
    table.on('tool(demo)', function(obj) {
        var data = obj.data;
        var pid = obj.data["id"]
        var tplid = obj.data["tplid"]
        if (obj.event === 'del') {
            layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'}, function(index) {
                $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "json",
                    url: "?act=del",
                    data: { "id": pid },
                    success: function(data) {
                        switch (data.status) {
                            case "y":
                                obj.del();
                                break;
                        }
                    }
                });
                layer.close(index);
            });
        }else if (obj.event === 'use') {
            layer.confirm('确定要使用此模板？',{icon:3, title:'提示信息'}, function(index) {
                var aTplHtml="<a href='/' style='color:red' target='_blank'>点击查看：/</a>"
                var winObj=layer.open({
                  title: '应用模板'
                  ,content: '正在应用当前选中模板，请等待！'
                });      

                $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "html",
                    url: "?act=use",
                    data: { "tplid": obj.data["tplid"] },
                    success: function(data) {  
                        var splxx=data.split("[$]");
                        if(splxx.length==3){
                            layer.open({
                              title: '提示'
                              ,content: splxx[1]
                            });  
                        }else{ 
                            layer.msg("处理应该模板完成。"+aTplHtml, {
                              icon: 1,
                              time: 4000 //2秒关闭（如果不配置，默认是3秒）
                            });
                        }
                    }
                });
                layer.close(index);
            });
        }else if (obj.event === 'view') {
            layer.confirm('确定要查看此模板？',{icon:3, title:'提示信息'}, function(index) {
                
                var aTplHtml="<a href='/tpl/"+tplid+"' style='color:red' target='_blank'>点击查看：/tpl/"+tplid+"</a>"
                var winObj=layer.open({
                  title: '预览模板'
                  ,content: "正在处理预览模板，请等待！"
                });  
                $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "html",
                    url: "?act=view",
                    data: { "tplid": obj.data["tplid"] },
                    success: function(data) { 
                        var splxx=data.split("[$]");
                        if(splxx.length==3){
                            layer.open({
                              title: '提示'
                              ,content: splxx[1]
                            });  
                        }else{
                        // layer.msg('查找模板成功' +tplid);
                            // window.open('/tpl/'+tplid,"xiyueta.com"+tplid)
                            layer.msg("处理预览模板完成。"+aTplHtml, {
                              icon: 1,
                              time: 4000 //2秒关闭（如果不配置，默认是3秒）
                            });
                        }
                    }
                });
                layer.close(index);
            });
        }else if (obj.event === 'gotoview') {//预览
            window.open('http://www.xiyueta.com/tpl/'+tplid,"xiyueta.com")

        } else if (obj.event === 'edit') {
            showwin('修改信息', 'listform.asp?id=' + pid)
        } else if (obj.event === 'edit2') {
            showwin('修改信息', 'listform.asp?editor=no&id=' + pid)
            
        } else if (obj.event === 'customizecustomize') {
            showwin('自定义', 'userform.asp?editor=no&tplid=' + tplid)
            
        } else if (obj.event === 'editusername') {
            layer.prompt({
                formType: 1,
                title: '输入网站对应的账号'
            }, function(value, index) {
                layer.close(index);
                $.ajax({
                    type: "POST",
                    cache: true,
                    dataType: "json",
                    url: "?act=editusername",
                    data: { "username":value }, 
                    success: function(data) { 
                        switch (data.status) {
                            case "y":                                                    
                                layer.msg(data.info,{icon:1});
                                $("#btnsearch").click();//刷新列表
                                break;
                            case "n":                                    
                                layer.msg(data.info,{icon:2});
                                break;
                        }
                    }
                });
            });



        }

    });


    //监听单元格编辑
    table.on('edit(demo)', function(obj){
      var value = obj.value //得到修改后的值
      ,data = obj.data //得到所在行所有键值
      ,field = obj.field; //得到字段
      var thisObj=obj
      $.ajax({
                type: "POST",
                cache: true,
                dataType: "json",
                url: "?act=onlineedit&id="+data.id,
                data: { "title":  value  },
                success: function(data) {
                    switch (data.status) {
                        case "y": 
                        layer.msg(data.info, {icon: 1});
                            break;
                        case "n": 
                        layer.msg(data.info, {icon: 2}); 
                            break;
                    }
                }
            }); 
    });



});
</script>


<script type="text/javascript" src="../../js/pc.js"></script>	

</body>

</html>
