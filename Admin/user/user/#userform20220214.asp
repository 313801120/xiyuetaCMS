<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim sql,title,id,msg,addsql,username,isThrough,nickname,pwd,isTrue,pic,expiredatetime,sex,winningcount,lv,viplv,shequ,bbsgrade,usermoney
id=request("id")
username=request("username")              '用户名'
nickname=request("nickname")              '昵称'
pwd=request("pwd")                        '密码'
pic=request("pic")            '头像'
expiredatetime=request("expiredatetime")  '到期时间'
sex=request("sex")                        '男女'
' winningcount=request("winningcount")      '中奖次数'
' lv=request("lv")                          '等级'
' viplv=request("viplv")                    'VIP等级'
' shequ=request("shequ")                    '社区等级'
' bbsgrade=request("bbsgrade")              'BBS等级'
' usermoney=request("usermoney")            '金币'
isthrough=request("isthrough")            '审核'
isthrough=IIF(isthrough="on",1,0)   '是否审核处理下'


'添加修改
if request("act")="save" then
  isTrue=true
  if pwd<>"" then
    if len(pwd)>=6 then
      pwd=myMD5(pwd)
    else
      msg="密码要大于6位字符"
      isTrue=false
    end if

  end if
  if isTrue=true then
    addsql=" where username='"& username &"'"
    if id<>"" then
      addsql=addsql & " and id<>"&id
    end if
    rs.open"select * from ["& db_PREFIX &"Member]"&addsql,conn,1,3
    if not rs.eof then
      msg="用户名称已经存在"
    else
      if id="" then
        rs.addnew
      else
        rs.close
        rs.open"select * from ["& db_PREFIX &"Member] where id="&id,conn,1,3
      end if 
      rs("username")=username 
      rs("nickname")=nickname 
      rs("isthrough")=isthrough
      rs("pic")=pic
      rs("expiredatetime")=expiredatetime
      rs("sex")=sex
      rs("regIP")=getIP() '注册IP'
      rs("ip")=getIP()
      ' rs("winningcount")=winningcount
      ' rs("lv")=lv
      ' rs("viplv")=viplv
      ' rs("shequ")=shequ
      ' rs("bbsgrade")=bbsgrade
      ' rs("usermoney")=usermoney
      if pwd<>"" then rs("pwd")=pwd
      rs.update 
      response.Write"<script>parent.location.reload();</script>"
      response.end()
    end if:rs.close 
  end if
'显示
elseif id<>"" then
  rs.open"select * from ["& db_PREFIX &"Member] where id="&id,conn,1,1
  if not rs.eof then
    username=rs("username")
    nickname=rs("nickname")
    id=rs("id") 
    isthrough=rs("isthrough")  
    pic=rs("pic")  
    expiredatetime=rs("expiredatetime")  
    sex=rs("sex")   
    ' winningcount=rs("winningcount")  
    ' lv=rs("lv")  
    ' viplv=rs("viplv")  
    ' shequ=rs("shequ")  
    ' bbsgrade=rs("bbsgrade")  
    ' usermoney=rs("usermoney")  
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
      <label class="layui-form-label">用户名</label>
      <div class="layui-input-inline">
        <input type="text" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="<%=username%>">
      </div>
    </div>    
    <div class="layui-form-item">
      <label class="layui-form-label">昵称</label>
      <div class="layui-input-inline">
        <input type="text" name="nickname" lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input" value="<%=nickname%>">
      </div>
    </div>
    
    <div class="layui-form-item">
      <label class="layui-form-label">头像</label>
      <div class="layui-input-inline">
        <input type="text" name="pic" placeholder="请上传图片" autocomplete="off" class="layui-input" value="<%=pic%>">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
    </div>
    <div class="layui-form-item" lay-filter="sex">
      <label class="layui-form-label">选择性别</label>
      <div class="layui-input-inline">
        <input type="radio" name="sex" value="男" title="男" checked>
        <input type="radio" name="sex" value="女" title="女"<%=IIF(sex="女"," checked","")%>>
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">到期时间</label>
      <div class="layui-input-inline"> 
        <input name="expiredatetime"  type="text" lay-verify="required" placeholder="到期时间" autocomplete="off" class="layui-input date" value="<%=expiredatetime%>">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">审核状态</label>
      <div class="layui-input-inline">
        <input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,""," checked")%>>
      </div>
    </div> 
    <div class="layui-form-item">
      <label class="layui-form-label">登陆密码</label>
      <div class="layui-input-inline">      
      <input name="pwd" type="text" class="layui-input" placeholder="不修改留空 "/>
      </div>
    </div> 
    <%if id<>"" then%>
    <div class="layui-form-item">
      <label class="layui-form-label">登录IP</label>
      <div class="layui-form-mid layui-word-aux"><%=rs("loginIp") & " " & look_ip(rs("loginIp"))%></div>
    </div> 
    <div class="layui-form-item">
      <label class="layui-form-label">登录时间</label>
      <div class="layui-form-mid layui-word-aux"><%=rs("loginTime")%></div>
    </div> 
    <div class="layui-form-item">
      <label class="layui-form-label">登录总数</label>
      <div class="layui-form-mid layui-word-aux"><%=rs("loginCount")%></div>
    </div>  
    <%end if%>

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
            $(this.item).prev("div").children("input").val(res.data.src)
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
