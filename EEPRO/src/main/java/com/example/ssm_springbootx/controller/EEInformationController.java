package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.service.EEInformationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class EEInformationController {

    @Resource
    private EEInformationService eeInformationService;

    @RequestMapping("")
    public void eeInformation(){

    }
}
