package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Resume;

import java.util.List;

public interface ResumeDao {

    boolean addResume(Resume resume);
    boolean deleteResume(Resume resume);
    boolean updateResume(Resume resume);
    Resume getResume(Resume resume);
//    List<Resume> getResumes(Resume resume);

}
