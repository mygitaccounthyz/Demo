package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.AttendanceDao;
import com.example.ssm_springbootx.dao.DealDao;
import com.example.ssm_springbootx.model.Deal;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class AttendanceService {

    @Resource
    private AttendanceDao attendanceDao;
    @Resource
    private DealDao dealDao;

    public int addAtOn(int eiId) throws ParseException {
        String nowS = new Timestamp(System.currentTimeMillis()).toString();
        String today = nowS.substring(0,9);
        String onTimeS = today+" 09:00:00";
        String onEdgeS = today+" 11:00:00";
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date now = sdf.parse(nowS);
        Date onTime = sdf.parse(onTimeS);
        Date onEdge = sdf.parse(onEdgeS);

        if (now.before(onTime)){
           return onDuty(now,eiId);
        }else if (now.before(onEdge)){
            return late(now,eiId);
        }else {
            return absence(now,eiId);
        }
    }


    private int absence(Date time, int eiId) {
        Timestamp now = new Timestamp(time.getTime());
        Deal deal =new Deal();
        return 0;
    }

    private int onDuty(Date time, int eiId) {

        return 0;
    }

    private int late(Date time, int eiId) {

        return 0;
    }



}
