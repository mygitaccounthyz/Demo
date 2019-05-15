package com.example.ssm_springbootx.model;

import java.io.Serializable;

public class Recruitment implements Serializable {

    private int rcId;
    private int rcJId;
    private String rcDescription;
    private String rcState;//未发布、已发布

    public Recruitment() {
    }

    public Recruitment(int rcId) {
        this.rcId = rcId;
    }

    public Recruitment(int rcJId, String rcDescription) {
        this.rcJId = rcJId;
        this.rcDescription = rcDescription;
        this.rcState = "未发布";
    }

    public int getRcId() {
        return rcId;
    }

    public void setRcId(int rcId) {
        this.rcId = rcId;
    }

    public int getRcJId() {
        return rcJId;
    }

    public void setRcJId(int rcJId) {
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
