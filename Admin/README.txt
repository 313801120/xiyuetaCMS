## 20210409 ##
login.asp    登录页改进
admin_safe.Asp    登录安全验证页改进
admin_function.asp  登录验证函数拿掉，做简洁
m/user/user/list.asp


webFootLayout   函数在  /3gxl/template_3gxl_public.asp   文件里


 call jcount()'统计 在/3gxl/template_3gxl_public.asp   文件里  webNavigation   


<body style="padding:10px 6px 30px 6px;background: #FFF">  



{ field: 'id', title: 'ID', width: 70, sort: false }
, { field: 'opentime', title: '开奖时间', width: 150, sort: true }
, { field: 'ip', title: 'IP', width: 100, sort: true }
, { fixed: 'right', title: '操作', width: 120, toolbar: '#barDemo' }


  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>

        <tr style="visibility: hidden;">
          <td height="50"></td>
          <td><input type="submit" class="layui-btn" value="保存资料" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" /></td>
         </tr>

         

            layer.prompt({
                formType: 1,
                title: '敏感操作，请验证密码'
            }, function(value, index) {
                layer.close(index);


                layer.confirm('确定删除此会员？', function(index) {
                    $.ajax({
                        type: "POST",
                        cache: true,
                        dataType: "json",
                        url: "?act=del",
                        data: { "id": pid,"pwd":value }, 
                        success: function(data) { 
                            switch (data.status) {
                                case "y":
                                    obj.del();
                                    break;
                                case "n":                                    
                                    layer.msg(data.info);
                                    break;
                            }
                        }
                    });
                    layer.close(index);

                });
            });