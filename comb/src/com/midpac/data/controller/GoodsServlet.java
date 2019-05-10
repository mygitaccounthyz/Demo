package com.midpac.data.controller;

import com.midpac.data.service.GoodService;
import com.midpac.data.service.StockService;
import com.midpac.model.Good;
import com.midpac.model.Stock;
import com.midpac.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class GoodsServlet{//tp;   ps,cp//goods
    @Resource
    private GoodService goodService;
    @Resource
    private StockService stockService;

    @RequestMapping("/showGoods")
    protected String doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String method =request.getParameter("method");

        if (method==null||"getpage".equals(method)){
            return getPage(request,response);
        }
        if ("on".equals(method)){
            return on(request,response);
        }
        if ("off".equals(method)) {
            return off(request,response);
        }
        if ("add".equals(method)) {
            return add(request,response);
        }

        return "index";
    }

    private String add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String factory = request.getParameter("factory");
        String stock = request.getParameter("stock");

        Good good =new Good(name,Double.parseDouble(price),type,description,factory);
        Stock stock1 =new Stock(good,Integer.parseInt(stock));

        goodService.addGood(good);
        stockService.addStock(stock1);

        return "admin/admin";

    }

    private String off(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String gid = request.getParameter("gid");

        List<Good> goods = (List) request.getSession().getAttribute("goods");

        for (Good good : goods) {
            if (good.getId()==Integer.parseInt(gid)){
                good.setState(0);
                goodService.updateGood(good);
                break;
            }
        }
        return "admin/admin";
    }

    private String on(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String gid = request.getParameter("gid");

        List<Good> goods = (List) request.getSession().getAttribute("goods");

        for (Good good : goods) {
            if (good.getId()==Integer.parseInt(gid)){
                good.setState(1);
                goodService.updateGood(good);
                break;
            }
        }
        return "admin/admin";

    }

    private String getPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        int ps = 5;//ps
        int tp = 1;
        int cp = 1;

        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("user");

        List list = goodService.getAllGoods();
        if (!list.isEmpty()) tp = (list.size()+ps-1)/ps;
        session.setAttribute("tp",tp);//tp

        String cp0 = request.getParameter("cp");
        if (cp0!=null) cp = Integer.parseInt(cp0);//cp

        List goods = goodService.getPage(cp,ps);
        session.setAttribute("goods",goods);//goods
        if (user!=null&&user.getGrade()==1) return "admin/admin";
        else return "index";
    }

}
