<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.ssm_springbootx.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ssm_springbootx.model.Recruitment" %>
<%@ page import="com.example.ssm_springbootx.model.Job" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/15
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
    User user = (User) session.getAttribute("user");
    List<Recruitment> recruitments = (List<Recruitment>) session.getAttribute("recruitments");

%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>index</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>

        // $(function () {
        //
        // })
    </script>
</head>
<body>
    <div id="wrapper" style="background: url('img/home_bg.jpg')" >
        <div id="banner" style="background: url('img/banner_bg.jpg')">
<%
                if (user==null){
%>
            <a href="transfer?target=login">登录</a>
            <a href="transfer?target=register">注册</a>
<%
            }else {
%>
            <a href="user.do">欢迎<%=user.getName()%></a>
<%
                }
%>
        </div>
        <div id="container">
            <p>招聘信息</p>
            <table>
                <tr>
                    <th>职位名称</th>
                    <th>工作部门</th>
                    <th>主要工作</th>
                    <th>更新时间</th>
                </tr>
<%          for (Recruitment apRecruitment : recruitments) {
                Job job=apRecruitment.getRcJId();
%>
                <tr>
                <td>
                    <a href="recruitment.do?rcId=<%=apRecruitment.getRcId()%>"><%=job.getjName()%></a>
                </td>
                <td><%=job.getjDpId()%></td>
                <td><%=job.getjDescription()%></td>
                <td><%=apRecruitment.getRcDate()%></td>
                </tr>
<%
                }
%>          </table>

        </div>
    </div>

</body>
</html>
