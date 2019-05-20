package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.VisitorDao;
import com.example.ssm_springbootx.model.Visitor;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class VisitorService {
    @Resource
    private VisitorDao visitorDao;

    public Visitor getVisitor(Visitor visitor){
        if (visitor==null)return null;

        if (visitor.getId()==0&&(visitor.getName()==null||visitor.getPass()==null))
            return null;

        return visitorDao.getVisitor(visitor);
    }

    public boolean addVisitor(Visitor visitor){
        if (visitor==null||visitor.getName()==null||visitor.getPass()==null)
            return false;
        return visitorDao.addVisitor(visitor);
    }

    public boolean deleteVisitor(Visitor visitor){
        if (visitor==null||visitor.getId()==0)
            return false;
        return visitorDao.deleteVisitor(visitor);
    }

    public boolean updateVisitor(Visitor visitor){
        if (visitor==null||visitor.getId()==0||
                (visitor.getName()==null&&visitor.getPass()==null))return false;
        return visitorDao.updateVisitor(visitor);
    }

}
