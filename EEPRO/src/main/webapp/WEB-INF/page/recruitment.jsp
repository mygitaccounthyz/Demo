<%@ page import="com.example.ssm_springbootx.model.Recruitment" %>
<%@ page import="com.example.ssm_springbootx.model.Job" %>
<%@ page import="com.example.ssm_springbootx.model.Visitor" %>
<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/17
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

    Recruitment recruitment = (Recruitment) request.getAttribute("recruitment");
    Job job =recruitment.getRcJId();
    Visitor visitor = (Visitor) session.getAttribute("user");
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>apRecruitment</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>

        $(function () {

            $("#apply").click(function () {
                var $form = $(this);
                $.get("findResume.do",{"viId":<%=visitor.getId()%>},function (rep) {
                    if (rep == "1") {
                        $form.attr("onsubmit","return true");
                    }else if (rep=="0"){
                        alert("没有简历，请先填写一份简历")
                    }else alert("error")
                })
            })
        })

    </script>
</head>
<body>
    <div id="wrapper">
        <div>
            <a href="user.do"><%=visitor.getName()%></a>
        </div>
        <div>
            <h3><%=recruitment.getRcJId().getjName()%></h3>
            <table>
                <tr>
                    <td>更新日期</td>
                    <td><%=recruitment.getRcDate()%></td>
                    <td>工作部门</td>
                    <td><%=job.getjDpId().getDpName()%></td>
                </tr>
            </table>
        </div>
        <div>
            <div>
                <p>主要职责</p>
                <p><%=job.getjDescription()%></p>
            </div>
            <div>
                <p>职位要求</p>
                <p><%=recruitment.getRcDescription()%></p>
            </div>
            <form id="apply" action="application.do" onsubmit="return false">
                <input hidden name="rcId" value="<%=recruitment.getRcId()%>">
                <input hidden name="viId" value="<%=visitor.getId()%>">
                <button>申请岗位</button>
            </form>
        </div>
    </div>
</body>
</html>
