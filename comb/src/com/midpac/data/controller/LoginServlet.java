package com.midpac.data.controller;

import com.midpac.data.service.UserService;
import com.midpac.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class LoginServlet {

    @Resource
    private UserService userService;

    @RequestMapping("/login.do")
    public String login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name =request.getParameter("name");
        String pass =request.getParameter("pass");
        User checkUser =new User(name,pass,0);

        User user = userService.getUserByNameAndPass(checkUser);
        if (user==null){
            return "login";
        }else {
            request.getSession().setAttribute("user",user);
            if (user.getGrade()==1){
                return "showGoods";
            }
            else {
                return "index";
            }
        }
    }

}
