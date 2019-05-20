package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.model.Basic;
import com.example.ssm_springbootx.model.Resume;
import com.example.ssm_springbootx.service.BasicService;
import com.example.ssm_springbootx.service.ResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping("resume.do")
    public String resume(Resume resume){
        if (resumeService.addResume(resume))return "visitor";

        return "editResume";
    }
}
