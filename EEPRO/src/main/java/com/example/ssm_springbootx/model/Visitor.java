package com.example.ssm_springbootx.model;

import java.util.List;

public class Visitor extends User {

    private int viId;
    private String viName;
    private String viPass;

    private Basic basic;
    private Resume resume;

    public Basic getBasic() {
        return basic;
    }

    public void setBasic(Basic basic) {
        this.basic = basic;
    }

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
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

    @Override
    public int getId() {
        return viId;
    }
    @Override
    public String getName() {
        return viName;
    }
    @Override
    public String getPass() {
        return viPass;
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
