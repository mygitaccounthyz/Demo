<%@ page import="com.midpac.model.User" %>
<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/4
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

    User user = (User) session.getAttribute("user");
    Integer tp= (Integer) session.getAttribute("tp");
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>admin</title>
</head>
<body>
    <div id="banner">
        <a href="transfer?target=login">登录</a>
        <a href="orders?method=show">订单</a>
        <a href="records?method=show">记录</a>
    </div>

<%
        if (session.getAttribute("goods")==null){
%>
    <p>没有商品</p>
<%  return;
    }
%>
    <div id="container">
        <table>
            <tr>
                <th></th> <%--0--%>
                <th>商品名称</th> <%--1--%>
                <th>商品状态</th> <%--2--%>
                <th>上架</th> <%--3--%>
                <th>下架</th> <%--4--%>
                <th>库存数量</th> <%--5--%>
                <th>进货数量</th> <%--6--%>
                <th>确认改变</th> <%--7--%>
            </tr>
            <c:forEach items="${sessionScope.goods}" var="good">
                    <tr>
                        <form action="stock">
                            <%--<td hidden><span class="id">${good.id}</span></td>--%>
                        <td><span class="id"><input hidden type="text" name="gid" value="${good.id}"></span></td> <%--0--%>
                        <td><span class="name">${good.name}</span></td> <%--1--%>
                        <td><span class="st">${good.state}</span></td> <%--2--%>
                        <td><span class="on"><a href="showGoods?method=on&gid=${good.id}">上架</a></span></td> <%--3--%>
                        <td><span class="off"><a href="showGoods?method=off&gid=${good.id}">下架</a></span></td> <%--4--%>
                        <td><span class="stock">${good.stock.gcount}</span></td><%--5--%>
                        <td><span class="input"><input name="in" type="number"></span></td><%--6--%>
                        <td><span class="input"><button >确定</button></span></td> <%--7--%>
                        <td><span><input hidden type="text" name="method" value="addgcount"></span></td>
                        </form>
                    </tr>
            </c:forEach>

        </table>
        <p>添加商品</p>
        <form action="showGoods">
            <input type="text" hidden name="method" value="add">
            <table>
                <tr>
                    <th>品名</th>
                    <th>单价</th>
                    <th>类型</th>
                    <th>描述</th>
                    <th>厂商</th>
                    <th>库存</th>
                    <th></th>
                </tr>
                <tr>
                    <td><input name="name" type="text"></td>
                    <td><input name="price" type="number"></td>
                    <td><input name="type" type="text"></td>
                    <td><input name="description" type="text"></td>
                    <td><input name="factory" type="text"></td>
                    <td><input name="stock" type="number"></td>
                </tr>
            </table>
        </form>
    </div>
    <div id="foot">
        <c:forEach var="i" begin="1" end="<%=tp%>">
            <a href="showGoods?method=getpage&cp=${i}">${i}</a>
        </c:forEach>
    </div>
</body>

</html>
