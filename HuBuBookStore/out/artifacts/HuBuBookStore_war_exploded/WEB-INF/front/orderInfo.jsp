<%@page import="com.cfl.domain.OrderInfo" %>
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
            border: 1px solid blue;
        }

        #type ul {

        }

        #type li {
            list-style-type: none;
            text-align: center;
            margin-top: 10px;
        }

        #type a {
            font-size: 17px;
            color: whitesmoke;
            text-decoration: none;
        }

        #type a:hover {
            color: gold;
        }

        #typeHead h1 {
            font-size: 20px;
            color: white;
            border-bottom: 1px solid;
            text-align: center;
        }

        #c_center {
            width: 700px;
            float: left;
            margin-left: 30px;
            border: 1px solid;
        }

        #bookInfo {
            width: 700px;
            float: left;
        }

        .bookImg {
            width: 280px;
            padding-top: 10px;
            padding-bottom: 10px;
            text-align: center;
        }

        .bookImg img {
            width: 210px;
        }

        .bookUl {
            width: 300px;
            min-height: 380px;
            float: left;
            /* border: 1px solid red; */
            margin-left: 30px;
            padding-bottom: 20px;
        }

        #bookInfo ul {
            width: 300px;
            min-height: 380px;
            float: left;
            /* border: 1px solid red; */
            margin-left: 30px;
            padding-bottom: 20px;
        }

        #bookInfo ul li {
            width: 300px;
            margin-top: 10px;
            /* border: 1px solid; */
            list-style-type: none;
            font-size: 15px;
            color: white;
        }

        #footer {
            width: 100%;
            float: left;
        }

        .pageInfo {
            width: 100%;
            float: left;
            text-align: center;
            color: white;
            padding-bottom: 20px;
        }

        .pageInfo a {
            text-decoration: none;
            color: white;
        }

        .pageInfo a:hover {
            text-decoration: none;
            color: gold;
        }

        .pageText {
            margin-left: 10px;
            margin-right: 10px;
        }

        .buyText {
            width: 100%;
            float: left;
            text-align: center;
        }

        .buyText a {
            width: 100%;
            text-decoration: none;
            border: 1px solid;
            padding: 5px;
            color: white;
            text-aign: center;
        }

        .buyText a:hover {
            color: gold;
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
                    <li><a href="/HuBuBookStore/OrderServlet">未处理订单</a></li>
                    <li><a href="/HuBuBookStore/OrderServlet">已处理订单</a></li>
                </ul>

            </div>

        </div>
    </div>

    <div id="c_center">
        <div id="bookInfo">
            <%
                List<OrderInfo> orderInfos = new ArrayList<OrderInfo>();

                orderInfos = (List<OrderInfo>) request.getAttribute("orderInfos");

                int cp = Integer.parseInt(request.getAttribute("cp").toString());

                int totalPage = Integer.parseInt(request.getAttribute("totalPage").toString());

            %>
            <div class="bookUl">
                <table>
                    <%
                        for (int i = 0; i < orderInfos.size(); i++) {
                    %>
                    <tr>
                        <td><%=orderInfos.get(i).getOrderId()%>
                        </td>
                        <td><%=orderInfos.get(i).getNum()%>
                        </td>
                        <td><%=orderInfos.get(i).getPrice()%>
                        </td>
                        <td><%=orderInfos.get(i).getStatus()%>
                        </td>
                        <td><%=orderInfos.get(i).getUser_id()%>
                        </td>
                    </tr>
                </table>
                <div class="buyText"><a href="#">加入购物车</a></div>
            </div>
            <%}%>
            <div class="pageInfo"><span>当前页数:<%=cp%>/总页数:<%=totalPage%></span>
                <a href="/HuBuBookStore/OrderServlet?cp=<%=1%>" class="pageText">首页</a>
                <a href="/HuBuBookStore/OrderServlet?cp=<%=cp-1%>" class="pageText">上一页</a>
                <%
                    for (int i = 1; i <= totalPage; i++) {

                %>
                <%
                    if (i != cp) {
                %>
                <a href="/HuBuBookStore/OrderServlet?cp=<%=i%>" class="pageText">[<%=i%>]</a>
                <%
                } else {
                %>
                <a href="/HuBuBookStore/OrderServlet?cp=<%=i%>" class="pageText"><%=i%>
                </a>
                <%}%>
                <%} %>

                <a href="/HuBuBookStore/OrderServlet?cp=<%=cp+1%>" class="pageText">下一页</a>
                <a href="/HuBuBookStore/OrderServlet?cp=<%=totalPage%>" class="pageText">尾页</a>
            </div>
        </div>
    </div>

</div>

<div id="footer">
    Copyright © 2048 <a href="#">Your Company Name</a> | Template from <a href="http://www.cssmoban.com"
                                                                          target="_parent" title="网站模板">网站模板</a>
</div>
</body>
</html>
