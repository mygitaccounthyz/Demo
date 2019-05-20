package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.ApplicationDao;
import com.example.ssm_springbootx.model.Application;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ApplicationService {

    @Resource
    private ApplicationDao applicationDao;


    public boolean addApplication(Application application) {

        return applicationDao.addApplication(application);
    }

    public boolean deleteApplication(Application application){
        return applicationDao.deleteApplication(application);
    }

    public boolean updateApplication(Application application){
        return applicationDao.updateApplication(application);
    }

    public Application getApplication(Application application){
        return applicationDao.getApplication(application);
    }

    public List<Application> getApplications(Application application){
        return applicationDao.getApplications(application);
    }
}
