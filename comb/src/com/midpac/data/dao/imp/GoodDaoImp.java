package com.midpac.data.dao.imp;

import com.midpac.data.dao.iTF.GoodDao;
import com.midpac.model.Good;
import com.midpac.utils.PageSplit;
import org.hibernate.HibernateException;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class GoodDaoImp implements GoodDao {

    @Resource
    private  DaoImp<Good> daoImp;
    @Resource
    private HibernateTemplate hibernateTemplate;


    @Override
    public boolean addGood(Good good) {
        return daoImp.addT(good);
    }

    @Override
    public boolean deleteGood(Good good) {
        return daoImp.deleteT(good);
    }

    @Override
    public boolean updateGood(Good good) {
        return daoImp.updateT(good);
    }

    @Override
    public Good getGood(Good good){
        return daoImp.getT(Good.class,good.getId());
    }


    @Override
    public List getGoodsByState(int state) {
        try {

            String hql="from Good where state=?";
            return hibernateTemplate.find(hql,state);

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }

    @Override
    public List getAllGoods() {
        try {

            String hql="from Good";
            return hibernateTemplate.find(hql);

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }

    public List getPage(int index,int pagesize){

        String hql="from Good";
        List list = hibernateTemplate.find(hql);
        return PageSplit.getPage(list, pagesize, index);

    }


}
