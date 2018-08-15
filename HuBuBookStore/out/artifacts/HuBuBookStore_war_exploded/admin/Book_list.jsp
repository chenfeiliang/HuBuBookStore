<%@page import="com.cfl.domain.Book" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'searchBook.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="css/bookInfo.css">
</head>

<div id="c_center">
    <div id="bookInfo">
        <div class="bookUl">

                <table border="1">
                    <tr align="center">
                        <td class="tableHead ">序号</td>
                        <td class="tableHead bookIdTd">图书ID</td>
                        <td class="tableHead bookName">书名</td>
                        <td class="tableHead">价格</td>
                        <td class="tableHead status">作者</td>
                        <td class="tableHead status">简述</td>
                        <td class="tableHead operaTion" colspan="2">操作</td>

                    </tr>
                    <s:iterator value="page.records" var="book" status="status">
                        <tr align="center">
                            <td><s:property value="#status.index+1"/></td>
                            <input name="imageName"
                                   value="<s:property value="#book.imageName"/>" type="hidden"/>
                            <input name="category_id"
                                   value="<s:property value="#book.category_id"/>" type="hidden"/>
                            <td><input name="id"
                                       class="info info bookId" type="text"
                                       readonly="false" value="<s:property value="#book.id"/>"/></td>
                            <td><input name="name"
                                       class="info info bookNameInput" type="text"
                                       readonly="false" value="<s:property value="#book.name"/>"/></td>
                            <td><input name="price"
                                       class="info info" type="text"
                                       readonly="false" value="<s:property value="#book.price"/>"/></td>
                            <td><input name="author"
                                       class="info info" type="text"
                                       readonly="false" value="<s:property value="#book.author"/>"/></td>
                            <td><input name="description"
                                       class="info info" type="text"
                                       readonly="false" value="<s:property value="#book.description"/>"/></td>
                            <td><a href="admin/Book_updateInput?bookId=<s:property value="#book.id"/>"
                                   id="updateBT" >更改</a>
                            </td>
                            <td><a href="admin/Book_delete?bookId=<s:property value="#book.id"/>">删除</a></td>
                        </tr>
                    </s:iterator>
                </table>
        </div>
        <%@include file="/common/page.jsp" %>
    </div>
</div>
<script type="text/javascript">
    function updateInfo(x, i) {
        var infos = document.getElementsByClassName("info" + i);
        var updateBT = document.getElementById("updateBT" + i);

        if (x.innerHTML == "更改") {
            for (var i = 0; i < infos.length; i++) {
                infos[i].removeAttribute("readOnly");
                infos[i].style.backgroundColor = "white";
                infos[i].style.color = "red";
            }
            updateBT.innerHTML = "完成更改";
        }
        else if (x.innerHTML == "完成更改") {
            var f1 = document.getElementById("f1");

            f1.action = "BookServlet?op=update&i=" + i;

            f1.submit();
        }

    }
</script>
</body>
</html>
