<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HYZ
  Date: 2019/5/23
  Time: 13:22
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
    <title>admin</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>
<%--员工选择框id=eeId+number--%>
<%--职位选择区域id=jId+number--%>
<%--部门选择区域id=dpId+number--%>

<%--部门下拉单name=dpDropList--%>
<%--职位下拉单name=jobDropList--%>

<%--下拉菜单的值--%>
        var dpId=null;
        var jId=null;
        var employeeId=null;
<%--下拉菜单的值--%>
//编辑区
var $editDepartment=null;
var $editJob =null;
//正在查看
var $eeInformation=null;

        function editNewDepartment() {
            //清空
            $editDepartment.replaceWith($editDepartment.data("origin"));
            $editDepartment.show();

        }

        function editNewJob() {
            //清空
            $editJob.replaceWith($editJob.data("origin"));
            $editJob.show();
        }

        function editDepartment() {
            if (dpId==null) {
                alert("先选择一个部门");
            }else{

            var $old = $(".department[value="+dpId+"]");
            var dpName = $old.parent().text();
            var dpFunction = $old.data("dpFunction");

            //回显
            $editDepartment.find(":input[name=dpName]").val(dpName);
            $editDepartment.find(":input[name=dpFunction]").val(dpFunction);
            $editDepartment.find(":input[name=dpId]").val(dpId);
            $editDepartment.show();
            }
        }

        function editJob() {
            if (jId==null) {
                alert("先选择一个职位");
            }else{

                var $old = $(".job[value="+jId+"]");
                var jName = $old.parent().text();
                var jDescription = $old.data("jDescription");

                //回显
                $editJob.find(":input[name=jName]").val(jName);
                $editJob.find(":input[name=jDescription]").val(jDescription);
                $editJob.find(":input[name=jId]").val(jId);
                $editJob.show();
            }

        }

        function createOrUpdateDepartment(){
        //    id+function+name
            var dpName = $editDepartment.find(":input[name=dpName]").val();
            var dpFunction = $editDepartment.find(":input[name=dpFunction]").val();
            var upId = $editDepartment.find(":input[name=dpId]").val();

            if (dpName == null || dpFunction == null) {
                alert("填写完整的信息后提交");
            }else {
                $.post("createOrUpdateDepartment.do",{"dpId":upId,"dpName":dpName,"dpFunction":dpFunction},
                    function (newId) {
                    var $checkbox = $("#checkbox");
                    var $dpDropList = $("select[name=dpDropList]");
                        //    下拉菜单+checkbox
                        if (newId == "0") {
                        //    replace
                        var $newDp = $("#dpId"+upId).find(".department");
                        $newDp.data("dpFunction",dpFunction);
                        $newDp.parent().text(dpName);

                        $dpDropList.find("option[value="+upId+"]").text(dpName);

                        } else if (newId=="-1") {
                            alert("失败")
                        }else {
                            //append
                            //checkbox
                            $checkbox.append("<div hidden class=\"dpfloor\" id=\"dpId"+newId+"\">\n" +
                                "    <label>"+dpName+"<input data-dpFunction=\""+dpFunction+"\" class=\"department\"\n" +
                                "    type=\"checkbox\" name=\"dpId\" value=\""+upId+"\"></label>");
                            //    下拉菜单
                            $dpDropList.append("<option value=\""+newId+"\">"+dpName+"</option>");
                        }
                })
            }
            cancelDepartment();
        }

        function createOrUpdateJob() {
            //    id+function+name
            var jName = $editDepartment.find(":input[name=jName]").val();
            var jDescription = $editDepartment.find(":input[name=jDescription]").val();
            var upId = $editDepartment.find(":input[name=jId]").val();

            if (jName == null || jDescription == null) {
                alert("填写完整的信息后提交");
            }else {
                $.post("createOrUpdateJob.do",{"jId":upId,"jName":jName,"jDescription":jDescription,"jDpId":dpId},
                    function (newId) {
                        //动态下拉bubian
                    //    checkbox
                    if (newId=="0") {
                    //    replace
                    var newJob = $("#jId"+upId).find(".job");
                    newJob.data("jDescription",jDescription);
                    newJob.parent().text(jName);

                    }else if (newId=="-1") {
                        alert("失败");
                    }else {
                        //append
                        $("#dpId" + dpId).append("<div class=\"jfloor\" id=\"jId"+newId+"\" hidden>\n"+
                            "<label>"+jName+"<input data-jDescription=\""+jDescription+"\"\n"+
                            "class=\"job\" type=\"checkbox\" name=\"jId\" value=\""+newId+"\"></label>");
                    }
                })
            }
            cancelJob();
        }

        function cancelDepartment(){
            $editDepartment.replaceWith($editDepartment.data("origin"));
            $editDepartment.hide();
        }

        function cancelJob() {
            $editJob.replaceWith($editJob.data("origin"));
            $editJob.hide();
        }

        function delDepartment(){

            var $dpList = $(":input[name=dpDropList]");
             dpId = $dpList.val();
            if (dpId==null) {
                alert("选择一个部门");
            }else {
                $.post("delDepartment.do",{"dpId":dpId},
                function (rs) {
                //    下拉菜单+checkbox
                    if (rs=="1")
                    {
                        $dpList.find("option[value="+dpId+"]").remove();
                        $("#dpId"+dpId).remove();
                    } else {
                        alert("失败");
                    }
                })
            }
        }

        function delJob(){

            var $jobDropList = $(":input[name=jobDropList]");
            jId = $jobDropList.val();
            if (jId==null) {
                alert("选择一个职位");
            }else {
                $.post("delJob.do",{"jId":jId},
                    function (rs) {
                        //    下拉菜单+checkbox
                        if (rs=="1")
                        {
                            $jobDropList.find("option[value="+jId+"]").remove();
                            $("#jId"+jId).remove();
                        } else {
                            alert("失败");
                        }
                    })
            }

        }

        function seeResume(button){
            var $button = $(button);
            $button.parents(".application").find(".resume").show();
        }

        function conceal(button){
            var $button = $(button);
            $button.parents(".application").find(".resume").hide();
        }

        function interview(button){
            var $button = $(button);
            var $interviewButton = $button.parents(".interviewButton");
            var apTime = $interviewButton.find(":input[name=apTime]");
            var $application = $button.parents(".application");
            var $apState = $application.find(".apState");
            var apId = $application.data("apId");
            $.post("interview.do",{"apId":apId,"apTime":apTime},function (rs) {
                if (rs == "1") {
                    $apState.text("面试");
                    interviewButton($application);
                }else {
                    alert("失败");
                }
            })

        }

        function endApp(button){
            var $button = $(button);

            var $application = $button.parents(".application");
            var $apState = $application.find(".apState");
            var apId = $application.data("apId");

            $.post("endApp.do",{"apId":apId},function (rs) {
                if (rs == "1") {
                    $apState.text("拒绝");
                    interviewButton($application);
                }else {
                    alert("失败");
                }
            })
        }

        function hire(button) {
            var $button = $(button);

            var $application = $button.parents(".application");
            var $apState = $application.find(".apState");
            var apId = $application.data("apId");

            $.post("hire.do",{"apId":apId},function (rs) {
                if (rs == "1") {
                    $apState.text("录用");
                    interviewButton($application);
                }else {
                    alert("失败");
                }
            })
        }

        //根据apState加按钮
        function interviewButton($application){
            var $apState = $application.find(".apState");
            var apState = $apState.text();
            var target = $application.find(".interviewButton");
            target.empty();
            if (apState=='已读'||apState=='未读') {
                target.append("<label>面试时间<input type=\"datetime-local\" name=\"apTime\"></label>\n" +
                    "    <button onclick=\"interview(this)\">面试</button>\n" +
                    "    <button onclick=\"endApp(this)\">拒绝</button>");
            }else if (apState=='面试') {
                target.append("<button onclick=\"endApp(this)\">取消</button>");
            }else if (apState=='接受面试') {
                target.append("<button onclick=\"hire(this)\">录用</button>");
            }
        }


        //recruitment

        function delRecruitment(button) {
            var $button = $(button);
            var $recruitment = $button.parents(".recruitment");
            var rcId = $recruitment.find(":input[name=rcId]").val();
            $.post("delRecruitment.do",{"rcId":rcId},function (rs) {
                if (rs == "1") {
                    $recruitment.remove();
                }else{
                    alert("失败");
                }
            })

        }

        function updateRecruitment(button) {
            var $button = $(button);
            var $recruitment = $button.parents(".recruitment");
            var $rcId = $recruitment.find(":input[name=rcId]");
            var rcId = $rcId.val();
            var $rcDescription = $recruitment.find("textarea[name=rcDescription]");
            var rcDescription = $rcDescription.val();
            var $editRecruitment = $("#editRecruitment");
            $editRecruitment.data("origin",$editRecruitment);
            $editRecruitment.show();
            $editRecruitment.find("input[name=rcId]").val(rcId);
            $editRecruitment.find("textarea[name=rcDescription]").val(rcDescription);

}

        function withdrawRecruitment(button) {
            var $button = $(button);
            var $recruitment = $button.parents(".recruitment");
            var rcId = $recruitment.find(":input[name=rcId]").val();
            var rcState = $recruitment.find(":input[name=rcState]").val();
            $.post("withdrawRecruitment.do",{"rcId":rcId},function (rs) {
                if (rs == "1") {
                    rcState.val("未发布");
                }else{
                    alert("失败");
                }
            })
        }

        function newRecruitment() {
            if (jId==null){
                alert("先选择一个职位");
                return;
            }
            var $editRecruitment = $("#editRecruitment");
            //保存原始状态
            $editRecruitment.data("origin",$editRecruitment);
            $editRecruitment.find("input[name=jId]").val(jId);
            $editRecruitment.show();
        }

        function saveRecruitment(){
            var $editRecruitment = $("#editRecruitment");
            var rcDescription = $editRecruitment.find("textarea[name=rcDescription]").val();
            if (rcDescription == null) {
                alert("职位要求不能为空");
                return;
            }
            var rcId = $editRecruitment.find("input[name=rcId]");
            var upJId = $editRecruitment.find("input[name=jId]");
            if (rcId==null&&upJId!=null) {
                $.post("saveNewRecruitment.do",{"jId":upJId,"rcDescription":rcDescription},function (rs) {
                    if (rs == "1") {
                        restoreRecruitment();
                    }else {alert("失败")}
                })
            }else if (rcId!=null&&upJId==null) {
                $.post("saveRecruitment.do",{"rcId":rcId,"rcDescription":rcDescription},function (rs) {
                    if (rs == "1") {
                        restoreRecruitment();
                    }else {alert("失败")}
                })

            }
        }

        function publishRecruitment(){
            var $editRecruitment = $("#editRecruitment");
            var rcDescription = $editRecruitment.find("textarea[name=rcDescription]").val();
            if (rcDescription == null) {
                alert("职位要求不能为空");
                return;
            }
            var rcId = $editRecruitment.find("input[name=rcId]");
            var upJId = $editRecruitment.find("input[name=jId]");
            if (rcId==null&&upJId!=null) {
                $.post("publishNewRecruitment.do",{"jId":upJId,"rcDescription":rcDescription},function (rs) {
                    if (rs == "1") {
                        restoreRecruitment();
                    }else {alert("失败")}
                })
            }else if (rcId!=null&&upJId==null) {
                $.post("publishRecruitment.do",{"rcId":rcId,"rcDescription":rcDescription},function (rs) {
                    if (rs == "1") {
                        restoreRecruitment();
                    }else {alert("失败")}
                })

            }
        }

        function restoreRecruitment(){
            var $editRecruitment = $("#newRecruitment");
            $editRecruitment.replaceWith($editRecruitment.data("origin"));
        }
        //rectuitment


        //training

        function trainingDetail(button) {
            var $button = $(button);
            var $training = $button.parents(".training");
            var $trainingDetail = $training.find(".trainingDetail");
            $trainingDetail.show();
        }

        function hideTraining(button) {
            var $button = $(button);
            var $trainingDetail = $button.parents(".trainingDetail");
            $trainingDetail.hide();
        }

        function delTraining(button) {
            var $button = $(button);
            var $training = $button.parents(".training");
            var trId = $training.data("trId");
            $.post("delTraining.do",{"trId":trId},function (rs) {
                if (rs == "1") {
                    $training.remove();
                }
            })

        }

        function createTraining(){
            var $editTraining = $("#editTraining");
            $editTraining.data("origin",$editTraining);
            $editTraining.show();

        }

        function updateTraining(button) {
            var $button = $(button);
            var $editTraining = $("#editTraining");
            $editTraining.data("origin",$editTraining);
            $editTraining.show();

            var $training = $button.parents(".training");
            var trId = $training.data("trId");
            var $trTitle = $training.find("input[name=trTitle]");
            var trTitle = $trTitle.val();
            var $trTime = $training.find("input[name=trTime]");
            var trTime = $trTime.val();
            var $trAddress = $training.find("input[name=trAddress]");
            var trAddress = $trAddress.val();
            var $trDescription = $training.find("textarea[name=trDescription]");
            var trDescription = $trDescription.val();
            var $employees = $training.find(":checkbox");
            var $checkbox = $("#checkbox");
            var select = $checkbox.find(".employee");

            $editTraining.find("input[name=trId]").val(trId);
            $editTraining.find("input[name=trTitle]").val(trTitle);
            $editTraining.find("input[name=trTime]").val(trTime);
            $editTraining.find("input[name=trAddress]").val(trAddress);
            $editTraining.find("textarea[name=trDescription]").val(trDescription);

            for (var i = 0; i < select.length; i++) {
                $(select[i]).prop("checked",false);
                for (var j = 0; j < $employees.length; j++) {
                    if (select[i].value===$employees[j].value) {
                        $(select[i]).prop("checked",true);
                        break;
                    }
                }
            }

        }

        function createOrUpdateTraining(){

            var $employees = $("#checkbox").find(".employee:checked");
            if ($employees.length === 0) {
                alert("请选择员工");
                return;
            }
            var $editTraining = $("#editTraining");
            var trId = $editTraining.find("input[name=trId]").val();
            var trTitle = $editTraining.find("input[name=trTitle]").val();
            var trTime = $editTraining.find("input[name=trTime]").val();
            var trAddress = $editTraining.find("input[name=trAddress]").val();
            var trDescription = $editTraining.find("textarea[name=trDescription]").val();
            if (trId==null||trTitle==null||trTime==null||trAddress==null||trDescription==null) {
                alert("请将信息填写完整")
            }
            var eeIds = [];
            $employees.each(function (i) {
                eeIds[i] = $(this).val();
            });

            $.ajax({
                type:"post",
                url:"createOrUpdateTraining.do",
                traditional:true,
                data:{"trId":trId,"trTitle":trTitle,"trTime":trTime,"trAddress":trAddress,"trDescription":trDescription},
                success:function (rs) {
                    if (rs=="1"){
                        var $training = $(".training[data-trId="+trId+"]");
                        var $participant = $training.find(".participant");
                        $participant.data("new",$employees.parents("label"));
                        $participant.append($participant.data("new"));
                        cancelTraining();
                    } else {
                        alert("失败");
                    }

                }
            });



        }

        function cancelTraining(){
            var $editTraining = $("#editTraining");
            $editTraining.replaceWith($editTraining.data("origin"));

        }

        function showEEInformation(){
            // var $eiSelect = $("#eiSelector");
            // var $target = $eiSelect.find("input[name=eeId]");
            // $target.val(employeeId);
            var $eeDropList = $("select[name=eeDropList]");
            if($eeDropList.val()==null){
                alert("选择员工");
            }else {
                employeeId = $eeDropList.val();
                hideDeals();
                hideSalarys();
                hideAttendances();
                $(".eeInformation").hide();
                $eeInformation =$(".eeInformation[data-eeId="+employeeId+"]");
                $eeInformation.show();
            }

        }

        function showDeal(){
            var $dateSelector = $("#dateSelector");
            var yyyy = $dateSelector.find("select[name=yyyy]").val();
            var MM = $dateSelector.find("select[name=MM]").val();

            $eeInformation.find(".deals").show();
            var $dlDates = $eeInformation.find(".dlDate");

            $eeInformation.find(".deal").hide();
            for(var i =0; i< $dlDates.length; i++)
            {
                var date = $($dlDates[i]).text();
                if(yyyy==date.substr(0,4)&&MM==date.substr(5,2)){
                    $($dlDates[i]).panrets(".deal").show();
                }
            }

        }

        function hideDeals(){
            $eeInformation.find(".deals").hide();
            $eeInformation.find(".deal").hide();
        }

        function showAttendance(){
            var $dateSelector = $("#dateSelector");
            var yyyy = $dateSelector.find("select[name=yyyy]").val();
            var MM = $dateSelector.find("select[name=MM]").val();

            $eeInformation.find(".attendances").show();
            var $atDates = $eeInformation.find(".atOn");

            $eeInformation.find(".attendance").hide();
            for(var i =0; i< $atDates.length; i++)
            {
                var date = $($atDates[i]).text();
                if(yyyy==date.substr(0,4)&&MM==date.substr(5,2)){
                    $($atDates[i]).panrets(".attendance").show();
                }
            }

        }

        function hideAttendances(){
            $eeInformation.find(".attendances").hide();
            $eeInformation.find(".attendance").hide();
        }

        function showSalary(){
            var $dateSelector = $("#dateSelector");
            var yyyy = $dateSelector.find("select[name=yyyy]").val();
            var MM = $dateSelector.find("select[name=MM]").val();

            $eeInformation.find(".salarys").show();
            var $slDates = $eeInformation.find(".slDate");

            $eeInformation.find(".salary").hide();
            for(var i =0; i< $slDates.length; i++)
            {
                var date = $($slDates[i]).text();
                if(yyyy==date.substr(0,4)&&MM==date.substr(5,2)){
                    $($slDates[i]).panrets(".salary").show();
                }
            }


        }

        function hideSalarys(){
            $eeInformation.find(".salarys").hide();
            $eeInformation.find(".salary").hide();
        }

        function changeJob(){
            if(jId==null||employeeId==null){
                alert("未选择人员或职位")
            }else {
                $.post("changeJob.do",{"jId":jId,"eeId":employeeId},function(rs){
                    if(rs!="1"){
                        alert("失败");
                    }
                })
            }

        }

        function createDeal(){
            var $dlMoney = $eeInformation.find("input[name=dlMoney]");
            var $dlReason = $eeInformation.find("input[name=dlReason]");
            var dlMoney = $dlMoney.val();
            var dlReason = $dlReason.val();

            if(employeeId==null){
                alert("选择员工")
            }else {
                $.post("createDeal.do",{"eeId":employeeId,"dlMoney":dlMoney,"dlReason":dlReason},function(rs){
                    if(rs=="1"){

                        var newDate = new Date();
                        var yr = newDate.getFullYear();
                        var mot = newDate.getMonth();
                        var dt = newDate.getDate();
                        $eeInformation.find(".deals").find("table").append("<tr  class=\"deal\">\n" +
                            "                                                <td  class=\"dlDate\">"+yr+"-"+mot+"-"+dt+"</td>\n" +
                            "                                                <td>"+dlReason+"</td>\n" +
                            "                                                <td>"+dlMoney+"</td>\n" +
                            "                                            </tr>")
                        $dlMoney.val("");
                        $dlReason.val("");
                    }
                })
            }

        }

        function settle(button){
            var $button = $(button);
            if(employeeId==null){
                alert("选择一个员工");
            }else {
                var reset = prompt("输入需要生成的奖惩的金额");
                if(isNaN(reset)) {
                    alert("输入的不是数字");
                }else {
                    var $tr = $button.parents("tr");
                    $.post("settle.do",{"slId":$tr.data("slId"),"dlMoney":reset},function(rs){
                        if(rs=="1"){
                            $tr.find(".slState").text("已处理");
                        }else {
                            alert("失败");
                        }
                    })
                }

            }
        }

        function createSalary(button){
            var $button = $(button);
            if(employeeId==null){
                alert("选择一个员工");
            }else {
                $.post("createSalary.do",{"eeId":employeeId},function(salary){
                    if(salary[slId]==0){
                        alert("不能结算");
                    }else {
                        $button.parents(".salarys").find("table").append("<tr class=\"salary\">\n" +
                            "                        <td class=\"slState\">"+salary[slState]+"</td>\n" +
                            "                        <td class=\"slDate\">"+salary[slDate]+"</td>\n" +
                            "                        <td>3000</td>\n" +
                            "                        <td class=\"slOvertime\">"+salary[slOvertime]+"</td>\n" +
                            "                        <td>"+salary[slDlMoney]+"</td>\n" +
                            "                        <td>-400</td>\n" +
                            "                        <td class=\"slPayment\">"+salary[slPayment]+"</td>\n" +
                            "                        <td class=\"slReset\">"+salary[slReset]+"</td>\n" +
                            "                    </tr>")
                    }
                })
            }
        }


        $(function () {
            <%--编辑部门--%>
            $editDepartment = $("#editDepartment");
            $editJob = $("#editJob");
            //保存空数据
            $editDepartment.data("origin",$editDepartment);
            $editJob.data("origin",$editJob);
            <%--编辑职位--%>

<%--加求职按钮--%>
            var $apps = $(".application");
            for (var i = 0; i < $apps.length; i++) {
                interviewButton($($apps[i]));
            }
<%--加求职按钮--%>
            //filter
            $("select[name=dpDropList]").change(function () {
                var $dpDropList = $(this);
                dpId = $dpDropList.val();
                var $jobDropList =$("select[name=jobDropList]");
                var dpFloor = $("#dpId"+dpId);
                //所有部门消失
                $(".dpfloor").hide();
                //选中部门出现
                dpFloor.show();
                dpFloor.find(".jfloor").show();

                $.post("getJobs.do",{"dpId":dpId},function (jobs) {
                    $jobDropList.empty();
                    $jobDropList.append("<option hidden>请选择</option>");
                    for (var j = 0; j < jobs.length; j++)
                     {
                       var job =$jobDropList.append("<option></option>");
                       job.val(jobs[j]["jId"]);
                       job.text(jobs[j]["jName"]);
                    }
                })
            });

            $("select[name=jobDropList]").change(function () {
                var $jobDropList = $(this);
                jId = $jobDropList.val();
                var jFloor = $("#jId"+jId);

                $(jFloor.parent()).find(".jfloor").hide();
                jFloor.show();

                $.post("getEmployees.do",{"jId":jId},function (employees0) {
                    var $eeDropList =  $("select[name=eeDropList]");

                    $eeDropList.empty();
                    $eeDropList.append("<option hidden>请选择</option>");
                    for (var j in employees0) {
                        var employee0 =$eeDropList.append("<option></option>");
                        employee0.val(employees0[j]["eeId"]);
                        employee0.text(employees0[j]["eeBsId"]["bsName"]);
                    }
                })

            });

            // $("select[name=eeDropList]").change(function () {
            //
            //     hideDeals();
            //     hideSalarys();
            //     hideAttendances();
            //
            // });

            //向下联选
            $(".department").click(function () {

                var $department = $(this);
                var jobs = $department.parents(".dpfloor").find(".job");
                var employees = $department.parents(".dpfloor").find(".employee");
                if ($department.is(':checked')){

                    jobs.prop("checked",true);
                    employees.prop("checked",true);
                }else {
                    jobs.prop("checked",false);
                    employees.prop("checked",false);
                }
            });

            $(".job").click(function () {

                var $job =$(this);
                var department = $job.parents(".dpfloor").find(".department");
                var employees = $job.parents(".jfloor").find(".employee");

                if ($job.is(':checked')){
                    employees.attr("checked",true);
                } else {
                    employees.attr("checked",false);
                    department.prop("checked",false);
                }
            });
            //向上取消
            $(".employee").click(function () {

                var $employee = $(this);
                if ($employee.is(':checked')){
                    var job = $employee.parents(".jfloor").find(".job");
                    var department = $employee.parents(".dpfloor").find(".department");
                    job.prop("checked",false);
                    department.prop("checked",false);
                }
            });
            //切换选择的模块
            $(".nav").click(function () {
                var $nav = $(this);
                var $to = $nav.data("to");
                $(".module").hide();
                $("#"+$to).show();
                var $checkbox = $("#checkbox");
                //重置checkbox
                $checkbox.find(":checkbox").prop("checked",false);
                <%--部门模块不显示checkbox其他的模块显示--%>
                if ($to=="departments") {
                    $checkbox.hide();
                }else {
                    $checkbox.show();
                }
            })

        })


    </script>
</head>

<body>
<div id="wrapper">

    <div id="banner">
        <a href="transfer?target=index">首页  </a>
        <%--<a href="transfer?target=eeInformation">员工信息  </a>--%>
        <a href="quit.do">退出  </a>
    </div>

    <div id="container">

        <div id="navigate" style="text-align: center">
            <button id="toRecruitment" class="nav" data-to="recruitments">招聘</button>
            <button id="toDepartment" class="nav" data-to="departments">部门</button>
            <button id="toTraining" class="nav" data-to="trainings">培训</button>
            <button id="toEEInformation" class="nav" data-to="eeInformations">员工信息</button>
        </div>

        <div id="selector">

            <div id="dropList">

                <label>
                    选择部门：
                    <select class="dropList" name="dpDropList">
                        <option hidden>请选择</option>
                        <c:forEach items="${sessionScope.departments}" var="dp">
                            <option value="${dp.dpId}">${dp.dpName}</option>
                        </c:forEach>
                    </select>
                </label>

                <label>
                    选择职位：
                    <select class="dropList" name="jobDropList">
                        <%--ajax--%>
                    </select>
                </label>

            </div>

            <div id="checkbox">
                <c:forEach items="${sessionScope.departments}" var="department">
                    <div hidden class="dpfloor" id="dpId${department.dpId}">
                    <label>${department.dpName}<input data-dpFunction="${department.dpFunction}" class="department"
                                                   type="checkbox" name="dpId" value="${department.dpId}"></label>

                    <c:forEach items="${department.dpJobs}" var="job">
                        <div class="jfloor" id="jId${job.jId}" hidden>
                            <label>${job.jName}<input data-jDescription="${job.jDescription}"
                                                       class="job" type="checkbox" name="jId" value="${job.jId}"></label>
                            <br>
                            <c:forEach items="${job.jEmployees}" var="employee">
                                <label class="eeName">
                                    ${employee.eeName}<input id="eeId${employee.eeId}" class="employee"
                                                             type="checkbox" name="eeId" value="${employee.eeId}">;
                                </label>
                            </c:forEach>
                        </div>
                    </c:forEach>
                    </div>
                </c:forEach>
            </div>

        </div>

        <div id="module">

            <div class="module" id="departments">

                <div id="editDepartment" hidden>
                    <input type="hidden" name="dpId" value="0">
                    <label>
                        部门名称：<input name="dpName">
                    </label>
                    <br>
                    <label>
                        部门职能：<input name="dpFunction">
                    </label>
                    <br>
                    <button onclick="createOrUpdateDepartment()">确定</button>
                    <button onclick="cancelDepartment()">取消</button>

                </div>

                <div id="editJob" hidden>
                    <input name="jId" type="hidden" value="0">
                    <label>
                        职位名称：<input name="jName">
                    </label>
                    <br>
                    <label>
                        职责：<input name="jDescription">
                    </label>
                    <br>
                    <button onclick="createOrUpdateJob()">确定</button><span>        </span>
                        <button onclick="cancelJob()">取消</button>

                </div>

                <div id="editButton">

                    删除
                    <button onclick="delDepartment()">删除部门</button><span>        </span>
                    <button onclick="delJob()">删除职位</button>
                    <br>
                    修改
                    <button onclick="editDepartment()">修改部门信息</button><span>    </span>
                    <button onclick="editJob()">修改职位信息</button>
                    <br>
                    添加
                    <button onclick="editNewDepartment()">添加部门</button><span>    </span>
                    <button onclick="editNewJob()">添加职位</button>
                    <br>

                </div>

            </div>

            <div hidden class="module" id="recruitments">
                <c:forEach items="${sessionScope.recruitments}" var="recruitment">
                    <div class="recruitment" >
                            <input type="hidden" value="${recruitment.rcId}" name="rcId">
                            <label>
                                发布状态<input disabled name="rcState" value="${recruitment.rcState}">
                            </label>
                            <br>
                            <label>
                                岗位要求
                                <br>
                                <textarea disabled name="rcDescription">${recruitment.rcDescription}</textarea>
                            </label>
                            <label>
                                职位<input disabled name="jName" value="${recruitment.rcJid.jName}">
                            </label>
                            <label>
                                部门<input disabled name="dpName" value="${recruitment.rcJid.jDpId.dpName}">
                            </label>
                            <button onclick="delRecruitment(this)">删除</button>
                            <button onclick="updateRecruitment(this)">修改</button>
                            <button onclick="withdrawRecruitment(this)">撤回</button>
                        <c:forEach items="${recruitment.rcApplications}" var="application">
                            <div class="application" data-apId="${application.apId}">
                                求职状态<span class="apState">${application.apState}</span>
                                更新日期${recruitment.rcDate}
                                职位名称${recruitment.rcJId.jName}
                                部门${recruitment.rcJId.jName}
                                求职人${application.apViId.viResume.rsBasic.bsName}
                                学历${application.apViId.viResume.rsEducation}
                                <button onclick="seeResume(this)">查看简历</button>
                                <div class="resume" hidden id="viId${application.apViId.viId}">
                                    <table border='1' style="border-collapse: collapse">
                                        <tr>
                                            <td colspan='4' align='center'>
                                                个人简历
                                                <input disabled type="hidden" name="rsViId"  value="${application.apViId.viId}">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label>
                                                    姓名：
                                                    <input disabled type='text' maxlength='8'  name='bsName'  style='border: 0'
                                                           value="${application.apViId.viResume.rsBasic.bsName}">
                                                </label>
                                            </td>

                                            <td>
                                                <label>
                                                    性别：
                                                    <input disabled type='text' name='bsGender'
                                                           value='${application.apViId.viResume.rsBasic.bsGender}' >
                                                        ${application.apViId.viResume.rsBasic.bsGender}
                                                </label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label>
                                                    出生日期：
                                                    <input  disabled style='border: 0' type='date' name='bsBirth'
                                                            value="${application.apViId.viResume.rsBasic.bsBirth}">
                                                </label>
                                            </td>
                                            <td>
                                                <label>
                                                    电话：
                                                    <input disabled  style='border: 0' type='text' maxlength='11'  name='bsPhone'
                                                           value="${application.apViId.viResume.rsBasic.bsPhone}">
                                                </label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4">
                                                <label>
                                                    Email：
                                                    <input disabled  style='border: 0; display: inline-block; width: 80%' type='text' name='bsEmail'
                                                           value="${application.apViId.viResume.rsBasic.bsEmail}">
                                                </label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4">
                                                <label>
                                                    联系地址：
                                                    <input disabled  style= 'border: 0; display: inline-block; width: 80%'  type='text' maxlength='50'  name='bsAddress'
                                                           value="${application.apViId.viResume.rsBasic.bsAddress}">
                                                </label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label>
                                                    学历：
                                                    <input disabled  style='border: 0' type='text' name='rsEducation' maxlength='10'
                                                           value="${application.apViId.viResume.rsEducation}">
                                                </label>
                                                <label>
                                                    毕业院校：
                                                    <input disabled  style='border: 0' type='text' name='rsGraduation' maxlength='10'
                                                           value="${application.apViId.viResume.rsGraduation}">
                                                </label>
                                            </td>
                                            <td>
                                                <label>
                                                    专业：
                                                    <input disabled  style='border: 0' type='text' maxlength='6'  name='rsMajor'
                                                           value="${application.apViId.viResume.rsMajor}">
                                                </label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4">
                                                <label>
                                                    掌握技能：<br>
                                                    <textarea disabled name="rsSkills" style="width: 98%;resize: none">
                                                            ${application.apViId.viResume.rsSkills}
                                                    </textarea>
                                                </label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4">
                                                <label>
                                                    荣誉证书：<br>
                                                    <textarea disabled name="rsAward" style="width: 98%;resize: none">
                                                            ${application.apViId.viResume.rsAward}
                                                    </textarea>
                                                </label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan='4'>
                                                <label>
                                                    工作经历：
                                                    <textarea disabled name="rsExperience" maxlength='225' style="width: 98%;height: 120px;resize: none">
                                                            ${application.apViId.viResume.rsExperience}
                                                    </textarea>
                                                </label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan='4'>
                                                <label>
                                                    自我介绍:
                                                    <br>
                                                    <textarea disabled name='rsIntroduction' maxlength='225'
                                                              style="width: 98%;height: 120px;resize: none">
                                                            ${application.apViId.viResume.rsIntroduction}
                                                    </textarea>
                                                </label>
                                            </td>
                                        </tr>
                                    </table>
                                    <button onclick="conceal(this)">隐藏</button>
                                    <div class="interviewButton">

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>
                <button onclick="newRecruitment()">新建招聘</button>
                <div id="editRecruitment" hidden>
                    <input type="hidden" name="rcId" value="">
                    <input type="hidden" name="jId" value="">
                    <label>
                        岗位要求
                        <br>
                        <textarea disabled name="rcDescription"></textarea>
                    </label>

                    <button onclick="saveRecruitment()">保存</button>
                    <button onclick="publishRecruitment()">发布</button>
                    <button onclick="restoreRecruitment()">取消</button>
                </div>
            </div>

            <div hidden class="module" id="trainings">

                <div id="training">

                    <c:forEach items="${sessionScope.trainings}" var="training">
                        <div class="training" data-trId="${training.trId}">
                            <label>培训主题<input disabled name="trTitle" value="${training.trTitle}"></label>
                            <button onclick="trainingDetail(this)">详情</button>
                            <div hidden class="trainingDetail" >
                                <label hidden>培训主题<input disabled name="trTitle" value="${training.trTitle}"></label>
                                <label>培训时间<input disabled name="trTime"  type="datetime-local" value="${training.trTime}"></label>
                                <label>培训地点<input disabled name="trAddress" value="${training.trAddress}"></label>
                                <label>
                                    内容
                                    <br>
                                    <textarea disabled name="trDescription">${training.trDescription}</textarea>
                                </label>
                                <div class="participant">
                                    <c:forEach items="${training.trEmployees}" var="employee">
                                        <label>
                                            员工姓名${employee.eeName}
                                            <input disabled checked type="checkbox" name="eeId" value="${employee.eeId}">
                                        </label>
                                    </c:forEach>
                                </div>
                                <button onclick="updateTraining(this)">修改</button>
                                <button onclick="delTraining(this)">删除</button>
                                <button onclick="hideTraining(this)">隐藏</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <button onclick="createTraining()">新建培训</button>
                <div id="editTraining" hidden>
                    <input type="hidden" name="trId" value="0">
                    <label>培训主题<input name="trTitle"></label>
                    <label>培训时间<input name="trTime"  type="datetime-local"></label>
                    <label>培训地点<input name="trAddress"></label>
                    <label>内容<textarea name="trDescription"></textarea></label>
                    <button onclick="createOrUpdateTraining()">确定</button>
                    <button onclick="cancelTraining()">取消</button>
                </div>

            </div>

            <div hidden class="module" id="eeInformations">

                <div id="dateSelector">

                    <label>
                        年
                        <select name="yyyy">

                        </select>
                    </label>

                    <script>
                        var $yyyy = $("#dateSelector").find("select[name=yyyy]");
                        var newDate = new Date();
                        $yyyy.append("<option value=\""+newDate.getFullYear()+"\">"+newDate.getFullYear()+"</option>");
                        $yyyy.append("<option value=\""+(newDate.getFullYear()-1)+"\">"+(newDate.getFullYear()-1)+"</option>");
                    </script>

                    <label>
                        月
                        <select name="MM">
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
                        </select>
                    </label>

                </div>

                <div id="eiSelector">
                    <label>
                        员工
                        <select name="eeDropList">

                        </select>
                    </label>
                    <input type="hidden" name="eeId" value="0">
                    <button onclick="showEEInformation()">选择员工</button>
                    <br>
                    <button onclick="showDeal()">查看奖惩</button>
                    <button onclick="showAttendance()">查看出勤</button>
                    <button onclick="showSalary()">查看工资</button>
                    <button onclick="changeJob()">换岗</button>
                </div>

                <div id="eeInformation">
                    <c:forEach items="${sessionScope.departments}" var="department">
                        <c:forEach items="${department.dpJobs}" var="job">
                            <c:forEach items="${job.jEmployees}" var="employee">
                                <%--eeId员工ID--%>
                                <div hidden class="eeInformation" data-eeId="${employee.eeId}">

                                    工资卡${employee.eiAccount}
                                    身份证${employee.eiIDCard}

                                    <div class="basic">
                                        姓名${employee.eeBsId.bsName}
                                        出生日期${employee.eeBsId.bsName}
                                        性别${employee.eeBsId.bsName}
                                        电话${employee.eeBsId.bsName}
                                        <br>
                                        联系地址${employee.eeBsId.bsName}
                                        邮箱${employee.eeBsId.bsName}
                                    </div>

                                    <div hidden class="deals">
                                        <table>
                                            <tr >
                                                <th>日期</th>
                                                <th>金额</th>
                                                <th>原因</th>
                                            <c:forEach items="${employee.eeInformation.eiDeals}" var="deal">
                                                </tr>
                                                <tr class="deal" hidden>
                                                    <td class="dlDate">${deal.dlDate}</td>
                                                    <td>${deal.dlMoney}</td>
                                                    <td>${deal.dlReason}</td>
                                                </tr>
                                            </c:forEach>

                                        </table>
                                        <div >
                                            <button onclick="createDeal()">添加一条记录</button>
                                            <label>原因<input name="dlReason"></label>
                                            <label>金额<input type="number" name="dlMoney"></label>
                                        </div>

                                        <button onclick="hideDeals()">隐藏奖惩</button>
                                    </div>

                                    <div hidden class="attendances">

                                        <table>
                                            <tr>
                                                <th>上班时间</th>
                                                <th>下班时间</th>
                                            </tr>

                                            <c:forEach items="${employee.eeInformation.eiAttendances}" var="attendance">
                                                <tr hidden class="attendance">
                                                    <td class="atOn">${attendance.atOn}</td>
                                                    <td class="atOff">${attendance.atOff}</td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        <button onclick="hideAttendances()">隐藏出勤</button>
                                    </div>

                                    <div hidden class="salarys">
                                        <table>
                                            <tr>
                                                <th>结算状态</th>
                                                <th>结算日期</th>
                                                <th>基础</th>
                                                <th>加班工资</th>
                                                <th>奖惩结算</th>
                                                <th>社保</th>
                                                <th>实际发放</th>
                                                <th>复议</th>
                                                <th>结算</th>
                                            </tr>
                                            <c:forEach items="${employee.eeInformation.eiSalaries}" var="salary">
                                                <tr class="salary" data-slId="${salary.slId}">
                                                    <td class="slState">${salary.slState}</td>
                                                    <td class="slDate">${salary.slDate}</td>
                                                    <td>3000</td>
                                                    <td class="slOvertime">${salary.slOvertime}</td>
                                                    <td>${salary.slDlMoney}</td>
                                                    <td>-400</td>
                                                    <td class="slPayment">${salary.slPayment}</td>
                                                    <td class="slReset">${salary.slReset}</td>
                                                    <td><button onclick="settle(this)">结算复议</button></td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        <button onclick="createSalary()">结算工资</button>
                                        <button onclick="hideSalarys()">隐藏工资</button>
                                    </div>


                                </div>
                            </c:forEach>
                        </c:forEach>
                    </c:forEach>
                </div>

            </div>


        </div>

    </div>
</div>
</body>
</html>
