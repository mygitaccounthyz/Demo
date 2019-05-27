package com.example.ssm_springbootx.controller;

import com.example.ssm_springbootx.model.Attendance;
import com.example.ssm_springbootx.model.EEInformation;
import com.example.ssm_springbootx.model.Employee;
import com.example.ssm_springbootx.service.AttendanceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class AttendanceController {

    @Resource
    private AttendanceService attendanceService;

    @RequestMapping("onDuty.do")
    public void onDuty( HttpSession session, HttpServletResponse response)
            throws IOException, ParseException {
        Employee employee = (Employee) session.getAttribute("user");

        List<Attendance> eiAttendances = employee.getEeInformation().getEiAttendances();
        if (eiAttendances==null)
        {
            response.getWriter().write("0");
            return;
        }
        int eiId = employee.getEeInformation().getEiId();
        int rs = attendanceService.addAtOn(eiId);
        if (rs==1){
            response.getWriter().write("1");
        }else{
            response.getWriter().write("0");
        }


//        for (Attendance eiAttendance : eiAttendances) {
//            Timestamp record = eiAttendance.getAtOn();
//            String oD = record.toString().substring(0, 9);
//
//        }


    }


}
