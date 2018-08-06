<%--
  Created by IntelliJ IDEA.
  User: 张华厂
  Date: 2018/4/14 0014
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>学生信息列表</title>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_eolqem241z66flxr.css" media="all" />
    <link rel="stylesheet" href="/css/main.css" media="all" />
</head>
<body>
    <c:if test="${!empty studentList}">
        <c:forEach var="student" items="${studentList}">
            姓名：${student.s_name} &nbsp;&nbsp;手机号：${student.s_tel} &nbsp;&nbsp;邮箱：${student.s_mail} &nbsp;&nbsp;<br>
            <a class="layui-nav" data-url="/index2">编辑</a>
        </c:forEach>
    </c:if>
</body>
</html>