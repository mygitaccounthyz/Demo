package com.example.ssm_springbootx.model;

import java.io.Serializable;
import java.util.List;

public class EEInformation implements Serializable {

    private int eiId;
    private int eiEeId;
    private String eiAccount;
    private String eiIDCard;

    private List<Deal> eiDeals;
    private List<Salary> eiSalaries;
    private List<Training> eiTrainings;
    private List<Attendance> eiAttendances;

    public EEInformation() {
    }

    public EEInformation(int eiId) {
        this.eiId = eiId;
    }

    public EEInformation(int eiEeId, String eiAccount, String eiIDCard) {
        this.eiEeId = eiEeId;
        this.eiAccount = eiAccount;
        this.eiIDCard = eiIDCard;
    }

    public int getEiId() {
        return eiId;
    }

    public void setEiId(int eiId) {
        this.eiId = eiId;
    }

    public int getEiEeId() {
        return eiEeId;
    }

    public void setEiEeId(int eiEeId) {
        this.eiEeId = eiEeId;
    }

    public String getEiAccount() {
        return eiAccount;
    }

    public void setEiAccount(String eiAccount) {
        this.eiAccount = eiAccount;
    }

    public String getEiIDCard() {
        return eiIDCard;
    }

    public void setEiIDCard(String eiIDCard) {
        this.eiIDCard = eiIDCard;
    }

    public List<Deal> getEiDeals() {
        return eiDeals;
    }

    public void setEiDeals(List<Deal> eiDeals) {
        this.eiDeals = eiDeals;
    }

    public List<Salary> getEiSalaries() {
        return eiSalaries;
    }

    public void setEiSalaries(List<Salary> eiSalaries) {
        this.eiSalaries = eiSalaries;
    }

    public List<Training> getEiTrainings() {
        return eiTrainings;
    }

    public void setEiTrainings(List<Training> eiTrainings) {
        this.eiTrainings = eiTrainings;
    }

    public List<Attendance> getEiAttendances() {
        return eiAttendances;
    }

    public void setEiAttendances(List<Attendance> eiAttendances) {
        this.eiAttendances = eiAttendances;
    }
}
