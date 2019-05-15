package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.util.Date;

public class Deal implements Serializable {

    private int dlId;
    private int dlEEId;
    private int dlAtId;
    private int dlMoney;
    private String dlReason;
    private Date dlTime;

    public Deal() {
    }

    public Deal(int dlId) {
        this.dlId = dlId;
    }

    public Deal(int dlEEId, int dlMoney,
                String dlReason) {
        this.dlEEId = dlEEId;
        this.dlMoney = dlMoney;
        this.dlReason = dlReason;
        this.dlTime = new Date();
    }

    public int getDlId() {
        return dlId;
    }

    public void setDlId(int dlId) {
        this.dlId = dlId;
    }

    public int getDlEEId() {
        return dlEEId;
    }

    public void setDlEEId(int dlEEId) {
        this.dlEEId = dlEEId;
    }

    public int getDlAtId() {
        return dlAtId;
    }

    public void setDlAtId(int dlAtId) {
        this.dlAtId = dlAtId;
    }

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

    public Date getDlTime() {
        return dlTime;
    }

    public void setDlTime(Date dlTime) {
        this.dlTime = dlTime;
    }
}
