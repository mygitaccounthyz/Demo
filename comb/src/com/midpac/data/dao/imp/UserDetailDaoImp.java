package com.midpac.data.dao.imp;

import com.midpac.data.dao.iTF.UserDetailDao;
import com.midpac.model.Userdetail;
import org.hibernate.HibernateException;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDetailDaoImp  implements UserDetailDao {
    @Resource
    private  DaoImp<Userdetail> daoImp;
    @Resource
    private HibernateTemplate hibernateTemplate;

    @Override
    public boolean addUserDetail(Userdetail userDetail) {
        return daoImp.addT(userDetail);
    }

    @Override
    public boolean deleteUserDetail(Userdetail userDetail) {
        return daoImp.deleteT(userDetail);
    }

    @Override
    public boolean updateUserDetail(Userdetail userDetail) {
       return daoImp.updateT(userDetail);
    }

    @Override
    public Userdetail getUserDetail(Userdetail userdetail){
        return daoImp.getT(Userdetail.class,userdetail.getDid());
    }


    @Override
    public List getUserDetailsByUId(int uid) {
        try {

            String hql ="from Userdetail where uid = ?";
            return hibernateTemplate.find(hql,uid);
        } catch (HibernateException e) {
            e.printStackTrace();
        }

        return new ArrayList();
    }
}
