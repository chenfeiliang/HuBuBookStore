<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="head">
	<p style="position:absolute;margin-top:180px;margin-left:50px;font-size:20px;color:white;">
	
	<s:if test="#session.user==null">
		<a href="front/loginInput.jsp">亲，请先登录</a>
	</s:if>
	<s:else>
		欢迎你,<s:property value="#session.user"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="front/Client_exit" >注销</a>
	</s:else>
	 </p>	
    <div id="header_wrapper">
        <div id="header">
            <a href="#home"><img src="images/templatemo_logo1.png" alt=""/></a>
        </div>
    </div>

    <div id="menu_wrapper">
    
        <div id="menu">
            <ul class="navigation">
                <li><a href="/HuBuBookStore/front/index">主页<span class="ui_icon home"></span></a></li>
                <li><a href="front/Client_showShopCart">购物车<span class="ui_icon aboutus"></span></a>
                </li>
                <li><a href="front/Client_showOrderInfo">我的订单<span class="ui_icon services"></span></a></li>
                <li><a href="front/register.jsp">注册<span class="ui_icon gallery"></span></a></li>
                <li><a href="front/loginInput.jsp">登录<span class="ui_icon contactus"></span></a></li>
            </ul>
        </div>
    </div>


</div>

