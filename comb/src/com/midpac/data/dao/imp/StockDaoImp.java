package com.midpac.data.dao.imp;

import com.midpac.data.dao.iTF.StockDao;
import com.midpac.model.Stock;
import org.hibernate.HibernateException;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class StockDaoImp implements StockDao {
    @Resource
    private  DaoImp<Stock> daoImp;

    @Resource
    private HibernateTemplate hibernateTemplate;

    @Override
    public boolean addStock(Stock stock) {
        return daoImp.addT(stock);
    }

    @Override
    public boolean deleteStock(Stock stock) {
        return daoImp.deleteT(stock);
    }

    @Override
    public boolean updateStock(Stock stock) {
        return daoImp.updateT(stock);
    }

    @Override
    public Stock getStock(Stock stock) {
        return daoImp.getT(Stock.class,stock.getId());
    }

    @Override
    public List getStocks() {
        try {
            String hql="from Stock";
           return hibernateTemplate.find(hql);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return new ArrayList();
    }

    @Override
    public Stock getStockByGid(int gid) {
        try {
            String hql="from Stock where gid=?";
            List list = hibernateTemplate.find(hql, gid);

            if (list==null||list.isEmpty())return null;
            else return (Stock) list.get(0);

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }
}
