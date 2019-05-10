<%@ page import="java.util.Set" %>
<%@ page import="java.util.List" %>
<%@ page import="com.midpac.model.User" %>
<%@ page import="com.midpac.model.Comment" %>
<%@ page import="com.midpac.model.Good" %>
<%--Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/4
  Time: 1:02
  To change this template use File | Settings | File Templates.--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

    User user = (User) session.getAttribute("user");
    String  cancomment = (String) request.getAttribute("comment");
    List<Comment> comments = (List<Comment>) request.getAttribute("comments");
    Good good = (Good) request.getAttribute("good");
    int gid = good.getId();
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>comment</title>
</head>
    <body>
        <div>
            <%if (user==null){
%>
            <a href="transfer?target=index">首页</a>
<%
            }else {
%>
            <a href="transfer?target=user/user">用户页</a>
<%          }
%>
        </div>
        <div>
            <p>
                <span>品名：<%=good.getName()%></span>
                <span>价格：<%=good.getPrice()%></span>
                <span>描述：<%=good.getDescription()%></span>
            </p>
<%
            if (comments==null||comments.isEmpty())
            {
%>
            <p>没有评论</p>
<%
            }else {
%>
            <table>
                <tr>
                    <th>评论人</th><th style="width: 200px"></th><th>内容</th>
                </tr>
<%              for (Comment comment : comments) {

%>              <tr>
                    <td><%=comment.getUser().getName()%></td><td></td><td><%=comment.getContent()%></td>
                </tr>
<%
                }
%>          </table>
<%
            }
%>
<%
    if ("true".equals(cancomment)){
%>
            <form action="comments">
                <input hidden type="text" name="method" value="add"/>
                <input hidden type="text" name="gid" value='<%=gid%>' />
                评论：
                <br/>
                <textarea name="content" cols="30" rows="10" required style="resize:none" ></textarea>
                <br/>
                <button>提交</button>
            </form>
<%        }
%>
            <%--写评论--%>
        </div>
    </body>
</html>
