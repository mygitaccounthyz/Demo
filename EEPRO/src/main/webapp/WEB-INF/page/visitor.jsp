<%@ page import="com.example.ssm_springbootx.model.Visitor" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/23
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

    Visitor visitor = (Visitor) session.getAttribute("user");
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>visitor</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>

        function goInterview(button){
            var $button =$(button);
            var $tr = $button.parents(".buttons");
            var $table = $tr.parents("table");
            var apId = $tr.find(":input[name=apId]").val();
            var apState = $table.find(":input[name=apState]");
            $.get("goInterview.do",{"apId":apId},
                function (rs) {
                if (rs=="1")
                {
                    var $append = $tr.find(".append");
                    apState.val("接受面试");
                    $append.empty();
                    $append.append("<button class=\"button\" onclick=\"endApp(this)\">取消</button>");
                }else {
                    alert("失败");
                }
            })
        }

        function goWork(button){
            var $button =$(button);
            var $tr = $button.parents(".buttons");
            var $table = $tr.parents("table");
            var apId = $tr.find(":input[name=apId]").val();
            var apState = $table.find(":input[name=apState]");
            $.get("goWork.do",{"apId":apId},function (rs) {
                if (rs=="1") {
                    apState.val("接受录用")
                    var $append = $tr.find(".append");
                    $append.empty();
                }
                else {
                    alert("失败");
                }
            })
        }

        function endApp(button){
            var $button =$(button);
            var $tr = $button.parents(".buttons");
            var $table = $tr.parents("table");
            var apId = $tr.find(":input[name=apId]").val();
            var apState = $table.find(":input[name=apState]");
            $.get("endApp.do",{"apId":apId},
                function (rs) {
                if (rs == "1") {
                    apState.val("拒绝");
                    var $append = $tr.find(".append");
                    $append.empty();
                }else {alert("失败")}
            })
        }

        function delApp(button){
            var $button =$(button);
            var $tr = $button.parents(".buttons");
            var $table = $tr.parents("table");
            var apId = $tr.find(":input[name=apId]").val();
            $.get("delApp.do",{"apId":apId},function (rs) {
                if (rs == "1") {
                    $table.remove();
                }else {alert("失败")}
            })
        }

        $(function () {

        })

    </script>
</head>
<body>
<div id="wrapper">

    <div id="banner">
        <a href="transfer?target=index">首页  </a>
        <a href="transfer?target=resume">我的简历  </a>
        <a href="quit.do">退出  </a>
        <input id="viId" type="hidden" value="${sessionScope.user.viId}">
    </div>

    <div id="container">

        <div id="apps">
            <p>求职信息</p>
            <c:forEach items="${sessionScope.user.viApplications}" var="application">
                <div class="app">
                    <table>
                        <tr>
                            <th>更新时间</th>
                            <th>工作部门</th>
                            <th>职位名称</th>
                        </tr>
                        <tr>
                            <td>${application.rcDate}</td>
                            <td>${application.rcJId.jDpId.dpName}</td>
                            <td>${application.rcJId.jName}</td>
                        </tr>
                        <tr>
                            <th>工作职责</th>
                        </tr>
                        <tr>
                            <td>${application.rcJId.jDescription}</td>
                        </tr>
                        <tr>
                            <th>职位要求</th>
                        </tr>
                        <tr>
                            <td>${application.apRcId.rcDescription}</td>
                        </tr>
                        <tr>
                            <th>申请日期</th>
                            <th>申请状态</th>
                        </tr>
                        <tr>
                            <td>${application.apDate}</td>
                            <td><input style="border: none" disabled
                                       name="apState" value="${application.apState}"></td>
                        </tr>
                        <tr  class="buttons">
                            <td><input type="hidden" name="apId" value="${application.apId}"></td>
                            <td class="append">
                                <c:choose>
                                    <c:when test="${application.apState=='面试'}">
                                        面试时间：${application.apTime}<br>
                                        <button class="button" onclick="goInterview(this)">接受</button>
                                        <button class="button" onclick="endApp(this)">拒绝</button>
                                    </c:when>
                                    <c:when test="${application.apState=='录用'}">
                                        <button class="button" onclick="goWork(this)">接受</button>
                                        <button class="button" onclick="endApp(this)">拒绝</button>
                                    </c:when>
                                    <c:when test="${application.apState=='拒绝'}">
                                        <button  class="button" onclick="delApp(this)">删除记录</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="button" onclick="endApp(this)">取消</button>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                </div>
            </c:forEach>
        </div>

        <div id="eeAccount">
            <c:if test="${not empty sessionScope.user.viEmployee}">
                员工用户名${sessionScope.user.viEmployee.eeName}
                员工密码${sessionScope.user.viEmployee.eePass}
            </c:if>
        </div>
    </div>

</div>
</body>
</html>
