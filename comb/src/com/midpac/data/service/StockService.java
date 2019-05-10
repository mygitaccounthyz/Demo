package com.midpac.data.service;


import com.midpac.data.dao.imp.StockDaoImp;
import com.midpac.model.Stock;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class StockService {
    @Resource
    private  StockDaoImp stockDaoImp;

    public boolean addStock(Stock stock){
        if (stock==null)return false;
       return stockDaoImp.addStock(stock);
    }
    public boolean deleteStock(Stock stock){
        if (stock==null||stock.getId()<1)return false;
        return stockDaoImp.deleteStock(stock);
    }
    public boolean updateStock(Stock stock){
        if (stock==null||stock.getId()<1)return false;
        return stockDaoImp.updateStock(stock);
    }
    public Stock getStock(Stock stock){
        if (stock==null||stock.getId()<1)return null;
        return stockDaoImp.getStock(stock);
    }
    public List getStocks(){
        return stockDaoImp.getStocks();
    }

    Stock getStockByGid(int gid){
        if (gid<1)return null;
        return stockDaoImp.getStockByGid(gid);
    }
}
