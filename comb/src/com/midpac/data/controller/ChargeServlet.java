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
public class ChargeServlet {
    @Resource
    private UserService userService;

    @RequestMapping("/charge")
    public String  charge(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user= (User) request.getSession().getAttribute("user");
        String charge = request.getParameter("charge");

        int money = 0;
        if (charge!=null)money=Integer.parseInt(charge);
        user.setMoney(user.getMoney()+money);
        userService.updateUser(user);
        return "user/user";
    }


}
