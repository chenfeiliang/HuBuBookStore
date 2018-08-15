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
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
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

        }

        #c_center {
            width: 700px;
            float: left;
            margin-left: 430px;
            /* border: 1px solid;  */
        }

        #bookInfo {
            width: 700px;
            float: left;
        }

        #footer {
            width: 100%;
            float: left;
        }

        .TB {
            width: 250px;
            height: 40px;
            margin-top: 30px;
        }

        .login {
            width: 100%;
            left: 30%;
            position: relative;
        }

        .userName {
            width: 250px;
            height: 40px;
            margin-top: 30px;
        }

        .passWord {
            width: 250px;
            height: 40px;
            margin-top: 30px;
        }

        .Go {
            width: 150px;
            height: 40px;
            margin-top: 30px;
            margin-left: 50px;
        }


    </style>
</head>

<body>
<div id="c_center">
    <form action="/HuBuBookStore/CategoryServlet?op=add" method="post">
        <div class="login">
            <input type="text" class="userName TB" name="categoryName" placeholder="类型名"/>
            <br>
            <input type="text" class="TB" name="categoryDescription" placeholder="简述">
            <br>
            <input type="submit" class="go" value="确认添加"/>
        </div>
    </form>
</div>
</body>
</html>
