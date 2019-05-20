package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.EEInformation;

import java.util.List;

public interface EEInformationDao {

    boolean addEEInformation(EEInformation eeInformation);
    boolean deleteEEInformation(EEInformation eeInformation);
    boolean updateEEInformation(EEInformation eeInformation);
    EEInformation getEEInformation(EEInformation eeInformation);
    List<EEInformation> getEEInformations(EEInformation eeInformation);

}
