<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/26
  Time: 11:24
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
    <title>editBasic</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>

    </script>
</head>
<body>
<div id="wrapper">
    <div id="banner">
        <a href="transfer?target=index">首页  </a>
        <a href="transfer?target=employee">员工页  </a>
        <a href="quit.do">退出  </a>
    </div>
    <div id="container">
        <form action="editBasic.do" method="post">
            <table>
                <tr>
                    <td>
                        <label>
                            <input required type="hidden" name="bsId" value="${sessionScope.user.eeBsId.bsId}">
                            <%--<input required type="hidden" name="eeId" value="${sessionScope.user.eeId}">--%>

                            姓名:
                            <input required name="bsName" value="${sessionScope.user.eeBsId.bsName}">
                        </label>
                    </td>
                    <td>性别:${sessionScope.user.eeBsId.bsGender}</td>
                    <td>出生日期:${sessionScope.user.eeBsId.bsBirth}</td>
                </tr>
                <tr>
                    <td>
                        <label>电话:<input required name="bsPhone" value="${sessionScope.user.eeBsId.bsPhone}"></label>
                    </td>
                    <td>
                        <label>Email:<input required name="bsEmail" value="${sessionScope.user.eeBsId.bsEmail}"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>联系地址:<input required name="bsAddress" value="${sessionScope.user.eeBsId.bsAddress}"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>工资卡:<input required name="eiAccount" value="${sessionScope.user.eeInformation.eiAccount}"></label>
                    </td>

                </tr>
                <tr>
                    <td>
                        <label>身份证:<input required name="eiIDCard" value="${sessionScope.user.eeInformation.eiIDCard}"></label>
                    </td>
                </tr>
            </table>
            <button>提交</button>
        </form>
    </div>
</div>
</body>
</html>
