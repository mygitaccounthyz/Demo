package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Training implements Serializable {

    private int trId;
    private String  trTitle;
    private String  trDescription;
    private String trAddress;
    private Timestamp trTime;

//
    private List<Employee> trEmployees;

    public List<Employee> getEmployees() {
        return trEmployees;
    }

    public void setEmployees(List<Employee> employees) {
        this.trEmployees = employees;
    }

//


    public Training() {
    }

    public Training(int trId) {
        this.trId = trId;
    }

    public Training(String trTitle, String trDescription,
                    String trAddress, Timestamp trTime) {
        this.trTitle = trTitle;
        this.trDescription = trDescription;
        this.trAddress = trAddress;
        this.trTime = trTime;
    }

    public int getTrId() {
        return trId;
    }

    public void setTrId(int trId) {
        this.trId = trId;
    }

    public String getTrTitle() {
        return trTitle;
    }

    public void setTrTitle(String trTitle) {
        this.trTitle = trTitle;
    }

    public String getTrDescription() {
        return trDescription;
    }

    public void setTrDescription(String trDescription) {
        this.trDescription = trDescription;
    }

    public String getTrAddress() {
        return trAddress;
    }

    public void setTrAddress(String trAddress) {
        this.trAddress = trAddress;
    }

    public Timestamp getTrTime() {
        return trTime;
    }

    public void setTrTime(Timestamp trTime) {
        this.trTime = trTime;
    }
}
