<% 


'技巧：计算图片等比率缩放方法 宽=213,高=160  缩放后宽=100,高=75   100除213得到小数后两位，四舍五入
'document.write("\n<br>显示" + 100/213)
'document.write("\n<br>计算" + 160*0.47)


'用法
'Call Rw(HandleShowImg("UploadFiles/Soso.gif",100,60,""))
'Call Rw(HandleShowImg("UploadFiles/Soso.gif",100,60,"高"))
'Call Rw(HandleShowImg("UploadFiles/Soso.gif",100,60,"宽"))
'获得图片类型    getFileContentType("/aa.jpg")

'类使用方法20230321
'dim objGPS
'Set objGPS = new GPS
'call die(objGPS.getImageWidth(handlePath("1.bmp"))
 
'psd不行，等加
class GPS
    dim aso 
    sub class_Initialize()
        set aso = createObject("ADODB.Stream")
            aso.mode = 3 
            aso.type = 1 
            aso.open 
    end sub
    sub class_Terminate()
        set aso = nothing 
    end sub 

    '获得图片宽 20230321'
    function getImageWidth(filespec)
       getImageWidth=getImageSize(filespec)(1)
    end function
    '获得图片高 20230311'
    function getImageHeight(filespec)
       getImageHeight=getImageSize(filespec)(2)
    end function


    '///以下是调用代码/// 获得图片文件大小
    function getImageSize(filespec)
        dim bFlag, p1 
        if checkFile(filespec) = false or getFSize(filespec)=0 then exit function                               '图片文件不存 则退出

        aso.loadFromFile(filespec) 
        'On Error Resume Next
        dim ret(3) 
        'call echo("filespec",filespec)
        bFlag = aso.read(3) 
        'Call Echo("bFlag1",Hex(binVal(bFlag)))
        select case hex(binVal(bFlag))
            case "4E5089"
                aso.read(15) 
                ret(0) = "PNG" 
                ret(1) = binVal2(aso.read(2)) 
                aso.read(2) 
                ret(2) = binVal2(aso.read(2)) 
            case "464947"
                aso.read(3) 
                ret(0) = "GIF" 
                ret(1) = binVal(aso.read(2)) 
                ret(2) = binVal(aso.read(2)) 
            case "FFD8FF"
                do
                do : p1 = binVal(aso.read(1)) : loop while p1 = 255 and not aso.EOS
                if p1 > 191 and p1 < 196 then exit do else aso.read(binval2(aso.read(2)) - 2) 
                do : p1 = binVal(aso.read(1)) : loop while p1 < 255 and not aso.EOS 
                loop while true 
                aso.read(3) 
                ret(0) = "JPG" 
                ret(2) = binval2(aso.read(2)) 
                ret(1) = binval2(aso.read(2)) 
            case else
                if left(bin2Str(bFlag), 2) = "BM" then
                    aso.read(15) 
                    ret(0) = "BMP" 
                    ret(1) = binval(aso.read(4)) 
                    ret(2) = binval(aso.read(4)) 
                else
                    ret(0) = "" 
                end if
        end select
        ret(3) = "width=""" & ret(1) & """ height=""" & ret(2) & """" 
        getImageSize = ret 
    end function 



    '获得图片类型
    function getImageType(filespec)
        dim bFlag, p1 
        if checkFile(filespec) = false or getFSize(filespec)=0 then
            getImageType="文件不存在"
         exit function                               '图片文件不存 则退出
        end if

        aso.loadFromFile(filespec) 
        'On Error Resume Next
        dim ret(3) 
        'call echo("filespec",filespec)
        bFlag = aso.read(3) 
        ' Call Echo("bFlag1",Hex(binVal(bFlag)))
        select case hex(binVal(bFlag))
            case "4E5089" 
                getImageType="png"
                exit function
            case "464947"
                getImageType="gif"
                exit function
            case "FFD8FF"                
                getImageType="jpg"
                exit function
            case "88B1F"                
                getImageType="zip"
                exit function
            case else
                if left(bin2Str(bFlag), 2) = "BM" then
                    getImageType="bmp"
                    exit function
                elseif left(bin2Str(bFlag), 2) = "PK" then
                    getImageType="zip"
                    exit function
                else
                    getImageType="("& left(bin2Str(bFlag), 2) &")("& Hex(binVal(bFlag)) &")"
                    exit function
                end if
        end select
        getImageType="33"
        exit function
    end function 
end class  

%>   
