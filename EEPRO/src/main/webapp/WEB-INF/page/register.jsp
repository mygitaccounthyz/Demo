<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/16
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>register</title>
</head>
<body>
    <div>
        <form action="register.do">
            用户名<input name="viName"><br>
            密　码<input name="viPass"><br>
            <button>提交</button>
        </form>
    </div>
</body>
</html>
