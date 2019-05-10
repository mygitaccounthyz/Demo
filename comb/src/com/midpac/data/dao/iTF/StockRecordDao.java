package com.midpac.data.dao.iTF;

import com.midpac.model.StockRecord;

import java.util.List;

public interface StockRecordDao {
    boolean addStockRecord(StockRecord record);
    boolean deleteStockRecord(StockRecord record);
    boolean updateStockRecord(StockRecord record);
    StockRecord getStockRecord(StockRecord record);
    List getStockRecords();
}
