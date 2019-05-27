package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.VisitorDao;
import com.example.ssm_springbootx.model.Visitor;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class VisitorService {
    @Resource
    private VisitorDao visitorDao;

//    id或者name+pass查找
    public Visitor getVisitor(Visitor visitor){
        if (visitor==null)return null;
//        根据id和用户名、密码两种方式都无法查到返回null
        if (visitor.getViId()==0&&(visitor.getViName()==null||visitor.getViPass()==null))
            return null;
        return visitorDao.getVisitor(visitor);
    }

    public boolean addVisitor(Visitor visitor){
        if (visitor==null||visitor.getViName()==null||visitor.getViPass()==null)
            return false;
        return visitorDao.addVisitor(visitor);
    }

    public boolean deleteVisitor(Visitor visitor){
        if (visitor==null||visitor.getViId()==0)
            return false;
        return visitorDao.deleteVisitor(visitor);
    }

    public boolean updateVisitor(Visitor visitor){
        if (visitor==null||visitor.getViId()==0||
                (visitor.getViName()==null&&visitor.getViPass()==null))return false;
        return visitorDao.updateVisitor(visitor);
    }

}
