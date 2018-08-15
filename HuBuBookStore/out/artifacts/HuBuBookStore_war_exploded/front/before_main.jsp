<%@page import="com.cfl.domain.Book" %>
<%@page import="com.cfl.domain.Category" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
    <link href="css/before_main.css" rel="stylesheet" type="text/css"/>

    <script src="js/jquery-1.2.6.js" type="text/javascript"></script>
    <script src="js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
    <script src="js/jquery.localscroll-1.2.5.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.serialScroll-1.2.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/coda-slider.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.easing.1.3.js" type="text/javascript" charset="utf-8"></script>

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
                <li><a href="/HuBuBookStore/MainServlet" class="selected">主页<span class="ui_icon home"></span></a></li>
                <li><a href="/HuBuBookStore/OrderInfoServlet?op=shopCar">购物车<span class="ui_icon aboutus"></span></a>
                </li>
                <li><a href="/HuBuBookStore/OrderInfoServlet?op=all">我的订单<span class="ui_icon services"></span></a></li>
                <li><a href="front/register.jsp">注册<span class="ui_icon gallery"></span></a></li>
                <li><a href="front/login.jsp">登录<span class="ui_icon contactus"></span></a></li>
            </ul>
        </div>
    </div>


</div>

<div id="contents">
    <br>

    <div id="c_left">
        <div id="type">
            <div id="typeHead"><h1>所有分类</h1></div>
            <div class="typeUl">
                <ul>
                    <c:forEach items="${categorys}" var="category">
                        <li>
                            <a href="ClientServlet?op=showBooksOfCategory&categoryId=${category.id}">${category.name}</a>
                        </li>
                    </c:forEach>
                </ul>

            </div>

        </div>
    </div>

    <div id="c_center">
        <div id="bookInfo">

            <c:forEach items="${page.records}" var="book" varStatus="status">

                <div class="bookUl">
                    <ul>
                        <li></li>
                        <li>
                            <div class="bookImg"><img alt="${book.imageName}" title="${book.imageName}"
                                                      src="${book.imageName}"></div>
                        </li>
                        <li>&nbsp;&nbsp;书名&nbsp;:&nbsp;&nbsp;&nbsp;${book.name}</li>
                        <li>&nbsp;&nbsp;价格&nbsp;&nbsp;:&nbsp;&nbsp;${book.price}</li>
                        <li>&nbsp;&nbsp;作者&nbsp;&nbsp;:&nbsp;&nbsp;${book.author}</li>
                        <li>&nbsp;&nbsp;简介&nbsp;&nbsp;:&nbsp;&nbsp;${book.description}</li>
                    </ul>
                    <div class="buyText"><a href="/HuBuBookStore/addShoppingCarServlet?bid=${book.id}">加入购物车</a></div>
                </div>

            </c:forEach>
            <%@include file="/common/page.jsp" %>

        </div>
    </div>

</div>

<div id="footer">
    Copyright © 2015级软件工程产业班
</div>
</body>
</html>
