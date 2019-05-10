package com.midpac.data.service;


import com.midpac.data.dao.imp.GoodDaoImp;
import com.midpac.model.Good;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Service
public class GoodService{

    @Resource
    private GoodDaoImp goodDaoImp;

    public boolean addGood(Good good) {
        if (good==null)return false;
        return goodDaoImp.addGood(good);
    }

    public boolean deleteGood(Good good) {
        if (good==null||good.getId()<1)return false;
        return goodDaoImp.deleteGood(good);
    }

    public boolean updateGood(Good good) {
        if (good==null||good.getId()<1)return false;
        return goodDaoImp.updateGood(good);
    }

    public Good getGood(Good good){
        if (good==null||good.getId()<1)return null;
        return goodDaoImp.getGood(good);
    }
    
    public Good getGoodById(Good good) {
        if (good==null||good.getId()<1)return null;
        return goodDaoImp.getGood(good);
    }
    
    public List getGoodsByState(int state) {
        if (state<0)return new ArrayList();
        return goodDaoImp.getGoodsByState(state);
    }
    
    public List getAllGoods(){
        return goodDaoImp.getAllGoods();
    }

    public List getPage(int i,int s){
        if (i<1||s<1)return new ArrayList();
        return goodDaoImp.getPage(i,s);
    }

}
