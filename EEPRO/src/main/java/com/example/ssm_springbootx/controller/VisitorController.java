package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.model.Visitor;
import com.example.ssm_springbootx.service.VisitorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class VisitorController {

    @Resource
    private VisitorService visitorService;

    @RequestMapping("login.do")
    public String login(Visitor visitor0, HttpServletRequest request){

        System.out.println(visitor0);
        Visitor visitor = visitorService.getVisitor(visitor0);
        if (visitor!=null)
        {
            request.getSession().setAttribute("user",visitor);
            return "visitor";
        }else return "login";

    }
}
