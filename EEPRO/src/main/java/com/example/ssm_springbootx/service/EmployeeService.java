package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.BasicDao;
import com.example.ssm_springbootx.dao.EmployeeDao;
import com.example.ssm_springbootx.model.Basic;
import com.example.ssm_springbootx.model.Employee;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class EmployeeService {

    @Resource
    private EmployeeDao employeeDao;
    @Resource
    private BasicDao basicDao;


    public Employee getEmployee(Employee employee0) {
        if (employee0==null)return null;
        if (employee0.getEeId()==0&&(employee0.getEeName()==null||employee0.getEePass()==null))
            return null;
        return employeeDao.getEmployee(employee0);
    }

    public boolean addEmployee(Employee employee) {
        Basic rsBasic = employee.getEeBsId();
        boolean bs=false;

        if (employeeDao.addEmployee(employee))
        {
            rsBasic.setBsEEId(employee.getEeId());
            bs=basicDao.updateBasic(rsBasic);
        }
        return bs;
    }
}
