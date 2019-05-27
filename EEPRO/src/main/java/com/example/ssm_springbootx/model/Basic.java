package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.sql.Date;

public class Basic implements Serializable {

    private int bsId;

    private int bsEEId;//员工账号
    private int bsRsId;//简历引用

    private String bsName;
    private String bsGender;
    private Date bsBirth;
    private String bsPhone;
    private String bsAddress;
    private String bsEmail;



    public Basic() {
    }

    public Basic(int bsId) {
        this.bsId = bsId;
    }

    public Basic(String bsName, String bsPhone,
                 String bsAddress, String bsGender,
                 String bsEmail, Date bsBirth,  int bsRsId) {
        this.bsName = bsName;
        this.bsPhone = bsPhone;
        this.bsAddress = bsAddress;
        this.bsGender = bsGender;
        this.bsEmail = bsEmail;
        this.bsBirth = bsBirth;
        this.bsRsId = bsRsId;
    }



    public int getBsId() {
        return bsId;
    }

    public void setBsId(int bsId) {
        this.bsId = bsId;
    }

    public String getBsName() {
        return bsName;
    }

    public void setBsName(String bsName) {
        this.bsName = bsName;
    }

    public String getBsPhone() {
        return bsPhone;
    }

    public void setBsPhone(String bsPhone) {
        this.bsPhone = bsPhone;
    }

    public String getBsAddress() {
        return bsAddress;
    }

    public void setBsAddress(String bsAddress) {
        this.bsAddress = bsAddress;
    }

    public String getBsGender() {
        return bsGender;
    }

    public void setBsGender(String bsGender) {
        this.bsGender = bsGender;
    }

    public String getBsEmail() {
        return bsEmail;
    }

    public void setBsEmail(String bsEmail) {
        this.bsEmail = bsEmail;
    }

    public Date getBsBirth() {
        return bsBirth;
    }

    public void setBsBirth(Date bsBirth) {
        this.bsBirth = bsBirth;
    }

    public int getBsEEId() {
        return bsEEId;
    }

    public void setBsEEId(int bsEEId) {
        this.bsEEId = bsEEId;
    }

    public int getBsRsId() {
        return bsRsId;
    }

    public void setBsRsId(int bsRsId) {
        this.bsRsId = bsRsId;
    }
}
