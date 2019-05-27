package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.model.Resume;
import com.example.ssm_springbootx.model.Visitor;
import com.example.ssm_springbootx.service.ResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class ResumeController {

    @Resource
    private ResumeService resumeService;


    @RequestMapping("findResume.do")
    public void findResume(int viId, HttpServletResponse response) throws IOException {

        Resume resume = resumeService.getResume(viId);
        if (resume!=null)response.getWriter().write("1");
        else response.getWriter().write("0");

    }

//    编辑更新简历
    @RequestMapping("resume.do")
    public String resume(Resume resume, HttpSession session){
        Visitor visitor = (Visitor) session.getAttribute("user");
        visitor.setViResume(resume);
        if (resumeService.addOrUpdateResume(resume))return "visitor";
        return "resume";
    }
}
