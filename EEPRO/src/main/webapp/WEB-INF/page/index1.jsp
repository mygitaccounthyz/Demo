<%@ page import="com.example.ssm_springbootx.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/23
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

    User user = (User) session.getAttribute("user");
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>index</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>

        function join(button) {
            var viId = $("#userId").val();
            var haveResume=$("#haveResume").val();
            var $button = $(this);
            if (viId==null)
            {
                alert("先登录");
                return
            }
            if (haveResume==true)
            {

                var rcId = $button.parents("td").find(":input[name=rcId]").val();
                $.get("")
            }else {
                alert("先填写简历");
            }



        }
    </script>
</head>
<body>
<div id="wrapper">
    <div id="banner">
        <c:if test="${empty sessionScope.user}">
            <a href="transfer?target=login">登录</a>
            <a href="transfer?target=register">注册</a>
        </c:if>
        <c:if test="${not empty sessionScope.user}">
            <a href="user.do">欢迎<%=user.getName()%></a>
            <input id="userId" type="hidden" value="<%=user.getId()%>">
            <input id="haveResume" type="hidden" value="<%=user.haveResume()%>">
        </c:if>

    </div>
    <div id="container">
        <p>招聘信息</p>
        <table>
            <c:forEach items="${sessionScope.recruitments}" var="recruitment">
                <tr>
                    <td>职位名称</td>
                    <td>工作部门</td>
                    <td>更新时间</td>
                </tr>
                <tr>
                    <td><c:out value="${recruitment.rcJId.jName}"/></td>
                    <td><c:out value="${recruitment.rcJId.jDpId.dpName}"/></td>
                    <td><c:out value="${recruitment.rcDate}"/></td>
                </tr>
                <tr>
                    <td  colspan="3">
                        主要职责 <br>
                        <c:out value="${recruitment.rcJId.jDescription}"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        岗位要求 <br>
                        <c:out value="${recruitment.rcDescription}"/>
                        <input type="hidden" name="rcId" value="<c:out value="${recruitment.rcId}"/>" />
                        <button onclick="join(this)">投递简历</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
