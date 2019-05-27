<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/26
  Time: 0:37
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
    <title>employee</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        var  eeId =${sessionScope.user.eeId};
        var newDate =new Date();
        var today =newDate.getFullYear()+"-"+newDate.getMonth()+"-"+newDate.getDate();
        function onDuty() {
            $.post("onDuty.do",{"eeId":eeId},function (rs) {
                if (rs == "1") {
                    $("#onDuty").attr("disabled",true);
                    $("#spOnDuty").text("已上班");
                } else {
                    alert("失败")
                }
            })
        }

        function offDuty() {
            $.post("offDuty.do",{"eeId":eeId},function (rs) {
                $("#offDuty").attr("disabled",true);
                $("#spOffDuty").text("已下班");
            })
        }

        function showAll() {
            $("#colleagueInformation").find("tr").show();
        }

        function getAttendance() {
            if (yyyy == null && MM == null) {
                alert("选择年月")
            }else {
                $showAttendance.replaceWith($showAttendance.data("origin"));
                $.post("getAttendance.do",{"yyyy":yyyy,"MM":MM,"eeId":eeId},function (attandences) {

                    for(var i in attandences){
                        var $tr = $("<tr></tr>");
                        $tr.append(" <td>"+attendance[i]["atOn"]+"</td>\n" +
                            "                            <td>"+attendance[i]["atOff"]+"</td>")
                        $showAttendance.append($tr);
                    }
                })
            }
        }
        
        function getDeal() {
            if (yyyy == null && MM == null) {
                alert("选择年月")
            }else {
                $showDeal.replaceWith($showDeal.data("origin"));
                $.post("getDeal.do",{"yyyy":yyyy,"MM":MM,"eeId":eeId},function (deals) {

                    for(var i in deals){
                        var $tr = $("<tr></tr>");
                        $tr.append(" <td>"+deals[i]["dlDate"]+"</td>\n" +
                            "                            <td>"+deals[i]["dlMoney"]+"</td>"+
                            "                            <td>"+deals[i]["dlReason"]+"</td>")
                        $showDeal.append($tr);
                    }
                })
            }

        }

        function slReset(button) {
            var $button = $(button);
            var $tr = $button.parents("tr");
            var slId = $tr.data("slId");
            var $slReset = $tr.find("input[name=slReset]")
            var slReset = $slReset.val();
            if (slReset == null) {
                alert("填写复议的理由")
            }else {
                $.post("slReset.do",{"slId":slId},function (rs) {
                    if (rs=="1"){
                        $slReset.replaceWith(slReset);
                        $button.remove();
                    } else {
                        alert("失败")
                    }
                })
            }
        }

        var dpId=null;
        var jId=null;
        var yyyy=null;
        var MM=null;
        var $showAttendance =null;
        var $showDeal =null;

        $(function () {

            $showAttendance = $("#showAttendance");
            $showAttendance.data("origin",$showAttendance);
            $showDeal = $("#showDeal");
            $showDeal.data("origin",$showDeal);

            var $atOn = $(".atOn");
            var $atOff = $(".atOff");

            for (var i = 0; i < $atOn.length; i++) {
                if ($($atOn[i]).text().substr(0,10)==today) {
                    $("#onDuty").attr("disabled",true);
                    $("#spOnDuty").text("已上班");
                    break;
                }
            }

            for (var j = 0; j < $atOff.length; j++) {
                if ($($atOff[i]).text().substr(0,10)==today) {
                    $("#offDuty").attr("disabled",true);
                    $("#spOffDuty").text("已下班");
                    break;
                }
            }

            
            $("#department").change(function () {
                var $dpDrop = $(this);
                dpId=$dpDrop.val();

                $(".coInformation").hide();
                $("tr[data-dpId="+dpId+"]").show();

                $.post("getColleagueJobs.do",{"dpId":dpId},function (jobs) {
                    var $jobDrop = $("#job");
                    for(var i in jobs){
                        var $option = $jobDrop.append("<option></option>");
                        $option.val(jobs[i]["jId"]);
                        $option.text(jobs[i]["jName"]);
                    }
                })

            });

            $("#job").change(function () {
                var $jobDrop = $(this);
                jId=$jobDrop.val();

                $(".coInformation").hide();
                $("tr[data-jId="+jId+"]").show();

            });

        })


    </script>
</head>
<body>
<div id="wrapper">

    <div id="banner">
        <a href="transfer?target=index">首页  </a>
        <a href="transfer?target=editBasic">个人信息  </a>
        <a href="quit.do">退出  </a>
    </div>

    <div id="container">

        <div id="buttons">
            <button id="onDuty" onclick="onDuty()">上班</button><span id="spOnDuty"></span>
            <button id="offDuty" onclick="offDuty()">下班</button><span id="spOffDuty"></span>
        </div>

        <div id="selector">
            <label>
                部门
                <select name="dpId" id="department">
                    <c:forEach items="${sessionScope.departments}" var="department">
                        <option value="${department.dpId}">${department.dpName}</option>
                    </c:forEach>
                </select>
            </label>
            <label>
                职位
                <select name="jId" id="job">

                </select>
            </label>
        </div>

        <div id="colleagueInformation">
            <button onclick="showAll()">显示全部</button>
            <table>
                <tr>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>电话</th>
                    <th>出生日期</th>
                    <th>Email</th>
                    <th>联系地址</th>
                </tr>
                <c:forEach items="${sessionScope.departments}" var="department">
                        <c:forEach items="${department.dpJobs}" var="job">
                                <c:forEach items="${job.jEmployees}" var="employee">
                                    <tr class="coInformation" data-dpId="${department.dpId}" data-jId="${job.jId}">
                                        <td>${employee.eeBsId.bsName}</td>
                                        <td>${employee.eeBsId.bsGender}</td>
                                        <td>${employee.eeBsId.bsPhone}</td>
                                        <td>${employee.eeBsId.bsBirth}</td>
                                        <td>${employee.eeBsId.bsEmail}</td>
                                        <td>${employee.eeBsId.bsAddress}</td>
                                    </tr>
                                </c:forEach>
                        </c:forEach>
                </c:forEach>
            </table>
        </div>

        <div id="eeInformation">

            <div id="dateSelector">

                <label>
                    年
                    <select name="yyyy" id="selectYear">
<%--2019\2020--%>
                    </select>
                </label>

                <script>
                    var $yyyy = $("#selectYear");
                    var newDate = new Date();
                    $yyyy.append("<option value=\""+newDate.getFullYear()+"\">"+newDate.getFullYear()+"</option>");
                    $yyyy.append("<option value=\""+(newDate.getFullYear()-1)+"\">"+(newDate.getFullYear()-1)+"</option>");
                </script>

                <label>
                    月<select name="MM" id="selectMonth">
<%--1-12--%>
                    <%--<c:forEach begin="1" end="12" step="1" var="month">--%>
                        <option value="01">1月</option>
                        <option value="02">2月</option>
                        <option value="03">3月</option>
                        <option value="04">4月</option>
                        <option value="05">5月</option>
                        <option value="06">6月</option>
                        <option value="07">7月</option>
                        <option value="08">8月</option>
                        <option value="09">9月</option>
                        <option value="10">10月</option>
                        <option value="11">11月</option>
                        <option value="12">12月</option>
                    <%--</c:forEach>--%>
                </select>
                </label>

            </div>


            <div id="attendance">
                <button onclick="getAttendance()">查询出勤</button>
                <table id="showAttendance">
                    <tr>
                        <th>上班时间</th>
                        <th>下班时间</th>
                    </tr>
                    <c:forEach items="${sessionScope.user.eiAttendances}" var="attendance">
                        <tr>
                            <td class="atOn">${attendance.atOn}</td>
                            <td class="atOff">${attendance.atOff}</td>
                        </tr>
                    </c:forEach>

                </table>
            </div>

            <div id="salary">

                <table id="showSalary" >
                    <tr>
                        <th>结算状态</th>
                        <th>结算日期</th>
                        <th>基础</th>
                        <th>加班工资</th>
                        <th>奖惩结算</th>
                        <th>社保</th>
                        <th>实际发放</th>
                        <th>复议原因</th>
                        <th>复议</th>
                    </tr>
                    <c:forEach items="${sessionScope.user.eiSalaries}" var="salary">
                        <tr data-slId="${salary.slId}">
                            <td>${salary.slState}</td>
                            <td>${salary.slDate}</td>
                            <td>${salary.slBase}</td>
                            <td>${salary.slOvertime}</td>
                            <td>${salary.slDlMoney}</td>
                            <td>${salary.slInsurance}</td>
                            <td>${salary.slPayment}</td>

                            <c:if test="${empty salary.slReset}" var="flag">
                                <td class="slReset"><input name="slReset"></td>
                                <td><button onclick="slReset(this)">复议</button></td>
                            </c:if>
                            <c:if test="${!flag}">
                                <td class="slReset">${salary.slReset}</td>
                                <td></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <div id="deal">
                <button onclick="getDeal()">查询奖惩</button>
                <table id="showDeal">
                    <tr>
                        <th>生成日期</th>
                        <th>金额</th>
                        <th>原因</th>
                    </tr>

                    <c:forEach items="${sessionScope.user.eiAttendances.eiDeals}" var="deal">
                        <tr>
                            <td>${deal.dlDate}</td>
                            <td>${deal.dlMoney}</td>
                            <td>${deal.dlReason}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <div id="training">

                <table>
                    <tr>
                        <th>培训主题</th>
                        <th>培训时间</th>
                        <th>培训地点</th>
                        <th>培训内容</th>
                    </tr>

                    <c:forEach items="${sessionScope.user.eiAttendances.eiTrainings}" var="training">
                        <tr>
                            <td>${training.trTitle}</td>
                            <td>${training.trTime}</td>
                            <td>${training.trAddress}</td>
                            <td>${training.trDescription}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>


        </div>

    </div>
</div>
</body>
</html>
