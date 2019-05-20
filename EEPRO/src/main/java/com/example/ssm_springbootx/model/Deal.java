package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.util.Date;

public class Deal implements Serializable {

    private int dlId;

    private int dlEiId;
//    private int dlAtId;
    private int dlMoney;
    private String dlReason;
    private Date dlDate;
//
    private Attendance dlAttendance;

    public Attendance getDlAttendance() {
        return dlAttendance;
    }

    public void setDlAttendance(Attendance dlAttendance) {
        this.dlAttendance = dlAttendance;
    }
//

    public Deal() {
    }

    public Deal(int dlId) {
        this.dlId = dlId;
    }

    public Deal(int dlEiId, int dlMoney,
                String dlReason) {
        this.dlEiId = dlEiId;
        this.dlMoney = dlMoney;
        this.dlReason = dlReason;
        this.dlDate = new Date();
    }

    public int getDlId() {
        return dlId;
    }

    public void setDlId(int dlId) {
        this.dlId = dlId;
    }

    public int getDlEiId() {
        return dlEiId;
    }

    public void setDlEiId(int dlEiId) {
        this.dlEiId = dlEiId;
    }

//    public int getDlAtId() {
//        return dlAtId;
//    }
//
//    public void setDlAtId(int dlAtId) {
//        this.dlAtId = dlAtId;
//    }

    public int getDlMoney() {
        return dlMoney;
    }

    public void setDlMoney(int dlMoney) {
        this.dlMoney = dlMoney;
    }

    public String getDlReason() {
        return dlReason;
    }

    public void setDlReason(String dlReason) {
        this.dlReason = dlReason;
    }

    public Date getDlDate() {
        return dlDate;
    }

    public void setDlDate(Date dlDate) {
        this.dlDate = dlDate;
    }
}
