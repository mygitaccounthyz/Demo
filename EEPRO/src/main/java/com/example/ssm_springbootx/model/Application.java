package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Application implements Serializable {

    private int apId;

    private String apState;//未读、已读、面试、接受面试、录用、拒绝
    private Date apDate;//投递时间
    private Timestamp apTime;//面试时间

    private Recruitment apRcId;//招聘信息
    private Visitor apViId;//游客


    public Application() {
    }

    public Application(int apId) {
        this.apId = apId;
    }

    public Application(Recruitment apRcId, Visitor apViId) {
        this.apRcId = apRcId;
        this.apViId = apViId;
        this.apDate = new Date();
        this.apState="未读";
    }

    public Date getApDate() {
        return apDate;
    }

    public void setApDate(Date apDate) {
        this.apDate = apDate;
    }


    public int getApId() {
        return apId;
    }

    public void setApId(int apId) {
        this.apId = apId;
    }

    public Recruitment getApRcId() {
        return apRcId;
    }

    public void setApRcId(Recruitment apRcId) {
        this.apRcId = apRcId;
    }

    public Visitor getApViId() {
        return apViId;
    }

    public void setApViId(Visitor apViId) {
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
