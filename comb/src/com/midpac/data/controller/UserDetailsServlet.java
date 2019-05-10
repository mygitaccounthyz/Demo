package com.midpac.data.controller;

import com.midpac.data.service.UserDetailService;
import com.midpac.data.service.UserService;
import com.midpac.model.User;
import com.midpac.model.Userdetail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class UserDetailsServlet{
    @Resource
    private UserService userService;
    @Resource
    private UserDetailService userDetailService;

    @RequestMapping("/userDetail")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {//session 更新 user
        String method =request.getParameter("method");

        if ("update".equals(method))
        {
            update(request,response);
            return;

        }
        if ("delete".equals(method))
        {
            delete(request,response);
            return;

        }
        if ("add".equals(method))
        {
            request.getRequestDispatcher("userDetail.add").forward(request,response);
            return;
        }


    }

    @RequestMapping("userDetail.add")
    private String  add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        User user = (User) request.getSession().getAttribute("user");
        String phone =request.getParameter("phone");
        String receiver =request.getParameter("receiver");
        String address =request.getParameter("address");

        Userdetail userdetail=new Userdetail(receiver,phone,address,user);
        userDetailService.addUserDetail(userdetail);
        user= userService.getUser(user);
        request.getSession().setAttribute("user",user);
        return "user/userdetails";
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        User user = (User) request.getSession().getAttribute("user");
        String phone =request.getParameter("phone");
        String receiver =request.getParameter("receiver");
        String address =request.getParameter("address");
        String did0 =request.getParameter("did");
        int did=0;
        if (did0==null){
            response.getWriter().write("0");
            return;
        }else did=Integer.parseInt(did0);
        Userdetail userdetail=new Userdetail(did,receiver,phone,address,user);

        if (userDetailService.updateUserDetail(userdetail))
        {
            user= userService.getUser(user);
            request.getSession().setAttribute("user",user);
            response.getWriter().write("1");
        }else response.getWriter().write("0");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String did0 = request.getParameter("did");
        int did=0;
        if (did0!=null)did=Integer.parseInt(did0);
        else {
            response.getWriter().write("0");
            return;
        }
        Userdetail userdetail =new Userdetail(did);

        if (userDetailService.deleteUserDetail(userdetail))
        {
            User user = (User) request.getSession().getAttribute("user");

            user= userService.getUser(user);
            request.getSession().setAttribute("user",user);
            response.getWriter().write("1");
        }else response.getWriter().write("0");
    }

}
