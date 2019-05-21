<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/20
  Time: 10:15
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
    <title>application</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        function interview(button){
            $("#apTime").show();
            var $form =$("#interview");
            $form.attr("onsubmit",true);
            $form.attr("action","interview.do");

        }

        function hire(button) {
            var $button = $(button);
            var $buttons = $button.parents("#button");
            var apId = $buttons.find(":input[name=apId]").val();
            $.get("hire.do",{"apId":apId},function () {

            })
        }

        function endApp(button){
            var $button = $(button);
            var $buttons = $button.parents("#button");
            var apId = $buttons.find(":input[name=apId]").val();
            $.get("endApp.do",{"apId":apId},function () {

            })
        }
        $(function () {
            var $apState = $(":input[name=apState]");
            var $buttons = $apState.parents("#button");
            if ($apState=="已读") {
                $buttons.find("#button1").append("<button type='submit' onclick='interview(this)'>邀请面试</button>");
                $buttons.find("#button2").append("<button type='button' onclick='endApp(this)'>拒绝</button>");
            }else if ($apState == "面试") {
                $buttons.find("#button2").append("<button type='button' onclick='endApp(this)'>拒绝</button>");
            }else if ($apState == "接受面试") {
                $buttons.find("#button1").append("<button type='button'  onclick='hire(this)'>录用</button>");
                $buttons.find("#button2").append("<button type='button'   onclick='endApp(this)'>拒绝</button>");
            }
        })
    </script>
</head>
<body>
<div id="wrapper">
    <div id="banner">
        
    </div>
    <div id="container">
        <div id="recruitment">
            <ul>
                <li>
                    职位${requestScope.app.apRcId.rcJId.jName}
                    更新日期：${requestScope.app.apRcId.rcDate}
                </li>
                <li>部门${requestScope.app.apRcId.rcJId.jDpId.dpName}</li>
                <li>职责${requestScope.app.apRcId.rcJId.jDescription}</li>
                <li>岗位需求${requestScope.app.apRcId.rcDescription}</li>
            </ul>
        </div>

        <div id="resume">
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
                            ${requestScope.app.apViId.viResume.rsBasic.bsName}
                        </span>
                    </td>

                    <td>
                        <sapn>
                            性别：
                            ${requestScope.app.apViId.viResume.rsBasic.bsGender}
                        </sapn>
                    </td>
                </tr>

                <tr>
                    <td>
                        <span>
                            出生日期：
                            ${requestScope.app.apViId.viResume.rsBasic.bsBirth}
                        </span>
                    </td>
                    <td>
                        <span>
                            电话：
                            ${requestScope.app.apViId.viResume.rsBasic.bsPhone}
                        </span>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <span>
                            Email：
                            ${requestScope.app.apViId.viResume.rsBasic.bsEmail}
                        </span>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <span>
                            联系地址：
                            ${requestScope.app.apViId.viResume.rsBasic.bsAddress}
                        </span>
                    </td>
                </tr>

                <tr>
                    <td>
                        <span>
                            学历：
                            ${requestScope.app.apViId.viResume.rsEducation}
                        </span>
                        <span>
                            毕业院校：
                            ${requestScope.app.apViId.viResume.rsGraduation}
                        </span>
                    </td>
                    <td>
                        <span>
                            专业：
                            ${requestScope.app.apViId.viResume.rsMajor}
                        </span>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <span>
                            掌握技能：<br>
                            ${requestScope.app.apViId.viResume.rsSkills}
                        </span>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <span>
                            荣誉证书：<br>
                            ${requestScope.app.apViId.viResume.rsAward}
                        </span>
                    </td>
                </tr>

                <tr>
                    <td colspan='4'>
                        <span>
                            工作经历：<br>
                            ${requestScope.app.apViId.viResume.rsExperience}
                        </span>
                    </td>
                </tr>

                <tr>
                    <td colspan='4'>
                        <span>
                            自我介绍:
                            <br>
                            ${requestScope.app.apViId.viResume.rsIntroduction}
                        </span>
                    </td>
                </tr>
            </table>
        </div>

        <div id="button">
            <form id="interview" action="" onsubmit="return false">
                <input hidden name="apId" value="${requestScope.app.apId}">
                <input hidden name="apState" value="${requestScope.app.apState}">
                <label id="apTime" hidden>
                    选择面试时间：<input  required name="apTime" type="datetime-local">
                </label>
                <span id="button1"></span>
            </form>
            <span id="button2"></span>
        </div>

    </div>
</div>
</body>
</html>
