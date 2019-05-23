package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Deal;

import java.util.List;

public interface DealDao {
    boolean addDeal(Deal deal);
    boolean deleteDeal(Deal deal);
    boolean updateDeal(Deal deal);
    Deal getDeal(Deal deal);
    List<Deal> getDeals(Deal deal);
}
