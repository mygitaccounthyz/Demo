<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/20
  Time: 8:51
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
    <title>showApps</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>

    </script>
</head>
<body>
<div id="wrapper">
    <div id="banner">
        
    </div>
    <div id="container">
        <c:forEach items="${sessionScope.apps}" var="application" >
            <ul style="list-style-type: none" class="recruitment">
                <li><input class="rcId" type="hidden" name="rcId" value="${application.apRcId.rcId}"></li>
                <li>招聘信息</li>
                <li>更新时间：${application.apRcId.rcDate}</li>
                <li>工作部门：${application.apRcId.rcJId.jDpId.dpName}</li>
                <li>主要职责：${application.apRcId.rcJId.jDescription}</li>
                <li>职位要求：${application.apRcId.rcDescription}</li>
            </ul>
            <ul style="list-style-type: none" class="app">
                <li>申请信息</li>
                <li class="out">投递日期：<c:out value="${application.apDate}"/></li>
                <li class="appstate">申请状态：<c:out value="${application.apState}"/></li>

                <c:choose>
                    <c:when test="${application.apState=='已读'}">
                        <li>
                            <form action="interview.do">
                                <label>
                                    面试时间：
                                    <input type="date" name="apTime">
                                </label>
                                <input class="apId" type="hidden" name="apId" value="<c:out value="${application.apId}"/>">
                            </form>
                        </li>
                        <button class="accept" onclick="goInterview(this)">接受</button>
                        <button class="reject" onclick="endApp(this)">拒绝</button>
                    </c:when>
                    <c:when test="${application.apState=='录用'}">
                        <button class="accept" onclick="goWork(this)">接受</button>
                        <button class="reject" onclick="endApp(this)">拒绝</button>
                    </c:when>
                    <c:when test="${application.apState=='拒绝'}">
                        <button onclick="delApp(this)">删除记录</button>
                    </c:when>
                    <c:otherwise>
                        <button onclick="endApp(this)">取消</button>
                    </c:otherwise>
                </c:choose>
            </ul>
            <ul id="resume">
                <li>姓名：${application.apViId.viResume.rsBasic.bsName}</li>
                <li>
                    <span>性别：${application.apViId.viResume.rsBasic.bsGender}</span>
                    <span>出生日期：${application.apViId.viResume.rsBasic.bsBirth}</span>
                </li>
                <li>电话：${application.apViId.viResume.rsBasic.bsPhone}</li>
                <li>住址：${application.apViId.viResume.rsBasic.bsAddress}</li>
                <li>Email：${application.apViId.viResume.rsBasic.bsEmail}</li>
                <li>学历：${application.apViId.viResume.rsEducation}</li>
                <li>毕业院校：${application.apViId.viResume.rsGraduation}</li>
                <li>专业：${application.apViId.viResume.rsMajor}</li>
                <li>技能：${application.apViId.viResume.rsSkills}</li>
                <li>证书：${application.apViId.viResume.rsAward}</li>
                <li>经历：${application.apViId.viResume.rsExperience}</li>
                <li>自我介绍：${application.apViId.viResume.rsIntroduction}</li>
            </ul>
        </c:forEach>
    </div>
</div>
</body>
</html>
