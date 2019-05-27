package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.model.Recruitment;
import com.example.ssm_springbootx.service.RecruitmentService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class RecruitmentController {

    @Resource
    private RecruitmentService recruitmentService;

    @RequestMapping("recruitment.do")
    public String showRecruitment(int rcId, HttpServletRequest request){
        Recruitment recruitment = recruitmentService.getRecruitment(rcId);
        request.setAttribute("recruitment",recruitment);
        return "/WEB-INF/bin/recruitment.jsp";
    }


    @RequestMapping("/")
    public String toIndex(HttpSession session){
        Recruitment recruitment = new Recruitment();
        recruitment.setRcState("已发布");
        List<Recruitment> recruitments = recruitmentService.getRecruitments(recruitment);
        session.setAttribute("recruitments",recruitments);
        return "/WEB-INF/bin/index.jsp";
    }

}
