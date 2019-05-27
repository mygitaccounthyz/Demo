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

    public boolean updateBasic(Basic basic) {
        if (basic==null||basic.getBsId()==0)return false;
        return basicDao.updateBasic(basic);

    }
}
