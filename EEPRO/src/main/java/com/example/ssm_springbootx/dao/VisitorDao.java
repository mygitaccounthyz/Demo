package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Visitor;
import org.springframework.stereotype.Repository;

@Repository
public interface VisitorDao {
    boolean addVisitor(Visitor visitor);
    boolean deleteVisitor(Visitor visitor);
    boolean updateVisitor(Visitor visitor);
    Visitor getVisitor(Visitor visitor);
}
