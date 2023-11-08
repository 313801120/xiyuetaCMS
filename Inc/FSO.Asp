<% 
'FSO  Scripting.FileSystemObject组件操作大全 (2013,9,27)

'读文件内容 (2013,9,27
function getFileText(byVal filePath)
    on error resume next 
    dim fso, fText, openFile 
    'GetFileText = ""   '它默认返回的就是空， 这个是多此一举 (2013,9,30)
    call handlePath(filePath)                                                       '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(filePath) = true then
            set fText = fso.openTextFile(filePath, 1)
                '加强 读空文件出错
                set openFile = fso.getFile(filePath)
                    if openFile.size = 0 then getFileText = "" : exit function                      '文件为空则退出
                set openFile = nothing 
                getFileText = fText.readAll 
            set fText = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFileText 读取文件内容 函数出错，filePath=" & filePath) 
end function 
'旧版,读取文件内容  (辅助)
function getFText(filePath)
    getFText = getFileText(filePath) 
end function 
'读文件类型 (2013,9,27
function getFileType(byVal filePath)
    on error resume next 
    dim fso, myFile, openFile 
    'GetFileText = ""   '它默认返回的就是空， 这个是多此一举 (2013,9,30)
    call handlePath(filePath)                                                       '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(filePath) = true then
            set myFile = fso.getFile(filePath)
                getFileType = myFile.type 
            set myFile = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFileText 读取文件类型 函数出错，filePath=" & filePath) 
end function 

'检查文件
function checkFile(byVal filePath)
    on error resume next 
    dim fso 
    call handlePath(filePath)                                                       '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        checkFile = fso.fileExists(filePath) 
    set fso = nothing 
    if err then call doError(err.description, "checkFile 检查文件 函数出错，filePath=" & filePath) 
end function 
'判断文件,相当于检查文件 (辅助)
function existsFile(filePath)
    existsFile = checkFile(filePath) 
end function 
'创建文件   这种方式创建文件时，会多一行，用WriteToFile创建时没有多一行
function createFile(byVal filePath, byVal content)
    on error resume next 
    dim fText, fso 
    call handlePath(filePath)                                                       '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if existsZhiDuFile(filePath) = true then                                        '判断是否为只读文件
            call EditFileAttribute(filePath, 32)                                            '把只读属性改成存档属性
        end if 
        'call echo("filePath",filePath)
        set fText = fso.createTextFile(filePath, true)
            fText.writeLine(content) 
            createFile = true 
        set fText = nothing 
    set fso = nothing 
    if err then createFile = false : call doError(err.description, "CreateFile 创建文件 函数出错，filePath=" & filePath) 
end function 
'保存文件 (辅助)
function saveFile(filePath, content)
    saveFile = createFile(filePath, content) 
end function 
'创建文件，存在累加 【2013,9,27】
function createAddFile(byVal filePath, byVal content)
   on error resume next 
    dim fso, fText 
    call handlePath(filePath)                                                       '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(filePath) = false then                                        '文件不存在，则创建
            set fText = fso.createTextFile(filePath, true)
                fText.writeLine(content) 
            set fText = nothing 
            createAddFile = true
        else                                                                            '文件存在，则累加
            createAddFile = addToFile(filePath, content) 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "CreateAddFile 创建文件，存在累加 函数出错，filePath=" & filePath) 
end function 
'创建文件，旧版
function createAddUpFile(filePath, content)
    createAddUpFile = createAddFile(filePath, content) 
end function 
'追加文件信息
function addToFile(byVal filePath, byVal content)
    'on error resume next 
    dim fso, fText 
    call handlePath(filePath)                                                       '获得完整路径
    addToFile = false
	if existsZhiDuFile(filePath) = true then                                        '判断是否为只读文件
        call EditFileAttribute(filePath, 32)                                            '把只读属性改成存档属性
    end if 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(filePath) = true then
            set fText = fso.openTextFile(filePath, 8)
                fText.writeLine(content) 
            set fText = nothing 
            addToFile = true
        end if 
    set fso = nothing 
    if err then call doError(err.description, "AddToFile 追加文件信息 函数出错，filePath=" & filePath & "<br>Content字符长" & len(content) & " Content类型" & typeName(content) & "【" & content & "】") 
end function 
'保存字节文件(20151106)
function saveByteFile(byVal filePath, content)
    dim ads 
    filePath = handlePath(filePath) 
    set ads = createObject("ADODB.Stream")
        with ads
            .type = 1 
            .open 
            .write(content)
            'Response.Write("<br><b>["&LocalFileName&"]</b><br>")
            .saveToFile filePath, 2 
            .cancel 
            .close 
        end with 
    set ads = nothing 
end function 
function createByteFile(filePath, content)

end function 
'移动文件
function moveFile(byVal path, byVal toPath)
    on error resume next 
    dim fso 
    call handlePath(path)                                                           '获得完整路径
    call handlePath(toPath)                                                         '获得完整路径
    moveFile = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(path) = true and fso.fileExists(toPath) = false then          '要移动文件为真，被移动文件为假
            call fso.moveFile(path, toPath) 
            moveFile = true 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "MoveFile 移动文件 函数出错，Path=" & path & "，ToPath=" & toPath) 
end function 
'修改文件，相当于移动文件 (辅助)
function editFile(path, toPath)
    editFile = moveFile(path, toPath) 
end function 
'拷贝文件
function copyFile(byVal path, byVal toPath)
    on error resume next 
    dim fso 
    call handlePath(path)                                                           '获得完整路径
    call handlePath(toPath)                                                         '获得完整路径
    copyFile = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(path) = true and fso.fileExists(toPath) = false then          '要拷贝文件为真，被拷贝文件为假
            call fso.copyFile(path, toPath) 
            copyFile = true 
        end if 
    if err then call doError(err.description, "CopyFile 拷贝文件 函数出错，Path=" & path & "("& fso.fileExists(path) &")，ToPath=" & toPath & "("& fso.fileExists(toPath) &")") 
    set fso = nothing 
end function 
'删除文件，只读文件也可删除，谨慎使用
function deleteFile(byVal filePath)
    on error resume next 
    dim fso 
    call handlePath(filePath)                                                       '获得完整路径
    deleteFile = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(filePath) = true then
            call fso.deleteFile(filePath, true) 
            deleteFile = true 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "DeleteFile 删除文件 函数出错，filePath=" & filePath) 
end function 
'删除文件列表
function delSelFile(rootPath, byVal fileList)
    dim splStr, path, c 
    splStr = split(fileList, "|") 
    for each path in splStr
        if path <> "" then
            '删除文件
            call deleteFile(rootPath & path) 
            c = c & path & vbCrLf 
        end if 
    next 
    delSelFile = c 
end function 
'删除文件列表
function delFileList(rootPath, byVal fileList)
    delFileList = delSelFile(rootPath, fileList) 
end function 
'批量删除文件(20151127) Call batchDelFile("/test/", Split("2.html|2.php|3.Asp", "|"))
function batchDelFile(dirPath, fileArray)
    dim fileName, filePath, c 
    for each fileName in fileArray
        filePath = dirPath & fileName 
        c = c & filePath & vbCrLf 
        call deleteFile(filePath) 
    next 
    batchDelFile = c 
end function 
'删除指定文件列表  前面有#号的文件，给删除掉 例：Call DeleteAppointFileList("/Skins/Test/Css/")
function deleteAppointFileList(byVal folderPath)
    'On Error Resume Next
    dim fso, f, myFile, fileName 
    call handlePath(folderPath)                                                     '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderPath) = false then deleteAppointFileList = "" : exit function '文件夹不存在，退出
        set f = fso.getFolder(folderPath)
            for each myFile in f.files
                fileName = baseName(myFile) 
                'Call Echo(FileName,MyFile)
                if left(fileName, 1) = "#" then
                    call deleteFile(myFile) 
                end if 
                doEvents 
            next 
        set f = nothing 
    set fso = nothing 
    deleteAppointFileList = "" 
end function 
'获得文件大小
function getFileSize(byVal fileName)
    on error resume next 
    dim fso, openFile 
    call handlePath(fileName)                                                       '获得完整路径
    getFileSize = 0 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(fileName) = true then
            set openFile = fso.getFile(fileName)
                getFileSize = openFile.size 
            set openFile = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFileSize 获得文件大小 函数出错，FileName=" & fileName) 
end function 
'文件大小 (辅助)
function fileSize(fileName)
    fileSize = getFileSize(fileName) 
end function 
'文件大小 (辅助)
function getFSize(fileName)
    getFSize = getFileSize(fileName) 
end function 
'获得文件创建时间
function getFileCreateDate(byVal fileName)
    on error resume next 
    dim fso, openFile 
    call handlePath(fileName)                                                       '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(fileName) = true then
            set openFile = fso.getFile(fileName)
                getFileCreateDate = openFile.dateCreated 
            set openFile = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFileCreateDate 获得文件创建时间 函数出错，FileName=" & fileName) 
end function 
'获得文件创建时间 (辅助)
function fileCreateDate(fileName)
    fileCreateDate = getFileCreateDate(fileName) 
end function 
'获得文件创建时间 (辅助)
function getFileCreateTime(fileName)
    getFileCreateTime = getFileCreateDate(fileName) 
end function
'获得文件修改时间
function getFileEditDate(byVal fileName)
    on error resume next 
    dim fso, openFile 
    call handlePath(fileName)                                                       '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(fileName) = true then
            set openFile = fso.getFile(fileName)
                getFileEditDate = openFile.dateLastModified 
            set openFile = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFileEditDate 获得文件修改时间 函数出错，FileName=" & fileName) 
end function 
'获得文件修改时间 (辅助)
function fileEditDate(fileName)
    fileEditDate = getFileEditDate(fileName) 
end function 
'获得文件修改时间 (辅助)
function getFileEditTime(fileName)
    getFileEditTime = getFileEditDate(fileName) 
end function 
'获得文件访问时间
function getDateLastAccessed(byVal fileName)
    on error resume next 
    dim fso, openFile 
    call handlePath(fileName)                                                       '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(fileName) = true then
            set openFile = fso.getFile(fileName)
                getDateLastAccessed = openFile.dateLastAccessed 
            set openFile = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFileEditDate 获得文件访问时间 函数出错，FileName=" & fileName) 
end function
'获得文件访问时间 (辅助)
function getFileVisitTime(fileName)
	getFileVisitTime=getDateLastAccessed(fileName)
end function
'修改文件最后修改时间 如：Call ModifyFileModifydate("F:\Temp\001\Config.ini", Now() - 5)
function modifyFileModifydate(byVal fileName, byVal dateTime)
    on error resume next 
    dim dirPath, shellObj, app_Path, app_File 
    call handlePath(fileName)                                                       '获得完整路径
    if checkFile(fileName) = false then                                             '文件不存在，为假退出
        modifyFileModifydate = false 
        exit function 
    end if 
    dirPath = left(fileName, inStrRev(fileName, "\")) 
    fileName = right(fileName, len(fileName) - len(dirPath)) 
    'Call Echo(DirPath,FileName)
    '通过shell.Application修改文件的最后修改时间
    set shellObj = createObject("Shell.Application")
        set app_Path = shellObj.nameSpace(dirPath)
            set app_File = app_Path.parseName(fileName)
                app_File.modifydate = dateTime 
                modifyFileModifydate = true 
                if err then call doError(err.description, "ModifyFileModifydate 获得文件修改时间 函数出错，FileName=" & dirPath & fileName) 
            set app_File = nothing 
        set app_Path = nothing 
    set shellObj = nothing 
end function 
'修改文件最后修改时间 (辅助)
function editFileEditDate(fileName, dateTime)
    editFileEditDate = modifyFileModifydate(fileName, dateTime) 
end function 
'判断只读文件
function existsZhiDuFile(byVal fileName)
    on error resume next 
    dim fso, openFile 
    existsZhiDuFile = false 
    call handlePath(fileName)                                                       '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(fileName) = true then
            set openFile = fso.getFile(fileName)
                existsZhiDuFile = openFile.attributes 
            set openFile = nothing 
            if existsZhiDuFile >= 128 then existsZhiDuFile = existsZhiDuFile - 128 
            if existsZhiDuFile >= 64 then existsZhiDuFile = existsZhiDuFile - 64 
            if existsZhiDuFile >= 32 then existsZhiDuFile = existsZhiDuFile - 32 
            if existsZhiDuFile >= 8 then existsZhiDuFile = existsZhiDuFile - 8 
            if existsZhiDuFile >= 4 then existsZhiDuFile = existsZhiDuFile - 4 
            if existsZhiDuFile >= 2 then existsZhiDuFile = existsZhiDuFile - 2 
            existsZhiDuFile = cBool(existsZhiDuFile)                                        '让它成为布而类型
        end if 
    set fso = nothing 
    if err then call doError(err.description, "ExistsZhiDuFile 判断只读文件 函数出错，FileName=" & fileName) 
end function 
'获得文件属性  '0普通文件 1只读 2为隐藏 4系统 8卷材 16文件夹 32存档 64快捷键 128压缩文件
function getFileAttribute(byVal fileName)
    on error resume next 
    dim fso, openFile 
    call handlePath(fileName)                                                       '获得完整路径
    getFileAttribute = -1 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(fileName) = true then
            set openFile = fso.getFile(fileName)
                getFileAttribute = openFile.attributes 
            set openFile = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFileAttribute 获得文件属性 函数出错，FileName=" & fileName) 
end function 
'修改文件属性  '0普通文件 1只读 2为隐藏 4系统 8卷材 16文件夹 32存档 64快捷键 128压缩文件
function editFileAttribute(byVal fileName, byVal n)
    on error resume next 
    dim fso, openFile 
    call handlePath(fileName)                                                       '获得完整路径
    editFileAttribute = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(fileName) = true then
            set openFile = fso.getFile(fileName)
                openFile.attributes = n                                                         '32文件
            set openFile = nothing 
            editFileAttribute = true 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "EditFileAttribute 修改文件属性 函数出错，FileName=" & fileName) 
end function 
'判断文件天数（用修改时间进行比较）
function existsFileDay(byVal fileName, byVal inputDayNumb)
    on error resume next 
    dim fso, openFile, dayNumb 
    call handlePath(fileName)                                                       '获得完整路径
    existsFileDay = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.fileExists(fileName) = true then
            set openFile = fso.getFile(fileName)
                dayNumb = dateDiff("d", openFile.dateLastModified, now())                       '之前是Date  vb.net不能用
                if dayNumb <= inputDayNumb then existsFileDay = true 
            set openFile = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "ExistsFileDay 判断文件天数 函数出错，FileName=" & fileName) 
end function 
'判断文件天数 (辅助)
function checkFileDay(fileName, inputDayNumb)
    checkFileDay = existsFileDay(fileName, inputDayNumb) 
end function 
'========================================= 文件夹 =========================================
'创建文件夹
function createFolder(byVal folderPath)
    on error resume next 
    dim fso 
    call handlePath(folderPath)                                                     '获得完整路径
    createFolder = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderPath) = false then
            fso.createFolder(folderPath) 
            createFolder = true 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "createFolder 创建文件夹 函数出错，FolderPath=" & folderPath & ":::" & fso.folderExists(folderPath)) 
end function 
'创建目录文件夹 创建一组文件夹
function createDirFolder(byVal folderPath)
    'On Error Resume Next
    createDirFolder = "" 
    if checkFolder(folderPath) = true then exit function                            '文件夹存在，退出
    dim splStr, i, s, sNewFolder 
    sNewFolder = ""                                                                  'vb.net使用报错
    call handlePath(folderPath)                                                     '获得完整路径
    splStr = split(folderPath, "\") 
    for i = 0 to uBound(splStr)
        s = trim(splStr(i))                                                             '去除两边空格
        if s <> "" then
            sNewFolder = sNewFolder & s & "\" 
            if i = uBound(splStr) and inStr(s, ".") > 0 then exit for                       '创建到最后文件夹时，要是为文件则退出循环 20141215
            if inStr(s, ":") = false then
                'Call Echo("sNewFolder",sNewFolder)
                call createFolder(sNewFolder) 
            end if 
        end if 
    next 
end function 
'创建以域名命名的文件夹
function createDomain(byVal folderPath, byVal httpurl)
    on error resume next 
    dim toPath 
    call handlePath(folderPath)                                                     '获得完整路径
    createDomain = false 
    httpurl = getWebSite(httpurl) 
    httpurl = replace(replace(replace(httpurl, "http://", ""), "/", ""), ".", "_") 
    httpurl = replace(httpurl, ":", "_")                                            '追加于2012年7月13日
    toPath = folderPath & httpurl 
    if checkFolder(toPath) = false then
        call createFolder(toPath) 
        createDomain = true 
    end if 
    if err then call doError(err.description, "CreateDoMain 创建以域名命名的文件夹 函数出错，FolderPath=" & folderPath) 
end function 
'创建以域名命名的文件夹 (辅助)
function createDomainFolder(folderPath, httpurl)
    createDomainFolder = createDomain(folderPath, httpurl) 
end function 
'移动文件夹
function moveFolder(byVal path, byVal toPath)
    on error resume next 
    dim fso 
    call handlePath(path)                                                           '获得完整路径
    call handlePath(toPath)                                                         '获得完整路径
    moveFolder = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(path) = true and fso.folderExists(toPath) = false then      '要移动文件夹为真，被移动文件夹为假
            call fso.moveFolder(path, toPath) 
            moveFolder = true 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "MoveFolder 移动文件夹 函数出错，Path=" & path & "，ToPath=" & toPath) 
end function 
'修改文件夹 (辅助)
function editFolder(path, toPath)
    editFolder = moveFolder(path, toPath) 
end function 
'拷贝文件夹
function copyFolder(byVal path, byVal toPath)
    on error resume next 
    dim fso 
    call handlePath(path)                                                           '获得完整路径
    call handlePath(toPath)                                                         '获得完整路径
    '完善当前最后为\时会报错(20151022)
    if right(path, 1) = "\" then
        path = left(path, len(path) - 1) 
    end if 
    if right(toPath, 1) = "\" then
        toPath = left(toPath, len(toPath) - 1) 
    end if 
    copyFolder = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(path) = true and fso.folderExists(toPath) = false then      '要拷贝文件夹为真，被拷贝文件夹为假
            call fso.copyFolder(path, toPath) 
            copyFolder = true 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "CopyFolder 拷贝文件夹 函数出错，Path=" & path & "，ToPath=" & toPath) 
end function 
'删除文件夹，只读文件夹照样删除 使用耐谨慎
function deleteFolder(byVal folderPath)
    on error resume next 
    dim fso 
    call handlePath(folderPath)                                                     '获得完整路径
    deleteFolder = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderPath) then
            if right(folderPath, 1) = "\" then folderPath = left(folderPath, len(folderPath) - 1) '晕，后台\就报错，必需去掉它
            call fso.deleteFolder(folderPath, true) 
            deleteFolder = true 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "DeleteFolder 删除文件夹 函数出错，FolderPath=" & folderPath) 
end function 
'获得文件夹大小
function getFolderSize(byVal folderName)
    on error resume next 
    dim fso, openFolder 
    call handlePath(folderName)                                                     '获得完整路径
    getFolderSize = 0 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderName) then
            set openFolder = fso.getFolder(folderName)
                getFolderSize = openFolder.size 
            set openFolder = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFolderSize 获得文件夹大小 函数出错，FolderName=" & folderName) 
end function 
'检查文件夹存在
function checkFolder(byVal folderName)
    on error resume next 
    dim fso 
    call handlePath(folderName)                                                     '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        checkFolder = fso.folderExists(folderName) 
    set fso = nothing 
    if err then call doError(err.description, "checkFolder 检查夹文件 函数出错，FolderName=" & folderName) 
end function 
'判断文件夹存在 (辅助)
function existsFolder(folderName)
    existsFolder = checkFolder(folderName) 
end function 
'获得文件夹创建时间
function getFolderCreateDate(byVal folderName)
    on error resume next 
    dim fso, openFolder 
    call handlePath(folderName)                                                     '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderName) then
            set openFolder = fso.getFolder(folderName)
                getFolderCreateDate = openFolder.dateCreated 
            set openFolder = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFolderCreateDate 获得文件创建时间 函数出错，FolderName=" & folderName) 
end function 
'获得文件夹创建时间 辅助上面
function getFolderCreateTime(folderPath)
	getFolderCreateTime=getFolderCreateDate(folderPath)
end function
'获得文件夹修改时间
function getFolderEditDate(byVal folderPath)
    on error resume next 
    dim fso, openFolder 
    call handlePath(folderPath)                                                     '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderPath) then
            set openFolder = fso.getFolder(folderPath)
                getFolderEditDate = openFolder.dateLastModified 
            set openFolder = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFolderEditDate 获得文件修改时间 函数出错，FolderName=" & folderPath) 
end function 
'获得文件夹修改时间  调用上面
function getFolderTime(folderPath)
    getFolderTime = getFolderEditDate(folderPath) 
end function
'获得文件夹修改时间  调用上面
function getFolderEditTime(folderPath)
    getFolderEditTime = getFolderEditDate(folderPath) 
end function
'获得文件夹访问时间  调用上面  因为ASP里文件夹是获得不了最后访问时间的，PHP里可以获得，但是好像和修改是一样的20160411
function getFolderVisitTime(folderPath)
    getFolderVisitTime = getFolderEditDate(folderPath) 
end function


'获得文件夹属性  '0普通文件 1只读 2为隐藏 4系统 8卷材 16文件夹 32存档 64快捷键 128压缩文件
function getFolderAttribute(byVal folderName)
    on error resume next 
    dim fso, openFolder 
    call handlePath(folderName)                                                     '获得完整路径
    getFolderAttribute = 0 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderName) = true then
            set openFolder = fso.getFolder(folderName)
                getFolderAttribute = openFolder.attributes 
            set openFolder = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "GetFolderAttribute 获得文件属性 函数出错，FolderName=" & folderName) 
end function 
'修改文件夹属性  '0普通文件 1只读 2为隐藏 4系统 8卷材 16文件夹 32存档 64快捷键 128压缩文件
function editFolderAttribute(byVal folderName, n)
    on error resume next 
    dim fso, openFolder 
    call handlePath(folderName)                                                     '获得完整路径
    editFolderAttribute = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderName) then
            set openFolder = fso.getFolder(folderName)
                openFolder.attributes = n                                                       '32文件
            set openFolder = nothing 
            editFolderAttribute = true 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "EditFolderAttribute 修改文件属性 函数出错，FolderName=" & folderName) 
end function 
'判断文件夹天数（用修改时间进行比较）
function existsFolderDay(byVal folderName, byVal inputDayNumb)
    on error resume next 
    dim fso, openFolder, dayNumb 
    call handlePath(folderName)                                                     '获得完整路径
    existsFolderDay = false 
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderName) = true then
            set openFolder = fso.getFolder(folderName)
                dayNumb = dateDiff("d", openFolder.dateLastModified, now())                     '之前是Data
                if dayNumb <= inputDayNumb then existsFolderDay = true 
            set openFolder = nothing 
        end if 
    set fso = nothing 
    if err then call doError(err.description, "ExistsFolderDay 判断文件夹天数 函数出错，FolderName=" & folderName) 
end function 
'判断文件夹天数 (辅助)
function checkFolderDay(folderName, inputDayNumb)
    checkFolderDay = existsFolderDay(folderName, inputDayNumb) 
end function 
'获得全部文件（夹）列表
function getFileFolderList(byVal folderPath, fileYes, fileTypeList, fileNameOrType, folderType, folderNameOrType, byVal c)
    on error resume next 
    dim fso, f, fc, myFile, f1, fileType 
    call handlePath(folderPath)                                                     '获得完整路径
    fileTypeList = lCase(fileTypeList)                                              '文件类型列表小写
    set fso = createObject("Scripting.FileSystemObject")
        if not fso.folderExists(folderPath) then exit function 
        set f = fso.getFolder(folderPath)
            if fileYes = true then
                for each myFile in f.files
                    fileType = lCase(right(myFile.name, len(myFile.name) - inStrRev(myFile.name, "."))) 

                    if (inStr("|" & fileTypeList & "|", "|" & fileType & "|") > 0 or fileTypeList = "" or fileTypeList = "全部" or fileTypeList = "*") and fileTypeList <> "0" then'改进于20140929 文件类型判断完善
                        if inStr("|名称|取名称|", "|" & fileNameOrType & "|") > 0 then
                            c = c & myFile.name & vbCrLf 
                        else
                            c = c & myFile.path & vbCrLf 			'加上.path  写全，在vb.net里非常重要
                        end if 
                    end if 
                    doEvents 
                next 
            end if 

            if inStr("|" & folderType & "|", "|文件夹|") > 0 or inStr("|" & folderType & "|", "|全部文件夹|") > 0 or inStr("|" & folderType & "|", "|全部|") > 0 then
                set fc = f.subFolders
                    for each f1 in fc
                        if inStr("|" & folderType & "|", "|hidefolderlist|") = false then
                            if inStr("|名称|取名称|", "|" & folderNameOrType & "|") > 0 then
                                c = c & f1.name & vbCrLf 
                            elseIf lCase(folderNameOrType) <> "no" then
                                c = c & f1 & vbCrLf 
                            end if 
                        end if 
                        if inStr("|" & folderType & "|", "|全部文件夹|") > 0 or inStr("|" & folderType & "|", "|全部|") > 0 then
                            c = getFileFolderList(f1, fileYes, fileTypeList, fileNameOrType, folderType, folderNameOrType, c) & vbCrLf 
                        end if 
                        doEvents 
                    next 
                set fc = nothing 
            end if 
        set f = nothing 
    set fso = nothing 
    if c <> "" then c = left(c, len(c) - 2) 
    getFileFolderList = c 
    if err then call doError(err.description, "GetFileFolderList 获得全部文件（夹）列表 函数出错，FolderPath=" & folderPath) 
end function 
'获得当前目录下全部Jpg文件
function getDirJpgList(byVal folderPath)
    getDirJpgList = getDirFileList(folderPath, "jpg") 
end function 
'获得当前目录下全部Png文件
function getDirPngList(byVal folderPath)
    getDirPngList = getDirFileList(folderPath, "png") 
end function 
'获得当前目录下全部Ini文件
function getDirIniList(byVal folderPath)
    getDirIniList = getDirFileList(folderPath, "ini") 
end function 
'获得当前目录下全部Txt文件
function getDirTxtList(byVal folderPath)
    getDirTxtList = getDirFileList(folderPath, "txt") 
end function 
'获得当前目录下全部js文件
function getDirJsList(byVal folderPath)
    getDirJsList = getDirFileList(folderPath, "js") 
end function 
'获得当前目录下全部css文件
function getDirCssList(byVal folderPath)
    getDirCssList = getDirFileList(folderPath, "css") 
end function 
'获得当前目录下全部Html文件
function getDirHtmlList(byVal folderPath)
    getDirHtmlList = getDirFileList(folderPath, "html") 
end function 
'获得当前目录下全部asp文件
function getDirAspList(byVal folderPath)
    getDirAspList = getDirFileList(folderPath, "asp") 
end function 
'获得当前目录下全部php文件
function getDirPhpList(byVal folderPath)
    getDirPhpList = getDirFileList(folderPath, "php") 
end function 
'获得当前目录下批量文件列表
function getDirFileList(byVal folderPath, fileTypeList)
    if fileTypeList = "" then
        fileTypeList = "全部" 
    end if 
    getDirFileList = getFileFolderList(folderPath, true, fileTypeList, "", "", "", "") 
end function 

'获得当前目录下全部Jpg文件名称
function getDirJpgNameList(byVal folderPath)
    getDirJpgNameList = getDirFileNameList(folderPath, "jpg") 
end function 
'获得当前目录下全部Png文件名称
function getDirPngNameList(byVal folderPath)
    getDirPngNameList = getDirFileNameList(folderPath, "png") 
end function 
'获得当前目录下全部Ini文件名称
function getDirIniNameList(byVal folderPath)
    getDirIniNameList = getDirFileNameList(folderPath, "ini") 
end function 
'获得当前目录下全部Txt文件名称
function getDirTxtNameList(byVal folderPath)
    getDirTxtNameList = getDirFileNameList(folderPath, "txt") 
end function 
'获得当前目录下全部js文件名称
function getDirJsNameList(byVal folderPath)
    getDirJsNameList = getDirFileNameList(folderPath, "js") 
end function 
'获得当前目录下全部css文件名称
function getDirCssNameList(byVal folderPath)
    getDirCssNameList = getDirFileNameList(folderPath, "css") 
end function 
'获得当前目录下全部Html文件名称
function getDirHtmlNameList(byVal folderPath)
    getDirHtmlNameList = getDirFileNameList(folderPath, "html") 
end function 
'获得当前目录下全部asp文件名称
function getDirAspNameList(byVal folderPath)
    getDirAspNameList = getDirFileNameList(folderPath, "asp") 
end function 
'获得当前目录下全部php文件名称
function getDirPhpNameList(byVal folderPath)
    getDirPhpNameList = getDirFileNameList(folderPath, "php") 
end function 
'获得当前目录下全部类型文件名称
function getDirFileNameList(byVal folderPath, fileTypeList)
    if fileTypeList = "" then
        fileTypeList = "全部" 
    end if 
    getDirFileNameList = getFileFolderList(folderPath, true, fileTypeList, "名称", "", "", "") 
end function 


'获得当前目录下全部文件
function getDirAllFileList(byVal folderPath, fileTypeList)
    if fileTypeList = "" then
        fileTypeList = "全部" 
    end if 
    getDirAllFileList = getFileFolderList(folderPath, true, fileTypeList, "", "全部文件夹|hidefolderlist", "", "") 
end function 
'获得当前目录下全部文件名称
function getDirAllFileNameList(byVal folderPath, fileTypeList)
    if fileTypeList = "" then
        fileTypeList = "全部" 
    end if 
    getDirAllFileNameList = getFileFolderList(folderPath, true, fileTypeList, "名称", "全部文件夹|hidefolderlist", "", "") 
end function 

'获得当前目录下文件夹
function getDirFolderList(byVal folderPath)
    getDirFolderList = getFileFolderList(folderPath, false, "", "", "文件夹", "", "") 
end function 
'获得当前目录下文件夹名称
function getDirFolderNameList(byVal folderPath)
    getDirFolderNameList = getFileFolderList(folderPath, false, "", true, "文件夹", "名称", "") 
end function 

'获得当前目录下全部文件夹
function getDirAllFolderList(byVal folderPath)
    getDirAllFolderList = getFileFolderList(folderPath, false, "", "", "全部文件夹", "", "") 
end function 
'获得当前目录下全部文件夹名称
function getDirAllFolderNameList(byVal folderPath)
    getDirAllFolderNameList = getFileFolderList(folderPath, false, "", true, "全部文件夹", "名称", "") 
end function 


'获得全部文件（夹）数量
function getFileFolderNumb(byVal folderPath, sType, byVal countNumb)
    on error resume next 
    dim fso, f, fc, f1 
    getFileFolderNumb = countNumb 
    call handlePath(folderPath)                                                     '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderPath) = true then
            set f = fso.getFolder(folderPath)
                set fc = f.subFolders
                    if sType = "文件数量" or sType = "全部文件数量" then
                        countNumb = countNumb + f.files.count 
                    elseIf sType = "文件夹数量" or sType = "全部文件夹数量" then
                        countNumb = countNumb + fc.count 
                    elseIf sType = "文件夹大小" then
                        countNumb = f.size 
                    end if 
                    if sType = "全部文件数量" or sType = "全部文件夹数量" then
                        for each f1 in fc
                            countNumb = getFileFolderNumb(f1, sType, countNumb) 
                            doEvents 
                        next 
                    end if 
                set f = nothing 
            set fc = nothing 
        end if 
        getFileFolderNumb = countNumb 
    set fso = nothing 
    if err then call doError(err.description, "GetDirFolderNumb 获得当前目录文件夹数量 函数出错，FolderPath=" & folderPath) 
end function 
'获得当前目录文件夹数量
function getDirFolderNumb(folderPath)
    getDirFolderNumb = getFileFolderNumb(folderPath, "文件夹数量", 0) 
end function 
'获得当前目录文件夹大小
function getDirFolderSize(folderPath)
    getDirFolderSize = getFileFolderNumb(folderPath, "文件夹大小", 0) 
end function 
'获得当前目录文件数量
function getDirFileNumb(folderPath)
    getDirFileNumb = getFileFolderNumb(folderPath, "文件数量", 0) 
end function 
'获得当前目录全部文件数量
function getDirAllFileNumb(folderPath)
    getDirAllFileNumb = getFileFolderNumb(folderPath, "全部文件数量", 0) 
end function 
'获得当前目录全部文件夹数量
function getDirAllFolderNumb(folderPath)
    getDirAllFolderNumb = getFileFolderNumb(folderPath, "全部文件夹数量", 0) 
end function 
'获得全部文件夹列表
function getFolderList(byVal folderPath, sType)
    'On Error Resume Next
    dim fso, f, fc, f1, c 
    c = "" 
    sType = cStr(sType) 
    call handlePath(folderPath)                                                     '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderPath) = true then
            set f = fso.getFolder(folderPath)
                set fc = f.subFolders
                    for each f1 in fc
                        if sType = "名称" or sType = "0" then
                            c = c & f1.name & vbCrLf 
                        else
                            c = c & f1 & vbCrLf 
                        end if 
                        doEvents 
                    next 
                set f = nothing 
            set fc = nothing 
        end if 
        if c <> "" then c = left(c, len(c) - 2) 
        getFolderList = c 
    set fso = nothing 
    if err then call doError(err.description, "GetDirFolderNumb 获得当前目录文件夹数量 函数出错，FolderPath=" & folderPath) 
end function 
'获得文件列表排序
function getDirFileSort(byVal folderPath)
    on error resume next 
    dim fso, f, fc, myFile, id, arrayStr(99), i, c 
    call handlePath(folderPath)                                                     '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderPath) = false then exit function                      '文件夹不存在，退出
        set f = fso.getFolder(folderPath)
            for each myFile in f.files
                if inStr(myFile.name, "#") = false and inStr(myFile.name, "、") > 0 then        '#代表不显示，并且要有、符号
                    id = replace(left(myFile.name, 2), "、", "") 
                    arrayStr(id) = myFile.name 
                end if 
                doEvents 
            next 
            for i = 0 to uBound(arrayStr)
                if arrayStr(i) <> "" then
                    c = c & arrayStr(i) & vbCrLf 
                end if 
            next 
        set f = nothing 
    set fso = nothing 
    getDirFileSort = c 
    if err then call doError(err.description, "GetDirFileSort 获得文件列表排序 函数出错，FolderPath=" & folderPath) 
end function 
'获得文件夹列表排序
function getDirFolderSort(byVal folderPath)
    on error resume next 
    dim fso, f, fc, myFile, id, arrayStr(99), i, c, f1 
    call handlePath(folderPath)                                                     '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if fso.folderExists(folderPath) = false then exit function                      '文件夹不存在，退出
        set f = fso.getFolder(folderPath)
            set fc = f.subFolders
                for each f1 in fc
                    if inStr(f1.name, "#") = 0 and inStr(f1.name, "、") > 0 then                    '#代表不显示，并且要有、符号
                        id = replace(left(f1.name, 2), "、", "") 
                        arrayStr(id) = f1.name 
                        doEvents 
                    end if 
                next 
                for i = 0 to uBound(arrayStr)
                    if arrayStr(i) <> "" then
                        c = c & arrayStr(i) & vbCrLf 
                    end if 
                next 
            set f = nothing 
        set fc = nothing 
    set fso = nothing 
    getDirFolderSort = c 
    if err then call doError(err.description, "GetDirFileSort 获得文件列表排序 函数出错，FolderPath=" & folderPath) 
end function 
'删除目录下的所有文件,2013,10,26
sub delDirAllFile(dirPath)
    dim fso, f, fc 
    set fso = createObject("Scripting.FileSystemObject")
        set f = fso.getFolder(dirPath)
            set fc = f.files
                for each f in fc
                    if fso.fileExists(f) then fso.deleteFile(f) 
                next 
            set fc = nothing 
        set f = nothing 
    set fso = nothing 
end sub 
'删除目录下的所有文件 (辅助)
sub deleteAllFile(dirPath)
    call DelDirAllFile(dirPath) 
end sub 
'获得当前更新文件列表  例 Call Rw(GetUpdateFile("/Inc","html|css|jpg|Asp","全部","n,1,文件路径",""))
'暂时这么设计，设计不友好，当前的息是怎么想的 20150711
function getUpdateFile(byVal folderPath, fileTypeList, folderType, setTime, byVal c)
    'On Error Resume Next
    dim fso, f, fc, myFile, f1, fileType, resultTime, s, setTimeType, splxx, showMsgType 
    setTimeType = "" 
    showMsgType = "" 
    call handlePath(folderPath)                                                     '获得完整路径
    if inStr(setTime, ",") then
        splxx = split(setTime, ",") 
        setTimeType = trim(splxx(0)) 
        setTime = trim(splxx(1)) 
        if uBound(splxx) >= 2 then showMsgType = trim(splxx(2))                         '显示回显内容类型
    end if 
    if setTimeType = "" then
        setTimeType = "s" 
    end if 
    if setTime = "" then
        setTime = -1  
    else
        setTime = cLng(setTime)                                                         '设置时间为数值类型
    end if 

    fileTypeList = lCase(fileTypeList)                                              '文件类型列表小写
    set fso = createObject("Scripting.FileSystemObject")
        if not fso.folderExists(folderPath) then exit function 
        set f = fso.getFolder(folderPath)
            for each myFile in f.files
                if left(myFile.name, 1) <> "#" then
                    'q 季   m 月   y 一年的日数   d 日   w 一周的日数   ww 周   h 时   n 分钟   s 秒
                    '计算时间 然后再上传
                    resultTime = dateDiff(setTimeType, myFile.dateLastModified, now()) 
                    'call echo(MyFile & "("& setTimeType &")", ResultTime & "<=" & SetTime)
                    if resultTime <= setTime or setTime = -1 then
                        fileType = lCase(right(myFile.name, len(myFile.name) - inStrRev(myFile.name, "."))) 
                        'Call Echo(FileType,MyFile)
                        if (inStr("|" & fileTypeList & "|", "|" & fileType & "|") > 0 or fileTypeList = "" or fileTypeList = "全部" or fileTypeList = "*") and fileTypeList <> "0" then'改进于20140929 文件类型判断完善
                            if showMsgType = "文件路径" then
                                s = myFile 
                            else
                                s = myFile & "|" & checkCode(myFile) & "|" & printSpaceValue(myFile.size) & "|" & format_Time(myFile.dateLastModified, 1) & "|" & resultTime & "/" & setTime & "(" & setTime - resultTime & ")" 
                            end if 
                            c = c & s & vbCrLf 
                        end if 
                    end if 
                end if 
                doEvents 
            next 

            if inStr("|当前|全部|文件夹|全部文件夹|", "|" & folderType & "|") > 0 then
                set fc = f.subFolders
                    for each f1 in fc
                        if inStr("|全部|全部文件夹|", "|" & folderType & "|") > 0 then
                            c = getUpdateFile(f1, fileTypeList, folderType, setTime, c) & vbCrLf 
                        end if 
                        doEvents 
                    next 
                set fc = nothing 
            end if 
        set f = nothing 
    set fso = nothing 
    if c <> "" then c = left(c, len(c) - 2) 
    getUpdateFile = c 
'If Err Then call doError(Err.Description, "GetUpdateFile 获得当前更新文件列表 函数出错，FolderName=" & FolderName)
end function 


'获得修改时间 进行对比 20160710
function getFileFolderEditTime(byVal folderPath, sType, byVal timeStr)
    dim fso, f, f1, fc, myFile, openFile, openFolder, fileTime, folderTime 
    call handlePath(folderPath)                                                     '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if not fso.folderExists(folderPath) then exit function 
        set f = fso.getFolder(folderPath)
            if sType = "文件" or sType = "" or sType = "*" then
                for each myFile in f.files

                    set openFile = fso.getFile(myFile)
                        fileTime = openFile.dateLastModified 
                    set openFile = nothing 

                    if timeStr = "" then
                        timeStr = fileTime 
                    elseIf dateDiff("s", timeStr, fileTime) > 0 then
                        timeStr = fileTime 
                    end if 

                next 
            end if 
            if sType = "文件夹" or sType = "*" then
                set fc = f.subFolders
                    for each f1 in fc
						'不比较文件夹
                        if 1 = 2 then
                            set openFolder = fso.getFolder(f1)
                                folderTime = openFolder.dateLastModified 
                            set openFolder = nothing 
                            if folderTime = "" then
                                timeStr = folderTime 
                            elseIf dateDiff("s", timeStr, folderTime) > 0 then
                                timeStr = folderTime 
                            end if 
                        end if 
                        timeStr = getFileFolderEditTime(f1, sType, timeStr) 
                    next 
                set fc = nothing 
            end if 
        set f = nothing 
    set fso = nothing 
    getFileFolderEditTime = timeStr 
end function 




'批量删除文件(夹)  20160804
function deleteDir(byVal folderPath,noDelFolderList,noDelFileList) 
    dim fso, f, fc, myFile, f1, fileType 
    call handlePath(folderPath)                                                     '获得完整路径 
    set fso = createObject("Scripting.FileSystemObject")
        if not fso.folderExists(folderPath) then exit function 
        set f = fso.getFolder(folderPath) 
		for each myFile in f.files
			call deleteFile(myFile)
		next  

		set fc = f.subFolders
			for each f1 in fc
				if instr("|"& noDelFolderList &"|","|"& f1.name &"|")=0 then
					call deleteFolder(f1)
					'call echo("f1",f1)
				end if
			next 
		set fc = nothing  
        set f = nothing 
    set fso = nothing  
end function 
'批量复制文件(夹)  20160804
function copyDir(byVal folderPath,toFolderPath) 
    dim fso, f, fc, myFile, f1, fileType,noDelFolderList
    call handlePath(folderPath)                                                     '获得完整路径 
    set fso = createObject("Scripting.FileSystemObject")
        if not fso.folderExists(folderPath) then exit function 
        set f = fso.getFolder(folderPath) 
		for each myFile in f.files
			call copyfile(myFile, toFolderPath & "/" & myFile.Name)
			
		next  

		set fc = f.subFolders
			for each f1 in fc
				if instr("|"& noDelFolderList &"|","|"& f1.name &"|")=0 then
					call copyfile(f1, toFolderPath & "/" & f1.name)
				end if
			next 
		set fc = nothing  
        set f = nothing 
    set fso = nothing  
end function 


'========================================= 辅助区 =========================================

'处理成完成路径 (2013,9,27
function handlePath(fFPath)                                                     'Path前面不加ByVal 重定义，这样是为了让前面函数里可以使用这个路径完整调用
    fFPath = replace(fFPath, "/", "\") 
    fFPath = replace(fFPath, "\\", "\") 
    fFPath = replace(fFPath, "\\", "\") 
    dim isDir                                                                       '为目录
    isDir = false 
    if right(fFPath, 1) = "\" then
        isDir = true 
    end if 
    if inStr(fFPath, ":") = 0 then
        if left(fFPath, 1) = "\" then
            fFPath = server.mapPath("\") & "\" & fFPath 
        else
            fFPath = server.mapPath(".\") & "\" & fFPath 
        end if 
    end if 
    fFPath = replace(fFPath, "/", "\") 
    fFPath = replace(fFPath, "\\", "\") 
    fFPath = replace(fFPath, "\\", "\") 
    fFPath = fullPath(fFPath) 
    if isDir = true then
        fFPath = fFPath & "\" 
    end if 
    handlePath = fFPath 
end function 
'完整路径
function fullPath(byVal fFPath)
    dim splStr, s, c 
    c = "" 
    fFPath = replace(fFPath, "/", "\") 
    splStr = split(fFPath, "\") 
    for each s in splStr
        s = trim(s) 
        if s <> "" and s <> "." then
            if inStr(c, "\") > 0 and s = ".." then
                c = mid(c, 1, inStrRev(c, "\") - 1) 
            else
                if c <> "" and right(c, 1) <> "\" then c = c & "\" 
                c = c & s 
            end if 
        end if 
    next 
    fullPath = c 
end function 
'真正的路径  PHP里函数 为假返回空
function realPath(byVal fFPath)
    realPath = "" 
    if checkFile(fFPath) then
        realPath = fFPath 
        exit function 
    end if 
    if checkFolder(fFPath) then
        realPath = fFPath 
        exit function 
    end if 
end function 
'处理成相对路径(20150906)  如 a=handleRelativePath("",a)
function handleRelativePath(rootPath, byVal filePath)
    if rootPath = "" then rootPath = "\" 
    rootPath = handlePath(rootPath) 
    filePath = replace(filePath, rootPath, "\") 
    handleRelativePath = filePath 
end function 
'获得目录
function dirName(filePath)
    filePath = handleFileUrl(filePath) 
    if right(filePath, 1) <> "\" then
        filePath = mid(filePath, 1, inStrRev(filePath, "\")) 
    end if 
    dirName = filePath 
end function 
'获得目录 PHP版 20160516
function phpDirName(filePath)
    filePath = handleFileUrl(filePath) 
    if right(filePath, 1) <> "\" then
        filePath = mid(filePath, 1, inStr(filePath, "\")) 
    end if 
    phpDirName = filePath 
end function 
'判断组件是否存在
function isObjInstalled(obj)
    on error resume next 
    isObjInstalled = false                                                          '默认组件为假
    dim xTestObj 
    set xTestObj = createObject(obj)
        if 0 = err.number then isObjInstalled = true                                    '如果组件存在为真
    set xTestObj = nothing 
end function 
'判断组件是否存在 (辅助)
function existsObject(obj)
    existsObject = isObjInstalled(obj) 
end function 
'获得文件操作组件
function getFileObject()
    if existsObject("Scripting.FileSystemObject") then
        getFileObject = "Scripting.FileSystemObject" 
    else
        getFileObject = "Scripting.wang198060FileSystemObject" 
    end if 
end function 
'获得字典组件
function getDictionary()
    if existsObject("Scripting.Dictionary") then
        getDictionary = "Scripting.Dictionary" 
    else
        getDictionary = "Scripting.wang198060Dictionary" 
    end if 
end function 
'获得数据流组件
function getStream()
    if existsObject("Adodb.Stream") then
        getStream = "Adodb.Stream" 
    else
        getStream = "Adodb.wang198060Stream" 
    end if 
end function 
'显示对应属性中文说明
function showAttributeTip(n)
    dim c 
    if n = 0 then c = "0普通文件，" 
    if n >= 128 then
        n = n - 128 
        c = c & "128压缩文件，" 
    end if 
    if n >= 64 then
        n = n - 64 
        c = c & "64快捷键，" 
    end if 
    if n >= 32 then
        n = n - 32 
        c = c & "32存档，" 
    end if 
    if n >= 16 then
        n = n - 16 
        c = c & "16文件夹，" 
    end if 
    if n >= 8 then
        n = n - 8 
        c = c & "8卷材，" 
    end if 
    if n >= 4 then
        n = n - 4 
        c = c & "4系统，" 
    end if 
    if n >= 2 then
        n = n - 2 
        c = c & "2为隐藏，" 
    end if 
    if n >= 1 then
        n = n - 1 
        c = c & "1只读，" 
    end if 
    if c <> "" then c = left(c, len(c) - 1) 
    showAttributeTip = c 
end function  
'KB转M函数，不够1M,自动显示K 最大为G   (追求好看与可读，舒服)   把最小" bytes" 移除掉
function printSpaceValue(byVal numb)
    dim n 
    n = numb 
    if n >= 1073741824 then                                                         '等于1024*1024*1024  VB中用CDec(1024)
        n = n / 1073741824 
        if inStr(n, ".") then
            n = left(n, inStr(n, ".") + 2) 
        end if 
        n = n & " GB" 
    elseIf n >= 1048576 then                                                        '等于1024*1024
        n = n / 1048576 
        if inStr(n, ".") then
            n = left(n, inStr(n, ".") + 2) 
        end if 
        n = n & " MB" 
    else
        n = formatNumber(n / 1024, 2) & " KB"
		if numb<1024 then
			n="0" & n
		end if
	 
    end if 
 
    printSpaceValue = n 
end function 
'KB转M函数 (辅助)
function printSpaceSize(numb)
    printSpaceSize = printSpaceValue(numb) 
end function 
'KB转M函数 (辅助)
function printFileSize(numb)
    printFileSize = printSpaceValue(numb) 
end function 
'获得桌面路径
function getDeskPath()
    dim wshShell 
    set wshShell = createObject("Wscript.shell")
        getDeskPath = wshShell.specialFolders("Desktop") & "\" 
end function
'创建快捷方式*.lnk
function createUrlShortcut(savePath, byVal url)
    dim c 
    c = "[InternetShortcut] " & vbCrLf 
    c = c & "URL=" & url & vbCrLf 
    c = c & "IDList= " & vbCrLf 
    c = c & "[{000214A0-0000-0000-C000-000000000046}] " & vbCrLf 
    c = c & "Prop3=19,2 " & vbCrLf 
    'Response.AddHeader "Content-Disposition", "attachment;filename="&Url&".url;"
    'Response.ContentType = "application/octet-stream"
    call CreateFile(savePath, c) 
    createUrlShortcut = c 
end function 
'创建文件夹快捷方式*.lnk
function createFolderShortcut(savePath, shortcutPath)
    dim c 
    c = "[InternetShortcut]  " & vbCrLf 
    c = c & "URL=file:///" & shortcutPath & vbCrLf 
    c = c & "HotKey=0" & vbCrLf 
    c = c & "IDList=" & vbCrLf 
    c = c & "IconFile=C:\WINDOWS\system32\SHELL32.dll" & vbCrLf 
    c = c & "IconIndex=3" & vbCrLf 
    c = c & "[{000214A0-0000-0000-C000-000000000046}]" & vbCrLf 
    c = c & "Prop3=19,9" & vbCrLf 
    c = c & "[InternetShortcut.A]" & vbCrLf 
    c = c & "URL=file:///" & shortcutPath & vbCrLf 
    c = c & "[InternetShortcut.W]" & vbCrLf 
    c = c & "URL=file:///" & shortcutPath & vbCrLf 
    'Response.AddHeader "Content-Disposition", "attachment;filename="&ShortcutPath&".url;"
    'Response.ContentType = "application/octet-stream"
    call CreateFile(savePath, c) 
    createFolderShortcut = c 
end function 
'寻找目录里相同文件名而不同类型的文件        创建于20140710
function findDirFileName(folderPath, fileName)
    dim fso, f, myFile, fName 
    findDirFileName = "" 
    fileName = lCase(fileName)                                                      '转成小写
    call handlePath(folderPath)                                                     '获得完整路径
    set fso = createObject("Scripting.FileSystemObject")
        if not fso.folderExists(folderPath) then exit function 
        set f = fso.getFolder(folderPath)
            for each myFile in f.files
                fName = lCase(mid(myFile.name, 1, inStrRev(myFile.name, ".") - 1)) 
                if fileName = fName then
                    findDirFileName = myFile.name 
                    exit function 
                end if 
                doEvents 
            next 
        set f = nothing 
    set fso = nothing 
end function 
'寻找目录一组里相同文件名而不同类型的文件 用法 FileName=FindSubDirFileName("E:\","aa|bb|cc")
function findSubDirFileName(folderPath, fileNameList)
    dim splStr, fileName 
    splStr = split(fileNameList, "|") 
    for each fileName in splStr
        fileName = trim(fileName) 
        if fileName <> "" then
            findSubDirFileName = findDirFileName(folderPath, fileName) 
            if findSubDirFileName <> "" then exit function 
        end if 
    next 
end function 


'获得文章填充内容 20150113 GetArticleFillContent("","",9)
function getArticleFillContent(filePath, fileContent, nLen)
    dim splStr, c, nId, i 
    if filePath <> "" then
        fileContent = autoReadFile(filePath) 
    elseIf fileContent = "" then
        fileContent = autoReadFile("\DataDir\自动填文章内容数据.txt") 
    end if 
    splStr = split(fileContent, vbCrLf) 
    randomize 
    for i = 0 to nLen
        nId = cInt(uBound(splStr) * rnd) 
        'Call Echo("nId",nId)
        c = c & splStr(nId) 
    next 
    getArticleFillContent = c 
end function 

'FilePath：E:\E盘\WEB网站\至前网站\filename.asp
'GetFilePathName：filename
'RemoveFileDir：filename.asp
'getFileExtName：asp

'获得路径文件名称
function getFilePathName(byVal filePath)
    filePath = replace(filePath, "\", "/") 
    if inStr(filePath, "/") > 0 then
        filePath = mid(filePath, inStrRev(filePath, "/") + 1) 
    end if 
    if inStr(filePath, ".") > 0 then
        filePath = mid(filePath, 1, inStrRev(filePath, ".") - 1) 
    end if 
    getFilePathName = filePath 
end function 
'获取文件扩展名 后缀(辅助上面)
function getExtension(filePath)
    getExtension = getFilePathName(filePath) 
end function 
'去除文件路径 返回路径中的文件名部分
function removeFileDir(byVal filePath)
    filePath = replace(filePath, "\", "/") 
    if inStr(filePath, "/") > 0 then
        filePath = mid(filePath, inStrRev(filePath, "/") + 1) 
    end if 
    removeFileDir = filePath 
end function 
'返回路径中的文件名部分 (辅助上面)
function baseName(byVal filePath)
    baseName = removeFileDir(filePath) 
end function 
'-----获取扩展名--------------------------------------
function getFileExtName(fileName)
    dim pos 
    pos = inStrRev(fileName, ".") 
    if pos > 0 then
        getFileExtName = mid(fileName, pos + 1) 
    else
        getFileExtName = "" 
    end if 
end function 

'0：E:\E盘\WEB网站\至前网站\filename.asp
'1：E:\E盘\WEB网站\至前网站\      可以这么调用 HandleFilePathArray(FilePath)(1)
'2：filename.asp?v1
'3：filename
'4：asp
'name：filename.asp    去掉?后面值

'文件处理成数组20150124  数组  0原文件路径 1为文件路径   2为文件名称  3为去除文件类型文件名称   4为文件类型后缀名
function handleFilePathArray(byVal filePath)
    dim fileDir, fileName, fileNoTypeName, fileType 
    filePath = handleFileUrl(filePath) 

    fileDir = mid(filePath, 1, inStrRev(filePath, "\")) 
    fileName = mid(filePath, inStrRev(filePath, "\") + 1) 
    if inStrRev(fileName, ".") > 0 then
        fileNoTypeName = mid(fileName, 1, inStrRev(fileName, ".") - 1) 
    else
        fileNoTypeName = "" 
    end if 
	if inStrRev(fileName, ".")=false then
		fileType = ""
	else
    	fileType = mid(fileName, inStrRev(fileName, ".") + 1) 
		
		if instr(fileType,"?")>0 then
			fileType=mid(fileType,1,instr(fileType,"?")-1)
		elseif instr(fileType,"&")>0 then		'对没有?号只有&号则处理20190810
			fileType=mid(fileType,1,instr(fileType,"&")-1)
		end if
		
		
	end if
    'Call Echo("FilePath",FilePath)
    'Call Echo("FileDir",FileDir)
    'Call Echo("FileName",FileName)
    'Call Echo("FileNoTypeName",FileNoTypeName)
    'Call Echo("FileType",FileType)

    handleFilePathArray = split(filePath & vbCrLf & fileDir & vbCrLf & fileName & vbCrLf & fileNoTypeName & vbCrLf & fileType, vbCrLf) 
'HandleFilePathArray=Array(FilePath,FileDir,FileName,FileNoTypeName,FileType)
end function 
'获得文件属性
function getFileAttr(byVal filePath, sType)
	dim nLen
    sType = cstr(sType) 
    if sType = "0" then
        getFileAttr = handleFilePathArray(filePath)(0) 
    elseIf sType = "1" then
        getFileAttr = handleFilePathArray(filePath)(1) 
    elseIf  sType = "2" then
        getFileAttr = handleFilePathArray(filePath)(2) 
    elseIf sType = "name" then
        getFileAttr = handleFilePathArray(filePath)(2) 
		nLen=instr(replace(getFileAttr,"&","?"),"?")
		if nLen>0 then
			getFileAttr=mid(getFileAttr,1,nLen-1)
		end if
    elseIf sType = "3" then
        getFileAttr = handleFilePathArray(filePath)(3) 
    elseIf sType = "4" then
        getFileAttr = handleFilePathArray(filePath)(4) 
    end if 
end function 
'**************************************************
'函数名：getFileExt
'作  用：获取文件扩展名
'举  例：ab.use "mvc" : ctrl.use "file" : ab.c.print ctrl.file.FileExt("aaa.txt")
'**************************************************
function getFileExt(byval fName)
    dim temp : temp = split(fName, ".")
	if ubound(temp)>0 then getFileExt = temp(uBound(temp))
end function
'获得处理后的文件名称
function getStrFileName(byVal filePath)
    getStrFileName = handleFilePathArray(filePath)(2)
end function 
'获得文件名称20160105
function getFileName(byVal filePath)
    getFileName = handleFilePathArray(filePath)(2) 
end function 
'获得上一级目录(20150909)
function getParentPath(byVal dirPath)
    dirPath = handlePath(dirPath) 
    if inStr(dirPath, "\") > 0 then
        if right(dirPath, 1) = "\" then
            dirPath = left(dirPath, len(dirPath) - 1) 
        end if 
        getParentPath = mid(dirPath, 1, inStrRev(dirPath, "\")) 
    end if 
end function 
%>     
