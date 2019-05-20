package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Employee;

import java.util.List;

public interface EmployeeDao {

    boolean addEmployee(Employee employee);
    boolean deleteEmployee(Employee employee);
    boolean updateEmployee(Employee employee);
    Employee getEmployee(Employee employee);
    List<Employee> getEmployees(Employee employee);
}
