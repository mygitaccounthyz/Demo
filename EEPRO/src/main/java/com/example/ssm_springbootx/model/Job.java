package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.util.List;

public class Job implements Serializable {

    private int jId;

    private String jName;
    private String jDescription;
    private String jState;//空置、在职

    private int jRcId;
    private Department jDpId;//双向int->Department

    private List<Employee> jEmployees;

    public Job() {
    }

    public Job(int jId) {
        this.jId = jId;
    }

    public Job(Department jDpId, String jName, String jDescription) {
        this.jDpId = jDpId;
        this.jName = jName;
        this.jDescription = jDescription;
        this.jState="空置";
    }

    public List<Employee> getjEmployees() {
        return jEmployees;
    }

    public void setjEmployees(List<Employee> jEmployees) {
        this.jEmployees = jEmployees;
    }

    public int getjRcId() {
        return jRcId;
    }

    public void setjRcId(int jRcId) {
        this.jRcId = jRcId;
    }

    public int getjId() {
        return jId;
    }

    public void setjId(int jId) {
        this.jId = jId;
    }

    public Department getjDpId() {
        return jDpId;
    }

    public void setjDpId(Department jDpId) {
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
