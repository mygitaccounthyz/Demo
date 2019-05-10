<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/4/24
  Time: 0:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>register</title>
    <script src="jquery/jquery-3.1.0.js"></script>
    <script>

        var cName=false;
        var cPass=false;
        function checkName(input) {
            var $input =$(input);
            var $namesp=$("#namesp");
            if ($input.val()==null||$input.val().length==0)
            {
                $namesp.html("用户名不能为空");
                $namesp.css({"color":"red"});
                cName=false;
            }else if (!/^[_a-zA-Z]/.test(input.value))
            {
                $namesp.html("用户名必须以下划线或字母开头");
                $namesp.css({"color":"red"});
                cName=false;
            }else if (input.value.length<5||input.value.length>10)
            {
                $namesp.html("用户名长度在必须在5-10");
                $namesp.css({"color":"red"});
                cName=false;
            }else {
                $.get("register",{"name":$("#name").val(),"method":"check"},function (obj) {
                    if ("0"==obj)
                    {
                        $namesp.html("用户名已存在");
                        $namesp.css({"color":"red"});
                        cName=false;
                    }else if ("1"==obj){
                        $namesp.html("可用");
                        $namesp.css({"color":"green"});
                        cName=true;
                    }
                })
            }
        }

        function checkPass(input) {
                var $passsp=$("#passsp");
                if (/^\d+$/.test(input.value)) {
                    $passsp.html("不能为纯数字");
                    $passsp.css("color","red");
                    cPass=false;
                }else if (input.value.length<6) {
                    $passsp.html("长度不能小于6");
                    $passsp.css("color","red");
                    cPass=false;
                }else {
                    $passsp.html("可用");
                    $passsp.css("color","green");
                    cPass=true;
                }
            }

    </script>
</head>
<body>
<div>
    <p>用户注册</p>
    <form action="register" method="post">
        <span style="display: inline-block; width: 100px">用户名</span>
        <input id="name" name="name" type="text" onblur="checkName(this)" required>
        <span id="namesp"></span><br/>
        <span style="display: inline-block; width: 100px">密　码</span>
        <input id="pass" name="pass" type="password" onblur="checkPass(this)" required>
        <span id="passsp"></span><br/>
        用户<input type="radio" name="type" value="0" checked>
        管理员<input type="radio" name="type" value="1">
        <input hidden name="method" value="register">
        <input id="submit" type="submit" onclick="return cName&&cPass">
    </form>
    <a href="transfer?target=index">首页</a>
</div>
</body>

</html>
