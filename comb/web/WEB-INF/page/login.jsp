<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/4/23
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>login</title>
</head>
<body>
    <form action="login.do" method="post">
        <span style="display:inline-block;width: 100px">用户名</span>
        <input name="name" type="text" required>
        <br/>
        <span style="display:inline-block;width: 100px">密码</span>
        <input name="pass" type="password" required>
        <br/>
        <input type="submit">
    </form>
    <a href="transfer?target=register">注册</a>
    <a href="transfer?target=index">首页</a>
</body>
</html>
