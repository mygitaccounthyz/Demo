package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.util.List;

public class Visitor implements User , Serializable {

    private int viId;
    private String viName;
    private String viPass;

//    private Basic viBasic;
    private Resume viResume;
    private Employee viEmployee;

    private List<Application> viApplications;

//
    public List<Application> getViApplications() {
        return viApplications;
    }

    public void setViApplications(List<Application> viApplications) {
        this.viApplications = viApplications;
    }

//    public Basic getViBasic() {
//        return viBasic;
//    }
//
//    public void setViBasic(Basic viBasic) {
//        this.viBasic = viBasic;
//    }

    public Employee getViEmployee() {
        return viEmployee;
    }

    public void setViEmployee(Employee viEmployee) {
        this.viEmployee = viEmployee;
    }

    public Resume getViResume() {
        return viResume;
    }

    public void setViResume(Resume viResume) {
        this.viResume = viResume;
    }

    public Visitor() {
    }

    public Visitor(int viId) {
        this.viId = viId;
    }

    public Visitor(String viName, String viPass) {
        this.viName = viName;
        this.viPass = viPass;
    }

    public int getViId() {
        return viId;
    }

    public void setViId(int viId) {
        this.viId = viId;
    }

    public String getViName() {
        return viName;
    }

    public void setViName(String viName) {
        this.viName = viName;
    }

    public String getViPass() {
        return viPass;
    }

    public void setViPass(String viPass) {
        this.viPass = viPass;
    }

//    @Override
//    public int getId() {
//        return viId;
//    }
//    @Override
//    public String getName() {
//        return viName;
//    }
//    @Override
//    public String getPass() {
//        return viPass;
//    }
//
//    @Override

    public boolean haveResume() {
       return this.getViResume()!=null;
    }

    @Override
    public String toString() {
        return "Visitor{" +
                "viId=" + viId +
                ", viName='" + viName + '\'' +
                ", viPass='" + viPass + '\'' +
                '}';
    }
}
