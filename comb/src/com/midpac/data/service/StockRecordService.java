package com.midpac.data.service;


import com.midpac.data.dao.imp.StockRecordDaoImp;
import com.midpac.model.StockRecord;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StockRecordService {

    @Resource
    private StockRecordDaoImp stockRecordDaoImp;

    public boolean addStockRecord(StockRecord record){
        if (record==null)return false;
        return stockRecordDaoImp.addStockRecord(record);
    }
    public boolean deleteStockRecord(StockRecord record){
        if (record==null||record.getId()<1)return false;
        return stockRecordDaoImp.deleteStockRecord(record);
    }
    public boolean updateStockRecord(StockRecord record){
        if (record==null||record.getId()<1)return false;
        return stockRecordDaoImp.updateStockRecord(record);
    }
    public StockRecord getStockRecord(StockRecord record){
        if (record==null||record.getId()<1)return null;
        return stockRecordDaoImp.getStockRecord(record);
    }
    public List getStockRecords(){
        return stockRecordDaoImp.getStockRecords();
    }
}
