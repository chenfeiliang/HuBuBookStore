<%@page import="com.cfl.domain.Book" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
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
            <form action="OrderInfoServlet?op=addPaid" method="post" id="f1">
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
                    <c:forEach items="${page.records}" var="book" varStatus="status">
                        <tr align="center">
                            <td>${status.index}</td>
                            <input name="imageName${status.index+1}" value="${book.imageName}" type="hidden"/>
                            <input name="category_id${status.index+1}" value="${book.category_id}" type="hidden"/>
                            <td><input name="id${status.index+1}" class="info info${status.index+1} bookId" type="text"
                                       readonly="false" value="${book.id}"/></td>
                            <td><input name="name${status.index+1}" class="info info${status.index+1} bookNameInput"
                                       type="text" readonly="false" value="${book.name}"/></td>
                            <td><input name="price${status.index+1}" class="info info${status.index+1}" type="text"
                                       readonly="false" value="${book.price}"/></td>
                            <td><input name="author${status.index+1}" class="info info${status.index+1}" type="text"
                                       readonly="false" value="${book.author}"/></td>
                            <td><input name="description${status.index+1}" class="info info${status.index+1}"
                                       type="text" readonly="false" value="${book.description}"/></td>
                            <td><a onclick="updateInfo(this,${status.index+1})" id="updateBT${status.index+1}"
                                   style="cursor: pointer;">更改</a></td>
                            <td><a href="BookServlet?op=del&id=${book.id}">删除</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
        <%@include file="/common/page.jsp" %>
        <%--				<div class="pageInfo"><span>当前页数:${page.pageCount==0?0:page.pageNow}/总页数:${page.pageCount}</span>
                                        <a href="${page.url}1" class="pageText">首页</a>
                                        <a href="${page.url}${page.pageNow-1}" class="pageText">上一页</a>
                                        <c:forEach begin = "1" end = "${page.pageCount}" step="1"  var="i">
                                            <c:if test = "${i!=page.pageNow}">
                                                <a href="${page.url}${i}" class="pageText">[${i}]</a>
                                            </c:if>

                                            <c:if test = "${i==page.pageNow}">
                                                <a href="${page.url}${i}" class="pageText">${i}</a>
                                            </c:if>
                                        </c:forEach>

                                        <a href="${page.url}${page.pageNow+1}" class="pageText">下一页</a>
                                        <a href="${page.url}${page.pageCount}" class="pageText">尾页</a>
                        </div>--%>
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
