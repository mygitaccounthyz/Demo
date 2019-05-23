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

        function spreadJob(button){
            var $button = $(button);
            if ($button.text()=="+展开") {
                $button.parents(".dpfloor").find(".jfloor").show();
                $button.text("-收起");
            }else if ($button.text()=="-收起") {
                $button.parents(".dpfloor").find(".jfloor").hide();
                $button.text("+展开");
            }
        }
        
        function spreadEE(button){
            var $button = $(button);
            if ($button.text()=="+展开") {
                $button.parents(".jfloor").find(".eefloor").show();
                $button.text("-收起");
            }else if ($button.text()=="-收起") {
                $button.parents(".jfloor").find(".eefloor").hide();
                $button.text("+展开");
            }
        }

        function toResume(button){
            var $button = $(this);
            var toResume = $button.data("to");
            $(".resume").hide();
            $("#apId"+toResume).show();
        }

        function interviewTime(button){
            var $button = $(button);
            var $getEmployee = $button.parents("getEmployee");
            $getEmployee.find(".apTime").show();
        }

        function interview(button) {
            var $button = $(button);
            var $getEmployee = $button.parents("getEmployee");
            var apTime = $getEmployee.find(":input[name=apTime]").val();
            var apId = $getEmployee.find(":input[name=apId]").val();
            if (apTime == null) {
                alert("先选择时间");
                return;
            }else {
                $.get("interview.do",{"apId":apId,"apTime":apTime},function (res) {

                })
            }
        }

        function hire(button) {
            var $button = $(button);
            var $getEmployee = $button.parents("getEmployee");
            var apId = $getEmployee.find(":input[name=apId]").val();
            $.get("hire.do",{"apId":apId},function () {

            })
        }

        function endApp(button){
            var $button = $(button);
            var $getEmployee = $button.parents("getEmployee");
            var apId = $getEmployee.find(":input[name=apId]").val();
            $.get("endApp.do",{"apId":apId},function () {

            })
        }

        function createorupdateDp(button){

        }

        function changePosition(button){}

        $(function () {

            var $apState = $(":input[name=apState]");
            var $buttons = $apState.parents(".getEmployee");
            if ($apState=="已读") {
                $buttons.find("#button1").append("<button type='submit' onclick='interviewTime(this)'>选择面试时间</button>");
                $buttons.find("#button2").append("<button type='button' onclick='endApp(this)'>拒绝</button>");
            }else if ($apState == "面试") {
                $buttons.find("#button2").append("<button type='button' onclick='endApp(this)'>拒绝</button>");
            }else if ($apState == "接受面试") {
                $buttons.find("#button1").append("<button type='button'  onclick='hire(this)'>录用</button>");
                $buttons.find("#button2").append("<button type='button'   onclick='endApp(this)'>拒绝</button>");
            }

            $(":checkbox[name=dpId]").change(function () {
                var $checkbox = $(this);
                if ($checkbox.attr("checked")) {
                    $checkbox.parents(".department").find(":checkbox[name=jId]").attr("checked",true);
                }
                // else if (!$checkbox.attr("checked")) {
                //     $checkbox.parents(".department").find(":checkbox[name=jId]").attr("checked",false);
                // }
            });

            function createDp(button){
                
            }
            function deleteDp(button){
                
            }
            function updateDp(button){
                
            }
            function createJob(button){

            }
            function deleteJob(button){

            }
            function updateJob(button){

            }
            function createRecruitment(button){

            }
            function deleteRecruitment(button){

            }
            function updateRecruitment(button){

            }

            function createTraining(button){

            }
            function deleteTraining(button){

            }
            function updateTraining(button){

            }
            function getDp(button){

            }
            function getJob(button){

            }
            
            
            
            $(":checkbox[name=jId]").change(function () {
                var $checkbox = $(this);
                if ($checkbox.attr("checked")) {
                    $checkbox.parents(".department").find(":checkbox[name=eeId]").attr("checked",true);
                } else $checkbox.parents(".department").find(":checkbox[name=dpId]").attr("checked",false);

                // else if (!$checkbox.attr("checked")) {
                //     $checkbox.parents(".department").find(":checkbox[name=eeId]").attr("checked",false);
                // }

            });

            $(":checkbox[name=eeId]").change(function () {
                var $checkbox = $(this);
                if (!$checkbox.attr("checked")) {
                    $checkbox.parents(".job").find(":checkbox[name=jId]").attr("checked",false);
                }
            });

            $(".nav").click(function () {
                $("#selector").find(":checkbox").attr("checked",false);//取消选择

                $(".module").hide();//隐藏其他模块
                var to = $(this).data("to");
                $("#"+to).show();//显示选择模块

            })



        })

    </script>
</head>
<body>
<div id="wrapper">

    <div id="banner">
        <a href="quit.do">退出  </a>
        <a href="transfer?target=index">首页  </a>
        <a href="transfer?target=eeInformation">员工信息  </a>
    </div>

    <div id="container">

        <div id="navigate" style="text-align: center">
            <button id="toRectuitment" class="nav" data-to="recruitments">招聘</button>
            <button id="toDepartment" class="nav" data-to="department">部门</button>
            <button id="toTraining" class="nav" data-to="training">培训</button>
            <%--<button id="toEEInformation" class="nav" data-to="eeInformation">员工信息</button>--%>
        </div>
        
        <div id="selector">
            <c:forEach items="${sessionScope.departments}" var="department">
                <div class="dpfloor">
                    <button onclick="spreadJob(this)">+展开</button>
                    <label>
                            ${department.dpName}<input type="checkbox" name="dpId" value="${department.dpId}">
                    </label>
                    <br>
                    <c:forEach items="${department.dpJobs}" var="job">
                        <div class="jfloor">
                            <button onclick="spreadEE(this)">+展开</button>
                            <label>
                                    ${job.jName}<input type="checkbox" name="jId" value="${department.dpJobs}">
                            </label>
                            <br>
                            <c:forEach items="${job.jEmployees}" var="employee" varStatus="statu">
                                <div class="eefloor">
                                    <label>
                                            ${employee.eeName}<input type="checkbox" name="eeId" value="${employee.eeId}">
                                    </label>
                                    <c:if test="${statu.index mod 4 ==0}">
                                        <br>
                                    </c:if>
                                </div>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
        </div >
<%--recruitments\departments--%>
        <div id="modules">
            <div class="module" id="recruitments">

                <div id="recruitmentList">
                    <li><button onclick="createRecruitment(this)">新建招聘信息</button>(先勾选一个职位)</li>
                    <div id="editRecruitment" hidden>
                        <label>职位名<input disabled name="jName"></label>
                        <label>部门<input disabled name="dpName"></label>
                        <label>岗位要求<input name="rcDescription"></label>
                        <button onclick="createorupdateRecruitmnet(this)">提交</button>
                    </div>
                <c:forEach items="${sessionScope.recruitments}" var="recruitment">
                    <div id="recruitment">
                        <ul>
                            <li>
                                职位${recruitment.rcJId.jName}
                                更新日期：${recruitment.rcDate}
                            </li>
                            <li>部门${recruitment.rcJId.jDpId.dpName}</li>
                            <li>职责${recruitment.rcJId.jDescription}</li>
                            <li>岗位需求${recruitment.rcDescription}</li>
                            <li><button onclick="updateRecruitment(this)">修改需求</button></li>
                            <li><button onclick="deleteRecruitment(this)">删除需求</button></li>
                        </ul>
                    </div>
                    <ul>
                        <c:forEach items="${recruitment.rcApplications}" var="app">
                            <c:choose>
                                <c:when test="${app.apState=='已读'|| app.apState=='拒绝'||app.apState=='录用'}">
                                    <li class="app" hidden>
                                        <span  class="apState"><c:out value="${app.apState}"/></span>
                                        <span hidden class="apId">${app.apId}</span>
                                        <button type="button" data-to="${app.apId}" onclick="toResume(this)">
                                            求职人：<c:out value="${app.apViId.viResume.rsBasic.bsName}"/>
                                        </button>
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
                                        <button type="button"  data-to="${app.apId}" onclick="toResume(this)">
                                            求职人：<c:out value="${app.apViId.viResume.rsBasic.bsName}"/>
                                        </button>
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

                <div id="resumes" >
                    <c:forEach items="${sessionScope.recruitments.rcApplications}" var="app">
                        <table id="apId${app.apId}" class="resume" hidden border='1' style="border-collapse: collapse">
                            <tr>
                                <td colspan='4' align='center'>
                                    <span>
                                        个人简历
                                        <label>
                                            |求职状态：${app.apState}
                                        </label>
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <span>
                                        姓名：
                                        ${app.apViId.viResume.rsBasic.bsName}
                                    </span>
                                </td>

                                <td>
                                    <span>
                                        性别：
                                        ${app.apViId.viResume.rsBasic.bsGender}
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <span>
                                        出生日期：
                                        ${app.apViId.viResume.rsBasic.bsBirth}
                                    </span>
                                </td>
                                <td>
                                    <span>
                                        电话：
                                        ${app.apViId.viResume.rsBasic.bsPhone}
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="4">
                                    <span>
                                        Email：
                                        ${app.apViId.viResume.rsBasic.bsEmail}
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="4">
                                    <span>
                                        联系地址：
                                        ${app.apViId.viResume.rsBasic.bsAddress}
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <span>
                                        学历：
                                        ${app.apViId.viResume.rsEducation}
                                    </span>
                                    <span>
                                        毕业院校：
                                        ${app.apViId.viResume.rsGraduation}
                                    </span>
                                </td>
                                <td>
                                    <span>
                                        专业：
                                        ${app.apViId.viResume.rsMajor}
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="4">
                                    <span>
                                        掌握技能：<br>
                                        ${app.apViId.viResume.rsSkills}
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="4">
                                    <span>
                                        荣誉证书：<br>
                                        ${app.apViId.viResume.rsAward}
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td colspan='4'>
                                    <span>
                                        工作经历：<br>
                                        ${app.apViId.viResume.rsExperience}
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td colspan='4'>
                                    <span>
                                        自我介绍:
                                        <br>
                                        ${app.apViId.viResume.rsIntroduction}
                                    </span>
                                </td>
                            </tr>

                            <tr class="getEmployee">
                                <td  class="apTime" hidden >
                                    <label>
                                        面试时间：<input name="apTime" type="datetime-local">
                                    </label>
                                    <button onclick="interview(this)">邀请面试</button>
                                    <input type="hidden" name="apId" value="${app.apId}">
                                </td>
                                <td class="button">
                                    <input type="hidden" name="apState" value="${app.apState}">
                                    <span class="button1"></span>
                                    <span class="button2"></span>
                                </td>
                            </tr>
                        </table>
                    </c:forEach>
                </div>
            </div>

            <div class="module" id="department">

                <div >
                    <button onclick="createDp(this)">新部门</button>
                    <button onclick="updateDp(this)">修改部门信息</button>
                    <button onclick="deleteDp(this)">删除部门</button>
                    <p id="editDp" hidden>
                        <label >
                            部门名称<input name="dpName">
                        </label>
                        <label>
                            部门职能<input name="dpFunction">
                        </label>
                        <button onclick="createorupdateDp(this)">提交</button>
                    </p>
                </div>
                <div >
                    <button onclick="createJob(this)">新职位</button>(先选择一个部门)
                    <button onclick="updateJob(this)">修改职位信息</button>
                    <button onclick="deleteJob(this)">删除职位</button>
                    <p id="editJob">
                        <label>职位名称<input name="jName"></label>
                        <label>部门<input name="jDpId"></label>
                        <label>岗位职责<input name="jName"></label>
                        <button onclick="createorupdateJob(this)">提交</button>
                    </p>
                </div>
                <div>
                    更换岗位
                    <label><select name="newDp" id="newDp" onchange="getDp(this)"></select></label>
                    <label><select name="newJob" id="newJob" onchange="getJob(this)"></select></label>
                    <button onclick="changePosition(this)">提交</button>
                </div>
            </div>

            <div class="module" id="training">
                <div>

                    <c:forEach items="${sessionScope.trainings}" var="training">
                        <ul>
                            <li hidden>
                                <input type="hidden" name="trId" value="${training.trId}">
                            </li>
                            <li>
                                培训主题:<c:out value="${training.title}"/>
                            </li>
                            <li>
                                培训详情:<c:out value="${training.trDescription}"/>
                            </li>
                            <li>
                                地点:<c:out value="${training.trAddress}"/>
                            </li>
                            <li>
                                培训时间:<c:out value="${training.trTime}"/>
                            </li>
                            <li>
                                <button onclick="updateTraining(this)">修改培训</button>
                                <button onclick="deleteTraining(this)">删除培训</button>
                            </li>
                        </ul>
                    </c:forEach>

                </div>

                <p id="editTraining">
                    <label>培训主题<input name="trTitle"></label>
                    <label>培训主要内容<input name="trDescription"></label>
                    <label>培训地点<input name="trAddress"></label>
                    <label>参训时间<input type="datetime-local" name="trTime"></label>
                    <button onclick="createTraining(this)">新建培训</button>(至少勾选一名参训人员)
                </p>
            </div>

            <%--<div class="module" id="eeInformation">--%>
            <%--</div>--%>

        </div>

    </div>
</div>
</body>
</html>
