package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Application;

import java.util.List;

public interface ApplicationDao {

    boolean addApplication(Application application);
    boolean deleteApplication(Application application);
    boolean updateApplication(Application application);
    Application getApplication(Application application);
    List<Application> getApplications(Application application);

}
