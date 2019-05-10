package com.midpac.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// target - jsp

@Controller
public class Transfer {

    @RequestMapping("/transfer")
    public String transfer(String target)//jsp to jsp
            throws Exception{
        if (target==null)return "index";
        return target;
    }

    @RequestMapping("/forward")
    public String forwardpm(String target)//parameter.forward(jsp to jsp)
            throws Exception{
        return "forward:WEB-INF/page/"+target+".jsp";
    }

//    @RequestMapping({"/forwardrq"})//servlet to jsp?
//    public String forwardatt(HttpServletRequest request)
//            throws Exception{
//
//        String page = (String) request.getAttribute("page");
//        return "forward:WEB-INF/page/"+page+".jsp";
//    }

    @RequestMapping("/")
    public void   index(HttpServletRequest request,HttpServletResponse response)
            throws Exception{
        request.getRequestDispatcher("/showGoods").forward(request,response);
    }

//    @RequestMapping("/redirect")//404?
//    public String  redirect(HttpServletRequest request, HttpServletResponse response)
//            throws Exception{
//
//        String page = (String) request.getAttribute("page");
//        return "redirect:WEB-INF/page/"+page+".jsp";
//    }

}
