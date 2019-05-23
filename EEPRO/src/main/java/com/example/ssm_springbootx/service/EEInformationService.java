package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.EEInformationDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class EEInformationService {

    @Resource
    private EEInformationDao eeInformationDao;


}
