package com.midpac.data.dao.imp;

import com.midpac.data.dao.iTF.OrderDao;
import com.midpac.model.Orders;
import org.hibernate.HibernateException;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Repository
public class OrderDaoImp implements OrderDao {
    @Resource
    private  DaoImp<Orders> daoImp;

    @Resource
    private HibernateTemplate hibernateTemplate;

    @Override
    public boolean addOrder(Orders orders) {
        return daoImp.addT(orders);
    }

    @Override
    public boolean deleteOrder(Orders orders) {
        return daoImp.deleteT(orders);
    }

    @Override
    public boolean updateOrder(Orders orders) {
        return daoImp.updateT(orders);
    }

    @Override
    public Orders getOrdersById(Orders orders) {
        return daoImp.getT(Orders.class,orders.getId());
    }

    @Override
    public List getOrdersByUid(int uid) {
        try {

            String hql ="from Orders where uid =?";

            return hibernateTemplate.find(hql,uid);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }

    @Override
    public List getOrdersByState(int state) {

        try {

            String hql="from Orders where state =?";
            return hibernateTemplate.find(hql,state);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }

    @Override
    public List getOrdersByUidAndState(int uid, int state) {
        try {

            String hql="from Orders where uid=? and state=?";
            return hibernateTemplate.find(hql,uid,state);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }

    @Override
    public List getOrders() {
        try {

            String hql ="from Orders ";
           return hibernateTemplate.find(hql);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }
}
