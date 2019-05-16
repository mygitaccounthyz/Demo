package com.example.ssm_springbootx.model;

public class Employee extends User{

    private int eeId;
    private String eeName;
    private String eePass;
    private int eeBsId;
    private int eeJId;
    private int eeViId;
    private String eeState;//在职、离职

    public Employee() {
    }

    public Employee(int eeId) {
        this.eeId = eeId;
    }

    public Employee(String eeName, String eePass, int eeBsId, int eeJId, int eeViId) {
        this.eeName = eeName;
        this.eePass = eePass;
        this.eeBsId = eeBsId;
        this.eeJId = eeJId;
        this.eeViId = eeViId;
        this.eeState="在职";
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

    public int getEeBsId() {
        return eeBsId;
    }

    public void setEeBsId(int eeBsId) {
        this.eeBsId = eeBsId;
    }

    public int getEeJId() {
        return eeJId;
    }

    public void setEeJId(int eeJId) {
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
    public void setId(int eeId) {
        this.eeId = eeId;
    }
    @Override
    public String getName() {
        return eeName;
    }
    @Override
    public void setName(String eeName) {
        this.eeName = eeName;
    }
    @Override
    public String getPass() {
        return eePass;
    }
    @Override
    public void setPass(String eePass) {
        this.eePass = eePass;
    }
}
