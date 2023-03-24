<!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.Asp"-->
<!--#Include File = "../../admin_safe.Asp"-->
<% 
call openconn()  
dim msg,isTrue,addSql,id,parentid,columnName,columnEnName,isthrough,sortrank,columnType,bodyContent,splstr,splxx,s,sel,flags,httpUrl,bannerImage

id=request("id")
parentid=request("parentid")              '大类'
columnName=trim(request("columnName"))          '英文名称' 
columnEnName=trim(request("columnEnName"))          '英文名称' 
if columnEnName="" then columnEnName=lcase(pinYin2(columnName))'拼音小写'
sortrank=request("sortrank")              '排序' 
if sortrank="" then sortrank=0 
isthrough=request("isthrough")            '审核' 
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
    rs.open"select * from ["& db_PREFIX &"sheshi]"&addsql,conn,1,3
    if not rs.eof then
      msg="栏目名称已经存在"
    else
      if id="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"sheshi] where id="&id,conn,1,3
      end if 
      rs("parentid")=parentid 
      rs("columnName")=columnName  
      rs("columnEnName")=columnEnName  
      rs("sortrank")=sortrank  
      rs.update 
      response.Write"<script>parent.location.reload();</script>"
      response.end()
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"sheshi] where id="&id,conn,1,1
  if not rs.eof then
    parentid=rs("parentid") 
    id=rs("id") 
    columnName=rs("columnName")    
    columnEnName=rs("columnEnName")    
    sortrank=rs("sortrank")    
    isthrough=rs("isthrough")   
  end if
end if
 
'显示栏目列表成input方式 20210331 如 <option> ├─栏目名称</opton>
function sheshiSubInput(parentid,focusId,focusParentId)
  dim rs:Set rs = CreateObject("Adodb.RecordSet")
  dim c,s,sel,addsql
  if focusId<>"" then addSql=" and id<>"& focusId
  rs.open "select * from ["& db_PREFIX &"sheshi] where parentId="&parentid & addsql &" order by sortrank asc,id asc",conn,1,1
  while not rs.EOF  
    sel=""
    if focusParentId<>"" then
        if focusParentId=rs("id") then sel=" selected"
    end if
    c=c & "<option value="""& rs("id") &""""& sel &">"& getSubSheShiSort(rs("parentid"),"")  & rs("columnName")&"</option>"    
    c=c & sheshiSubInput(rs("id"),focusId,focusParentId)    
  rs.movenext:wend:rs.close
  sheshiSubInput=c
end function

'获得子栏目树状20210331  如  ├─栏目名称
function getSubSheShiSort(parentid,subStr)
    dim rs:Set rs = CreateObject("Adodb.RecordSet")
    rs.open "select * from ["& db_PREFIX &"sheshi] where id="&parentid,conn,1,1
    if not rs.eof then
        if subStr<>"" then
            subStr="&nbsp;&nbsp;" & subStr
        else
            subStr=subStr & "&nbsp;&nbsp;├─" 
        end if
        if rs("parentId")<>-1 then
            call getSubSheShiSort(rs("parentId"),subStr)
        end if
    end if:rs.close
    getSubSheShiSort=subStr
end function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加</title>
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
                        <%=sheshiSubInput(-1,id,parentid)%>
                    </select>
                </div>
            </div>
             
            <div class="layui-form-item">
                <label class="layui-form-label">名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="columnName" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input" value="<%=columnName%>">
                </div>
            </div>                
              
            <div class="layui-form-item">
                <label class="layui-form-label">拼音名</label>
                <div class="layui-input-inline">
                    <input type="text" name="columnEnName" placeholder="请输入拼音名称" autocomplete="off" class="layui-input" value="<%=columnEnName%>">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">排序</label>
                <div class="layui-input-inline">
                    <input type="text" name="sortrank" lay-verify="number" placeholder="请输入排序" autocomplete="off" class="layui-input" value="<%=sortrank%>">
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
        layedit.build('bodyContent'); //建立编辑器



    })
    </script>
</body>

</html>