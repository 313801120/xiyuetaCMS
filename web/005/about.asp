<!--#Include virtual = "/common.Asp"-->
<!--#Include file = "header.Asp"-->
    <!--banner-->
    <div class="sub-banner">
        <div class="sub-banner-info">
            <p class="sub-china"><%=columnName%></p>
            <p class="sub-eng"><%=columnEnName%></p>
        </div>
    </div>
    <!--内容-->
    <div class="sub-content">
        <div class="container clearfix">
            <!--#Include file = "left.Asp"-->
            <div class="sub-right">
                <div class="sub-r-content">
                    <div class="crumb">当前位置：<%=navLocation(navId,"")%>
                    </div>
                    <div class="sub-r-cont">
                        <div class="sub-title">
                            <h1><%=columnName%></h1>
                        </div>
                        <div class="sub-r-info">
                            <p><%=bodyContent%>                    </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--页脚begin-->    
    <!--#Include file = "footer.Asp"-->
    <script src="templates/jinlaser/js/jquery-1.8.3.min.js"></script>
    <script src="templates/jinlaser/js/owl.carousel.js"></script>
    <script src="templates/jinlaser/js/conmon.js"></script>
</body>
</html>