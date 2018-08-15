<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="pageInfo"><span>当前页数:<s:property value="page.pageCount==0?0:page.pageNow"/>/总页数:<s:property
        value="page.pageCount"/></span>
    <a href="<s:property value="page.url"/>1" class="pageText">首页</a>
    <a href="<s:property value="page.url"/><s:property value="page.pageNow-1"/>" class="pageText">上一页</a>
    <s:if test="page.pageCount==null">
    <s:bean name="org.apache.struts2.util.Counter">
        <s:param name="first" value="1"/>
        <s:param name="last" value="page.pageCount"/>
        <s:iterator var="x">
            <s:if test="(#x)!=(page.pageNow)">
                <a href="<s:property value="page.url"/><s:property value="#x"/>" class="pageText">[<s:property
                        value="#x"/>]</a>
            </s:if>
            <s:else>
                <a href="<s:property value="page.url"/><s:property value="#x"/>" class="pageText"><s:property
                        value="#x"/></a>
            </s:else>
        </s:iterator>
    </s:bean>
	</s:if>
    <a href="<s:property value="page.url"/><s:property value="page.pageNow+1"/>" class="pageText">下一页</a>
    <a href="<s:property value="page.url"/><s:property value="page.pageCount"/>" class="pageText">尾页</a>

</div>