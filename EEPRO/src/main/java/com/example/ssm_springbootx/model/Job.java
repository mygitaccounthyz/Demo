package com.example.ssm_springbootx.model;

import java.io.Serializable;

public class Job implements Serializable {

    private int jId;
    private int jDpId;
    private String jName;
    private String jDescription;
    private String jState;//空置、在职

    public Job() {
    }

    public Job(int jId) {
        this.jId = jId;
    }

    public Job(int jDpId, String jName, String jDescription) {
        this.jDpId = jDpId;
        this.jName = jName;
        this.jDescription = jDescription;
        this.jState="空置";
    }

    public int getjId() {
        return jId;
    }

    public void setjId(int jId) {
        this.jId = jId;
    }

    public int getjDpId() {
        return jDpId;
    }

    public void setjDpId(int jDpId) {
        this.jDpId = jDpId;
    }

    public String getjName() {
        return jName;
    }

    public void setjName(String jName) {
        this.jName = jName;
    }

    public String getjDescription() {
        return jDescription;
    }

    public void setjDescription(String jDescription) {
        this.jDescription = jDescription;
    }

    public String getjState() {
        return jState;
    }

    public void setjState(String jState) {
        this.jState = jState;
    }
}
