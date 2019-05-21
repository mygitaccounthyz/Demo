package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.DepartmentDao;
import com.example.ssm_springbootx.model.Department;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DepartmentService {
    @Resource
    private DepartmentDao departmentDao;


    public List<Department> getDepartments(Department department) {

        return departmentDao.getDepartments(department);
    }
}
