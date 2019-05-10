<%@ page import="com.midpac.model.User" %>
<%@ page import="com.midpac.model.Userdetail" %>
<%@ page import="com.midpac.model.Trolley" %>
<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/4/28
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

    User user= (User) session.getAttribute("user");
    Set<Userdetail> userdetails = user.getUserdetails();

    Set<Trolley> trolleys =  user.getTrolleys();

%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>trolley</title>
    <script src="resource1.0/js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("th").css({"width":"150px" ,background:"none",border:"none"});
            $("td").css({"width":"150px",background:"none",border:"none"});
            $("tr").css({"text-align":"center",background:"none",border:"none"});

            var $text =$(":text");

            $text.css({"width":"100px",background:"none",border:"none"});

            $(".changenum").click(function () {
                var $tr = $(this).parents("tr");
                var $gcount = $tr.find(":input[name=gcount]");
                //备份
                $gcount.data("origin",$gcount.clone(true));
                //激活
                //数据
                $gcount.attr("disabled",false);
                $gcount.css("border","2px solid black");
                //按钮
                $tr.find(".setnum").show();
                $tr.find(".cancel").show();
                //禁用
                $tr.find(".changenum").attr("disabled",true);
                $tr.find(".deleteitem").attr("disabled",true);
            });

            $(".cancel").click(function () {
                var $tr = $(this).parents("tr");
                var $gcount =$tr.find(":input[name=gcount]");
                //还原备份,禁用状态时,复制
                $gcount.replaceWith($gcount.data("origin"));
                //激活
                $tr.find(".changenum").attr("disabled",false);
                $tr.find(".deleteitem").attr("disabled",false);
                //隐藏
                $tr.find(".setnum").hide();//按钮
                $tr.find(".cancel").hide();
            });

            $text.change(function () {
                var $target =$(this);
                if (Number($target.val())<1) {
                    $target.val("1");
                }
            });

            $(".setnum").click(function () {
                var $tr = $(this).parents("tr");
                var $id = $tr.find(":input[name=id]");
                var id = $id.val();
                var $gcount = $tr.find(":input[name=gcount]");
                var gcount =$gcount.val();

                $.post("trolley",{"method":"update","id":id,"gcount":gcount},function (obj)
                {
                    if (obj=="1") {
                        //确认修改
                        $gcount.attr("disabled",true);
                        $gcount.css("border","none");
                        //激活按钮
                        $tr.find(".changenum").attr("disabled",false);
                        $tr.find(".deleteitem").attr("disabled",false);
                        //隐藏
                        $tr.find(".setnum").hide();
                        $tr.find(".cancel").hide();
                    }
                    else
                    if (obj == "0") {
                        //打印信息
                        $tr.find(":button:last").after("<span>修改失败</span>");
                    }
                    else {
                        alert("error");
                    }
                });
            });

            $(".deleteitem").click(function () {
                var $form = $(this).parents("form");
                var $id = $form.find(":input[name=id]");
                var id = $id.val();

                $.post("trolley",{"method":"delete","id":id},function (obj){
                    if (obj == "1") {
                        $form.remove();
                    }else if (obj == "0") {
                        $form.find(":button:last").after("<span>删除失败</span>");
                    }else {
                        alert("error");
                    }
                })
            });

            $("#pay").click(function () {
                var $input = $("#input");
                $input.empty();//清空

                var $checked=$(":checkbox:checked");
                // var items = new Array();

                for (var i = 0; i < $checked.length; i++) {

                    var $in =$("<input hidden type='checkbox' name='items' checked>");
                    $in.val($checked[i].value);
                    $input.append($in);

                }

                var $p=$("<p></p>");
                $p.text("共选中"+($checked.length)+"项");
                $input.append($p);
                // $input.append("<p></p>").text("共选中"+($checked.length)+"项");
                var $pf =$("#payform");

                $pf.show();//显示
            })

        })
    </script>
</head>
<body>
<div>
    <%
        if (trolleys==null||trolleys.isEmpty())
        {
    %>              <p>购物车没有商品</p>
    <br/>
    <a href="transfer?target=user/user">用户页</a>
    <%
            return;
        }
    %>
    <table>
        <tr>
            <th class="item">项目选择</th>
            <th class="id">项目id</th>
            <th class="name">品名</th>
            <th class="price">单价</th>
            <th class="gcount">数量</th>
            <th class="button">修改数量</th>
            <th class="button">删除项目</th>
            <th hidden></th>
            <th hidden></th>
        </tr>
    </table>
    <%
        for (Trolley trolley : trolleys)
        {
            //        sum+=buycar.getByDetail().getGcount()*buycar.getGood().getPrice();
    %>
    <form>
        <table style="text-align: center;border:black 1px solid">
            <tr>
                <td class="item"><span><input type="checkbox" name="item" value="<%=trolley.getId()%>"></span></td>
                <td class="id"><span><input disabled  name="id" value="<%=trolley.getId()%>"></span></td>
                <td class="name"><span><input disabled  name="name" value="<%=trolley.getGood().getName()%>"></span></td>
                <td class="price"><span><input disabled  name="price" value="<%=trolley.getGood().getPrice()%>"></span></td>
                <td class="gcount"><span><input disabled  name="gcount" value="<%=trolley.getGcount()%>"></span></td>
                <%--商品数量可变--%>
                <td class="button"><span><button class="changenum" type="button">修改数量</button></span></td>
                <td class="button"><span><button class="deleteitem" type="button">删除项目</button></span></td>
                <td class="button"><span><button hidden class="setnum" type="button">确定修改</button></span></td>
                <td class="button"><span><button hidden class="cancel" type="button">取消修改</button></span></td>
            </tr>
        </table>
    </form>
    <%
        }
    %>

    <a href="transfer?target=user/user">用户页</a>
    <button id="pay" type="button">确认</button>

    <form id="payform" hidden action="orders">
        <div id="input">

        </div>
<% for (Userdetail userdetail : userdetails) {
%>         <p><input type="radio" name="udid" required value="<%=userdetail.getDid()%>">
         地址　:<%=userdetail.getAddress()%>
         电话　:<%=userdetail.getPhone()%>
         收件人:<%=userdetail.getReceiver()%>
    </p>
<%
}
%>
        <input hidden name="method" value="bulkorders">
        <input type="submit" value="提交"/>
    </form>
</div>
</body>
</html>
