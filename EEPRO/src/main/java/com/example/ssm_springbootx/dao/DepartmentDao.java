package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Department;

import java.util.List;

public interface DepartmentDao {

    boolean addDepartment(Department department);
    boolean deleteDepartment(Department department);
    boolean updateDepartment(Department department);
    Department getDepartment(Department department);
    List<Department> getDepartments(Department department);


}
