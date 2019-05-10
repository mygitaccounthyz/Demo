<%@ page import="java.util.Set" %>
<%@ page import="com.midpac.model.User" %>
<%@ page import="com.midpac.model.Userdetail" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/4/28
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    User user = (User) session.getAttribute("user");
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>userdetails</title>
    <script src="resource1.0/js/jquery-3.1.0.js"></script>
    <script>
//get,post,action
        $(function () {

            $(":text").css({"width":"50px",border:"none",background:"white"});

            $(".delete").click(function () {
                var $did =$(this).parent().prev().prev().prev().prev().find(":first").val();
                var $method ="delete";
                var $form = $(this).parent().parent();
                $.post("userDetail",{"did":$did,"method":$method},function (obj) {
                    if (obj=="1") {//ok
                        $form.remove();
                    }else {//ng
                        $form.find(".error").remove();
                        $form.append("<td class='error'><span>删除失败</span></td>")
                    }
                })
            });
            $(".change").click(function () {
                var $form = $(this).parent().parent();
                //数据备份
                $form.data("origin",$form.clone(true));
                //数据可编辑
                $form.find(":text").attr("disabled",false);
                $form.find(":text[name=did]").attr("disabled",true);
                //id不可编辑
                $form.find(":text").css("border","2px black solid");
                $form.find(":text[name=did]").css("border","none");
                //增加操作button
                $form.append("<td><button onclick='confirm(this)' class='confirm'>确认修改</button></td>");
                $form.append("<td><button onclick='cancel(this)' class='cancel' >取消</button></td>");
                //button不可重复用
                $(this).attr("disabled",true)
            });


            $(".add").click(function () {
                $("#add").show();
            });
            $("#hide").click(function () {
                $("#add").hide();
            });

        });
        //not ready
        function confirm(ts){
            var $confirm = $(ts);
            var $form=$(ts).parent().parent();
            var $did=$form.find(":text[name=did]").val();
            var $phone=$form.find(":text[name=phone]").val();
            var $address=$form.find(":text[name=address]").val();
            var $receiver=$form.find(":text[name=receiver]").val();
            $.post("userDetail",{"did":$did,"phone":$phone,"receiver":$receiver,"address":$address,"method":"update"},
                function (obj) {
                    if (obj == "1") {//ok
                        //数据不可编辑
                        $form.find(":text").attr("disabled",true);
                        //修改重新可用
                        $form.find(".change").attr("disabled",false);
                        //新button删除
                        $form.find(".cancel").remove();
                        $confirm.remove();
                        $form.find(":text").css("border","none");
                    }else {//ng
                        $form.find(".error").remove();
                        $form.append("<td class='error'><span>修改失败</span></td>")
                    }
                });
        }
        function cancel(obj){
            //备份还原
            var $form = $(obj).parent().parent();

            $form.replaceWith($form.data("origin"));

        }
    </script>
</head>
<body>

<table>
    <tr>
        <th>编号ID</th>
        <th>手机号码</th>
        <th>地址</th>
        <th>收件人</th>
        <th>删除</th>
        <th>修改</th>
    </tr>
    <%
        Set<Userdetail> userDetails = (Set<Userdetail>) user.getUserdetails();
        if (userDetails!=null&&userDetails.size()!=0){
            for (Userdetail userDetail : userDetails) {
    %>
    <tr>
        <form class="ori">
            <td><input disabled  name="did" value="<%=userDetail.getDid()%>"></td>
            <td><input disabled  name="phone" value="<%=userDetail.getPhone()%>"></td>
            <td><input disabled  name="address" value="<%=userDetail.getAddress()%>"></td>
            <td><input disabled  name="receiver" value="<%=userDetail.getReceiver()%>"></td>
            <td><button type="button" class="delete">删除详情</button></td>
            <td><button type="button" class="change">修改详情</button></td>
        </form>
    </tr>
    <%}
    %>
    <tr>
        <td colspan="4">
            <button class="add">添加详情</button>
        </td>
    </tr>
    <%
    }else {
    %>
    <tr>
        <td colspan="4"><button class="add">还没有任何详情，请添加</button></td>
    </tr>
    <%//还没有任何详情，请添加
        }
    %>
</table>
<table hidden id="add">
    <tr>
    <tr>
        <th>手机号码</th>
        <th>地址</th>
        <th>收件人</th>
        <th></th>
        <th></th>
    </tr>
    <form action="userDetail" method="post">
        <td><input placeholder="收件人" name="receiver"></td>
        <td><input placeholder="电话" name="phone"></td>
        <td><input placeholder="地址" name="address"></td>
        <td><input type="submit" value="提交"></td>
        <td><button type="button" id="hide">取消</button></td>
        <input type="hidden" name="method" value="add">
    </form>
    </tr>
</table>
<a href="transfer?target=user/user">用户页</a>
</body>
</html>
