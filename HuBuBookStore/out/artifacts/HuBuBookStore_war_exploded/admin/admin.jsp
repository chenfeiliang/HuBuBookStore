<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'admin.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" title="" rel="stylesheet"/>
    <link title="" href="css/style.css" rel="stylesheet" type="text/css"/>
    <link title="blue" href="css/dermadefault.css" rel="stylesheet" type="text/css"/>
    <link title="green" href="css/dermagreen.css" rel="stylesheet" type="text/css" disabled="disabled"/>
    <link title="orange" href="css/dermaorange.css" rel="stylesheet" type="text/css" disabled="disabled"/>
    <link href="css/templatecss.css" rel="stylesheet" title="" type="text/css"/>
    <script src="script/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="script/jquery.cookie.js" type="text/javascript"></script>
    <script src="bootstrap-3.3.5-dist/js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body>
<nav class="nav navbar-default navbar-mystyle navbar-fixed-top">
    <div class="navbar-header">
        <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand mystyle-brand"><span class="glyphicon glyphicon-home"></span></a></div>
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li class="li-border"><a class="mystyle-color" href="#">管理控制台</a></li>
        </ul>

        <ul class="nav navbar-nav pull-right">
            <li class="dropdown li-border"><a href="#" class="dropdown-toggle mystyle-color"
                                              data-toggle="dropdown">退出</a></li>
            <li class="dropdown"><a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">换肤<span
                    class="caret"></span></a>
                <ul class="dropdown-menu changecolor">
                    <li id="blue"><a href="#">蓝色</a></li>
                    <li class="divider"></li>
                    <li id="green"><a href="#">绿色</a></li>
                    <li class="divider"></li>
                    <li id="orange"><a href="#">橙色</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<div class="down-main">
    <div class="left-main left-full">
        <div class="sidebar-fold"><span class="glyphicon glyphicon-menu-hamburger"></span></div>
        <div class="subNavBox">
            <div class="sBox">
                <div class="subNav sublist-up"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span
                        class="sublist-title">用户管理</span>
                </div>
                <ul class="navContent" style="display:none">
                    <li>
                        <div class="showtitle" style="width:100px;"><img src="img/leftimg.png"/>查看用户</div>
                        <a href="UserServlet?op=searchAll" target="mainInfo"><span
                                class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">查看用户</span></a>
                    </li>
                    <li>
                        <div class="showtitle" style="width:100px;"><img src="img/leftimg.png"/>增加用户</div>
                        <a href="admin/addUserUI.jsp" target="mainInfo"><span
                                class="sublist-icon glyphicon glyphicon-envelope"></span><span
                                class="sub-title">增加用户</span></a></li>
                </ul>
            </div>
            <div class="sBox">
                <div class="subNav sublist-up"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span
                        class="sublist-title">分类管理</span></div>
                <ul class="navContent" style="display:none">
                    <li>
                        <div class="showtitle" style="width:100px;"><img src="img/leftimg.png"/>查看分类</div>
                        <a href="CategoryServlet?op=searchAll" target="mainInfo"><span
                                class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">查看分类</span></a>
                    </li>
                    <li>
                        <div class="showtitle" style="width:100px;"><img src="img/leftimg.png"/>添加分类</div>
                        <a href="admin/addCategoryUI.jsp" target="mainInfo"><span
                                class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">添加分类</span></a>
                    </li>
                </ul>
            </div>

            <div class="sBox">
                <div class="subNav sublist-up"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span
                        class="sublist-title">书籍管理</span></div>
                <ul class="navContent" style="display:none">
                    <li>
                        <div class="showtitle" style="width:100px;"><img src="img/leftimg.png"/>查看书籍</div>
                        <a href="BookServlet?op=searchAll" target="mainInfo"><span
                                class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">查看书籍</span></a>
                    </li>
                    <li>
                        <div class="showtitle" style="width:100px;"><img src="img/leftimg.png"/>添加书籍</div>
                        <a href="BookServlet?op=gotoAddBookUI" target="mainInfo"><span
                                class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">添加书籍</span></a>
                    </li>
                </ul>
            </div>

            <div class="sBox">
                <div class="subNav sublist-up"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span
                        class="sublist-title">订单管理</span></div>
                <ul class="navContent" style="display:none">
                    <li>
                        <div class="showtitle" style="width:100px;"><img src="img/leftimg.png"/>查看订单</div>
                        <a href="OrderInfoServlet?op=all_admin" target="mainInfo"><span
                                class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">查看订单</span></a>
                    </li>

                </ul>
            </div>

        </div>
    </div>
    <div class="right-product my-index right-full">

        <iframe src="" name="mainInfo" width="100%" frameBorder="0" height="650px"></iframe>

    </div>
</div>
<script type="text/javascript">
    $(function () {
        /*换肤*/
        $(".dropdown .changecolor li").click(function () {
            var style = $(this).attr("id");
            $("link[title!='']").attr("disabled", "disabled");
            $("link[title='" + style + "']").removeAttr("disabled");

            $.cookie('mystyle', style, {expires: 7}); // 存储一个带7天期限的 cookie
        })
        var cookie_style = $.cookie("mystyle");
        if (cookie_style != null) {
            $("link[title!='']").attr("disabled", "disabled");
            $("link[title='" + cookie_style + "']").removeAttr("disabled");
        }
        /*左侧导航栏显示隐藏功能*/
        $(".subNav").click(function () {
            /*显示*/
            if ($(this).find("span:first-child").attr('class') == "title-icon glyphicon glyphicon-chevron-down") {
                $(this).find("span:first-child").removeClass("glyphicon-chevron-down");
                $(this).find("span:first-child").addClass("glyphicon-chevron-up");
                $(this).removeClass("sublist-down");
                $(this).addClass("sublist-up");
            }
            /*隐藏*/
            else {
                $(this).find("span:first-child").removeClass("glyphicon-chevron-up");
                $(this).find("span:first-child").addClass("glyphicon-chevron-down");
                $(this).removeClass("sublist-up");
                $(this).addClass("sublist-down");
            }
            // 修改数字控制速度， slideUp(500)控制卷起速度
            $(this).next(".navContent").slideToggle(300).siblings(".navContent").slideUp(300);
        })
        /*左侧导航栏缩进功能*/
        $(".left-main .sidebar-fold").click(function () {

            if ($(this).parent().attr('class') == "left-main left-full") {
                $(this).parent().removeClass("left-full");
                $(this).parent().addClass("left-off");

                $(this).parent().parent().find(".right-product").removeClass("right-full");
                $(this).parent().parent().find(".right-product").addClass("right-off");

            }
            else {
                $(this).parent().removeClass("left-off");
                $(this).parent().addClass("left-full");

                $(this).parent().parent().find(".right-product").removeClass("right-off");
                $(this).parent().parent().find(".right-product").addClass("right-full");

            }
        })

        /*左侧鼠标移入提示功能*/
        $(".sBox ul li").mouseenter(function () {
            if ($(this).find("span:last-child").css("display") == "none") {
                $(this).find("div").show();
            }
        }).mouseleave(function () {
            $(this).find("div").hide();
        })
    })
</script>
</body>
</html>
