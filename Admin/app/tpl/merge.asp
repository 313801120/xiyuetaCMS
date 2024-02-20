<%
'合并模块里的css样式到一个文件里20240108
' call mergeCssStyle("TPL500A")
function mergeCssStyle(tplID)
    call echo("提示" & tplID,"处理mergeCssStyle")
    dim tplDir,fileList,content,tempContent,splstr,splxx,s,filePath,cssName,cStyle,cssContent,cssFilePath,tempCssContent,resUrl
    dim webDir,sLink,sEndLink,linkC
    webDir="/tpl/" & tplID & "/"
    tplDir=webDir & "/tpl/" 
    fileList=getDirAspList(tplDir)

    cssFilePath=webDir & "/style.css"
 
    tempCssContent=readfile(cssFilePath,"utf-8")  '读css文件内容' 暂存CSS
    cssContent=""   '默认为空，这个文件是系统CSS文件，不可修改20210126'

    splstr=split(fileList,vbcrlf)
    for each filePath in splstr
    	call echo("filePath 111",filePath)
    	content=readfile(filePath,"utf-8")
    	tempContent=content

	    cStyle=getStrCut(content,"<style>","</style>",0)
    	if cStyle<>"" then
    		content=replace(content,"<style>"& cStyle &"</style>","")  '删除style样式代码块'

            if instr(content,"cssName=""")>0 or instr(content,"cssname=""")>0 then
    		  cssName=getStrCut(content,"cssName=""","""",0)
              if cssName="" then cssName=getStrCut(content,"cssname=""","""",0)
	    	  cStyle=replace(cStyle,"<" & "%=cssName%" & ">",cssName)
              cStyle=replace(cStyle,"<" & "%=cssname%" & ">",cssName)
            end if

            '资源图片地址替换20240122'
            if instr(content,"resUrl=""")>0 or instr(content,"resurl=""")>0 then
                resUrl=getStrCut(content,"resUrl=""","""",0)
                if resUrl="" then resUrl=getStrCut(content,"resurl=""","""",0)
                cStyle=replace(cStyle,"<" & "%=resUrl%" & ">",resUrl)
                cStyle=replace(cStyle,"<" & "%=resurl%" & ">",resUrl)
                call echo("resUrl",resUrl)
            end if


    		cStyle=cssCompression(cStyle,0)'css压缩'
    		if instr(vbcrlf & cssContent & vbcrlf, vbcrlf & cStyle & vbcrlf)=false then
    			 cssContent=cssContent & vbcrlf & cStyle
    		end if
    	end if
    	'asp文件内容更新'
    	if tempContent<>content then
    		call writetofile(filePath,content,"utf-8")
    	end if
    	call echo("cssName",cssName)
    	call echo("cStyle",cStyle)
    	call hr()
    next
    'css有改变则更新'
    if tempCssContent<>cssContent then    
    	call writetofile(cssFilePath,cssContent,"utf-8")
    end if

    '处理网站下的asp，给里面加入css样式链接'
    fileList=getDirAspList(webDir)
    splstr=split(fileList,vbcrlf)
    for each filePath in splstr
    	call echo("filePath 2222",filePath)
    	content=readfile(filePath,"utf-8")
    	tempContent=content
    	sLink="<link rel='stylesheet' href='/tpl/"& tplID &"/style.css"
    	sEndLink="'>"
    	linkC=getStrCut(content,sLink,sEndLink,1)
    	if linkC<>"" then
    		content=replace(content,linkC,"")  '删除之前旧版的'
    	end if
    	sLink=sLink & "?n=" & getrnd(11) & sEndLink
    	if instr(content,sLink)=false then
    		content=replace(content,"</head>", "    " & sLink & "</head>")    		
	    	if tempContent<>content then
	    		call writetofile(filePath,content,"utf-8")  '更新asp文件'
	    	end if
    	end if

    next
end function

%>