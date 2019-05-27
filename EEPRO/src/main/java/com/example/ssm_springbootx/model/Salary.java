package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.util.Date;

public class Salary implements Serializable {

    private int slId;
    private int slEiId;
    private int slDlMoney;
    private Date slDate;
    private String slState;//结算、复议、已处理
    private int slPayment;
//    new
    private int slOvertime;
    private int slBase=3000;
    private int slInsurance=-400;
    private String slReset;
//    private int slResetNumber;
//new

    public int getSlInsurance() {
        return slInsurance;
    }

    public void setSlInsurance(int slInsurance) {
        this.slInsurance = slInsurance;
    }

    public int getSlOvertime() {
        return slOvertime;
    }

    public void setSlOvertime(int slOvertime) {
        this.slOvertime = slOvertime;
    }

    public int getSlBase() {
        return slBase;
    }

    public void setSlBase(int slBase) {
        this.slBase = slBase;
    }

    public String getSlReset() {
        return slReset;
    }

    public void setSlReset(String slReset) {
        this.slReset = slReset;
    }

    public Salary() {
    }

    public Salary(int slId) {
        this.slId = slId;
    }

    public Salary(int slEiId, int slDlMoney, int slPayment,
                  Date slDate) {
        this.slEiId = slEiId;
        this.slDlMoney = slDlMoney;
        this.slPayment = slPayment;
        this.slState = "结算";
        this.slDate = slDate;
    }

    public int getSlId() {
        return slId;
    }

    public void setSlId(int slId) {
        this.slId = slId;
    }

    public int getSlEiId() {
        return slEiId;
    }

    public void setSlEiId(int slEiId) {
        this.slEiId = slEiId;
    }

    public int getSlDlMoney() {
        return slDlMoney;
    }

    public void setSlDlMoney(int slDlMoney) {
        this.slDlMoney = slDlMoney;
    }

    public int getSlPayment() {
        return slPayment;
    }

    public void setSlPayment(int slPayment) {
        this.slPayment = slPayment;
    }

    public String getSlState() {
        return slState;
    }

    public void setSlState(String slState) {
        this.slState = slState;
    }

    public Date getSlDate() {
        return slDate;
    }

    public void setSlDate(Date slDate) {
        this.slDate = slDate;
    }
}
