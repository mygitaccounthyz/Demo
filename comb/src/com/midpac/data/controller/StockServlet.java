package com.midpac.data.controller;

import com.midpac.data.service.GoodService;
import com.midpac.data.service.StockRecordService;
import com.midpac.data.service.StockService;
import com.midpac.model.Good;
import com.midpac.model.Stock;
import com.midpac.model.StockRecord;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class StockServlet{
    @Resource
    private StockService stockService;
    @Resource
    private GoodService goodService;
    @Resource
    private StockRecordService stockRecordService;

    @RequestMapping("/stock")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String method = request.getParameter("method");

        if ("addgcount".equals(method)) {
            request.getRequestDispatcher("stock.addgcount").forward(request,response);
            return;
        }
    }


    @RequestMapping("/stock.addgcount")
    private String  addgcount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String gid =request.getParameter("gid");
        String in = request.getParameter("in");
        Good good = goodService.getGood(new Good(Integer.parseInt(gid)));
        Stock stock = good.getStock();
        Integer gcount =Integer.parseInt(in);
        stock.setGcount(stock.getGcount()+gcount);

        stockService.updateStock(stock);
        StockRecord stockRecord = new StockRecord(good,gcount);
        stockRecordService.addStockRecord(stockRecord);

        return "showGoods";
    }

}
