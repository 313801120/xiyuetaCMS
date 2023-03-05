<!--#Include file = "../common.Asp"--><%
'对文章下的评论点支持与反对'
if request("act")="sustain" then   
    call sustainOppose("sustain","支持")    '支持'
elseif request("act")="oppose" then   
    call sustainOppose("oppose","反对")    '反对'
end if

function sustainOppose(stype,tip)    '留言'
    dim id,count,showtype,info
    id=request("id")
    showtype=request("showtype")
    rs.open "select * from " & db_PREFIX & "articlemessage where id="&id ,conn,1,3  '文章留言表'
    if not rs.eof then 
    	  count=rs(stype)
        '记录文章浏览信息 view 为浏览 20230218'
        rsx.open "select * from " & db_PREFIX & "articlemessagecount where  "& getAccessDatediff("updatetime")&"=0 and type='"& stype &"' and  articlemessageid=" & rs("id") ,conn,1,3
        if rsx.eof then
          rsx.addnew
          rsx("articlemessageid")=rs("id")
          rsx("type")=stype
          rsx("count")=1
          rsx("createtime")=date()  
          rsx("ip")=getip()
          rsx.update


          rs(stype)=1          '浏览次数'
          rs.update
          count=rs(stype)                  '文章浏览量'
          if tip="支持" then
            info="谢谢您的支持"
          else
            info="谢谢您的意见"
          end if 
        else 
          rsx("updatetime")=now()
          rsx("count")=rsx("count")+1
          rsx.update

          rs(stype)=rsx.recordcount          '浏览次数'
          rs.update
          count=rs(stype)                  '文章浏览量'
          info="您已提交过"
        end if:rsx.close
    end if:rs.close
    if showtype="json" then 
  		call die("{""info"": """& info &""",""count"": """& count &"""}")
    else
    	call die(count)
    end if
end function

%>