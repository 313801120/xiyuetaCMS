<!--#include file="../../../inc/Config.asp"-->
<!--#Include File = "../../admin_function.asp"-->
<!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim sql,title,id,msg,addsql,username,isThrough,nickname,pwd,isTrue,pic,sex,level,email,tel,bodyContent,permission,grouping,isiplimit,isThisAdmin
dim splxx,i,s
id=request("id")
username=request("username")              '用户名'
nickname=request("nickname")              '昵称'
pwd=request("pwd")                        '密码'
pic=request("pic")                        '头像'
sex=request("sex")                        '男女'
level=request("level")                    '角色等级' 
email=request("email")                    '邮箱
tel=request("tel")                    '手机
bodyContent=request("bodyContent")                    '备注+


permission=replace(request("permission")," ","")  '权限'空格去掉
grouping=request("grouping")  '权限'




isthrough=request("isthrough")            '审核'
isthrough=IIF(isthrough="on",1,0)   '处理下'

isiplimit=request("isiplimit")            'IP限制'
isiplimit=IIF(isiplimit="on",1,0)   '处理下'



'添加修改
if request("act")="save" then 
  isTrue=true
  if userrs("level")<>1 then
   msg="只有超级管理员才可操作"
   isTrue=false
  end if
  if isTrue=true then
    if pwd<>"" then
      if len(pwd)>=5 then
        pwd=myMD5(pwd)
      else
        msg="密码要大于等于5位字符"
        isTrue=false
      end if
    end if
  end if
  if isTrue=true then
    addsql=" where username='"& username &"'"
    if id<>"" then
      addsql=addsql & " and id<>"&id
    end if
    rs.open"select * from ["& db_PREFIX &"Admin]"&addsql,conn,1,3
    if not rs.eof then
      msg="用户名 "& username &" 已经存在"
    else
      isThisAdmin=false
      if id="" then
        rs.addnew
      else
        if cint(id)=userrs("id") then
          isThisAdmin=true
        else
          rs.close
          rs.open"select * from ["& db_PREFIX &"Admin] where id="&id,conn,1,3
        end if
      end if
      'Access里不可对同一表里同一条记录同时操作，所以只能用之前打开的对象，在sqlserver里不存在20231108' 
      if isThisAdmin then
        userrs("username")=username 
        userrs("nickname")=nickname 
        ' if userrs("level")=1 then isthrough=1'最高权限 自动审核
        if level<>1 then '排除最高权限者20220616
          userrs("isthrough")=isthrough
        end if
        userrs("email")=email
        userrs("tel")=tel
        userrs("pic")=pic
        userrs("sex")=sex
        userrs("level")=level 
        userrs("permission")=permission
        userrs("grouping")=grouping 
        userrs("bodyContent")=bodyContent 
        userrs("isiplimit")=isiplimit 'IP限制'
        if pwd<>"" then userrs("pwd")=pwd
        userrs.update  
      else
        rs("username")=username 
        rs("nickname")=nickname 
        ' if rs("level")=1 then isthrough=1'最高权限 自动审核
        if level<>1 then '排除最高权限者20220616
          rs("isthrough")=isthrough
        end if
        rs("email")=email
        rs("tel")=tel
        rs("pic")=pic
        rs("sex")=sex
        rs("level")=level 
        rs("permission")=permission
        rs("grouping")=grouping 
        rs("bodyContent")=bodyContent 
        rs("isiplimit")=isiplimit 'IP限制'
        if pwd<>"" then rs("pwd")=pwd
        rs.update  
      end if
      response.Write"<script>parent.location.reload();</script>"
      response.end()
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"Admin] where id="&id,conn,1,1
  if not rs.eof then
    username=rs("username")
    nickname=rs("nickname")
    id=rs("id") 

    isthrough=rs("isthrough")  
    pic=rs("pic")  
    sex=rs("sex")  
    level=rs("level")  
    permission=replace(rs("permission")," ","")'去掉空格'
    email=rs("email")
    tel=rs("tel")
    bodyContent=rs("bodyContent")
    grouping=rs("grouping")
    isiplimit=rs("isiplimit")
  end if
end if
 

%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户添加修改</title> 
 <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" type="text/css"  /> 
</head>
<body>  

<%if msg<>"" then  call rw("<blockquote class=""layui-elem-quote"">"& msg &" &nbsp;<a href='javascript:window.history.go(-1); '>返回</a></blockquote>")%>

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">

   <div class="layui-form-item">
      <label class="layui-form-label">角色</label>
      <div class="layui-input-inline">
        <select name="level" lay-verify="">
<%
splxx=split(adminLevelList,",")
for i=0 to ubound(splxx)
  s=splxx(i)
  if s<>"" then
    call rw("<option value="""& i &""" "& IIF(level=i," selected","") &">"& s &"</option>")
  end if
next
%>  
        </select> 
      </div> 
    </div>
        
    <div class="layui-form-item">
      <label class="layui-form-label">用户名</label>
      <div class="layui-input-inline">
        <input type="text" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="<%=username%>">
      </div>
    </div>    
    <div class="layui-form-item">
      <label class="layui-form-label">登陆密码</label>
      <div class="layui-input-inline">      
      <input name="pwd" type="text" class="layui-input" placeholder="不修改留空 "/>
      </div>
    </div> 

    <div class="layui-form-item">
      <label class="layui-form-label">昵称</label>
      <div class="layui-input-inline">
        <input type="text" name="nickname" lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input" value="<%=nickname%>">
      </div>
    </div>
    <div class="layui-form-item" lay-filter="sex">
      <label class="layui-form-label">性别</label>
      <div class="layui-input-inline">
        <select name="sex">
        <option value="男">男</option>
        <option value="女"<%=IIF(sex="女"," selected","")%>>女</option>
        <option value="保密"<%=IIF(sex="保密"," selected","")%>>保密</option>
        </select>
      </div>
    </div>
    <div class="layui-form-item" lay-filter="grouping">
      <label class="layui-form-label">分组</label>
      <div class="layui-input-inline"> 
        <%=getXiyuetaColumnSubInputList("后台用户分组","grouping",1)%>
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">头像</label>
      <div class="layui-input-inline">
        <input type="text" name="pic" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic%>">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
    </div>
 
    <div class="layui-form-item">
      <label class="layui-form-label">邮箱</label>
      <div class="layui-input-inline">
        <input type="text" name="email" placeholder="请输入邮箱" class="layui-input" value="<%=email%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">手机</label>
      <div class="layui-input-inline">
        <input type="text" name="tel" placeholder="请输入手机" class="layui-input" value="<%=tel%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">备注</label>
      <div class="layui-input-block">
        <textarea name="bodyContent" placeholder="请输入文章内容" class="layui-textarea"><%=bodyContent%></textarea>
      </div>
    </div>  

<%if level<>1 then '排除最高权限者%>
            <div class="layui-form-item">
                <label class="layui-form-label">权限列表</label>
                <div class="layui-input-block">

<%
' call echo("permission",permission)
splxx=split(adminPermissionLits,",")
for i=0 to ubound(splxx)
  s=splxx(i)
%>
                  <input type="checkbox" name="permission" title="<%=s%>" value="<%=s%>" <%=IIF(instr(","&permission&",",","&s&",")>0," checked","")%>>
<%next%> 
                </div>
              </div>

    <div class="layui-form-item">
      <label class="layui-form-label">审核状态</label>
      <div class="layui-input-inline">
        <input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,""," checked")%>>
      </div>
    </div>  
<%end if%>

    <div class="layui-form-item">
      <label class="layui-form-label">登录IP限制</label>
      <div class="layui-input-inline">
        <input type="checkbox" lay-filter="switch" name="isiplimit" lay-skin="switch" lay-text="开启|关闭" <%=IIF(isiplimit=0,""," checked")%>>
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
}).use(['index', 'form', 'upload', 'laydate'], function() {
    var $ = layui.$,
        form = layui.form,
        upload = layui.upload,
        laydate = layui.laydate;
    
    //正常上传图片
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






})
</script>
    

</body>
</html>
