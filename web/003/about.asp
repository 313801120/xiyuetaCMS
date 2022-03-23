<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->


        
        <div>
            <img src="<%=bannerimage%>" width="100%"></div>
        <!--banner end-->
        <style type="text/css"></style>
        <div class="return width padding">
            当前位置：<%=navLocation(navId,"")%>
        </div>
        <div class="width ab_cont padding">
            <div class="intit">
                <span>
                    <%=columnName%>
                    <i>/ <%=columnEnName%></i>
                </span>
            </div>
            <div class="acom clearfix padding">
                <%=bodyContent%>                    
            </div>
        </div>
        <!--#Include file = "footer.Asp"-->