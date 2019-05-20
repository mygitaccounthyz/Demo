package com.example.ssm_springbootx.model;

import java.io.Serializable;

public class TrMid implements Serializable {

    private int tmId;

    private EEInformation tmEiId;//
    private Training tmTrId;//

    private String tmAt;
    private String tmRes;



    public TrMid() {
    }

    public TrMid(int tmId) {
        this.tmId = tmId;
    }

    public TrMid(EEInformation tmEiId, Training tmTrId) {
        this.tmEiId = tmEiId;
        this.tmTrId = tmTrId;
    }

    public int getTmId() {
        return tmId;
    }

    public void setTmId(int tmId) {
        this.tmId = tmId;
    }

    public EEInformation getTmEiId() {
        return tmEiId;
    }

    public void setTmEiId(EEInformation tmEiId) {
        this.tmEiId = tmEiId;
    }

    public Training getTmTrId() {
        return tmTrId;
    }

    public void setTmTrId(Training tmTrId) {
        this.tmTrId = tmTrId;
    }

    public String getTmAt() {
        return tmAt;
    }

    public void setTmAt(String tmAt) {
        this.tmAt = tmAt;
    }

    public String getTmRes() {
        return tmRes;
    }

    public void setTmRes(String tmRes) {
        this.tmRes = tmRes;
    }
}
