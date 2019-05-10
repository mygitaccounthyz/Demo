<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.midpac.model.User" %>
<%@ page import="com.midpac.model.Orders" %>
Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/4
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

    User user = (User) session.getAttribute("user");
    List<Orders> orders = (List<Orders>) request.getAttribute("orders");
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>adminorders</title>
    <script src="resource1.0/js/jquery-3.1.0.js"></script>
    <script>

        $(function () {
            var conditions =$(".condition");
            for (var i = 0; i < conditions.length; i++) {
                var condition =conditions[i];
                var $condition =$(condition);
                if ($condition.text()=="1") {
                    var tr =$condition.parents("tr");
                    tr.find(".delivery").append("<button onclick='delivery(this)' type='button'>发货</button>");

                }
            }
        });
        function delivery(button){
            var $button=$(button)
            var tr =$button.parents("tr");
            var $oid=tr.find(".oid");

            var oid =$oid.text();
            $.post("orders",{"method":"delivery","oid":oid},function (obj) {
                if (obj == 1) {
                    tr.find(".condition").text("2");
                    $button.hide();
                }else if (obj == 0)
                {
                    alert("发货失败");
                } else{
                    alert("error");
                }
            })

        }
    </script>
</head>
<body>

<div id="banner">
    <a href="showGoods">商品</a>
    <a href="records?method=show">记录</a>
    <a href="orders?method=show">全部订单</a><span style="width: 30px"></span>
    <a href="orders?method=showstate&state=1">未发货订单</a><span style="width: 30px"></span>
    <a href="orders?method=showstate&state=2">已发货订单</a><span style="width: 30px"></span>
    <a href="orders?method=showstate&state=3">已收货订单</a><span style="width: 30px"></span>
</div>
<%    if (user==null||user.getGrade()!=1){
%>      <p>不是管理员</p>
<%      return;}
%>
<%    if (orders==null||orders.isEmpty()){
%>      <p>没有订单</p>
<%      return;}
%>

<div id="container">

    <table>
        <tr>
            <th>订单ID</th><%--1--%>
            <th>订单状态</th><%--2--%>
            <th>商品名称</th><%--3--%>
            <th>商品ID</th><%--4--%>
            <th>商品数量</th><%--5--%>
            <th>订单价格</th><%--6--%>
            <th>用户ID</th><%--7--%>
            <th>收件人</th><%--8--%>
            <th>更新时间</th><%--9--%>
            <th>发货</th><%--10--%>
        </tr>
        <tr>
            <td colspan="10">订单状态：1、未发货；2、未收货；3、已收货。</td>
        </tr>
        <c:forEach var="order" items="<%=orders%>">
            <tr>
                <td><span class="oid">${order.id}</span></td><%--1--%>
                <td><span class="condition">${order.state}</span></td><%--2--%>
                <td><span class="name">${order.good.name}</span></td><%--3--%>
                <td><span class="gid">${order.good.id}</span></td><%--4--%>
                <td><span class="gcount">${order.gcount}</span></td><%--5--%>
                <td><span class="money">${order.money}</span></td><%--6--%>
                <td><span class="uid">${order.user.uid}</span></td><%--7--%>
                <td><span class="receiver">${order.userdetail.receiver}</span></td><%--8--%>
                <td><span class="time">${order.time}</span></td><%--9--%>
                <td><span class="delivery"></span></td>
                    <%--<td><span class="delivery" hidden><button onclick="delivery(this)" type="button">发货
                    </button></span></td>&lt;%&ndash;10&ndash;%&gt;--%>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
