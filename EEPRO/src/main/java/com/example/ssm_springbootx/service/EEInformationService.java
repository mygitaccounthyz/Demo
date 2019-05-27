package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.EEInformationDao;
import com.example.ssm_springbootx.model.EEInformation;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class EEInformationService {

    @Resource
    private EEInformationDao eeInformationDao;



    public boolean createOrUpdate(EEInformation eeInformation) {
        if (eeInformation==null)return false;
        if (eeInformation.getEiId()==0)
            return eeInformationDao.addEEInformation(eeInformation);
        else
            return eeInformationDao.updateEEInformation(eeInformation);

    }
}
