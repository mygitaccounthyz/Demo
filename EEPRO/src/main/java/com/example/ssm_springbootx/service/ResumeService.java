package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.BasicDao;
import com.example.ssm_springbootx.dao.ResumeDao;
import com.example.ssm_springbootx.model.Basic;
import com.example.ssm_springbootx.model.Resume;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ResumeService {
    @Resource
    private ResumeDao resumeDao;
    @Resource
    private BasicDao basicDao;

    public Resume getResume(int viId) {

        return resumeDao.getResume(new Resume(viId));
    }


    public boolean addResume(Resume resume) {

        Basic rsBasic = resume.getRsBasic();
        boolean rs = resumeDao.addResume(resume);
        rsBasic.setBsRsId(resume.getRsId());
        boolean bs = basicDao.addBasic(rsBasic);

        return rs&&bs;
    }
}
