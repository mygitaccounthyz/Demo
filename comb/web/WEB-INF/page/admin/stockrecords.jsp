<%@ page import="java.util.List" %>
<%@ page import="com.midpac.model.StockRecord" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/4
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

    List<StockRecord> records = (List<StockRecord>) request.getAttribute("records");

%>
<%!private static String states(int state){
    String res ="null";
    if (state==-1)res ="出货";
    if (state==1) res ="进货";
    return res;
}
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>records</title>
</head>
    <body>
<%      if (records==null||records.isEmpty()){

%>      <p>没有记录</p>
<%
        return;
        }
%>
        <div id="banner">
            <a href="transfer?target=login">登录</a>
            <a href="orders?method=show">订单</a>
            <a href="showGoods">商品</a>
        </div>
        <div id="container">
<%  if (records==null||records.isEmpty())
{
%> <p>没有记录</p>
<%return;
}
%>
            <table>
                <tr>
                    <th>品名</th>
                    <th style="width: 100px"></th>
                    <th>数量</th>
                    <th style="width: 100px"></th>
                    <th>时间</th>
                    <th style="width: 100px"></th>
                    <th>状态</th>
                </tr>

<%
    for (StockRecord record : records) {
%>
                <tr>
                    <td><%=record.getGood().getName()%></td>
                    <td></td>
                    <td><%=record.getGcount()%></td>
                    <td></td>
                    <td><%=record.getTime()%></td>
                    <td></td>
                    <td><%=states(record.getState())%></td>
                </tr>
<%
    }
%>
            </table>
        </div>
    </body>
</html>
