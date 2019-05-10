package com.midpac.data.service;


import com.midpac.data.dao.imp.OrderDaoImp;
import com.midpac.model.Orders;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrdersService {
    @Resource
    private  OrderDaoImp orderDaoImp;


    public boolean addOrder(Orders orders) {
        if (orders==null)return false;
        return orderDaoImp.addOrder(orders);
    }

    public boolean deleteOrder(Orders orders) {
        if (orders==null||orders.getId()<1)return false;
        return orderDaoImp.deleteOrder(orders);
    }
    
    public boolean updateOrder(Orders orders) {
        if (orders==null||orders.getId()<1)return false;
        return orderDaoImp.updateOrder(orders);
    }

    public Orders getOrdersById(Orders orders) {
        if (orders==null||orders.getId()<1)return null;
        return orderDaoImp.getOrdersById(orders);
    }

    public List getOrdersByUid(int uid) {
        if (uid<1)return new ArrayList();
        return orderDaoImp.getOrdersByUid(uid);
    }

    public List getOrdersByState(int state) {
        if (state<0)return new ArrayList();
        return orderDaoImp.getOrdersByState(state);
    }

    public List getOrdersByUidAndState(int uid, int state) {
        if (uid<1||state<0) return new ArrayList();
        return orderDaoImp.getOrdersByUidAndState(uid,state);
    }

    public List getOrders() {
        return orderDaoImp.getOrders();
    }
}
