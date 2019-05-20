package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Recruitment;

import java.util.List;

public interface RecruitmentDao {
    boolean addRecruitment(Recruitment recruitment);
    boolean deleteRecruitment(Recruitment recruitment);
    boolean updateRecruitment(Recruitment recruitment);
    Recruitment getRecruitment(Recruitment recruitment);
    List<Recruitment> getRecruitments(Recruitment recruitment);


}
