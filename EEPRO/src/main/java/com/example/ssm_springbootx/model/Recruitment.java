package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Recruitment implements Serializable {

    private int rcId;

    private String rcDescription;
    private String rcState;//未发布、已发布
    private Date rcDate;

    private Job rcJId;
    private List<Application> rcApplications;



    public Recruitment() {
    }

    public Recruitment(int rcId) {
        this.rcId = rcId;
    }

    public Recruitment(Job rcJId, String rcDescription) {
        this.rcJId = rcJId;
        this.rcDescription = rcDescription;
        this.rcState = "未发布";
        this.rcDate=new Date();
    }

    public List<Application> getRcApplications() {
        return rcApplications;
    }

    public void setRcApplications(List<Application> rcApplications) {
        this.rcApplications = rcApplications;
    }

    public Date getRcDate() {
        return rcDate;
    }

    public void setRcDate(Date rcDate) {
        this.rcDate = rcDate;
    }

    public int getRcId() {
        return rcId;
    }

    public void setRcId(int rcId) {
        this.rcId = rcId;
    }

    public Job getRcJId() {
        return rcJId;
    }

    public void setRcJId(Job rcJId) {
        this.rcJId = rcJId;
    }

    public String getRcDescription() {
        return rcDescription;
    }

    public void setRcDescription(String rcDescription) {
        this.rcDescription = rcDescription;
    }

    public String getRcState() {
        return rcState;
    }

    public void setRcState(String rcState) {
        this.rcState = rcState;
    }
}
