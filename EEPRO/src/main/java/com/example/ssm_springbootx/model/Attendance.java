package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Attendance implements Serializable {

    private int atId;

    private int atEiId;
    private int atDlId;
//    private Timestamp atOnTime;
//    private Timestamp atOffTime;
    private Timestamp atOn;
    private Timestamp atOff;



    public Attendance() {
    }

    public Attendance(int atId) {
        this.atId = atId;
    }

    public Attendance(int atEiId, Timestamp atOn) {
        this.atEiId = atEiId;
//        this.atOnTime = atOnTime;
//        this.atOffTime = atOffTime;
        this.atOn = atOn;
    }

    public int getAtDlId() {
        return atDlId;
    }

    public void setAtDlId(int atDlId) {
        this.atDlId = atDlId;
    }

    public int getAtId() {
        return atId;
    }

    public void setAtId(int atId) {
        this.atId = atId;
    }

    public int getAtEiId() {
        return atEiId;
    }

    public void setAtEiId(int atEiId) {
        this.atEiId = atEiId;
    }

//    public Timestamp getAtOnTime() {
//        return atOnTime;
//    }
//
//    public void setAtOnTime(Timestamp atOnTime) {
//        this.atOnTime = atOnTime;
//    }
//
//    public Timestamp getAtOffTime() {
//        return atOffTime;
//    }
//
//    public void setAtOffTime(Timestamp atOffTime) {
//        this.atOffTime = atOffTime;
//    }

    public Timestamp getAtOn() {
        return atOn;
    }

    public void setAtOn(Timestamp atOn) {
        this.atOn = atOn;
    }

    public Timestamp getAtOff() {
        return atOff;
    }

    public void setAtOff(Timestamp atOff) {
        this.atOff = atOff;
    }
}
