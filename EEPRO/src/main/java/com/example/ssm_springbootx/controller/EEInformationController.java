package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.model.Basic;
import com.example.ssm_springbootx.model.EEInformation;
import com.example.ssm_springbootx.model.Employee;
import com.example.ssm_springbootx.service.BasicService;
import com.example.ssm_springbootx.service.EEInformationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class EEInformationController {

    @Resource
    private EEInformationService eeInformationService;
    @Resource
    private BasicService basicService;


    @RequestMapping("editBasic.do")
    public String editBasic(Employee employee0, HttpSession session){
//        原数据
        Employee employee = (Employee) session.getAttribute("user");
        EEInformation eeInformation = employee.getEeInformation();
        if (eeInformation==null)eeInformation =new EEInformation();
//        新数据
        EEInformation eeInformation0 = employee0.getEeInformation();
        eeInformation0.setEiId(eeInformation.getEiId());
//        更新数据库
        if (eeInformationService.createOrUpdate(eeInformation0)){
            Basic basic = employee0.getEeBsId();
            if (basicService.updateBasic(basic)){
                eeInformation.setEiIDCard(eeInformation0.getEiIDCard());
                eeInformation.setEiAccount(eeInformation0.getEiAccount());
                employee.setEeInformation(eeInformation);
                employee.setEeBsId(basic);
                return "employee";
            }
        }
        return "editBasic";

    }
//    @RequestMapping("")
//    public void eeInformation(){
//
//    }
}
