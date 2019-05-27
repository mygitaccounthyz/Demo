package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.dao.EEIdDao;
import com.example.ssm_springbootx.model.*;
import com.example.ssm_springbootx.service.ApplicationService;

import com.example.ssm_springbootx.service.EEInformationService;
import com.example.ssm_springbootx.service.EmployeeService;
import com.example.ssm_springbootx.service.VisitorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class ApplicationController {

    @Resource
    private ApplicationService applicationService;
    @Resource
    private EEIdDao eeIdDao;
    @Resource
    private EmployeeService employeeService;
    @Resource
    private VisitorService visitorService;
    @Resource
    private EEInformationService eeInformationService;

//投简历
    @RequestMapping("application.do")
    public void application(int rcId,int viId,HttpServletResponse response)
            throws IOException {
        Application application =
                new Application(new Recruitment(rcId),new Visitor(viId));
        if (applicationService.addApplication(application)){
            response.getWriter().write("1");
        }
        response.getWriter().write("0");
    }


    @RequestMapping("interview.do")
    public void interview(){

    }

//    接受面试
    @RequestMapping("goInterview.do")
    public void goInterview(int apId,HttpSession session, HttpServletResponse response)
            throws IOException {
        Visitor visitor = (Visitor) session.getAttribute("user");
        List<Application> viApplications = visitor.getViApplications();
        Application application = searchApp(apId,viApplications);
        if (application==null)return;
        application.setApState("接受面试");
        if (applicationService.updateApplication(application)){
            response.getWriter().write("1");
        }else response.getWriter().write("0");
    }

    @RequestMapping("hire.do")
    public void hire(int apId, HttpServletResponse response) throws IOException {
        Application application = applicationService.getApplication(new Application(apId));
        application.setApState("录用");
        if (applicationService.updateApplication(application)){
            response.getWriter().write("1");
        }
        response.getWriter().write("0");
    }

//    接受工作
    @RequestMapping("goWork.do")
    public void goWork(int apId,HttpSession session, HttpServletResponse response)
            throws IOException {

        Visitor visitor = (Visitor) session.getAttribute("user");
        List<Application> viApplications = visitor.getViApplications();
        Application application = searchApp(apId,viApplications);
        if (application==null)return;

        application.setApState("接受工作");
        if (applicationService.updateApplication(application)){
//            数据库序列生成新员工用户名序号
            int eeId = eeIdDao.getEEId();
            Employee employee =new Employee("employee"+eeId,"employee"+eeId,
                    visitor.getViResume().getRsBasic(),application.getApRcId().getRcJId(), visitor.getViId());

            if (employeeService.addEmployee(employee)){

                EEInformation eeInformation = new EEInformation();
                eeInformation.setEiEeId(employee.getEeId());
                eeInformationService.createOrUpdate(eeInformation);
                visitor.setViEmployee(employee);

                response.getWriter().write("1");
                return;
            }
        } response.getWriter().write("0");
    }

//    终结申请
    @RequestMapping("endApp.do")
    public void endApp(int apId,HttpSession session, HttpServletResponse response)
            throws IOException {
        Visitor visitor = (Visitor) session.getAttribute("user");
        List<Application> viApplications = visitor.getViApplications();
        Application application = searchApp(apId,viApplications);
        if (application==null)return;

        application.setApState("拒绝");
        if (applicationService.updateApplication(application)){
            response.getWriter().write("1");
        }else response.getWriter().write("0");
    }

    @RequestMapping("showApplication.do")
    public String showApplication(int apId, HttpServletRequest request){
        Application app = applicationService.getApplication(new Application(apId));
        if (app.getApState().equals("未读")){
            app.setApState("已读");
            applicationService.updateApplication(app);
        }
        request.setAttribute("app",app);
        return "/WEB-INF/bin/showApplication.jsp";
    }

//    被拒绝后删除
    @RequestMapping("delApp.do")
    public void delApp(int apId,HttpServletResponse response,HttpSession session) throws IOException {
        Visitor visitor = (Visitor) session.getAttribute("user");
        List<Application> viApplications = visitor.getViApplications();
        Application application = searchApp(apId, viApplications);
        if (applicationService.deleteApplication(application)){

            response.getWriter().write("1");
        }else {
            response.getWriter().write("0");
        }


    }

//    重复代码
    private Application searchApp(int apId,List<Application> applications){
        if (applications==null||apId==0)return null;
        Application application=null;
        for (Application viApplication : applications) {
            if (viApplication.getApId()==apId)
            {
                application=viApplication;
                break;
            }
        }
        return application;
    }
}
