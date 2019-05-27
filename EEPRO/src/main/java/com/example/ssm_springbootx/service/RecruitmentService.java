package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.RecruitmentDao;
import com.example.ssm_springbootx.model.Recruitment;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class RecruitmentService {

    @Resource
    private RecruitmentDao recruitmentDao;

    public Recruitment getRecruitment(int rcId){

        return recruitmentDao.getRecruitment(new Recruitment(rcId));
    }

    public List<Recruitment> getRecruitments(Recruitment recruitment){
        if (recruitment==null)return new ArrayList<>();
        return recruitmentDao.getRecruitments(recruitment);
    }


}
