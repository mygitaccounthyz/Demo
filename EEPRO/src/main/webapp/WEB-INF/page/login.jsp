<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/16
  Time: 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>login</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>

        $(function () {

            $(":radio[name=character]").change(function () {
               var $character= $(this);
               var character=$character.val();
               var $employee = $(".employee");
               var $visitor =$(".visitor");

               if (character=="visitor") {
                   $employee.attr({"disabled":true});
                   $("#employee").attr("hidden",true);
                   $visitor.attr({"disabled":false});
                   $("#visitor").attr("hidden",false);
               }else if (character == "employee") {
                   $visitor.attr({"disabled":true});
                   $("#visitor").attr("hidden",true);
                   $employee.attr({"disabled":false});
                   $("#employee").attr("hidden",false);
               }
            })
        })
    </script>
</head>
<body>
    <div>
        <p>登录界面</p>
        <form action="login.do">
            <p id="visitor">
                用户名<input class="visitor" name="viName"><br>
                密　码<input class="visitor" name="viPass"><br>
            </p>
            <p hidden id="employee">
                用户名<input class="employee" disabled name="eeName"><br>
                密　码<input class="employee" disabled name="eePass"><br>
            </p>
            游客<input name="character" value="visitor" type="radio" checked>
            员工<input name="character" value="employee" type="radio">
            <button>提交</button>
        </form>
    </div>
</body>
</html>
