package com.midpac.data.controller;

import com.midpac.data.service.*;
import com.midpac.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
public class OrdersServlet{
    @Resource
    private UserDetailService userDetailService;
    @Resource
    private OrdersService ordersService;
    @Resource
    private UserService userService;
    @Resource
    private GoodService goodService;
    @Resource
    private StockService stockService;
    @Resource
    private StockRecordService stockRecordService;
    @Resource
    private TrolleyService trolleyService;

    @RequestMapping("/orders")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String method =request.getParameter("method");

        request.getRequestDispatcher("orders."+method).forward(request,response);
        
//        if ("bulkorders".equals(method)) {
//            bulkorders(request,response);
//            return;
//        }
//        if ("oneorder".equals(method)) {
//            oneorder(request,response);
//            return;
//        }
//        if ("setorders".equals(method)) {
//            setorders(request,response);
//            return;
//        }
//        if ("pay".equals(method))
//        {
//            pay(request,response);
//            return;
//        }
//        if ("cancel".equals(method)) {
//            cancel(request,response);
//            return;
//        }
//        if ("chargeback".equals(method)) {
//            chargeback(request,response);
//            return;
//        }
//        if ("receive".equals(method)) {
//            receive(request,response);
//            return;
//        }
//        if ("show".equals(method)) {
//            show(request,response);
//            return;
//        }
//        if ("showstate".equals(method)) {
//            showstate(request,response);
//            return;
//        }
//        if ("delivery".equals(method))
//        {
//            delivery(request,response);
//            return;
//        }
    }
    
    
    @RequestMapping("/orders.delivery")
    private void delivery(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String oid = request.getParameter("oid");
        Orders ordersById = ordersService.getOrdersById(new Orders(Integer.parseInt(oid)));
        ordersById.setState(2);
        boolean o = ordersService.updateOrder(ordersById);
        Good good =ordersById.getGood();
        Stock stock =good.getStock();
        stock.setGcount(stock.getGcount()-ordersById.getGcount());
        boolean s = stockService.updateStock(stock);
        StockRecord stockRecord = new StockRecord(good,-1*ordersById.getGcount());
        boolean r = stockRecordService.addStockRecord(stockRecord);
        if (o&&s&&r)response.getWriter().write("1");
        else response.getWriter().write("0");
    }

    @RequestMapping("/orders.showstate")
    private String  showstate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String state = request.getParameter("state");
        List ordersByState = ordersService.getOrdersByState(Integer.parseInt(state));
        request.setAttribute("orders",ordersByState);
        return "admin/adminorders";
    }

    @RequestMapping("/orders.show")
    private String show(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        List orders = ordersService.getOrders();
        request.setAttribute("orders",orders);
        return "admin/adminorders";

    }

    @RequestMapping("/orders.receive")
    private void receive(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        User user = (User) request.getSession().getAttribute("user");
        String oid0 = request.getParameter("oid");
        int oid =Integer.parseInt(oid0);
        Set<Orders> orders =user.getOrders();

        for (Orders order : orders) {
            if (order.getId()==oid){
                order.setState(3);
                ordersService.updateOrder(order);
                response.getWriter().write("1");
                return;
            }
        }
        response.getWriter().write("0");
    }
    
    @RequestMapping("/orders.chargeback")
    private void chargeback(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        User user = (User) request.getSession().getAttribute("user");
        String oid0 = request.getParameter("oid");
        int oid =Integer.parseInt(oid0);
        Set<Orders> orders =user.getOrders();

        for (Orders order : orders) {
            if (order.getId() == oid) {
                Double money = order.getMoney();
                Double balance = user.getMoney();
                user.setMoney(money+balance);//退钱

                int gcount = order.getGcount();
                Stock stock = order.getGood().getStock();
                stock.setGcount(stock.getGcount()+gcount);//退货

                orders.remove(order);
                ordersService.deleteOrder(order);//取消订单

                userService.updateUser(user);
                stockService.updateStock(stock);
                response.getWriter().write("1");
                return;
            }
        }
        response.getWriter().write("0");
    }

    @RequestMapping("/orders.cancel")
    private void cancel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        User user = (User) request.getSession().getAttribute("user");
        String oid0 = request.getParameter("oid");
        int oid =Integer.parseInt(oid0);
        Set<Orders> orders =user.getOrders();
        for (Orders order : orders) {
            if (order.getId()==oid){
                orders.remove(order);
                ordersService.deleteOrder(order);
                response.getWriter().write("1");
                return;
            }
        }
        response.getWriter().write("0");
    }

    @RequestMapping("/orders.pay")
    private void pay(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        User user = (User) request.getSession().getAttribute("user");
        String oid0 = request.getParameter("oid");
        int oid =Integer.parseInt(oid0);
        Set<Orders> orders =user.getOrders();

        for (Orders order : orders) {
            if (order.getId()==oid){

                int need = order.getGcount();
                Integer stock = order.getGood().getStock().getGcount();
                if (need>stock)break;//库存

                Double price = order.getMoney();
                Double money = user.getMoney();
                if (price>money)break;//余额

                user.setMoney(money-price);//余额-user
                order.setState(1);//订单+user
                Stock stock1 =order.getGood().getStock();
                stock1.setGcount(stock-need);//库存-stock
                stockService.updateStock(stock1);//更新
                userService.updateUser(user);//更新

                response.getWriter().write("1");
                return;
            }
        }
        response.getWriter().write("0");
    }

    @RequestMapping("/orders.setorders")
    private String  setorders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int gid =Integer.parseInt(request.getParameter("gid"));
        Good good = goodService.getGood(new Good(gid));
        request.setAttribute("good",good);
        return "user/setorders";
    }

    @RequestMapping("/orders.oneorder")
    private String  oneorder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  {
        HttpSession session =request.getSession();

        User user= (User) session.getAttribute("user");
        int gid =Integer.parseInt(request.getParameter("gid"));
        int udid =Integer.parseInt(request.getParameter("udid"));

        Good good = goodService.getGoodById(new Good(gid));
        Userdetail userDetail = userDetailService.getUserDetail(new Userdetail(udid));

        int gcount =Integer.parseInt(request.getParameter("gcount"));
        Orders orders =new Orders(good,gcount,user,userDetail);

        ordersService.addOrder(orders);
        user = userService.getUser(user);
        session.setAttribute("user",user);

        return "user/user";

    }

    @RequestMapping("/orders.bulkorders")
    private String  bulkorders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("user");
        String [] items0 =request.getParameterValues("items");
        String udid0 =request.getParameter("udid");

        int udid=Integer.parseInt(udid0);
        Set<Trolley> trolleys0 = user.getTrolleys();
        List<Trolley> trolleys = new ArrayList<>(trolleys0);
        Userdetail userdetail = userDetailService.getUserDetail(new Userdetail(udid));
        for (int i=0;i<items0.length;i++) {

            int tid = Integer.parseInt(items0[i]);

            for (int j=0;j<trolleys.size();j++) {
                Trolley trolley = trolleys.get(j);
                if (tid== trolley.getId())
                {
                    Orders orders=new Orders(trolley.getGood(), trolley.getGcount(),user,userdetail);
                    ordersService.addOrder(orders);//+
                    trolleys.remove(trolley);//-.1
                    trolleyService.deleteTrolley(trolley);
                    break;
                }
            }
        }
        user= userService.getUser(user);
        session.setAttribute("user",user);
        return "user/user";
    }

}
