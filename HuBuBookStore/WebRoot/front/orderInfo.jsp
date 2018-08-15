<%@page import="com.cfl.dto.OrderInfoDTO" %>
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
    <link href="css/orderInfo.css" rel="stylesheet" type="text/css"/>

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
                    <li><a href="front/Client_showUnPaidOrderInfo">未结算订单</a></li>
                    <li><a href="front/Client_showPaidOrderInfo">已结算订单</a></li>
                </ul>

            </div>

        </div>
    </div>

    <div id="c_center">
        <div id="bookInfo">
            <div class="bookUl">
                <form action="front/Client_payOrderInfo" id="f1" method="post">
                    <table border="1">
                        <tr align="center">
                            <td class="tableHead">序号</td>
                            <td class="tableHead bookName">书名</td>
                            <td class="tableHead">价格</td>
                            <td class="tableHead">数量</td>
                            <td class="tableHead">小计</td>
                            <td class="tableHead createTime">订单状态</td>
                            <td class="tableHead operaTion" colspan="3">操作</td>
                        </tr>
						<s:iterator value="page.records" var = "odt" status = "status">
	                        <tr align="center">
	                            <input type="hidden" name="orderId<s:property value="#status.index+1"/>" value='<s:property value="#odt.id"/>'/>
	                            <td><s:property value="#status.index+1"/>
	                            </td>
	                            <td><s:property value="#odt.bookName"/>
	                            </td>
	                            <td><span id="price<s:property value="#status.index+1"/>"><s:property value="#odt.price"/></span></td>
	                            <td><input name="bookNum<s:property value="#status.index+1"/>" pattern="[0-9]" class="bookNum" id="updateNum<s:property value="#status.index+1"/>"
	                                       type="text" readonly="false" value="<s:property value="#odt.num"/>"/></td>
	                            <td><span
	                                    id="totalPrice<s:property value="#status.index+1"/>"><s:property value="#odt.num*#odt.price"/></span>
	                            </td>
	                            <td>
	                            <s:if test="#odt.status==1">
	                       			       未结算
	                            </s:if>
	                            <s:elseif test="#odt.status==2">
	                       			       已结算
	                            </s:elseif>
	                            </td>
	                            
	                            <s:if test="#odt.status==1">
	                       			  <td>
	                       			  <a class="bookNum"
	                                   href="front/Client_delOrderInfo?orderInfoId=<s:property value="#odt.id"/>">取消订单</a>&nbsp;&nbsp;
	                       			  <input type="submit" class="bookNum" id="createOfBT" onclick="createOrder(<s:property value="#status.index+1"/>)"
	                       			   style="cursor: pointer;width:60px;font-size:15px;color:#bea68e;" value="结算订单"></td>
	                            </s:if>
	                            
	                            <s:elseif test="#odt.status==2">
	                       			   <td><a class="bookNum"
	                                   href="front/Client_delOrderInfo?orderInfoId=<s:property value="#odt.id"/>">删除订单</a>
	                            </td>
	                            </s:elseif>

	       
	                        </tr>
                  		 </s:iterator>
                    </table>
                </form>
            </div>

         <%@include file="/common/page.jsp" %>

          
        </div>
    </div>

</div>

<div id="footer">
    Copyright © 2015级软件工程产业班
</div>

<script type="text/javascript">
    function createOrder(i) {

        var f1 = document.getElementById("f1");

        f1.action = "front/Client_payOrderInfo?i=" + i;

        f1.submit();
    }

</script>
</body>
</html>
