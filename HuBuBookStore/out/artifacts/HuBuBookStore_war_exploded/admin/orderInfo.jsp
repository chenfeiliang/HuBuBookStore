<%@page import="com.cfl.dto.OrderInfoDTO" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'searchUser.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="css/orderInfoAdmin.css" rel="stylesheet" type="text/css"/>

</head>

<body>
<div id="c_center">
    <div id="bookInfo">
        <%
            List<OrderInfoDTO> orderInfos = new ArrayList<OrderInfoDTO>();

            orderInfos = (List<OrderInfoDTO>) request.getAttribute("orderInfoDTOs");

            int cp = Integer.parseInt(request.getAttribute("cp").toString());

            String op = "all";

            if (request.getAttribute("op") != null) {
                op = request.getAttribute("op").toString();
            }

            int totalPage = Integer.parseInt(request.getAttribute("totalPage").toString());

        %>
        <div class="bookUl">
            <form action="OrderInfoServlet?op=addPaid" method="post">
                <table border="1">
                    <tr align="center">
                        <td class="tableHead">序号</td>
                        <td class="tableHead ">订单号</td>
                        <td class="tableHead bookName">书名</td>
                        <td class="tableHead">价格</td>
                        <td class="tableHead">数量</td>
                        <td class="tableHead">小计</td>
                        <td class="tableHead status">状态</td>
                        <td class="tableHead ">时间</td>
                        <!-- 								<td class="tableHead ">用户</td>   -->
                        <td class="tableHead operaTion" colspan="1">操作</td>

                    </tr>
                    <%
                        for (int i = 0; i < orderInfos.size(); i++) {
                    %>

                    <tr align="center">
                        <td><%=i + 1%>
                        </td>
                        <td><input class="orderId" readOnly="readonly" type="text" name="orderId"
                                   value="<%=orderInfos.get(i).getId()%> "/></td>
                        <td><%=orderInfos.get(i).getBookName()%>
                        </td>
                        <td><span id="price<%=i+1%>"><%=orderInfos.get(i).getPrice()%></span></td>
                        <td><input name="bookNum" pattern="[0-9]" class="bookNum" id="updateNum<%=i+1%>" type="text"
                                   readonly="false" value="<%=orderInfos.get(i).getNum()%>"/></td>
                        <td><span
                                id="totalPrice<%=i+1%>"><%=orderInfos.get(i).getNum() * orderInfos.get(i).getPrice()%></span>
                        </td>
                        <td>
                            <%if (orderInfos.get(i).getStatus() == 1) {%>未付款<%} %>
                            <%if (orderInfos.get(i).getStatus() == 2) {%>已付款<%} %>
                        </td>
                        <td><%=orderInfos.get(i).getCreateTime()%>
                        </td>
                        <%-- 							     <td><%=orderInfos.get(i).getUser_id()%></td>	 --%>
                        <td>
                            <a href="/HuBuBookStore/OrderInfoServlet?op=delAll&id=<%=orderInfos.get(i).getId()%>">取消订单</a>
                        </td>


                    </tr>
                    <%}%>
                </table>
            </form>
        </div>

        <div class="pageInfo"><span>当前页数:<%=totalPage == 0 ? 0 : cp%>/总页数:<%=totalPage%></span>
            <a href="/HuBuBookStore/OrderInfoServlet?op=<%=op%>&cp=<%=1%>" class="pageText">首页</a>
            <a href="/HuBuBookStore/OrderInfoServlet?op=<%=op%>&cp=<%=cp-1%>" class="pageText">上一页</a>
            <%
                for (int i = 1; i <= totalPage; i++) {

            %>
            <%
                if (i != cp) {
            %>
            <a href="/HuBuBookStore/OrderInfoServlet?op=<%=op%>&cp=<%=i%>" class="pageText">[<%=i%>]</a>
            <%
            } else {
            %>
            <a href="/HuBuBookStore/OrderInfoServlet?op=<%=op%>&cp=<%=i%>" class="pageText"><%=i%>
            </a>
            <%}%>
            <%} %>

            <a href="/HuBuBookStore/OrderInfoServlet?op=<%=op%>&cp=<%=cp+1%>" class="pageText">下一页</a>
            <a href="/HuBuBookStore/OrderInfoServlet?op=<%=op%>&cp=<%=totalPage%>" class="pageText">尾页</a>
        </div>
    </div>
</div>
</body>
</html>
