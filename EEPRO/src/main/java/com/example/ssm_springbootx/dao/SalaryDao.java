package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Salary;

import java.util.List;

public interface SalaryDao {
    boolean addSalary(Salary salary);
    boolean deleteSalary(Salary salary);
    boolean updateSalary(Salary salary);
    Salary getSalary(Salary salary);
    List<Salary> getSalarys(Salary salary);
}
