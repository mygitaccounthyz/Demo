<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.ssm_springbootx.model.Visitor" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/16
  Time: 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

    Visitor visitor= (Visitor) session.getAttribute("user");
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>visitor</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>

        function showResume(){
            var $resume = $("#resume");
            if ($resume.attr("hidden"))
                $resume.show();
            else $resume.hide();
        }

        function showApplication(){
            var $applications = $("#applications");
            if ($applications.attr("hidden"))
                $applications.show();
            else $applications.hide();
        }
        function goInterview(button){
            var $button =$(button);
            var apId = $button.parents(".apId").val();
            $.get("goInterview.do",{"apId":apId,"apState":"接受面试"},function (res) {

            })

        }
        function goWork(button){
            var $button =$(button);
            var apId = $button.parents(".apId").val();
            $.get("goWork.do",{"apId":apId,"apState":"接受录用"},function (res) {

            })
        }
        function endApp(button){
            var $button =$(button);
            var apId = $button.parents(".apId").val();
            $.get("endApp.do",{"apId":apId,"apState":"拒绝"},function (res) {

            })
        }
        function delApp(button){
            var $button =$(button);
            var apId = $button.parents(".apId").val();
            $.get("delApp.do",{"apId":apId},function (res) {

            })
        }
        $(function () {


        })
    </script>
</head>
<body>
    <div id="wrapper">
        <div id="banner">
            <a href="transfer?target=index">首页</a>
            <button id="showResume" onclick="showResume()">简历  </button>
            <button id="showApplication" onclick="showApplication()">求职信息  </button>
        </div>
        <div id="container">
<%      if (visitor.getViResume()==null){
            out.write("<a href='transfer?target=editResume'>没有简历，去添加</a>");
        }else {
%>
            <div hidden id="resume">
                <table border='1' style="border-collapse: collapse">
                    <tr>
                        <td colspan='4' align='center'>
                            <span>个人简历</span>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <span>
                                姓名：
                                ${sessionScope.user.viResume.rsBasic.bsName}
                            </span>
                        </td>

                        <td>
                            <sapn>
                                性别：
                                ${sessionScope.user.viResume.rsBasic.bsGender}
                            </sapn>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <span>
                                出生日期：
                                ${sessionScope.user.viResume.rsBasic.bsBirth}
                            </span>
                        </td>
                        <td>
                            <span>
                                电话：
                                ${sessionScope.user.viResume.rsBasic.bsPhone}
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <span>
                                Email：
                                ${sessionScope.user.viResume.rsBasic.bsEmail}
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <span>
                                联系地址：
                                ${sessionScope.user.viResume.rsBasic.bsAddress}
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <span>
                                学历：
                                ${sessionScope.user.viResume.rsEducation}
                            </span>
                        </td>
                        <td>
                            <span>
                                专业：
                                ${sessionScope.user.viResume.rsMajor}
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <span>
                                掌握技能：<br>
                                ${sessionScope.user.viResume.rsSkills}
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <span>
                                荣誉证书：<br>
                                ${sessionScope.user.viResume.rsAward}
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td colspan='4'>
                            <span>
                                工作经历：<br>
                                ${sessionScope.user.viResume.rsExperience}
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td colspan='4'>
                            <span>
                                自我介绍:
                                <br>
                                ${sessionScope.user.viResume.rsIntroduction}
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
<%
        }
%>
            <div hidden id="applications">
                <c:forEach items="${sessionScope.user.viApplications}" var="application" >
                    <ul style="list-style-type: none" class="recruitment">
                        <li><input class="rcId" type="hidden" name="rcId" value="${application.apRcId.rcId}"></li>
                        <li>招聘信息</li>
                        <li>更新时间：${application.apRcId.rcDate}</li>
                        <li>工作部门：${application.apRcId.rcJId.jDpId.dpName}</li>
                        <li>主要职责：${application.apRcId.rcJId.jDescription}</li>
                        <li>职位要求：${application.apRcId.rcDescription}</li>
                    </ul>
                    <ul style="list-style-type: none" class="app">
                        <li>申请信息<input class="apId" type="hidden" name="apId" value="<c:out value="${application.apId}"/>"></li>
                        <li class="out">投递日期：<c:out value="${application.apDate}"/></li>
                        <li class="appstate">申请状态：<c:out value="${application.apState}"/></li>

                        <c:choose>
                            <c:when test="${application.apState=='面试'}">
                                <li>面试时间：${application.apTime}</li>
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
                </c:forEach>
            </div>

            <div id="employee">
                <c:if test="${sessionScope.user.viEmployee!=null}">
                    <p>你已成为员工</p>
                    员工账号<c:out value="${sessionScope.user.viEmployee.eeName}"/>
                    员工密码<c:out value="${sessionScope.user.viEmployee.eePass}"/>
                </c:if>
            </div>

        </div>
    </div>
</body>
</html>
