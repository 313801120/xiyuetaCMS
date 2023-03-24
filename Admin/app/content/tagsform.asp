<!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.Asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<% 
call openconn()  
dim msg,isTrue,addSql,id,parentid,columnName,columnEnName,isthrough,sortrank,columnType,bodycontent,splstr,splxx,s,sel,flags,httpUrl,bannerImage,filename,webtitle,webkeywords,webdescription,smallimage,aboutcontent

id=request("id")
parentid=request("parentid")              '大类'
columnName=request("columnName")          '栏目名称'
columnEnName=request("columnEnName")          '栏目英文名称'
columnType=request("columnType")          '栏目类型' 
filename=request("filename")              'html文件名' 
sortrank=request("sortrank")              '排序' 
if sortrank="" then sortrank=0
bodycontent=request("bodycontent")              '内容' 
aboutcontent=request("aboutcontent")              'aboutcontent' 
isthrough=request("isthrough")            '审核'
flags=request("flags")            '旗'
httpUrl=request("httpUrl")            '网址'
smallimage=request("smallimage")            'smallimage'
bannerImage=request("bannerImage")            'banner'
webtitle=request("webtitle")            'webtitle'
webkeywords=request("webkeywords")            'webkeywords'
webdescription=request("webdescription")            'webdescription'
isthrough=IIF(isthrough="on",1,0)         '处理下'
if parentid="" then 
  parentid=-1
else
  parentid=int(parentid)
end if 

'添加修改
if request("act")="save" then
  isTrue=true
  if sortrank="" then    
    msg="排序不能为空"
    isTrue=false

  end if
  if isTrue=true then
    addsql=" where columnName='"& columnName &"'"
    if id<>"" then
      addsql=addsql & " and id<>"&id
    end if
    rs.open"select * from ["& db_PREFIX &"WebColumn]"&addsql,conn,1,3
    if not rs.eof then
      msg="栏目名称已经存在"
    else
      if id="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"WebColumn] where id="&id,conn,1,3
      end if 
      rs("parentid")=parentid 
      rs("columnName")=columnName 
      rs("columnEnName")=columnEnName 
      rs("columnType")=columnType 
      rs("filename")=filename 
      rs("sortrank")=sortrank 
      rs("aboutcontent")=aboutcontent 
      rs("bodycontent")=bodycontent 
      rs("isthrough")=isthrough 
      rs("flags")=flags 
      rs("httpUrl")=httpUrl 
      rs("smallimage")=smallimage 
      rs("bannerImage")=bannerImage 
      rs("webtitle")=webtitle 
      rs("webkeywords")=webkeywords 
      rs("webdescription")=webdescription 
      rs.update 
      response.Write"<script>parent.location.reload();</script>"
      response.end()
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"WebColumn] where id="&id,conn,1,1
  if not rs.eof then
    parentid=rs("parentid") 
    id=rs("id") 
    columnName=rs("columnName")   
    columnEnName=rs("columnEnName")   
    columnType=rs("columnType")   
    filename=rs("filename")   
    sortrank=rs("sortrank")   
    aboutcontent=rs("aboutcontent")   
    bodycontent=rs("bodycontent")   
    isthrough=rs("isthrough")  
    flags=rs("flags")  
    httpUrl=rs("httpUrl")  
    smallimage=rs("smallimage")  
    bannerImage=rs("bannerImage")  
    webtitle=rs("webtitle")  
    webkeywords=rs("webkeywords")  
    webdescription=rs("webdescription")  
  end if
end if
 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户添加栏目</title>
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css" />
</head>

<body>
    <%if msg<>"" then  call rw("<blockquote class=""layui-elem-quote"">"& msg &" &nbsp;<a href='javascript:window.history.go(-1); '>返回</a></blockquote>")%>
    <form id="form1" name="form1" class="layui-form" method="post" action="?act=save&id=<%=id%>">
        <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
            <div class="layui-form-item">
                <label class="layui-form-label">选择分类</label>
                <div class="layui-input-inline">
                    <select name="parentid" id="parentid" selected>
                        <option value="-1">≡ 作为一级栏目 ≡</option>
                        <%=columnSubInput(-1,id,parentid)%>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">栏目类型</label>
                <div class="layui-input-inline">
                    <select name="columnType" id="columnType" selected="">
                        <%
      splstr=split(WEBCOLUMNTYPE,",")
      for each s in splstr
        if instr(s,"|")>0 then
           splxx=split(s,"|")
          sel=""
          if splxx(1)=columnType then sel=" selected"
          call rw("<option value='"& splxx(1) & "'" & sel &">"& splxx(0) &"</option>")      
        end if
      next
      %>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">栏目名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="columnName" lay-verify="required" placeholder="请输入栏目名称" autocomplete="off" class="layui-input" value="<%=columnName%>">
                </div>
            </div>                
            <div class="layui-form-item">
                <label class="layui-form-label">栏目英文名</label>
                <div class="layui-input-inline">
                    <input type="text" name="columnEnName" placeholder="请输入栏目英文名称" autocomplete="off" class="layui-input" value="<%=columnEnName%>">
                </div>
            </div> 
            <div class="layui-form-item">
                <label class="layui-form-label">排序</label>
                <div class="layui-input-inline">
                    <input type="text" name="sortrank" lay-verify="number" placeholder="请输入排序" autocomplete="off" class="layui-input" value="<%=sortrank%>">
                </div>
            </div>
                <div class="layui-form-item">
      <label class="layui-form-label">简要说明</label>
      <div class="layui-input-block">
        <textarea name="aboutcontent" placeholder="请输入简要说明" class="layui-textarea"><%=aboutcontent%></textarea>
      </div>
    </div>
            <div class="layui-form-item">
                <label class="layui-form-label">内容</label>
                <div class="layui-input-block">
                    <textarea <%=IIF(request("editor")<>"no"," id='bodycontent' style='display:none;'"," rows='10'")%>  name="bodycontent" class="layui-textarea"><%=bodycontent%></textarea> 
                    <%if request("editor")<>"no" then%><a href="?id=<%=id%>&editor=no">不显示编辑器</a><%end if%>


                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">位置</label>
                <div class="layui-input-inline">
                    <select name="flags" id="flags">
                        <option value=''>请输入栏目显示位置</option>
                        <option value='top'<%=IIF(flags="top"," selected","")%>>顶部</option>
                        <option value='foot'<%=IIF(flags="foot"," selected","")%>>底部</option>
                        <option value='left'<%=IIF(flags="left"," selected","")%>>左边</option>
                        <option value='right'<%=IIF(flags="right"," selected","")%>>右边</option>
                        <option value='top|foot'<%=IIF(flags="top|foot"," selected","")%>>顶部和底部</option>
                    </select>
                </div>
            </div> 
            <div class="layui-form-item">
                <label class="layui-form-label">跳转网址</label>
                <div class="layui-input-inline">
                    <input type="text" name="httpUrl" placeholder="请输入跳转网址" autocomplete="off" class="layui-input" value="<%=httpUrl%>">
                </div>
            </div> 
            <div class="layui-form-item">
                <label class="layui-form-label">文件名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="filename" placeholder="请输入文件名称" autocomplete="off" class="layui-input" value="<%=filename%>">
                </div>
            </div>

            <div class="layui-form-item">
              <label class="layui-form-label">banner图</label>
              <div class="layui-input-inline">
                <input type="text" name="bannerImage" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=bannerImage%>">
              </div>
              <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
            </div>

            <div class="layui-form-item">
              <label class="layui-form-label">小图</label>
              <div class="layui-input-inline">
                <input type="text" name="smallimage" placeholder="请上传小片" autocomplete="off" class="layui-input" value="<%=smallimage%>">
              </div>
              <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin2">上传图片</button> 
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">title标题</label>
                <div class="layui-input-block">
                    <textarea name="webtitle" class="layui-textarea" placeholder="title标题"><%=webtitle%></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">META关键词</label>
                <div class="layui-input-block">
                    <textarea name="webkeywords" class="layui-textarea" placeholder="多个关键词用英文状态 , 号分割"><%=webkeywords%></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">META描述</label>
                <div class="layui-input-block">
                    <textarea name="webdescription" class="layui-textarea"><%=webdescription%></textarea>
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">审核状态</label>
                <div class="layui-input-inline">
                    <input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,""," checked")%>>
                </div>
            </div>
            <div class="layui-form-item layui-hide">
                <input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" />
            </div>
        </div>
    </form>
    <script src="../../layuiadmin/layui/layui.js"></script>
    <script>
    layui.config({
        base: '../../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form', 'upload', 'laydate', 'set', 'layedit'], function() {
        var $ = layui.$,
            form = layui.form,
            upload = layui.upload,
            laydate = layui.laydate;

        upload.render({
            elem: '#layuiadmin-upload-useradmin',
            url: '/api/upload/',
            done: function(res) {
                $(this.item).prev("div").children("input").val(res.data[0].src)
            }
        });
        upload.render({
            elem: '#layuiadmin-upload-useradmin2',
            url: '/api/upload/',
            done: function(res) {
                $(this.item).prev("div").children("input").val(res.data[0].src)
            }
        });

        lay('.date').each(function() {
            laydate.render({
                elem: this,
                trigger: 'click',
                format: 'yyyy/MM/dd'

            });
        });
        //编码器
        var layedit = layui.layedit;
        layedit.set({
            //暴露layupload参数设置接口 --详细查看layupload参数说明
            uploadImage: {
                url: '/api/upload/' //上传接口url
                    ,
                type: 'post' //默认post 
            }
        });
        layedit.build('bodycontent'); //建立编辑器



    })
    </script>
</body>

</html>