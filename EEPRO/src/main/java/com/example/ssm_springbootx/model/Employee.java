package com.example.ssm_springbootx.model;

import java.io.Serializable;

public class Employee implements User, Serializable {
//basic
    private int eeId;
    private String eeName;
    private String eePass;
    private String eeState;//在职、离职
//fk
    private int eeViId;
    private Job eeJId;//双向int->Job
//ex-ref
    private Basic eeBsId;
    private EEInformation eeInformation;


    public Employee() {
    }

    public Employee(int eeId) {
        this.eeId = eeId;
    }

    public Employee(String eeName, String eePass, Basic eeBsId,
                    Job eeJId, int eeViId) {
        this.eeName = eeName;
        this.eePass = eePass;
        this.eeBsId = eeBsId;
        this.eeJId = eeJId;
        this.eeViId = eeViId;
        this.eeState="在职";
    }

    public EEInformation getEeInformation() {
        return eeInformation;
    }

    public void setEeInformation(EEInformation eeInformation) {
        this.eeInformation = eeInformation;
    }

    public int getEeId() {
        return eeId;
    }

    public void setEeId(int eeId) {
        this.eeId = eeId;
    }

    public String getEeName() {
        return eeName;
    }

    public void setEeName(String eeName) {
        this.eeName = eeName;
    }

    public String getEePass() {
        return eePass;
    }

    public void setEePass(String eePass) {
        this.eePass = eePass;
    }

    public Basic getEeBsId() {
        return eeBsId;
    }

    public void setEeBsId(Basic eeBsId) {
        this.eeBsId = eeBsId;
    }

    public Job getEeJId() {
        return eeJId;
    }

    public void setEeJId(Job eeJId) {
        this.eeJId = eeJId;
    }

    public int getEeViId() {
        return eeViId;
    }

    public void setEeViId(int eeViId) {
        this.eeViId = eeViId;
    }

    public String getEeState() {
        return eeState;
    }

    public void setEeState(String eeState) {
        this.eeState = eeState;
    }

    @Override
    public int getId() {
        return eeId;
    }
    @Override
    public String getName() {
        return eeName;
    }
    @Override
    public String getPass() {
        return eePass;
    }

    @Override
    public boolean haveResume() {
        return false;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "eeId=" + eeId +
                ", eeName='" + eeName + '\'' +
                ", eePass='" + eePass + '\'' +
                ", eeState='" + eeState + '\'' +
                '}';
    }
}
