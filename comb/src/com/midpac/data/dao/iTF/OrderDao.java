package com.midpac.data.dao.iTF;

import com.midpac.model.Orders;

import java.util.List;

public interface OrderDao {
    boolean addOrder(Orders orders);
    boolean deleteOrder(Orders orders);
    boolean updateOrder(Orders orders);
    Orders getOrdersById(Orders orders);
    List getOrdersByUid(int uid);
    List getOrdersByState(int state);
    List getOrdersByUidAndState(int uid, int state);
    List getOrders();
}
