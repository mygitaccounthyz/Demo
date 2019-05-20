package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.BasicDao;
import com.example.ssm_springbootx.model.Basic;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class BasicService {
    @Resource
    private BasicDao basicDao;


    public boolean addBasic(Basic basic) {

        return basicDao.addBasic(basic);
    }
}
