package com.midpac.data.service;


import com.midpac.data.dao.imp.TrolleyDaoImp;
import com.midpac.model.Trolley;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Service
public class TrolleyService {//id>0,notnull
    @Resource
    private  TrolleyDaoImp trolleyDaoImp;

    public boolean addTrolley(Trolley trolley) {
        if (trolley==null)return false;
        return trolleyDaoImp.addTrolley(trolley);
    }

    
    public boolean deleteTrolley(Trolley trolley) {
        if (trolley==null||trolley.getId()<1)return false;
        return trolleyDaoImp.deleteTrolley(trolley);
    }

    
    public boolean updateTrolley(Trolley trolley) {
        if (trolley==null||trolley.getId()<1)return false;
        return trolleyDaoImp.updateTrolley(trolley);
    }

    
    public Trolley getTrolleyById(Trolley trolley) {
        if (trolley==null||trolley.getId()<1)return null;
        return trolleyDaoImp.getTrolleyById(trolley);
    }

    
    public List getTrolleysByUid(int uid) {
        if (uid<1)return new ArrayList();
        return trolleyDaoImp.getTrolleysByUid(uid);
    }

    
    public List getTrolleys() {
        return trolleyDaoImp.getTrolleys();
    }
}
