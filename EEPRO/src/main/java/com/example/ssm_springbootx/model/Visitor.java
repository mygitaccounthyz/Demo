package com.example.ssm_springbootx.model;

public class Visitor extends User {
    private int viId;
    private String viName;
    private String viPass;

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
    public void setId(int viid) {
        this.viId = viid;
    }
    @Override
    public String getName() {
        return viName;
    }
    @Override
    public void setName(String viName) {
        this.viName = viName;
    }
    @Override
    public String getPass() {
        return viPass;
    }
    @Override
    public void setPass(String viPass) {
        this.viPass = viPass;
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
