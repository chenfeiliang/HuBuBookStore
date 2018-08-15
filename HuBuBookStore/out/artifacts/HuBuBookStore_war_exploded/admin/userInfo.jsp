<%@page import="com.cfl.domain.User" %>
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

    <link rel="stylesheet" type="text/css" href="css/userInfo.css">


</head>

<body>
<div id="c_center">
    <div id="bookInfo">
        <%
            List<User> users = new ArrayList<User>();

            users = (List<User>) request.getAttribute("users");

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
                        <td class="tableHead userIdTd">用户ID</td>
                        <td class="tableHead">用户名</td>
                        <td class="tableHead">密码</td>
                        <td class="tableHead">电话</td>
                        <td class="tableHead status">手机号码</td>
                        <td class="tableHead status">邮箱</td>
                        <td class="tableHead operaTion" colspan="2">操作</td>

                    </tr>
                    <%
                        for (int i = 0; i < users.size(); i++) {
                    %>

                    <tr align="center">
                        <td><%=i + 1%>
                        </td>
                        <td><input name="userId<%=i+1%>" class="info info<%=i+1%> userId" type="text" readonly="false"
                                   value="<%=users.get(i).getId()%>"/></td>
                        <td><input name="userName<%=i+1%>" class="info info<%=i+1%>" type="text" readonly="false"
                                   value="<%=users.get(i).getUserName()%>"/></td>
                        <td><input name="passWord<%=i+1%>" class="info info<%=i+1%>" type="text" readonly="false"
                                   value="<%=users.get(i).getPassWord()%>"/></td>
                        <td><input name="cellPhone<%=i+1%>" class="info info<%=i+1%>" type="text" readonly="false"
                                   value="<%=users.get(i).getCellPhone()%>"/></td>
                        <td><input name="mobilePhone<%=i+1%>" class="info info<%=i+1%>" type="text" readonly="false"
                                   value="<%=users.get(i).getMobilePhone()%>"/></td>
                        <td><input name="email<%=i+1%>" class="info info<%=i+1%>" type="text" readonly="false"
                                   value="<%=users.get(i).getEmail()%>"/></td>
                        <td><a onclick="updateInfo(this,<%=i+1%>)" id="updateBT<%=i+1%>" style="cursor: pointer;">更改</a>
                        </td>
                        <td><a href="UserServlet?op=del&id=<%=users.get(i).getId()%>">删除</a></td>
                    </tr>
                    <%}%>
                </table>
            </form>
        </div>

        <div class="pageInfo"><span>当前页数:<%=totalPage == 0 ? 0 : cp%>/总页数:<%=totalPage%></span>
            <a href="UserServlet?op=<%=op%>&cp=<%=1%>" class="pageText">首页</a>
            <a href="UserServlet?op=<%=op%>&cp=<%=cp-1%>" class="pageText">上一页</a>
            <%
                for (int i = 1; i <= totalPage; i++) {

            %>
            <%
                if (i != cp) {
            %>
            <a href="UserServlet?op=<%=op%>&cp=<%=i%>" class="pageText">[<%=i%>]</a>
            <%
            } else {
            %>
            <a href="UserServlet?op=<%=op%>&cp=<%=i%>" class="pageText"><%=i%>
            </a>
            <%}%>
            <%} %>

            <a href="UserServlet?op=<%=op%>&cp=<%=cp+1%>" class="pageText">下一页</a>
            <a href="UserServlet?op=<%=op%>&cp=<%=totalPage%>" class="pageText">尾页</a>
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

            f1.action = "UserServlet?op=update&i=" + i;

            f1.submit();
        }

    }
</script>

</body>
</html>
