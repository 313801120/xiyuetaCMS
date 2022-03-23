<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title><%=webTitle%></title>
    <meta name="keywords" content="<%=webKeywords%>" />
    <meta name="description" content="<%=webDescription%>" />
    <link rel="stylesheet" type="text/css" href="templates/cqmrgroup/css/style.css" />
    <link rel="stylesheet" type="text/css" href="templates/cqmrgroup/css/media.css" />
    <link rel="stylesheet" type="text/css" href="templates/cqmrgroup/css/font-awesome.min.css" />
    <script type="text/javascript" src="templates/cqmrgroup/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="templates/cqmrgroup/js/base.js"></script>
    <script type="text/javascript" src="templates/cqmrgroup/js/member.js"></script>
    <link rel="stylesheet" type="text/css" href="templates/cqmrgroup/css/validform.css" />
    <script type="text/javascript" src="templates/cqmrgroup/js/validform_v5.3.2.js"></script>
    <script type="text/javascript" src="templates/cqmrgroup/js/layer.js"></script>
</head>

<body>
    <div class="top">
        <a href="/">
            <img src="<%=webLogo%>" alt="" class="logo"></a>
        <div class="nav">
            <ul><%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 order by sortRank asc" ,conn,1,1
while not rs.eof
%>
<%if isFocusNav(rs) then%>
<li class="navcur">
                    <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
                    <em>/</em>
                    <span></span>
                </li>
<%else%>
<li >
                    <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
                    <em>/</em>
                    <span></span>
                </li>
<%end if%>
<%rs.movenext:wend:rs.close%>
            </ul>
        </div>
        <div class="ss">
            <form name="ssform" id="ssform" action="search.asp" method="post">
                <input type="submit" name="ssubmit" id="ssubmit" value="" class="ssbut">
                <input type="text" name="key" id="key" class="skey"></form>
        </div>
        <img src="templates/cqmrgroup/images/sanxian.png" class="sanxian">
        <div class="clear"></div>
    </div>
    <!--*****************************************************************************-->
    <div class="wapnav">
        <ul><%rs.open "select * from " & db_PREFIX & "WebColumn where parentId=-1 and isThrough=1 order by sortRank asc" ,conn,1,1
while not rs.eof
%>
<li>
                <span>
                    <a href="<%=getNavUrl(rs("id"),rs("columnType"))%>" title="<%=rs("columnName")%>" alt=""><%=rs("columnName")%></a>
                </span>
            </li><%rs.movenext:wend:rs.close%>
        </ul>
    </div>
    <script type="text/javascript">$(function(){
    $(".sanxian").click(function(){
        $(".wapnav").slideToggle();
    });
});</script>