<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/6
  Time: 2:55
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

    <title>Demo</title>

    <script src="resource1.0/js/jquery-3.1.0.js"></script>
    <script>
        $(document).ready(function () {
            var $input = $("#input");
            var $suggest =$("#suggest");


            $input.keyup(function () {
                $suggest.empty();
                if($input.val()!=""){
                    $.ajax({
                        type:"post",
                        url:"query",
                        data:{"search":$input.val()},
                        success:function (data) {

                            for(var i in data){
                                var $li = $("<li>"+data[i]['gname']+"</li>");
                                $suggest.append($li);
                                // $suggest.append("<li>"+data[i]["gname"]+"</li>");
                            }

                        }
                    })
                }

            });
            $input.focus(function () {
                $suggest.css("display","block");
            });

            $input.blur(function () {
                $suggest.css("display","none")
            })
        })
    </script>
</head>

<body  style="background: url('resource1.0/img/bg.png') no-repeat">
    <div id="container">

        <input id="input" name="search" type="text"><a href="showGoods">商城</a>
        <div id="fly" >
            <ul id="suggest" style="position:absolute;z-index: 2; list-style-type: none">

            </ul>
        </div>
        <div id="footer">

        </div>
    </div>

</body>
</html>
<%--<form action="upload" method="post" enctype="multipart/form-data">--%>

    <%--<input type="file" name="img" >--%>

    <%--<button>提交</button>--%>
<%--</form>--%>