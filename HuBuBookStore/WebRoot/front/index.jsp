<%@page import="com.cfl.domain.Book" %>
<%@page import="com.cfl.domain.Category" %>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
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

<%@include file="/common/head.jsp" %>

<div id="contents">
    <br>

    <div id="c_left">
        <div id="type">
            <div id="typeHead"><h1>所有分类</h1></div>
            <div class="typeUl">
                <ul>
                    <s:iterator value="categorys" var = "c">          
                        <li>
                            <a href="front/Client_showByCategory?cid=<s:property value="#c.id"/>"><s:property value="#c.name"/></a>
                        </li>
                    </s:iterator>
                </ul>

            </div>

        </div>
    </div>

    <div id="c_center">
        <div id="bookInfo">

            <s:iterator value = "page.records" var = "book">

                <div class="bookUl">
                    <ul>
                        <li></li>
                        <li>
                            <div class="bookImg">
                            <img alt="<s:property value ="#book.imageName" />" title="<s:property value ="#book.imageName" />" src="<s:property value ="#book.imageName"/>"/> 
                            </div>
                        </li>
                        
                        <li>
                        
                        &nbsp;&nbsp;书名&nbsp;:&nbsp;&nbsp;&nbsp;
                        
                        <s:if test="#book.name.length()>15">
                      		  <s:property value ="#book.name.substring(0,15)" />
                      		  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value ="#book.name.substring(15,#book.name.length())" />
                        </s:if>
                        
                        <s:else>
                         	  <s:property value ="#book.name" />                   
                        </s:else>

                        </li>
                        <li>&nbsp;&nbsp;价格&nbsp;&nbsp;:&nbsp;&nbsp;<s:property value ="#book.price" /></li>
                        <li>&nbsp;&nbsp;作者&nbsp;&nbsp;:&nbsp;&nbsp;<s:property value ="#book.author" /></li>
                        <li>&nbsp;&nbsp;简介&nbsp;&nbsp;:&nbsp;&nbsp;<s:property value ="#book.description" /></li>
                    </ul>
                    <div class="buyText"><a href="front/Client_addShopCart?bid=<s:property value ="#book.id" />">加入购物车</a></div>
                </div>

            </s:iterator>
            <%@include file="/common/page.jsp" %>

        </div>
    </div>

</div>

<div id="footer">
    Copyright © 2015级软件工程产业班
</div>
</body>
</html>
