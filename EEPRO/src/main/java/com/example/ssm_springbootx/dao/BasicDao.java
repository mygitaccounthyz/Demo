package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Basic;

import java.util.List;

public interface BasicDao {
    boolean addBasic(Basic basic);
    boolean deleteBasic(Basic basic);
    boolean updateBasic(Basic basic);
    Basic getBasic(Basic basic);
//    List<Basic> getBasics(Basic basic);
}
