package com.midpac.data.controller;


import com.midpac.data.service.UserService;
import com.midpac.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class RegisterServlet  {
    @Resource
    private UserService userService;

    @RequestMapping("/register")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String method =request.getParameter("method");

        if ("check".equals(method)){
            request.getRequestDispatcher("/register.check").forward(request,response);
            return;
        }
        if ("register".equals(method))
        {
            request.getRequestDispatcher("/register.register").forward(request,response);
            return;
        }

    }


    @RequestMapping("/register.check")
    private void check(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String name = request.getParameter("name");
        User user=userService.getUserByName(name);
        if (user==null){
            response.getWriter().write("1");
        }else {
            response.getWriter().write("0");
        }
    }


    @RequestMapping("/register.register")
    private String  register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String type =request.getParameter("type");
        User user;

        if ("1".equals(type))user = new User(name,pass,1);
        else user =new User(name,pass,0);

        if (userService.addUser(user)){
            return "login";
        }else {
            return "register";
        }
    }
    
}
