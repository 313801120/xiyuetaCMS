## 20210409 ##
login.asp    ��¼ҳ�Ľ�
admin_safe.Asp    ��¼��ȫ��֤ҳ�Ľ�
admin_function.asp  ��¼��֤�����õ��������
m/user/user/list.asp


webFootLayout   ������  /3gxl/template_3gxl_public.asp   �ļ���


 call jcount()'ͳ�� ��/3gxl/template_3gxl_public.asp   �ļ���  webNavigation   


<body style="padding:10px 6px 30px 6px;background: #FFF">  



{ field: 'id', title: 'ID', width: 70, sort: false }
, { field: 'opentime', title: '����ʱ��', width: 150, sort: true }
, { field: 'ip', title: 'IP', width: 100, sort: true }
, { fixed: 'right', title: '����', width: 120, toolbar: '#barDemo' }


  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>�༭</a>
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i>ɾ��</a>

        <tr style="visibility: hidden;">
          <td height="50"></td>
          <td><input type="submit" class="layui-btn" value="��������" lay-submit="lay-submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" /></td>
         </tr>

         

            layer.prompt({
                formType: 1,
                title: '���в���������֤����'
            }, function(value, index) {
                layer.close(index);


                layer.confirm('ȷ��ɾ���˻�Ա��', function(index) {
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