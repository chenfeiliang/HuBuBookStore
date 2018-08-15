<%@page import="com.cfl.domain.User" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
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

        <div class="bookUl">

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


                 <s:iterator value="page.records" var="user" status="status">
                            <tr align="center">
                        <td><s:property value="#status.index+1"/>
                        </td>
                        <td><input name="userId<s:property value="#status.index+1"/>" class="info info<s:property value="#status.index+1"/> userId" type="text" readonly="false"
                                   value="<s:property value="#user.id"/>"/></td>
                        <td><input name="userName<s:property value="#status.index+1"/>" class="info info<s:property value="#status.index+1"/>" type="text" readonly="false"
                                   value="<s:property value="#user.userName"/>"/></td>
                        <td><input name="passWord<s:property value="#status.index+1"/>" class="info info<s:property value="#status.index+1"/>" type="text" readonly="false"
                                   value="<s:property value="#user.id"/>"/></td>
                        <td><input name="cellPhone<s:property value="#status.index+1"/>" class="info info<s:property value="#status.index+1"/>" type="text" readonly="false"
                                   value="<s:property value="#user.cellPhone"/>"/></td>
                        <td><input name="mobilePhone<s:property value="#status.index+1"/>" class="info info<s:property value="#status.index+1"/>" type="text" readonly="false"
                                   value="<s:property value="#user.mobilePhone"/>"/></td>
                        <td><input name="email<s:property value="#status.index+1"/>" class="info info<s:property value="#status.index+1"/>" type="text" readonly="false"
                                   value="<s:property value="#user.email"/>"/></td>
                        <td><a href="admin/User_updateInput?id=<s:property value="#user.id"/>" >更改</a>
                        </td>
                        <td><a href="admin/User_delete?id=<s:property value="#user.id"/>">删除</a></td>
                    </tr>
                    </s:iterator>
                  
                </table>
            
        </div>
		<%@include file ="/common/page.jsp" %>
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
