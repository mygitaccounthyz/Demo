package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Job;

import java.util.List;

public interface JobDao {

    boolean addJob(Job job);
    boolean deleteJob(Job job);
    boolean updateJob(Job job);
    Job getJob(Job job);
    List<Job> getJobs(Job job);

}
