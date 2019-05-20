package com.example.ssm_springbootx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Transfer {

    @RequestMapping("transfer")
    public String transfer(String target){
        if (target!=null)
        return target;

        return "index";
    }
}
