<%@page import="com.cfl.domain.Category" %>
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

        <div class="bookUl">
            
                <table border="1">
                    <tr align="center">
                        <td class="tableHead ">序号</td>
                        <td class="tableHead userIdTd">类型ID</td>
                        <td class="tableHead">类型名</td>
                        <td class="tableHead">类型简述</td>
                        <td class="tableHead operaTion" colspan="2">操作</td>

                    </tr>
                    <s:iterator value="page.records" var="c" status="status">
                        <tr align="center">
                            <td><s:property value="#status.index+1"/></td>
                            <td><input name="categoryId<s:property value="#status.index+1"/>"
                                       class="info info<s:property value="#status.index+1"/> userId" type="text"
                                       readonly="false" value="<s:property value="#c.id"/>"/></td>
                            <td><input name="categoryName<s:property value="#status.index+1"/>"
                                       class="info info<s:property value="#status.index+1"/>" type="text"
                                       readonly="false" value="<s:property value="#c.name"/>"/></td>
                            <td><input name="categoryDescription<s:property value="#status.index+1"/>"
                                       class="info info<s:property value="#status.index+1"/>" type="text"
                                       readonly="false" value="<s:property value="#c.description"/>"/></td>
                            <td><a href="admin/Category_updateInput?id=<s:property value="#c.id"/>">更改</a>
                            </td>
                            <td><a href="admin/Category_delete?id=<s:property value="#c.id"/>">删除</a></td>
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

            f1.action = "CategoryServlet?op=update&i=" + i;

            f1.submit();
        }

    }
</script>
</body>
</html>
