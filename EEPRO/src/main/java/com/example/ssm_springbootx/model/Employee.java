package com.example.ssm_springbootx.model;

public class Employee extends User{

    private int eeId;
    private String eeName;
    private String eePass;

    public Employee() {
    }

    public Employee(int eeId) {
        this.eeId = eeId;
    }

    public Employee(String eeName, String eePass) {
        this.eeName = eeName;
        this.eePass = eePass;
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
