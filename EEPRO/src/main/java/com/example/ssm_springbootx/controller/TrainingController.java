package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.service.TrainingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class TrainingController {

    @Resource
    private TrainingService trainingService;

    @RequestMapping("")
    public void training(){

    }
}
