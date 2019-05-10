<%@ page import="java.util.List" %>
<%@ page import="com.midpac.model.Good" %>
<%@ page import="com.midpac.model.User" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/4/22
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

  User user = (User) session.getAttribute("user");
  Integer tp= (Integer) session.getAttribute("tp");
//  List<Good> goods = (List<Good>) session.getAttribute("goods");



%>
<html>
  <head>
  <base href="<%=basePath%>"/>
    <title>Index</title>
      <script src="resource1.0/js/jquery-3.1.0.js"></script>
      <script>

      </script>
  </head>
  <body>
    <div id="banner">
        <c:if test="<%=user!=null%>" var="login">
            <a href="transfer?target=user/user">用户界面</a>
        </c:if>
        <c:if test="${!login}">
            <a href="transfer?target=login">登录</a>
        </c:if>
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
          <th>商品名称</th> <%--1--%>
          <th>单价</th> <%--2--%>
          <th>类型</th> <%--3--%>
          <th>简介</th> <%--4--%>
          <th>厂商</th> <%--5--%>
          <th>加入购物车</th> <%--6--%>
          <th>立即购买</th> <%--7--%>
        </tr>
          <c:forEach items="${sessionScope.goods}" var="good">
              <c:if test="${good.state==1}">
              <tr>
                  <%--<td hidden><span class="id">${good.id}</span></td>--%>
                  <td><span class="name">${good.name}</span></td> <%--1--%>
                  <td><span class="price">${good.price}</span></td> <%--2--%>
                  <td><span class="type">${good.type}</span></td> <%--3--%>
                  <td><span class="description">${good.description}</span></td> <%--4--%>
                  <td><span class="factory">${good.factory}</span></td> <%--5--%>
                  <td class="trolley"><span><a href="trolley?method=add&gid=${good.id}">加入购物车</a></span></td> <%--6--%>
                  <td class="buy"><span><a href="orders?method=setorders&gid=${good.id}">立即购买</a></span></td> <%--7--%>
                  <td><span><a href="comments?method=show&gid=${good.id}">评论</a></span></td>
              </tr>
              </c:if>
          </c:forEach>

      </table>
    </div>

    <div id="foot">
        <c:forEach var="i" begin="1" end="<%=tp%>">
            <a href="showGoods?method=getpage&cp=${i}">${i}</a>
        </c:forEach>
    </div>
  </body>

</html>
