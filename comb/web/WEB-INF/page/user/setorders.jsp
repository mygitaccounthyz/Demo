<%@ page import="java.util.Set" %>
<%@ page import="com.midpac.model.User" %>
<%@ page import="com.midpac.model.Userdetail" %>
<%@ page import="com.midpac.model.Good" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/4/27
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
    User user = (User) session.getAttribute("user");

    Set<Userdetail> userDetails = user.getUserdetails();
    Good good = (Good) request.getAttribute("good");

%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>setorders</title>
    <script src="resource1.0/js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $(":text").css({"width":"100px",border:"none",background:"white"});


            var $number=$("#number");//.val()
            $number.change(function () {

                var $price=$("#price");//.text()
                var $money=$("#money");
                if (Number($number.val())<1)
                {
                    $number.val(1);
                }
                var money=Number($number.val())*Number($price.text());
                $money.text(money)
            });

            $("#confirm").click(function () {
                var $orders=$("#orders");
                var $gid=$orders.find("[name=gid]");
                var $gcount=$orders.find("[name=gcount]");
                var $money=$orders.find("[name=money]");
                var $udid=$orders.find("[name=udid]");

                var gid=$("#gid").text();
                var gcount=$("#number").val();
                var money=$("#money").text();
                var udid=$(":radio:checked").val();

                $gid.val(gid);
                $gcount.val(gcount);
                $money.val(money);
                $udid.val(udid);

                $orders.show();

                if ($(":radio:checked")[0]==null){
                    $("#submit").attr("disabled",true);
                }else {
                    $("#submit").attr("disabled",false);
                }
            });
        });

        function checkform() {
            var $orders=$("#orders");
            var $gid=$orders.find("[name=gid]");
            var $gcount=$orders.find("[name=gcount]");
            var $money=$orders.find("[name=money]");
            var $udid=$orders.find("[name=udid]");

            if ($gid.val() != null && $gcount.val() != null && $money.val() != null && $udid.val() != null)
            {
                $gid.attr("disabled",false);
                $gcount.attr("disabled",false);
                $udid.attr("disabled",false);
                $money.attr("disabled",false);
                return true;

            }else {
                $(this).parent().find("span").remove();
                $(this).parent().append("<span>订单信息不完整</span>");
                return false;
            }
        }

    </script>
</head>
<body>
<div>
    <table>
        <tr>
            <th>选择</th>
            <th>编号ID</th>
            <th>手机号码</th>
            <th>地址</th>
            <th>收件人</th>
        </tr>
        <%
            if (userDetails!=null&&userDetails.size()!=0){
                for (Userdetail userDetail : userDetails) {
        %>
        <form>
            <tr>
                <td><input type="radio" class="udid" name="udid0" value="<%=userDetail.getDid()%>"></td>
                <td><input disabled  name="did" value="<%=userDetail.getDid()%>"></td>
                <td><input disabled  name="phone" value="<%=userDetail.getPhone()%>"></td>
                <td><input disabled  name="address" value="<%=userDetail.getAddress()%>"></td>
                <td><input disabled  name="receiver" value="<%=userDetail.getReceiver()%>"></td>
            </tr>
            <%                  }
            %>          </form>
        <%
        }else {
        %>
        <tr>
            <td colspan="4"><span>还没有任何详情，请去详情页添加</span></td>
        </tr>
        <%//还没有任何详情，请添加
        }
        %>
        <tr>
            <td><a href="transfer?target=user/userdetails">详情页</a></td>
        </tr>
    </table>
</div>
<div>
    <table>
        <tr>
            <th>商品名称</th>
            <th>商品ID</th>
            <th>商品价格</th>
            <th>商品数量</th>
            <th>总价</th>
            <th>确认</th>
        </tr>
        <tr id="item">
            <td><span><%=good.getName()%></span></td>
            <td><span id="gid"><%=good.getId()%></span></td>
            <td>￥<span id="price"><%=good.getPrice()%></span></td>
            <td><input id="number" name="number" value="1"></td>
            <td>￥<span id="money"><%=good.getPrice()%></span></td>
            <td><button id="confirm">生成订单</button></td>
        </tr>
    </table>

    <div hidden id="orders" style="background: orange" onsubmit="return checkform()">
        <form  id="sendpost" action="orders" method="post">
            商品ID<input disabled name="gid">
            商品数量<input disabled name="gcount">
            总价格<input disabled name="money">
            详情ID<input disabled name="udid">
            <button id="submit"  type="submit">提交</button>
            <input name="method" value="oneorder" hidden>
        </form>
    </div>
</div>
</body>
</html>
