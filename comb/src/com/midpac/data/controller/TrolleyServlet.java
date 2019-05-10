package com.midpac.data.controller;

import com.midpac.data.service.GoodService;
import com.midpac.data.service.TrolleyService;
import com.midpac.data.service.UserService;
import com.midpac.model.Good;
import com.midpac.model.Trolley;
import com.midpac.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Set;


@Controller
public class TrolleyServlet{
    @Resource
    private GoodService goodService;
    @Resource
    private TrolleyService trolleyService;
    @Resource
    private UserService userService;

    @RequestMapping("/trolley")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String method =request.getParameter("method");
        if ("add".equals(method))
        {
            request.getRequestDispatcher("trolley.add").forward(request,response);
            return;
        }
        if ("update".equals(method)) {
            request.getRequestDispatcher("trolley.update").forward(request,response);
            return;
        }
        if ("delete".equals(method)) {
            request.getRequestDispatcher("trolley.delete").forward(request,response);
            return;
        }
    }

    @RequestMapping("/trolley.delete")
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("user");
        String id0 =request.getParameter("id");
        int id =0;
        if (id0==null)
        {
            response.getWriter().write("0");
            return;
        }else id=Integer.parseInt(id0);
        Set<Trolley> trolleys = user.getTrolleys();
        for (Trolley trolley : trolleys) {
            if (trolley.getId() == id) {
                trolleys.remove(trolley);
                trolleyService.deleteTrolley(trolley);

                response.getWriter().write("1");
                return;
            }
        }
        response.getWriter().write("0");

    }


    @RequestMapping("/trolley.update")
    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("user");
        String id0 = request.getParameter("id");
        String gcount0 =request.getParameter("gcount");
        int id = 0;
        int gcount=0;
        if (id0==null||gcount0==null)
        {
            response.getWriter().write("0");
            return;
        }else {
            id=Integer.parseInt(id0);
            gcount=Integer.parseInt(gcount0);
        }

        Set<Trolley> trolleys =  user.getTrolleys();
        for (Trolley trolley : trolleys) {
            if (trolley.getId()==id){
                trolley.setGcount(gcount);
                if (trolleyService.updateTrolley(trolley))
                {
                    session.setAttribute("user",user);
                    response.getWriter().write("1");
                    return;
                }else response.getWriter().write("0");
            }
        }
        response.getWriter().write("0");
    }


    @RequestMapping("/trolley.add")
    private String  add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("user");
        String gid0 =request.getParameter("gid");
        int gid =0;

        if (gid0==null){
            return "index";
        }
        else {
            gid=Integer.parseInt(gid0);
        }

        Good good= goodService.getGood(new Good(gid));
        Set<Trolley> trolleys =  user.getTrolleys();
        for (Trolley trolley : trolleys) {
            if (trolley.getGood().getId()==gid){
                trolley.setGcount(trolley.getGcount()+1);
                trolleyService.updateTrolley(trolley);
                return "user/trolley";
            }
        }
        Trolley trolley=new Trolley(good,1,user);
        trolleyService.addTrolley(trolley);
        user= userService.getUser(user);
        session.setAttribute("user",user);
        return "user/trolley";
    }

}
