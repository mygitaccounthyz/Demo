package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.util.List;

public class Department implements Serializable {

    private int dpId;
    private String dpName;
    private String dpFunction;

    private List<Job> dpJobs;

    public Department() {
    }

    public Department(int dpId) {
        this.dpId = dpId;
    }

    public Department(String dpName, String dpFunction) {
        this.dpName = dpName;
        this.dpFunction = dpFunction;
    }

    public List<Job> getDpJobs() {
        return dpJobs;
    }

    public void setDpJobs(List<Job> dpJobs) {
        this.dpJobs = dpJobs;
    }

    public int getDpId() {
        return dpId;
    }

    public void setDpId(int dpId) {
        this.dpId = dpId;
    }

    public String getDpName() {
        return dpName;
    }

    public void setDpName(String dpName) {
        this.dpName = dpName;
    }

    public String getDpFunction() {
        return dpFunction;
    }

    public void setDpFunction(String dpFunction) {
        this.dpFunction = dpFunction;
    }
}
