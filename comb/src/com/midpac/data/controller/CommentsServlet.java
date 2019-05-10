package com.midpac.data.controller;


import com.midpac.data.service.CommentService;
import com.midpac.data.service.GoodService;
import com.midpac.model.Comment;
import com.midpac.model.Good;
import com.midpac.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class CommentsServlet{
    @Resource
    private CommentService commentService;
    @Resource
    private GoodService goodService;

    @RequestMapping("/comments")
    protected String  doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String method = request.getParameter("method");

        if ("comment".equals(method)){
            return comment(request,response);
            
        }
        if ("add".equals(method)) {
            return add(request,response);
            
        }
        if ("show".equals(method)) {
            return show(request,response);
            
        }
        return "index";
    }

    private String show(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String gid0 = request.getParameter("gid");
        int gid = 0;
        if (gid0!=null)gid= Integer.parseInt(gid0);
        List commentsByGid = commentService.getCommentsByGid(gid);
        Good good = goodService.getGood(new Good(gid));
        request.setAttribute("good",good);
        request.setAttribute("comments",commentsByGid);

        return "user/comment";
    }

    private String add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        User user = (User) request.getSession().getAttribute("user");
        String gid0 =request.getParameter("gid");
        int gid = 0;
        if (gid0!=null)gid = Integer.parseInt(gid0);
        Good good = goodService.getGood(new Good(gid));
        String content =request.getParameter("content");
        Comment comment =new Comment(user,good,content);
        commentService.addComment(comment);

        return "user/comment";

    }

    private String comment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String gid0 = request.getParameter("gid");
        int gid = 0;
        if (gid0!=null)gid= Integer.parseInt(gid0);
        List commentsByGid = commentService.getCommentsByGid(gid);
        request.setAttribute("comments",commentsByGid);
        Good good = goodService.getGood(new Good(gid));
        request.setAttribute("good",good);
        request.setAttribute("comment","true");
        
        return "user/comment";

    }


}
