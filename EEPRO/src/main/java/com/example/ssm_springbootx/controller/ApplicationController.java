package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.dao.EEIdDao;
import com.example.ssm_springbootx.model.*;
import com.example.ssm_springbootx.service.ApplicationService;

import com.example.ssm_springbootx.service.EmployeeService;
import com.example.ssm_springbootx.service.VisitorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
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


    @RequestMapping("application.do")
    public String application(int rcId,int viId){
        Application application = new Application(new Recruitment(rcId),new Visitor(viId));
        if (applicationService.addApplication(application)){
            return "visitor";
        }
        return "recruitment";
    }

    @RequestMapping("goInterview.do")
    public void goInterview(int apId,HttpSession session, HttpServletResponse response)
            throws IOException {
        Visitor visitor = (Visitor) session.getAttribute("user");
        List<Application> viApplications = visitor.getViApplications();
        Application application = null;
        for (Application viApplication : viApplications) {
            if (viApplication.getApId()==apId)
            {
                application=viApplication;
                break;
            }
        }
        if (application==null)return;
        application.setApState("接受面试");
        if (applicationService.updateApplication(application)){
            response.getWriter().write("1");
        }else response.getWriter().write("0");
    }

    @RequestMapping("goWork.do")
    public void goWork(int apId,HttpSession session, HttpServletResponse response) throws IOException {
        Visitor visitor = (Visitor) session.getAttribute("user");
        List<Application> viApplications = visitor.getViApplications();
        Application application = null;
        for (Application viApplication : viApplications) {
            if (viApplication.getApId()==apId)
            {
                application=viApplication;
                break;
            }
        }
        if (application==null)return;
        application.setApState("接受工作");
        if (applicationService.updateApplication(application)){
            int eeId = eeIdDao.getEEId();
            Employee employee =new Employee("employee"+eeId,"employee"+eeId,
                    visitor.getViResume().getRsBasic(),application.getApRcId().getRcJId(), visitor.getViId());
            if (employeeService.addEmployee(employee)){
                Visitor newVisitor = visitorService.getVisitor(visitor);
                session.setAttribute("user",newVisitor);
                response.getWriter().write("1");
                return;
            }
//            basic-new user
        } response.getWriter().write("0");
    }

    @RequestMapping("endApp.do")
    public void endApp(int apId,HttpSession session, HttpServletResponse response) throws IOException {
        Visitor visitor = (Visitor) session.getAttribute("user");
        List<Application> viApplications = visitor.getViApplications();
        Application application = null;
        for (Application viApplication : viApplications) {
            if (viApplication.getApId()==apId)
            {
                application=viApplication;
                break;
            }
        }
        if (application==null)return;
        application.setApState("拒绝");
        if (applicationService.updateApplication(application)){
            response.getWriter().write("1");
        }else response.getWriter().write("0");
    }


}
