<%@ page import="com.example.ssm_springbootx.model.Visitor" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/23
  Time: 11:27
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
    <title>resume</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>

        <%--var haveResume=<%=visitor.haveResume()%>;--%>

        // function createOrUpdateResume(button) {
        // }

        function edit(button) {
            // var $button = $(button);
            $("#edit").hide();
            var $edit = $(".edit");
            //可提交
            $edit.show();
            var $table =$("#resume");
            //保存
            $table.data("origin",$table);
            var $inputs =$table.find(":input");
            //可编辑
            $inputs.attr("disabled",false);
        }

        function cancel(button) {

            var $table =$("#resume");
            //还原
            $table.replaceWith($table.data("origin"));
            //显示+隐藏
            $("#edit").show();
            $(".edit").hide();
        }

    </script>
</head>
<body>
<div id="wrapper">
    <div id="banner">
        <a href="transfer?target=index">首页  </a>
        <a href="transfer?target=visitor">我的主页  </a>
        <a href="quit.do">退出  </a>
        <input disabled id="viId" type="hidden" value="${sessionScope.user.viId}">
    </div>
    <div id="container">
        <form action='resume.do' method='post'>
            <table id="resume" border='1' style="border-collapse: collapse">
                <tr>
                    <td colspan='4' align='center'>
                        个人简历
                        <input disabled type="hidden" name="rsViId"  value="${sessionScope.user.viId}">
                        <input type="hidden" name="rsId" value="${sessionScope.user.viResume.rsId}">
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>
                            姓名：
                            <input disabled type='text' maxlength='8'  name='bsName' required style='border: 0'
                                   value="${sessionScope.user.viResume.rsBasic.bsName}">
                        </label>
                    </td>

                    <td>
                        <label>
                            性别：
                            <span hidden><input  disabled  type='radio' name='bsGender' value='男' required>男</span>
                            <%--jq-默认值--%>
                            <span hidden><input disabled  type='radio' name='bsGender' value='女' >女</span>
                        </label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>
                            出生日期：
                            <input disabled required style='border: 0' type='date' name='bsBirth'
                                   value="${sessionScope.user.viResume.rsBasic.bsBirth}">
                        </label>
                    </td>
                    <td>
                        <label>
                            电话：
                            <input disabled required style='border: 0' type='text' maxlength='11'  name='bsPhone'
                                   value="${sessionScope.user.viResume.rsBasic.bsPhone}">
                        </label>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <label>
                            Email：
                            <input disabled required style='border: 0; display: inline-block; width: 80%' type='text' name='bsEmail'
                                   value="${sessionScope.user.viResume.rsBasic.bsEmail}">
                        </label>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <label>
                            联系地址：
                            <input disabled required style= 'border: 0; display: inline-block; width: 80%'  type='text' maxlength='50'  name='bsAddress'
                                   value="${sessionScope.user.viResume.rsBasic.bsAddress}">
                        </label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>
                            学历：
                            <input disabled required style='border: 0' type='text' name='rsEducation' maxlength='10'
                                   value="${sessionScope.user.viResume.rsEducation}">
                        </label>
                        <label>
                            毕业院校：
                            <input disabled required style='border: 0' type='text' name='rsGraduation' maxlength='10'
                                   value="${sessionScope.user.viResume.rsGraduation}">
                        </label>
                    </td>
                    <td>
                        <label>
                            专业：
                            <input disabled required style='border: 0' type='text' maxlength='6'  name='rsMajor'
                                   value="${sessionScope.user.viResume.rsMajor}">
                        </label>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <label>
                            掌握技能：<br>
                            <textarea disabled required name="rsSkills" style="width: 98%;resize: none">
                                ${sessionScope.user.viResume.rsSkills}
                            </textarea>
                        </label>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <label>
                            荣誉证书：<br>
                            <textarea disabled required name="rsAward" style="width: 98%;resize: none">
                                ${sessionScope.user.viResume.rsAward}
                            </textarea>
                        </label>
                    </td>
                </tr>

                <tr>
                    <td colspan='4'>
                        <label>
                            工作经历：
                            <textarea disabled required name="rsExperience" maxlength='225' style="width: 98%;height: 120px;resize: none">
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
                            <textarea disabled required name='rsIntroduction' maxlength='225'  style="width: 98%;height: 120px;resize: none">
                                ${sessionScope.user.viResume.rsIntroduction}
                            </textarea>
                        </label>
                    </td>
                </tr>

                <tr>
                    <td colspan='4' align='center' >
                        <button type="button" id="edit" onclick="edit(this)">编辑</button>
                        <button class="edit" id="up" hidden>提交</button>
                        <button type="button" class="edit" id="cancel" hidden onclick="cancel(this)">取消</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
