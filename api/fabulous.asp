<!--#Include file = "../common.Asp"--><%
'点赞20230219'
if request("act")="submit" then   
    call sumbitliuya()    '留言'
end if

function sumbitliuya()    '留言'
    dim id,fabulous,showtype,info
    id=request("id")
    showtype=request("showtype")
    rs.open "select * from " & db_PREFIX & "articledetail where id="&id ,conn,1,3
    if not rs.eof then    
    	fabulous=rs("fabulous")
        '记录文章浏览信息 view 为浏览 20230218'
        rsx.open "select * from " & db_PREFIX & "articlecount where  "& getAccessDatediff("updatetime")&"=0 and type='fabulous' and  articleid=" & rs("id") ,conn,1,3
        if rsx.eof then
          rsx.addnew
          rsx("articleid")=rs("id")
          rsx("type")="fabulous"
          rsx("count")=1
          rsx("createtime")=date()  
          rsx("ip")=getip()
          rsx.update


          rs("fabulous")=1          '浏览次数'
          rs.update
          fabulous=rs("fabulous")                  '文章浏览量'
          info="点赞成功！"
        else
          rsx("updatetime")=now()
          rsx("count")=rsx("count")+1
          rsx.update

          rs("fabulous")=rsx.recordcount          '浏览次数'
          rs.update
          fabulous=rs("fabulous")                  '文章浏览量'
          info="你已经点赞过了！"
        end if:rsx.close
    end if:rs.close
    if showtype="json" then 
  		call die("{""info"": """& info &""",""fabulous"": """& fabulous &"""}")
    else
    	call die(fabulous)
    end if
end function

%>