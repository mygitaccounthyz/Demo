package com.midpac.data.controller;


import com.midpac.data.service.StockRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class RecordServlet  {
    @Resource
    private StockRecordService stockRecordService;

    @RequestMapping("/records")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String method =request.getParameter("method");
        
        if ("show".equals(method)) {
            request.getRequestDispatcher("records.show").forward(request,response);
            return;
        }
    }
    
    
    @RequestMapping("/records.show")
    private String  show(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List stockRecords = stockRecordService.getStockRecords();
        request.setAttribute("records",stockRecords);
        
        return "admin/stockrecords";

    }
    
}
