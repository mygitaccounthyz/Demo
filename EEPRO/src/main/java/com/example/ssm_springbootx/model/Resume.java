package com.example.ssm_springbootx.model;

import java.io.Serializable;

public class Resume implements Serializable {

    private int rsId;
//    private int rsEEId;
    private String rsEducation;
    private String rsMajor;
    private String rsExperience;
    private String rsSkills;
    private String rsAward;
    private String rsIntroduction;
    private String rsGraduation;

    private int rsViId;

    private Basic rsBasic;



    public Resume() {
    }

    public Resume(int rsId) {
        this.rsId = rsId;
    }

    public Resume(int rsViId, String rsEducation, String rsMajor,
                  String rsExperience, String rsGraduation,
                  String rsSkills, String rsAward, String rsIntroduction) {
        this.rsViId = rsViId;
        this.rsEducation = rsEducation;
        this.rsMajor = rsMajor;
        this.rsExperience = rsExperience;
        this.rsSkills = rsSkills;
        this.rsAward = rsAward;
        this.rsIntroduction = rsIntroduction;
        this.rsGraduation=rsGraduation;
    }

    public String getRsGraduation() {
        return rsGraduation;
    }

    public void setRsGraduation(String rsGraduation) {
        this.rsGraduation = rsGraduation;
    }

    public Basic getRsBasic() {
        return rsBasic;
    }

    public void setRsBasic(Basic rsBasic) {
        this.rsBasic = rsBasic;
    }

    public int getRsId() {
        return rsId;
    }

    public void setRsId(int rsId) {
        this.rsId = rsId;
    }

//    public int getRsEEId() {
//        return rsEEId;
//    }
//
//    public void setRsEEId(int rsEEId) {
//        this.rsEEId = rsEEId;
//    }

    public int getRsViId() {
        return rsViId;
    }

    public void setRsViId(int rsViId) {
        this.rsViId = rsViId;
    }

    public String getRsEducation() {
        return rsEducation;
    }

    public void setRsEducation(String rsEducation) {
        this.rsEducation = rsEducation;
    }

    public String getRsMajor() {
        return rsMajor;
    }

    public void setRsMajor(String rsMajor) {
        this.rsMajor = rsMajor;
    }

    public String getRsExperience() {
        return rsExperience;
    }

    public void setRsExperience(String rsExperience) {
        this.rsExperience = rsExperience;
    }

    public String getRsSkills() {
        return rsSkills;
    }

    public void setRsSkills(String rsSkills) {
        this.rsSkills = rsSkills;
    }

    public String getRsAward() {
        return rsAward;
    }

    public void setRsAward(String rsAward) {
        this.rsAward = rsAward;
    }

    public String getRsIntroduction() {
        return rsIntroduction;
    }

    public void setRsIntroduction(String rsIntroduction) {
        this.rsIntroduction = rsIntroduction;
    }
}
