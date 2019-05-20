package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.dao.DepartmentDao;
import com.example.ssm_springbootx.dao.EmployeeDao;
import com.example.ssm_springbootx.dao.RecruitmentDao;
import com.example.ssm_springbootx.model.*;
import com.example.ssm_springbootx.service.ApplicationService;
import com.example.ssm_springbootx.service.DepartmentService;
import com.example.ssm_springbootx.service.EmployeeService;
import com.example.ssm_springbootx.service.VisitorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Resource
    private VisitorService visitorService;
    @Resource
    private RecruitmentDao recruitmentDao;
    @Resource
    private EmployeeService employeeService;
    @Resource
    private DepartmentService departmentService;

    @RequestMapping("login.do")
    public String login(Visitor visitor0,Employee employee0,
                        String character ,HttpSession session){
//        System.out.println(visitor0);
        if ("visitor".equals(character)){
            Visitor visitor = visitorService.getVisitor(visitor0);
            if (visitor!=null)
            {
                session.setAttribute("user",visitor);
                return "visitor";
            }
        }else if ("employee".equals(character)){
            Employee employee = employeeService.getEmployee(employee0);
            if (employee!=null)
            {
               session.setAttribute("user",employee);
               if (employee.getName().equals("admin"))return "forward:admin.do";
               else return "employee";
            }
        }
         return "login";
    }

    @RequestMapping("admin.do")
    public String adminInit(HttpServletRequest request){
        List<Recruitment> recruitments = recruitmentDao.getRecruitments(new Recruitment());
        List<Department> departments = departmentService.getDepartments(new Department());
        request.setAttribute("recruitments",recruitments);
        request.setAttribute("departments",departments);
        return "admin";
    }

    @RequestMapping("user.do")
    public String user(HttpSession session){

        User user = (User) session.getAttribute("user");

        if (user instanceof Visitor) return "visitor";

        if (user instanceof Employee)
        {
            if (user.getName().equals("admin")&&((Employee) user).getEePass().equals("admin"))return "admin";
            else return "employee";
        }

        return "index";
    }

    @RequestMapping("register.do")
    public String register(Visitor visitor){
        if (visitorService.addVisitor(visitor))
        {
            return "login";
        }
        return "register";
    }

    @RequestMapping("quit.do")
    public String quit(HttpSession session){
        session.removeAttribute("user");
        return "index";
    }

}
