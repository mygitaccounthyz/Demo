<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.ssm_springbootx.model.Visitor" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/19
  Time: 17:05
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
    <title>editResume</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {

            <c:if test="${sessionScope.user.viResume.rsBasic.bsGender!=null}">
            $(":radio[value=${sessionScope.user.viResume.rsBasic.bsGender}]").attr("checked",true);
            </c:if>

        })
    </script>
</head>
<body>
    <div id="wrapper">
        <div id="banner">

        </div>
        <div id="container">
            <form action='resume.do' method='post'>
                <table border='1' style="border-collapse: collapse">
                    <tr>
                        <td colspan='4' align='center'>
                            个人简历
                            <input type="hidden" name="rsViId"  value="${sessionScope.user.viId}">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label>
                                姓名：
                                <input type='text' maxlength='8'  name='bsName' required style='border: 0'
                                       value="${sessionScope.user.viResume.rsBasic.bsName}">
                            </label>
                        </td>

                        <td>
                            <label>
                                性别：
                                <input type='radio' name='bsGender' value='男' required>男
                                <%--jq-默认值--%>
                                <input type='radio' name='bsGender' value='女' required>女
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label>
                                出生日期：
                                <input required style='border: 0' type='date' name='bsBirth'
                                       value="${sessionScope.user.viResume.rsBasic.bsBirth}">
                            </label>
                        </td>
                        <td>
                            <label>
                                电话：
                                <input required style='border: 0' type='text' maxlength='11'  name='bsPhone'
                                value="${sessionScope.user.viResume.rsBasic.bsPhone}">
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <label>
                                Email：
                                <input required style='border: 0; display: inline-block; width: 80%' type='text' name='bsEmail'
                                value="${sessionScope.user.viResume.rsBasic.bsEmail}">
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <label>
                                联系地址：
                                <input required style= 'border: 0; display: inline-block; width: 80%'  type='text' maxlength='50'  name='bsAddress'
                                value="${sessionScope.user.viResume.rsBasic.bsAddress}">
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label>
                                学历：
                                <input required style='border: 0' type='text' name='rsEducation' maxlength='10'
                                       value="${sessionScope.user.viResume.rsEducation}">
                            </label>
                        </td>
                        <td>
                            <label>
                                专业：
                                <input required style='border: 0' type='text' maxlength='6'  name='rsMajor'
                                       value="${sessionScope.user.viResume.rsMajor}">
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <label>
                                掌握技能：<br>
                                <textarea name="rsSkills" style="width: 98%;resize: none">
                                    ${sessionScope.user.viResume.rsSkills}
                                </textarea>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <label>
                                荣誉证书：<br>
                                <textarea name="rsAward" style="width: 98%;resize: none">
                                    ${sessionScope.user.viResume.rsAward}
                                </textarea>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan='4'>
                            <label>
                                工作经历：
                                <textarea name="rsExperience" maxlength='225' style="width: 98%;height: 120px;resize: none">
                                    ${sessionScope.user.viResume.rsExperience}
                                </textarea>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan='4'>
                            <label>
                                自我介绍:
                                <br>
                                <textarea name='rsIntroduction' maxlength='225'  style="width: 98%;height: 120px;resize: none">
                                    ${sessionScope.user.viResume.rsIntroduction}
                                </textarea>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan='4' align='center' >
                            <input type='submit' value='提交'>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
