package com.midpac.data.dao.imp;

import com.midpac.data.dao.iTF.TrolleyDao;
import com.midpac.model.Trolley;
import org.hibernate.HibernateException;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class TrolleyDaoImp implements TrolleyDao {
    @Resource
    private  DaoImp<Trolley> daoImp;

    @Resource
    private HibernateTemplate hibernateTemplate;

    @Override
    public boolean addTrolley(Trolley trolley) {
        return daoImp.addT(trolley);
    }

    @Override
    public boolean deleteTrolley(Trolley trolley) {
        return daoImp.deleteT(trolley);
    }

    @Override
    public boolean updateTrolley(Trolley trolley) {
        return daoImp.updateT(trolley);
    }

    @Override
    public Trolley getTrolleyById(Trolley trolley) {
        return daoImp.getT(Trolley.class,trolley.getId());
    }

    @Override
    public List getTrolleysByUid(int uid) {
        try {

            String hql="from Trolley where uid=?";
            return hibernateTemplate.find(hql,uid);

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }

    @Override
    public List getTrolleys() {
        try {

            String hql="from Trolley";
            return hibernateTemplate.find(hql);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }
}
