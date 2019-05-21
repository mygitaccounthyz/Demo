<%@ page import="com.example.ssm_springbootx.model.Employee" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/20
  Time: 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

    Employee admin = (Employee) session.getAttribute("user");

%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>admin</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>

        $(function () {

        })


    </script>
</head>
<body>
<div id="wrapper">
    <div id="banner">
        <a href="quit.do">退出  </a>
        <a href="transfer?target=index">首页  </a>
    </div>
    <div id="container">
        <div id="navigate" style="text-align: center">
            <span></span>
        </div>
        <div id="selector">
            <c:forEach items="${sessionScope.departments}" var="department">
                <div class="dpfloor">
                    <label>
                            ${department.dpName}<input type="checkbox" name="dpId" value="${department.dpId}">
                    </label>
                    <br>
                    <c:forEach items="${department.dpJobs}" var="job">
                        <div class="jfloor">
                            <input type="checkbox" name="jId" value="${department.dpJobs}">
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
        <div id="recruitments">
            <c:forEach items="${requestScope.recruitments}" var="recruitment">
                <ul>
                <c:forEach items="${recruitment.rcApplications}" var="app">
                    <c:choose>

                        <c:when test="${app.apState=='已读'|| app.apState=='拒绝'||app.apState=='录用'}">
                            <li class="app" hidden>
                                <span  class="apState"><c:out value="${app.apState}"/></span>
                                <span hidden class="apId">${app.apId}</span>
                                <a href="showApplication.do?apId=${app.apId}">
                                    求职人：<c:out value="${app.apViId.viResume.rsBasic.bsName}"/>
                                </a>
                                学历：<c:out value="${app.apViId.viResume.rsEducation}"/>
                                投递日期：<c:out value="${app.apDate}"/>
                                职位：<c:out value="${recruitment.rcJId}"/>
                                发布日期：<c:out value="${recruitment.rcDate}"/>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="app">
                                <span class="apState"><c:out value="${app.apState}"/></span>
                                <span hidden class="apId">${app.apId}</span>
                                <a href="showApplication.do?apId=${app.apId}">
                                    求职人：<c:out value="${app.apViId.viResume.rsBasic.bsName}"/>
                                </a>
                                学历：<c:out value="${app.apViId.viResume.rsEducation}"/>
                                投递日期：<c:out value="${app.apDate}"/>
                                职位：<c:out value="${recruitment.rcJId}"/>
                                发布日期：<c:out value="${recruitment.rcDate}"/>
                            </li>
                        </c:otherwise>

                    </c:choose>
                </c:forEach>
                </ul>
            </c:forEach>
        </div>

        <div id="department">
            <form action="">
                <label for="departments">部门：</label>
                <select name="dpId" id="departments"></select>
                <label for="jobs">职位：</label>
                <select name=jId id="jobs"></select>
                <label for="employees">员工：</label>
                <select name="eeId" id="employees"></select>
                <button></button>
                <button></button>
            </form>
        </div>


    </div>
</div>
</body>
</html>



