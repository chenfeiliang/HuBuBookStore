<%@page import="com.cfl.service.impl.BookServiceImpl" %>
<%@page import="com.cfl.dao.impl.CategoryDaoImpl" %>
<%@page import="com.cfl.domain.Category" %>
<%@page import="com.cfl.domain.Book" %>
<%@page import="com.cfl.dao.impl.BookDaoImpl" %>
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
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

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
            width: 100%;
        }

        #contents {
            width: 100%;
            /* min-height: 820px; */
            background: url(images/templatemo_content.jpg);
            float: left;
            background-size: cover;
            /* 	border: 1px solid red;  */
        }

        #c_left {
            width: 20%;
            float: left;
            margin-left: 80px;

        }

        #type {
            width: 250px;
            /* border: 1px solid; */
        }

        #type ul {
            margin-top: -10px;

        }

        #type li {
            list-style-type: none;
            text-align: center;
        }

        #type a {
            font-size: 17px;
            color: whitesmoke;
            text-decoration: none;
        }

        #typeHead h1 {
            font-size: 20px;
            border-bottom: 1px solid;
            text-align: center;
        }

        #type ul {
            letter-spacing: 3px;
        }

        #type ul li {
            margin-top: 10px;
        }

        #c_center {
            width: 700px;
            float: left;
            border: 1px solid blue;
            margin-left: 30px;
            border: 1px solid;
        }

        #bookInfo {
            width: 700px;
            float: left;
            border: 1px solid green;
        }

        #bookInfo ul {
            width: 280px;
            min-height: 460px;
            float: left;
            border: 1px solid red;
            margin-left: 50px;
        }

        #bookInfo ul img {
            width: 200px;
        }

        #bookInfo ul li {
            width: 280px;
            margin-top: 10px;
            /* border: 1px solid;	 */
            list-style-type: none;
        }

        .imgClass {
            text-align: center;
        }


    </style>

</head>

<body>

<div class="head">
    <div id="header_wrapper">
        <div id="header">
            <a href="#home"><img src="images/templatemo_logo.png" alt="Wall Shelf"/></a>
        </div>
    </div>

    <div id="menu_wrapper">
        <div id="menu">
            <ul class="navigation">
                <li><a href="#home" class="selected">主页<span class="ui_icon home"></span></a></li>
                <li><a href="#aboutus">我的订单<span class="ui_icon aboutus"></span></a></li>
                <li><a href="#services">购物车<span class="ui_icon services"></span></a></li>
                <li><a href="#gallery">注册<span class="ui_icon gallery"></span></a></li>
                <li><a href="#contactus">登录<span class="ui_icon contactus"></span></a></li>
            </ul>
        </div>
    </div>


</div>

<div id="contents">
    <br>

    <div id="c_left">
        <div id="type">
            <div id="typeHead"><h1>所有分类</h1></div>
            <ul>
                <%
                    CategoryDaoImpl categoryImpl = new CategoryDaoImpl();
                    List<Category> categorys = new ArrayList<Category>();
                    categorys = categoryImpl.findAllCategorys();

                    for (int i = 0; i < categorys.size(); i++) {
                %>
                <li><a href="#"><%=categorys.get(i).getName() %>
                </a></li>
                <% }%>
            </ul>
        </div>
    </div>

    <div id="c_center">
        <div id="bookInfo">
            <%
                BookServiceImpl bookImpl = new BookServiceImpl();

                List<Book> books = new ArrayList<Book>();

                books = bookImpl.findAllBooks();

                for (int i = 0; i < books.size(); i++) {
            %>
            <ul class="bookDetail">
                <li class="imgClass"><img alt="" src="<%=books.get(i).getImageName()%>"></li>
                <li><%=books.get(i).getName()%>
                </li>
                <li><%=books.get(i).getPrice()%>
                </li>
                <li><%=books.get(i).getDescription()%>
                </li>
                <li><%=books.get(i).getAuthor()%>
                </li>
                <li><%=books.get(i).getCategory_id()%>
                </li>
            </ul>
            <%} %>
        </div>
    </div>


</div>

<div id="footer" style="float:left;">
    Copyright © 2048 <a href="#">Your Company Name</a> | Template from <a href="http://www.cssmoban.com"
                                                                          target="_parent" title="网站模板">网站模板</a>
</div>
</body>
</html>
