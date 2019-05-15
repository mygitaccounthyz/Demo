package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.util.Date;

public class Salary implements Serializable {

    private int slId;
    private int slEEId;
    private int slDlMoney;
    private int slPayment;
    private String slState;//未结算、结算、复议
    private Date slDate;

    public Salary() {
    }

    public Salary(int slId) {
        this.slId = slId;
    }

    public Salary(int slEEId, int slDlMoney, int slPayment,
                   Date slDate) {
        this.slEEId = slEEId;
        this.slDlMoney = slDlMoney;
        this.slPayment = slPayment;
        this.slState = "未结算";
        this.slDate = slDate;
    }

    public int getSlId() {
        return slId;
    }

    public void setSlId(int slId) {
        this.slId = slId;
    }

    public int getSlEEId() {
        return slEEId;
    }

    public void setSlEEId(int slEEId) {
        this.slEEId = slEEId;
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
