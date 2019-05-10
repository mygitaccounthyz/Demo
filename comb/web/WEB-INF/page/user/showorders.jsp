<%@ page import="com.midpac.model.*" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/4/17
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    User user = (User) request.getSession().getAttribute("user");

    String [] states ={"未付款","未发货","已发货","已收货"};
    String state0 = request.getParameter("state");
    int state = -1;
    if (state0!=null)state=Integer.parseInt(state0);
    Set<Orders> orders =user.getOrders();
    Set<Orders> ordersList;
    if (state==-1)ordersList=orders;
    else {
        ordersList =new HashSet<>();
        for (Orders order : orders) {
            if (order.getState()==state) ordersList.add(order);
        }
    }
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>Title</title>
    <script src="resource1.0/js/jquery-3.1.0.js"></script>
    <script>
<%--if(user.grade==0)--%>
        $(function () {
                var conditions = $(".state");
            for (var i = 0; i < conditions.length; i++) {
                var state =conditions[i].innerHTML;
                if (state=="未付款")
                {
                   $(conditions[i]).parents("table").find(".button1").html("<button onclick=' pay(this)' type='button'>付款</button>");
                   $(conditions[i]).parents("table").find(".button2").html("<button onclick=' cancel(this)'  type='button'>取消订单</button>");
                }else if (state=="未发货") {
                    $(conditions[i]).parents("table").find(".button2").html("<button onclick=' chargeback(this)'  type='button'>取消订单</button>");
                }else if (state=="已发货") {
                    $(conditions[i]).parents("table").find(".button1").html("<button onclick=' receive(this) '  type='button'>确认收货</button>");
                }else if (state=="已收货") {
                    var $a =$(conditions[i]).parents("table").find(".button1");
                    $a.html("<a>评价商品</a>");
                    var gid = $(conditions[i]).parents("table").find(".gid").html();
                    $a.find("a").attr("href",'comments?method=comment&gid='+gid);
                }
            }
        });
<%--if(user.grade==1)--%>


//数据库中不可变数据，只需要得到id，并上传方法名
//不要用state做属性值


    </script>
</head>
    <body>
        <div id="banner">
            <a href="transfer?target=user/showorders">全部订单</a><span style="width: 30px"></span>
            <a href="forward?target=user/showorders&state=0">未付款订单</a><span style="width: 30px"></span>
            <a href="forward?target=user/showorders&state=1">未发货订单</a><span style="width: 30px"></span>
            <a href="forward?target=user/showorders&state=2">已发货订单</a><span style="width: 30px"></span>
            <a href="forward?target=user/showorders&state=3">已收货订单</a><span style="width: 30px"></span>
            <a href="transfer?target=index">首页</a>
            <span style="width: 100px"></span>
            <span>账户余额 : <%=user.getMoney()%></span>
        </div>
        <div id="container" style="text-align: center">
<%
    if (ordersList==null||ordersList.isEmpty()){
%>
            <p><span>没有订单</span></p>
<%          return;
    }
%>
<%
                    for (Orders order : ordersList)  {

                    Good good = order.getGood();
                    Userdetail ud =order.getUserdetail();
%>

            <table style="background: #fabb6b;margin:20px">
                <tr>
                    <td>订单编号 : <span class="oid"><%=order.getId()%></span></td>
                    <td>订单状态 : <span class="state"><%=states[order.getState()]%></span></td>
                    <td>更新时间 : <span class="time"><%=order.getTime()%></span></td>
                </tr>
                <tr>
                    <td>订单价格 : <span class="money"><%=order.getMoney()%></span></td>
                    <td>商品数量 : <span class="gcount"><%=order.getGcount()%></span></td>
                    <td>商品名称 : <span class="name"><%=good.getName()%></span></td>
                </tr>
                <tr>
                    <td>收件人 : <span class="receiver"><%=ud.getReceiver()%></span></td>
                    <td>电话 : <span class="phone"><%=ud.getPhone()%></span></td>
                    <td>地址 : <span class="address"><%=ud.getAddress()%></span></td>
                </tr>
                <tr>
                    <td><span class="button1"></span></td>
                    <td><span class="button2"></span></td>
                    <td><span hidden class="gid"><%=good.getId()%></span></td>
                </tr>
            </table>

<%
                }
%>
        </div>
    </body>
<script>

    function pay(button) {//st+1
        var $button = $(button);
        var $table = $button.parents("table");

        var $oid = $table.find("span[class='oid']");
        var method = "pay";
        var oid = $oid.text();

        var $state =$table.find(".state");

        $.post("orders",{"method":method,"oid":oid},function (obj) {
            if (obj=="1")
            {
                $state.text("未发货");
                $table.find(".button1").html("");
                $table.find(".button2").html("<button onclick=' chargeback(this)' type='button'>取消订单</button>");
            }else if (obj == "0") {
                alert("付款失败");
            }else {
                alert("error")
            }
        });

    }
    function cancel(button) {//delete

        var $button = $(button);
        var $table = $button.parents("table");
        var $oid = $table.find("span[class=oid]");

        var method ="cancel";
        var oid= $oid.text();

        $.post("orders",{"method":method,"oid":oid},function (obj) {
            if (obj == "1") {
                $table.remove();
            }else if (obj == "0") {
                alert("取消订单失败");
            }else {
                alert("error");
            }
        })

    }
    function chargeback(button) {//delete,

        var $button = $(button);
        var $table = $button.parents("table");

        var $oid = $table.find("span[class='oid']");
        var method ="chargeback";
        var oid = $oid.text();


        $.post("orders",{"method":method,"oid":oid},function (obj) {
            if (obj == "1") {
                $table.remove();
            }else if (obj == "0") {
                alert("取消订单失败");
            }else {
                alert("error");
            }
        })
    }
    function receive(button) {//st+1

        var $button = $(button);
        var $table = $button.parents("table");
        var $state = $table.find(".state");
        var $oid = $table.find("span[class='oid']");
        var method ="receive";
        var oid = $oid.text();

        $.post("orders",{"method":method,"oid":oid},function (obj) {
            if (obj == "1") {
                $state.text("<%=states[3]%>");

                var $a= $table.find(".button1");
                $a.html("<a>评价商品</a>");
                var gid = $table.find(".gid").html();
                $a.find("a").attr("href",'comments?method=comment&gid='+gid);

                $table.find(".button2").html("");
            }else if (obj == "0") {
                alert("收货失败");
            }else {
                alert("error");
            }
        })
    }
    // function comment(button) {
    //
    // };
</script>
</html>
