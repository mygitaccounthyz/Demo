package com.midpac.data.dao.iTF;

import com.midpac.model.Stock;

import java.util.List;

public interface StockDao {
    boolean addStock(Stock stock);
    boolean deleteStock(Stock stock);
    boolean updateStock(Stock stock);
    Stock getStock(Stock stock);
    List getStocks();
    Stock getStockByGid(int gid);
}
