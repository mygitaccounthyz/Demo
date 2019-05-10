package com.midpac.data.dao.imp;

import com.midpac.data.dao.iTF.StockRecordDao;
import com.midpac.model.StockRecord;
import org.hibernate.HibernateException;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class StockRecordDaoImp implements StockRecordDao {
    @Resource
    private DaoImp<StockRecord> daoImp;

    @Resource
    private HibernateTemplate hibernateTemplate;

    @Override
    public boolean addStockRecord(StockRecord record) {
        return daoImp.addT(record);
    }

    @Override
    public boolean deleteStockRecord(StockRecord record) {
        return daoImp.deleteT(record);
    }

    @Override
    public boolean updateStockRecord(StockRecord record) {
        return daoImp.updateT(record);
    }

    @Override
    public StockRecord getStockRecord(StockRecord record) {
        return daoImp.getT(StockRecord.class,record.getId());
    }

    @Override
    public List getStockRecords() {
        try {

            String hql="from StockRecord";
            return hibernateTemplate.find(hql);

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }
}
