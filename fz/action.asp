<!--#Include file = "../inc/config.Asp"-->
<%
dim i,s,c,splstr,splxx,filePath,httpurl,content,nCount,urlFileType
httpurl=request("httpurl")
urlFileType=request("urlFileType")
filePath=request("filePath")
content=request("content")


dim webImageDir,webCssDir,webJsDir,zTempDir
webDir=request("webDir")
webImageDir=request("webImageDir")
webCssDir=request("webCssDir")
webJsDir=request("webJsDir")
zTempDir="zTempData/"

dim imageUrlList,jsUrlList
imageUrlList=request("imageUrlList")
jsUrlList=request("jsUrlList")


'获得网页内容 可读缓冲内容'
if request("act")="getConfig" then
  filePath=webDir & getWebSiteCleanName(httpurl) & ".dat"
  c=readfile(filePath,"")
  call die(c)
elseif request("act")="getHttpurl" then
  if webDir<>"" then
    call createDirFolder(webDir)
    if webImageDir<>"" then call createDirFolder(webDir & webImageDir)
    if webCssDir<>"" then call createDirFolder(webDir & webCssDir)
    if webJsDir<>"" then call createDirFolder(webDir & webJsDir)
    if zTempDir<>"" then call createDirFolder(webDir & zTempDir)
  end if
  filePath=webDir & zTempDir & mymd5(httpurl) & ".txt"
  if checkfile(filePath)=false then
    call saveRemoteFile(httpurl,filePath)
  end if
  c=readfile(filePath,"")
  call die(c)

'保存网页'
elseif request("act")="saveWebPage" then
   call addUrlConfig(httpurl,filePath,urlFileType)'记录url数据，方便改保存的文件名'
  ' if checkFile(filePath)=true then
  '   call die("保存 "& filePath &"  失败！，文件已经存在")
  ' else
    call writeToFile(filePath,content,"utf-8")
    call createAddFile(webDir & zTempDir & "zUrLlist.txt",httpurl & "|" & getFileAttr(filePath,"name") & "|" & urlFileType)
    call die("保存 "& filePath &"  成功！")
  ' end if

'保存图片'
elseif request("act")="downImges" then  
  nCount=0
  splstr=split(imageUrlList,chr(10))
  for i=0 to ubound(splstr)
    s=splstr(i)
    splxx=split(s,"|")    
    if checkFile(splxx(1))=false then      
      filePath=webDir & zTempDir & mymd5(splxx(0)) & ".jpg"
      if checkFile(filePath)=false then  '先放到缓冲里'
        call saveRemoteFile(splxx(0),filePath)    
      end if
      call copyFile(filePath,splxx(1))
      nCount=nCount+1
    end if
    call addUrlConfig(splxx(0),splxx(1),"image")'记录url列表里'
  next
  call die("保存图片成功！ " & nCount)

'保存JS文件'
elseif request("act")="downJs" then  
  nCount=0
  splstr=split(jsUrlList,chr(10))
  for i=0 to ubound(splstr)
    s=splstr(i)
    splxx=split(s,"|")
    if checkFile(splxx(1))=false then
      call saveRemoteFile(splxx(0),splxx(1))    
      nCount=nCount+1
    end if
    call addUrlConfig(splxx(0),splxx(1),"js")'记录url列表里'
  next
  call die("保存JS成功！ " & nCount)
end if

function addUrlConfig(url,filePath,urlFileType)
  dim fileName,s,c,saveFilePath,nLen
  fileName=getFileAttr(filePath,"name")
  '去除参数?和#后面内容'
  nLen=instr(url,"?")
  if nLen>0 then
    url=mid(url,1,nLen-1)
  end if
  nLen=instr(url,"#")
  if nLen>0 then
    url=mid(url,1,nLen-1)
  end if

  s=url & "|"& fileName &"|" & urlFileType 
  saveFilePath=webDir & "/" & getWebSiteCleanName(url) & ".dat"
  c=readFile(saveFilePath,"utf-8")
  if instr(vbcrlf & c & "|",vbcrlf & url & "|")=false then
    c=c & s & vbcrlf
    call writeToFile(saveFilePath,c,"utf-8")
  end if
  

end function
%>