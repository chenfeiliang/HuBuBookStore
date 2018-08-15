<%@page import="com.cfl.domain.Book" %>
<%@page import="com.cfl.domain.Category" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'before_main.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/coda-slider.css" type="text/css" media="screen" title="no title" charset="utf-8"/>

    <script src="js/jquery-1.2.6.js" type="text/javascript"></script>
    <script src="js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
    <script src="js/jquery.localscroll-1.2.5.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.serialScroll-1.2.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/coda-slider.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.easing.1.3.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        * {
            padding: 0;
            margin: 0;
        }

        .head {

        }

        #contents {
            width: 100%;
            min-height: 420px;
            background: url(images/templatemo_content.jpg);
            float: left;
        }

        #c_left {
            width: 20%;
            float: left;
            margin-left: 80px;

        }

        #type {
            width: 250px;

        }

        #c_center {
            width: 700px;
            float: left;
            margin-left: 430px;
            /* border: 1px solid;  */
        }

        #bookInfo {
            width: 700px;
            float: left;
        }

        #footer {
            width: 100%;
            float: left;
        }

        .login {
            width: 100%;
            left: 30%;
            position: relative;
        }

        .userName {
            width: 250px;
            height: 40px;
            margin-top: 30px;
        }

        .passWord {
            width: 250px;
            height: 40px;
            margin-top: 30px;
        }

        .Go {
            width: 150px;
            height: 40px;
            margin-top: 30px;
            margin-left: 50px;
        }


    </style>
</head>

<body>

<div class="head">

    <div id="header_wrapper">
        <div id="header">
            <a href="#home"><img src="images/templatemo_logo1.png" alt=""/></a>
        </div>
    </div>

    <div id="menu_wrapper">
        <div id="menu">
            <ul class="navigation">
                <li><a href="/HuBuBookStore/MainServlet">主页<span class="ui_icon home"></span></a></li>
                <li><a href="/HuBuBookStore/OrderInfoServlet?op=shopCar">购物车<span class="ui_icon aboutus"></span></a>
                </li>
                <li><a href="/HuBuBookStore/OrderInfoServlet?op=all">我的订单<span class="ui_icon services"></span></a></li>
                <li><a href="front/register.jsp">注册<span class="ui_icon gallery"></span></a></li>
                <li><a href="front/login.jsp" class="selected">登录<span class="ui_icon contactus"></span></a></li>
            </ul>
        </div>
    </div>


</div>

<div id="contents">
    <br>

    <div id="c_left">
        <div id="type">

        </div>
    </div>

    <div id="c_center">
        <form action="/HuBuBookStore/LoginServlet?op=userLogin" method="post">
            <div class="login">
                <input type="text" class="userName" name="userName" placeholder="账号"/>
                <br>
                <input type="password" class="passWord" name="passWord" placeholder="密码">
                <br>
                <input type="submit" class="go" value="登录"/>
            </div>
        </form>
    </div>

</div>

<div id="footer">
    Copyright © 2015级软件工程产业班
</div>
</body>
</html>
