package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.model.Department;
import com.example.ssm_springbootx.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DepartmentController {

    @Resource
    private DepartmentService departmentService;




}
