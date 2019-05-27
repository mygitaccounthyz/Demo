package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.model.*;
import com.example.ssm_springbootx.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Resource
    private VisitorService visitorService;
    @Resource
    private EmployeeService employeeService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private RecruitmentService recruitmentService;
    @Resource
    private TrainingService trainingService;

//    登录
    @RequestMapping("login.do")
    public String login(Visitor visitor0,Employee employee0,
                        String character ,HttpSession session){

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
               if (employee.getEeName().equals("admin"))return "forward:admin.do";
               else return "forward:employee.do";
            }
        }
         return "login";
    }

//获取部门信息-到用户页
    @RequestMapping("employee.do")
    public String getColleague(HttpSession session){
        List<Department> departments = departmentService.getDepartments(new Department());
        session.setAttribute("departments",departments);
        return "employee";
    }

    //获取信息-到用户页
    @RequestMapping("admin.do")
    public String  getAll(HttpSession session){
        List<Department> departments = departmentService.getDepartments(new Department());
        session.setAttribute("departments",departments);
        List<Recruitment> recruitments = recruitmentService.getRecruitments(new Recruitment());
        session.setAttribute("recruitments",recruitments);
        List<Training> trainings = trainingService.getTrainings(new Training());
        session.setAttribute("trainings",trainings);
        return "admin";
    }

//    跳转到对应用户界面
    @RequestMapping("user.do")
    public String user(HttpSession session){

        User user = (User) session.getAttribute("user");

        if (user instanceof Visitor) return "visitor";

        if (user instanceof Employee)
        {
            if (((Employee) user).getEeName().equals("admin"))return "admin";
            else return "employee";
        }

        return "index";
    }

//游客注册
    @RequestMapping("register.do")
    public String register(Visitor visitor){
        if (visitorService.addVisitor(visitor))
        {
            return "login";
        }
        return "register";
    }

//退出登录
    @RequestMapping("quit.do")
    public String quit(HttpSession session){
        session.removeAttribute("user");
        return "index";
    }

}
