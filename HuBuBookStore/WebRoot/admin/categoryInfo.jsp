<%@page import="com.cfl.domain.Category" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'searchCategory.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="css/categoryInfo.css">
</head>

<body>
<div id="c_center">
    <div id="bookInfo">
        <%
            List<Category> categorys = new ArrayList<Category>();

            categorys = (List<Category>) request.getAttribute("categorys");

            int cp = Integer.parseInt(request.getAttribute("cp").toString());

            String op = "searchAll";

            if (request.getAttribute("op") != null) {
                op = request.getAttribute("op").toString();
            }

            int totalPage = Integer.parseInt(request.getAttribute("totalPage").toString());

        %>
        <div class="bookUl">
            <form action="OrderInfoServlet?op=addPaid" method="post" id="f1">
                <table border="1">
                    <tr align="center">
                        <td class="tableHead ">序号</td>
                        <td class="tableHead userIdTd">类型ID</td>
                        <td class="tableHead">类型名</td>
                        <td class="tableHead">类型简述</td>
                        <td class="tableHead operaTion" colspan="2">操作</td>

                    </tr>
                    <%
                        for (int i = 0; i < categorys.size(); i++) {
                    %>

                    <tr align="center">
                        <td><%=i + 1%>
                        </td>
                        <td><input name="categoryId<%=i+1%>" class="info info<%=i+1%> userId" type="text"
                                   readonly="false" value="<%=categorys.get(i).getId()%>"/></td>
                        <td><input name="categoryName<%=i+1%>" class="info info<%=i+1%>" type="text" readonly="false"
                                   value="<%=categorys.get(i).getName()%>"/></td>
                        <td><input name="categoryDescription<%=i+1%>" class="info info<%=i+1%>" type="text"
                                   readonly="false" value="<%=categorys.get(i).getDescription()%>"/></td>
                        <td><a onclick="updateInfo(this,<%=i+1%>)" id="updateBT<%=i+1%>" style="cursor: pointer;">更改</a>
                        </td>
                        <td><a href="CategoryServlet?op=del&id=<%=categorys.get(i).getId()%>">删除</a></td>
                    </tr>
                    <%}%>
                </table>
            </form>
        </div>

        <div class="pageInfo"><span>当前页数:<%=totalPage == 0 ? 0 : cp%>/总页数:<%=totalPage%></span>
            <a href="CategoryServlet?op=<%=op%>&cp=<%=1%>" class="pageText">首页</a>
            <a href="CategoryServlet?op=<%=op%>&cp=<%=cp-1%>" class="pageText">上一页</a>
            <%
                for (int i = 1; i <= totalPage; i++) {

            %>
            <%
                if (i != cp) {
            %>
            <a href="CategoryServlet?op=<%=op%>&cp=<%=i%>" class="pageText">[<%=i%>]</a>
            <%
            } else {
            %>
            <a href="CategoryServlet?op=<%=op%>&cp=<%=i%>" class="pageText"><%=i%>
            </a>
            <%}%>
            <%} %>

            <a href="CategoryServlet?op=<%=op%>&cp=<%=cp+1%>" class="pageText">下一页</a>
            <a href="CategoryServlet?op=<%=op%>&cp=<%=totalPage%>" class="pageText">尾页</a>
        </div>
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

            f1.action = "CategoryServlet?op=update&i=" + i;

            f1.submit();
        }

    }
</script>
</body>
</html>
