package com.midpac.data.dao.imp;
import com.midpac.data.dao.iTF.UserDao;
import com.midpac.model.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.util.List;

@Repository
public class UserDaoImp implements UserDao {
    @Resource
    private  DaoImp<User> daoImp;
    @Resource
    private HibernateTemplate hibernateTemplate;

    @Override
    public boolean addUser(User user) {
        return daoImp.addT(user);
    }

    @Override
    public boolean deleteUser(User user) {
        return daoImp.deleteT(user);
    }

    @Override
    public boolean updateUser(User user) {
        return daoImp.updateT(user);
    }

    @Override
    public User getUser(User user){
        return daoImp.getT(User.class,user.getUid());
    }

    @Override
    public User getUserByNameAndPass(User user) {
        try {

            String hql ="from User where name=? and pass=?";
            List list = hibernateTemplate.find(hql, user.getName(), user.getPass());
            if (list==null||list.isEmpty())return null;
            else return (User) list.get(0);

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getUserByName(String name) {
        Session session=null;
        Transaction tx =null;
        try {

            String hql ="from User where name=? ";
            List list = hibernateTemplate.find(hql,name);

            if (list==null||list.isEmpty())return null;

            else return (User) list.get(0);

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }
}
