<%@ page import="com.midpac.utils.MyUtil" %>
<%@ page import="com.midpac.model.User" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/4/23
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    User user = (User) session.getAttribute("user");

%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>user</title>
    <script src="resource1.0/js/jquery-3.1.0.js"></script>
    <script>
        $(function () {

            var $form =$("#form");

            $("#charge").click(function () {
                var $form =$("#form");
                $form.show();
            });

            $("#hide").click(function () {
                $("#change").val("");
                $form.hide();
            });

            $("#confirm").click(function () {
                $("#tip").empty();
                var str = "<%=MyUtil.rand()%>";
                var check = prompt("输入验证码"+str);
                if (check==str)
                {
                    $form.submit();
                }else {
                    $("#tip").text("验证错误");
                }
            });
            $("#change").change(function () {
                var $change = $("#change");
                if (Number($change.val())<0)
                {
                    $change.val("0")
                }
            })
        })
    </script>
</head>
    <body>
        <div id="banner">
            <a href="transfer?target=user/showorders">订单</a>
            <a href="transfer?target=user/trolley">购物车</a>
            <a href="transfer?target=user/userdetails">用户详情</a>
            <a href="transfer?target=index">继续购物</a>
            <button type="button" id="charge">充值</button>
            <span>余额：<%=user.getMoney()%></span>

            <form id="form" hidden action="charge">
                充值金额 : <input id="change" name="charge" required>
                <span id="tip"></span>
                <button id="confirm" type="button">确定</button>
                <button id="hide" type="button">取消</button>
            </form>
        </div>
    </body>
</html>
