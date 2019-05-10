package com.midpac.data.dao.iTF;

import com.midpac.model.Good;

import java.util.List;

public interface GoodDao {
    boolean addGood(Good good);
    boolean deleteGood(Good good);
    boolean updateGood(Good good);
    Good getGood(Good good);
    List getGoodsByState(int state);
    List getAllGoods();
}
