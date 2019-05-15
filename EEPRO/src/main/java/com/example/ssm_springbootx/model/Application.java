package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Application implements Serializable {

    private int apId;
    private int apRcId;//招聘信息
    private int apViId;//游客
    private Timestamp apTime;//面试时间
    private String  apState;//未读、已读、面试|拒绝、录用|拒绝

    public Application() {
    }

    public Application(int apId) {
        this.apId = apId;
    }

    public Application(int apRcId, int apViId) {
        this.apRcId = apRcId;
        this.apViId = apViId;
        this.apTime = new Timestamp(new Date().getTime());
        this.apState="未读";
    }

    public int getApId() {
        return apId;
    }

    public void setApId(int apId) {
        this.apId = apId;
    }

    public int getApRcId() {
        return apRcId;
    }

    public void setApRcId(int apRcId) {
        this.apRcId = apRcId;
    }

    public int getApViId() {
        return apViId;
    }

    public void setApViId(int apViId) {
        this.apViId = apViId;
    }

    public Date getApTime() {
        return apTime;
    }

    public void setApTime(Timestamp apTime) {
        this.apTime = apTime;
    }

    public String getApState() {
        return apState;
    }

    public void setApState(String apState) {
        this.apState = apState;
    }
}
