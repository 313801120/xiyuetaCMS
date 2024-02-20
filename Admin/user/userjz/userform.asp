<!--#include file="../../../inc/Config.asp"--><!--#Include File = "../../admin_safe.Asp"--><% 
call openconn()  
dim sql,title,id,msg,addsql,username,isThrough,nickname,pwd,isTrue,pic,expiredatetime,sex,department,idcard,email,dateOfBirth,tel,address,bodycontent,weixin,qq,alipay,inadminid 
id=request("id")
username=request("username")              '用户名'
nickname=request("nickname")              '昵称' 
pwd=request("pwd")                        '密码'
pic=request("pic")            '头像'
expiredatetime=request("expiredatetime")  '到期时间'
sex=request("sex")                        '男女'
department=request("department")          '所在部门'
idcard=request("idcard")                  '身份证
dateOfBirth=request("dateOfBirth")                    '出生日期
email=request("email")                    '邮箱
tel=request("tel")                    '手机
address=request("address")                    '联系地址 

isthrough=request("isthrough")            '审核'
isthrough=IIF(isthrough="on",1,0)   '是否审核处理下'
bodycontent=request("bodycontent")            'bodycontent'
weixin=request("weixin")            'weixin'
alipay=request("alipay")            'alipay'
qq=request("qq")            'qq'
inadminid=request("inadminid")                    '添加的用户类型' 


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
      rs("department")=department
      rs("idcard")=idcard
      if dateOfBirth<>"" then rs("dateOfBirth")=dateOfBirth
      rs("email")=email
      rs("tel")=tel
      rs("address")=address 
      rs("bodycontent")=bodycontent
      rs("weixin")=weixin
      rs("alipay")=alipay
      rs("qq")=qq
      if inadminid<>"" then rs("inadminid")=inadminid  
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
    department=rs("department")
    idcard=rs("idcard")
    dateOfBirth=rs("dateOfBirth")
    email=rs("email")
    tel=rs("tel")
    address=rs("address") 
    bodycontent=rs("bodycontent")
    weixin=rs("weixin")
    alipay=rs("alipay")
    qq=rs("qq")
    inadminid=rs("inadminid")
  end if
else
  if inadminid="" then inadminid=userrs("id")  '为空则为自己'
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
  <script src="../../js/jquery.js"></script>
<script> 
function showBigPic(filepath) {
    var html = "<div id='bigPic' style='position:absolute;display:none; z-index:99999'><img style=\"max-width:300px\" src='' id='pre_view'/><br /></div>";

    $("#form1").append(html);
    //将文件路径传给img大图
    document.getElementById('pre_view').src = filepath;
    //获取大图div是否存在
    
    
    var div = document.getElementById("bigPic");
    if (!div) {
        return;
    }
    //如果存在则展示
    document.getElementById("bigPic").style.display="block";
    //获取鼠标坐标
    var intX = window.event.clientX;
    var intY = window.event.clientY;
    //设置大图左上角起点位置
    div.style.left = intX +5+ "px";
    div.style.top = intY + 5+"px";
}

//隐藏
function closeimg(){
    document.getElementById("bigPic").style.display="none";
}

</script>


<%if msg<>"" then  call rw("<blockquote class=""layui-elem-quote"">"& msg &" &nbsp;<a href='javascript:window.history.go(-1); '>返回</a></blockquote>")%>

<form id="form1" name="form1" class="layui-form"  method="post" action="?act=save&id=<%=id%>">
  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
    <div class="layui-form-item">
      <label class="layui-form-label">用户名</label>
      <div class="layui-input-inline">
        <input type="text" name="username" lay-verify="required" placeholder="请输入用户名" class="layui-input" value="<%=username%>">
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
        <input type="text" name="nickname" lay-verify="required" placeholder="请输入昵称" class="layui-input" value="<%=nickname%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">用户</label>
      <div class="layui-input-inline">
        <select name="inadminid" id="inadminid">          
            <option value='-1'>选择用户</option>       
            <%
            rsx.open"select * from ["& db_PREFIX &"admin] order by id asc",conn,1,1
            while not rsx.eof
            %>
            <option value='<%=rsx("id")%>'<%=IIF(cstr(inadminid)=cstr(rsx("id"))," selected","")%>><%=rsx("username") & "("& rsx("nickname") &")"%></option>  
          <%rsx.movenext:wend:rsx.close%>
        </select> 
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
    
    <div class="layui-form-item">
      <label class="layui-form-label">头像</label>
      <div class="layui-input-inline">
        <input type="text" name="pic" placeholder="请上传图片" class="layui-input" value="<%=pic%>" onmousemove="showBigPic(this.value)" onmouseout="closeimg()">
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">到期时间</label>
      <div class="layui-input-inline"> 
        <input name="expiredatetime"  type="text" lay-verify="required" placeholder="到期时间" class="layui-input mydate" value="<%=expiredatetime%>">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">审核状态</label>
      <div class="layui-input-inline">
        <input type="checkbox" lay-filter="switch" name="isThrough" lay-skin="switch" lay-text="通过|待审核" <%=IIF(isThrough=0,""," checked")%>>
      </div>
    </div> 
 

    <div class="layui-form-item">
      <label class="layui-form-label">所在部门</label>
      <div class="layui-input-inline">
        <input type="text" name="department" placeholder="请输入所在部门" class="layui-input" value="<%=department%>">
      </div>
    </div>    

    <div class="layui-form-item">
      <label class="layui-form-label">身份证</label>
      <div class="layui-input-inline">
        <input type="text" name="idcard" placeholder="请输入身份证" class="layui-input" value="<%=idcard%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">出生日期</label>
      <div class="layui-input-inline">
        <input type="text" name="dateOfBirth" placeholder="请输入出生日期" class="layui-input date" value="<%=dateOfBirth%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">邮箱</label>
      <div class="layui-input-inline">
        <input type="text" name="email" placeholder="请输入邮箱" class="layui-input" value="<%=email%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">微信</label>
      <div class="layui-input-inline">
        <input type="text" name="weixin" placeholder="请输入微信" class="layui-input" value="<%=weixin%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">支付宝</label>
      <div class="layui-input-inline">
        <input type="text" name="alipay" placeholder="请输入微信" class="layui-input" value="<%=alipay%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">QQ</label>
      <div class="layui-input-inline">
        <input type="text" name="qq" placeholder="请输入qq" class="layui-input" value="<%=qq%>">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">手机</label>
      <div class="layui-input-inline">
        <input type="text" name="tel" placeholder="请输入手机" class="layui-input" value="<%=tel%>">
      </div>
    </div> 

    <div class="layui-form-item">
      <label class="layui-form-label">联系地址</label>
      <div class="layui-input-inline">
        <input type="text" name="address" placeholder="请输入联系地址" class="layui-input" value="<%=address%>">
      </div>
    </div>

 

    <div class="layui-form-item">
      <label class="layui-form-label">内容</label>
      <div class="layui-input-block">
        <textarea name="bodycontent" <%=IIF(request("editor")<>"no"," id='bodycontent'"," rows='10'")%> placeholder="请输入文章内容" class="layui-textarea"><%=bodycontent%></textarea>
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
    lay('.mydate').each(function() {
        laydate.render({
            elem: this,
            trigger: 'click',
            format: 'yyyy/MM/dd HH:mm:ss'

        });
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
