<% 
'#禁止自动更新当前文件'  #号去掉代表此文件不被程序自动更新替换掉

                 '''
'               (0 0)
'   +-----oOO----(_)------------+
'   |                           |
'   |    author:XIYUETA         |
'   |    QQ:313801120           |
'   |    www.xiyueta.com        |
'   |                           |
'   +------------------oOO------+
'              |__|__|
'               || ||
'              ooO Ooo

cssName="topnav002" 
resurl="/web/tpl/topnav/002/"
 %>
 
<div class="header<%=cssName%> visible-sm visible-xs" cpid="1467" id="smv_Area0" style="width:100%; height: 278px;  position: relative; margin: 0 auto">
    <div id="smv_tem_14_23" ctype="nav"  class="esmartMargin smartAbs " cpid="1467" cstyle="Style4" ccolor="Item0" areaId="Area0" isContainer="False" pvid="" tareaId="Area0"  re-direction="y" daxis="All" isdeletable="True" style="height: 73px; width: 100%; left: 0px; top: 77px;z-index:0;">
        <div class="yibuFrameContent tem_14_23  nav_Style4 yibuFullScreen " style="overflow:visible;margin:0 0px;" >
            <div id="nav_tem_14_23" class="nav_pc_t_1">
                <ul class="mw-nav">



<%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 and flags like'%top%' order by sortRank asc" ,conn,1,1
while not rs.eof
%>  
                    <li class="mw-nav-inner">
                        <div class="mw-nav-item">
                            <i class="mw-nav-item-line"></i>
                            <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" class="mw-nav-item-link lz-compare">
                                <div class="mw-nav-item-link-inner lz-compare">
                                    <span class="mw-iconfont"><%=IIF(rs("columnico")<>"",rs("columnico"),rs("columnenname"))%></span>
                                    <span class="mw-link-txt"><%=rs("columnName")%></span>
                                </div>
                            </a>
                        </div>
                    </li>
<%rs.movenext:wend:rs.close%>


 




                </ul>
            </div>
            <script>$(function () {
        var $inner = $("#smv_tem_14_23 .mw-nav-inner");
        var count = $inner.length;
        var percent = 100 / count + "%";
        $inner.css("width", percent);

        //SetNavSelectedStyleForMobile('nav_tem_14_23');//选中当前导航

    });</script>
        </div>
    </div>
    <div id="smv_tem_15_32" ctype="area"  class="esmartMargin smartAbs " cpid="1467" cstyle="Style1" ccolor="Item0" areaId="Area0" isContainer="True" pvid="" tareaId="Area0"  re-direction="all" daxis="All" isdeletable="True" style="height: 91px; width: 100%; left: 0px; top: -1px;z-index:23;">
        <div class="yibuFrameContent tem_15_32  area_Style1 yibuFullScreen " style="overflow:visible;margin:0 0px;" >
            <div class="m-container">
                <div class="smAreaC" id="smc_Area0" cid="tem_15_32">
                    <div id="smv_tem_18_15" ctype="image"  class="esmartMargin smartAbs " cpid="1467" cstyle="Style1" ccolor="Item0" areaId="Area0" isContainer="False" pvid="tem_15_32" tareaId="Area0"  re-direction="all" daxis="All" isdeletable="True" style="height: 62px; width: 182px; left: 7px; top: 8px;z-index:29;">
                        <div class="yibuFrameContent tem_18_15  image_Style1  " style="overflow:visible;;" >
                            <div class="pic_m_t_1 image-clip-wrap" data-filltype="0" id="div_tem_18_15" style="height:60px;">
                                <a class="w-image-box" target="_self"  href=""><img src="<%=resUrl%>images/29436688.jpg" alt="" title="" id="img_smv_tem_18_15"
             class="imgCliped">
                                </a>
                            </div>
                            <script type="text/javascript">$(function () {

    });</script>
                        </div>
                    </div>
                    <div id="smv_tem_19_21" ctype="companyinfo"  class="esmartMargin smartAbs " cpid="1467" cstyle="Style2" ccolor="Item0" areaId="Area0" isContainer="False" pvid="tem_15_32" tareaId="Area0"  re-direction="all" daxis="All" isdeletable="True" style="height: 30px; width: 126px; left: 128px; top: 69px;z-index:30;">
                        <div class="yibuFrameContent tem_19_21  companyinfo_Style2  " style="overflow:hidden;;" >
                            <ul class="w-company-info iconStyle1">
                                <li class="company-info-item">
                                    <a href="tel:<%=webphone%>" >
                                        <div class="company-info-titleBox">
                                            <span class="company-info-icon ">
                                                <i class="ltd-icon  gs-dianhua"></i>
                                            </span>
                                            <span class="company-info-title   mw-icon-hide "style="white-space:pre">电话：<%=webphone%></span>
                                        </div>
                                        <div class="company-text">
                                            <span class="company-info-text"><%=webphone%></span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div id="smv_tem_20_13" ctype="image"  class="esmartMargin smartAbs " cpid="1467" cstyle="Style1" ccolor="Item0" areaId="Area0" isContainer="False" pvid="tem_15_32" tareaId="Area0"  re-direction="all" daxis="All" isdeletable="True" style="height: 46px; width: 47px; left: 256px; top: 38px;z-index:36;">
                        <div class="yibuFrameContent tem_20_13  image_Style1  " style="overflow:visible;;" >
                            <div class="pic_m_t_1 image-clip-wrap" data-filltype="0" id="div_tem_20_13" style="height:44px;">
                                <a class="w-image-box" target="_self"  href=""><img src="<%=webqrcode%>" alt="" title="" id="img_smv_tem_20_13"
             class="">
                                </a>
                            </div>
                            <script type="text/javascript">$(function () {
            
                //InitImageSmv("tem_20_13", "45", "46", "0");
            

    });</script>
                        </div>
                    </div>
                    <div id="smv_tem_22_8" ctype="text"  class="esmartMargin smartAbs " cpid="1467" cstyle="Style1" ccolor="Item3" areaId="Area0" isContainer="False" pvid="tem_15_32" tareaId="Area0"  re-direction="all" daxis="All" isdeletable="True" style="height: 82px; width: 119px; left: 131px; top: -8px;z-index:39;">
                        <div class="yibuFrameContent tem_22_8  text_Style1  " style="overflow:hidden;;" >
                            <div id='txt_tem_22_8'>
                                <div class="editableContent" id="txtc_tem_22_8" style="height: 100%;word-wrap:break-word;">
                                    <p> </p>
                                    <p> </p>
                                    <h6> </h6>
                                    <p style="text-align:right"> </p>
                                    <p> </p>
                                    <p>
                                        <span style="color:#ffffff">
                                            <span style="font-family:Source Han Sans,Geneva,sans-serif">
                                                <span style="font-size:14px">扫二维码 了解更多</span>
                                            </span>
                                        </span>
                                    </p>
                                </div>
                            </div>
                            <script>var tables = $(' #smv_tem_22_8').find('table')
    for (var i = 0; i < tables.length; i++) {
        var tab = tables[i]
        var borderWidth = $(tab).attr('border')
        if (borderWidth <= 0 || !borderWidth) {
            console.log(tab)
            $(tab).addClass('hidden-border')
            $(tab).children("tbody").children("tr").children("td").addClass('hidden-border')
            $(tab).children("tbody").children("tr").children("th").addClass('hidden-border')
            $(tab).children("thead").children("tr").children("td").addClass('hidden-border')
            $(tab).children("thead").children("tr").children("th").addClass('hidden-border')
            $(tab).children("tfoot").children("tr").children("td").addClass('hidden-border')
            $(tab).children("tfoot").children("tr").children("th").addClass('hidden-border')
        }
    }</script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>